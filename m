Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.59
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795457459;
	b=SrsI3VqZgqv9Ch8bz3ogfKFKqirjfVVj0wXwcKWocPZrCTsZphksRXLKH2LMFbzUwkvG
	 iW2PvdGoqzZajQ61WzlX+tQiLXMuQ7WNMeHUh1v6oANiHYLAw43CxG6kBmRaGFGQmZQzh
	 rxyKHhhpoiKmFGm6wUQFB38UhfCqoPdEDDhb7LobpvtJaJUl8S18qyca7aeujhHEIwKQc
	 6rSNLH/U7NONp6un/T97pSeoZBrN2Chd5n010wfjYxznI2LU+vpMkr/gblZyaF9dlIkgz
	 pPXMkpUpuGpfpp+HkGz5o2vvigjpf3tXKklhKJ71yjB/4uulPRvwVpUIYt3TiFF8qOw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795457459;
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
	bh=AsOd41JtMKzye/DCADFfgTXx9rtfgqWYp747zvmlEBA=;
	b=1FoGsLEExJBcdWUm1PDp1VNagGxaDbRsHRrHnlvmvPi1eOxTp2ko/KEtCjqqZ5X8TTUP
	 dyi4Ot/xXXa7jF/j/e+qZx9WaYzKm/9u7xLJNZqo/R8hxqa/piouQtthadzbgAgziMI2+
	 eWUJdnc91T3WWVAeBgdUPTFTwpeRsNu0ak1iG4v2269v9W6YjAKYJx9fV//GA4t6Z2x35
	 TCvOdaqapilGvMvJ+XO0xaLV+YBNSf3qk68ikSzOIfpjyiqfKbRlMHybJ7oFs/vYyjPau
	 jQZFaDmzCtnT/bvzZr6Vf2zRzKvFbeX4FirsAWb/hozC2uwX6gdavbAzqAytHmuIKsA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=qPXFTVRF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.59
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010059.outbound.protection.outlook.com [52.101.46.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6C0606A31A;
	Mon, 23 Nov 2026 18:10:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A6C0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=qPXFTVRF
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LH1CN7/G8koy6Cn4SnMDrpwbglB9lQMlyA8cKY1bPYMldEFo8frxud7K52eqf57jsYk9WlpWmw42Es0Bl9zet2qIdmgY9sRyUSkv2Dd/f156gJJ6FL2RRcgiCRMa/P4kqj05qYkRxvHjipRyFIT8iKE5UuR66O8++Et4/xKBE9UVFL/rHHomvxAo8Hw7cXF1czDUNhUDP/2zwE0ebvZRL5iIBHsO/X9XGR09OyR0q9YjkYKKKlpf1wBCuSxSPaOrWCK2evH35v0Mlptl58NVfi5JHacLsKJtyQQORFhMkR1oZYo4jBh4BknMoPATpvG2B+Eu+uil9AgUUh+yxnhbHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AsOd41JtMKzye/DCADFfgTXx9rtfgqWYp747zvmlEBA=;
 b=mna32r3ThuBErbC54gpyLKTyYwHo8Ypiu66WxL93aZk51gKfjxJiH1Kep7lQw92aS17n0t1c/rE4CNw6w8btiDR10/pNgtzJ/duVaWfLg76JacT320W2HzXhDhT36vvIRbqx53t1mlsKi6FxRmVvpGX0VwZI+bGkzKEduiZ5SuwuloHaXCYnAdtrOlzXo54XZEpzZPH94pAWaE8xk7fE+LLFyM1IbcPhwM0zgua8sjHNTzwFpEdUGCLXD+zbaEy63kxAzpX4G/lK/BdqsUkTRJgAEjsWBl6eO6NqM2UG81FZggF1BpKogGHvxCt8lOKqqRH8I5+ADNDbktdsYyDBkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AsOd41JtMKzye/DCADFfgTXx9rtfgqWYp747zvmlEBA=;
 b=qPXFTVRFBo+J2jGx0TO62p0LULr0yWrFm2QrY9IksXNKecLbaKTJbpr2TfS/XJHpQMN+wxCMgy/Tfzy76pfMZW4z0IUNcx5Q/GBMK/mrwGleypWXjspIQcokb+GUZKNaE3y427dVW310hAz749rjFLo82nRbrKMxuIScGCJZNRDHldCyg3M7X2fEETcU5xFXL6nHeeF/EdAg/+qeqh4EqV09ke8DASCWvWvvLJ6faVA9cu5yRwJU0IcsE/XXIvrP0CSJ3xfVfaCH3KNkd7Lf1UC09XPiyjIkSG3jjueiWUc0rCeDGWlX0BukMQFIBnRmtiEcJonjRY29wn1p5WkvwQ==
Received: from MN0PR12MB5786.namprd12.prod.outlook.com (2603:10b6:208:375::13)
 by PH7PR12MB7260.namprd12.prod.outlook.com (2603:10b6:510:208::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Mon, 23 Nov
 2026 18:10:51 +0000
Received: from MN0PR12MB5786.namprd12.prod.outlook.com
 ([fe80::ae61:c9b4:847b:4854]) by MN0PR12MB5786.namprd12.prod.outlook.com
 ([fe80::ae61:c9b4:847b:4854%5]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 18:10:50 +0000
From: Brian Mak <bmak@nvidia.com>
To: Randy Dunlap <rdunlap@infradead.org>, Hans de Goede <hansg@kernel.org>,
	=?utf-8?B?SWxwbyBKw6RydmluZW4=?= <ilpo.jarvinen@linux.intel.com>
CC: Kurt Borja <kuurtb@gmail.com>, Stuart Hayes <stuart.w.hayes@gmail.com>,
	Matthew Garrett <mjg59@srcf.ucam.org>, =?utf-8?B?UGFsaSBSb2jDoXI=?=
	<pali@kernel.org>, Lyndon Sanche <lsanche@lyndeno.ca>, Armin Wolf
	<W_Armin@gmx.de>, Prasanth Ksr <prasanth.ksr@dell.com>, Jonathan Corbet
	<corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
	"Dell.Client.Kernel@dell.com" <Dell.Client.Kernel@dell.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/8] platform: dell: Allow DELL_LAPTOP to be
 arch-independent
Thread-Topic: [PATCH 4/8] platform: dell: Allow DELL_LAPTOP to be
 arch-independent
Thread-Index: AQHdeUxZSHH0y3AHX0KMIS92REQ5Gbc3v20AgAQ56AA=
Date: Mon, 23 Nov 2026 18:10:50 +0000
Message-ID: <c2ed1600-1da2-45e2-bda4-88d008cee213@nvidia.com>
References: <20261121000556.173028-1-bmak@nvidia.com>
 <20261121000556.173028-5-bmak@nvidia.com>
 <a87b9450-dc36-422d-a897-12248004ef3b@infradead.org>
In-Reply-To: <a87b9450-dc36-422d-a897-12248004ef3b@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB5786:EE_|PH7PR12MB7260:EE_
x-ms-office365-filtering-correlation-id: 57d31f8a-b86f-448c-3a3f-08df498d1b61
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|1800799024|7416014|376014|22082099003|261009223027099003|18002099003|4143699003|261102123227099003|11063799006|56012099006|10067099003|261028144727099003|261026140227099003|261022075727099003|261022105027099003|261021123027099003|261021121427099003|38070700021;
x-microsoft-antispam-message-info:
 9T37kQjLpJ6i9bLonGD3ycsSyP6wSb2+GDCNOmgtrSGT7RnkQY0OrsUfe0kGB2XaJNunzaRMmOLut4TjtSOMnooX0XEvJmqeYXcPYVH8Gb1lnvlSzav4evD49M1XNl0FrxWt6eXquNdGRMJDOf5wsMf0tZaUDEVDXJeu5nc9FXBWKcNiStfZnjGXF8sGdBBduAUTY4T71HCThJRZi1ffbcyd0ZauRBLuP48JKvGClLq5g6i3S+OK+wJCUjWHXhM9rYRMXwj60r3SVXfkWWSa/0KXCD/ciTQ1I7tzVzQ8/1VKxhI0M8ZPTkPNxHa7hhFdYrEFVGDSGrWfzB0hdP1lVY7k+Rc1MzRBjLtgzUbJRSVJXYYY7/T8cT4GCbQm2ChtBmB1K9OPSH8kBnUJ7XAPqgVtYU2fjHyp7AYaXWPnrnK8xm0MYYcLZPLfPPXwGIybVUlJ3SsvGu8uoMTL3uJ6aXgRdrx8spU5zxk5avp1vZAHBmBOq74SeJ3aHFg48jewwSXKgaJ8eNktO5+EOkfFIzlTaUfwtjAVY5uZaFa12tywTxnqTKdtLxfU5U2GiNfZ2WXEZ62yFKeiRIl+D2BY6ZR/kIzyy3Wp2BHR4/CcQg5g55WkPQQQpuFXVlWbBZphX/xr7ZrbSYiJvouzmGGo3iR47d2EdOEKuLTnCtQtkI/3egY7Rwy2CutSOAymu67S6lo8ze2azhC+Xd5xQlNVkNEjjd2qpu/P2JsbliBX4jA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5786.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(22082099003)(261009223027099003)(18002099003)(4143699003)(261102123227099003)(11063799006)(56012099006)(10067099003)(261028144727099003)(261026140227099003)(261022075727099003)(261022105027099003)(261021123027099003)(261021121427099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bnBDRGxKdWRGUm0wSHAwOU96eHNoYXdURDdiTU1Nb2t6bGR1RzlqZHE5N0hE?=
 =?utf-8?B?RVZZcEZkUTdXcm81UGcyejhKS0V5Mi9iQVk0K3EyNmFQdGl0VUk4YWVyRFAr?=
 =?utf-8?B?MFNQQVE4MDMwUHBvRGhmQndocWNxRDEvMFNLV3lSWEVacFMrV1A3dTBoUU5S?=
 =?utf-8?B?Q3lsVStUbnlURlU2SmJRVnNwbm9xK0JVMFpkR2NsVk41Um0wTlpuaHFQQ2d0?=
 =?utf-8?B?TWJ2NTVyaHVUQ3I3TWh1dC9iN1dLdkR0RVIreXpnb21kSE4xaVI3NTdMN2Nr?=
 =?utf-8?B?RWt0Z29WNm44VHkwY1JGVFQrN09MMmFZQkVTSmh2S3J5THlQYUNHWjBjYlF2?=
 =?utf-8?B?b1VndlJvZWRubFpIVFBGT05SaDNRZDlLOWsyR2RTWTZqbzBudlFwZnRIYWZm?=
 =?utf-8?B?Z1ZGMnVOditDRWRrT0hNYmlGR3BMaEJuc2Y1NU8yT2VWblN4OXRzSU9jT2U2?=
 =?utf-8?B?amQ5SVdaVzZ3VlE3d3p2Q0ZwaFZIWTQ4VmJ1K090c3IrUDkveThEU1l0c05B?=
 =?utf-8?B?OEFuRk9yUlhqZnhiUWxIVTJibEJ0VUljMEl3Nmo0VDZhcFlVNHdNL2Z1bFIw?=
 =?utf-8?B?VmZOSVhyZ2c3blNIaHlXMmRkYVhyVzFTenNaYzBLOGNycXRUTW1zK3lUWElR?=
 =?utf-8?B?UXZKTFp3dGd5alJYUmNlb09IVVlFYjA0S1hoUzBpbmZ5NUVTTUFjVkkvV3VY?=
 =?utf-8?B?aFMrUTBMOWdxYWRod1ZHdVBHcXNqNjRKbVUwdm56Yk92aUNyb1h2U1hjMWlJ?=
 =?utf-8?B?MVBLZ1VTUUdSQ0RhVGZZd3QvRldsVHV5MDlpaFcrT2hkS3hUM2lUNzVESkQz?=
 =?utf-8?B?aDFvU0g2ZWJINWl0NWlqeUkrR2lmVGhLVndoQlBoK0VvcFg5T2NxVTZRNHFs?=
 =?utf-8?B?cHE0ekU0YVhlcFBoczR4VnJwRFpzK3hhL1NrbzQ0bjZQTFNiTnQ1cFBJVVZX?=
 =?utf-8?B?Wkl4bjJJQmE5Z01iTVhCS2tHVFA2WXJSelNob2ZpcFZHL3dmQXZZZDZvdmk4?=
 =?utf-8?B?RWJNRHhsdDk0MFYyWnpaYlZXYmJrZUJlMHIxdHNKVkt1T3BHRTZRdjd3eE1R?=
 =?utf-8?B?aW0vQzRwN29xalNXSFVTNHFmVWZ6K1JIWmZuZW5rMmRqZ3ZyekdCSWk3b085?=
 =?utf-8?B?Y29qUC91aHYzTGJVMER3L01Mc3hQZ245Z3Q0MlptUTVjQjNPMnRjcjc1QmNE?=
 =?utf-8?B?M09uQ2RMclJRL0JsdjdEclI0K0F0bENyLzc2VHJBdWFxZEFRZjJ6Q0ZUNUcv?=
 =?utf-8?B?U1ZnUjQwdnd6U3ZuUEg0VEcrMllKWlRGYzVWbG1PY2Zua2tuUkZncXFhd1ZM?=
 =?utf-8?B?NEs5MWliS3kydERpaExWZzdJT3J2T09udmpQMmEzU1JwZWdpTEZranEyc2JT?=
 =?utf-8?B?cERzRU5qbHc3Zk03ZGhqUDBNdHVyWXc5aGtSbHhMQVBleFI5dVhNSzdOL2Iy?=
 =?utf-8?B?NldiN253c3p5M0JYcmlsNWNMYmtpMG5ic0hLY1VoK0xqT0VVRDNFaEZ0R0FN?=
 =?utf-8?B?QytsSXJ2Wmo1bGZNdlJYQVNkRWtSbXhiUk1VYVJ1RlM0Q2lVQ2xtbVZ5dzBi?=
 =?utf-8?B?SHpxclhVZi9ydmlzRTc4eEVURk93NC8wM05SOVlEUEI2WERLWFI5cUhCa1By?=
 =?utf-8?B?NWZVMzRrNWtQdGxBMnR2UEQ1c3Yrd1R3a0ZlWklCTisrN0lCWGpJOE9MOXJj?=
 =?utf-8?B?K1Zpa1NYUlU1cmJ1WGJOLzY1cXRFVXFXbjBzVWFTVndCeWJWcWJPYU9xYktr?=
 =?utf-8?B?S1N0NVdVTUFlMExwaVA2VjVOZTdVSHdWaitjVDZMT2N2UU1DTGlSazA5a3Va?=
 =?utf-8?B?aldiVENjbEdycGYxS0NrV2VnNTFxQkVOenZLajBURXBOK2h3M3liMG9iZVZQ?=
 =?utf-8?B?QXFWQktXdkZVUEVsSlIrUlIvSHowWW5GejROZ01KQlNKQW1nUXBKOXduaGpi?=
 =?utf-8?B?amd0NU9iQ1lFT240OUgvdHBDcXpLYXRZdXYzSVhzczdma3pINVJlZFZTOWhO?=
 =?utf-8?B?dnRrcTJRSVJ1ZFArUWZEZEFQck9XbVhnVHorRnlzYVRxdXVjcXdNMHRtWHI2?=
 =?utf-8?B?OXdncklqZmhVMzF1RjU5dEQzT1VBdTZZdTlFL3B3ZGYvckloQm5qKzYwRlJE?=
 =?utf-8?B?MTVQVDBKbkJSN1Qwa0ZhZXhzeFd6clFGM3dQYzYzdkczdm9nNnA2Q2FlL3or?=
 =?utf-8?B?Wm13OHM4RkpOMHpMa1FCdU5ZelNSWEJCS0s2dWVDejdYN0hVWHJtVTIrQ1JF?=
 =?utf-8?Q?kUzjAf6Fvse/wTVOnXH964ZHp2oIV+Yal/mjc48Lg8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5D76C79ED345A944BD983A36D2BEF337@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 57d31f8a-b86f-448c-3a3f-08df498d1b61
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2026 18:10:50.8345
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zWtAxOPwPrjBvR3vfFtj2uI156Vi/eV6F9Xz/w4o9vcWDmI5x6TXW7nJlPrUnthS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7260

T24gMTEvMjAvMjYgMTc6MzgsIFJhbmR5IER1bmxhcCB3cm90ZToNCj4gDQo+IA0KPiBPbiAxMS8y
MC8yNiA0OjA1IFBNLCBCcmlhbiBNYWsgd3JvdGU6DQo+PiBDT05GSUdfREVMTF9MQVBUT1AgaXMg
Y3VycmVudGx5IG5vdCBhdmFpbGFibGUgb24gQVJNNjQsIGR1ZSB0byBhDQo+PiBkZXBlbmRlbmN5
IG9uIENPTkZJR19TRVJJT19JODA0Mi4gVGhpcyBkZXBlbmRlbmN5IGlzIGFjdHVhbGx5IG5vdA0K
Pj4gbmVjZXNzYXJ5LCBhcyB0aGVyZSBpcyBhIGZhbGxiYWNrLiBNYWtlIGl0IG9wdGlvbmFsLg0K
Pj4NCj4+IFNpZ25lZC1vZmYtYnk6IEJyaWFuIE1hayA8Ym1ha0BudmlkaWEuY29tPg0KPj4gLS0t
DQo+PiAgIGRyaXZlcnMvcGxhdGZvcm0vZGVsbC9LY29uZmlnIHwgMiArLQ0KPj4gICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4+DQo+PiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9wbGF0Zm9ybS9kZWxsL0tjb25maWcgYi9kcml2ZXJzL3BsYXRmb3JtL2RlbGwv
S2NvbmZpZw0KPj4gaW5kZXggNzAzMGY4MTdiNmFmLi4wMjIzZTIzNzM1MDggMTAwNjQ0DQo+PiAt
LS0gYS9kcml2ZXJzL3BsYXRmb3JtL2RlbGwvS2NvbmZpZw0KPj4gKysrIGIvZHJpdmVycy9wbGF0
Zm9ybS9kZWxsL0tjb25maWcNCj4+IEBAIC03Nyw3ICs3Nyw3IEBAIGNvbmZpZyBERUxMX0xBUFRP
UA0KPj4gICAJZGVwZW5kcyBvbiBBQ1BJX1ZJREVPIHx8IEFDUElfVklERU8gPSBuDQo+PiAgIAlk
ZXBlbmRzIG9uIFJGS0lMTCB8fCBSRktJTEwgPSBuDQo+PiAgIAlkZXBlbmRzIG9uIERFTExfV01J
IHx8IERFTExfV01JID0gbg0KPj4gLQlkZXBlbmRzIG9uIFNFUklPX0k4MDQyDQo+PiArCWRlcGVu
ZHMgb24gU0VSSU9fSTgwNDIgfHwgU0VSSU9fSTgwNDIgPSBuDQo+IA0KPiBDb3VsZCBhbHNvIGJl
DQo+IAlkZXBlbmRzIG9uIFNFUklPX0k4MDQyIGlmIFNFUklPX0k4MDQyDQoNClRoZSBsaW5lcyBh
Ym92ZSBpdCB1c2UgdGhlIGN1cnJlbnQgcGF0dGVybiwgc28gSSBwcmVmZXIgaXQgdGhhdCB3YXku
DQoNClRoYW5rcywNCkJyaWFuDQo=
