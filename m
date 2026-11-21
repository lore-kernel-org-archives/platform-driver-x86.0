Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.36
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795221914;
	b=vRp2yU+Mb8gM3vhWHy7rEZY0+Ob1V57+cqKJaZWXk1r/MmSTzHG/DzNRwvcNKtLWkBgb
	 AdiJehtjWQIuiSDKnVL9nrVId0SN36zk4Yt8Dzsv957S6MyW4gN21yGrt2vOyys9zksoD
	 Ur06Psg5q2PyZACxkixTDIhiGl/vpkTXNs5ZWzo3WpdleLIMmgYZWRbdE6jENeeYbfjUA
	 +/S0qs/QMN7B09JWMjZPJqTRiavyet3JQfHHYYz8VoIDwMGvnNO1s2oIeQR7mEZJnU9+k
	 DmbrYko7MPQZRsqQ8Kb3oPrSoejCfy0+nbylKiwMZAiZX4Q7hOaGIkbpzmRcWw+IdMg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795221914;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=cbn1L/HCWu3lgLqRPiWGt9oC+/qkSNbL/Sh8/laY37k=;
	b=lr9/mrtetGQFYqq0zQOnkYnPbosdHXy6SvV4KC7pHPeiqHWK9GZ9MnZwstkqUOPPF7aP
	 88Mpe4zhsyUAlp1TNCRiIUunuh0niKuoEckG/JdL6WRfXa0rv8so58Qd0JhoJTY2ULLGG
	 8BYEYDcX/73KmXkVskvHjhj1mwqjoA0LQfxi1aaaqwYE96JDZ3umo5j1FgjraY3dE5kOy
	 Ez8lbJ88fyXYbVWO6c0i7sGHpv1YmsiygSB0VD+GBcqaYA97yVHuGlbJdPNFbt6vGOBb0
	 bKkvlpAYdXemIfZ9mtdmI4uNRSoqcB4t5bf57w1AVXY1ZX04HSO0dbRCs4ymlxose7A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=MI9XE9KM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.36
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010036.outbound.protection.outlook.com [52.101.85.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 251B6606A6A6;
	Sat, 21 Nov 2026 00:45:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 251B6606A6A6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=MI9XE9KM
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K8XwN2fI57d726DPhd9O/x15UmOyo4tvOiavshPfAOQjL4wlFijmjFkOTGwroeMEyzqSOWFB0HixrMXwnoI6Oz5C2DSSBz03IPW6DKQK4C20S6WFa2tMvtTG6BJmkKcWJa4uXpwcigx/i8HCv6AtwOHgUvYIb+D9gOEzIE7La8y+HLZWR/uGfL66CFMwEcEjSPdt5+/KSQsIZ7v2HFjG9H2QPP9mK151gj7ACLd6dlJose6rYDTVI3J+MYPR+4fl77DPU+VWXAEPCnNX92jruZhVTYE/O6D3vOzD0/bjMicpNuDE7wAn57sR96pfof05i4Tmsf+K+b/RnrKD0dfIrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cbn1L/HCWu3lgLqRPiWGt9oC+/qkSNbL/Sh8/laY37k=;
 b=jYen9VILrVmIjSgSaKxrLjfivJqhrJYw5dKivUZwJe2UIjXjxOsPQBWBzjuJUs4EJgEOlCwBL5cjidZF046c5NBTOGI9Ao7aEN+4mA2G2MbtzPUEB7trHCTpCDC8GHv1HHslABFRUOAvXOrL52Ck5XEtcwf2wyQBxa+a6Kyv39b9+bHZTQeJexBJRJEKMCmvE2JX0d+owBDw72hMFrqWRfdQ/K0TRYegq7APkMg/FerLHrT6czCg7j1QkxcWGyLcViLa9Ih14nz/+Ar5GcS29I7ecdSl3Ct/Sqq/mo14nUo8HSa3XQ9Q27DrXZinCts8sbp/kI8J5EN9kNmrYQ94UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cbn1L/HCWu3lgLqRPiWGt9oC+/qkSNbL/Sh8/laY37k=;
 b=MI9XE9KMai2/SOUkq7sqBboeuck0QAbpzQxuCTHQDmyUVuNDspmgc0/UhYGsQO/evnkSkoQv3OJTyBZEIuYw0x3ohrqrJYVTQimDQdj36/8X+hfJY3sajFcEMX3QMR5rhae8fke6nxwnQd62Fi5jyYYAJvucBHVsd6H96/HF+yQgaWRGk1ruBjCTwLis6aZPAAQurbiiSCekB0TiTSBAru6m3qL73g9Y2JCjsXDOBP5flvF9jRXP1m3X9HWsD0admel6Tg28aahjSi3kxogV6vgh8ZyExGRWNYvmHJ7M6C/+M3Vgo1mlaLxgjqY9QQVTHE4EkKlcTLl3oprWvbkLcg==
Received: from MN0PR12MB5786.namprd12.prod.outlook.com (2603:10b6:208:375::13)
 by CH3PR12MB9123.namprd12.prod.outlook.com (2603:10b6:610:1a4::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Sat, 21 Nov
 2026 00:45:06 +0000
Received: from MN0PR12MB5786.namprd12.prod.outlook.com
 ([fe80::ae61:c9b4:847b:4854]) by MN0PR12MB5786.namprd12.prod.outlook.com
 ([fe80::ae61:c9b4:847b:4854%5]) with mapi id 15.21.0639.011; Sat, 21 Nov 2026
 00:45:05 +0000
From: Brian Mak <bmak@nvidia.com>
To: =?utf-8?B?UGFsaSBSb2jDoXI=?= <pali@kernel.org>
CC: Hans de Goede <hansg@kernel.org>, =?utf-8?B?SWxwbyBKw6RydmluZW4=?=
	<ilpo.jarvinen@linux.intel.com>, Kurt Borja <kuurtb@gmail.com>, Stuart Hayes
	<stuart.w.hayes@gmail.com>, Matthew Garrett <mjg59@srcf.ucam.org>, Lyndon
 Sanche <lsanche@lyndeno.ca>, Armin Wolf <W_Armin@gmx.de>, Prasanth Ksr
	<prasanth.ksr@dell.com>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
	<skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
	"Dell.Client.Kernel@dell.com" <Dell.Client.Kernel@dell.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 6/8] platform: dell: smbios: Add quirk for non-functional
 calling interface
Thread-Topic: [PATCH 6/8] platform: dell: smbios: Add quirk for non-functional
 calling interface
Thread-Index: AQHdeUxcJjeWavWmSUeVzbExQlxH3Lc3rq+AgAABz4A=
Date: Sat, 21 Nov 2026 00:45:05 +0000
Message-ID: <bba7e3b3-65fc-43dd-a9f0-b092c2cc0a32@nvidia.com>
References: <20261121000556.173028-1-bmak@nvidia.com>
 <20261121000556.173028-7-bmak@nvidia.com>
 <20261121003835.uemb2uaqm6enjqrq@pali>
In-Reply-To: <20261121003835.uemb2uaqm6enjqrq@pali>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB5786:EE_|CH3PR12MB9123:EE_
x-ms-office365-filtering-correlation-id: e7e8b7c7-3317-4fd6-9f55-08df4768af72
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|366016|22082099003|18002099003|56012099006|11063799006|4143699003|261022105027099003|261028144727099003|261026140227099003|261021123027099003|38070700021|10067099003;
x-microsoft-antispam-message-info:
 FlnZ39Mk30BgGJoN35+VMdixRf+pNA/lag5YWAanvsGaunQegYbdbqHkUhVmwvVubYIaIZGKus6JKt0vEgbssAocHYUZSi8ApVKdnyDhdu7zE4GE5JAFNdRXE9YNZi4xPM8G1SbubOpi5lm4uUltEwXRMDBbfs9pDEpNR9ZprJdNzrHAtm9z6oZlc8DKPTcavVKbNpKzu+Dm7UbNgrSxu+lo7OhZGiv3fZ3d4ZgLgwkl/aRN3NtGe1uxFfDYcSwSyTx9JKuNfgJEOzKpHK6fN2FcwIrnPLd49UoGsJgD7ZtQcIMd5MpYbFfX+B1kDBBRHJutKK+fGBr2zcImuCpy3ZPIc1UoIFR1kRfSz/G9LZcFkpP1tL4uxB732nJQ11GKEE1xbABEqsIYrvqLAWTawB5nBN16JKNZZr+swTWnf6ZkUZgf+0lo17YUQxyjwegDXbJSI+kE4/Yu8Ahrum+mwqDHqSAZnuDRIZB+d70LjW38ATAt2Jv814rySu5llPZLEArspLi7SC5SWWDsYNdD+iOSM7Xlad5vtwQKChR8jAMYA5byxw0pBRi6P5Sk7nRLVUp1+dDS5LhVA9pQ/ZxeDRbn6Z3cD6C819olYeIBKjTvF9+w5LLJ/FpF2+KJm3qbJ4GWaz+7qnkTM02HHQR6kTl3K4u2DZdqjtB3sjS4clCBQSOOTzDXp1YTCxXfxARYOFrRI6cMLfbylhTRFjasLHy7+LpfnzXomSR4Zn5p8+Q=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5786.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003)(261022105027099003)(261028144727099003)(261026140227099003)(261021123027099003)(38070700021)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZE5hVTVjUktXRWh5ZVRERWJMbWt4QTdpOCtyTm1jbmdPMndBWVdjVlFrR2cy?=
 =?utf-8?B?KzZNeEdvOWdCZzZ0NUdoM01waDBMQWlXNjNuYTFZaVRoOFFDcldlcDlPUm95?=
 =?utf-8?B?U1lPcUVzY05TOXl2ZjhSUXRzaDRzVDB3Q3l2UkJzNDhwcVA5MkRzUU1LZlla?=
 =?utf-8?B?UmczUXltRjdOOFR1TzFJNHBJQWlsWUdBWFlqZ0tGS3gvZHpYczlHUERuS2tt?=
 =?utf-8?B?LzIwbStIZWpVNXJQVjVPeGRXaGpnK3Q2N2h1WlhBaVhKNURkeHVYVGV4MEI1?=
 =?utf-8?B?V0lIbGJScEMwa3R2WkhadTk3WTJMSlJsT291MGpucGlEbWVsZG52TVBvdTFv?=
 =?utf-8?B?eGhtVFJWOWg2TWpaNEsrTHJvbDNMSFY1VHZzbWtoajRzTlcyYjF0Vy9qNjMv?=
 =?utf-8?B?dk5CUEZvbkVCM0NtTkhwSlZwa3hoK01jZk5RTFpydzlHZlRjelBQdGl5RG5C?=
 =?utf-8?B?NzNITkIwUnVwSFZoZHd0SHRvQmRyeWZXem05Tnl0NmZFSW5Qa3NYK1JVc1RC?=
 =?utf-8?B?Sms4a3Y4MFRTWjZiYThYOEZzTUlJa0ZuazVtTVJ2V0RwSEJJOE53NDZoaTNZ?=
 =?utf-8?B?ekVpNEtrMnJ4NlY4UXZmRWJZeDdOK2JzMWJnUlRKK0x5cTFVUTZFV0NDbXNt?=
 =?utf-8?B?dk9XOUcxWCtxQUsrZWswNUs5ZFFvVlZiT29xYk9HdEg2V1M4UTMxY2xYSVFl?=
 =?utf-8?B?RmcxV2htSGRJRmlCWDhoNnR0N2MxelByNWRTWGlLUFBJKzE1SklWdnlaZHJj?=
 =?utf-8?B?OWJaYVl4Sm5FMk1oV3RNM3dQcWFPc0o3RTJjV3Aza1V5TGtFN01BSnk3MUhv?=
 =?utf-8?B?QW4vNGpmMElBbHptd0p4L3J1WmI1YWN3NkpuZ0J4UjFHTWREVTV1bFRpd2gr?=
 =?utf-8?B?QUE5ZjFVVk1jQS9yL0FtY1NoUWVsVERtRi9rY3VSUW40QmREOG4yQ1NkajQy?=
 =?utf-8?B?VVc3YVZ3WU5udzFzVHJhMUZtcEF3OFpyMnlpdUNlK250eUs1NVhrajQ1NUpt?=
 =?utf-8?B?VjVaOG9ERVQ1MVF3UTlHcWt5TlM2eW9HWng2MnRBb1d2RWliNHAzWFo4d2cx?=
 =?utf-8?B?ajRnelp5c2M2UzVNODRHVFNzcnZ2RkUyc2RaTXdWMXpjQ2hwTlpXMTNPVDBj?=
 =?utf-8?B?Slk5bWs3YXRuN3RRbU0xOWxVRDhvQTBkREFqL1hlZHU4WkRaTWZMc0p0TEVF?=
 =?utf-8?B?WU5NUmRQamhqUEl4bUZrWjN2LzNlK2lvOVhmNHhrcnJrV1dGakl6RWpHZ09u?=
 =?utf-8?B?MXMwL1RzejhvOUdSZStYbFZ3RXFKaE9hK2NHNU1qTElscjRSbDhmem9HaGRz?=
 =?utf-8?B?ZzhuNTF1TlZJcms2VzJVVWFxQVhUZHE2NDZvSWNYeG04NnJGNGhadXVIY2w5?=
 =?utf-8?B?K2V5dzNRMWxFbnNZZjlZRkFxYk8wMjVSdXpHZUZveEpGZkNpY0c3THkyZFhI?=
 =?utf-8?B?d3c5SkRkaVdrWlB3d3VJWGo3a3JHK1NnVGtPTjFVZWpWelUrNlYvRHJGd1Nk?=
 =?utf-8?B?bWdtcTk5ZkMxaW82ZktsNTYreGhGQXRVS0pWU1V5MWo3QmM0NWpyK0p4Y25y?=
 =?utf-8?B?WUlJcmhLQzFjbm1vWWt6dlNFZ3ZhaVhPTDBmOTBORVFIYkRPdVBzZE9xSjBL?=
 =?utf-8?B?cjg4dWxRQzJLL2VVZnBhK1BmZUxWbkdIZVJUcUdxR2NtZE9zT1NjbTVES25X?=
 =?utf-8?B?RTByazVHRlFxdmVJMkYzSnNkY2FZMEZlTzdZVVZGS0JnQzdJdWpIM2tUbUli?=
 =?utf-8?B?KzRQY0tqQk5zK3JYcmkweFZGdTFkblBhOGpyZ1o5WkFITkdBa1JVSjhGRWhh?=
 =?utf-8?B?VExsTGpjTzFrQXlHeURITEZuVWpKWjloK3ZCYWZjRENzV1dxcXhvR2Q3TlhN?=
 =?utf-8?B?d2dHaWx0aTE2VEFJNUttc1FPdUxNQkg2ZEltckJheUV6VjU2WVB1aGN3TWY3?=
 =?utf-8?B?NE1DUzkrUU1JdzQxSFRpeThBdGpMbVh1UkI4bzA3TkxqQkswenZ4c1lYcVBE?=
 =?utf-8?B?Q1dVaERVSENIYnN4MGVlaFBCcWdSYmRTcVNmdld1REkrODQrZzdDaXN6b2J1?=
 =?utf-8?B?MUp0THNTdm9UU3QxZ0NNcmRqQi9VQUtMN2xzcHNxVkFiQVczY0JSbExrKzAv?=
 =?utf-8?B?OWxlVlVEeUc5cWZ2MnZ0QkdvZ0x5R2pXdEFsamM1ZEVEL2VkSUlYdThjT25O?=
 =?utf-8?B?WjVJQXg3ZmU5Z0Zkb1pHZUZnS1BLMUZPbHdyRDQxeFJ1dUVrcUJjQkNIOTdY?=
 =?utf-8?B?d1UybW41cjVqUHpVK3RMMkNxamgwWFkzNENtWTR2Sk1FckdDUG01RVE3elc2?=
 =?utf-8?Q?GywS9CAF+GIH2DZB/1?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B04A443A62B7AE4C985E05EB1BD4AD4E@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB5786.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7e8b7c7-3317-4fd6-9f55-08df4768af72
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2026 00:45:05.4662
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qT5I4a8P53MrixX2TApyM64A4jHMfIs9Hc8WL9ZA7cJI0xmHkVmzWimUOB07lWYp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9123

