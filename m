Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazolkn19012059.outbound.protection.outlook.com [52.103.43.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A322306B0A;
	Sat, 29 Aug 2026 11:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.43.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788002842; cv=fail; b=cP2CWzZvSXhSnSz+Gg4gw+mWOTWV1DkXOA7o3inp82PvMC6i5J9C6TQGS7KWnVvojygyRPhI0Vl6U/+mg05AknLjTACGsbdpX90vVb6Ct908Tg+/bDtmLLIZ0T2sjpNA/Kbp2UZ4D1osH86xsjKasWa3u4vgciGFNZSj+t+SJRI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788002842; c=relaxed/simple;
	bh=nZ2ov6N8FmoorWEPFTDNfNS83kE9fYUN4GMDdgTx6Fs=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=FYTK1dSwvZnUEtH1qxuqQ+if+mFBnJsiGB1VY6e8M670stok+jKk1eZpdqoqKSW4ZzkGAcEwBPbV/BWTJUb0q9Keh4kipMAINAhy+3eFTlKDe+LtGpBhKx9gMY6YoQW2zB/8KxgT9D7VKmNfgBr34EJ6tM0TMJCtcm6c1Y3/xr4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=fNgvK3IH; arc=fail smtp.client-ip=52.103.43.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="fNgvK3IH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Re4dRzxWcPI/f80PLO5w5fqK3E2cYik6I5McN8POSi6siSN9juDu4SDozsE/bk9UFrDwGgH/5LAdQtdeAp3DnAp5ak43LdAz/JhlafeHJgShFfc0vhtMhsODjwCsqzEYr6GZX9T5UFILfBYGj+onM66TAF3dE92HrIZbC76HxHYSX988ba2qAbswm8T9WFV/wdPlF9nlzkol6gkYSqkrux8m2jPHBHJgr+jMPEj0q3IbULp1PRCJQf7zVJG4VNj7uvDJm8R1Nt1ep3/vXk0JX02P6KjPVw524Jz1zLQggaaHOSzeDA9J9OTAobrbsRPCAZza64HrY3YkQGRBBxOHCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nZ2ov6N8FmoorWEPFTDNfNS83kE9fYUN4GMDdgTx6Fs=;
 b=Doi34MOog143o1CkZPV1dioziWuvieotYGNWDICgqV5Veam1ts0kLq9kCCrUd6eLpJ+kPiXAcdvMZsNuJ5Zb9j6suTu+KQUF/6tIgwhk26IifQuQ1CH1PLiBKyOAkTAOUnVhvDK+obc05j8nknAp5AyacQY6CnnEfN6VZzPW8rnIGDHqK2q4OaM9gCPItJb43VO5UWvLsmRYoeuvPcxXzYqTqTm602P7AM80qJpmKNYoVBe/idhJ90vBCCAyA84bLj0l8RbofqqIaI+HhQl1t/EpW5LjPUGweTH7CPTa2G0GSQnjJnhoBmwrwHbWGMTHTkHbkwnehoKzryj/yoin3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nZ2ov6N8FmoorWEPFTDNfNS83kE9fYUN4GMDdgTx6Fs=;
 b=fNgvK3IH8Q6rdHvjpVq3Q4lsnQDvgioxLFrLncDhsQjrjTD2ZRaCMQQ3ugizuKsnYFov1pWPyqHuPKzkl2NpG5Ks8wYLuaBv80WCaBY4N6eRJr+B5FOC1Xp1mNAUX721vaQ5nh2GK5RlyKn3kuqG023CQ5KwMM/2kCC96ezPzRdrkLcMz/zJuFqEd95T7XwJc9t1s3ixCpj8rOYTAmaYJIWMZrW00q0f5fuXkpDfi9fe/fBs3w0vYzAMoI1BC2tLFMvwcZrnd3eiqCU+dKxSZfd4sfLrR96jtX/+1deBGSGd521MA+XbpnVDdOXGOTd3bwRxr6lmw9zWjrVufSafSg==
Received: from SI2PR04MB5895.apcprd04.prod.outlook.com (2603:1096:4:1eb::6) by
 SEZPR04MB6455.apcprd04.prod.outlook.com (2603:1096:101:9f::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.11; Sat, 29 Aug 2026 11:27:17 +0000
Received: from SI2PR04MB5895.apcprd04.prod.outlook.com
 ([fe80::eca5:8fa:ae90:10b9]) by SI2PR04MB5895.apcprd04.prod.outlook.com
 ([fe80::eca5:8fa:ae90:10b9%4]) with mapi id 15.21.0360.008; Sat, 29 Aug 2026
 11:27:16 +0000
From: =?gb2312?B?saMgyubOxA==?= <baoshuwen2013@outlook.com>
To: "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH] platform/x86: hp-wmi: add support for OMEN 16-am2xxx boards
Thread-Topic: [PATCH] platform/x86: hp-wmi: add support for OMEN 16-am2xxx
 boards
Thread-Index: AQHdN6lRbvdmwqCcm0qDa0BcWsiYZg==
Date: Sat, 29 Aug 2026 11:27:16 +0000
Message-ID:
 <SI2PR04MB589526A21FB0EF4E8ABA749CA2AB2@SI2PR04MB5895.apcprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR04MB5895:EE_|SEZPR04MB6455:EE_
x-ms-office365-filtering-correlation-id: abe96fde-ad3b-4fee-e420-08df05c07aef
x-microsoft-antispam:
 BCL:0;ARA:14566002|25031999004|25010399006|22091999003|24021099003|8060799015|19110799012|8062599012|31061999003|15030799006|15080799012|51005399006|102099032|440099028|3412199025|40105399003|2607281247196008;
x-microsoft-antispam-message-info:
 =?gb2312?B?dTc3Y1ljb280a2I2UkVJSUxXVnVjMC9zSVJiemZYc0RXVTVnRUlOTXVUOGpP?=
 =?gb2312?B?eC9uOGlXUm5ReThmK0FycG4xRnRpdXZqZEhrT2t5Q3Qxem50dEQxZDA3cFp1?=
 =?gb2312?B?ZjZhOUh1UDF1ejBEQVUxak94WmZnbUFsdnBrL1QvSWtTOHQ2VzU2Q3dPaDE0?=
 =?gb2312?B?REh0ZVR4S1BJZlRhYkpQdFJiSElFMWVBZkhmZnV5UUxVZm5Tc09BWFV2WnpL?=
 =?gb2312?B?b29pR1FSZFF4eCtiRlZlRWFic2NsU09uWUw5Z2JveU5DdFByVUx4Z0tOcVRk?=
 =?gb2312?B?VGpJTTk4WGxRV1lXYlhMWGpjNlpuUjdFdHNYUURORWQ4VHI1OGNJN2lxRXo3?=
 =?gb2312?B?VzlaM2o1WjZON2hmWEZxaGdIbEM5ZW1ZSFRaODhGS0xNRFhsUHlDSml1R1lx?=
 =?gb2312?B?MWl6UUFMczQ3cjFKc1FCSjg4MTVsNnc3M0tJVnFYVTVmRGkvdmVPUkhYeExS?=
 =?gb2312?B?R1N0WVV1WmVhNHpkZ2ZzUzROcExrNjFxRXBCZCtqQVJXRHBqbmNza2lkblIz?=
 =?gb2312?B?WmttS25ZcEF4UHNoeWtsTGI0RzNRRS9GZG8wUklYTTh2MXp2WXVEVVAxdTIz?=
 =?gb2312?B?MU8xdENBUXMwdlNxS29pWC9TbTFEZ2N1ZU5VbUlra0pNbmVyYlhReW1nK1RF?=
 =?gb2312?B?UUUweEtuaEJsYkU4dUkwa3ZlZGdDVWdleDFRTW5NRnUzYmZQZ3EyeEFkcDZO?=
 =?gb2312?B?cGRLbXZ5UjBKb3dWcHRzaGMwVVNycnVHUUlJdGVqUUx0MEZZMk1sYzN1b2x4?=
 =?gb2312?B?K1JOb2ZWU01OWE91T25WbGduRVpiQ2VDWDFwZHhzOGNaU3dCK3FTL3B3K2Mz?=
 =?gb2312?B?a29aM1ZaWHZhV1BZU3JJVjVQSkFTbXEveDhkc2M4UkFHWlBhMDJvR0FxajZR?=
 =?gb2312?B?MGV4aTVRQlBxaW9VN0plZGlpSXVQOEk1OGpvNE5sMmVnL0RVVm9FUUg1alR4?=
 =?gb2312?B?VWRGRFFwSnN2WG9TOE1QdFBMZVBJeFJic2J2cUloUkhkYnJTKzBLWlBraTNF?=
 =?gb2312?B?Nm1xUHIzQlVJL1hJdmtiYmRFTklPSGNnV2FvTGswUG16ZDNaa1NnaTF1aHJn?=
 =?gb2312?B?RXZPeDZtbythZ1YzenV4b296MFMyYkgzckVYd2NsS2VXRGJVZmY5SzNGQjY2?=
 =?gb2312?B?REZJQ2UwVGNXK2FERWhSeGs5NkNtNzBuazg5NE9jWnNqd0RTSTFFVmcyNWFx?=
 =?gb2312?B?UkdpcU1iTE5CM0RQNUt6Z212Y3lWYmpJRkxsQlpOTUZxOVlrYlhqSEY5OEtO?=
 =?gb2312?B?b2lQK1Y0ZXkrbkZ6N3BnU0JUTXZxM2dqQ0F3dVZ6dzhUaGVVcU9FTHJvM2ZK?=
 =?gb2312?B?VjVrcmFYNlJ2U0dkT1hIWkJpRGdZVmc4RWRpZnpZdnpQNHhmMHo0NWwrNnpu?=
 =?gb2312?Q?LjdejPnMj4qIOYUW7rRZO86nVd74/OYY=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?ZVFWWG9KRW9NUkdyVjBMdDMycXcxWVFKYjVHNGt0cUVsNVV2bG9uSnhYdGNq?=
 =?gb2312?B?RVdOaVV1ei9zWmFSc1oxY1ZSd2RwR3VrejdvUXRDSTRSYTJhRHNvSmJGY29S?=
 =?gb2312?B?aEVXTllZMGVZZG9VWXRkT0hWUC9rTnFDaXFkeVpQUTJLbFBuK0FRc21HcTg0?=
 =?gb2312?B?eEROeUJmWEh6WGZtakMvbU1CQ0N6Z0pKOFBRVTJVV0lZSjRtZlVveXRuRVN1?=
 =?gb2312?B?R0t5cU1DN1dweFRWZkFPclhleGNnVjV5bmNuazNzWlF6Vkk1b3R0M0JNMUQ1?=
 =?gb2312?B?RmRPMXZENnlWQUZyM24vb1R3TitjcngzOWxneHVQWWV3Z3VkYndrUFRucWw1?=
 =?gb2312?B?ZmdOMU5jK2IvZDQvSFJEK3M3dzJmRGt2cEZJcUdZbk5FVHRUeEd2WjVDYjNF?=
 =?gb2312?B?SnBSSW1CaDBwUzh0STVRbEZ4MWl3UzBUQzcvbFRVNExxaFY1NUttc3prR3l4?=
 =?gb2312?B?d1g1OEswQkxyVFhrVFMwaUZ5eEx4eGtkUFFFaVZKdzgvYkV4T1ExRWNhME9Q?=
 =?gb2312?B?TXRQZDNFYndNZ0psdlQvMlJDQWU4cHk3bVFyMVZKazJocVhHSkJzdnR2MzlE?=
 =?gb2312?B?ZlVaNlZwRDg3dGlWYmdLOUhLNmIrZVJzbmw0dUhLVzdDcCtDNHc1TWt1bG9y?=
 =?gb2312?B?U2pETlNlVHJ4SnA5QkU5MWx0RjI4UlFPVlU5SUV4ejhNR1g3ZlRaeU45RzQz?=
 =?gb2312?B?ZlVVNjFYczFMUjFRRy9GSjN6K2ZpYlA3bzBDejMveEkzMW9Qalpqa01FNGd6?=
 =?gb2312?B?YXdBeUF5UDM2Y2oyYXR0M2doWXNnWTN4ZDg0TWZKV0h6b3MxMURObnRTMThs?=
 =?gb2312?B?TmN4NDBIVGo5dXFqbkVUWXBSWnFCRzQzYlVNUUxaQ3dPd2tBWlNMQmtmUCtu?=
 =?gb2312?B?TllKUjdjcjlZUXY1OUNRajJObUwzWEV0T2k4M0c3R1I2SlhBNkJ5aVd3TFhF?=
 =?gb2312?B?ejcvV1QzTmRPVE1kV2QzL1NlQlV4THk1dS80SjVLaUdNcUQwci8zK0FGd1Zh?=
 =?gb2312?B?UHFUOExEWXlFRWJSbHJUcmlLZFNoT0VHZmlJRUdiOEZnVVlvaFE1OWxjcHhS?=
 =?gb2312?B?RThtc2ZVQURER3Arcnk4dGZxUWFiMlpyR29waE10YXh4MlltRTBFL3QzMFJ1?=
 =?gb2312?B?VFArSDU3dW9qRGxXR2FqRy95UDVtZlpLSXpTUHd2QlozRlBGOWxHWDZXRTZK?=
 =?gb2312?B?YXRXTWxyQkExTkhjRy9VOG1HaU8zR3VVZnIwcFBKVDladEhuZlFNajBkcFUw?=
 =?gb2312?B?U2l1S3I1ZmFtZEY5TWFBMUhUbHFjbjVqRHA4aXBYMXF2NVkrQnpIT2NpS0Zv?=
 =?gb2312?B?T29JY1ZrZXZ1S2pjSkFrVHhIMXpweUhOcUhZRWRIaWFUUHdxSWYxVktOVFlM?=
 =?gb2312?B?MkdoQW8wcGhnT1h2SldDc0I3SmdnOWpnUmV6UGlLWmg4R3MwU3hHNEZ4ek1j?=
 =?gb2312?B?MzZuZ1FKRzIzUmZmQnlpT29zMUR3OUY5QnlhUkRRbS9YWWNSaTNMV3Q2M1oy?=
 =?gb2312?B?anhJTFN5eG9jWW5lbG1ETks1dmZJY2RTb1ZQR09tRG5mU0w0ZEh2VzNFYmF3?=
 =?gb2312?B?b3lLYlQ3QzVQbVJJMDVJeVlORHBTaHpLc1R4THJGQTFaSDBvdjRoYkNkQWRk?=
 =?gb2312?B?bWhDRFQxOHZBWVcrK3VZYytoRUQzd2VDMWtJNUMrcmJ5em1tdkx1a1E4Z092?=
 =?gb2312?B?VzZmSGwzODBQclZWUmtySG93UEFYU092L2JwaEo5S2F6cktoNW1ZdmpDdExW?=
 =?gb2312?B?TGxIV1RlTnlFV0ZtbnZVZGdYNjNrSnN3ZnJIRFNZcnVuNDIrUkVUQ0xycEpq?=
 =?gb2312?B?b3dwRU5ZbW1yMWw5Szljc3htcG1jSkNub3NkZUd5ckNGY0FBZERGL2U2Sjh2?=
 =?gb2312?Q?auQCB6u0WGiHQ?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR04MB5895.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: abe96fde-ad3b-4fee-e420-08df05c07aef
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2026 11:27:16.3689
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR04MB6455

VGhlIEhQIEh5cGVyWCBPTUVOIDE2LWFtMnh4eCAoRE1JIGJvYXJkIDhGMUMsIDI2QzEgcGxhdGZv
cm0gY3ljbGUsCkFycm93IExha2UtSFhSKSBpcyBsaXN0ZWQgaW4gdGhlIE9NRU4gQ29tbWFuZCBD
ZW50ZXIgZGV2aWNlCmNhcGFiaWxpdHkgdGFibGUgd2l0aCBEaXNwbGF5TmFtZSAiSHlwZXJYIE9N
RU4gMTYiIGFuZCB0aGUKIlBlcmZvcm1hbmNlQ29udHJvbCIgZmVhdHVyZSwgYnV0IGlzIG1pc3Np
bmcgZnJvbSB0aGUga2VybmVsJ3MKb21lbl90aGVybWFsX3Byb2ZpbGVfYm9hcmRzIHdoaXRlbGlz
dC4gIFRoZSB0aGVybWFsIHByb2ZpbGUgcGF0aCBpcwp0aGVyZWZvcmUgbm90IGVuYWJsZWQgYW5k
IHRoZSBlbWJlZGRlZCBjb250cm9sbGVyIGtlZXBzIHRoZSBDUFUKcGlubmVkIGF0IHRoZSBkZWZh
dWx0IGZyZXF1ZW5jeSBjYXAgd2hpbGUgcnVubmluZyBMaW51eC4KCkFkZCA4RjFDIHRvIHRoZSBP
TUVOIHRoZXJtYWwgcHJvZmlsZSBib2FyZCBsaXN0LiAgT24gdGhpcyBwbGF0Zm9ybQp0aGUgRUMg
ZmlybXdhcmUgYWxzbyBhcm1zIGl0cyBvd24gdGhlcm1hbCBwcm9maWxlIHJldmVydCB0aW1lciAo
RUMKb2Zmc2V0IDB4NjMsIGFybWVkIHdpdGggMHg1YSB3aGVuIHBlcmZvcm1hbmNlIGlzIHNlbGVj
dGVkKSBhbmQKc3dpdGNoZXMgYmFjayB0byB0aGUgYmFsYW5jZWQgcHJvZmlsZSBvbmNlIGl0IGV4
cGlyZXMsIHNvIGFkZCB0aGUKYm9hcmQgdG8gb21lbl90aW1lZF90aGVybWFsX3Byb2ZpbGVfYm9h
cmRzIGFzIHdlbGwgaW4gb3JkZXIgdG8gaGF2ZQp0aGUgZHJpdmVyIGNsZWFyIHRoZSB0aW1lciBh
bmQgc2V0IHRoZSBOT1RJTUVSfFRVUkJPIGZsYWdzIHdoZW4Kc3dpdGNoaW5nIHRvIHRoZSBwZXJm
b3JtYW5jZSBwcm9maWxlLgoKVGVzdGVkIG9uIGEgSHlwZXJYIE9NRU4gMTYtYW0yeHh4IChrZXJu
ZWwgNy4yLjAtYm9vdC1tZS1wbGVhc2UpOgphZnRlciBsb2FkaW5nIHRoZSBwYXRjaGVkIGhwLXdt
aSBtb2R1bGUgdGhlIHBsYXRmb3JtX3Byb2ZpbGUKaW50ZXJmYWNlIGlzIGV4cG9zZWQsIGFuZCBz
d2l0Y2hpbmcgdG8gdGhlIHBlcmZvcm1hbmNlIHByb2ZpbGUKcmFpc2VzIHRoZSBDUFUgZnJvbSBh
IH4yLjkgR0h6IChQLWNvcmUpIC8gMi42IEdIeiAoRS1jb3JlKSBjYXAgdG8KfjQuOCBHSHogLyB+
NC4zIEdIeiB1bmRlciBhIHNpbmdsZS10aHJlYWQgbG9hZC4gIFRoZSBFQyB0aGVuIHJlcG9ydHMK
dGhlIHBlcmZvcm1hbmNlIHByb2ZpbGUgKDB4MzEpIHdpdGggdGhlIE5PVElNRVJ8VFVSQk8gZmxh
Z3Mgc2V0CigweDYyPTB4MDYpIGFuZCB0aGUgcmV2ZXJ0IHRpbWVyIGNsZWFyZWQgKDB4NjM9MHgw
MCk7IGEgcGxhaW4gd3JpdGUKb2YgdGhlIHByb2ZpbGUgd2l0aG91dCB0aG9zZSBmbGFncyBpbnN0
ZWFkIGFybXMgdGhlIHRpbWVyICgweDYzPTB4NWEpCmFuZCB0aGUgcHJvZmlsZSByZXZlcnRzIHRv
IGJhbGFuY2VkIHdoZW4gaXQgZXhwaXJlcy4KClNpZ25lZC1vZmYtYnk6IFNodXdlbiBCYW8gPGJh
b3NodXdlbjIwMTNAb3V0bG9vay5jb20+CgotLS0KIGRyaXZlcnMvcGxhdGZvcm0veDg2L2hwL2hw
LXdtaS5jIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvcGxhdGZvcm0veDg2L2hwL2hwLXdtaS5jIGIvZHJpdmVycy9wbGF0Zm9ybS94
ODYvaHAvaHAtCndtaS5jCmluZGV4IDhiYTI4NmVkODcyMS4uNjIwMGQ4NzNjNzMyIDEwMDY0NAot
LS0gYS9kcml2ZXJzL3BsYXRmb3JtL3g4Ni9ocC9ocC13bWkuYworKysgYi9kcml2ZXJzL3BsYXRm
b3JtL3g4Ni9ocC9ocC13bWkuYwpAQCAtMTYxLDYgKzE2MSw3IEBAIHN0YXRpYyBjb25zdCBjaGFy
ICogY29uc3Qgb21lbl90aGVybWFsX3Byb2ZpbGVfYm9hcmRzW10gPSB7CiAgICAgICAgIjhCQUQi
LAogICAgICAgICI4QzU4IiwKICAgICAgICAiOEU0MSIsCisgICAgICAgIjhGMUMiLAogfTsKIAog
LyogRE1JIEJvYXJkIG5hbWVzIG9mIE9tZW4gbGFwdG9wcyB0aGF0IGFyZSBzcGVjaWZpY2FsbHkg
c2V0IHRvIGJlIHRoZXJtYWwKQEAgLTE3OSw2ICsxODAsNyBAQCBzdGF0aWMgY29uc3QgY2hhciAq
IGNvbnN0IApvbWVuX3RpbWVkX3RoZXJtYWxfcHJvZmlsZV9ib2FyZHNbXSA9IHsKICAgICAgICAi
OEExNSIsICI4QTQyIiwKICAgICAgICAiOEJBRCIsCisgICAgICAgIjhGMUMiLAogfTsKIAogLyog
RE1JIEJvYXJkIG5hbWVzIG9mIFZpY3R1cyAxNi1kIGxhcHRvcHMgKi8K
