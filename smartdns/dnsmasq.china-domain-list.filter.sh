#!/bin/sh

DOMAINS_LIST_URL="https://fastly.jsdelivr.net/gh/imyip/dnsmasq-china-list-for-smartdns@main/accelerated-domains.china.domain.smartdns.conf"

DOMAINS_LIST_FILE="accelerated-domains.china.domain.smartdns.conf"

OUTPUT_FILE="smartdns.list.out.conf"

# download the list
curl -fkLo "${DOMAINS_LIST_FILE}" "${DOMAINS_LIST_URL}"

# filter length in 3 to 8 words and '.com' domain
rg -Ne 'domain-rules /\S{3,11}\.com' "${DOMAINS_LIST_FILE}" |\
    # strip the domains which is:
    # 1. begining with number
    # 2. including '-'
    # 3. begining 1 to 5 words and the rest is number
    # 4. begining a word then a number and the rest are words
    rg -Nv 'domain-rules /(\d\S*|[^-]*-\S*|\w{1,5}\d*|\w\d\w*)\.com' |\
    # rg -Nv 'domain-rules /(\d\S*|[^-]*-\S*|\w*\d\S*|zz\w*)\.com' |\
	   awk '{print $1,$2,"-nameserver china"}' > "${OUTPUT_FILE}"
