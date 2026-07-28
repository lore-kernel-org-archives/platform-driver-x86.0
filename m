Received: from SY5PR01CU010.outbound.protection.outlook.com (mail-australiaeastazolkn19012014.outbound.protection.outlook.com [52.103.72.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E083F44CA;
	Tue, 28 Jul 2026 18:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.72.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785262217; cv=fail; b=UFzUIKyUqyo0T5X/QB8pZoryh2/aGCMBLfmE6fWehN7FevviJQ4EoRskwfJtHKsIlIGqsf8Uwg62+edMsMQpkgzs+Rpk5GStfdG54qBKvYcjS1hI4agk2OdcsqHxeQS6XzpZOLL/THnzOJjYIMggDJOOUWdvB9rBtELFZqJ/qKU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785262217; c=relaxed/simple;
	bh=X+PobUBFHnjlsExB4ezXgkVIlLvFzjyotVobSk9OV1Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LFdU8dF9RUy3Vo6qdDlZ0nUdbH4dA/HwlpujaQtpKyyofDDIRUY/nVmtYGZHH5xzIUTmq4F2yhf5iQoz0zAQE1tub8+3WyWirDn1e0P3Pda8JlFzacrdM/VnC/43KU+XSX3nQ8mIYOvCn3bBO9/rhNSCdVVW1POAjxexLlbCx/A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=Kk9TBuFm; arc=fail smtp.client-ip=52.103.72.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="Kk9TBuFm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JrKN9uaOaPQ27pkfV4IjMl+lFXV3rDVUvawl6pg1Di/1nkq3OOEfe38U7auzVzacrm1kAPVlgbxRslbeac2F4CUpBnrhsi9sISkCTNC5izk0YMoa0GqV6lXJ5b/pZYTNRApbCOVqDLQ5A10HQbJ36d+ieSXhKjmeoqwTwSiDO2BEAiotVgbWNJf4m3qXdB7oU3t6LqECZ1gLI6ovUFZ4pFADlzFDBKHnCx+pxSQ83OnhSny73Dc2qmdKX3FP2Ut4v+Q3b/tM69TDRmjydQIxLGj2qTsqJQ9KQsL+naKPFDHQ7AJzLsErR5lK5CNdkqQZH5d+eX3da93KPcz/Xhc0QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X+PobUBFHnjlsExB4ezXgkVIlLvFzjyotVobSk9OV1Q=;
 b=e863NusUTZXVE1yFjqiwj+qFAYeeTUp7Mxc0VVPltbU2/66uQzZ/EzxxrgH5duwYYHOjSqdDgRCFZvFFeWHNiMFpqZwgaBCRIdwSifbXWnOUkI5G4MNOqfxlxzy2OkCziBpr/th2mj9o0PhbuLOL3b5zWYzQzeL8tm8YrTUlaRqc0oVGA/BWQ6AQWjnzUXenoLVus4MzuzMNiJUrfL1VbBWM3hjmDSXdQWV3f1nmz0ChGix7DmaGdxDHp0Z2GKRWHY7jFlhd6/sxW2boC0rJW1ykn+Gz61V+IF0sU49p2uKBopLcvtywU5D0OItWa1sV1B/XcI86SGvFtpUy2mreeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X+PobUBFHnjlsExB4ezXgkVIlLvFzjyotVobSk9OV1Q=;
 b=Kk9TBuFmgZSHEeoUqk5R79L0X6XqZG9sQ9FpsIZTN6Zo7u9+5/v1JuY26trJpvW8x0xPHUjtVxgsnV7r6aMfaJlndaKihLB7JbmqbFu4634edepwBTSpoLmLF6thSTva9ER3aX3Xfc9/lcC+CmvAdSR/5cgify1CMRz84PKUy6DhqjLaVEtywswxsGJUyodntFA7/ZH4XsAKu7akWw1+RTtGfV9B51L8SlRZZoV13I4CgDtW4ULNGjZA9VPx9O+ctWMFTc4DhVDmZ8DdXTIe0qJ7+A+Xm1PJo4vjzoe8olouklJrK0E9odpdi8dsStK7PTDpytkoJhSMXLh6g6Hemg==
Received: from SY7PR01MB10809.ausprd01.prod.outlook.com (2603:10c6:10:334::8)
 by MEYPR01MB6613.ausprd01.prod.outlook.com (2603:10c6:220:116::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Tue, 28 Jul
 2026 18:10:07 +0000
Received: from SY7PR01MB10809.ausprd01.prod.outlook.com
 ([fe80::5ed:40ff:547d:2ada]) by SY7PR01MB10809.ausprd01.prod.outlook.com
 ([fe80::5ed:40ff:547d:2ada%4]) with mapi id 15.21.0270.009; Tue, 28 Jul 2026
 18:10:07 +0000
From: =?utf-8?B?5a2ZIOiqiemTrQ==?= <wolf109909@outlook.com>
To: "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mingyou
 Chen <qby140326@gmail.com>, Armin Wolf <W_Armin@gmx.de>, Hans de Goede
	<hansg@kernel.org>, =?utf-8?B?SWxwbyBKw6RydmluZW4=?=
	<ilpo.jarvinen@linux.intel.com>, Nabil Danial <nabildanial.93@gmail.com>,
	=?utf-8?B?5a2ZIOiqiemTrQ==?= <wolf109909@outlook.com>
Subject: [RESEND PATCH 5/5] Documentation: wmi: bitland-mifs-wmi: document
 MIFS v2 firmware variant
Thread-Topic: [RESEND PATCH 5/5] Documentation: wmi: bitland-mifs-wmi:
 document MIFS v2 firmware variant
Thread-Index: AQHdHrxSqAQXBCUQk0yDwqBP3QFf4w==
Date: Tue, 28 Jul 2026 18:10:07 +0000
Message-ID: <20260728180944.51356-6-wolf109909@outlook.com>
References: <20260728180944.51356-1-wolf109909@outlook.com>
In-Reply-To: <20260728180944.51356-1-wolf109909@outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SY7PR01MB10809:EE_|MEYPR01MB6613:EE_
x-ms-office365-filtering-correlation-id: 8ac8fe63-9d23-4c26-74e5-08deecd37511
x-microsoft-antispam:
 BCL:0;ARA:14566002|6050399003|38102599003|25031999004|15080799012|31061999003|8062599012|51005399006|8060799015|19110799012|24021099003|3412199025|440099028|26104999009|102099032|40105399003|3430499035|1710799026;
x-microsoft-antispam-message-info:
 =?utf-8?B?elRlV0RSRDJZdFM4cktZcDhYM0ZOQ0k1V05vck9VcS85alp0YmRVMnBFMUZE?=
 =?utf-8?B?Y0g4Uy9oYTVpNXc3WVROTnRyYjJ5VzE3eFVsVVA3UXFKQTdYbkVOTDYyMjl6?=
 =?utf-8?B?U2N4Znh3OHBkL0Z5VWhSdy9SNGNTZjB4UWMzZmtHemdnVWlrZVRsWndleGh1?=
 =?utf-8?B?Wm43ZGUzUEUrdFpHUlo3dUJncUl4ZlpDYjhtbytSTTV4MVZEOTFocDlRdmQ3?=
 =?utf-8?B?TDB2TE94akcxUi94bis1N0N0U3VBZXVtYm9JellRK2VQT2Y5WVBDMmlNMEZZ?=
 =?utf-8?B?UmltN3l6bmd4aDNZYjFTbDlMbTlpTjdPQlZlMUMyZDc2WHZwUHl4K3QzYzFV?=
 =?utf-8?B?L2NGdm1LZ2wwbTh4cTU3TEFuZUdpYXdLamRtOWdrMWNBSWRnTDZ1TWl0STVr?=
 =?utf-8?B?MjZ0c1oxTUxST0dGYUxsWDhrblBxRUg1Znd4VnAyNUtWV01kQ3U1NmlCU1A3?=
 =?utf-8?B?R0c3cUZrOXRqNEswNVp5NmJrRzZOMFcwSnY0c1htMWVpQ3B6MVUrOTVYYmRi?=
 =?utf-8?B?MmU4V2tLR1FyQ1NLOHlaSWpLZitab0tWc281NU9HOENLNUxYZ1I2SHNSS29N?=
 =?utf-8?B?cFBFSlJwaWdlWUJ4R1ZKR09tS3Y2UnIrVy9RcHBGTXd2YTVjTnZyOWF2OEp3?=
 =?utf-8?B?dnZhWFo5cmJIeWRjUHErWmZnek1Lc0taQ1lYamtVdDdmVXM4TVg2aitFTjZx?=
 =?utf-8?B?d1lEZUIwSnIxS1hPRGM3dlhTZW5VSXVxZnoyYnRjZWpzMnhwNkxma0FzRnNZ?=
 =?utf-8?B?M29jZEpCOUtJNnRqSjFxS0VtS0RSUjI0emZkY0xwWmd3b2dKQnhMZkl3V3Mz?=
 =?utf-8?B?Uzk2YzFEelNVRlhzK050U0NBaDFDc3lFa1kxcENKTEMwU3VRdXFyVDJKa3NU?=
 =?utf-8?B?NFlSYWNGdk9ncnd1Nk1EUmF5VDltRENRckdjSWFQdXNxV1pUWU9ZNU1iajU4?=
 =?utf-8?B?a1JpR0RKTUtNRkRZOVJqNXlZOXJHODY1b0hzTGJjZ3YreThpWXVLem5XU0Ix?=
 =?utf-8?B?VzRmQm5IVVg5ekNST2VtS3NsMmtvWW5Ud3pQRENvUTU1KzVNV3Z1d3RBTXhk?=
 =?utf-8?B?UWRFRlVBeXVzdFVxZnlTNkdzZVFvNWZSOUlSY05WM0JMdTl2SGZ1NjdTT0pL?=
 =?utf-8?B?bkRVTUlpM0h3bmFPMnFadXZYeDVJRytRVEdzNlJBbGIyREtFTnYveHZEMnNi?=
 =?utf-8?B?YThqdlExTHFrNWpGQTF4SlpqeHlrTU5Uci9ZdVBFSGd6OTNoNmN2cXFmc08y?=
 =?utf-8?B?NTNGMVBLV00zQUFwRjBUdDkrRmRSVEZ6K3RubEk5TUFuMTRHY2thRGJXd1Rm?=
 =?utf-8?B?cHpsZXdqcmlPWjF5UXFGNHVoVTkzc3pSZ0xVbjVFWEpkTUdocEtOd0I0djdO?=
 =?utf-8?B?Ukd2NkhBOFFWbnc9PQ==?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QWZQbHh3bEZtbTJ3ck9UTXRBZVRyUXo3a2F6SE9vRUdUZytTY21iTkVETE1z?=
 =?utf-8?B?Zml6NWwwRDltREs0a0ZXY0M4NGp4T2NCVlZrNDhQb2dUQUFYc0VHOFQraW54?=
 =?utf-8?B?RXUwUUJOVE9YQ3lOL052eGNvcXM1K2RCYytuaC96MUpmcGY2c0NsNWpjbzF4?=
 =?utf-8?B?VmJkd2FFTW9EekVYLzVmbnFyYlc5LzBWbnZ2SkVFK0R1dXYyajdkRTVXR2Za?=
 =?utf-8?B?RTJwUWM5M0RXM3lYQUs5ZDJ0WVRkMmZrU3JhMkhrdENtSi83aDAwc1cxSVZU?=
 =?utf-8?B?dFl5N2hLaCtuUW4veml3ZUNBSUI4cWpla1htS3F5dFByKzNZSmpFdDNoQ3Zu?=
 =?utf-8?B?UzZvdy9YUXliUC8wdDhSbjEycmhnS1N4L0NRT3VhV1NEZ0wwSEJqeXgyTDJU?=
 =?utf-8?B?dWZkQ1ROTFNCM1dwd1F2ZHhRM1RXZytQdHNNUm9ZVEJudVNjRUVuVUxkZU5E?=
 =?utf-8?B?d3h6Y0ZaTDhCWXoxeUk3V1F4WTBLVzBpZDVFT3BXWnk1Z1l2ODlMUkZZMkZo?=
 =?utf-8?B?NkdjczIrV2ZTeG8xWHV0SC9ZZnNaSGRzM1VoOVBCZmVOV0NybFNQUHJBSVpj?=
 =?utf-8?B?dk92WmZSRDJuZXgvZWU3RVlKcVNia0hHaVVMaGtOY2RSdjZjVVFteUlnUit2?=
 =?utf-8?B?K29UTXhtaFI5RXFFSGN3T2w3ZjN3eXNEYnZiOW1GdGVmR3JHZkgxaUNYUGtr?=
 =?utf-8?B?bE90QVNGOEh4RWN0WXVXLzdmbThreFZaN2dFV2FUcURGM2dUU0NZQ3ZkT1Er?=
 =?utf-8?B?R1ZiQTl3ZUxZdnBQS2RIYXZwaEd3OTZzb084aHhKUTFDNm9GNTl6UGc2THBk?=
 =?utf-8?B?SlRiRXRWZlUreFJwRjQvRTkwVWF3TzdHeXRiSDJ3dEM0WmNORlZNTkNaZXd4?=
 =?utf-8?B?aHpveStCQ2xlVUlBZ1p1Sk11NGVrNC8ydHdsRjdNMnFlUEVNNjlYc2RCL0ZD?=
 =?utf-8?B?dFlRY2JtLzhuRVc5ZEgzdzIzUm1oa3hXc1hCNFNMVFlvM1UyaytPMjJ4RUtO?=
 =?utf-8?B?T2MwSG54S2NDUUVmbmtFdk9sRHRkRGF3WE41Qkp4Nk1XT1ZyNEdDUnFjT3JP?=
 =?utf-8?B?cmZnVW5UUmtJbUFWelV2eW04UjBGOWRNbFNkbGNXNW85OXoxOG16SmRZUnR4?=
 =?utf-8?B?TmxPT0N3bmZtVk1jREtRWkJieXU3TGVmeVhSVGg3RUdLRjRsQ1BiM21ubmZX?=
 =?utf-8?B?UmhQL29Ea1ltcVdtVWNUaUZOTlFXVzdQMGlNSVhYRTEzM3QvM0dsUWxLQkhD?=
 =?utf-8?B?VzkxODFTT280bkpSSGw0dUlUZzQvZWhxYlg2aU83NHVhZXNrWmtPR2Vzdzk3?=
 =?utf-8?B?RFFNcENJdkMwWHhCR21FSGh1Yis0RDBXdHpnQ2ZtdjRCVEFhZ0wvK0pDVmUy?=
 =?utf-8?B?NFdhenRYZzJnSnIyMWhPQXA3bXMva2U2c2x1eGdibWlFa1BndnpVRUJYelQz?=
 =?utf-8?B?ZEU0dmViSndEdnNXOWdLYzFhVlQ3Y09CVWdqSFMwLzNpdzNoSXhtaGs3L0RW?=
 =?utf-8?B?bE40YXJwZWJkY2lXT1p6eUVaVWNpNzk1QjQrR1JlbWFRRFJSR0R5NUJuM2tC?=
 =?utf-8?B?alpvU0lGNHp5a1Nva3p4cTBuT0MvQVFvOXQ3ellzNFN0Qk9WRGNHRzRyZ3RG?=
 =?utf-8?B?SU0wMW51S3hpV2ZSbWx1ZDVZQUNFWXh1M0lWVVpnZm1vS2svSVJjMFV1a1Nj?=
 =?utf-8?B?V2svbS9EQm40VytEclhSWlY5bkdBclpvODV0L0kxeEN0MTBnMkdWSy9uelR4?=
 =?utf-8?B?UW01NDFTOXVWM1hUMWptOTNnRUVFTitEaVI2VTlucC9KeUh0VmJPNE95eDd1?=
 =?utf-8?B?SHA5c1JyaGxnT0lsY1ZBSGhmOXNtdFMxUHk0MzVLQStNbVk0UzNBUFVBSkV2?=
 =?utf-8?Q?bHLyeFIjVstnM?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SY7PR01MB10809.ausprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ac8fe63-9d23-4c26-74e5-08deecd37511
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2026 18:10:07.4419
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MEYPR01MB6613

RG9jdW1lbnQgdGhlIHJlZHVjZWQgTUlGUyB2MiBjb21tYW5kIHNldCBmb3VuZCBvbiBuZXdlciBt
YWNoaW5lczoNClFGQU4gcGVyZm9ybWFuY2UtbW9kZSBjb2RlcyB7MiwzLDQsOSwxMH0sIGZhbiB0
YWNob21ldGVyIGxvY2F0aW9uIGluDQp0aGUgRUMgc2hhcmVkLW1lbW9yeSB3aW5kb3cgKG5vIFdN
SSBmYW4gZnVuY3Rpb24pLCB0aGUgbWlzc2luZyBFQ09ODQpkZWZpbml0aW9uIHRoYXQgZGlzYWJs
ZXMgdGhlIEFDUEkgRUMgZHJpdmVyIChhbmQgaG93IHRoZSBkcml2ZXIgd29ya3MNCmFyb3VuZCBp
dCBmb3IgdGhlIGxpZCBzd2l0Y2gpLCBhbmQgdGhlIFdNQUEgcmVwbHkgc3RhdHVzIHdvcmQuDQoN
ClNpZ25lZC1vZmYtYnk6IFl1bWluZyBTdW4gPHdvbGYxMDk5MDlAb3V0bG9vay5jb20+DQotLS0N
CiAuLi4vd21pL2RldmljZXMvYml0bGFuZC1taWZzLXdtaS5yc3QgICAgICAgICAgfCAyNiArKysr
KysrKysrKysrKysrKysrDQogMSBmaWxlIGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKykNCg0KZGlm
ZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vd21pL2RldmljZXMvYml0bGFuZC1taWZzLXdtaS5yc3Qg
Yi9Eb2N1bWVudGF0aW9uL3dtaS9kZXZpY2VzL2JpdGxhbmQtbWlmcy13bWkucnN0DQppbmRleCA5
ZTg2ZWNjMi4uZDAxOWE0YzggMTAwNjQ0DQotLS0gYS9Eb2N1bWVudGF0aW9uL3dtaS9kZXZpY2Vz
L2JpdGxhbmQtbWlmcy13bWkucnN0DQorKysgYi9Eb2N1bWVudGF0aW9uL3dtaS9kZXZpY2VzL2Jp
dGxhbmQtbWlmcy13bWkucnN0DQpAQCAtMTMzLDYgKzEzMywzMiBAQCBUaGUgZHJpdmVyIGxpc3Rl
bnMgZm9yIGV2ZW50cyBmcm9tIHRoZSBgYEhJRF9FVkVOVDIwYGAgY2xhc3MNCiAoR1VJRDogYGB7
NDZjOTNlMTMtZWU5Yi00MjYyLTg0ODgtNTYzYmNhNzU3ZmVmfWBgKS4gVGhlc2UgZXZlbnRzIGFy
ZSB0cmlnZ2VyZWQNCiBieSBob3RrZXlzIG9yIHN5c3RlbSBzdGF0ZSBjaGFuZ2VzIChlLmcuLCBw
bHVnZ2luZyBpbiBBQyBwb3dlcikuDQogDQorTUlGUyB2MiBmaXJtd2FyZSB2YXJpYW50DQorPT09
PT09PT09PT09PT09PT09PT09PT09DQorDQorU29tZSBuZXdlciBtYWNoaW5lcyAoZS5nLiBYaWFv
bWkgQm9vayBQcm8gMTQgMjAyNiwgUkVETUkgQm9vayBQcm8gMTQgMjAyNSkNCitzaGlwIGEgcmVk
dWNlZCBNSUZTIGZpcm13YXJlLCBjYWxsZWQgInYyIiBoZXJlLiBJdHMgV01BQSBtZXRob2QgaW1w
bGVtZW50cw0KK29ubHkgZnVuY3Rpb24gZ3JvdXBzIDB4MDgwMC8weDBhMDAvMHgwYzAwLzB4MTAw
MCwgc28gb2YgdGhlIGNvbW1hbmQgdGFibGUNCithYm92ZSBvbmx5IFN5c3RlbVBlck1vZGUgKDB4
MDgpIGFuZCBhIGZldyBzdGF0ZSB0b2dnbGVzIGV4aXN0LiBEaWZmZXJlbmNlczoNCisNCisqIFN5
c3RlbVBlck1vZGUgKDB4MDgpIHJlcG9ydHMgcmF3IFFGQU4gRUMgY29kZXMgaW5zdGVhZCBvZiB0
aGUgMC4uMw0KKyAgZW51bWVyYXRpb246IDIgPSBRdWlldCwgMyA9IEJhbGFuY2VkLCA0ID0gU3Bl
ZWQsIDkvMTAgPSBFeHRyZW1lDQorICAoU01NLWJhY2tlZCkuIFRoZSBkcml2ZXIgbWFwcyB0aGVz
ZSB0byBwbGF0Zm9ybSBwcm9maWxlcyBhbmQgZGV0ZWN0cyB0aGUNCisgIHZhcmlhbnQgYXQgcHJv
YmUgdGltZSB3aGVuIHRoZSByZXBvcnRlZCBtb2RlIGlzIG91dHNpZGUgdGhlIHYxIHJhbmdlLg0K
KyogVGhlcmUgaXMgbm8gV01JIGZhbi1zcGVlZCBvciBDUFUtdGVtcGVyYXR1cmUgZnVuY3Rpb24u
IFRoZSB0d28gZmFuDQorICB0YWNob21ldGVycyBsaXZlIGluIHRoZSBFQyBzaGFyZWQtbWVtb3J5
IHdpbmRvdyBhdCAweEZFMEIwMzAwIChEU0RUDQorICBcX1NCLlBDMDAuTFBDQi5RX0VDIHJlZ2lv
biAiRVJBTSIpIGFzIGxpdHRsZS1lbmRpYW4gdTE2IFJQTSB2YWx1ZXMgYXQNCisgIG9mZnNldHMg
MHg2OSBhbmQgMHg2QiAoMCA9IGZhbiBzdG9wcGVkKS4gVGhlIEVDIGNvbnRyb2xzIHRoZSBmYW5z
DQorICBhdXRvbm9tb3VzbHk7IG5vIE9TIGZhbi1zcGVlZCBvdmVycmlkZSBleGlzdHMgb24gdGhp
cyBmaXJtd2FyZS4NCisqIFRoZSBmaXJtd2FyZSBuZXZlciBkZWZpbmVzIEVDT04sIHNvIFxfU0Iu
UEMwMC5MUENCLlFfRUMuX1NUQSBmYWlscywgdGhlDQorICBBQ1BJIEVDIGRyaXZlciBuZXZlciBi
aW5kcyBhbmQgRUMgcXVlcnkgaGFuZGxlcnMgKGxpZCBzd2l0Y2ggX1EwQy9fUTBELA0KKyAgaG90
a2V5IHF1ZXJpZXMpIG5ldmVyIHJ1bi4gT24gRE1JLW1hdGNoZWQgbW9kZWxzIHRoZSBkcml2ZXIg
cG9sbHMgdGhlDQorICBMU1RFIGxpZCBiaXQgKG9mZnNldCAweDE0LCBiaXQgMCkgaW4gdGhlIEVD
IHdpbmRvdyBhbmQgZXZhbHVhdGVzDQorICBfUTBDL19RMEQgaXRzZWxmIHNvIHRoZSBQTlAwQzBE
IGxpZCBkZXZpY2Uga2VlcHMgZW1pdHRpbmcgU1dfTElELg0KKyogVGhlIHJlcGx5IHN0YXR1cyB3
b3JkIChieXRlcyAwLTEgb2YgT3V0RGF0YSwgU0dFUikgaXMgMHg4MDAwIG9uIHN1Y2Nlc3MNCisg
IGFuZCAweGUwMDAgZm9yIHVua25vd24vdW5zdXBwb3J0ZWQgZnVuY3Rpb25zOyB0aGUgZHJpdmVy
IHR1cm5zIHRoZQ0KKyAgbGF0dGVyIGludG8gLUVPUE5PVFNVUFAuDQorDQogRXZlbnQgU3RydWN0
dXJlDQogLS0tLS0tLS0tLS0tLS0tDQogDQotLSANCjIuNTUuMA0KDQo=
