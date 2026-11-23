Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.200.23
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795466177;
	b=JZRktFCDBIGK+fso1dW6OLh7RTg6ICfpor6rEJx3BbOOuQZ59KXj2C+9V7a3NNEHx95Z
	 WrfFJjP940q56+QAVBR0t99F+vUw+zbAufThJ5aXctGDmeVBI2YTOFfjZwLgEp/szGtxs
	 cU5XYEG5JNJzpS1uAfSFV5SnrQPCMjrnj9vKQE+urqT3UAEpNZiAH5Nqzq9t5fkTflcMD
	 OuR7EX8oQ+GtbSr8WXUJDz7Py59rXhU+/5W9asqdqwvVz5nGqE8dmfgu5T35yeeYK/xA3
	 cPR8vYzQbKLEhF4vaBEj/YaXUBLUOCJbtB38vB+W7D025Sqo+NJqphOhjWEz2m/lEuQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795466177;
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
	bh=A/xhY7iS2Qxfk1rfq4Eyh+BFQwU/D2mUGzXbpav9nc0=;
	b=wyHN5nCZnHmzPZIVRWfftS01QfW2P4PhhvbV5424qWll5atSRw1t1qTDlX9B2kdmr7qS
	 8z+vREMK6Tp9ud/oz2i3nw2907xdyXJFvUL7mw98OFz6TSKFiPW0ErwjFrBqD5TvC+qX0
	 bp1kVSufmMQDslgKUstGRtTabDxpIXWA3Acwve4vpL2LyukNid2z8ftITCkyibm4aGKrm
	 p/uxHeGirzsvOHYg+fnR640eoGmxe4VkS/6ksru1DdHn+QkC0v2KnxJa1g3g36cguDIIr
	 fln1JANGFuG0HhKFFYWzyve/4hdmQ/z6xlxn9W12vdQeSRz/pJ9nu9b28QWKwxPOgMQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=PHU2kPhx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.200.23
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012023.outbound.protection.outlook.com [40.107.200.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75948606A31E;
	Mon, 23 Nov 2026 20:36:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75948606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=PHU2kPhx
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OjZ+vtcB8ggreiaRUTHBB0dijUmSNWD4rUNsWK3/w2/oYb5LyJ86PRLE1bfAJ+Fwpbc3X0e7jc1NaH3SIV/aGiNQXlJF72GlCD6O7Ivb8OAAp1n7mWAPlfuQ9DyAeAbSWcvMMiwT96tXrU0A5zYWs5+tTH4rL9BPeI4lJENC64LRjarQwlMz4hsk+aZNtePFbRFQBTl1A7GMoKaaaq0v9RsfOGmj8Q1lWSle42ZuPVszhgeV6+JTkNOwtKQx4dqSunxp3kZnIA5H0v6VvmmL1DQvZ+lmg/Dn+V0AsdOIxgliRMySVUv5WCSDVC29qYM0eDagJSZnq3i2nQwYKRgZNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A/xhY7iS2Qxfk1rfq4Eyh+BFQwU/D2mUGzXbpav9nc0=;
 b=C934wG5EMczceK8mLX0NPktpBQtoq9IUPJbidFqGs31GNTEc8u/J9O77AO9y/WVbE43BfVKAV+P+UjyFcQuuB6jP5DaOF9UZUdNRmfvFfDSXl37WxK0UhC8YXFK2btIk2TFZfs0troJVMbrrF4QJvMhNZsJHXgLiwf4DoFdwQt4ZB8VdA7bcAgx/B867T9fToKoIN/HTtT+ta7pCBTTqAXvfzSRG3CKY2zpo3QEcpNXxA5lBYLrK7iTYzvSjx9u8+fbOYKFt8k53DT2aubklumCmT38kxRxcnPjf24SehMyN8NesdckbYvoDKW197/towr96wg2okci5DVJk1yRMzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A/xhY7iS2Qxfk1rfq4Eyh+BFQwU/D2mUGzXbpav9nc0=;
 b=PHU2kPhxcvpD7F6PM2d5yfXszN7XJxbbTtvwM9sUeRzZB7S/HYFSTmLwWCE3hB/pAoGKKiK64LSBtuCaRTUaP7H1ZwB5JpHWxcOjqpHf7jFp0oZLiEMsyy4OP/5QXbgRpz71I6Nt5rRSO36a0AoyyfkOd8YM9cPsXKLK6rd4bvuqjXYY6SOEs9zyFo7kK3g3crsv//JFnKEdvQXeWD+wDP67B25h0AmPr0zUOQD18lxPJF/jjBN/dBGdyd/yVVzrACCs9yec1CdzJfHjBkRpC8gYOgS/SBattugOdYrPE4a6dnYXUI0axMvD28vO3tCr2NSJQ3uUi7bglJ6sONOnwA==
Received: from MN0PR12MB5786.namprd12.prod.outlook.com (2603:10b6:208:375::13)
 by LV1PR12MB999306.namprd12.prod.outlook.com (2603:10b6:408:3f8::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Mon, 23 Nov
 2026 20:36:13 +0000
Received: from MN0PR12MB5786.namprd12.prod.outlook.com
 ([fe80::ae61:c9b4:847b:4854]) by MN0PR12MB5786.namprd12.prod.outlook.com
 ([fe80::ae61:c9b4:847b:4854%5]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 20:36:12 +0000
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
Subject: Re: [PATCH 4/8] platform: dell: Allow DELL_LAPTOP to be
 arch-independent
Thread-Topic: [PATCH 4/8] platform: dell: Allow DELL_LAPTOP to be
 arch-independent
Thread-Index: AQHdeUxZSHH0y3AHX0KMIS92REQ5Gbc3sXIAgARYswCAAAfwgIAAD9+A
Date: Mon, 23 Nov 2026 20:36:12 +0000
Message-ID: <10868972-1b96-48df-8383-913e23abd4c2@nvidia.com>
References: <20261121000556.173028-1-bmak@nvidia.com>
 <20261121000556.173028-5-bmak@nvidia.com>
 <20261121004828.rk2k2cq4id2ixkal@pali>
 <af13cde2-6407-453d-81db-1778b30f4763@nvidia.com>
 <20261123193923.cl2i62lgute6li3u@pali>
In-Reply-To: <20261123193923.cl2i62lgute6li3u@pali>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB5786:EE_|LV1PR12MB999306:EE_
x-ms-office365-filtering-correlation-id: 955333e0-5197-4de6-f7f2-08df49a16a1f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|366016|376014|23010399003|6133799003|18002099003|22082099003|261009223027099003|261021135927099003|261021121427099003|261021130227099003|261021123027099003|261022105027099003|261026130827099003|261102123227099003|261026121527099003|261026140227099003|261022075727099003|261022115727099003|261022113327099003|261028144727099003|56012099006|10067099003|38070700021|4143699003|11063799006|5023799004;
x-microsoft-antispam-message-info:
 J6VBH3p5hFhn9WdH/Lm0n7JsoYnjoJ2wsd1p3pTpcmOqJjU7lBC5KvwS85iXZM7x2lWjMV4oSGdxjF0id52H8wSYOMuv9xMQzFlcp7Z3LujQ4/60+mtkFuLZ7bQK9TWuoatDB4M4yVjyNCN3y/worVLPZ3tg7XVBSidT/LPJldPNKBlgdAQseg3FNDP6TG+TlUZLNuGh35Ws/2dM/uusWLePpgnUbQJ4Ljpx2TegmwjfmxeT6brSN0i0DHmuuXSHHi5XNURkiqvQtJwArxZhAWMRGHDH6MHeJPYMYtkujTdrGoiPGk49zGNO3ckCDTgLiSN8l5Gvikue9S+C4QDOPX9Hd4zxE6uBUlqk4+Xq4kS5SddzsVq3c7n3OXAVyFqrbmhjY53Udqb3rCbhnGWZkTx1rP+knlW8I7yjOgdHw38XOBM3L1ZBo9QgKAr/ENWRZJxFqUspsq81HER7eUOx0rEtiWgj/huFzhbvWmFns61IDvyjmb7htmnwRcEFN7OhIQQwLnd64U2ZR3TTmmF5h7bSeh6PG+8x6DyUoc+6ScKQwv3dLkY0p8t7f+niSyRzFPN9qmTbx4+fg/KG/whHPd8v2SbnyzUU/5IEg+EM7PKUiVSNTr/kxAoxllVM2vWAfa+x5Pyqev1OecX1gOJ2DBfMC4tfoFepMSmpTRy9iPrLfuclAcciwnj9JTBaK88ewMoaq55suuGoCow8n1IZ0A==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5786.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014)(23010399003)(6133799003)(18002099003)(22082099003)(261009223027099003)(261021135927099003)(261021121427099003)(261021130227099003)(261021123027099003)(261022105027099003)(261026130827099003)(261102123227099003)(261026121527099003)(261026140227099003)(261022075727099003)(261022115727099003)(261022113327099003)(261028144727099003)(56012099006)(10067099003)(38070700021)(4143699003)(11063799006)(5023799004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cU01dU0yM0c1QUZINlZKaW9qb2RHcFlFcXJwRktVRGczUzIzSnJPTDVNaThw?=
 =?utf-8?B?b29WMnY3VG13SGJwVUc3SXNsU2FiZFRQRmwxQ09HYjc5LzJIUUxjSjk1VXJX?=
 =?utf-8?B?dFFiSG5lOC80YjhJVjM0MzB4dlBnOXdvd3VPMWtvZjlQdDZiSDQvY2VOdVls?=
 =?utf-8?B?THh6WGIrdXV4VVhxcThsdzg0aTNjNWMwWXBqTTN4RXgvaVNERWpjNlN6WGR0?=
 =?utf-8?B?VmJhSHVhSTZlbTU2YTFUNCtuNzlmU2N4NTkwaExxOW9saUI0U3BJTmVWS3h1?=
 =?utf-8?B?Ty9yall1dUJnUCtONlZFMjFlNmtEOEI1QmhqendMdXlIeUZFWDRLcGs1STZD?=
 =?utf-8?B?N3QwY3AxM29WbXBQVWlsN2c0Q2htZHBqVHBvSkg3djN1RVYvUHVoS1NmdkUy?=
 =?utf-8?B?T1BhODJqUXVuVVExcVI1TVprM29nRGZqbUVRQXJmbzFNdzJHd1lmYWJ0V1pw?=
 =?utf-8?B?akdlWkZkdElhd1RYY2s1WUllWEFoRjEvWnJSeDBmMmdPYUxJZHFnMUNPbHNJ?=
 =?utf-8?B?ZTFWYUJoR1ZzenJWbXVyUFlsZXZhaExMQ3hVdFdqblhDSW1ZTUE0TnZ5cEZ6?=
 =?utf-8?B?d0J0Y3E2ZmZOZ2NveEF3YS84NTFKZ3E0UStWZFdSQkNCNG44SjJUK2RYN2oz?=
 =?utf-8?B?dHFWelBlZ094Q1lGcDgrRG5ES0ljVXIwSGpyN3RyaVJ1MmZON3BCUkVjc1N2?=
 =?utf-8?B?WHRuRWZBVnBuNTNUL28xWkt4dm9kVlNFUitoRUlTM3pseEpST2RXTUVpdTVC?=
 =?utf-8?B?Y3hRazhzTm1Wd05NVU5pVkdnVkJqdW5CdzhjY0ZZQUZqOCs0RVRZWjdoRW04?=
 =?utf-8?B?eGFVVG5zNjVWY09Qc3hmd3lNLzRtcjJPY0VocGVXcWZKZEpVRHgxRTQ0eWRW?=
 =?utf-8?B?U01QVDFwYm9hZGFRVXZObjZsZlFFVlord1hZZEpWNktxS3FNMjRrVU9mN2RO?=
 =?utf-8?B?ak4yS1FtM3hnRmJHZUk0bkRuaTFmcGtSaUdBclRNOGVWMHMzZTZSbzBFU2cy?=
 =?utf-8?B?eVZucldCMXE2eUU3RDl2MjcrNnk1ZWh1RlpjcEJSd0pKWVJZSU1iZzFjTE5j?=
 =?utf-8?B?UktEZVJMYzFsam5YMUduUW5uY0w0dWFDOUxwR0pUK0gzMDMwV0s5SEh0Zm1T?=
 =?utf-8?B?d2hmM0dCT1NqT0VGZTl6ajFHYWFqTEdUN2Y0aWR3ZzFUV3YyaXVvNk10ajZC?=
 =?utf-8?B?TEkxYllVR24zamlJQlRmQ3p3bjg0VHdzbXpycWZ3UnNIZHg0RGpkRUkrVWFJ?=
 =?utf-8?B?RVFHdStndWlIZko5MTMxSkJ6TUJFOG1UOUVKKzhPbEVWcm83NFV3cTIxT0N0?=
 =?utf-8?B?SVJYa0dFTjB0b1hoOEJ0dUM5MTc3UEY4Ukdpa0R1S2lYZ1JlYUw1Z3NQMFQ1?=
 =?utf-8?B?TlJ6Wk5ySWtJN1lZd3F2QjFDdENjUDlGbXUxSXpFYkxpaU1nY0VJQSt4UkFF?=
 =?utf-8?B?QUFEZHVSa0taUzNDb3N3WVRORXduUVlRVENMOHFTcS9RVldhVVhKRjFINGZm?=
 =?utf-8?B?MUIyNGN6QTVaZk0wc0V6djdUWjdSSXZ0d29KcFdnZ2pFUitGOVlFd2YxY1g5?=
 =?utf-8?B?S3dJVHpHZFZROGsvNzVOb0s0TUZYNmZNS0RVTml3WnNTWE1PRjZzUVNQMXdl?=
 =?utf-8?B?Vk54QmxQQTFmbmpuaEhOcCtKbXphZ0crQ1FWL3kxSlkxT0xhaWI2NHEzOEkv?=
 =?utf-8?B?WG1sS0VBVUVZMm1mSWVBTkhad0VhQ0FLbGlRYzFOOGlVRnFpbGpobTJwaUVr?=
 =?utf-8?B?eEdGVU9ZSEdGZ3RRem1qdTczalVoVnIvaVBwdDZiSitQbDJ4Ymg4OHdRQS9u?=
 =?utf-8?B?KzFuNjlIU1N4aFd0dEU3N3hhYmhkSGNZSzc1dU0xRVZ3WFljWGkybEhPcTdH?=
 =?utf-8?B?LzdBUzRVdXpKVHQrbE9wZjcxZzBLNlcrNkd4ZFczbFlhbDF6NFI4ZVRCSWVs?=
 =?utf-8?B?QzB3L09TVEJ0eFVHTDcxQWNNcHNuZGQra0xXUkxkRitjOFpwYWJ2ZWwvTGpp?=
 =?utf-8?B?TXRHU1RKSVVBV3paM0lZZkp3ZmxXc1lhR0lBS3Y5MUpsOXhTaUxHK3gvWGdh?=
 =?utf-8?B?eVRHZTB0Q1pkYjBzdFRWZDFWdWR1TjNpMGxqemdZRFo4R1I1ZG5ZNGdwWE9X?=
 =?utf-8?B?U1FvV29EWkhrY3ZJczlQQjJlTTMzTVFOaHRndVFpNFlhY3o0cmNOcWlzVlhX?=
 =?utf-8?B?ck10NWxiUkd6WGN1R3RrTzE1QlphczNSc1daa1pUOGN1d0pQM1Q4bEJTYmFy?=
 =?utf-8?B?ZmZjcnhJM2tYREhUUkZSbkMwMWVLQkFhbXduTmlVK0dYMzdsZUVCWExiWFNp?=
 =?utf-8?Q?mdefeAcL4N9hYOktL7?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A7CE201762394A45AABF6262459DB2AA@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 955333e0-5197-4de6-f7f2-08df49a16a1f
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2026 20:36:12.8499
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nLFElPGX4gM2yR3Q6uh0vEaCq/NCqr34EqgK899l3mGg4EUkRg/ln5P0Lg+V8uLt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR12MB999306

T24gMTEvMjMvMjYgMTE6MzksIFBhbGkgUm9ow6FyIHdyb3RlOg0KPiBPbiBNb25kYXkgMjMgTm92
ZW1iZXIgMjAyNiAxOToxMTowMCBCcmlhbiBNYWsgd3JvdGU6DQo+PiBPbiAxMS8yMC8yNiAxNjo0
OCwgUGFsaSBSb2jDoXIgd3JvdGU6DQo+Pj4gT24gRnJpZGF5IDIwIE5vdmVtYmVyIDIwMjYgMTY6
MDU6NTAgQnJpYW4gTWFrIHdyb3RlOg0KPj4+PiBDT05GSUdfREVMTF9MQVBUT1AgaXMgY3VycmVu
dGx5IG5vdCBhdmFpbGFibGUgb24gQVJNNjQsIGR1ZSB0byBhDQo+Pj4+IGRlcGVuZGVuY3kgb24g
Q09ORklHX1NFUklPX0k4MDQyLiBUaGlzIGRlcGVuZGVuY3kgaXMgYWN0dWFsbHkgbm90DQo+Pj4+
IG5lY2Vzc2FyeSwgYXMgdGhlcmUgaXMgYSBmYWxsYmFjay4gTWFrZSBpdCBvcHRpb25hbC4NCj4+
Pg0KPj4+IGk4MDQyIGlzIHVzZWQgZm9yIGNvbnRyb2xsaW5nIHRvdWNocGFkIExFRCBhbmQgZm9y
IHJlY2VpdmluZyByZmtpbGwNCj4+PiBldmVudHMgd2hlbiB0aGUgZGVsbC1yYnRuIGlzIG5vdCBz
dXBwb3J0ZWQgb24gdGhlIHBhcnRpY3VsYXIgbWFjaGluZS4NCj4+Pg0KPj4+IFRvdWNocGFkIGxl
ZCBpcyBhdmFpbGFibGUgb24gbW9yZSBWb3N0cm8gYW5kIEluc3BpcmlvbiBtYWNoaW5lcyBhbmQN
Cj4+PiB0aGVyZSBpcyBubyBmYWxsYmFjayBvciBkZXRlY3Rpb24gb2YgaTgwNDIgYXQgYWxsLiBF
dmVuIHRoZXJlIGlzIG5vDQo+Pj4gZXJyb3IgY2hlY2tpbmcuDQo+Pj4NCj4+PiBBbmQgZm9yIHJl
Y2VpdmluZyByZmtpbGwgZXZlbnRzIGl0IGlzIHNhbWUgc2l0dWF0aW9uLg0KPj4+DQo+Pj4gU28g
dGhlIGRlbGwtbGFwdG9wIGRyaXZlciBleHBlY3RzIHRoYXQgdGhlIFNFUklPX0k4MDQyIGlzIGVu
YWJsZWQgYW5kDQo+Pj4gY29tcGlsZWQgaW4uDQo+Pj4NCj4+PiBJZiBub25lIG9mIHRoZXNlIGZ1
bmN0aW9uYWxpdHkgaXMgYXZhaWxhYmxlIG9uIGFybTY0IEhXLCB0aGVuIGl0IG1ha2VzDQo+Pj4g
c2Vuc2UgdG8gbWFrZSB0aGUgU0VSSU9fSTgwNDIgb25seSBmb3IgeDg2LiBBbmQgdGhlbiBpbiB0
aGUgZGVsbC1sYXB0b3ANCj4+PiBkcml2ZXIgbWFya2luZyB0aGUgeDg2IHNwZWNpZmljIGRlcGVu
ZGVuY3kgdmlhIGlmZGVmcy4gV2hpY2ggYWxsb3dzIHRvDQo+Pj4gY29tcGlsZSBkcml2ZXIgb24g
YXJtNjQgd2l0aG91dCB0aG9zZSBzcGVjaWZpYyBmdW5jdGlvbmFsaXRpZXMuDQo+Pg0KPj4gU0VS
SU9fSTgwNDIgYWxyZWFkeSBjYW4ndCBiZSBlbmFibGVkIG9uIGFybTY0LA0KPiANCj4gVGhhdCBt
YWtlcyBzZW5zZS4gaTgwNDIgaXMgeDg2IHNwZWNpZmljLg0KPiANCj4+IGFzIEFSQ0hfTUlHSFRf
SEFWRV9QQ19TRVJJTyBpcyBub3Qgc2V0LiBXaXRoIHRoZSBjdXJyZW50IHBhdGNoLCB0aGUgZHJp
dmVyDQo+PiBidWlsZHMgb24gYXJtNjQsIGJ1dCBhcyB5b3UgbWVudGlvbmVkLCB0aGVyZSdzIGEg
Y291cGxlIGdhcHMgdGhhdCBuZWVkDQo+PiB0byBiZSBhZGRyZXNzZWQgd2l0aCByZmtpbGwgYW5k
IHRvdWNocGFkIExFRC4NCj4+DQo+PiBGb3IgcmZraWxsIGN1cnJlbnRseSwgdGhlIGRyaXZlciBm
YWlscyB0byBwcm9iZSwgZHVlIHRvIGEgZmFpbGVkDQo+PiBpODA0Ml9pbnN0YWxsX2ZpbHRlciBj
YWxsLCBpZiB0aGUgZGV2aWNlIGlzIGEgTGF0aXR1ZGUgb3IgYSBQcmVjaXNpb24NCj4+IChjaGVj
a2VkIGJ5IERNSSkgb3IgZm9yY2VfcmZraWxsIGlzIGVuYWJsZWQsIFNNQklPUyByZXBvcnRzIGFu
IHJma2lsbA0KPj4gc3dpdGNoLCBhbmQgZGVsbC1yYnRuIGlzIG5vdCBzdXBwb3J0ZWQuIFRoYXQg
ZG9lc24ndCBhcHBseSBmb3IgdGhlIFhQUw0KPj4gMTYgQ3JlYXRvciBFZGl0aW9uLCBidXQgaXQg
bWF5IGZvciBhbiBBUk02NCBMYXRpdHVkZSBvciBQcmVjaXNpb24NCj4+IHByb2R1Y3QuIEZvciB2
MiwgaWYgZGVsbC1yYnRuIGFuZCBpODA0MiBhcmUgYm90aCB1bmF2YWlsYWJsZSwgSSBjYW4gbWFr
ZQ0KPj4gcmZraWxsIHNldHVwIGZhaWwgd2l0aG91dCBmYWlsaW5nIHByb2JlLg0KPiANCj4gV2Vs
bCwgaGVyZSB0aGUgbWFpbiBwb2ludCBpczogd2hvIChmcm9tIEhXIHBvaW50IG9mIHZpZXcpIHdp
bGwgcmVwb3J0DQo+IHRoZSByZmtpbGwgZXZlbnQ/IEl0IGNhbm5vdCBiZSBpODA0MiBiZWNhdXNl
IHRoaXMgY29udHJvbGxlciBpcyBub3QNCj4gcHJlc2VudCBvbiBhcm02NC4gTXkgZ3Vlc3MgaXMg
dGhhdCBkZWxsLXJidG4gaW50ZXJmYWNlIGlzIGFsc28gbm90DQo+IHByZXNlbnQgYXMgSSB3YXMg
dG9sZCB0aGF0IERlbGwgYWJhbmRvbmVkIHRoaXMgaW50ZXJmYWNlIGV2ZW4gb24geDg2Lg0KPiAN
Cj4gU28gZm9yIGFybTY0IHBsYXRmb3JtIHRoZXJlIGhhcyB0byBiZSBzb21lIG90aGVyIHNvdXJj
ZSBvZiByZmtpbGwNCj4gZXZlbnRzLiBPciByZmtpbGwgaXMgbm90IHByb3ZpZGVkIGF0IGFsbC4N
Cj4gDQo+IEkgZG8gbm90IGtub3cuLi4gYmVjYXVzZSBJIGRvIG5vdCBoYXZlIHRoaXMgaGFyZHdh
cmUuIFNvIHRoaXMgcXVlc3Rpb24NCj4gaXMgZm9yIHNvbWVib2R5IHdobyBpcyB3cml0aW5nIGRy
aXZlcnMgZm9yIHRoaXMgcGxhdGZvcm0uLi4NCg0KSSBzZWUgeW91ciBwb2ludC4gSSB3YXNuJ3Qg
YXdhcmUgb2YgdGhlIGhpc3Rvcnkgd2l0aCBob3cgZGVsbC1yYnRuIHdhcyANCmFiYW5kb25lZC4g
VGhlIGRlbGwtcmJ0biBpbnRlcmZhY2UgaXMgbm90IHByZXNlbnQgb24gbXkgWFBTIDE2IENyZWF0
b3IgDQpFZGl0aW9uIGVpdGhlci4gVGhlcmUgaXNuJ3QgYW4gcmZraWxsIGludGVyZmFjZSBvbiB0
aGlzIHBsYXRmb3JtLCB0byBteSANCmtub3dsZWRnZS4gV2hlbiBJIHN1Z2dlc3RlZCB0byBtYWtl
IHJma2lsbCBzZXR1cCBmYWlsIHdpdGhvdXQgZmFpbGluZyANCnByb2JlLCB0aGF0IHdhcyBmb3Ig
aW4gY2FzZSB0aGUgZGVsbC1yYnRuIGludGVyZmFjZSBpcyBhdmFpbGFibGUgb24gYSANCmZ1dHVy
ZSBwbGF0Zm9ybS4gU2luY2UgeW91IHNhaWQgdGhhdCBpdCdzIGFiYW5kb25lZCwgSSB3b3VsZCBh
Z3JlZSB0aGF0IA0KdGhlcmUncyBubyBwb3NzaWJsZSBzb3VyY2VzIGZvciByZmtpbGwgZXZlbnRz
IG9uIEFSTTY0IERlbGwgcGxhdGZvcm1zLg0KDQpJIGNhbiBnYXRlIHJma2lsbCBzZXR1cCBsb2dp
YyBiZWhpbmQgYW4gaWZkZWYgYXMgd2VsbCB0aGVuLCBmb3IgdjIuIElzIA0KeW91ciBwcmVmZXJl
bmNlIHRvIGdhdGUgYmVoaW5kIFNFUklPX0k4MDQyIG9yIFg4Nj8NCg0KPiBJbiBhbnkgY2FzZSwg
aXQgZG9lcyBub3QgbWFrZSBhbnkgc2Vuc2UgdG8gcHJvdmlkZSAiZmFrZSIgb3IgImR1bW15Ig0K
PiBkZXZpY2UgYnkgbGludXgganVzdCB0byBtYWtlIGRyaXZlciBjb21waWxhYmxlLg0KDQpJJ20g
bm90IHN1cmUgSSB1bmRlcnN0YW5kIHdoYXQgeW91IG1lYW4gYnkgdGhpcy4gVW5kZXIgbXkgb3Jp
Z2luYWwgDQpwcm9wb3NhbCBvZiBtYWtpbmcgcmZraWxsIHNldHVwIGZhaWwgd2l0aG91dCBmYWls
aW5nIHByb2JlLCBubyBkdW1teSBvciANCm5vbi1mdW5jdGlvbmFsIGRldmljZXMgd291bGQgYmUg
ZXhwb3NlZCBieSB0aGUgZHJpdmVyLiByZmtpbGwgc2V0dXAgDQp3b3VsZCBmYWlsIGdyYWNlZnVs
bHksIGFuZCB0aGUgcmZraWxsIGRldmljZXMgd291bGQgZ28gYXdheSB3aXRoIGl0LiBJIA0KYWdy
ZWUgd2l0aCB5b3UsIGJ1dCBJJ20gbm90IHN1cmUgaWYgSSdtIG1pc3Npbmcgc29tZXRoaW5nIGhl
cmUuDQoNCj4+IEZvciB0aGUgdG91Y2hwYWQgTEVEIGN1cnJlbnRseSwgdGhlIGk4MDQyX2NvbW1h
bmQoKSBzdHViIHdpbGwgcmV0dXJuDQo+PiAtRU5PREVWIGFuZCBkbyBub3RoaW5nLiBUaGlzIHdp
bGwgcmVnaXN0ZXIgYW4gTEVEIHRoYXQgZG9lcyBub3RoaW5nLiBGb3INCj4+IHYyLCBJIGNhbiBn
YXRlIHRoZSBMRUQgcmVnaXN0cmF0aW9uIGJlaGluZCBhIFNFUklPX0k4MDQyIGlmZGVmLg0KPiAN
Cj4gSSB0aGluayB0aGF0IHRoaXMgaXMgY29ycmVjdCB3YXkuIFRoZSBpODA0MiB0b3VjaHBhZCBs
ZWQgc2hvdWxkIG5vdCBiZQ0KPiBlbmFibGVkIHdoZW4gdGhlIGk4MDQyIEhXIGlzIG5vdCBwcmVz
ZW50IGF0IGFsbC4gQW5kIHRoYXQgdG91Y2hwYWQgbGVkDQo+IGlzIG9ubHkgZm9yIGZldyBtb2Rl
bHMgYmFzZWQgb24gd2hpdGVsaXN0Lg0KPiANCj4+IEZvciB0aGUgS2NvbmZpZywgc2luY2UgaTgw
NDIgaXMgcmVxdWlyZWQgb24gc29tZSB4ODYgRGVsbCBwbGF0Zm9ybXMsIEkNCj4+IGNhbiBjaGFu
Z2UgdGhlIEtjb25maWcgZGVwZW5kZW5jeSB0byBiZSBsaWtlIHN1Y2gsIHRvIGVuc3VyZSB0aGF0
DQo+PiBTRVJJT19JODA0MiBpcyByZXF1aXJlZCBvbiB4ODYgYW5kIG9wdGlvbmFsIGVsc2V3aGVy
ZSAoaW4gY2FzZSB0aGVyZSdzDQo+PiBhbm90aGVyIGFyY2ggaW50cm9kdWNlZCBieSBEZWxsIHRo
YXQgc3VwcG9ydHMgaTgwNDIgaW4gdGhlIGZ1dHVyZSk6DQo+Pg0KPj4gZGVwZW5kcyBvbiBTRVJJ
T19JODA0MiB8fCAoU0VSSU9fSTgwNDIgPSBuICYmICFYODYpDQo+Pg0KPj4gUGxlYXNlIGxldCBt
ZSBrbm93IGlmIHRoZXNlIGNoYW5nZXMgYXJlIGdvb2Qgd2l0aCB5b3UuDQo+Pg0KPj4gVGhhbmtz
LA0KPj4gQnJpYW4NCj4gDQo+IE15IHBlcnNvbmFsIG9waW5pb24gaXMgdG8gbWFrZSBpODA0MiBk
ZXBlbmRlbmN5IG9ubHkgb24geDg2LiBBbmQgZG8gbm90DQo+IGV2ZW4gdHJ5IHRvIGVuYWJsZSBp
ODA0MiBvbiBub24teDg2IHBsYXRmb3Jtcy4gQWxsIGRlbGwgZHJpdmVycyB3ZXJlIGluDQo+IHg4
NiBzdWJkaXJlY3Rvcnkgd2hpY2ggY2F1c2UgdGhhdCBleHBsaWNpdCB4ODYgd2FzIG5vdCB3cml0
dGVuIGluDQo+IEtjb25maWcgKGFzIGl0IHdhcyBub3QgbmVlZGVkKS4NCj4gDQo+IE5vdyB3aGVu
IHlvdSBhcmUgbW92aW5nIGRlbGwgZHJpdmVycyBvdXQgb2YgdGhlIHg4NiBzdWJkaXIsIG1heWJl
IGl0DQo+IGNvdWxkIG1ha2Ugc2Vuc2UgdG8gY2hlY2sgaWYgdGhlcmUgYXJlIHNvbWUgb3RoZXIg
Y29uZmlnIG9wdGlvbnMgd2hpY2gNCj4gaGF2ZSBhbHNvIGhpZGRlbiBkZXBlbmRlbmN5IG9uIHg4
Ni4NCj4gDQo+IEFueXdheSwgSSBoaWdobHkgZG91YnQgdGhhdCBhbnkgbmV3IHBsYXRmb3JtIC8g
ZGV2aWNlICh3aGljaCBpcyBkZXNpZ25lZA0KPiBmcm9tIHNjcmF0Y2g7IG5vdCByZWJyYW5kZWQg
b3IgZXZvbHV0ZWQpIHdvdWxkIHVzZSBpODA0MiBmb3IgYW55IHN1Y2gNCj4gQVBJLiBOb3dhZGF5
cyBhbGwgdGhvc2UgZnVuY3Rpb25hbGl0aWVzIGFyZSBiYXNlZCBvbiBBQ1BJIG9yIFdNSSBBUElz
Lg0KDQpJZiBJIHVuZGVyc3RhbmQgeW91ciBzdWdnZXN0aW9uIGNvcnJlY3RseSwgeW91IGFyZSBh
c2tpbmcsIGluc3RlYWQgb2YgDQpnYXRpbmcgYmVoaW5kOg0KDQpkZXBlbmRzIG9uIFNFUklPX0k4
MDQyIHx8IChTRVJJT19JODA0MiA9IG4gJiYgIVg4NikNCg0KWW91IHdvdWxkIGdhdGUgYmVoaW5k
Og0KDQpkZXBlbmRzIG9uIFNFUklPX0k4MDQyIHx8ICFYODYNCg0KYW5kIHRoZW4gYWRkIGlmZGVm
cyBmb3IgWDg2LCB3aGVyZXZlciBTRVJJT19JODA0MiBpcyB1c2VkPw0KDQpUaGFua3MsDQpCcmlh
bg0K
