cdef extern from "curl/curl.h" nogil:
    ctypedef int CURLcode
    ctypedef void CURL
    ctypedef int CURLoption
    ctypedef int CURLINFO

    # {{{ CURLoption
    enum: CURLOPT_WRITEDATA
    enum: CURLOPT_URL
    enum: CURLOPT_PORT
    enum: CURLOPT_PROXY
    enum: CURLOPT_USERPWD
    enum: CURLOPT_PROXYUSERPWD
    enum: CURLOPT_RANGE
    enum: CURLOPT_READDATA
    enum: CURLOPT_ERRORBUFFER
    enum: CURLOPT_WRITEFUNCTION
    enum: CURLOPT_READFUNCTION
    enum: CURLOPT_TIMEOUT
    enum: CURLOPT_INFILESIZE
    enum: CURLOPT_POSTFIELDS
    enum: CURLOPT_REFERER
    enum: CURLOPT_FTPPORT
    enum: CURLOPT_USERAGENT
    enum: CURLOPT_LOW_SPEED_LIMIT
    enum: CURLOPT_LOW_SPEED_TIME
    enum: CURLOPT_RESUME_FROM
    enum: CURLOPT_COOKIE
    enum: CURLOPT_HTTPHEADER
    enum: CURLOPT_HTTPPOST
    enum: CURLOPT_SSLCERT
    enum: CURLOPT_KEYPASSWD
    enum: CURLOPT_CRLF
    enum: CURLOPT_QUOTE
    enum: CURLOPT_HEADERDATA
    enum: CURLOPT_COOKIEFILE
    enum: CURLOPT_SSLVERSION
    enum: CURLOPT_TIMECONDITION
    enum: CURLOPT_TIMEVALUE
    enum: CURLOPT_CUSTOMREQUEST
    enum: CURLOPT_STDERR
    enum: CURLOPT_POSTQUOTE
    enum: CURLOPT_OBSOLETE40
    enum: CURLOPT_VERBOSE
    enum: CURLOPT_HEADER
    enum: CURLOPT_NOPROGRESS
    enum: CURLOPT_NOBODY
    enum: CURLOPT_FAILONERROR
    enum: CURLOPT_UPLOAD
    enum: CURLOPT_POST
    enum: CURLOPT_DIRLISTONLY
    enum: CURLOPT_APPEND
    enum: CURLOPT_NETRC
    enum: CURLOPT_FOLLOWLOCATION
    enum: CURLOPT_TRANSFERTEXT
    enum: CURLOPT_PUT
    enum: CURLOPT_PROGRESSFUNCTION
    enum: CURLOPT_PROGRESSDATA
    enum: CURLOPT_AUTOREFERER
    enum: CURLOPT_PROXYPORT
    enum: CURLOPT_POSTFIELDSIZE
    enum: CURLOPT_HTTPPROXYTUNNEL
    enum: CURLOPT_INTERFACE
    enum: CURLOPT_KRBLEVEL
    enum: CURLOPT_SSL_VERIFYPEER
    enum: CURLOPT_CAINFO
    enum: CURLOPT_MAXREDIRS
    enum: CURLOPT_FILETIME
    enum: CURLOPT_TELNETOPTIONS
    enum: CURLOPT_MAXCONNECTS
    enum: CURLOPT_OBSOLETE72
    enum: CURLOPT_FRESH_CONNECT
    enum: CURLOPT_FORBID_REUSE
    enum: CURLOPT_RANDOM_FILE
    enum: CURLOPT_EGDSOCKET
    enum: CURLOPT_CONNECTTIMEOUT
    enum: CURLOPT_HEADERFUNCTION
    enum: CURLOPT_HTTPGET
    enum: CURLOPT_SSL_VERIFYHOST
    enum: CURLOPT_COOKIEJAR
    enum: CURLOPT_SSL_CIPHER_LIST
    enum: CURLOPT_HTTP_VERSION
    enum: CURLOPT_FTP_USE_EPSV
    enum: CURLOPT_SSLCERTTYPE
    enum: CURLOPT_SSLKEY
    enum: CURLOPT_SSLKEYTYPE
    enum: CURLOPT_SSLENGINE
    enum: CURLOPT_SSLENGINE_DEFAULT
    enum: CURLOPT_DNS_USE_GLOBAL_CACHE
    enum: CURLOPT_DNS_CACHE_TIMEOUT
    enum: CURLOPT_PREQUOTE
    enum: CURLOPT_DEBUGFUNCTION
    enum: CURLOPT_DEBUGDATA
    enum: CURLOPT_COOKIESESSION
    enum: CURLOPT_CAPATH
    enum: CURLOPT_BUFFERSIZE
    enum: CURLOPT_NOSIGNAL
    enum: CURLOPT_SHARE
    enum: CURLOPT_PROXYTYPE
    enum: CURLOPT_ACCEPT_ENCODING
    enum: CURLOPT_PRIVATE
    enum: CURLOPT_HTTP200ALIASES
    enum: CURLOPT_UNRESTRICTED_AUTH
    enum: CURLOPT_FTP_USE_EPRT
    enum: CURLOPT_HTTPAUTH
    enum: CURLOPT_SSL_CTX_FUNCTION
    enum: CURLOPT_SSL_CTX_DATA
    enum: CURLOPT_FTP_CREATE_MISSING_DIRS
    enum: CURLOPT_PROXYAUTH
    enum: CURLOPT_FTP_RESPONSE_TIMEOUT
    enum: CURLOPT_IPRESOLVE
    enum: CURLOPT_MAXFILESIZE
    enum: CURLOPT_INFILESIZE_LARGE
    enum: CURLOPT_RESUME_FROM_LARGE
    enum: CURLOPT_MAXFILESIZE_LARGE
    enum: CURLOPT_NETRC_FILE
    enum: CURLOPT_USE_SSL
    enum: CURLOPT_POSTFIELDSIZE_LARGE
    enum: CURLOPT_TCP_NODELAY
    enum: CURLOPT_FTPSSLAUTH
    enum: CURLOPT_IOCTLFUNCTION
    enum: CURLOPT_IOCTLDATA
    enum: CURLOPT_FTP_ACCOUNT
    enum: CURLOPT_COOKIELIST
    enum: CURLOPT_IGNORE_CONTENT_LENGTH
    enum: CURLOPT_FTP_SKIP_PASV_IP
    enum: CURLOPT_FTP_FILEMETHOD
    enum: CURLOPT_LOCALPORT
    enum: CURLOPT_LOCALPORTRANGE
    enum: CURLOPT_CONNECT_ONLY
    enum: CURLOPT_CONV_FROM_NETWORK_FUNCTION
    enum: CURLOPT_CONV_TO_NETWORK_FUNCTION
    enum: CURLOPT_CONV_FROM_UTF8_FUNCTION
    enum: CURLOPT_MAX_SEND_SPEED_LARGE
    enum: CURLOPT_MAX_RECV_SPEED_LARGE
    enum: CURLOPT_FTP_ALTERNATIVE_TO_USER
    enum: CURLOPT_SOCKOPTFUNCTION
    enum: CURLOPT_SOCKOPTDATA
    enum: CURLOPT_SSL_SESSIONID_CACHE
    enum: CURLOPT_SSH_AUTH_TYPES
    enum: CURLOPT_SSH_PUBLIC_KEYFILE
    enum: CURLOPT_SSH_PRIVATE_KEYFILE
    enum: CURLOPT_FTP_SSL_CCC
    enum: CURLOPT_TIMEOUT_MS
    enum: CURLOPT_CONNECTTIMEOUT_MS
    enum: CURLOPT_HTTP_TRANSFER_DECODING
    enum: CURLOPT_HTTP_CONTENT_DECODING
    enum: CURLOPT_NEW_FILE_PERMS
    enum: CURLOPT_NEW_DIRECTORY_PERMS
    enum: CURLOPT_POSTREDIR
    enum: CURLOPT_SSH_HOST_PUBLIC_KEY_MD5
    enum: CURLOPT_OPENSOCKETFUNCTION
    enum: CURLOPT_OPENSOCKETDATA
    enum: CURLOPT_COPYPOSTFIELDS
    enum: CURLOPT_PROXY_TRANSFER_MODE
    enum: CURLOPT_SEEKFUNCTION
    enum: CURLOPT_SEEKDATA
    enum: CURLOPT_CRLFILE
    enum: CURLOPT_ISSUERCERT
    enum: CURLOPT_ADDRESS_SCOPE
    enum: CURLOPT_CERTINFO
    enum: CURLOPT_USERNAME
    enum: CURLOPT_PASSWORD
    enum: CURLOPT_PROXYUSERNAME
    enum: CURLOPT_PROXYPASSWORD
    enum: CURLOPT_NOPROXY
    enum: CURLOPT_TFTP_BLKSIZE
    enum: CURLOPT_SOCKS5_GSSAPI_SERVICE
    enum: CURLOPT_SOCKS5_GSSAPI_NEC
    enum: CURLOPT_PROTOCOLS
    enum: CURLOPT_REDIR_PROTOCOLS
    enum: CURLOPT_SSH_KNOWNHOSTS
    enum: CURLOPT_SSH_KEYFUNCTION
    enum: CURLOPT_SSH_KEYDATA
    enum: CURLOPT_MAIL_FROM
    enum: CURLOPT_MAIL_RCPT
    enum: CURLOPT_FTP_USE_PRET
    enum: CURLOPT_RTSP_REQUEST
    enum: CURLOPT_RTSP_SESSION_ID
    enum: CURLOPT_RTSP_STREAM_URI
    enum: CURLOPT_RTSP_TRANSPORT
    enum: CURLOPT_RTSP_CLIENT_CSEQ
    enum: CURLOPT_RTSP_SERVER_CSEQ
    enum: CURLOPT_INTERLEAVEDATA
    enum: CURLOPT_INTERLEAVEFUNCTION
    enum: CURLOPT_WILDCARDMATCH
    enum: CURLOPT_CHUNK_BGN_FUNCTION
    enum: CURLOPT_CHUNK_END_FUNCTION
    enum: CURLOPT_FNMATCH_FUNCTION
    enum: CURLOPT_CHUNK_DATA
    enum: CURLOPT_FNMATCH_DATA
    enum: CURLOPT_RESOLVE
    enum: CURLOPT_TLSAUTH_USERNAME
    enum: CURLOPT_TLSAUTH_PASSWORD
    enum: CURLOPT_TLSAUTH_TYPE
    enum: CURLOPT_TRANSFER_ENCODING
    enum: CURLOPT_CLOSESOCKETFUNCTION
    enum: CURLOPT_CLOSESOCKETDATA
    enum: CURLOPT_GSSAPI_DELEGATION
    enum: CURLOPT_DNS_SERVERS
    enum: CURLOPT_ACCEPTTIMEOUT_MS
    enum: CURLOPT_TCP_KEEPALIVE
    enum: CURLOPT_TCP_KEEPIDLE
    enum: CURLOPT_TCP_KEEPINTVL
    enum: CURLOPT_SSL_OPTIONS
    enum: CURLOPT_MAIL_AUTH
    enum: CURLOPT_SASL_IR
    enum: CURLOPT_XFERINFOFUNCTION
    enum: CURLOPT_XOAUTH2_BEARER
    enum: CURLOPT_DNS_INTERFACE
    enum: CURLOPT_DNS_LOCAL_IP4
    enum: CURLOPT_DNS_LOCAL_IP6
    enum: CURLOPT_LOGIN_OPTIONS
    enum: CURLOPT_SSL_ENABLE_NPN
    enum: CURLOPT_SSL_ENABLE_ALPN
    enum: CURLOPT_EXPECT_100_TIMEOUT_MS
    enum: CURLOPT_PROXYHEADER
    enum: CURLOPT_HEADEROPT
    # }}}

    # {{{ CURLcode
    enum: CURLE_OK
    enum: CURLE_UNSUPPORTED_PROTOCOL
    enum: CURLE_FAILED_INIT
    enum: CURLE_URL_MALFORMAT
    enum: CURLE_NOT_BUILT_IN
    enum: CURLE_COULDNT_RESOLVE_PROXY
    enum: CURLE_COULDNT_RESOLVE_HOST
    enum: CURLE_COULDNT_CONNECT
    enum: CURLE_FTP_WEIRD_SERVER_REPLY
    enum: CURLE_REMOTE_ACCESS_DENIED
    enum: CURLE_FTP_ACCEPT_FAILED
    enum: CURLE_FTP_WEIRD_PASS_REPLY
    enum: CURLE_FTP_ACCEPT_TIMEOUT
    enum: CURLE_FTP_WEIRD_PASV_REPLY
    enum: CURLE_FTP_WEIRD_227_FORMAT
    enum: CURLE_FTP_CANT_GET_HOST
    enum: CURLE_HTTP2
    enum: CURLE_FTP_COULDNT_SET_TYPE
    enum: CURLE_PARTIAL_FILE
    enum: CURLE_FTP_COULDNT_RETR_FILE
    enum: CURLE_OBSOLETE20
    enum: CURLE_QUOTE_ERROR
    enum: CURLE_HTTP_RETURNED_ERROR
    enum: CURLE_WRITE_ERROR
    enum: CURLE_OBSOLETE24
    enum: CURLE_UPLOAD_FAILED
    enum: CURLE_READ_ERROR
    enum: CURLE_OUT_OF_MEMORY
    enum: CURLE_OPERATION_TIMEDOUT
    enum: CURLE_OBSOLETE29
    enum: CURLE_FTP_PORT_FAILED
    enum: CURLE_FTP_COULDNT_USE_REST
    enum: CURLE_OBSOLETE32
    enum: CURLE_RANGE_ERROR
    enum: CURLE_HTTP_POST_ERROR
    enum: CURLE_SSL_CONNECT_ERROR
    enum: CURLE_BAD_DOWNLOAD_RESUME
    enum: CURLE_FILE_COULDNT_READ_FILE
    enum: CURLE_LDAP_CANNOT_BIND
    enum: CURLE_LDAP_SEARCH_FAILED
    enum: CURLE_OBSOLETE40
    enum: CURLE_FUNCTION_NOT_FOUND
    enum: CURLE_ABORTED_BY_CALLBACK
    enum: CURLE_BAD_FUNCTION_ARGUMENT
    enum: CURLE_OBSOLETE44
    enum: CURLE_INTERFACE_FAILED
    enum: CURLE_OBSOLETE46
    enum: CURLE_TOO_MANY_REDIRECTS
    enum: CURLE_UNKNOWN_OPTION
    enum: CURLE_TELNET_OPTION_SYNTAX
    enum: CURLE_OBSOLETE50
    enum: CURLE_PEER_FAILED_VERIFICATION
    enum: CURLE_GOT_NOTHING
    enum: CURLE_SSL_ENGINE_NOTFOUND
    enum: CURLE_SSL_ENGINE_SETFAILED
    enum: CURLE_SEND_ERROR
    enum: CURLE_RECV_ERROR
    enum: CURLE_OBSOLETE57
    enum: CURLE_SSL_CERTPROBLEM
    enum: CURLE_SSL_CIPHER
    enum: CURLE_SSL_CACERT
    enum: CURLE_BAD_CONTENT_ENCODING
    enum: CURLE_LDAP_INVALID_URL
    enum: CURLE_FILESIZE_EXCEEDED
    enum: CURLE_USE_SSL_FAILED
    enum: CURLE_SEND_FAIL_REWIND
    enum: CURLE_SSL_ENGINE_INITFAILED
    enum: CURLE_LOGIN_DENIED
    enum: CURLE_TFTP_NOTFOUND
    enum: CURLE_TFTP_PERM
    enum: CURLE_REMOTE_DISK_FULL
    enum: CURLE_TFTP_ILLEGAL
    enum: CURLE_TFTP_UNKNOWNID
    enum: CURLE_REMOTE_FILE_EXISTS
    enum: CURLE_TFTP_NOSUCHUSER
    enum: CURLE_CONV_FAILED
    enum: CURLE_CONV_REQD
    enum: CURLE_SSL_CACERT_BADFILE
    enum: CURLE_REMOTE_FILE_NOT_FOUND
    enum: CURLE_SSH
    enum: CURLE_SSL_SHUTDOWN_FAILED
    enum: CURLE_AGAIN
    enum: CURLE_SSL_CRL_BADFILE
    enum: CURLE_SSL_ISSUER_ERROR
    enum: CURLE_FTP_PRET_FAILED
    enum: CURLE_RTSP_CSEQ_ERROR
    enum: CURLE_RTSP_SESSION_ERROR
    enum: CURLE_FTP_BAD_FILE_LIST
    enum: CURLE_CHUNK_FAILED
    enum: CURLE_NO_CONNECTION_AVAILABLE
    enum: CURL_LAST
    # }}}

    # {{{ CURLINFO
    enum: CURLINFO_NONE
    enum: CURLINFO_EFFECTIVE_URL
    enum: CURLINFO_RESPONSE_CODE
    enum: CURLINFO_TOTAL_TIME
    enum: CURLINFO_NAMELOOKUP_TIME
    enum: CURLINFO_CONNECT_TIME
    enum: CURLINFO_PRETRANSFER_TIME
    enum: CURLINFO_SIZE_UPLOAD
    enum: CURLINFO_SIZE_DOWNLOAD
    enum: CURLINFO_SPEED_DOWNLOAD
    enum: CURLINFO_SPEED_UPLOAD
    enum: CURLINFO_HEADER_SIZE
    enum: CURLINFO_REQUEST_SIZE
    enum: CURLINFO_SSL_VERIFYRESULT
    enum: CURLINFO_FILETIME
    enum: CURLINFO_CONTENT_LENGTH_DOWNLOAD
    enum: CURLINFO_CONTENT_LENGTH_UPLOAD
    enum: CURLINFO_STARTTRANSFER_TIME
    enum: CURLINFO_CONTENT_TYPE
    enum: CURLINFO_REDIRECT_TIME
    enum: CURLINFO_REDIRECT_COUNT
    enum: CURLINFO_PRIVATE
    enum: CURLINFO_HTTP_CONNECTCODE
    enum: CURLINFO_HTTPAUTH_AVAIL
    enum: CURLINFO_PROXYAUTH_AVAIL
    enum: CURLINFO_OS_ERRNO
    enum: CURLINFO_NUM_CONNECTS
    enum: CURLINFO_SSL_ENGINES
    enum: CURLINFO_COOKIELIST
    enum: CURLINFO_LASTSOCKET
    enum: CURLINFO_FTP_ENTRY_PATH
    enum: CURLINFO_REDIRECT_URL
    enum: CURLINFO_PRIMARY_IP
    enum: CURLINFO_APPCONNECT_TIME
    enum: CURLINFO_CERTINFO
    enum: CURLINFO_CONDITION_UNMET
    enum: CURLINFO_RTSP_SESSION_ID
    enum: CURLINFO_RTSP_CLIENT_CSEQ
    enum: CURLINFO_RTSP_SERVER_CSEQ
    enum: CURLINFO_RTSP_CSEQ_RECV
    enum: CURLINFO_PRIMARY_PORT
    enum: CURLINFO_LOCAL_IP
    enum: CURLINFO_LOCAL_PORT
    enum: CURLINFO_TLS_SESSION
    enum: CURLINFO_LASTONE
    # }}}

    char *curl_version()
    CURL *curl_easy_init()
    CURLcode curl_easy_perform(CURL * easy_handle )
    void curl_easy_cleanup(CURL * handle )
    CURLcode curl_easy_setopt(CURL *handle, CURLoption option, void *parameter)
    const char *curl_easy_strerror(CURLcode errornum)
    CURLcode curl_easy_getinfo(CURL *curl, CURLINFO info, ... )