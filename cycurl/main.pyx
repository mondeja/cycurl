from urllib.error import HTTPError

from libc.stddef cimport size_t
from libc.string cimport memcpy
from cpython.mem cimport (
    PyMem_Malloc,
    PyMem_Realloc,
    PyMem_Free,
)
from main cimport *

# https://curl.haxx.se/libcurl/c/getinmemory.html
cdef struct MemoryStruct:
    char *memory
    size_t size

cdef size_t write_memory(void *contents, size_t size,
                         size_t nmemb, void *userp):
    cdef size_t realsize = size * nmemb
    cdef MemoryStruct *mem = <MemoryStruct *>userp
    mem.memory = <char *>PyMem_Realloc(
        mem.memory, mem.size + realsize + 1
    )
    if mem.memory == NULL:
        print("Not enough memory (realloc returned NULL)\n")
        return 0
    memcpy(&(mem.memory[mem.size]), contents, realsize)
    mem.size += realsize
    mem.memory[mem.size] = 0
    return realsize

cdef class Response(object):
    cdef readonly long status_code
    cdef readonly bytes text
    cdef readonly bytes url

    def __cinit__(self, text):
        self.text = text

cpdef Response get(const char *url,
                   long timeout,
                   bint debug):
    return get_to_memory(url, timeout, debug, b"")

cpdef Response get_to_memory(const char *url,
                             long timeout,
                             bint debug,
                             const char *proxy_addr):
    """Send a get request using a buffer stored in memory.

    :param *url: A memory address for an URL to send the http request.
    :type *url: char

    :param timeout: Number of seconds until request expiration.
    :type timeout: long

    :param debug: Flag to activate/desactivate body response printing.
        Util for development.
    :type debug: bint

    :param *proxy_addr: Proxy address, if needed.
    :type *proxy_addr: char

    :returns: An object with corresponding properties of
        an HTTP response.
    :rtype: cycurl.main.Response
    """
    cdef CURLcode ret
    cdef long true = 1L
    version = curl_version()
    cdef CURL *curl = curl_easy_init()
    cdef const char *user_agent = "cycurl v1.0.0"
    cdef const char *accept_encoding = "gzip, deflate"
    cdef char *raw_body

    cdef MemoryStruct chunk
    chunk.memory = <char *>PyMem_Malloc(1)
    chunk.size = 0

    if curl != NULL:
        if debug:
            curl_easy_setopt(curl, CURLOPT_VERBOSE,
                             &true)
        curl_easy_setopt(curl, CURLOPT_FOLLOWLOCATION,
                         &true)
        ret = curl_easy_setopt(curl, CURLOPT_URL, url)
        ret = curl_easy_setopt(curl, CURLOPT_TIMEOUT,
                               <void *>timeout)

        if proxy_addr != b"":
            ret = curl_easy_setopt(curl, CURLOPT_PROXY,
                                   proxy_addr);

        ret = curl_easy_setopt(curl, CURLOPT_HTTPGET,
                               &true)

        ret = curl_easy_setopt(curl, CURLOPT_USERAGENT,
                               user_agent)
        ret = curl_easy_setopt(curl, CURLOPT_ACCEPT_ENCODING,
                               accept_encoding)

        curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION,
                         &write_memory)
        curl_easy_setopt(curl, CURLOPT_WRITEDATA,
                         <void *>&chunk)

        if ret != CURLE_OK:
            raise RuntimeError
        ret = curl_easy_perform(curl)
        if ret != CURLE_OK:
            raise HTTPError

        resp = Response(chunk.memory)
        curl_easy_getinfo(curl, CURLINFO_RESPONSE_CODE,
                          &resp.status_code)
        curl_easy_cleanup(curl)

        PyMem_Free(chunk.memory)

        return resp
