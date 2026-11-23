Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.55
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795466477;
	b=e+YPxAFzTj5raRrQQR4JYViT4PmbJLiMY/mp50Ky/LuxgDj2HeFs3lTU3+cAyU7eMUqK
	 eRxQ1T3nWJvedX5sC7o88Nm4RbtMm/Qg/6NKmwt7KYJ+oyBb8qgYDrIkP5PHH4U/I5sAh
	 MAvmjswT9RD3EqxQUwUTXTM37zB0NbASKxKG4AC6vp64zIcLymkRxpQOiaCyUDSSeI4FU
	 aDjyWGz5W+Gu8IiJijp+8p2qknBPWl6bizGU94Nts5kaL2U2NKRWACzhAYPeeDbYUJyDk
	 QhOGnOxBdlWKq720GtQoxZqevTkFB9ikse6VJOWngH633xX0pcABowMPDi4RPrtQdeA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795466477;
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
	bh=kEMIVHQBUkr13vfnNFbi4z2M/lRUoJC9eld+4LIS1mY=;
	b=hzYwkw3cyw6khanMuD7Wd9B3mThCrn9wKMbPeFeV7ehG+681krbetAGyJU1TunL1XcRt
	 2sRzYY7Ndrtg/jTtGvwiX/GXGSmw1tGUtFEjXm+qZeOmXlJ8tBz6yr8wCj45JPuThXG59
	 eUADbA7ye4LdDAUM8lsjM6gCPioEFfl+NMdJIPFFBtTvLYe7O9rnMlu1msozAOAChS6/I
	 4vKqB4dhiPZ+4d96UmbXaqYPFbov7uQopvZ4QKNVbglucmTzHYz2W9787pIptLsa5FaE9
	 jSZvUhwhYInHzflDCeLWodVwlknyZtWZvFTeMCHPQzJnlYEV1ixl2qQeiVZr7rjnf7g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=UPfDDZt+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.55
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012055.outbound.protection.outlook.com [52.101.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A02606A321;
	Mon, 23 Nov 2026 20:41:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01A02606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=UPfDDZt+
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ql7SLoFnhCMb+xbUm+K/XKapHGMjIrpL96UnerHBAmPF4iLm74VUNiu/NibTWj2vs7Jn8f0VofggFoNnt0pxiTCO+TI55txjKW5cr9ZYqDkk/dMP6WWoACfldky0FsrNN6BFP3autV3LIOFtnBAjzHDprl2q10vcKS+8P2lxj81p875Cmu5aTkUXXlK+Jd5+0FJHS4moitm0aj9h+diSwF62AlLmRRl4BCPfneDSC2VTMxTeZ9GalP2WOOBhMljhV41yVEb4rTbvdLdCCSopaGMq1Bc0PVw7PiWWEtrvsfdWd8O4TQi3xWWx3dq4rq6MQPDWVzAlPb3E2uvBGeTrug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kEMIVHQBUkr13vfnNFbi4z2M/lRUoJC9eld+4LIS1mY=;
 b=iozK042RJKtarqpTf/koqF8JXWeBDszx93kfNznYJLe5XjQqVxUSuhKqNZ1eB2lmBUsG3fXfv01ji7gSbv9Vf7jUM+5mfc+4b8H88weF8071a6Eh3gV6/u6hiT0gcIKeGtpo5EOWoJ4q6+RUH1X6vVgniS1BWahX+2yJwxzngLhhznKDVQ7iVCulCNXFxoELZSWoUzAEBJiDFcO+GE+ZKW3zNpOGutnVNj1LOpjNpP+Dpwi63ToIlVReFhkY2wgR3YDcuW5qtPF7RP4S/xHQ9Mz1BH43cTaRDk6sLuPTZDZ0VZpv+HMHkJI14soZxZ9PBqLkop53RJiIISd73csTWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kEMIVHQBUkr13vfnNFbi4z2M/lRUoJC9eld+4LIS1mY=;
 b=UPfDDZt+QcV0krSMaae1CFnmidZjbVAIQou1YXQG79vkn7e2jEl17o32s4mRauMrEQr/1bbxQIlwOCNihcH00uCGS1UJIYzlpXcu5l5P0ojP5wS9qhD/u2tLiFZvzm2XOc3d5WtMU39Wn2tDAcOcK+coEt+B6V/MNIhdMhAoiOrdvn7dhX8kplVKw/GfsJsN/gPSqg0VLOPFnZ/YM0NFxEQBvCfXe7PcW4GN1gdJBMFzs0E25SSB8S1FSacGtLEaMZAHALVHBYyMVaJGQBqB0TfQEcijCC/02MwrrvGiLoOd6jOa6bn8y3XOV45w0uSN3Y+PFnS7qza18+vgBOkE4w==
Received: from MN0PR12MB5786.namprd12.prod.outlook.com (2603:10b6:208:375::13)
 by LV1PR12MB999306.namprd12.prod.outlook.com (2603:10b6:408:3f8::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Mon, 23 Nov
 2026 20:41:14 +0000
Received: from MN0PR12MB5786.namprd12.prod.outlook.com
 ([fe80::ae61:c9b4:847b:4854]) by MN0PR12MB5786.namprd12.prod.outlook.com
 ([fe80::ae61:c9b4:847b:4854%5]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 20:41:14 +0000
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
Thread-Index: AQHdeUxZSHH0y3AHX0KMIS92REQ5Gbc3sXIAgARYswCAAAfwgIAAEUYA
Date: Mon, 23 Nov 2026 20:41:14 +0000
Message-ID: <60e6e274-08e1-4cec-a98b-379dec343e8e@nvidia.com>
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
x-ms-office365-filtering-correlation-id: 5c895a93-1b3e-4dad-08d6-08df49a21df3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|366016|376014|23010399003|6133799003|18002099003|22082099003|261009223027099003|261021135927099003|261021121427099003|261021130227099003|261021123027099003|261022105027099003|261026130827099003|261102123227099003|261026121527099003|261026140227099003|261022075727099003|261022115727099003|261022113327099003|261028144727099003|56012099006|10067099003|38070700021|4143699003|11063799006|5023799004;
x-microsoft-antispam-message-info:
 HnWy+WdyqU5o+5yRcnIztp/QCDwtQjXxdoIkLD+ZlzcYKwZ2imLe7ErFP+wiPtxr2FPtE2od6AFvHPyXJkP5ur5WRvCKSsWo+fi+7DHc59OYQla4395B1B+CJ3Au6djnJUEKhA8c6UQgUlQQXfvHoh10ApqWCO8uz4ZeFTOidkDPjQBytXg19eWG4hQoMW8p5kCzxToGkLUDMxMSvXbm7zrDtnJS9HCcBFykOixgSn6NPAMsvYJJd1C140EZ4UgAkyrbxo7mdU38wJpjZO9Xo57px4sou+IpwRRpAxXvOqTWLdIEWGGL86pbgc5eWF8Om1/SIx8x/oYVwRT2ORFvl+D+iYVqxshSfm0KS+XMQxP1qbURcQOn2VcePYw2UVQLi+BTNUe3Vw41lTkkgxKbGWGYSoqZpPQ1pkbxWw8Ym9QgSyExYlHs7nhnXgZTZ2FVb88uzhccTh3dv9q1DHgJa1rRjdO8G32q9X0pqd/06Zy8IpEBXDWo9Vv20zGi8EjocqkWLEBFhf9Sgr3ELSMYzvi1oN6QCybRaBgvUnBaNn0qafJFswaSXhox/9XWlMNYD8oGlano0WMIUuxwZLMmUmRsoCnazOqJT6sFWAtXDzrJ09w3iFAdrkYBDScPd6h8KWnQa1SGlYi0mZmcZGmunqf+0E/yMYOQAnMVnBaGPTOmu5ari0Gweri/LP0FSECOSv12oiL9GMyZblrM1nbXKg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5786.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014)(23010399003)(6133799003)(18002099003)(22082099003)(261009223027099003)(261021135927099003)(261021121427099003)(261021130227099003)(261021123027099003)(261022105027099003)(261026130827099003)(261102123227099003)(261026121527099003)(261026140227099003)(261022075727099003)(261022115727099003)(261022113327099003)(261028144727099003)(56012099006)(10067099003)(38070700021)(4143699003)(11063799006)(5023799004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bUowSy8yOUtoM3FGNlFzazJxdEcrY01USjlEQ2dNendvOXVISXY3a3JZL2ZP?=
 =?utf-8?B?K0NqUktnOEhJaXJBMlhSNE1tSnR6MFIzN2RCcHVKbTZHb3BFVngwVmYvYXg3?=
 =?utf-8?B?WDlnUERJLzA1dlVWd1FPYTdVa0JYTTJWTVNuNTExTHlaSlVnbTRFSDNBVmRa?=
 =?utf-8?B?Q2lJR0FvR25OeWEyV2NXMVExTDJYbGxqMVpzczJrZGpOa1hhcDVYeVdySy9v?=
 =?utf-8?B?M2diZ3RHeEFISk53U2VhcTd1U2tUbkRxMHIzWXRGbTAvd3FuS0ZTbSsyR2F4?=
 =?utf-8?B?NVgvNTRTazJJTTd6RERUVUlnUnluT08vNEgvYlovRUxTUXNaN2x5emJiUUFz?=
 =?utf-8?B?TmhMd3FPbk0zbUxKVzNVOFg4dlJuenVRVlkxR3JCenlVZ2VjcVdVY2lPaTl0?=
 =?utf-8?B?OVV1QTZjWE0xWVhkMStRZU5GajlPenVUMTR4SHZDRVBYa2xWejQ5QlN4R0Y4?=
 =?utf-8?B?MUZpbHAzYTllL3BuNnJLMlJ6T3crR0FOc2cxZnpxaDFTaFI2QmFuMUhaS0Zy?=
 =?utf-8?B?U0MvSytYOHhMbW5HTEFKczM3K0tOcDR1UUd0dkZ3VE5ibHNUL0hsSEVNK2xw?=
 =?utf-8?B?bzI2N3FjQVJSck1nSlZHYXplRVY0WHd5M1pnMG9OZ003UEk5ZjJoSWl0ZGVM?=
 =?utf-8?B?NWVubnl3dTJlQTYxbVgvZldRdmZBQkJzS3M3aGFveGNFVGxiVjhNaWlkdHFk?=
 =?utf-8?B?UmJMSFllQlBBeGc5UkMwMkZWekJBTUJQOTg4OEhiVlFLKzFySWhIbzhJRTdO?=
 =?utf-8?B?YmJvdTV3RW1Vd3JubVlmQlVsWUZtWWtySUtGUld5R20zbzU3MzhHYzFDYk1l?=
 =?utf-8?B?TTRIMmtBUVJSN1dMQ2Q5ZG5hKzViVDlQOEgwVnVlaHhkcms3TUU3Z2d1K1kv?=
 =?utf-8?B?dFppcTRWMGRhLzNvTkpoTGY5Y3hhZW9ZM3RabnhLcTJPaC93TXBGUDYvVXJt?=
 =?utf-8?B?aWN6NURTSUZSY1JGUDVIdk12TkgxQ3h0R2lhaVQ5YnB4ZTBoNFVydUViTGJj?=
 =?utf-8?B?RTVwSk5RTm9XdDl1bzVraVpicFN6ZllqNzVQcWltbUpvNmxzRlFDTkNBOTN6?=
 =?utf-8?B?eDRsZVpHN2dINWU1RStYQWJVQ3pUekVHSUlWSCtPOVdLWWJ5MCtnWFZoc0Qw?=
 =?utf-8?B?L2h6STQvVjZxZTd1RjhFUWMweUJSMDJFVmVDSWszZUUzcUJnaFkxbjl5Y2NF?=
 =?utf-8?B?RWpPZUxNbUFLck5RTTNTL2QyUXhocFhYeGhkby84a1dYdGMzdHp6ekFTcEtU?=
 =?utf-8?B?cHBoNm9ZWXJIV3dTVnRTeE51RXZNR3hod0t0eG1ZSU9XcDVzTjJtdzlNWVdl?=
 =?utf-8?B?SUN4Q3k3MUlQZlFnRzlaUHUzaHdhSjJCS2RVVnIvbWxVR3NLWGJvbHFtd0w2?=
 =?utf-8?B?anl6dFNRZTJROUswVTVKdVNaN0JIYTd6VkkvUWd5MG9oN1R0STNLZmdyV2Jn?=
 =?utf-8?B?bFZWcXRnQ1RraWR6MXQ4Q1hDZDdNbXRMeTFYR0drd3M3V1JoZTB2U0J2RUJ0?=
 =?utf-8?B?dllGOGo1L0RVRGR4ak1Hd24remZUS0dwaUIrOE91UXFNdHAwZ3FpUkI0cnYv?=
 =?utf-8?B?YndUMjlWN2xBYjIzRmswZmpDdk1ReUd0ZWx3enowdDhiYUZIb1h1VzlZd0Mw?=
 =?utf-8?B?c0VFNXpIM0Z0SmlneWpQNUhkd0xoVHhrNHJqSlBWRDk5SWJWVHd0ZndJZlIx?=
 =?utf-8?B?dzFicVNQLzNnSEoxek9EYS82NFR3UUdOSlZQZlh3U3JyMExPRDg0OGJCa24y?=
 =?utf-8?B?YnZXRzBYK2twdFJtUDBWQTIzOTc4V01tdUNMNFJTcnZ6ZVM0aFdSMDEwODM1?=
 =?utf-8?B?TEkrUDR2TFhCVmdoSGZpa2JjNUs2Z3hFd2hhazljMFVQRjJ0UW5rU3daN3hn?=
 =?utf-8?B?ZkVqSkk5Um5YalE0TVZIKzV3K2ZlRUR5M05qdDU4cFBOUkg4OHBXb2NtNy9Z?=
 =?utf-8?B?QjFtNEt5L2pLaDFNYzN2ZC84VS80dFNEcm5vOWdLN3FkSEZtMENvc2pjUHkr?=
 =?utf-8?B?NGZRZE9JRzcwdjZ3VXJ2bGFCZWV3KzRScllxL0xDa2NkcmtXY0ViWUI3Y1hi?=
 =?utf-8?B?djBpMDFIQS9pNXFCVks2eVJ3MFVscWFFZUMyMGIrU292KyswYmRldWFOdUJR?=
 =?utf-8?B?b3I0dlp1dnhKYkFPQVUwUVgrSTFQV3hvV290Y21jL0dWM1hnb09jZkRkaWdm?=
 =?utf-8?B?VFZybGZYcUhOR2lEWEZsWmpZaVNJelBCNUQ4WVJrSUF4eHFFTWJySjM4b2Vk?=
 =?utf-8?B?ODlCakNSNklxb0FtMkMyVCtuNktMdk9YTU1xSm9tWUt6dTFWeXlhSHJGeEJx?=
 =?utf-8?Q?T2x9HeE4elbl/GwCnd?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <609E712808EFCD459CC5D8691E742491@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c895a93-1b3e-4dad-08d6-08df49a21df3
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2026 20:41:14.5701
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hH15e7XAEJqXc7ydM4rLi/pK8BLT3BvN+WlhjfMcCSckqsMq31jSYzv1bdsdYzDu
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
Z3JlZSB0aGF0IA0KdGhlcmUncyBubyBzb3VyY2VzIGZvciByZmtpbGwgZXZlbnRzIG9uIEFSTTY0
Lg0KDQpJIGNhbiBnYXRlIHJma2lsbCBzZXR1cCBsb2dpYyBiZWhpbmQgYW4gaWZkZWYgYXMgd2Vs
bCB0aGVuLCBmb3IgdjIuDQoNCj4gSW4gYW55IGNhc2UsIGl0IGRvZXMgbm90IG1ha2UgYW55IHNl
bnNlIHRvIHByb3ZpZGUgImZha2UiIG9yICJkdW1teSINCj4gZGV2aWNlIGJ5IGxpbnV4IGp1c3Qg
dG8gbWFrZSBkcml2ZXIgY29tcGlsYWJsZS4NCg0KSSdtIG5vdCBzdXJlIEkgdW5kZXJzdGFuZCB3
aGF0IHlvdSBtZWFuIGJ5IHRoaXMuIFVuZGVyIG15IG9yaWdpbmFsIA0KcHJvcG9zYWwgb2YgbWFr
aW5nIHJma2lsbCBzZXR1cCBmYWlsIHdpdGhvdXQgZmFpbGluZyBwcm9iZSwgbm8gZHVtbXkgb3Ig
DQpub24tZnVuY3Rpb25hbCBkZXZpY2VzIHdvdWxkIGJlIGV4cG9zZWQgYnkgdGhlIGRyaXZlci4g
cmZraWxsIHNldHVwIA0Kd291bGQgZmFpbCBncmFjZWZ1bGx5LCBhbmQgdGhlIHJma2lsbCBkZXZp
Y2VzIHdvdWxkIGdvIGF3YXkgd2l0aCBpdC4gSSANCmFncmVlIHdpdGggeW91LCBidXQgSSdtIG5v
dCBzdXJlIGlmIEknbSBtaXNzaW5nIHNvbWV0aGluZyBoZXJlLg0KDQo+PiBGb3IgdGhlIHRvdWNo
cGFkIExFRCBjdXJyZW50bHksIHRoZSBpODA0Ml9jb21tYW5kKCkgc3R1YiB3aWxsIHJldHVybg0K
Pj4gLUVOT0RFViBhbmQgZG8gbm90aGluZy4gVGhpcyB3aWxsIHJlZ2lzdGVyIGFuIExFRCB0aGF0
IGRvZXMgbm90aGluZy4gRm9yDQo+PiB2MiwgSSBjYW4gZ2F0ZSB0aGUgTEVEIHJlZ2lzdHJhdGlv
biBiZWhpbmQgYSBTRVJJT19JODA0MiBpZmRlZi4NCj4gDQo+IEkgdGhpbmsgdGhhdCB0aGlzIGlz
IGNvcnJlY3Qgd2F5LiBUaGUgaTgwNDIgdG91Y2hwYWQgbGVkIHNob3VsZCBub3QgYmUNCj4gZW5h
YmxlZCB3aGVuIHRoZSBpODA0MiBIVyBpcyBub3QgcHJlc2VudCBhdCBhbGwuIEFuZCB0aGF0IHRv
dWNocGFkIGxlZA0KPiBpcyBvbmx5IGZvciBmZXcgbW9kZWxzIGJhc2VkIG9uIHdoaXRlbGlzdC4N
Cj4gDQo+PiBGb3IgdGhlIEtjb25maWcsIHNpbmNlIGk4MDQyIGlzIHJlcXVpcmVkIG9uIHNvbWUg
eDg2IERlbGwgcGxhdGZvcm1zLCBJDQo+PiBjYW4gY2hhbmdlIHRoZSBLY29uZmlnIGRlcGVuZGVu
Y3kgdG8gYmUgbGlrZSBzdWNoLCB0byBlbnN1cmUgdGhhdA0KPj4gU0VSSU9fSTgwNDIgaXMgcmVx
dWlyZWQgb24geDg2IGFuZCBvcHRpb25hbCBlbHNld2hlcmUgKGluIGNhc2UgdGhlcmUncw0KPj4g
YW5vdGhlciBhcmNoIGludHJvZHVjZWQgYnkgRGVsbCB0aGF0IHN1cHBvcnRzIGk4MDQyIGluIHRo
ZSBmdXR1cmUpOg0KPj4NCj4+IGRlcGVuZHMgb24gU0VSSU9fSTgwNDIgfHwgKFNFUklPX0k4MDQy
ID0gbiAmJiAhWDg2KQ0KPj4NCj4+IFBsZWFzZSBsZXQgbWUga25vdyBpZiB0aGVzZSBjaGFuZ2Vz
IGFyZSBnb29kIHdpdGggeW91Lg0KPj4NCj4+IFRoYW5rcywNCj4+IEJyaWFuDQo+IA0KPiBNeSBw
ZXJzb25hbCBvcGluaW9uIGlzIHRvIG1ha2UgaTgwNDIgZGVwZW5kZW5jeSBvbmx5IG9uIHg4Ni4g
QW5kIGRvIG5vdA0KPiBldmVuIHRyeSB0byBlbmFibGUgaTgwNDIgb24gbm9uLXg4NiBwbGF0Zm9y
bXMuIEFsbCBkZWxsIGRyaXZlcnMgd2VyZSBpbg0KPiB4ODYgc3ViZGlyZWN0b3J5IHdoaWNoIGNh
dXNlIHRoYXQgZXhwbGljaXQgeDg2IHdhcyBub3Qgd3JpdHRlbiBpbg0KPiBLY29uZmlnIChhcyBp
dCB3YXMgbm90IG5lZWRlZCkuDQo+IA0KPiBOb3cgd2hlbiB5b3UgYXJlIG1vdmluZyBkZWxsIGRy
aXZlcnMgb3V0IG9mIHRoZSB4ODYgc3ViZGlyLCBtYXliZSBpdA0KPiBjb3VsZCBtYWtlIHNlbnNl
IHRvIGNoZWNrIGlmIHRoZXJlIGFyZSBzb21lIG90aGVyIGNvbmZpZyBvcHRpb25zIHdoaWNoDQo+
IGhhdmUgYWxzbyBoaWRkZW4gZGVwZW5kZW5jeSBvbiB4ODYuDQo+IA0KPiBBbnl3YXksIEkgaGln
aGx5IGRvdWJ0IHRoYXQgYW55IG5ldyBwbGF0Zm9ybSAvIGRldmljZSAod2hpY2ggaXMgZGVzaWdu
ZWQNCj4gZnJvbSBzY3JhdGNoOyBub3QgcmVicmFuZGVkIG9yIGV2b2x1dGVkKSB3b3VsZCB1c2Ug
aTgwNDIgZm9yIGFueSBzdWNoDQo+IEFQSS4gTm93YWRheXMgYWxsIHRob3NlIGZ1bmN0aW9uYWxp
dGllcyBhcmUgYmFzZWQgb24gQUNQSSBvciBXTUkgQVBJcy4NCg0KSWYgSSB1bmRlcnN0YW5kIHlv
dXIgc3VnZ2VzdGlvbiBjb3JyZWN0bHksIHlvdSBhcmUgYXNraW5nLCBpbnN0ZWFkIG9mIA0KYWRk
aW5nIGlmZGVmcyBhZ2FpbnN0IFNFUklPX0k4MDQyIGFuZCBjaGFuZ2luZyB0aGUgZGVwZW5kZW5j
eSB0bzoNCg0KZGVwZW5kcyBvbiBTRVJJT19JODA0MiB8fCAoU0VSSU9fSTgwNDIgPSBuICYmICFY
ODYpDQoNCllvdSB3b3VsZCBnYXRlIGJlaGluZDoNCg0KZGVwZW5kcyBvbiBTRVJJT19JODA0MiB8
fCAhWDg2DQoNCmFuZCB0aGVuIGFkZCBpZmRlZnMgZm9yIFg4Niwgd2hlcmV2ZXIgaTgwNDIgaXMg
dXNlZD8NCg0KVGhhbmtzLA0KQnJpYW4NCg==
