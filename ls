[
    {
        "remarks": "PQ48",
        "version": {
            "min": "26.2.6"
        },
        "log": {
            "loglevel": "warning"
        },
        "dns": {
            "servers": [
                {
                    "address": "fakedns",
                    "domains": [
                        "full:engage.cloudflareclient.com"
                    ],
                    "skipFallback": false
                },
                {
                    "address": "1.1.1.1",
                    "tag": "remote-dns"
                },
                {
                    "address": "8.8.8.8",
                    "domains": [
                        "full:engage.cloudflareclient.com"
                    ],
                    "skipFallback": true
                }
            ],
            "queryStrategy": "UseIPv4",
            "tag": "dns"
        },
        "inbounds": [
            {
                "listen": "0.0.0.0",
                "port": 10808,
                "protocol": "mixed",
                "settings": {
                    "auth": "noauth",
                    "udp": true
                },
                "sniffing": {
                    "destOverride": [
                        "http",
                        "tls",
                        "fakedns"
                    ],
                    "enabled": true,
                    "routeOnly": true
                },
                "tag": "mixed-in"
            },
            {
                "listen": "0.0.0.0",
                "port": 10853,
                "protocol": "dokodemo-door",
                "settings": {
                    "address": "1.1.1.1",
                    "network": "tcp,udp",
                    "port": 53
                },
                "tag": "dns-in"
            }
        ],
        "outbounds": [
            {
                "protocol": "wireguard",
                "settings": {
                    "address": [
                        "172.16.0.2/32",
                        "2606:4700:110:813a:86a0:7b33:c6f:68c1/128"
                    ],
                    "mtu": 1280,
                    "peers": [
                        {
                            "endpoint": "188.114.99.0:1074",
                            "publicKey": "bmXOC+F1FxEMF9dyiK2H5/1SUtzH0JuVo51h2wPfgyo=",
                            "keepAlive": 5
                        }
                    ],
                    "reserved": [
                        142,
                        150,
                        139
                    ],
                    "secretKey": "/3Zg4Ai8OlW2fYALLGl0DxhuZbmmL9AhwFHGP9UEjrk=",
                    "wnoise": "quic",
                    "wnoisecount": "10-15",
                    "wpayloadsize": "5-10",
                    "wnoisedelay": "1"
                },
                "tag": "proxy"
            },
            {
                "protocol": "dns",
                "settings": {
                    "rules": [
                        {
                            "action": "hijack"
                        }
                    ]
                },
                "tag": "dns-out"
            },
            {
                "protocol": "freedom",
                "settings": {
                    "domainStrategy": "UseIP"
                },
                "tag": "direct"
            },
            {
                "protocol": "blackhole",
                "settings": {
                    "response": {
                        "type": "http"
                    }
                },
                "tag": "block"
            }
        ],
        "routing": {
            "domainStrategy": "IPIfNonMatch",
            "rules": [
                {
                    "inboundTag": [
                        "mixed-in"
                    ],
                    "port": 53,
                    "outboundTag": "dns-out",
                    "type": "field"
                },
                {
                    "inboundTag": [
                        "dns-in"
                    ],
                    "outboundTag": "dns-out",
                    "type": "field"
                },
                {
                    "inboundTag": [
                        "remote-dns"
                    ],
                    "outboundTag": "proxy",
                    "type": "field"
                },
                {
                    "inboundTag": [
                        "dns"
                    ],
                    "outboundTag": "direct",
                    "type": "field"
                },
                {
                    "domain": [
                        "geosite:private"
                    ],
                    "outboundTag": "direct",
                    "type": "field"
                },
                {
                    "ip": [
                        "geoip:private"
                    ],
                    "outboundTag": "direct",
                    "type": "field"
                },
                {
                    "network": "tcp,udp",
                    "outboundTag": "proxy",
                    "type": "field"
                }
            ]
        },
        "policy": {
            "levels": {
                "0": {
                    "connIdle": 300,
                    "handshake": 4,
                    "uplinkOnly": 1,
                    "downlinkOnly": 1
                }
            },
            "system": {
                "statsOutboundUplink": true,
                "statsOutboundDownlink": true
            }
        },
        "stats": {}
    },
	{
        "remarks": "PQ48",
        "version": {
            "min": "26.2.6"
        },
        "log": {
            "loglevel": "warning"
        },
        "dns": {
            "servers": [
                "fakedns",
                {
                    "address": "1.1.1.1",
                    "tag": "remote-dns"
                }
            ],
            "queryStrategy": "UseIPv4",
            "tag": "dns"
        },
        "inbounds": [
            {
                "listen": "0.0.0.0",
                "port": 10808,
                "protocol": "mixed",
                "settings": {
                    "auth": "noauth",
                    "udp": true
                },
                "sniffing": {
                    "destOverride": [
                        "http",
                        "tls",
                        "fakedns"
                    ],
                    "enabled": true,
                    "routeOnly": true
                },
                "tag": "mixed-in"
            },
            {
                "listen": "0.0.0.0",
                "port": 10853,
                "protocol": "dokodemo-door",
                "settings": {
                    "address": "1.1.1.1",
                    "network": "tcp,udp",
                    "port": 53
                },
                "tag": "dns-in"
            }
        ],
        "outbounds": [
            {
                "protocol": "wireguard",
                "settings": {
                    "address": [
                        "172.16.0.2/32",
                        "2606:4700:110:813a:86a0:7b33:c6f:68c1/128"
                    ],
                    "mtu": 1280,
                    "peers": [
                        {
                            "endpoint": "8.34.146.78:1387",
                            "publicKey": "bmXOC+F1FxEMF9dyiK2H5/1SUtzH0JuVo51h2wPfgyo=",
                            "keepAlive": 5
                        }
                    ],
                    "reserved": [
                        142,
                        150,
                        139
                    ],
                    "secretKey": "/3Zg4Ai8OlW2fYALLGl0DxhuZbmmL9AhwFHGP9UEjrk=",
                    "wnoise": "quic",
                    "wnoisecount": "10-15",
                    "wpayloadsize": "5-10",
                    "wnoisedelay": "1"
                },
                "tag": "proxy"
            },
            {
                "protocol": "dns",
                "settings": {
                    "rules": [
                        {
                            "action": "hijack"
                        }
                    ]
                },
                "tag": "dns-out"
            },
            {
                "protocol": "freedom",
                "settings": {
                    "domainStrategy": "UseIP"
                },
                "tag": "direct"
            },
            {
                "protocol": "blackhole",
                "settings": {
                    "response": {
                        "type": "http"
                    }
                },
                "tag": "block"
            }
        ],
        "routing": {
            "domainStrategy": "IPIfNonMatch",
            "rules": [
                {
                    "inboundTag": [
                        "mixed-in"
                    ],
                    "port": 53,
                    "outboundTag": "dns-out",
                    "type": "field"
                },
                {
                    "inboundTag": [
                        "dns-in"
                    ],
                    "outboundTag": "dns-out",
                    "type": "field"
                },
                {
                    "inboundTag": [
                        "remote-dns"
                    ],
                    "outboundTag": "proxy",
                    "type": "field"
                },
                {
                    "inboundTag": [
                        "dns"
                    ],
                    "outboundTag": "direct",
                    "type": "field"
                },
                {
                    "domain": [
                        "geosite:private"
                    ],
                    "outboundTag": "direct",
                    "type": "field"
                },
                {
                    "ip": [
                        "geoip:private"
                    ],
                    "outboundTag": "direct",
                    "type": "field"
                },
                {
                    "network": "tcp,udp",
                    "outboundTag": "proxy",
                    "type": "field"
                }
            ]
        },
        "policy": {
            "levels": {
                "0": {
                    "connIdle": 300,
                    "handshake": 4,
                    "uplinkOnly": 1,
                    "downlinkOnly": 1
                }
            },
            "system": {
                "statsOutboundUplink": true,
                "statsOutboundDownlink": true
            }
        },
        "stats": {}
    },
	{
        "remarks": "PQ58",
        "version": {
            "min": "26.2.6"
        },
        "log": {
            "loglevel": "warning"
        },
        "dns": {
            "servers": [
                "fakedns",
                {
                    "address": "1.1.1.1",
                    "tag": "remote-dns"
                }
            ],
            "queryStrategy": "UseIPv4",
            "tag": "dns"
        },
        "inbounds": [
            {
                "listen": "0.0.0.0",
                "port": 10808,
                "protocol": "mixed",
                "settings": {
                    "auth": "noauth",
                    "udp": true
                },
                "sniffing": {
                    "destOverride": [
                        "http",
                        "tls",
                        "fakedns"
                    ],
                    "enabled": true,
                    "routeOnly": true
                },
                "tag": "mixed-in"
            },
            {
                "listen": "0.0.0.0",
                "port": 10853,
                "protocol": "dokodemo-door",
                "settings": {
                    "address": "1.1.1.1",
                    "network": "tcp,udp",
                    "port": 53
                },
                "tag": "dns-in"
            }
        ],
        "outbounds": [
            {
                "protocol": "wireguard",
                "settings": {
                    "address": [
                        "172.16.0.2/32",
                        "2606:4700:110:837b:ea14:8e23:cd36:5530/128"
                    ],
                    "mtu": 1280,
                    "peers": [
                        {
                            "endpoint": "162.159.192.168:1843",
                            "publicKey": "bmXOC+F1FxEMF9dyiK2H5/1SUtzH0JuVo51h2wPfgyo=",
                            "keepAlive": 5
                        }
                    ],
                    "reserved": [
                        243,
                        33,
                        224
                    ],
                    "secretKey": "r7orEMsyQwo+Jkwbv0Y9gLSmiXy5HC84eYbt3PystYs="
                },
                "streamSettings": {
                    "finalmask": {
                        "udp": [
                            {
                                "type": "noise",
                                "settings": {
                                    "reset": "30-60",
                                    "noise": [
                                        {
                                            "rand": "50-100",
                                            "randRange": "0-255",
                                            "delay": "1-5"
                                        },
                                        {
                                            "rand": "50-100",
                                            "randRange": "0-255",
                                            "delay": "1-5"
                                        },
                                        {
                                            "rand": "50-100",
                                            "randRange": "0-255",
                                            "delay": "1-5"
                                        },
                                        {
                                            "rand": "50-100",
                                            "randRange": "0-255",
                                            "delay": "1-5"
                                        },
                                        {
                                            "rand": "50-100",
                                            "randRange": "0-255",
                                            "delay": "1-5"
                                        }
                                    ]
                                }
                            }
                        ]
                    }
                },
                "tag": "proxy"
            },
            {
                "protocol": "dns",
                "settings": {
                    "rules": [
                        {
                            "action": "hijack"
                        }
                    ]
                },
                "tag": "dns-out"
            },
            {
                "protocol": "freedom",
                "settings": {
                    "domainStrategy": "UseIP"
                },
                "tag": "direct"
            },
            {
                "protocol": "blackhole",
                "settings": {
                    "response": {
                        "type": "http"
                    }
                },
                "tag": "block"
            }
        ],
        "routing": {
            "domainStrategy": "IPIfNonMatch",
            "rules": [
                {
                    "inboundTag": [
                        "mixed-in"
                    ],
                    "port": 53,
                    "outboundTag": "dns-out",
                    "type": "field"
                },
                {
                    "inboundTag": [
                        "dns-in"
                    ],
                    "outboundTag": "dns-out",
                    "type": "field"
                },
                {
                    "inboundTag": [
                        "remote-dns"
                    ],
                    "outboundTag": "proxy",
                    "type": "field"
                },
                {
                    "inboundTag": [
                        "dns"
                    ],
                    "outboundTag": "direct",
                    "type": "field"
                },
                {
                    "domain": [
                        "geosite:private"
                    ],
                    "outboundTag": "direct",
                    "type": "field"
                },
                {
                    "ip": [
                        "geoip:private"
                    ],
                    "outboundTag": "direct",
                    "type": "field"
                },
                {
                    "network": "tcp,udp",
                    "outboundTag": "proxy",
                    "type": "field"
                }
            ]
        },
        "policy": {
            "levels": {
                "0": {
                    "connIdle": 300,
                    "handshake": 4,
                    "uplinkOnly": 1,
                    "downlinkOnly": 1
                }
            },
            "system": {
                "statsOutboundUplink": true,
                "statsOutboundDownlink": true
            }
        },
        "stats": {}
    },
	{
        "remarks": "PQ58",
        "version": {
            "min": "26.2.6"
        },
        "log": {
            "loglevel": "warning"
        },
        "dns": {
            "servers": [
                "fakedns",
                {
                    "address": "1.1.1.1",
                    "tag": "remote-dns"
                }
            ],
            "queryStrategy": "UseIPv4",
            "tag": "dns"
        },
        "inbounds": [
            {
                "listen": "0.0.0.0",
                "port": 10808,
                "protocol": "mixed",
                "settings": {
                    "auth": "noauth",
                    "udp": true
                },
                "sniffing": {
                    "destOverride": [
                        "http",
                        "tls",
                        "fakedns"
                    ],
                    "enabled": true,
                    "routeOnly": true
                },
                "tag": "mixed-in"
            },
            {
                "listen": "0.0.0.0",
                "port": 10853,
                "protocol": "dokodemo-door",
                "settings": {
                    "address": "1.1.1.1",
                    "network": "tcp,udp",
                    "port": 53
                },
                "tag": "dns-in"
            }
        ],
        "outbounds": [
            {
                "protocol": "wireguard",
                "settings": {
                    "address": [
                        "172.16.0.2/32",
                        "2606:4700:110:837b:ea14:8e23:cd36:5530/128"
                    ],
                    "mtu": 1280,
                    "peers": [
                        {
                            "endpoint": "8.34.146.78:1387",
                            "publicKey": "bmXOC+F1FxEMF9dyiK2H5/1SUtzH0JuVo51h2wPfgyo=",
                            "keepAlive": 5
                        }
                    ],
                    "reserved": [
                        243,
                        33,
                        224
                    ],
                    "secretKey": "r7orEMsyQwo+Jkwbv0Y9gLSmiXy5HC84eYbt3PystYs="
                },
                "streamSettings": {
                    "finalmask": {
                        "udp": [
                            {
                                "type": "noise",
                                "settings": {
                                    "reset": "30-60",
                                    "noise": [
                                        {
                                            "rand": "50-100",
                                            "randRange": "0-255",
                                            "delay": "1-5"
                                        },
                                        {
                                            "rand": "50-100",
                                            "randRange": "0-255",
                                            "delay": "1-5"
                                        },
                                        {
                                            "rand": "50-100",
                                            "randRange": "0-255",
                                            "delay": "1-5"
                                        },
                                        {
                                            "rand": "50-100",
                                            "randRange": "0-255",
                                            "delay": "1-5"
                                        },
                                        {
                                            "rand": "50-100",
                                            "randRange": "0-255",
                                            "delay": "1-5"
                                        }
                                    ]
                                }
                            }
                        ]
                    }
                },
                "tag": "proxy"
            },
            {
                "protocol": "dns",
                "settings": {
                    "rules": [
                        {
                            "action": "hijack"
                        }
                    ]
                },
                "tag": "dns-out"
            },
            {
                "protocol": "freedom",
                "settings": {
                    "domainStrategy": "UseIP"
                },
                "tag": "direct"
            },
            {
                "protocol": "blackhole",
                "settings": {
                    "response": {
                        "type": "http"
                    }
                },
                "tag": "block"
            }
        ],
        "routing": {
            "domainStrategy": "IPIfNonMatch",
            "rules": [
                {
                    "inboundTag": [
                        "mixed-in"
                    ],
                    "port": 53,
                    "outboundTag": "dns-out",
                    "type": "field"
                },
                {
                    "inboundTag": [
                        "dns-in"
                    ],
                    "outboundTag": "dns-out",
                    "type": "field"
                },
                {
                    "inboundTag": [
                        "remote-dns"
                    ],
                    "outboundTag": "proxy",
                    "type": "field"
                },
                {
                    "inboundTag": [
                        "dns"
                    ],
                    "outboundTag": "direct",
                    "type": "field"
                },
                {
                    "domain": [
                        "geosite:private"
                    ],
                    "outboundTag": "direct",
                    "type": "field"
                },
                {
                    "ip": [
                        "geoip:private"
                    ],
                    "outboundTag": "direct",
                    "type": "field"
                },
                {
                    "network": "tcp,udp",
                    "outboundTag": "proxy",
                    "type": "field"
                }
            ]
        },
        "policy": {
            "levels": {
                "0": {
                    "connIdle": 300,
                    "handshake": 4,
                    "uplinkOnly": 1,
                    "downlinkOnly": 1
                }
            },
            "system": {
                "statsOutboundUplink": true,
                "statsOutboundDownlink": true
            }
        },
        "stats": {}
    }
]
