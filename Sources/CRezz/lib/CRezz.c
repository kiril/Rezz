
#include<sys/socket.h>
#include<errno.h> //For errno - the error number
#include<netdb.h> //hostent
#include<arpa/inet.h>
#include<string.h> //memset

#include "CRezz.h"

void hostname_to_ip(const char *hostname, char *ip) {
    struct hostent *entity;
    struct in_addr **address_list;
    int i;

    if ( (entity = gethostbyname(hostname)) == NULL) {
        herror("gethostbyname");
        return;
    }

    address_list = (struct in_addr **) entity->h_addr_list;

    for (i = 0; address_list[i] != NULL; i++) {
        //Return the first one;
        strcpy(ip , inet_ntoa(*address_list[i]));
        return;
    }
}