T24gMTEvMjAvMjYgMTY6MzgsIFBhbGkgUm9ow6FyIHdyb3RlOg0KPiBPbiBGcmlkYXkgMjAgTm92
ZW1iZXIgMjAyNiAxNjowNTo1MiBCcmlhbiBNYWsgd3JvdGU6DQo+PiBPbiBEZWxsIFJUWCBTcGFy
ayBsYXB0b3BzLCB0aGUgU01CSU9TIGNhbGxpbmcgaW50ZXJmYWNlIGNvbXBsZXRlcyBldmVyeQ0K
Pj4gcmVxdWVzdCB3aXRoIGFuIGFsbC16ZXJvIGJ1ZmZlciwgZXZlbiBmb3IgcmVxdWVzdHMgdGhh
dCBzaG91bGQgZmFpbC4NCj4+IERyaXZlcnMgdGhhdCByZWx5IG9uIGl0LCBzdWNoIGFzIGRlbGwt
bGFwdG9wIGFuZCBkZWxsLXBjLCBlbmQgdXANCj4+IHJlcG9ydGluZyBib2d1cyBzdGF0ZSwgbGlr
ZSBiYXR0ZXJ5IGNoYXJnZSBtb2RlcyBhbmQgdGhlcm1hbCBtb2Rlcy4NCj4gDQo+IEhlbGxvLCBp
cyBEZWxsIGF3YXJlIG9mIHRoaXMgZmlybXdhcmUgaXNzdWU/IEFuZCBpdCBpcyBnb2luZyB0byBi
ZSBmaXhlZD8NCg0KSSB3aWxsIGJlIHJlcG9ydGluZyB0aGlzIHRvIERlbGwgYW5kIHdpbGwgdXBk
YXRlIGJhY2sgd2hlbiBJIGhlYXIgYmFjay4NCg0KVGhhbmtzLA0KQnJpYW4NCg==
