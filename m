Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.38
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795466418;
	b=WAPo7BLLURCS9kLtsrRg9o4jJzA2wtu5eSQ9lpXxO/AGVn+41v4PYJzl7REX0WgHoaYe
	 0bseB5NarAY5ktW7IglhEkuhVHz2y5OtXa3xM0ClmW/g12ed6KC3juvs5ZFCI6RnYL/Yn
	 tYGDaebfCA4fN5VasTbFYukHg2s+bld79LU4TkOdZhjWT2eBFZ7abboJvwpK1SaXbAiAk
	 goZ2NlTynARCa6rnN2tbobH0dkt5LunvYjyEvgVCtXXzohy+Gc4bMKluQ7z+4AifeLdry
	 HxIeuwEz50UOK/4QU2EJxZq9bznfhMWETvW9otxdZZJSDhwU/gAyQju47b5bNw80EKA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795466418;
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
	bh=PWEz3inD1dZEW/srZfpdaKHzuw35361wOPsQvwITK6Y=;
	b=biAp37Yxup/Pm46tUgxd9q/PBrJLknE2vEiwq41/CIOufvrcDAcjau7BYtvcrJegaYxi
	 XMI0z9WxdjVrx5jAZfU8u3oePsHvNchvQQXAIu171Cqb/AtOMaMWMKrxI0FaQNWp+QQjA
	 m9TwJ/JX13yFz+0DaXiUbSvBaYiKOh9YCSotdLnbA5EvhF9/b4eIjlX9kso3LqGGGh5iV
	 sS6bioT5anRMpkc90eLDjglX513ElxUu3HzdaDXglJf2weZCc+gVKNbY5UNKhn0XHYIZK
	 iE7qxv0MXw5zgiYAhz6yTtwK+J/SAM62iJqiiMV/mYCAIFaj+rOiLDwfAS/hRH/5hQw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=jmUmhKTb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.38
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013038.outbound.protection.outlook.com [40.93.196.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A18606A321;
	Mon, 23 Nov 2026 20:40:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81A18606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=jmUmhKTb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bWgmOWLQg0t75RBCyTd1dgv9ciy0f1voUca0T0mk4I3wI59QPP6J1k9Xb/wUk3XL5c/hbeezxUa+NsJ7wAXuQ7LH2DH9I17XH8f9gPHW8+mz6JVpf7FtaNTz47T66Ql91rpZucfehITtIJ4G9JOd7uXtkruPfVfQOUujBIMgGAfqsZJqNYQjHl1CrRK5jNsS5p3VqMqj0YDtJESroLqXQ4Q3/UmCMiwmXPG1dwbxdh09IKkOiDIpa5+zudku9TlDmIXwDd0PBWGpCnd7aP9FIiRhm5q2krqoMjdh5d4I0PB/Xeurm+FCikNfWlpW/abpZS2fZSxEXUvgcyqeWKTKzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PWEz3inD1dZEW/srZfpdaKHzuw35361wOPsQvwITK6Y=;
 b=uTOfif8G2xfysIwloWd2D0ifZXlM4ypQzptmAMB4DK/IlxppcUvHl+5Crydp2TM/bEZo0SjLt2RAGCtxf/oK9cqhWD4b6NYGHwjV5LOMaTTNkGsN4VsZaD05DviWUAS+h5KGz7UmVCTMCy8gk+Y/tJevCicEw5TbuLyG2TH/1RDeI0Jii52CyGexbnvwvu1XtQpYv3TYmCOp5+F/NC6g9aPvO77ryzRwXJjjQhEWuba7XWZiuL58mkiQnSpUjXQrX+gPo3P43/76ykPBKGLPYvZuPfG6EKmeEf60iWGiiwMvD5T0L5eo7fv7HUkoBpzwjfbL2wkqx0qoF5IlMXbccg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PWEz3inD1dZEW/srZfpdaKHzuw35361wOPsQvwITK6Y=;
 b=jmUmhKTbb24q4lmXPKfbnZkB4BreGgdhnCKmdZ9WFrqUVegirg0/B6dVWoWqDDyhZrE9A1wbypyIm6MVZMpLU9N7S81+dv97Ka/XwBqUZxaWEqg+4r7+Sd44fflZDCEtoik7HsERWnjVmjchuWBtcwMHk6C36QywC+B0e+xP7fQaE/IO7DntCPs869+sW0n1a0UjnKL5j1GZ/y/3CI2ORiBbmbOmCMXsUMfEVIkMy0qIl7Mc3WY13rWTm6ASRzuyvpuGnp/lLubIAhg77dI0++pxjukRVLQ+dBZhCo8AbgIC24hWo0rZNiKkaH2e/qF6c0VpHOuSQ1JJaAM6LH8opA==
Received: from MN0PR12MB5786.namprd12.prod.outlook.com (2603:10b6:208:375::13)
 by LV1PR12MB999306.namprd12.prod.outlook.com (2603:10b6:408:3f8::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Mon, 23 Nov
 2026 20:40:14 +0000
Received: from MN0PR12MB5786.namprd12.prod.outlook.com
 ([fe80::ae61:c9b4:847b:4854]) by MN0PR12MB5786.namprd12.prod.outlook.com
 ([fe80::ae61:c9b4:847b:4854%5]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 20:40:14 +0000
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
Thread-Index: AQHdeUxZSHH0y3AHX0KMIS92REQ5Gbc3sXIAgARYswCAAAfwgIAAEP4A
Date: Mon, 23 Nov 2026 20:40:14 +0000
Message-ID: <6f41dd24-c421-4cb1-9995-ed3c2b7a956c@nvidia.com>
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
x-ms-office365-filtering-correlation-id: deac8f49-aa23-4559-2a39-08df49a1fa10
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|366016|376014|23010399003|6133799003|18002099003|22082099003|261009223027099003|261021135927099003|261021121427099003|261021130227099003|261021123027099003|261022105027099003|261026130827099003|261102123227099003|261026121527099003|261026140227099003|261022075727099003|261022115727099003|261022113327099003|261028144727099003|56012099006|10067099003|38070700021|4143699003|11063799006|5023799004;
x-microsoft-antispam-message-info:
 adR3GeQ43IbvSXjNlAG6uZbXgD/jCmlpYvJdCNOqzHIrPuPjzr/0LxUSz5erOPgZCSdp2ju4bh/AN8Oaxq8vbLshsR+aEg5wB2AvlDi/WKEj1eON8vwJBRxbYajAgJxiheFc8YKrf+NbERXLjKqWZpAwIxIdDSvEcgpO3Voy1qc9tF1NCG0HoAQMQ/ITpsW6uFHBeSbKxSbrDydf2nBK1XWEGOKYHfnAlXz+Uyp9vmaCbrsIb4b9lPcyqraAuyHhws2foEzmg1D5pA51ViLKSuXV2x1h9S9k68g/fe8nWoXAqGrCLQznBxqog+v6ga+SGUERPqIN2RFzEtdrl2/Va+w/U+CBgjUyNfDfRn81Er09NccD7oH3DAQrbDQ7WEIoKRHFcWhKTWmQOr/9jgapILVjdOxK9/zl8G7iRJ/l69aNA6Ob7ZcRpBiF28GZJm0jOETQYYSgs8H/hrJ/kh/Ta2xM5D/n71V0c48rOsFBSlOV595nUUSn+coDUtn21eOUuS2RDewBbIUby1hPEO4P+li4ywKjq4vDpPOOHZRA53vdR/JxLyYI2DHiAC79UPC0PumVLOVesyzGc1V4PSy4EkSNte+07roxOrfyh1x5PJnzwvjMJW8fYteqNXH9c9gAsTNXPkcYH8YCvSuBgccoK/S/wFfNqAj6D52j1DchdotC+ETmCLqb4gBwm0saVHoQRZQnKRSUTOOavCwxVaTv4A==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5786.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014)(23010399003)(6133799003)(18002099003)(22082099003)(261009223027099003)(261021135927099003)(261021121427099003)(261021130227099003)(261021123027099003)(261022105027099003)(261026130827099003)(261102123227099003)(261026121527099003)(261026140227099003)(261022075727099003)(261022115727099003)(261022113327099003)(261028144727099003)(56012099006)(10067099003)(38070700021)(4143699003)(11063799006)(5023799004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dksxemVRWUVtVFpFb05hYTJibUZqUVhTZzFwd3dqMndwczhBTzNXaXVZaVVI?=
 =?utf-8?B?SWk1MWVGME5zaGdEV3k1QUc3UGRSSzZMS0dmaXhTbjFiQTNwdGVQcWNmczFT?=
 =?utf-8?B?ajYxTzJMTnp4Y25tM0ZLQlgwT2JRaTlBRnZORXYyNFo2NHNnb2hQN2RuTTVh?=
 =?utf-8?B?OTkvUkpWVElnR09DK3ZjQ2VVS1ZMMlE2cjgwMmxnM0RnQStlckdXY2h4L2M0?=
 =?utf-8?B?eEExaWZ5Wk50K1JoMktBdVdhKzR1Tk0za0V1OXZFN0xkOHE0Ylg4eWlmZEJ5?=
 =?utf-8?B?TkpuOHhnUDdiWEpZVEFBOEtsMDRHOWEvQk9vWURyOVlxKzdsWjR5NURhTzQr?=
 =?utf-8?B?dzVFVnRXMnJLb1RNakNJRlpybEZIWW5GMUlmWDJOZE05V3FBNlRGb3N1Nlh5?=
 =?utf-8?B?TDVTNjNOdlVDUjY5K3QzUmRWUkRqS0hxSHpMYjlrY1J3QWZyN25oT1gzOXNP?=
 =?utf-8?B?czdob3hsNmx6UnVJbVIzWGo4ZzdGSGtyVVZOaCsrQUN0VHdKYlQ2Qm0rMzRX?=
 =?utf-8?B?Wmt1ZHVZd2ZnM1hXUEZ3MW1ZUXovYkhrTzl6UjBnN1BpZmtPVWdvT2hJSlQ1?=
 =?utf-8?B?MkE1YUpNdUN5Q1padTJ3MzQyT25BSzlBZE1GTlhZZFR6cEVoWHZzcHlhTWw5?=
 =?utf-8?B?UXRBUlFCanJZK2lmWXB5dDRXbE1XL2JJdnlyMzVmYk42U2NseU1pMWZTR3RY?=
 =?utf-8?B?V0pOWGt6UitqM2V0OEIxS3ZIVTgwYjROTzZzcTRaVkcrU3dZOHdOaGQycm14?=
 =?utf-8?B?c2xMTFBrN0dxQjBjTGFwdkhBTDkvMmU2YlRjVlozejdWWVhaSmJwbWVLcnYr?=
 =?utf-8?B?V1dvT2NzdnVJeWpCN1pDQk5Fbk9uaFQ3M1FGM3I3a1hvOWZvUWNtamt6MXRu?=
 =?utf-8?B?VUdja1VudFczajVhellhd3NreHlmenZHR2xMVkxGWnRzRlVGemhnYVJyZkk4?=
 =?utf-8?B?MGVZZ0JCTkFvSVRvVmhrZy8vVHJQeW9xenZTaDE5SkV3N0srbnFXbnVQSEVu?=
 =?utf-8?B?alVYZTV0d2N0Z29mZTcxTGswM24yWDhuVTdmTVV1a3FYem1zcE0vcjlRSSth?=
 =?utf-8?B?K0UwTFhvMHdpbTlYcUNpQ2lRTzloSVV1cEhTSWtNaEhFS3dUSmYvWHE5UVNG?=
 =?utf-8?B?cHRLb3czNUFhZkp0YzJaRkp1Z2RnSzA1Zk5BY3dqTVVQRGRIM2ZIMnYvalps?=
 =?utf-8?B?Rk9PczUxdHNpeW5DVVRsRGo0S2ZhWUY4NDVuU1o0WkFRZ0ozaUFzY2N4WXMz?=
 =?utf-8?B?eFUybGZGVU9RQUVXL2VkWmRLVlp3dkN4a09KbnE4MHZpZmM4NG80VVRLaGdN?=
 =?utf-8?B?S3MveE1HREhrUzBRWHFYeURIN0ZYWW5HT05GckVrMlZ5M3A0Z0dDbkNuSkll?=
 =?utf-8?B?aVRtTmQvT0FyYjhoWllqRUE1TjFsb3U3NWgyeUVYUTFCY0pseU9KWWliS0Y3?=
 =?utf-8?B?RXlQcTVCOGpHK3R5anFDbittZERvWDZYTEt6OC9FWEZxcy9TZXE3YlpwMnpL?=
 =?utf-8?B?anVIZURpNEcxSWUwUGdDbCtETDFZT2xrWjZkL01ZNkV2S2lIYnIyLzZlOVBp?=
 =?utf-8?B?UHVvMXhRK0NDUXU0Z2VNbUdFMjJNOHRWWVRtLzAwekNBMzgzV2N3VWhJeDFT?=
 =?utf-8?B?ZjhncVphc0M2T3hyR3diNGhNRFhsTlZlR1pSY3hCT3UweTZwQWN5U3MzWkxk?=
 =?utf-8?B?dDUrSFdqelNacHI4dkwrYjIxWTFSZldHUG4xWWc5RE83Y1Z0blN4N0h6SFlq?=
 =?utf-8?B?elhQM24wYUxtaE1VRmNjYnl4Y0Vha00rWUhOWnVlYU51eStGd0txdVJNQzhB?=
 =?utf-8?B?SUVvOFkxTG5IZ0ZxZmxPT3pXNUtKU0JKNjYyb0lCUDhWS0dGNlZxWWEyTEpV?=
 =?utf-8?B?QmhqUTNvRGN3bWJUVWVMV3dlTW5IVmh2Smpna0VtNkhDdnYvUVBFcVJ2Y1Bp?=
 =?utf-8?B?R2pvZ2lhY0lCQWtOcGhtc2tRdllCQkdHSTNqNDI0ZDZzbjNtT2UxVDhJeFVh?=
 =?utf-8?B?T3lRQkllU3U3T2xoQlptUWN3UWNxWWdVME1GTTdiYXhNdjJUUGIrVG5NY213?=
 =?utf-8?B?UnZsbmpocENFUjJEWnFNMDFMZWxuMXVFeU4wNFdvZ3BkMUx6VitzMTFEL1RC?=
 =?utf-8?B?azBkNGtZYUVZR21jZnBWZDRaTHVjdGdWWW16TlZWT0NwZmhmVGNwWGNmK1hM?=
 =?utf-8?B?OUpSbDkzbGpoRXg3elFGWlVsWEQxRjh5ZnVGd2pIOVVPR1dpdkVGRUlTR1Z2?=
 =?utf-8?B?QUpadlJJTjRYcnI5MkVNVDJzczBCaFk3NG5rOG1oR2pBMDgzZHNvV01DNkh1?=
 =?utf-8?Q?D8ZuBcO/Cfh+deBmxE?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <48B1555A14586D4BA48FB439482C0D63@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: deac8f49-aa23-4559-2a39-08df49a1fa10
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2026 20:40:14.3202
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8I1NYF5fyqgGGXi34Ziltmyy5ZVCp9KG8ysqEoiaGOEKsw+TlzjDm26zShsfO6y6
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
YyBiZWhpbmQgYW4gaWZkZWYgYXMgd2VsbCB0aGVuLCBmb3IgdjIuDQoNCj4gSW4gYW55IGNhc2Us
IGl0IGRvZXMgbm90IG1ha2UgYW55IHNlbnNlIHRvIHByb3ZpZGUgImZha2UiIG9yICJkdW1teSIN
Cj4gZGV2aWNlIGJ5IGxpbnV4IGp1c3QgdG8gbWFrZSBkcml2ZXIgY29tcGlsYWJsZS4NCg0KSSdt
IG5vdCBzdXJlIEkgdW5kZXJzdGFuZCB3aGF0IHlvdSBtZWFuIGJ5IHRoaXMuIFVuZGVyIG15IG9y
aWdpbmFsIA0KcHJvcG9zYWwgb2YgbWFraW5nIHJma2lsbCBzZXR1cCBmYWlsIHdpdGhvdXQgZmFp
bGluZyBwcm9iZSwgbm8gZHVtbXkgb3IgDQpub24tZnVuY3Rpb25hbCBkZXZpY2VzIHdvdWxkIGJl
IGV4cG9zZWQgYnkgdGhlIGRyaXZlci4gcmZraWxsIHNldHVwIA0Kd291bGQgZmFpbCBncmFjZWZ1
bGx5LCBhbmQgdGhlIHJma2lsbCBkZXZpY2VzIHdvdWxkIGdvIGF3YXkgd2l0aCBpdC4gSSANCmFn
cmVlIHdpdGggeW91LCBidXQgSSdtIG5vdCBzdXJlIGlmIEknbSBtaXNzaW5nIHNvbWV0aGluZyBo
ZXJlLg0KDQo+PiBGb3IgdGhlIHRvdWNocGFkIExFRCBjdXJyZW50bHksIHRoZSBpODA0Ml9jb21t
YW5kKCkgc3R1YiB3aWxsIHJldHVybg0KPj4gLUVOT0RFViBhbmQgZG8gbm90aGluZy4gVGhpcyB3
aWxsIHJlZ2lzdGVyIGFuIExFRCB0aGF0IGRvZXMgbm90aGluZy4gRm9yDQo+PiB2MiwgSSBjYW4g
Z2F0ZSB0aGUgTEVEIHJlZ2lzdHJhdGlvbiBiZWhpbmQgYSBTRVJJT19JODA0MiBpZmRlZi4NCj4g
DQo+IEkgdGhpbmsgdGhhdCB0aGlzIGlzIGNvcnJlY3Qgd2F5LiBUaGUgaTgwNDIgdG91Y2hwYWQg
bGVkIHNob3VsZCBub3QgYmUNCj4gZW5hYmxlZCB3aGVuIHRoZSBpODA0MiBIVyBpcyBub3QgcHJl
c2VudCBhdCBhbGwuIEFuZCB0aGF0IHRvdWNocGFkIGxlZA0KPiBpcyBvbmx5IGZvciBmZXcgbW9k
ZWxzIGJhc2VkIG9uIHdoaXRlbGlzdC4NCj4gDQo+PiBGb3IgdGhlIEtjb25maWcsIHNpbmNlIGk4
MDQyIGlzIHJlcXVpcmVkIG9uIHNvbWUgeDg2IERlbGwgcGxhdGZvcm1zLCBJDQo+PiBjYW4gY2hh
bmdlIHRoZSBLY29uZmlnIGRlcGVuZGVuY3kgdG8gYmUgbGlrZSBzdWNoLCB0byBlbnN1cmUgdGhh
dA0KPj4gU0VSSU9fSTgwNDIgaXMgcmVxdWlyZWQgb24geDg2IGFuZCBvcHRpb25hbCBlbHNld2hl
cmUgKGluIGNhc2UgdGhlcmUncw0KPj4gYW5vdGhlciBhcmNoIGludHJvZHVjZWQgYnkgRGVsbCB0
aGF0IHN1cHBvcnRzIGk4MDQyIGluIHRoZSBmdXR1cmUpOg0KPj4NCj4+IGRlcGVuZHMgb24gU0VS
SU9fSTgwNDIgfHwgKFNFUklPX0k4MDQyID0gbiAmJiAhWDg2KQ0KPj4NCj4+IFBsZWFzZSBsZXQg
bWUga25vdyBpZiB0aGVzZSBjaGFuZ2VzIGFyZSBnb29kIHdpdGggeW91Lg0KPj4NCj4+IFRoYW5r
cywNCj4+IEJyaWFuDQo+IA0KPiBNeSBwZXJzb25hbCBvcGluaW9uIGlzIHRvIG1ha2UgaTgwNDIg
ZGVwZW5kZW5jeSBvbmx5IG9uIHg4Ni4gQW5kIGRvIG5vdA0KPiBldmVuIHRyeSB0byBlbmFibGUg
aTgwNDIgb24gbm9uLXg4NiBwbGF0Zm9ybXMuIEFsbCBkZWxsIGRyaXZlcnMgd2VyZSBpbg0KPiB4
ODYgc3ViZGlyZWN0b3J5IHdoaWNoIGNhdXNlIHRoYXQgZXhwbGljaXQgeDg2IHdhcyBub3Qgd3Jp
dHRlbiBpbg0KPiBLY29uZmlnIChhcyBpdCB3YXMgbm90IG5lZWRlZCkuDQo+IA0KPiBOb3cgd2hl
biB5b3UgYXJlIG1vdmluZyBkZWxsIGRyaXZlcnMgb3V0IG9mIHRoZSB4ODYgc3ViZGlyLCBtYXli
ZSBpdA0KPiBjb3VsZCBtYWtlIHNlbnNlIHRvIGNoZWNrIGlmIHRoZXJlIGFyZSBzb21lIG90aGVy
IGNvbmZpZyBvcHRpb25zIHdoaWNoDQo+IGhhdmUgYWxzbyBoaWRkZW4gZGVwZW5kZW5jeSBvbiB4
ODYuDQo+IA0KPiBBbnl3YXksIEkgaGlnaGx5IGRvdWJ0IHRoYXQgYW55IG5ldyBwbGF0Zm9ybSAv
IGRldmljZSAod2hpY2ggaXMgZGVzaWduZWQNCj4gZnJvbSBzY3JhdGNoOyBub3QgcmVicmFuZGVk
IG9yIGV2b2x1dGVkKSB3b3VsZCB1c2UgaTgwNDIgZm9yIGFueSBzdWNoDQo+IEFQSS4gTm93YWRh
eXMgYWxsIHRob3NlIGZ1bmN0aW9uYWxpdGllcyBhcmUgYmFzZWQgb24gQUNQSSBvciBXTUkgQVBJ
cy4NCg0KSWYgSSB1bmRlcnN0YW5kIHlvdXIgc3VnZ2VzdGlvbiBjb3JyZWN0bHksIHlvdSBhcmUg
YXNraW5nLCBpbnN0ZWFkIG9mIA0KYWRkaW5nIGlmZGVmcyBhZ2FpbnN0IFNFUklPX0k4MDQyIGFu
ZCBjaGFuZ2luZyB0aGUgZGVwZW5kZW5jeSB0bzoNCg0KZGVwZW5kcyBvbiBTRVJJT19JODA0MiB8
fCAoU0VSSU9fSTgwNDIgPSBuICYmICFYODYpDQoNCllvdSB3b3VsZCBnYXRlIGJlaGluZDoNCg0K
ZGVwZW5kcyBvbiBTRVJJT19JODA0MiB8fCAhWDg2DQoNCmFuZCB0aGVuIGFkZCBpZmRlZnMgZm9y
IFg4Niwgd2hlcmV2ZXIgaTgwNDIgaXMgdXNlZD8NCg0KVGhhbmtzLA0KQnJpYW4NCg==
