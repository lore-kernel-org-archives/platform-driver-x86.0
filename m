Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazolkn19013084.outbound.protection.outlook.com [52.103.74.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96FF33B813D;
	Sun, 14 Jun 2026 13:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.74.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781443875; cv=fail; b=trBBzXP0Ver21W+1fe6r3Y04hdC+XhALXvre+DYTKbsxFXE51Me76iszShSZWwhQJmqQhKg7yGJdZzjScO5eFmbg9PeudKr9ucc1d6mzM+hxAsri8eWMfwhvsZdj69/cKyFZdEhH3NpH+jXzy9NoxSsd1Z5a5IjeP1utQn+Bxes=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781443875; c=relaxed/simple;
	bh=aCko1h35Keyyq4uIjueTpdGgm6JSbj8fsw3Yj5IwTC0=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=rx79F0D8zaDS0GuGPmgG05Si1yuaN9dWDniXpEA2RQ2e7LOsm/Wv8XxBKJTelnfrMGr/oRh1jyCMspjqYr5BlF3yrSA/z7g8gpFqKCg+W7ZOOEVvsSerAHAW9x6GsuNX0lX4CtViJnFhedOTZi/hKSiTYEmeTyGsagmAvYo5sPc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=Ps8iCyYK; arc=fail smtp.client-ip=52.103.74.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="Ps8iCyYK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uKU12Qka8I23KOYUrMSbJ/O7fzHwj3wIihCmcbMq/1OhRxB9tZYjyz6ZAGcx1uw+TY88bk8zVz3tk0XIkK7damU9ZPj5sqh2MT7zIKeZeb1AOd65G2saaNUaGHLQjz5oyikkwlWu1yd1Oq7KWDsAaTl7Y/D3oOKoSLFGM6AaY3dNZ6J5RZuOEt9eyNM/k/BEQSdepSu9xw3TK+9kF+kqpqs3tpC/zkHNyZ5BcaYnAVvpWHwdr0gMDpOri4TA2wtRSWEXIob4QqmljHGypxH2FbcbsaEDXRYgjmhxvR/CJXGQg9m87lsIwdVwDFbjJhrusysrBd0OIbByhe9Ph1c6zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aCko1h35Keyyq4uIjueTpdGgm6JSbj8fsw3Yj5IwTC0=;
 b=etx/aYQQtegxgnQN2xISc6+2T1mCgOdHr5sTPMFavXy9shLAPmV88sHjJBg3yU0VLrpwedWXaOX+ICFcGA9rf2Et30FerXNCUSbTbTxAZA4DTEmufSoOR0u5Wl2RBNexoIFxQKW0EPmrl7OUMXZgjlf5sOl+V6Ir4xG9dtf8/s2k8AEl2Y59UlxyIzx6xsJsP8ogmypBrWuk9VxGnz5n7dnnStyVbfUk9GNeo+1K9Wrle21+Xry+LdbKIA4Z/IxWGmvP4VHRlLpTQtAR97OWzL85QdE3a+nE84ULRxlP86BNS5rE5j/tid1TaRGQZGtUTZW8PNi37CM170BWceUrcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aCko1h35Keyyq4uIjueTpdGgm6JSbj8fsw3Yj5IwTC0=;
 b=Ps8iCyYK+51+jefTW2j+eIHejOwD40fZ83sQg1/VxNeJ1Bw5CCBu30+eyMVDrw9LggpFQpwLf3gb4crJlQoTHd9vead+TI3KiJ8LLMe7Rsbv8VF2kzSd3wxTh5R65avi7yNn6IwbyI0cqiHyGIfUUZsj9uWAltbGQ23E7U/md0DKglg1R3Gjrqw2s2DfJXDm1AdkF131u24v7HYvIHjMhYFKP9wSQcIe1Qzu617983CirY8S3Xau5Bph3WibBHwSQLW5skWo/66sjKMSN3ZsRHJ4FkCIK2+I30XtUmuzRkNvf8wLt5gIaK5jBrw9cgbyeqBKSMq6CK/Ch5+1FHKW0w==
Received: from TYSPR03MB8631.apcprd03.prod.outlook.com (2603:1096:405:89::7)
 by SEYPR03MB7191.apcprd03.prod.outlook.com (2603:1096:101:d4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.6; Sun, 14 Jun
 2026 13:31:08 +0000
Received: from TYSPR03MB8631.apcprd03.prod.outlook.com
 ([fe80::b2b7:73c7:c186:a920]) by TYSPR03MB8631.apcprd03.prod.outlook.com
 ([fe80::b2b7:73c7:c186:a920%4]) with mapi id 15.21.0139.009; Sun, 14 Jun 2026
 13:31:08 +0000
From: M K <mk01022025@outlook.com>
To: Ike Panhc <ikepanhc@gmail.com>
CC: M K <mk01022025@outlook.com>, Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>, Hans de Goede
	<hansg@kernel.org>, =?utf-8?B?SWxwbyBKw6RydmluZW4=?=
	<ilpo.jarvinen@linux.intel.com>, "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: [RFC] platform/x86: ideapad-laptop: Question about exposing DYTC
 GK/aggressive fan mode on Lenovo 83LR
Thread-Topic: [RFC] platform/x86: ideapad-laptop: Question about exposing DYTC
 GK/aggressive fan mode on Lenovo 83LR
Thread-Index: AQHc/AIOvWpHjdv+ZUK8u2GxgFeaUg==
Date: Sun, 14 Jun 2026 13:31:08 +0000
Message-ID: <20260614133101.107893-1-mk01022025@outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYSPR03MB8631:EE_|SEYPR03MB7191:EE_
x-ms-office365-filtering-correlation-id: 7d606d37-2bcf-4630-cf09-08deca193137
x-microsoft-antispam:
 BCL:0;ARA:14566002|41001999006|15080799012|39105399006|22141099003|37011999003|38102599003|19110799012|8060799015|8062599012|19101099003|31061999003|12121999013|440099028|3412199025|40105399003|26104999009|102099032|1710799026;
x-microsoft-antispam-message-info:
 =?utf-8?B?V2J4S3dTaFdhK25uYTJvTWttMzR6YWs4NGJpK2puZXdFZU1wLzV5VjlKQjVU?=
 =?utf-8?B?MWM2TC9rUElpdFJjNDd0UlBmeDgzWUJOSzhBbmpVcTFlY0lsSEY1enpHNmVF?=
 =?utf-8?B?WUFyTDZ0SW1kQ0RBblRyR0dYSVZFdmtSN3R6bzVkUm1NZlVSRDAvWGlDeG81?=
 =?utf-8?B?cDB1cnVaakc2azBUOUErTHhibE1BY25BelpVQXI1clZLcWViRmkxeWw3WmhF?=
 =?utf-8?B?dDA0UnptWFlKR0Y5Y0haVVZhWU8weWVCVTJqNEJKc3BRMWVyMUV2cW9lQVJC?=
 =?utf-8?B?VHZ0N0JhTzllUEdYS2dyVnEwNDB3QmFTcjlDZ0dkZ09tYXlFM1ZVUVdPOG5W?=
 =?utf-8?B?RFNDam8vS0lzK2FnelFEYXloZ2Q3QTU3MlkzblNPSVJPVFk5UEt6d2E0WCtt?=
 =?utf-8?B?WW01OWVLQXo4eWZVUG1WUUtCNnRTWHlOVHFMc2lyNTRjMTJqY0xYK0NHek9K?=
 =?utf-8?B?bDY4aU9lNzQzK3hjZU8xMEZNbmRRUUlrQXhLMC9lbUlQVk83WS9MbnJRVy9X?=
 =?utf-8?B?L1NYc2lUMTdYS3QyZWtLMWEwcW1uajdaVHVocjFZM1hKWFRCTXZLb3VObjNM?=
 =?utf-8?B?clVSZ2NFekkzVUhWa0ZKYU1LcmhHQUxRVHhFb0d1S2c4U042RiswTkhFRWc1?=
 =?utf-8?B?SXd4ZmkzQmtIY0FrSEJWYlQyU3QyaWFrYzlIR1pVeStHK0JyV0Y2U3Y4aEJs?=
 =?utf-8?B?UStSQzVmL2lqY2pzRzlGeHk4bjE2S0QxbG54Qm5xWWtUaFBJRUVLTkNmNXZB?=
 =?utf-8?B?Vkd5VVh5c2FmK2tSU1NJRXdybTZDR1F0RnBoTTduQ1pWSWtVMFNJcWJiU1dm?=
 =?utf-8?B?MkZBWlpXanlhQmhXSWFMVkJSV2cwZU9GRkh3WU5wZDk2dUxaOFhjdEFGeW1Y?=
 =?utf-8?B?RWhCVmdXT0N1K3ZwdXA4VGFvUUU5bWJRb3VrMUgxL0RFYjJuVTdUZDYzMm0v?=
 =?utf-8?B?ek5mVUxkcWNCWHEzL1JycWdLMWZ0M3RwT1dUU0p2TEN1V2NsZ3huOG9YRVlk?=
 =?utf-8?B?NnhqSEwvTk11eDRSaEwwQTg0Qk1POS9zM1F1UEFsL2JXMGtIN281U1BEZkIv?=
 =?utf-8?B?U0p5L3NSbDUraUthVURGWU5DLzZ3a24wcEpUOVNyK25iRzZuUGRycWNKNnRR?=
 =?utf-8?B?TmZKN3hXNGxzU2hGS3JBUlNOaDQrKzVvbEp1WE0xNjhRY29rWFluVEIzd0VZ?=
 =?utf-8?B?eUNiWENHK2NEbWUxNytWVE1HcHBhekNoS2VYcDVmLzhJMTNob0VXZXhrRSsz?=
 =?utf-8?B?eWNJdjIvOG9PWkI0RkxScnczVUJzajN6WGZKbGFuNmVkTlJIR2RNKzNzS2dD?=
 =?utf-8?B?aTRzdTRIVmdYVDU4MmdFR3dVaGY0Um96QXdqc0xuRTNLQ1RxSDY3NWZzejN1?=
 =?utf-8?B?Uzd2eWFqbW9GOHI2czFhT1RXTkU4a1dza0U1bkluWDZQZjZnRFppaWRkZXNp?=
 =?utf-8?B?clBlNC9sTjJhZzNjZ0xELzF5cHNFSmJwZVByMzVVMjVqNDZibkdxREZrd2RO?=
 =?utf-8?Q?REjYdZn56zSR+bmQ4kepeke6mSW?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WURMNGJpa3dPOWNwTmhJdldLamYwY0t5MWlFNXdObVp1VUppQ0NLNXNibEVz?=
 =?utf-8?B?MDNWWnhqREVGSlVORzF4K1hQQk5WdnpkUjhOcGExMyt6d1ZvUlFpYjBNNjlG?=
 =?utf-8?B?b05NQjF0eXduYklCNHZ0b3k2MzFDbWxiWkI5SmdsWWRYd09PVFowYktiSFpE?=
 =?utf-8?B?M2UrQXVoeEoyYTN0OC9lcVRvTEtRSU5YbHA2WjQ4VGpTSURoT2JXNEM0UWQy?=
 =?utf-8?B?VXQ2QThabTBrRllYQk12dmdLYWZYTmNHTnBjcUx1dFhqSzNpL2x1YkhCYS84?=
 =?utf-8?B?bUlJeVVNaDRKL2ZRU1NvMDdYQWJrOWVlS0ZFUE9SS2E1ei82WU1xT0ZUMkhQ?=
 =?utf-8?B?c2JramdRSFJPOXFKM3kvTzJNaXpOL29Pam9KUXkwWDJ0cFFKcGRING56aHRt?=
 =?utf-8?B?eEpHU1k1azVwcXNBblJpWDdOT1BkUDZ0NHYvR3pyckdTVmxJTUpiV2FYS0gr?=
 =?utf-8?B?MnRmekp6QVRlb3plRlpjRkIvS2pvT0xSNklERWRpVi9UNmNPWHhHV3VpTTc1?=
 =?utf-8?B?TDdueTNHRExEWlN5MEJmbVFjVXpmbW9heW9DK0VmNXdEN3kyLzJnMUxWNVpZ?=
 =?utf-8?B?TXlxVCtwTFoyUTNIZ0FHOTN0NGRIRGhOR2VjOVNDSUo0WjFqK1hWdzByU2o2?=
 =?utf-8?B?S3IxNlFVcVJkY1lLSis3WjNWWmlQNFRnRWhZYWQyOUJtZlRpY1lNeWYxQnF3?=
 =?utf-8?B?TkZVbXltY3Vnd2YrYmhEbDhVK0JTdlNYMFUzOGR0ckxJenFrdU53VWVrUzdo?=
 =?utf-8?B?S1NGVGs4Q0hVUE8xMjhMVXk3R1Rtck8xRENnUkY4YXkrbFFFRGg1YUgvdXVB?=
 =?utf-8?B?c29qR0VyT1hiaGtUVldkQ3EyTXlJM1lZMGZIcjY3SE1LdVRkRUVnNStvY2p6?=
 =?utf-8?B?b3NUZUgySm1kaXFSR1hVMkwxZUhpd2xpSFhmZEg4bzdWZlN1VmYyV2tqVlZ2?=
 =?utf-8?B?N2Z3NkZWbDJhbUFUckN3dWdFMXZLcGthK1hMNUdKN0tmUzY0VVQ1KzAxaU5W?=
 =?utf-8?B?czFWbXFrczFkdGlsMG5naDlEWTJ5UTc0U1FNUWRnbTlxcnRZZXp4TG5TSzh3?=
 =?utf-8?B?bm9QMml5L3hsMkJWdHd0THBxVTRTZ2VNNEVjVFNXZFhJeU5Vci9ocHhidkdZ?=
 =?utf-8?B?Z1VIYUo5ZEpqM1NlcFIxY0I2QVZOY0s3czN4KzVDUFpaZThwZHdDc2NYcy8w?=
 =?utf-8?B?THZqNEdpakZEamt5ZjF2V3ZweWxUT01qc3VwTjFWQjBrR2xnOHVuSFZJYVhJ?=
 =?utf-8?B?Zk85YkNDTWExVEROWTlSdHQyQ1hoeUVKODFiRUNhWncxU2dXS2czeEJFTHFH?=
 =?utf-8?B?NkdPeUE2T1pEZGhya0tlN0N1bmxYWXlkdVFGR3Bwcmo2cDRzYzR4a2pjMzVj?=
 =?utf-8?B?NHdZQzA4Y0ZPSXIzVUNYdlpYcDdVOHhhb0MvZ2tKSHgzNmJmaXlCMmQyVEdp?=
 =?utf-8?B?dGNjV3dQQU9uR3NyaFRWenZiZHpyanlFNjJPOTE4c0Z0SGo0eW9MeGkyY2Ns?=
 =?utf-8?B?bzJ0S1A5cjl4M1ZPNTVQbUljR0JtZzlhM0p0SmdvUnNQenFjN2JnbUo5Q3Yx?=
 =?utf-8?B?eTNPUmUzcGtrSndNNGFzZWUxcHZsdUdBcVI0M01mbE1aNnZnQ0RqYWFQV0U1?=
 =?utf-8?B?WVNHQndhc1RtdzROVzJiNWZ1N25IbkltNG5nSnRXNTMzMFRRamR5MDJ1V0My?=
 =?utf-8?B?Q1VrWE9qc2RGMTUyZ0piSlJiUEE3VHIxeXlaTlRDMVNjdnkwUi9SMHNkR2g4?=
 =?utf-8?B?dHZhd1M3MGFkTFlyejJscGRldDNIKzVKWTdlUk9mUWlyblpCdUtpUEl1RUo3?=
 =?utf-8?B?TGFKQzhjdEhJaXVQaGJ2bExmeEFtSWZHdU51dzh0aEFIK1JHYmxIazR6K0R2?=
 =?utf-8?Q?GDfe7xv7yetgM?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D8D3ECB73F394B4F9B280B0725A2315E@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYSPR03MB8631.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d606d37-2bcf-4630-cf09-08deca193137
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2026 13:31:08.1466
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7191

SGksCgpJIGFtIGludmVzdGlnYXRpbmcgdGhlIExlbm92byBYaWFvWGluIFBybyAxNCBBU1AxMCAv
IElkZWFQYWQgUHJvIDUgMTRBU1AxMAooRE1JIHByb2R1Y3QgbmFtZSA4M0xSLCBCSU9TIFFLQ04y
OVdXKSBvbiBMaW51eCwgYW5kIEkgd291bGQgbGlrZSB0byBhc2sKZm9yIGd1aWRhbmNlIGJlZm9y
ZSBwcmVwYXJpbmcgYSBwYXRjaC4KClRoaXMgbWFjaGluZSBleHBvc2VzIHRoZSBzdGFuZGFyZCBJ
ZGVhUGFkIERZVEMgcGxhdGZvcm0gcHJvZmlsZXMgdGhyb3VnaApkcml2ZXJzL3BsYXRmb3JtL3g4
Ni9sZW5vdm8vaWRlYXBhZC1sYXB0b3AuYywgYW5kIExpbnV4IGN1cnJlbnRseSBtYXBzIHRoZW0K
dG86CgogIGxvdy1wb3dlcgogIGJhbGFuY2VkCiAgcGVyZm9ybWFuY2UKCkhvd2V2ZXIsIHRoaXMg
bWFjaGluZSBhbHNvIGhhcyBhbiBhZGRpdGlvbmFsIERZVEMtY29udHJvbGxlZCBtb2RlIHRoYXQg
aXMKbm90IGN1cnJlbnRseSBleHBvc2VkIGJ5IGlkZWFwYWQtbGFwdG9wLiBUaGlzIG1heSBub3Qg
YmUgc3BlY2lmaWMgdG8gdGhpcwpzaW5nbGUgODNMUiBtYWNoaW5lOyBzaW1pbGFyIFhpYW9YaW4g
LyBJZGVhUGFkIG1vZGVscyBtYXkgZXhwb3NlIGNvbXBhcmFibGUKdmVuZG9yIG1vZGVzIHRocm91
Z2ggRFlUQy4KCldoYXQgSSBoYXZlIHZlcmlmaWVkIG9uIGhhcmR3YXJlOgoKICAtIFRoZSBMZW5v
dm8gV01JIEdhbWVab25lIHBhdGggaXMgbm90IHVzYWJsZSBvbiB0aGlzIG1hY2hpbmUuCiAgICBU
aGUgR2FtZVpvbmUgR1VJRCBpcyBwcmVzZW50LCBidXQgbGVub3ZvX3dtaV9nYW1lem9uZSBzdGls
bCBmYWlscyB0bwogICAgcHJvYmUuIE9uIHRoaXMgbWFjaGluZSwgdGhlIHJlbGF0ZWQgV01BQSBt
ZXRob2RzIDQzLzQ0LzQ1IGFsbCByZXR1cm4KICAgIDB4MC4KCiAgLSBUaGUgdXNhYmxlIGNvbnRy
b2wgcGF0aCBpcyBEWVRDLgoKICAtIEV2YWx1YXRpbmcgdGhlIERZVEMgQUNQSSBtZXRob2QgKHNw
ZWNpZmljYWxseSBcX1NCLlBDSTAuTFBDMC5FQzAuVlBDMC5EWVRDKQogICAgd2l0aCAweDExMTAw
YiBlbmFibGVzIGFuIGFkZGl0aW9uYWwgbW9kZS4gSW4gdGhlIEFDUEkgU1NEVCB0YWJsZXMsIHRo
aXMKICAgIGNvbW1hbmQgdHJpZ2dlcnMgdGhlIFRDQU0oMHgxRSkgYnJhbmNoLCB3aGljaCBjYWxs
cyBEVUdLKCkuIFRoaXMgYXBwZWFycwogICAgdG8gYmUgdGhlIHZlbmRvcidzIEdlZWsgKCJHSyIp
IG1vZGUsIHdoaWNoIGlzIGFuIGFnZ3Jlc3NpdmUgZmFuIG1vZGUuCgogIC0gRXZhbHVhdGluZyBE
WVRDIHdpdGggMHgxMDBiLCBmb2xsb3dlZCBieSAweDFmZiwgZXhpdHMgdGhpcyBHZWVrIG1vZGUg
YW5kCiAgICByZXR1cm5zIHRoZSBtYWNoaW5lIHRvIHRoZSBvcmRpbmFyeSBwZXJmb3JtYW5jZSBw
cm9maWxlLgoKICAtIFVuZGVyIHN1c3RhaW5lZCBleHRlcm5hbCBsb2FkLCBvcmRpbmFyeSBwZXJm
b3JtYW5jZSBtb2RlIHN0YWJpbGl6ZXMgYXQ6CiAgICAgIERZVEMgZ2V0ID0gMHg4MDEyYjAxCiAg
ICAgIGZhbjEvZmFuNCA9IDUyMDAgLyA0OTAwIFJQTQogICAgICBwYWNrYWdlIHBvd2VyIGFib3V0
IDU1LjNXIC0gNjUuMFcKCiAgLSBVbmRlciB0aGUgYWRkaXRpb25hbCBHZWVrL0dLIG1vZGU6CiAg
ICAgIERZVEMgZ2V0ID0gMHg4MDFmMDAxCiAgICAgIGZhbjEvZmFuNCA9IDYyMDAgLyA1OTAwIFJQ
TQogICAgICBwYWNrYWdlIHBvd2VyIGFib3V0IDU1LjhXIC0gNjMuMlcKCkluIHRoZSBTU0RUIHRh
YmxlcywgRFVHSygpIHByb2dyYW1zIG1vcmUgYWdncmVzc2l2ZSBDU1BML0NQUEwgdmFsdWVzIHRo
YW4KRFVQRigpIHVzZWQgYnkgdGhlIHN0YW5kYXJkIHBlcmZvcm1hbmNlIG1vZGUuIEZvciBleGFt
cGxlLCB0aGUgQk9MMD09MQpwYXRocyB1c2UgQ1NQTD0weDRCLzB4NDggYW5kIENQUEw9MHg1NSBp
biBEVUdLKCksIHZlcnN1cyBDU1BMPTB4NDEgYW5kCkNQUEw9MHg0MSBpbiBEVVBGKCkuIEhvd2V2
ZXIsIHVuZGVyIHN1c3RhaW5lZCBsb2FkIGluIExpbnV4LCB0aGUgbWVhc3VyZWQKcGFja2FnZSBw
b3dlciBsaW1pdHMgZG8gbm90IGV4Y2VlZCA2My02NVcgaW4gZWl0aGVyIG1vZGUsIGxpa2VseSBk
dWUgdG8KQVBNRiBvciBwbGF0Zm9ybSB0aGVybWFsIHRocm90dGxpbmcuIFRodXMsIHRoZSBtYWlu
IG9ic2VydmFibGUgZWZmZWN0IG9mCnRoaXMgbW9kZSB1bmRlciBMaW51eCBpcyBhIG11Y2ggbW9y
ZSBhZ2dyZXNzaXZlIGZhbiBjdXJ2ZS4KClRoZSBvcGVuIGRlc2lnbiBxdWVzdGlvbiBpcyBob3cg
dGhpcyBzaG91bGQgYmUgcmVwcmVzZW50ZWQgaW4gTGludXguClRoZSBvcHRpb25zIEkgY2FuIHNl
ZSBhcmU6CgogIDEuIEV4cG9zZSBpdCB2aWEgcGxhdGZvcm1fcHJvZmlsZSwgZm9yIGV4YW1wbGUg
YXMgIm1heC1wb3dlciIgb3IgImN1c3RvbSIKICAgICBvbiBhZmZlY3RlZCBETUktbWF0Y2hlZCBz
eXN0ZW1zLiBOb3RlIHRoYXQgbWFwcGluZyBpdCBiYWNrIGZyb20gRFlUQwogICAgIHN0YXR1cyBp
cyBzbGlnaHRseSB0cmlja3kgYmVjYXVzZSB0aGUgRFlUQyBnZXQgcmV0dXJuIHZhbHVlICgweDgw
MWYwMDEpCiAgICAgaGFzIGl0cyBtb2RlIGJpdHMgc2V0IHRvIDB4RiAoc2FtZSBhcyBiYWxhbmNl
ZCksIG1lYW5pbmcgaXQgbXVzdCBiZQogICAgIGRpc3Rpbmd1aXNoZWQgYnkgYSByYXcgdmFsdWUg
Y2hlY2sgb3IgZHJpdmVyIHN0YXRlIHRyYWNraW5nLgoKICAyLiBFeHBvc2UgaXQgdmlhIGEgTGVu
b3ZvLXNwZWNpZmljIHN5c2ZzIC8gZmlybXdhcmUgYXR0cmlidXRlLCBzaW5jZSBpdAogICAgIGJl
aGF2ZXMgbW9yZSBsaWtlIGEgdmVuZG9yLXNwZWNpZmljIGFnZ3Jlc3NpdmUgZmFuIG1vZGUgdGhh
biBhIGdlbmVyaWMKICAgICBwZXJmb3JtYW5jZSBwcm9maWxlIHVuZGVyIExpbnV4LgoKICAzLiBT
dGFydCB3aXRoIGEgc21hbGxlciBwYXRjaCB0aGF0IG9ubHkgZGV0ZWN0cyBhbmQgcmVwb3J0cyB0
aGlzIG1vZGUsCiAgICAgd2l0aG91dCBhZGRpbmcgYSBuZXcgd3JpdGFibGUgdXNlcnNwYWNlIGlu
dGVyZmFjZSB5ZXQuCgpEb2VzIG9uZSBvZiB0aGVzZSBkaXJlY3Rpb25zIHNvdW5kIGFjY2VwdGFi
bGUgZm9yIHBsYXRmb3JtLWRyaXZlcnMteDg2PwpJIGFtIGhhcHB5IHRvIHByZXBhcmUgYW5kIHRl
c3QgYSBwYXRjaCBvbmNlIHRoZSBwcmVmZXJyZWQgZGlyZWN0aW9uIGlzCmNsZWFyLgoKSWYgaGVs
cGZ1bCwgSSBjYW4gYWxzbyBzZW5kOgoKICAtIGZ1bGwgRE1JIGluZm9ybWF0aW9uCiAgLSB0aGUg
bWVhc3VyZWQgRFlUQyBzdGF0ZSB0cmFuc2l0aW9ucwogIC0gdGhlIGNvbnRyb2xsZWQgUlBNIC8g
cG93ZXIgY29tcGFyaXNvbiBsb2dzCiAgLSB0aGUgV01JL0dhbWVab25lIGZhaWx1cmUgZGV0YWls
cwoKVGhhbmtzLApta2Fyb3MK
