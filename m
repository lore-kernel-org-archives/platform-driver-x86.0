Received: from SY5PR01CU010.outbound.protection.outlook.com (mail-australiaeastazolkn19012008.outbound.protection.outlook.com [52.103.72.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538583B19D2;
	Tue, 28 Jul 2026 18:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.72.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785262199; cv=fail; b=ET6dSjVui36kIWUb+VEtRZcUG/X2O659QCd2Ei4cYaj99/eKu0AzYV7+NkJM0m0o3Tl+rlciIuXfGDEHX1rJ+VWj6BTUS779hEHT0Z+AYQCtJiWEeRSkarEm0JR5OmytLeNm7XoUTrGWSMZSosJLbjuyUXWYTu0PduQFQO2j21I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785262199; c=relaxed/simple;
	bh=zbdu8AX7tZWsp2D3OXvgEUvxg/aOxtU9Aox1EL9z0T4=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=StXVU6dr6J/qpPk5llgBmBFffPrSVyzrzq/TSrjdVto0z8giSqEO/DxztFyQ41NPDdFdslOiYJTKRi13scmzW0D2uJO/Qm1xVpwBOIk6+ywumGVCxQWqaQr1HqW8XIDGSaOOlfgJDv5wSA/ko8GuxVeYCrgTAoaqeCW6DtcLbiE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=u8QzjO5J; arc=fail smtp.client-ip=52.103.72.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="u8QzjO5J"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g35yXyG3jL3/Ty1B5lep6C644F6RjVaLhYyxYxK37sQ0ywBwdT+ih517xgmSBM9sXFYhdRytIlIunT1+s1qt9OFXhIDB5C1xQM+FXCYMy1/5PuD5bsf+oIMsFWqttlSpW+AStraRDwdCV0FFzZeEsWLzJA+9aiTnmSqXV1WuE06jZ1Ve55DPLG7zbIgqa1zEvbJdBDTDmwcvbhCH52fMgTyyQryDS40Xli0aM8KIMWAt1wC4J80KtjaUODTwi8X8NaYsXOdj6WjFQaWPZgkGLUCeeKYMeSkpmt5nDakiq8VrVHMdAW4dbjAhpmmWS+sRDSdFiTKwJbHZjY9uUM3QlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zbdu8AX7tZWsp2D3OXvgEUvxg/aOxtU9Aox1EL9z0T4=;
 b=ZeEJtQicIu3FTlaDPBWWbQ8SfgpOIkeu7POiAIoydA1Bi9iAXzmC64mftWiR1aLuK4U5SypnU4rmh+uqugcjK4eGds/Xhh007KKzdYnia9Wpem4pofM72cMu3Rj2ok4UAFnH31yBaJQI1a54hAsRCQvpJ+ondhK8FZj+sSLU1pbYY2EOvsRrUmcefkWiSYg5tqGdJizceg01sRM6B02qGQEYU0COne5/BNTodznP1HzuFmFoVsnLZCfHjTKUbNAeX2ZKP4dWotqlM9VH3c9exI67UCEXrhSlJbgVMy+omYI317WXX5OQYJ/AJAB+idQW631lGTaOTUrOINNsNTO/7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zbdu8AX7tZWsp2D3OXvgEUvxg/aOxtU9Aox1EL9z0T4=;
 b=u8QzjO5JlhzALQaggJNqe9cEPId8EhcFawBlbHaYsJbz4Ftn/Zct8hOU+XQM2eysfMiyAi2AMO94HQXjSGuUAh7FWqDPRgdaXSct15KXghwmPX7wgE+hjV37Gq5xqMiS6nHLjVIP8yESumpVoqe6g8FnChkM+xghyMMVfvezk6kWJytiI+1eOlzwFef6RE2xd8R0CMcTlYjZTpNtHU9m+RwWdKqJ4lAX8P1pSsdceuXfxF2nkY7wWrGrA1brey9zwxe5sy8REstdbsavVdNAPqAOcwxkPt61X3lfD4VBEZn5utkW/z0Rj3oLaSU176nXd2nHrRBKB6fHM4p2XwXzqQ==
Received: from SY7PR01MB10809.ausprd01.prod.outlook.com (2603:10c6:10:334::8)
 by MEYPR01MB6613.ausprd01.prod.outlook.com (2603:10c6:220:116::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Tue, 28 Jul
 2026 18:09:52 +0000
Received: from SY7PR01MB10809.ausprd01.prod.outlook.com
 ([fe80::5ed:40ff:547d:2ada]) by SY7PR01MB10809.ausprd01.prod.outlook.com
 ([fe80::5ed:40ff:547d:2ada%4]) with mapi id 15.21.0270.009; Tue, 28 Jul 2026
 18:09:52 +0000
From: =?utf-8?B?5a2ZIOiqiemTrQ==?= <wolf109909@outlook.com>
To: "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mingyou
 Chen <qby140326@gmail.com>, Armin Wolf <W_Armin@gmx.de>, Hans de Goede
	<hansg@kernel.org>, =?utf-8?B?SWxwbyBKw6RydmluZW4=?=
	<ilpo.jarvinen@linux.intel.com>, Nabil Danial <nabildanial.93@gmail.com>,
	=?utf-8?B?5a2ZIOiqiemTrQ==?= <wolf109909@outlook.com>
Subject: [RESEND PATCH 0/5] platform/x86: bitland-mifs-wmi: MIFS v2 firmware
 support (Xiaomi Book Pro 14 2026)
Thread-Topic: [RESEND PATCH 0/5] platform/x86: bitland-mifs-wmi: MIFS v2
 firmware support (Xiaomi Book Pro 14 2026)
Thread-Index: AQHdHrxJS3H6wltIZ0ic/T2RpYDSlQ==
Date: Tue, 28 Jul 2026 18:09:51 +0000
Message-ID: <20260728180944.51356-1-wolf109909@outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SY7PR01MB10809:EE_|MEYPR01MB6613:EE_
x-ms-office365-filtering-correlation-id: abdc539a-1309-4a16-0003-08deecd36b8d
x-microsoft-antispam:
 BCL:0;ARA:14566002|25010399006|8022599003|38102599003|25031999004|12121999013|5062599005|15080799012|31061999003|8062599012|8060799015|19110799012|24021099003|3412199025|4302099013|440099028|26104999009|102099032|10035399007|3071699003|1602099012|1710799026;
x-microsoft-antispam-message-info:
 =?utf-8?B?OUREL3dvNC85VHZXQUcyU3VsSFpFdFJwd0Vnd1BNZ29Wd3ZsMUJwclpMU1Zn?=
 =?utf-8?B?Yzd0VnV0NENobVczeitQRTd5VmFIL3RIblJKTkZ1akFINHEzT0lXOHlKLzYv?=
 =?utf-8?B?UXNIb21IZlRoODdMWmtGSnpDbnRGcEZ2a0Vod0liZFlrcW8ySmRxUFdvTXp3?=
 =?utf-8?B?SDJpemRoalRqYUpIQWdGWjR0N0NleGRta0lWU0NuUnF4YmVBajhYMWU2TUkv?=
 =?utf-8?B?OGt3S1E5dHFqS0F0M0RxcU9QWUVBV3VlU2x4R212WjN4NGlwc3cyclU3ODVh?=
 =?utf-8?B?NFdJRnZ2dithV1hyYUt0MTRFWWk0QjRNT05nbFdiL1ZuU1NzT3dvU0lXM0hh?=
 =?utf-8?B?ZDdoeHdOR20zZUxISTJZa0c4UHJOQnNtSHNiNnNDSW1zZTNKbTlJY3E0U1lo?=
 =?utf-8?B?RnB3WWR6aUYrNFhTdkMyNHkxUEppcVNQODNRR01SRU5lbmpNVHhmSGVvcjlt?=
 =?utf-8?B?TEVzNGVpL2cyQ1VhTnhKYmdwQk1sVGtEdnlrRzJIOWJWYkhJNGZCN3cwYkxn?=
 =?utf-8?B?RUFQcmRQaGNKZmw4K1lWT1R5bUlNZWJoQ1VEaUxhZFMzUVFoYllrV0JObG40?=
 =?utf-8?B?UUhSSk1PMWZUSEVnSU5FRnJDekFCT2Z6UERDNDhiYzJ2MG03cGJGcTVSUGV3?=
 =?utf-8?B?aERYcVRlckdnc2t4eG55ck83R2N5d0dWZURRQUFmdEpNS0dOUDlqMUQwUEh4?=
 =?utf-8?B?SXcxcEN1amJpRHdxVWhNdVRwenNCQmMwOVQrZVNVWkhIQkRZb2dpcTJOaUha?=
 =?utf-8?B?azhnMllXbGtzM09ZNG5FNHVsbVhyOEFsM1lvTDJMcEJuV2NmT1hhNjRybXZo?=
 =?utf-8?B?N00velp1UzhzUmUyUndCK1c1Z3pkYjQwWTNEbXZTdzl6N0tGRHc0RGtRaDRK?=
 =?utf-8?B?MHIrOUZpRmxFZUJGSVh6UzljZk11L3BSWVVLSWRjbkZxcGl4STl0MHlRblRZ?=
 =?utf-8?B?OXRtN1hVYzMxY1dYRUY4Q003dHdFblJrUnNudUlLTVZSY0pSWW5Rck0yYVZs?=
 =?utf-8?B?ZDZHSVh3QVpOcHhMdHJsU0Z6UWRuOTFyZmxaR1UyY3FKQnlrOGlUS1cwdTJr?=
 =?utf-8?B?ZXhrODdrV1ZDbjB3dlRwVFViUWFMbFhRVm51VFdETTA4NTVpdjR2NGN6b0E0?=
 =?utf-8?B?ZDEydU1qNVd0eXg2T0thcU5UamJRL1JCZVdneFhmQU5tQkpnYnpFS21GS0d1?=
 =?utf-8?B?S3FOT1pFTzV4UDBmMjFlbWpsdTR4Qkx6MDdjS2ZHOFMvc0N1bCtnSTBWVU43?=
 =?utf-8?B?WkNBbWZUT0RLMmcyOUdTTlpBRU5BbGdEb29HeGZKemRUMjRwV3BsM0N1ekR4?=
 =?utf-8?B?akN2TEdkTVVJWWJ2YVluVWtzWDJ6OW04TEVBNXlWc3dHVlA2MWxkQkhFeERJ?=
 =?utf-8?B?aU4vVEFlOHhEUUVEU0c2VlpjT1pzZG1jMWF1MFRjdDlGcDBjZkY4M0JCMkE1?=
 =?utf-8?B?U2Q0blFMSTZVZjBaU0I1VXIzb0ljOUxXZ3NIcm0zdElaWXpZRWtBeVBUM0pQ?=
 =?utf-8?Q?JycBt1nNq5XSGzpyklFNZ+279tv?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OXMyMTZndk41NVhYQnVhWEl0eDZ5L0NyNm82TnBQdnRtUEZYN1c0QXdDcXZL?=
 =?utf-8?B?ZkJ4T3V3RjZuY0tzTkVnSjhGN3hEUE5IZ0J5MWMrbmEvNGEzTXBSOGxPVmJU?=
 =?utf-8?B?R3hOQ3ZiRzVZcXhabXRCVyswY0taTHFMZi9SODFsUVFhZlZIN2ZCZVJ5YXRU?=
 =?utf-8?B?U2gwY1N6YUdLNGdqU01aL2Z5VmQrLytYL3VPb0s3ZlQ4VXhCWUpDSTdzV0pk?=
 =?utf-8?B?QlR5TnRIMHhqdEdXK2VJYy9paCtRamdxQUVoZHZKTUZ4clpXRzI4VngvQ05J?=
 =?utf-8?B?MFYxRXBXVTRLUUtLVWcvSEozR2VOcW5jSFp5dEE4dEhOdjVZYmN3VXU4eUhv?=
 =?utf-8?B?S3V1TWJGS1lUZ1A5VmxXNkk3SDBnN2t5YWhKTENiQStiOThkeEx6M1VvR2lh?=
 =?utf-8?B?NnFGRFNPL1IvVHlTSGNOdjU1OEV1dHlIcm4zbWp3dm5FOHcvMkV2OGNOZEU2?=
 =?utf-8?B?VlhaNFNSYStDeVRGVzFiVXUvYkl1ZTN4TXd5NUh2UWorQTJOcldWUDFXTnZP?=
 =?utf-8?B?SGZCSDBQYlJoWnNmc0QvaHY1OXZ3T3lybGNYSzhqYTRSZzE2b0s0WUh2SmlQ?=
 =?utf-8?B?dEhHaFZLeHV0T0pldzY5Q1ZJTjA2M2hld0kvOGtLUmJlSFZBL0Yxb0RkeTQy?=
 =?utf-8?B?MTQ0QjUzVTN3YnVDK3EwV3ZxRk5FZDk2WlZnNE9ZR0xMSzRFM2N6QVFMUFB0?=
 =?utf-8?B?TTZOa1dCb3hndjQ4T3pFRnMwRWYrQmcycmlRUlFBVUgzOFV5NzlDemYvbzlk?=
 =?utf-8?B?Rys1aDNpVjYyTC9Od243bVFWT0JiODE1aFJBdXJYbFVaSkNoQVo2MEZYVGlZ?=
 =?utf-8?B?OEtKMEh4WmVFRGh5dEdCNlFBSmdmVTc2QWFtK1gzQTN2ZFNJWjh6Q0dEVXIx?=
 =?utf-8?B?UTRYRW45TFpWMHpYZyt0dmkzNG9ERTk5anR3RWxZUTdQOXdRZVFHZ2hmTkZP?=
 =?utf-8?B?Y2ljNVFzTzQzaXZ6amFidmFOcjAydXA1em9IdTFTTVpVWXMyN2tVSEc5RDl6?=
 =?utf-8?B?NFAyM0ZvQmNLZnZETWFDZGJhK3ZGSnpmUE9IOU00S2J1UXl3cXZpUWpjUE9o?=
 =?utf-8?B?eENBRzNPSE5XZjdkWkF4VUFBTm5nVndSdHRpQ3V4QVJMYllGSnVaVFBUTzdL?=
 =?utf-8?B?WW9INlBNZW9kckx4L2xLZFl3TkVJTENBMTUrYzVBMzUwbDB2Rjd5SE11NTFB?=
 =?utf-8?B?eEYrWnkweXhsMDBJdWV4M1J6YnVQMWtSNkRpWU4rQzhIUzBYZ3Z5ZFo0UTQy?=
 =?utf-8?B?MGkvSjFlMHZXSzA4dndqNDNwUnZiSGhhZzNGVGNYK3pMRFJ2STBIRXJDREJ5?=
 =?utf-8?B?cXBtRDZtNW40QndjNUJvdnVpVzBOSnFWN3pCRGV2NnN2T0hFM1kyZVhkSGlk?=
 =?utf-8?B?eEJxcFpaSkQrbEZad0U2STM1a3hvV1pKRUlmVndtQTFScUR3UlZVUlErRXRE?=
 =?utf-8?B?RjQ4alFGdkUyMWZHcktLYmlqdjNzUHNOdjhnYUtMWG94eGdrTVcwRFh2a3RP?=
 =?utf-8?B?T2dLZGc0NDhTVG5YS3JjUHZqRmNKd3BTV3d3aWYrcnlJeGkzQTRDd09LeHBO?=
 =?utf-8?B?Vnc3WlRRdzNlbWxudEE4TkVJTmlWTWlhTXh1QmEvTDlWRWx3ZHJpQXAxVFFG?=
 =?utf-8?B?VXhvUHd0NTcvNlF6SjBVRmNwUWtWcXdycTJ4dEhOZklzcDVhZXdEN2VqNVlh?=
 =?utf-8?B?MGRZRzAxaTBZSmMwVDdYOGxRSEs1d3UvdGNaQlJTSjRXT3pSSHhOaE1VSTdw?=
 =?utf-8?B?WFVnUTRwb0NWajdvWDUxK3pReHdyWDBFS1hQNWlyTHNpcjBGRXFSQ2VBbVlU?=
 =?utf-8?B?L1c0NG5vR2NzVDBnUnRHU1FWNEZDcDd3QkliWGg0WGJpTS9GNGxwVVQxRTJj?=
 =?utf-8?Q?hI6JaWHpyAEiz?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: abdc539a-1309-4a16-0003-08deecd36b8d
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2026 18:09:51.8758
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MEYPR01MB6613

UmVzZW5kaW5nOiB0aGUgZm94bWFpbCBlbnZlbG9wZSByZXdyaXRlICh0ZW5jZW50Li4uQHFxLmNv
bSkgYXBwZWFycyB0bw0KaGF2ZSBnb3R0ZW4gdGhlIGZpcnN0IGF0dGVtcHQgZmlsdGVyZWQuIE5v
IGNvbnRlbnQgY2hhbmdlcy4NCg0KVGhpcyBzZXJpZXMgbWFrZXMgdGhlIEJpdGxhbmQgTUlGUyBX
TUkgZHJpdmVyIHdvcmsgb24gdGhlIFhpYW9taSBCb29rDQpQcm8gMTQgMjAyNiAoSW50ZWwgUGFu
dGhlciBMYWtlLCBVbHRyYSA1IDM1OEgpIGFuZCB2ZXJ5IGxpa2VseSBvbiB0aGUNClJFRE1JIEJv
b2sgUHJvIDE0IDIwMjUsIHdob3NlIHN1c3BlbmQgZmFpbHVyZSB3YXMgcmVwb3J0ZWQgZWFybGll
ciBbMV0uDQoNClRoZXNlIG1hY2hpbmVzIHNoaXAgYSByZWR1Y2VkIE1JRlMgZmlybXdhcmUgKCJ2
MiIpOiB0aGUgV01BQSBtZXRob2QNCmltcGxlbWVudHMgb25seSBmdW5jdGlvbiBncm91cHMgMHgw
ODAwLzB4MGEwMC8weDBjMDAvMHgxMDAwLCByZXBvcnRzDQp0aGUgcGVyZm9ybWFuY2UgbW9kZSBh
cyByYXcgUUZBTiBFQyBjb2RlcyB7MiwzLDQsOSwxMH0gaW5zdGVhZCBvZiB0aGUNCnYxIDAuLjMg
ZW51bWVyYXRpb24sIGFuZCBleHBvc2VzIG5vIFdNSSBmYW4gZnVuY3Rpb24uIEFkZGl0aW9uYWxs
eSB0aGUNCmZpcm13YXJlIG5ldmVyIGRlZmluZXMgRUNPTiwgc28gXF9TQi5QQzAwLkxQQ0IuUV9F
Qy5fU1RBIGZhaWxzIGFuZCB0aGUNCkFDUEkgRUMgZHJpdmVyIG5ldmVyIGJpbmRzLCB3aGljaCBr
aWxscyBhbGwgRUMgcXVlcnkgaGFuZGxlcnMNCihpbmNsdWRpbmcgdGhlIGxpZCBzd2l0Y2ggbm90
aWZpY2F0aW9ucyBfUTBDL19RMEQpLg0KDQpTeW1wdG9tcyBmaXhlZCBieSB0aGlzIHNlcmllcywg
YWxsIHJlcHJvZHVjZWQgYW5kIHZlcmlmaWVkIG9uIHRoZQ0KYWZmZWN0ZWQgbWFjaGluZToNCg0K
KiBTdXNwZW5kL2hpYmVybmF0ZSBhYm9ydGVkIHdpdGggLUVJTlZBTCBmcm9tIHRoZSBkcml2ZXIn
cyBzdXNwZW5kDQogIGhvb2sgKHNhbWUgZmFpbHVyZSBhcyBbMV06ICJkcG1fcnVuX2NhbGxiYWNr
KCk6DQogIGJpdGxhbmRfbWlmc193bWlfc3VzcGVuZCByZXR1cm5zIC0yMiI7IDI0MiBmYWlsdXJl
cyBjb3VudGVkIGluDQogIHN1c3BlbmRfc3RhdHMpLiBQYXRjaCAxIG1ha2VzIHRoZSBXTUkgY2Fs
bCB2YWxpZGF0ZSB0aGUgZmlybXdhcmUNCiAgc3RhdHVzIHdvcmQgYW5kIHRoZSBzdXNwZW5kL3Jl
c3VtZSBob29rcyBmYXVsdC10b2xlcmFudC4NCg0KKiBwb3dlci1wcm9maWxlcy1kYWVtb24gY291
bGQgbm90IHJlYWQgb3Igc2V0IHRoZSBwbGF0Zm9ybSBwcm9maWxlDQogICgiRmFpbGVkIHRvIGdl
dCBwcm9maWxlIGZvciBoYW5kbGVyIGJpdGxhbmQtbWlmcy13bWkiOyBzZWxlY3RpbmcNCiAgInBl
cmZvcm1hbmNlIiBmYWlsZWQgb3V0cmlnaHQgYW5kIHdlZGdlZCB0aGUgZGFlbW9uKS4gUGF0Y2gg
Mg0KICBkZXRlY3RzIHRoZSB2MiBmaXJtd2FyZSB2YXJpYW50IGF0IHByb2JlIGFuZCBtYXBzIHRo
ZSBRRkFOIGNvZGVzDQogICgyPXF1aWV0LCAzPWJhbGFuY2VkLCA0PXNwZWVkLCA5LzEwPWV4dHJl
bWUpLg0KDQoqIFRoZSBod21vbiBkZXZpY2UgcmVwb3J0ZWQgemVybyBSUE0gb24gYWxsIGNoYW5u
ZWxzIGJlY2F1c2UgdGhlIHYyDQogIGZpcm13YXJlIGhhcyBubyBXTUkgZmFuIGZ1bmN0aW9uLiBQ
YXRjaCAzIHJlYWRzIHRoZSB0d28gZmFuDQogIHRhY2hvbWV0ZXJzICh1MTYgUlBNLCAwID0gc3Rv
cHBlZCkgZnJvbSB0aGUgRUMgc2hhcmVkLW1lbW9yeSB3aW5kb3cNCiAgYXQgMHhGRTBCMDMwMCAo
RFNEVCByZWdpb24gIkVSQU0iLCBvZmZzZXRzIDB4NjkvMHg2QikuDQoNCiogQ2xvc2luZyB0aGUg
bGlkIHByb2R1Y2VkIG5vIFNXX0xJRCBldmVudCAoc2NyZWVuIHN0YXllZCBvbiwga2V5cw0KICBw
cmVzc2VkIGJ5IHRoZSBjbG9zZWQgbGlkIHR5cGVkIGludG8gdGhlIHZpc2libGUgbG9jayBzY3Jl
ZW4sDQogIGxvY2tpbmcgdGhlIGFjY291bnQpLiBQYXRjaCA0IHBvbGxzIHRoZSBMU1RFIGxpZCBi
aXQgaW4gdGhlIEVDDQogIHdpbmRvdyBhbmQsIG9uIGEgY2hhbmdlLCBldmFsdWF0ZXMgdGhlIHZl
cnkgQU1MIG1ldGhvZHMgdGhlIEVDDQogIHF1ZXJ5IHdvdWxkIGhhdmUgcnVuIChfUTBDL19RMEQp
LCByZXN0b3JpbmcgcHJvcGVyIGxpZCBldmVudHMuDQogIERNSS1nYXRlZCB0byB0aGUgYWZmZWN0
ZWQgbW9kZWwuDQoNCkFsbCB2YWx1ZXMgd2VyZSByZXZlcnNlLWVuZ2luZWVyZWQgZnJvbSB0aGUg
bWFjaGluZSdzIERTRFQvU1NEVA0KKFdNSUQgZGV2aWNlLCBfVUlEICJNSUZTIikgYW5kIHZlcmlm
aWVkIGxpdmU6IG1vZGUgc3dpdGNoaW5nIGNoYW5nZXMNCnRoZSBFQyBRRkFOIHJlZ2lzdGVyIGFz
IGV4cGVjdGVkLCBmYW4gdGFjaHMgcmFtcCAwIC0+IH4yNzAwIFJQTSB1bmRlcg0KbG9hZCwgbGlk
IGNsb3NlL29wZW4gZW1pdCBwcm9wZXIgc3dpdGNoIGV2ZW50cyBjb25zdW1lZCBieQ0Kc3lzdGVt
ZC1sb2dpbmQsIGFuZCBzdXNwZW5kL3Jlc3VtZSBjeWNsZXMgY29tcGxldGUgY2xlYW5seSB3aXRo
IHRoZQ0KZHJpdmVyIGxvYWRlZCAoc3VzcGVuZF9zdGF0czogZmFpbCAwKS4NCg0KTm90ZXMgZm9y
IHJldmlld2VyczoNCg0KKiBUaGUgdjIgdmFyaWFudCBpcyBkZXRlY3RlZCBhdCBydW50aW1lIChw
ZXJmLW1vZGUgcXVlcnkgcmVzdWx0DQogIG91dHNpZGUgdGhlIHYxIGVudW1lcmF0aW9uKSBzbyBv
dGhlciBCaXRsYW5kIG1hY2hpbmVzIHNoYXJpbmcgdGhpcw0KICBmaXJtd2FyZSBnZW5lcmF0aW9u
IGdldCBzdXBwb3J0IHdpdGhvdXQgRE1JIGVudHJpZXM7IHRoZSBsaWQgcXVpcmsNCiAgYWRkaXRp
b25hbGx5IHJlcXVpcmVzIGEgRE1JIG1hdGNoLg0KKiBPbiB0aGlzIHBsYXRmb3JtIHRoZSBmaXJt
d2FyZSBwZXJmLW1vZGUgc3dpdGNoIHJlYWNoZXMgSW50ZWwgRFRUDQogIChcX1NCLklFVE0sIElO
VEMxMEQ0KSB2aWEgT0RWIHZhcmlhYmxlczsgbWFpbmxpbmUgaGFzIG5vIGRyaXZlciBmb3INCiAg
dGhhdCBkZXZpY2UsIHNvIHRoZSBURFAgY2hhbmdlIHRoZSBmaXJtd2FyZSBpbnRlbmRzIGlzIGN1
cnJlbnRseQ0KICBub3QgYXBwbGllZCBvbiBMaW51eC4gUHJvZ3JhbW1pbmcgUkFQTCBkaXJlY3Rs
eSBmcm9tIHRoaXMgZHJpdmVyDQogIHNlZW1lZCBpbmFwcHJvcHJpYXRlOyBJIGxlZnQgaXQgb3V0
LiBIYXBweSB0byBoZWFyIHByZWZlcmVuY2VzLg0KKiBJbnRlcmFjdGlvbnMgd2l0aCB0aGUgaW4t
ZmxpZ2h0ICJNZXJnZSByZWRtaS13bWkgaW50bw0KICBiaXRsYW5kLW1pZnMtd21pIiBzZXJpZXMg
WzJdIGFyZSBsaW1pdGVkIHRvIGZpbGUgY29udGV4dDsgdGhlDQogIGNvbnRyb2wtZGV2aWNlIHBh
dGhzIHRvdWNoZWQgaGVyZSBhcmUgZGlzam9pbnQgZnJvbSB0aGUgZXZlbnQtZGV2aWNlDQogIG1l
cmdlLg0KDQpbMV0gaHR0cHM6Ly9saXN0cy5vcGVud2FsbC5uZXQvbGludXgta2VybmVsLzIwMjYv
MDcvMTAvNzINCiAgICAiW0JVR10gcGxhdGZvcm0veDg2OiBiaXRsYW5kLW1pZnMtd21pOiBIaWJl
cm5hdGlvbiBmYWlscyB3aXRoDQogICAgZXJyb3IgLTIyIG9uIFhpYW9taSBSZWRtaSBCb29rIFBy
byAxNCAyMDI1Ig0KWzJdIGh0dHBzOi8vd3d3LnNwaW5pY3MubmV0L2xpc3RzL2tlcm5lbC9tc2c2
MzA5MDg2Lmh0bWwNCiAgICAiW1BBVENIIHYxIDAvNF0gTWVyZ2UgcmVkbWktd21pIGludG8gYml0
bGFuZC1taWZzLXdtaSINCg0KDQpZdW1pbmcgU3VuICg1KToNCiAgcGxhdGZvcm0veDg2OiBiaXRs
YW5kLW1pZnMtd21pOiB2YWxpZGF0ZSBXTUFBIHN0YXR1cywgbmV2ZXIgYWJvcnQNCiAgICBzdXNw
ZW5kDQogIHBsYXRmb3JtL3g4NjogYml0bGFuZC1taWZzLXdtaTogc3VwcG9ydCBNSUZTIHYyIHBl
cmYtbW9kZSBtYXBwaW5nDQogIHBsYXRmb3JtL3g4NjogYml0bGFuZC1taWZzLXdtaTogcmVhZCBm
YW4gdGFjaCBmcm9tIEVDIHdpbmRvdyBvbiBNSUZTDQogICAgdjINCiAgcGxhdGZvcm0veDg2OiBi
aXRsYW5kLW1pZnMtd21pOiBkcml2ZSBsaWQgc3dpdGNoIHZpYSBFQyBwb2xsIG9uIFhpYW9taQ0K
ICAgIEJvb2sgUHJvIDE0DQogIERvY3VtZW50YXRpb246IHdtaTogYml0bGFuZC1taWZzLXdtaTog
ZG9jdW1lbnQgTUlGUyB2MiBmaXJtd2FyZQ0KICAgIHZhcmlhbnQNCg0KIC4uLi93bWkvZGV2aWNl
cy9iaXRsYW5kLW1pZnMtd21pLnJzdCAgICAgICAgICB8ICAyNiArKw0KIGRyaXZlcnMvcGxhdGZv
cm0veDg2L2JpdGxhbmQtbWlmcy13bWkuYyAgICAgICB8IDI3MiArKysrKysrKysrKysrKysrKy0N
CiAyIGZpbGVzIGNoYW5nZWQsIDI5MCBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQ0KDQot
LSANCjIuNTUuMA0KDQo=
