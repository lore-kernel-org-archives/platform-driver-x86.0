Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.12
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795461067;
	b=fnpI3hdpgTpXLEqSZG7xMkHuBCB9+IvUUcoD4AUhbkMdbDZfH+GQQCBsGdcf36jHiMPH
	 zRJ3slyXhRNsmJSPhoW7u+p6FVF5JVO4EBmGl7Y0iuODnZIqWbX6jKhjIbJJMrs1voytU
	 eM8Buc5+jyJ0ObE6s2M2EvDcw2MCVpycTgtYIABXskoLUqYp1DvGCVXlPVx+QKAnhYQhO
	 3xuqGoyGh+uQ2ZWGqKkZfxjSST7RDjs9eYCvzydqq+xSHLAtg+dw5bPw5p3/LOrCXW2En
	 Ac8Nav5TrMqpasHt2Yagztvkd0hWWHKpJG6uN4aHkku9KKvhHXt4Kw/KdJFwZ3SYBIA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795461067;
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
	bh=WlcHjUiJbn2/De5TG02fxmC5hw7Wqy2cJK+aQJxzRVQ=;
	b=WxZYtJOjtp4Vx/GCX0LrpP/BoN2qwHsT/1dyjdJGdhPGAPINtrwLn+GMmvqxp82t1/dI
	 lo8NsmevYbTy/vGVPlQhz/wIfoyaB6hr312Kvk7RJ2qY7Yj3DHDyED4fdtLGXKLeCXfwc
	 hiWDG8bSt27v4gXJfzJjHP7TT+k+el6Qpu4TG6blWvUqTzO1RAIopQbjlJrTIXpe6C0pQ
	 BWTrnKfOiP6lVtSwioV9Yu1Amo2TPy7Altgsa1KHwzhf0jxiNS59PcUoaFrZ4IWz7hrIR
	 B+N7vmy7I8RTGEJLR1XeG5X4iddDeiRk6hceuI8EcHWUxFyDMuD8uvNuETqMqL9qjJQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=hGLumwnz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.12
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011012.outbound.protection.outlook.com [40.107.208.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C13C606A31A;
	Mon, 23 Nov 2026 19:11:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C13C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=hGLumwnz
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yTQEj+E8e5XCTmS+hvV/fnQlKCXngymR4NxQ8elJteorpwPAK/1oG5+V9j2nEmv/1R2oKzsFwzxVFlh5NY9+rvUF+VL88AMxUwQeN7LM2m9qqPi+8oMV+GgnTmqDziugsV81sJqWnuFcD6p9vlxR7Ojw4qN3Jr0fnKVDe5S6v9nehOId6Fur2Hu2E52FAz2cZ+w22GjAbuzVCnsMP17Y+2mu5YverQQ/Ers9Kk4VfrIlVkW819wllodX1XOBUd1KF7M7cFrCph2pyaPntfJmdaawQ7Mqw40syCkvvq7rT+84BBMqSPBGQyIW5WeksFFEoRTDYpMbBQ06A6zeXxVIUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WlcHjUiJbn2/De5TG02fxmC5hw7Wqy2cJK+aQJxzRVQ=;
 b=INWts2eq5pmT3yrzbjOuekNaOPBbhGPLteis6ieq9QpBNYaLUZnaJJUfofE8O7ARp388v9am84sHw6EJGJ57peKxwBRVs7Eij865fw6AYCoHVm76rZnNR57SC3+AtP3T7GGPx46pG2GvhvrSD4dl9ADPmn6sATay3G5UVYYabNx89mQIq//4yD7dKfyyx+NUo8vbmAxVOrI6PwrE40jiJBLdb4wy/rv/a0A6dKZQ3wy16NALnKFB1JRxRdjPFEKFlw3dx30+v0BLeaxWwXD2dJLTjMKk11yX2wc8ZWqjfHpkjGgB2NgBdBndQsd/xXBwqlq7FbFX/yDt88PlAJpdNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WlcHjUiJbn2/De5TG02fxmC5hw7Wqy2cJK+aQJxzRVQ=;
 b=hGLumwnzx643oiV9l55w7+P/K6+zcJxtZNHba8ckO+yh/YMhgYYbC0HTYzGsXlHmYYQk8d+Xdhulc8IxX+5BtO+mAYREPIOcEQGCvPiLVYWvxF5/FmHXIxR/BTb6g3fFebTZDj8itT8N1dJj/UoBoKMx4tubFcGMOhFuDItCOcKYCxMt1UFFl5ZTr5dtimHATRr/aHb4UJ8lhaP5q7Fdicsj8A1AWELW+sUzfxMRXed2zzezgmcDmb7O833gdUzGGi1qIhMgcFvlo2qPe4tWbk2GvMGldKu7Qdn2QobWiSAUow8Qdjuk0jFjl+1s5NCUD5dexsfysOmHZeRaRKLwWg==
Received: from MN0PR12MB5786.namprd12.prod.outlook.com (2603:10b6:208:375::13)
 by IA0PPFA8EB66EE9.namprd12.prod.outlook.com (2603:10b6:20f:fc04::bde) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 19:11:00 +0000
Received: from MN0PR12MB5786.namprd12.prod.outlook.com
 ([fe80::ae61:c9b4:847b:4854]) by MN0PR12MB5786.namprd12.prod.outlook.com
 ([fe80::ae61:c9b4:847b:4854%5]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 19:11:00 +0000
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
Thread-Index: AQHdeUxZSHH0y3AHX0KMIS92REQ5Gbc3sXIAgARYswA=
Date: Mon, 23 Nov 2026 19:11:00 +0000
Message-ID: <af13cde2-6407-453d-81db-1778b30f4763@nvidia.com>
References: <20261121000556.173028-1-bmak@nvidia.com>
 <20261121000556.173028-5-bmak@nvidia.com>
 <20261121004828.rk2k2cq4id2ixkal@pali>
In-Reply-To: <20261121004828.rk2k2cq4id2ixkal@pali>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB5786:EE_|IA0PPFA8EB66EE9:EE_
x-ms-office365-filtering-correlation-id: bd8ab103-3fdb-488b-abc8-08df499582f3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|366016|18002099003|22082099003|261009223027099003|4143699003|56012099006|5023799004|11063799006|10067099003|261102123227099003|261028144727099003|261026140227099003|261026121527099003|261021123027099003|261021121427099003|261022075727099003|261022105027099003|38070700021;
x-microsoft-antispam-message-info:
 lUv5RBIk0IqdvFNwnaHFRB9UiIlUncRtrBSvt5VK2aWtfyFA6ttxr+QzEIz05HpFJsc+y1zsBTWZ6Z0J1qjQnS1j86kAqszroE9G9Y2pYauzzQqnRnNJs73CQ01uRvQXuTnDivzaTQJ92gV3LOdABOGxVMdbDdHsd2LI2pf/vrsuV/Yg0ibZAnsaGUqNYbUlqyr0Dgfv4yMd50MmgaHIsAoi9K3kI84AOwvEltZ/e2Ebl1Zl/jr268d69eo0dr/fwUt6rHVgRxZt+Pe0VPd1EDcHLmGQsT0A926pNrmA8yGUY5KgJbOyk1iRh0K71eSFkWyEE6r7pUHsmQRlF6787M2em3mVdjqkUW9A3F7JuzKcl+WPFVxJDq0MZ5KTRa9HllIOxv5UkTvoDgAInr49UxitjTv6q6iYqx2ZEuXCovmJikT3SjYtS+jNCsG18ahoV075Z8gEM54n97UZhc7lPgLHOENz10/GywvekU8QNlBhteQYUOS14H4Ksw30tHxTsYw4R4dQH7MGGzQoW0NYb/qx6xQIvZHJB83cAdwMFQmjY+sOYUM4TseR7NjMGA41tERbQNYv7X4fhcoVAX0HEuwPCRbpazuXO3+ClKp0SWsdWP4Gr6jGQ9UHz2otZGV3RVmB7bCm063HqTZYhWoeq0L+U92qiQj/8cG1uzVAMvQKz5+upfB1hQwo46IZLAl+BiI5i59TSELX6oDGiTSK8g==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5786.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(366016)(18002099003)(22082099003)(261009223027099003)(4143699003)(56012099006)(5023799004)(11063799006)(10067099003)(261102123227099003)(261028144727099003)(261026140227099003)(261026121527099003)(261021123027099003)(261021121427099003)(261022075727099003)(261022105027099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?V3gvcmJkSzl2TTBuU0Zic1pLcVdSM3NJMksyMnhGSHZpWURMQXg2UGFTTTZC?=
 =?utf-8?B?Y001dWM0bjBYRUMxSW9hU3ZGU0JSNEZPcmVMRURQMVFETTluRHVJeDRaN3kr?=
 =?utf-8?B?Z0NYVlU3QTl4WDZidElNM0VQTGlSQ1MzL0J2T21FQldXVTIzWWVZcW9lWnZH?=
 =?utf-8?B?cDNJUDRZR0grUlVlYzlVQ0hRNEx4RVJ3U3BBWm1pRmpXQVhuNGZKN3l5dVdL?=
 =?utf-8?B?SlNFSUhvZ01yUmFDTTh1UmdCZGhXTlE2MjRIZldwY0JvbE1CdEpEbHBVVEZ6?=
 =?utf-8?B?NVNKMXZ3QVNnTjM0S2xDOFAvdUNPWXdldGEva1I4TS9UM2NFY1NUcE8vMTNC?=
 =?utf-8?B?LzU3ZWJHN1JXcXFDWVQrMkJISmEyNncwU2xUc0VyZWhzTFNMazNLRFhHUjFW?=
 =?utf-8?B?NmhPQzVrc2dqcDNlT2dScURRbnlQWE54ZGhSWTVHSStla3RLSjVReXVKRjZr?=
 =?utf-8?B?SHhybVJ3ZjFSYmEzSUdPWE5ISWtFTjdCNDkzRFpvWUE0bnFlQjlyMER6RzFn?=
 =?utf-8?B?dUF5RkRhODJYc2gvR0xERDhVOEs0WnVieGR4OTdMWGpiZVhJUEFZNzdxbWcv?=
 =?utf-8?B?U0pSeW9jNnJ1RDFFc0YzSVJhOHBxcUFHb0Vha0hSN0hYSlRGdXI4Uy9jOHpM?=
 =?utf-8?B?NUo3RXZ0RnIrdWdlSUF2cHpSUlZEVVExYWd6aEErZysxRUszc3MwMWkrUGFl?=
 =?utf-8?B?REp5N1B2RHN4L3ROL1JmeDNxNktwZ0xNTS9kdVlLZmQvcTFKdlJhamZrNFd1?=
 =?utf-8?B?aTBJK0VEeHUvR2xxRm1wSGhxTENWSWxZMnlwaDl0bUd5eUxKWHFITnNwNTVj?=
 =?utf-8?B?b05WYUpKcjFuTFpsUmNZblhia2d6Y1R3ZEk2UDhzZ1k1YWVwZ1lubjBaeU1W?=
 =?utf-8?B?TEZaNkl1WUlhbk5CTGJFTnkwc2hQZzM3ZUwzZUFkdnB0U2NKUnQyYVo1M2VE?=
 =?utf-8?B?VXhoSjcrbXdqUUVCcmpJWGZRQ1NRNmgzeWg1SVp5dnVaUlVyZUFOWCtDbUR3?=
 =?utf-8?B?OTVScGFWU0JXbW9UWnBnMU1rQUI1Snd0bUFlUHN4TVpzTEdqOHFSa1pyaVVr?=
 =?utf-8?B?S3d3NFJReldhTGpLWW04cEUrNDFRY2MrTVJIUFVzWkZVbm1TNEdKRWQ4ZUgw?=
 =?utf-8?B?N05ZcE9YQmpTWUxoNDZTN2tSZFQ0Tno4VE1CSlo0RkR1clFFVkZEeGJMYWhF?=
 =?utf-8?B?Y2w5WU9taW5UYmZTQS9MRFg3VmVxZVJOdWZocEtDaXBsRFJsVDc2MEE4dVJW?=
 =?utf-8?B?WG9VQldBMUttc1FpdjlmYmdEeTVoRjYyUFR4NzgvOVh2SVhmQkRDK050NU5N?=
 =?utf-8?B?TDRrSitQTXQrNGk0T2I2NjFnb1U4VjU5Ujh6S0g3WFpJOENCdDc0OVhPWFZn?=
 =?utf-8?B?VXFqM0U4WXg5VkppMEZtMVVtb2pkTkZjVnEzM3Q2aFZYWG1waWtyWjJrcyt1?=
 =?utf-8?B?L0srMTVZcUJwOGpkaWNDcldBOHh6eTU0Z0FnQ2thYjZIZXIxMEVLaTRmSU0v?=
 =?utf-8?B?dWN1OG1tL1pEeGpaVE56NHFnWFNiQlRCRFZnaFQxM0tNM0ZON3daRUNXVmJ4?=
 =?utf-8?B?N3B5L0Zrek43RmhCMXhjclRzUmQ4bGtNWFYyQ2FrSEpwaWtSc1I0VmxOazJD?=
 =?utf-8?B?TEtyOWU4NFZ2WURNNWhkL05mYmJXL2FvdXdsZmtDdGMwd0hkWWRQemZ1MUlO?=
 =?utf-8?B?TXNrb0hrdlNlcTJSamwyaGZZMUs0Q0VhS0JsamJmZlNwajMrVkRDd0FremRW?=
 =?utf-8?B?dW95akxtem45cVc0b1FNKzl3Y1BVc2JwYnJvS3FFeFN4T0RBWHBkK1RBRGlF?=
 =?utf-8?B?Z2V4YTFSeUQ2SmR1RytTcndHMDY0WG1ZVCthc254UGhYblQyWTlXR2ttN0xG?=
 =?utf-8?B?eG9zeE13c1dpMXBVOGNackE0dzd6bisrMWpFSXJuWE9qZmZBaldab1lROCtY?=
 =?utf-8?B?amlTUzhiYjJUeHk2NGZZNHRmYWZFNXJjcmU3Ky9ZZWJYbVp1czI2RVc1QlZ1?=
 =?utf-8?B?Zlo1RW50WUNtNjlVR2t5eHpEQmtJb0VIT21lK3JGcVcvRjA3WTJRYXZhR0E3?=
 =?utf-8?B?NmRjSmZMeGR4WnRJcnA5QmlmTW1CZzJibDJ2b3p2Ujk3dStxNWlkT2NXS3lX?=
 =?utf-8?B?OXY4d1ZGVW5RU1hNY0l3ZXhTeHhQZmJ4WjJOM0x4MXg0QmdyZEwyZkNLQ211?=
 =?utf-8?B?eXpVcDd5RTRLc0kxeWdNaVIzb1UyV3kzeWdadEhUZFFpN09TenVONWxPaitM?=
 =?utf-8?B?MUZUbUFyNVRKd3IxcmllcGhyZmVQdTdmcUYzRm4yTjE5amYvRTZSTXJkWXQ4?=
 =?utf-8?Q?sORL63HEnPQHwOMvyP?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D45DBACA3527BA44A0E74FE3AA6E7D1E@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: bd8ab103-3fdb-488b-abc8-08df499582f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2026 19:11:00.5563
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BiBIgQ45sCW6lBQcgYdrhngynvCY2Y63rrS52CmHzCkW7/OIbTTHCIWldzJC1So3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPFA8EB66EE9

T24gMTEvMjAvMjYgMTY6NDgsIFBhbGkgUm9ow6FyIHdyb3RlOg0KPiBPbiBGcmlkYXkgMjAgTm92
ZW1iZXIgMjAyNiAxNjowNTo1MCBCcmlhbiBNYWsgd3JvdGU6DQo+PiBDT05GSUdfREVMTF9MQVBU
T1AgaXMgY3VycmVudGx5IG5vdCBhdmFpbGFibGUgb24gQVJNNjQsIGR1ZSB0byBhDQo+PiBkZXBl
bmRlbmN5IG9uIENPTkZJR19TRVJJT19JODA0Mi4gVGhpcyBkZXBlbmRlbmN5IGlzIGFjdHVhbGx5
IG5vdA0KPj4gbmVjZXNzYXJ5LCBhcyB0aGVyZSBpcyBhIGZhbGxiYWNrLiBNYWtlIGl0IG9wdGlv
bmFsLg0KPiANCj4gaTgwNDIgaXMgdXNlZCBmb3IgY29udHJvbGxpbmcgdG91Y2hwYWQgTEVEIGFu
ZCBmb3IgcmVjZWl2aW5nIHJma2lsbA0KPiBldmVudHMgd2hlbiB0aGUgZGVsbC1yYnRuIGlzIG5v
dCBzdXBwb3J0ZWQgb24gdGhlIHBhcnRpY3VsYXIgbWFjaGluZS4NCj4gDQo+IFRvdWNocGFkIGxl
ZCBpcyBhdmFpbGFibGUgb24gbW9yZSBWb3N0cm8gYW5kIEluc3BpcmlvbiBtYWNoaW5lcyBhbmQN
Cj4gdGhlcmUgaXMgbm8gZmFsbGJhY2sgb3IgZGV0ZWN0aW9uIG9mIGk4MDQyIGF0IGFsbC4gRXZl
biB0aGVyZSBpcyBubw0KPiBlcnJvciBjaGVja2luZy4NCj4gDQo+IEFuZCBmb3IgcmVjZWl2aW5n
IHJma2lsbCBldmVudHMgaXQgaXMgc2FtZSBzaXR1YXRpb24uDQo+IA0KPiBTbyB0aGUgZGVsbC1s
YXB0b3AgZHJpdmVyIGV4cGVjdHMgdGhhdCB0aGUgU0VSSU9fSTgwNDIgaXMgZW5hYmxlZCBhbmQN
Cj4gY29tcGlsZWQgaW4uDQo+IA0KPiBJZiBub25lIG9mIHRoZXNlIGZ1bmN0aW9uYWxpdHkgaXMg
YXZhaWxhYmxlIG9uIGFybTY0IEhXLCB0aGVuIGl0IG1ha2VzDQo+IHNlbnNlIHRvIG1ha2UgdGhl
IFNFUklPX0k4MDQyIG9ubHkgZm9yIHg4Ni4gQW5kIHRoZW4gaW4gdGhlIGRlbGwtbGFwdG9wDQo+
IGRyaXZlciBtYXJraW5nIHRoZSB4ODYgc3BlY2lmaWMgZGVwZW5kZW5jeSB2aWEgaWZkZWZzLiBX
aGljaCBhbGxvd3MgdG8NCj4gY29tcGlsZSBkcml2ZXIgb24gYXJtNjQgd2l0aG91dCB0aG9zZSBz
cGVjaWZpYyBmdW5jdGlvbmFsaXRpZXMuDQoNClNFUklPX0k4MDQyIGFscmVhZHkgY2FuJ3QgYmUg
ZW5hYmxlZCBvbiBhcm02NCwgYXMgDQpBUkNIX01JR0hUX0hBVkVfUENfU0VSSU8gaXMgbm90IHNl
dC4gV2l0aCB0aGUgY3VycmVudCBwYXRjaCwgdGhlIGRyaXZlciANCmJ1aWxkcyBvbiBhcm02NCwg
YnV0IGFzIHlvdSBtZW50aW9uZWQsIHRoZXJlJ3MgYSBjb3VwbGUgZ2FwcyB0aGF0IG5lZWQgDQp0
byBiZSBhZGRyZXNzZWQgd2l0aCByZmtpbGwgYW5kIHRvdWNocGFkIExFRC4NCg0KRm9yIHJma2ls
bCBjdXJyZW50bHksIHRoZSBkcml2ZXIgZmFpbHMgdG8gcHJvYmUsIGR1ZSB0byBhIGZhaWxlZCAN
Cmk4MDQyX2luc3RhbGxfZmlsdGVyIGNhbGwsIGlmIHRoZSBkZXZpY2UgaXMgYSBMYXRpdHVkZSBv
ciBhIFByZWNpc2lvbiANCihjaGVja2VkIGJ5IERNSSkgb3IgZm9yY2VfcmZraWxsIGlzIGVuYWJs
ZWQsIFNNQklPUyByZXBvcnRzIGFuIHJma2lsbCANCnN3aXRjaCwgYW5kIGRlbGwtcmJ0biBpcyBu
b3Qgc3VwcG9ydGVkLiBUaGF0IGRvZXNuJ3QgYXBwbHkgZm9yIHRoZSBYUFMgDQoxNiBDcmVhdG9y
IEVkaXRpb24sIGJ1dCBpdCBtYXkgZm9yIGFuIEFSTTY0IExhdGl0dWRlIG9yIFByZWNpc2lvbiAN
CnByb2R1Y3QuIEZvciB2MiwgaWYgZGVsbC1yYnRuIGFuZCBpODA0MiBhcmUgYm90aCB1bmF2YWls
YWJsZSwgSSBjYW4gbWFrZSANCnJma2lsbCBzZXR1cCBmYWlsIHdpdGhvdXQgZmFpbGluZyBwcm9i
ZS4NCg0KRm9yIHRoZSB0b3VjaHBhZCBMRUQgY3VycmVudGx5LCB0aGUgaTgwNDJfY29tbWFuZCgp
IHN0dWIgd2lsbCByZXR1cm4gDQotRU5PREVWIGFuZCBkbyBub3RoaW5nLiBUaGlzIHdpbGwgcmVn
aXN0ZXIgYW4gTEVEIHRoYXQgZG9lcyBub3RoaW5nLiBGb3IgDQp2MiwgSSBjYW4gZ2F0ZSB0aGUg
TEVEIHJlZ2lzdHJhdGlvbiBiZWhpbmQgYSBTRVJJT19JODA0MiBpZmRlZi4NCg0KRm9yIHRoZSBL
Y29uZmlnLCBzaW5jZSBpODA0MiBpcyByZXF1aXJlZCBvbiBzb21lIHg4NiBEZWxsIHBsYXRmb3Jt
cywgSSANCmNhbiBjaGFuZ2UgdGhlIEtjb25maWcgZGVwZW5kZW5jeSB0byBiZSBsaWtlIHN1Y2gs
IHRvIGVuc3VyZSB0aGF0IA0KU0VSSU9fSTgwNDIgaXMgcmVxdWlyZWQgb24geDg2IGFuZCBvcHRp
b25hbCBlbHNld2hlcmUgKGluIGNhc2UgdGhlcmUncyANCmFub3RoZXIgYXJjaCBpbnRyb2R1Y2Vk
IGJ5IERlbGwgdGhhdCBzdXBwb3J0cyBpODA0MiBpbiB0aGUgZnV0dXJlKToNCg0KZGVwZW5kcyBv
biBTRVJJT19JODA0MiB8fCAoU0VSSU9fSTgwNDIgPSBuICYmICFYODYpDQoNClBsZWFzZSBsZXQg
bWUga25vdyBpZiB0aGVzZSBjaGFuZ2VzIGFyZSBnb29kIHdpdGggeW91Lg0KDQpUaGFua3MsDQpC
cmlhbg0K
