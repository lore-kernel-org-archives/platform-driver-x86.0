Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2065.outbound.protection.outlook.com [40.107.94.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5CA01CF284
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jan 2025 21:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736805224; cv=fail; b=b9RqBolK5RHkAsacIgrjOVc77OyDKjJx9Lp0+z6ZI4xxkgQaNgDupAdr1C6jfiA81nMUgVU8EhnDrGAyk6j4J9jFq7c43Yn+sDoaNunE1R64S4mICOsaaDqLQRK0FwE7EHGNinehB2H03nl7XYeHXbuZ8izHo/i+NpAJBJWm++g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736805224; c=relaxed/simple;
	bh=MpKCLvD01+mQAsze2gjMqYQYyylqmINxb3sMRsx6zHQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lN6DEqax19foOWq6wWgwQ1WhDWhlaabnWuoOhupIn3/0hf0JfUpCX395HwZ6fUH4zL30dpiSYcxRztMs1pFuIxBTaLXg8Fnv/UaJTPRAzr2DinY/kHKJPWmp/rhDIFDpt0P9eGG1SZeQim1g2u53KWocxVTsBjP8hu8K3+GUlv4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=J+GEvl1/; arc=fail smtp.client-ip=40.107.94.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="J+GEvl1/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vZBou4hYVvHTMgIKUgLJx+ImreCfvxQUrAr0YWfx9Abfh2BMMAC4yoSGz6ttgxPN+/VIMacKyMHIKscb8NMO70FLPM6F2gG3B3O7127HN5V/C8PPLw47wRcoSt9sUqwGw1uezQ+sN6hteq0YDltq5gdSI3mluwq/1f6uW8bifjv76SmWlZlpXquSN5y/CQ4eSFGekblIl3wehNd62DHnXm+OOzFVU1MKJyrXtWFQ++AFtQ5CMhpe92YKDydeVG2WbeYMjrLN22w+66r2Fn6Q1R7wKrj3aCqyVm+VUUnux6lCQR14bQfXymisO19ueoaMzr0pa+ht1aj8N92njtcDiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MpKCLvD01+mQAsze2gjMqYQYyylqmINxb3sMRsx6zHQ=;
 b=TfGv6/M+Czsn8uiBU7WVJUxDiAGV7oPeKXnK+CsYrEChn32GKDvvLwGHris6G2JlzpuT2OFLLr6HwREXsC4WzfztDugMVVeipnClVk7mfFh3ag13hprABAN4QayN97RyIiByzmHhaTOCvH3Qhxsl7R/5TBhL4nbcLqkoa6JnzbatNqMe0lJHuEBCsuingTMHSsmH78qfUF4vaEmemLJf/yiH/l9eyJdK64rl4gQ6GQuWa+spThDgrZeH9oz/PgxhC/RzGZ9AOcpunVBnACHyxyxiOP8mByLfWirkndoPYHXZJGXyPFZvYmW8T9mJ2hP5Y+8jvmq5YPbu8AfM3UE9Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MpKCLvD01+mQAsze2gjMqYQYyylqmINxb3sMRsx6zHQ=;
 b=J+GEvl1/+T/utkTNXxJLkH9On/STikZn2UqJvhp0xeaQ/JtqHn/OsXgxP38vLc37RxN8wt/cSm6v66vMWssKblxJ2cBFy5cmKThtN8WHaSdkrxKXHjB6exiRi7vgVa3ePSN0lZDtpPw4gILpDeIluCo/3rRzxdvPrDHo4SuhoZCFeDnED3ui4giZsT47MLW0Cy53BX3IzkDockTK3HK/fMcUIu/X+BnqE5NHpefzPbtHRpmbDgNu8H78xx06QTQYBUL75KsdTy+XN3PRTrsJc2Bicni2mAhB60mZHF8pAV8roaBXYYAfcHaa+vO6gNmqRp8LM53HICJcCfJEWKZWPg==
Received: from PH7PR12MB6668.namprd12.prod.outlook.com (2603:10b6:510:1aa::12)
 by CY8PR12MB8267.namprd12.prod.outlook.com (2603:10b6:930:7c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 21:53:40 +0000
Received: from PH7PR12MB6668.namprd12.prod.outlook.com
 ([fe80::6d5b:2553:adc8:b6a6]) by PH7PR12MB6668.namprd12.prod.outlook.com
 ([fe80::6d5b:2553:adc8:b6a6%4]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 21:53:39 +0000
From: Vadim Pasternak <vadimp@nvidia.com>
To: =?utf-8?B?SWxwbyBKw6RydmluZW4=?= <ilpo.jarvinen@linux.intel.com>
CC: Hans de Goede <hdegoede@redhat.com>, Michael Shych <michaelsh@nvidia.com>,
	Ciju Rajan K <crajank@nvidia.com>, Felix Radensky <fradensky@nvidia.com>,
	Oleksandr Shamray <oleksandrs@nvidia.com>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Subject: RE: [PATCH platform-next v2 05/10] platform/mellanox: mlxreg-hotplug:
 Add support for new flavor of capability registers
Thread-Topic: [PATCH platform-next v2 05/10] platform/mellanox:
 mlxreg-hotplug: Add support for new flavor of capability registers
Thread-Index: AQHbZZeMyZSYwPgW30uIoV+ANoIi07MU5DiAgABV+9A=
Date: Mon, 13 Jan 2025 21:53:39 +0000
Message-ID:
 <PH7PR12MB666814D4E64D1C300F1F63D9AF1F2@PH7PR12MB6668.namprd12.prod.outlook.com>
References: <20250113084337.24763-1-vadimp@nvidia.com>
 <20250113084337.24763-6-vadimp@nvidia.com>
 <afc22280-ec2f-619e-77a6-78a9b4f472b7@linux.intel.com>
In-Reply-To: <afc22280-ec2f-619e-77a6-78a9b4f472b7@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB6668:EE_|CY8PR12MB8267:EE_
x-ms-office365-filtering-correlation-id: a1784caf-5ddc-4d27-804c-08dd341cbd5c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?a25ScHpXR1VJMDdkZmF3UjNRU0Vod3J0NHh3cFdES0FXLzRLa0d4eGhqbmZM?=
 =?utf-8?B?QjFMck1RNWwyRUNrK1hKRE03ak9NU0w1SGdhbkxkeTVEaG9qQkhmZW5lQzla?=
 =?utf-8?B?VjJ2dDJicFI1SGVPeTBCNS9pQ1h1Z2hldTVZVUlYSDVVN0FZaUg3NUV0NW9m?=
 =?utf-8?B?S3kyUW10ZjBuL1Mxcm9IZVo0M1J1ejF5M0oyZVBCbEhyVWN2aHl6TkpTSGNq?=
 =?utf-8?B?VVRFdkZaUWxMbnVaOHdkeXRUdFErYzZEM1pxcDhoa3I1a0ZNREZaV0h5TitC?=
 =?utf-8?B?eWNRdmx1NzRVcloweXhPeFZhT1ROV2g0MjgzU0JhK2c1eWhTYW8rRU5JRUlJ?=
 =?utf-8?B?eDhuWGlORjBhTkJTNVRlb0J2TU9UT2xBVEUzNmtsV29yZlpXdkljYmVQVUJT?=
 =?utf-8?B?dXNHaVlCaTh1Q3ZCMXpYZElwWmxZUUJDdkduM2ZWRFFCQ1JqeGpXdC9sc2Va?=
 =?utf-8?B?L0RtZFJQejQ5RW5NZmtyODlIZmtPWm11MjNybklwejJZUGV4NFZFMjRaaWEv?=
 =?utf-8?B?VlRFbldsaUcwelZGUlU5U0tHb29JdHRaaXMwUHVVTit3c1VOaFdWeFRack9U?=
 =?utf-8?B?cUM4SjNZMjd2WW5jeUZLeGlFdFZwQk10KzRhc2R4dHUyZlVOZ0RDWFA4ODVY?=
 =?utf-8?B?RUV6MDdNcjFnc0M0ZzdxZHdDdmI4Z21qK3IzYnJGYWhyc2FJbzBWbC9tdFRV?=
 =?utf-8?B?Y0pwU2dyUThDbnU0THZ3bnF2ekUzcjJiUGhyaW5XaHBtNUFKVnVtN3BnRTJm?=
 =?utf-8?B?NzI5SVlwQlJZcDVBUTJkWEdHZFcwZkRrT0M5SjBSY01WMXViN2tZN2g3eStZ?=
 =?utf-8?B?akMzZTlZdk1lUHEvaDlFenoxMjBROFpZL1Q5emtFajAyQmJNVlBlTVdQYXFh?=
 =?utf-8?B?alcrTlBEZkZRdkNSenhFQU5SeHI0dXR3U0ZtS21HZEtJc200SEQrSTk2Uk9P?=
 =?utf-8?B?VE8wVXd1cWVveVNtajFRdTNtbUhGeEVxQ0VxNWxMRC9vZFRCdUpjdERwOE1P?=
 =?utf-8?B?UDhtbDN5dlNnNVI4M3RHNGdrSDQydGZmYkU1TFBkVEUwNGFBT1JUV2dQVGtI?=
 =?utf-8?B?UVBDR2JrbnBGdjBYYzBTOTZDSEhZVndCMWNhTTNERVhLWnZkMktIZG1DMEYr?=
 =?utf-8?B?WlFXYnhNc3pEdENVTHFiZzRwbVltdUh1c2NnVDBYU0s3Q2dtOW9taWV5RFNW?=
 =?utf-8?B?bXpUSmdEYkhvZzFyWTdhZHpnc0t3N1crcUNWYng0NFh5bkJNS3l3WEwzcVhE?=
 =?utf-8?B?NStLdU5HcXNBdzNTeDZ4alFDajZDRFFkY1MvNXpuN2dQUVZzTWRnS2grck1m?=
 =?utf-8?B?UncxbEtSc1RJNjFja3A2djh1QXVUTXV1V2MrMjRTTHl2aUpMbElOelQwVG9P?=
 =?utf-8?B?cG14bmdBUk5YR09DeTMzdXk4MkxMeTNFbEl3NGdsN2JzVloyTWttZGVMTU5x?=
 =?utf-8?B?Ull4bU1KeFVVTk45MUFFNDZwWW9JNHRKVnY0VVNCUXBiQkZwS241UGF1OFJ0?=
 =?utf-8?B?QVFjZVVJWHcxdWJvemhrWVFqd01uS0RIa09vTXp2VUxuc0x6elFFRnVocEV4?=
 =?utf-8?B?UFFSK3VHZnhBamxkbHZvd3cyL2hMSkRhUTNMRTBMT1phMzJNbFZ1SzdZTmNy?=
 =?utf-8?B?eUNoMndEblFCakpqK0c0STVNV0haTHhrc1FFcE53cFhIQ3plMXk5c0t3SmxB?=
 =?utf-8?B?V2crS3Q1cjVvR0EwQ3RTVUpaSWhhbHgrRE9DUzJMM2xwR2hjc2dXelBVVUJ5?=
 =?utf-8?B?VTUrT0d6VHYvL2FIL1gva3cwLzROL0NpYlM3OWVqVm4zVC9WaUptNmdGbjZD?=
 =?utf-8?B?azRHTEhDMUZuS00wZE1GTUZXM1pwd1V2ZVFkZmxpVks5b2ZDTFlOaUQzdmFL?=
 =?utf-8?B?YUhTUGh0d1JIWDd0OGV2V0lvdnNRRFdVaHhicnZZR1h5em91UHlhelk4MitQ?=
 =?utf-8?Q?hejY1r5ADDTh6zUpIqHzzjEM/6v7tg4Y?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB6668.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NmlxbTdjakl6cVRvb2ZlS0t3S2F5OHVSYUYvRTNJMEoxM2Rmb082b0tlUjda?=
 =?utf-8?B?ZElaOGVGWXNDYTFQQ1pxL3AwdnhNdlFyWVZYM1VzM2hONFRLb05MbWtzaWVr?=
 =?utf-8?B?eUJ3NjF0anh0TkN0dDA3Rncrb0xpQ0J6dkxEOXdVb09Eb0R4bDFHZDRUMVE4?=
 =?utf-8?B?emV6cjhYazA4UW9TT3BHRHNBbGVCRVdDYjJ0THdCVUorK0tRajNteCtqcW5Y?=
 =?utf-8?B?dzFYV3ZBTWllV01wdmd3K3N5QUxhNzBwSzVpVXdmeUxOSEdmVksrck1tcHVu?=
 =?utf-8?B?MFVGcGRycWRFOG92ZDNhNk1CczRTWWRoOGJrVWxyT0hvbmd1bXJ1RE1KSFZC?=
 =?utf-8?B?SnMyVkFhSVNSZGtBU21DOEVpWlV5a0xaNEV6K2xKaXBaeVVFaTZXN1NYeEw1?=
 =?utf-8?B?bnZoTTlUV0twNGFIWnB3OVplWS9IaTFHQ3Z4MTd1SzloZDJydXV6RmhTRU94?=
 =?utf-8?B?bXp1RUVJUTdSZVZZUTdyNjkrWGMyQkF4Z1ZoOWZXUjRPdHpBNjRUU2ZPYUJo?=
 =?utf-8?B?bWl3TWVoNFdlaDl2Sk1XN3F0NExNcGdWOTFRVlVHT2N0RjUwQXhXOHhaR2du?=
 =?utf-8?B?YzUzZVhsT1htMmVrQllKVkZZaEp4VU5FUi9UTUt1MUdlK21MUzJEb1QzbDFk?=
 =?utf-8?B?WGgwOGd2RlVHeXRVdEVYMnVMUUw1LzF3SFphVW5iL1djYyttZCs1QmNPdU1S?=
 =?utf-8?B?MUxzaXJnVDQ5emFjNzI0U3BGR1dXbUpuMEowR2RJK3hjZVJCUkM4d3QzU09h?=
 =?utf-8?B?ZFZjTjU4MnRSL2NsYm9nM0FHV2U2ZDE1NXBuWTdTZU9OcGI4dG9Ubzl4d09D?=
 =?utf-8?B?UmhocVJsUFkvdlF5a0RGbGl5RGQ4UDRIT2ZCcGZBSmo3QXY4Q3pMZGRMckRy?=
 =?utf-8?B?VDhnR00xbGxaZWo1VjhNa25CT0tIaE12eHcrTGJJSHRndGlOaFBBc05lV3dN?=
 =?utf-8?B?MTVkY1hUT3RoYmhrNWVlc1ZYTzNuRXhPVkxGUU1LelBzOWlIMlZjVW1iZDlm?=
 =?utf-8?B?UHNPUHU2S2wxZWFUN09yVFRxcFNZMGpuZEgzTXdNQTNwdkxweEY0MlgvUDRr?=
 =?utf-8?B?NU5jOWIzRVcrMGVZRlJ6Qm1ndzJCVytqUHMwSTVrY28ycHo5SVhxM2Z5bG5x?=
 =?utf-8?B?ZjcyVk9WYTNYV3lxa09mOGIxZkN2dEJLMVMveVNLMEs3b0FTYlU4UFFlcEFt?=
 =?utf-8?B?Y3lmVjZYbVVIR0RsUUF3dmg1c1YvNGZ6bnNTTFo3cURiRHdUQkpkbEdPUi85?=
 =?utf-8?B?c2x4bTJVK3VjbFk0UWlZdFdUcGpZNm1HMldpUnpoZC9ZVGFqeU5XYXZYSXl6?=
 =?utf-8?B?NDdudW9tb0ZlcU45Umc0NVdhSjlRNG02QUVwQkNqbEtuRmNseHdya0xvQUJH?=
 =?utf-8?B?Y1NvUG1MQWFaSjB4UmR6S3AwSE5iSWFscVprUHAwdk1WamdBcHBKYXdrUkdJ?=
 =?utf-8?B?dEVOUnc1RzgrdzdpRDdIY1lZdDJxMlU5eFVZTncxZnAyMlA5WVg1RVZFMUN0?=
 =?utf-8?B?MVZ6bDBMQzJkd1Q1ZHQrRDdpWTJUcldoZ0p3djRCRDhGUklMcEwvK3NVWTZs?=
 =?utf-8?B?QW5mNCtOMUo1RCs5TTU2NlhsRlVhR01LMkRhK0FHeUlYTGZvY0hOY0ZCMkRY?=
 =?utf-8?B?RHYremZxRHgwd2MyQ2dYUkJYekNVSEI5aVh5c2p1NFYxQktxV0l4QnJCcmY2?=
 =?utf-8?B?T0g0Qk5xU1ZaeGV0S3hUNDlZN3VzNFFQVDI0bWNjV1VYL0hXcFZ1RmJoQ3ha?=
 =?utf-8?B?MGpBSFdxaVF4UG5rb2Zsd0VGWEZzWUorWDlpaUQzdWxtTWZjTlJOTTBxTGpz?=
 =?utf-8?B?SUp6T2NURlN5VlVXYlVNakEyRUM1Vnhxc0RKTDNheE9wSmJkaGR3ODhkcWVN?=
 =?utf-8?B?NnJaelFLRXgveTBabDNyd0JCRFdQaW5nd3FiTi9sRGxvZEd3eFRHdmpENy9T?=
 =?utf-8?B?QVM3blJ6bkNmbkZHWDZKRlk0K0I3c0dYUG11RnpvRTdmcUtDVjI4Y1dpa09C?=
 =?utf-8?B?ZnVzTDN4b2NVcXhMNml6UklwMy8vcHkvekJqZHUyU25Kbk50VU1EcTdLTmpM?=
 =?utf-8?B?Q2VYN0tybVZFZ3ZoaUUwR1d6aXlnSTgyaTVIU2ZKNVJXWUFybTY4N29pUXVv?=
 =?utf-8?Q?nMlg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6668.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1784caf-5ddc-4d27-804c-08dd341cbd5c
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2025 21:53:39.6554
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Lq4tnoEnnHNOdIde8bSo3+S4ieyX8D36JJ+vrDs1rjXweKL4iy+HZlYwmcspmOULg7PK4stG0AaX7obTYlyyfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8267

SGkgSWxwbywNCg0KVGhhbmsgeW91IGZvciByZXZpZXcuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0NCj4gRnJvbTogSWxwbyBKw6RydmluZW4gPGlscG8uamFydmluZW5AbGludXguaW50
ZWwuY29tPg0KPiBTZW50OiBNb25kYXksIDEzIEphbnVhcnkgMjAyNSAxODoyNQ0KPiBUbzogVmFk
aW0gUGFzdGVybmFrIDx2YWRpbXBAbnZpZGlhLmNvbT4NCj4gQ2M6IEhhbnMgZGUgR29lZGUgPGhk
ZWdvZWRlQHJlZGhhdC5jb20+OyBNaWNoYWVsIFNoeWNoDQo+IDxtaWNoYWVsc2hAbnZpZGlhLmNv
bT47IENpanUgUmFqYW4gSyA8Y3JhamFua0BudmlkaWEuY29tPjsgRmVsaXggUmFkZW5za3kNCj4g
PGZyYWRlbnNreUBudmlkaWEuY29tPjsgT2xla3NhbmRyIFNoYW1yYXkgPG9sZWtzYW5kcnNAbnZp
ZGlhLmNvbT47DQo+IHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnDQo+IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0ggcGxhdGZvcm0tbmV4dCB2MiAwNS8xMF0gcGxhdGZvcm0vbWVsbGFub3g6
IG1seHJlZy0NCj4gaG90cGx1ZzogQWRkIHN1cHBvcnQgZm9yIG5ldyBmbGF2b3Igb2YgY2FwYWJp
bGl0eSByZWdpc3RlcnMNCj4gDQo+IEhpIFZhZGltLA0KPiANCj4gSSB3YXMgbm8gbG9uZ2VyIGFt
b25nIHRoZSByZWNlaXBpZW50cyBkZXNwaXRlIGJlaW5nIG1hcmtlZCBhcyBNOiBmb3IgdGhpcw0K
PiBmaWxlLiBBbHNvIGxrbWwgaXMgbm90IHRoZXJlIGRlc3BpdGUsDQo+IA0KPiBzY3JpcHRzL2dl
dF9tYWludGFpbmVyLnBsIC1mIGRyaXZlcnMvcGxhdGZvcm0vbWVsbGFub3gvbWx4cmVnLWhvdHBs
dWcuYw0KPiANCj4gcmV0dXJuaW5nIGJvdGggc28gdGhlcmUncyBzdGlsbCBzb21ldGhpbmcgd3Jv
bmcgaW4gdGhlIHdheSB0aGUgcmVjZWlwaWVudHMgYXJlDQo+IHNlbGVjdGVkLg0KPiANCj4gT24g
TW9uLCAxMyBKYW4gMjAyNSwgVmFkaW0gUGFzdGVybmFrIHdyb3RlOg0KPiANCj4gPiBIb3RwbHVn
IHBsYXRmb3JtIGRhdGEgaXMgY29tbW9uIGFjcm9zcyB0aGUgdmFyaW91cyBzeXN0ZW1zLCB3aGls
ZQ0KPiA+IGhvdHBsdWcgZHJpdmVyIHNob3VsZCBiZSBhYmxlIHRvIGNvbmZpZ3VyZSBvbmx5IHRo
ZSBpbnN0YW5jZXMgcmVsZXZhbnQNCj4gPiB0byBzcGVjaWZpYyBzeXN0ZW0uDQo+ID4NCj4gPiBG
b3IgZXhhbXBsZSwgcGxhdGZvcm0gaG9wdHBsdWcgZGF0YSBtaWdodCBjb250YWluIGRlc2NyaXB0
aW9ucyBmb3INCj4gPiBmYW4xLCBmYW4yLCAuLi4sIGZhbntufSwgd2hpbGUgc29tZSBzeXN0ZW1z
IGVxdWlwcGVkIHdpdGggYWxsICduJw0KPiA+IGZhbnMsIG90aGVycyB3aXRoIGxlc3MuDQo+ID4g
U2FtZSBmb3IgcG93ZXIgdW5pdHMsIHBvd2VyIGNvbnRyb2xsZXJzLCBBU0lDcyBhbmQgc28gb24u
DQo+ID4NCj4gPiBGb3IgZGV0ZWN0aW9uIG9mIHRoZSByZWFsIG51bWJlciBvZiBlcXVpcHBlZCBk
ZXZpY2VzIGNhcGFiaWxpdHkNCj4gPiByZWdpc3RlcnMgYXJlIHVzZWQuDQo+ID4gVGhlc2UgcmVn
aXN0ZXJzIHVzZWQgdG8gaW5kaWNhdGUgcHJlc2VuY2Ugb2YgaG90cGx1ZyBkZXZpY2VzIHRocm91
Z2gNCj4gPiB0aGUgYml0bWFwLg0KPiA+DQo+ID4gRm9yIHNvbWUgbmV3IGJpZyBtb2R1bGFyIHN5
c3RlbXMsIHRoZXNlIHJlZ2lzdGVycyB3aWxsIHByb3ZpZGUNCj4gPiBwcmVzZW5jZSBieSBjb3Vu
dGVycy4NCj4gPg0KPiA+IFVzZSBzbG90IHBhcmFtZXRlciB0byBkZXRlcm1pbmUgd2hldGhlciBj
YXBhYmlsaXR5IHJlZ2lzdGVyIGNvbnRhaW5zDQo+ID4gYml0bWFzayBvciBjb3VudGVyLg0KPiA+
DQo+ID4gU29tZSAnY2FwYWJpbGl0eScgcmVnaXN0ZXJzIGNhbiBiZSBzaGFyZWQgYmV0d2VlbiBk
aWZmZXJlbnQgcmVzb3VyY2VzLg0KPiA+IFVzZSBmaWVsZHMgJ2NhcGFiaWxpdHlfYml0JyBhbmQg
J2NhcGFiaWxpdHlfbWFzaycgZm9yIGdldHRpbmcgb25seQ0KPiA+IHJlbGV2YW50IGNhcGFiaWxp
dHkgYml0cy4NCj4gPg0KPiA+IFJldmlld2VkLWJ5OiBGZWxpeCBSYWRlbnNreSA8ZnJhZGVuc2t5
QG52aWRpYS5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogVmFkaW0gUGFzdGVybmFrIDx2YWRpbXBA
bnZpZGlhLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9wbGF0Zm9ybS9tZWxsYW5veC9tbHhy
ZWctaG90cGx1Zy5jIHwgMjMNCj4gPiArKysrKysrKysrKysrKysrKysrKy0tDQo+ID4gIDEgZmls
ZSBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvcGxhdGZvcm0vbWVsbGFub3gvbWx4cmVnLWhvdHBsdWcuYw0KPiA+
IGIvZHJpdmVycy9wbGF0Zm9ybS9tZWxsYW5veC9tbHhyZWctaG90cGx1Zy5jDQo+ID4gaW5kZXgg
MGNlOWZmZjFmN2Q0Li4zZTQ4MGMzMjIzNTMgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9wbGF0
Zm9ybS9tZWxsYW5veC9tbHhyZWctaG90cGx1Zy5jDQo+ID4gKysrIGIvZHJpdmVycy9wbGF0Zm9y
bS9tZWxsYW5veC9tbHhyZWctaG90cGx1Zy5jDQo+ID4gQEAgLTI3NCw2ICsyNzQsMTMgQEAgc3Rh
dGljIGludCBtbHhyZWdfaG90cGx1Z19hdHRyX2luaXQoc3RydWN0DQo+IG1seHJlZ19ob3RwbHVn
X3ByaXZfZGF0YSAqcHJpdikNCj4gPiAgCQkJaWYgKHJldCkNCj4gPiAgCQkJCXJldHVybiByZXQ7
DQo+ID4NCj4gPiArCQkJaWYgKCFyZWd2YWwpDQo+ID4gKwkJCQljb250aW51ZTsNCj4gPiArDQo+
ID4gKwkJCS8qIFJlbW92ZSBub24tcmVsZXZhbnQgYml0cy4gKi8NCj4gPiArCQkJaWYgKGl0ZW0t
PmNhcGFiaWxpdHlfbWFzaykNCj4gPiArCQkJCXJlZ3ZhbCA9IHJvbDMyKHJlZ3ZhbCAmIGl0ZW0t
PmNhcGFiaWxpdHlfbWFzaywNCj4gPiArCQkJCQkgICAgICAgaXRlbS0+Y2FwYWJpbGl0eV9iaXQp
Ow0KPiANCj4gSXMgdGhlIGludGVudGlvbiBoZXJlIHRvIHJlYWxseSBkbyBfcm90YXRlXyBiaXRz
IG9yIGlzIGl0IGp1c3Qgbm9ybWFsIHNoaWZ0aW5nIGdvaW5nDQo+IG9uPyBJdCBtaWdodCBiZSB0
aGUgYml0cyBtaWdodCBuZXZlciByb3RhdGUgcGFzdCAzMi1iaXQgYm91bmRhcnkgc28gaXQgaXMN
Cj4gZWZmZWN0aXZlbHkganVzdCBzaGlmdGluZyBidXQgbGFiZWxpbmcgaXQgYXMgcm90YXRlIGlz
IHN0aWxsIHdyb25nIGlmIGJpdCByb3RhdGUgaXMgbm90DQo+IGludGVuZGVkLg0KPiANCj4gSSBz
ZWUgdGhlcmUgYXJlIGFsc28gdHdvIHByZS1leGlzdGluZyByb2wzMigpIGNhbGxzIGluc2lkZQ0K
PiBkcml2ZXJzL3BsYXRmb3JtL21lbGxhbm94LyB3aXRoIG9uZSBvZiB0aGVtIHRhbGtpbmcgYWJv
dXQgInNoaWZ0IiBzbyBJDQo+IHN1c3BlY3QgdGhleSBtaWdodCBiZSBhbHNvIHdyb25nbHkgdXNp
bmcgcm9sMzIoKSB0aGF0IGRvZXMgcm90YXRlDQoNClllcywgdGhlIGludGVudGlvbiB3YXMgdG8g
c2hpZnQuDQpJJ2xsIGNoYW5nZSB0bw0KCXJlZ3ZhbCA9IChyZWd2YWwgJiBpdGVtLT5jYXBhYmls
aXR5X21hc2spIDw8IGl0ZW0tPmNhcGFiaWxpdHlfYml0Ow0KDQpBbmQgbGF0ZXIgcHJlcGFyZSBm
aXggZm9yIG90aGVyIHBsYWNlcy4NCg0KDQo+IA0KPiA+ICAJCQlpdGVtLT5tYXNrID0gR0VOTUFT
SygocmVndmFsICYgaXRlbS0+bWFzaykgLSAxLCAwKTsNCj4gPiAgCQl9DQo+ID4NCj4gPiBAQCAt
Mjk0LDcgKzMwMSwxOSBAQCBzdGF0aWMgaW50IG1seHJlZ19ob3RwbHVnX2F0dHJfaW5pdChzdHJ1
Y3QNCj4gbWx4cmVnX2hvdHBsdWdfcHJpdl9kYXRhICpwcml2KQ0KPiA+ICAJCQkJaWYgKHJldCkN
Cj4gPiAgCQkJCQlyZXR1cm4gcmV0Ow0KPiA+DQo+ID4gLQkJCQlpZiAoIShyZWd2YWwgJiBkYXRh
LT5iaXQpKSB7DQo+ID4gKwkJCQkvKg0KPiA+ICsJCQkJICogSW4gY2FzZSBzbG90IGZpZWxkIGlz
IHByb3ZpZGVkLCBjYXBhYmlsaXR5DQo+ID4gKwkJCQkgKiByZWdpc3RlciBjb250YWlucyBjb3Vu
dGVyLCBvdGhlcndpc2UNCj4gYml0bWFzay4NCj4gPiArCQkJCSAqIFNraXAgbm9uLXJlbGV2YW50
IGVudHJpZXMgaWYgc2xvdCBzZXQgYW5kDQo+ID4gKwkJCQkgKiBleGNlZWRzIGNvdW50ZXIuIE90
aGV3aXNlIHZhbGlkYXRlIGVudHJ5IGJ5DQo+ID4gKwkJCQkgKiBtYXRjaGluZyBiaXRtYXNrLg0K
PiA+ICsJCQkJICovDQo+ID4gKwkJCQlpZiAoZGF0YS0+Y2FwYWJpbGl0eV9tYXNrKQ0KPiA+ICsJ
CQkJCXJlZ3ZhbCA9IHJvbDMyKHJlZ3ZhbCAmIGRhdGEtDQo+ID5jYXBhYmlsaXR5X21hc2ssDQo+
ID4gKwkJCQkJCSAgICAgICBkYXRhLT5jYXBhYmlsaXR5X2JpdCk7DQo+IA0KPiBBbm90aGVyIHJv
bDMyKCkgaGVyZT8NCj4gDQo+ID4gKwkJCQlpZiAoZGF0YS0+c2xvdCA+IHJlZ3ZhbCkgew0KPiA+
ICsJCQkJCWJyZWFrOw0KPiA+ICsJCQkJfSBlbHNlIGlmICghKHJlZ3ZhbCAmIGRhdGEtPmJpdCkg
JiYgIWRhdGEtPnNsb3QpIHsNCj4gPiAgCQkJCQlkYXRhKys7DQo+ID4gIAkJCQkJY29udGludWU7
DQo+ID4gIAkJCQl9DQo+ID4gQEAgLTYxMSw3ICs2MzAsNyBAQCBzdGF0aWMgaW50IG1seHJlZ19o
b3RwbHVnX3NldF9pcnEoc3RydWN0DQo+IG1seHJlZ19ob3RwbHVnX3ByaXZfZGF0YSAqcHJpdikN
Cj4gPiAgCQkJCWlmIChyZXQpDQo+ID4gIAkJCQkJZ290byBvdXQ7DQo+ID4NCj4gPiAtCQkJCWlm
ICghKHJlZ3ZhbCAmIGRhdGEtPmJpdCkpDQo+ID4gKwkJCQlpZiAoIShyZWd2YWwgJiBkYXRhLT5i
aXQpICYmICFkYXRhLT5zbG90KQ0KPiA+ICAJCQkJCWl0ZW0tPm1hc2sgJj0gfkJJVChqKTsNCj4g
PiAgCQkJfQ0KPiA+ICAJCX0NCj4gPg0KPiANCj4gLS0NCj4gIGkuDQoNCg==
