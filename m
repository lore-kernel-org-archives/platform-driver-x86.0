Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2111.outbound.protection.outlook.com [40.107.21.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A70657C6
	for <platform-driver-x86@vger.kernel.org>; Mon,  8 Apr 2024 11:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.111
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712575930; cv=fail; b=OYuBUa774r/236SoKsDYok8ZO2DavbGTR4UomPkIW2GkAgPFOGs2KkZijiCAeLY5s/WIKsNd+XwAyNapknMmJKhQK01lvNmIW0yWUDoiDYf2zOVn47yjoVaeVs58w/QJSEyOOvQg9CWALsxiddtubAzEDI/7VkoXMHOWGHxNuzc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712575930; c=relaxed/simple;
	bh=Iz2mOaSQ47piroXYnPf3Zbd3WOcFQs5JOUM731vfkp0=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=N56kOV+HMM8JCC5iktg+EaewARqq7ak/IxTnytGuSBg7TBcniSL7c+J6XULN0Vbcc5ihIFUqooakUK/uGeyiiPK7v9/CQ7rGiVFLgzuEQUYfkjjBFWmgHrqOxoKPEdHo0+94bF8I41Lv2lY7SKd7H97WX1ZXBgNwxcgTmOVp/d8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=danelec.com; spf=pass smtp.mailfrom=danelec.com; dkim=pass (2048-bit key) header.d=danelec365.onmicrosoft.com header.i=@danelec365.onmicrosoft.com header.b=YMT+0MiL; arc=fail smtp.client-ip=40.107.21.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=danelec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=danelec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=danelec365.onmicrosoft.com header.i=@danelec365.onmicrosoft.com header.b="YMT+0MiL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ICyTeKnUhoSOYxcUDHpUARNftiQ5y/QnpYZV1Wm5YFPO5aXCWorAnvE3dKXxr2YPmZQRsV/FjgtXjk4TsOThdKP96VaJWFEKw4AGN2V2pKDXfhxfxB2PGnao3BZZbhsPbC/PDW9220EebjAJ8YY4+J0M7RZBJpzZkS5mPXhk/Pk+ePU6h4N43HKOUiUOqJzRTLBpneL5O5Ai2NOy0fyWOrqdu7buFq5gE6ZjHWspeOSxqIN/qsy+WDZV6Zue5+1r7udjj4TK+ABPqwB6AfiamRzMAIknQxxx03k8+uaPhWhZ1byNWFByMj0TANK9fXi4rmJLBSkq3UcJMsjlzuA1WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Iz2mOaSQ47piroXYnPf3Zbd3WOcFQs5JOUM731vfkp0=;
 b=n6FjtUevgXx0t0O153iBahSUMFktfVXEDJfQz9Oyq0UYOWw/CoXiWxuoVoLsyjJe3QGz69nCAfJTFO+Ed4hWnolR7s2oGxB9J1QFR+Vsnc+7myBIqRRD6tHrZuIJtogGAJhOQgpzQWX7acqsxq3IH7vMCo2NoG1qxdTyUC/zIff2Ym5kkLv8cSwZMRB3scAgAF7Z+rk0h16448k7nc7HI0I//4iEcLle44pHKU4K+3/bzLK2JkqrJNASZYu8fPX7y8LYKVuUqJA034JomiH+U6BWQ95QJgcf8dJ9iTzvNPFWYIzkRJrE92pHckahw86EWTu3BhV3Fn0RTAXvK0LAyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=danelec.com; dmarc=pass action=none header.from=danelec.com;
 dkim=pass header.d=danelec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=danelec365.onmicrosoft.com; s=selector1-danelec365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iz2mOaSQ47piroXYnPf3Zbd3WOcFQs5JOUM731vfkp0=;
 b=YMT+0MiLjNpNbFz4iUNFP4zP0ZWApl9vKjN29vMRSVnQ0e7qXVCbTqA/4tevTBL6+c+WKMdcg2EGLaURnjTwlXmPxj+Bwl0aNUMstESKHeDjp9pJbYdJfCUlHXOhmHP+OoFu32NPpKbaPegHAZyRh6dylk28dGHfzfgi59iDYX+O7ldRpjN0V2VSiSjq68Ffnu/fE/IuI9nsv5cIyndH2/DpxsfHnZDnMpn6VRwrHYU121zA2qDWm3AWeDLZ9x5YHkEQ/xNuq/YBRGMYoQAVFrkJnJ4hLjnmvGwrNQdlvOQdOvYOwI5pVxV8QLjipPPfZDHLtTE9d0jW9X3eLS3fdg==
Received: from AS4P189MB2133.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:518::15)
 by AS1P189MB1886.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:4a4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Mon, 8 Apr
 2024 11:32:02 +0000
Received: from AS4P189MB2133.EURP189.PROD.OUTLOOK.COM
 ([fe80::834a:241:19fa:337d]) by AS4P189MB2133.EURP189.PROD.OUTLOOK.COM
 ([fe80::834a:241:19fa:337d%5]) with mapi id 15.20.7409.042; Mon, 8 Apr 2024
 11:32:00 +0000
From: Mikael Lund Jepsen <mlj@danelec.com>
To: Armin Wolf <W_Armin@gmx.de>, "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>
Subject: RE: ishtp_eclite: reading fan tacho value from ElkgartLake PSE
Thread-Topic: ishtp_eclite: reading fan tacho value from ElkgartLake PSE
Thread-Index: AdqGaW9B7MEW5nyYRIiwM/72OqfmsAANsFmAAMG6COA=
Date: Mon, 8 Apr 2024 11:32:00 +0000
Message-ID:
 <AS4P189MB2133E5E9975E253C795E6742BA002@AS4P189MB2133.EURP189.PROD.OUTLOOK.COM>
References:
 <AS4P189MB2133A68C6CB82C58E0268311BA3C2@AS4P189MB2133.EURP189.PROD.OUTLOOK.COM>
 <b85d1fbe-af3a-446e-a4d2-fbbd53c0c398@gmx.de>
In-Reply-To: <b85d1fbe-af3a-446e-a4d2-fbbd53c0c398@gmx.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-xink-handled: Yes
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS4P189MB2133:EE_|AS1P189MB1886:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 JDbqbXS7WQnI6ZtdunkvKZYXJZJjNDU/TMwfzgDzd8qFS7noJFT1wcKfoqtIGWA9IuCL0WBEFdVdmOXte3vy7ALsIbsPUQCZqy6XFXoWy0e5IBl12f4KYJMEMvMNbv3vmbaaY4HnmylKuPVgBaVmCHonbn5UQFKCC/VQrDlZ0O2p3E8IWLkpHddLHltyUViGXnV+YWTQdYKNl9bdLy7X8KmxzzAen8h6F/MeqRwgt93rUXnP0nF19Lkr3rVdI1GxLa3sMVnkrFzFAyfX35z6MZW0pmVOGLjue7tuKa9aC3qiCzeVi6zBWBX3o77rfW7fah2O643yihf273XPWFZ0mSoXZwxhk4hGy8g1at84HDJKNzEhaqpFXwNlzLNIL0gFoSu1t8GTtpo+o+iOxC8GGOO2k8Zbntoetpgz3WyZyN6kdBx3Vzk3uHpb46G1w9KvRjVxncTWJHfBWYfgN3OcbRPU9CRN9AzeHRpC08KLOsDLPkubLjBfbWcB5JiOLxewzZh5oXEYVR7MJ8BzWlPmHQFfBe+vN7nfa8DenMbdTGF6aPPCsAXrKtZGSZHXyfJDU7Boz5t+8dGELkj5/bN5VwAg2bH4Oq7VtCU7c50/wuFb8wVoLJ9IPWqTD+F/ZOccOIN+6AkM39R1t7M0wDD9fMCwbCmYQKxN/O8rI1ELi0U=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4P189MB2133.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aENveGIzRjNTZ0JtYWNnZ3JzaDVXM0tvTkJZaDZWMnlDYzhrZ0lKSkNFMHl3?=
 =?utf-8?B?YjV6NGdpdE5veHBHRy9ndUJMdlRLV1RqcUlpbUZ1YTd1ZFlHTGVMTWkrWkw1?=
 =?utf-8?B?cE9DTkZCM0FaRUptMWFpOS9BR0owcUxyaXJFY2xRMVpvaHplVEhNNmtNL2tJ?=
 =?utf-8?B?bmROSUZDY284TWVISXNmOWFlcEhwalYyK2NkcElJZHZNdW1ZKzZEaTZDRXFR?=
 =?utf-8?B?N2NmZ0NOOGtWNWJMbFVycC94cnpZb3EzVmV3Y3g2R2ZUZGM0NGZzM05xU1ZY?=
 =?utf-8?B?WnVPVi9lcnNyVGIwaTk3Z09oS0pVUERxUnhkZGNobkJXZzYrYXJFYWVya2FG?=
 =?utf-8?B?VXNpdkViVjZYUWVGYnp5c0o1dng2UWh4K1hDUWV4K0t4VGtzdVE5aUhJakZv?=
 =?utf-8?B?RXZWZDBlNHgyM1RaMGI3Qm9PNHI4VnlXYys3dmFYdDJIdlc5dTRNSFJQYnRk?=
 =?utf-8?B?Qko4RkZ4RndSdlB1MVZxQVg4Qkw2VUJXSXdETEthVTIzN3E2VmQyRGZhWHFX?=
 =?utf-8?B?eHhVaVN6Si90eVN6aFpWc1VyeC9idGh6V1ZHN01ERkJjOThjalQ0d1NzUnVB?=
 =?utf-8?B?aXlBeTl5Yi9idVljb3JKTUxvQy90L3YrYTB1Q0hYVmxTR0dxVitkY1FTZG11?=
 =?utf-8?B?WFZ0VWovdHFiSXJjV0p6TnFjclRMLzlKRFlXU1RwTEpzWlZDdk4zdmpvSWcv?=
 =?utf-8?B?YVBPTTFDeVU2djV6eDR2YXc2RW5tSVF1VGdGSHN3YjVJWDZqN0RRdkpaSTN0?=
 =?utf-8?B?SXNZdHR0OUM0Q1RSbW8xOXZEWGxFZllGM0VhME4zdndxNWVFdzBzZTlDVXk4?=
 =?utf-8?B?dTc1bG1mRS9keHhJbkhKSlZodEI5cDlxN3Bra016WFFOQmVueEVvYnErNmJy?=
 =?utf-8?B?aWtxZ3g3ZkhLQUI5c2toU2g4UzlhVk41ZkFkNFJMTjZwR1Q2Q0pUMFl2WERT?=
 =?utf-8?B?VHI0KzRTTHNwY3FYTFhvbVQvaXpHV1oxZVd5c1pTM1hmOE1nV3ZoZVdqdUZ0?=
 =?utf-8?B?YXAxQTMrZGI0Sk9zRFV4QWRXRVlyVlRxVEMzUTBXdFZxR3FweU0rTVA3VFZt?=
 =?utf-8?B?NHpuNUlwTG4vYmRnRWk3UjF5UWxVRUNGLzExSVRhc1J5NEtyTld2ZDgxWUh5?=
 =?utf-8?B?SWtsdGFlaFQwMjRoY3dSQVdKRksvRXNrclhzNE5qYWcrOFNSZGZiMGQzcC9T?=
 =?utf-8?B?SzVwc3ZmVVBGZDc5WHhvZmZMNE44MXV1OVk4dHdMNnZmaHZ2ZGN4T29sb0dL?=
 =?utf-8?B?RmZESDhhU0VPV1I4KzFVUmIrMGtOb2RRRytCaUdWTkZTLzZxbGFVYXlFdG5i?=
 =?utf-8?B?bUluNGROeTFRRC9LUlpHemtHZWNxU3kxWU5sT3VBQVVFYldqaUg0QjkvcGV6?=
 =?utf-8?B?WERWM2tjQzFuczg4Yk9kMnVnWTFBTi9OcStFc21uWjZTYUhHbVBYUTNJeDFP?=
 =?utf-8?B?VHRGTTRwbHNmNkFhMzJCRDVvSlp1aWM3Z3IyVW9qZTkxa255Z2tLYXNIV0ZG?=
 =?utf-8?B?aG1rZjZuU0VKK0FiRE9sMk9xSVpZZUhuOGxOMEYxZFUrUFZpeEIvVEpHWVhR?=
 =?utf-8?B?cVBFV01ZcGl3aUphQ25mTkZEZDJrWkkwWXNmSkFrRkVKeEZwL3lzd2EvOGFl?=
 =?utf-8?B?dTlTVktoNjN3OG5oOFdHbVBKZzg1eUF5T244S2ZOOURpUFFmd2J2ZE9mTE5a?=
 =?utf-8?B?MFpTZE0rTm41SEYrOFVRUzdxWjVEMHkxZUhoUkd0NURHMjMrZmdvekxORklx?=
 =?utf-8?B?U1hFY1NZTG5uYytYdzlNL0l2WmVOSFZLNmxGY2pVNmdUTFpCQU1lai9zSUNy?=
 =?utf-8?B?UVBiZFltZW5JQklXaXY2SUt4TDRKU1gzcEg3WWJKc1F1RVEvdTEvbnUyQlFp?=
 =?utf-8?B?MHA4amhUQVg5WW5BZEZwdnFNaEFNQUxBMmRHNXlhb3Q5N1FQTzFtQW1mQXRT?=
 =?utf-8?B?WnFzUzBpQnhYVjNxQ1VKUU9DUWhOVnNPaG8raGZ1Y2kvMCsxcXdyaGRGcEJ0?=
 =?utf-8?B?TUNLUG4vTkZxY0RWNURmK2owSFF5UmlacWluZG5HdG9DSHRBc1VDajNMTC8y?=
 =?utf-8?B?RldTaUhvRHdmQ25FbnhaYm1WWDhtc3ZDQUVNRm1sdm9GcGduTDBSSG5ESUNJ?=
 =?utf-8?Q?T+7s=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: danelec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS4P189MB2133.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cdb22c4-c356-4519-c7c4-08dc57bf81c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2024 11:32:00.7331
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d6bfedfe-b78c-47c3-8370-03356c3b6cf5
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PzUWDt/LcrS0ukCFe5iy4pPCLHfIaVKQ7P9fuR2fxXJtIlPjYsNRzAQFl0CXQNi9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1P189MB1886

PiBPbiAwNC8wNC8yMDI0IEFybWluIFdvbGYgd3JvdGU6DQo+IEFtIDA0LjA0LjI0IHVtIDEwOjM3
IHNjaHJpZWIgTWlrYWVsIEx1bmQgSmVwc2VuOg0KPg0KPj4gV2UgYXJlIHVzaW5nIHRoZSBJbnRl
bCBFbGtoYXJ0TGFrZSBDUkIgYm9hcmQgYW5kIG5lZWQgdG8gcmVhZCB0aGUgQ1BVIEZhbiB0YWNo
byBzaWduYWwgZnJvbSBMaW51eCB1c2Vyc3BhY2UgKHNvIHdlIGNhbiByYWlzZSBhbiBhcHBsaWNh
dGlvbi1sZXZlbCBhbGVydCBpZiBmYW4gaXMgYnJva2VuKS4NCj4+DQo+PiBUaGUgQ1BVIEZhbiBQ
V00gb3V0cHV0IGFuZCB0YWNobyBpbnB1dHMgYXJlIGNvbnRyb2xsZWQgYnkgZmlybXdhcmUgcnVu
bmluZyBvbiB0aGUgUFNFIGNvbnRyb2xsZXIgKENvcnRleC1NKSwgd2hpY2ggaXMgZW1iZWRkZWQg
aW4gdGhlIEVsa2hhcnRMYWtlIFNvQy4NCj4+IFRoZSBQU0UgRmlybXdhcmUgY29udGFpbnMgYW4g
RUNMaXRlIGZlYXR1cmUgd2hpY2ggdXBkYXRlcyB0aGUgZWNsaXRlX29wcmVnaW9uLnRhY2hvX3Jw
bSBmaWVsZC4gVGhpcyBmaWVsZCBpcyBhbHNvIGRlY2xhcmVkIGluIEFDUEkgKG9mZnNldCAzMzAp
IGJ5IHRoZSBib290bG9hZGVyIChTbGltYm9vdGxvYWRlcikuDQo+Pg0KPj4gRmFuIGNvbnRyb2wg
d29ya3MgZmluZSB2aWEgdGhlIHRoZXJtYWxfem9uZSBzeXNmcyBpbnRlcmZhY2UsIGJ1dCB3ZSBj
YW5ub3QgZmluZCBhbnkgZW50cmllcyBmb3IgdGhlIHRhY2hvLg0KPj4gQXMgd2UgdW5kZXJzdGFu
ZCBpdCwgdGhlIGlzaHRwX2VjbGl0ZSBkcml2ZXIgbWVyZWx5IGFjdHMgYXMgZ2x1ZSBsYXllciB0
byB0aGUgUFNFL0VDTGl0ZSwgc28gc29tZSBvdGhlciBrZXJuZWwgY29kZSBuZWVkcyB0byBjYWxs
IGl0LCB3ZSBndWVzcyBiYXNlZCBvbiBBQ1BJIGRlZmluaXRpb25zLg0KPj4NCj4+IERvZXMgYW55
IGRyaXZlcnMgZXhpc3Qgd2hpY2ggZXhwb3NlIHRoZSB0YWNobyB2YWx1ZSB0byB1c2Vyc3BhY2Ug
KHByZWZlcmFibHkgdmlhIGh3bW9uIGFzIGlzIHRoZSBzdGFuZGFyZCB3YXkgdG8gZG8gdGhpcyBp
biBwcmV2aW91cyBJbnRlbCBkZXNpZ25zIHdpdGggTFBDICsgU3VwZXJJTyk/DQo+PiBPciBpZiBu
b25lIGV4aXN0LCB3ZSBtYXkgbmVlZCB0byBhZGQgdGhpcywgYnV0IGNvdWxkIHJlYWxseSB1c2Ug
c29tZSBwb2ludGVycyB0byB1bmRlcnN0YW5kIGhvdyBzdWNoIGEgZHJpdmVyIHNob3VsZCBjb21t
dW5pY2F0ZSB3aXRoIEVDTGl0ZSB2aWEgdGhlIGlzaHRwX2VjbGl0ZSBkcml2ZXIuDQo+Pg0KPj4g
Tm90ZTogVGhlIG9mZmljaWFsIEludGVsIGJpbmFyeSByZWxlYXNlIG9mIHRoZSBQU0UgRlcgKE1S
NykgZG9lcyBub3QgZW5hYmxlIHRoZSBsb3ctbGV2ZWwgVEdQSU8gU0VESSBkcml2ZXIgaW4gdGhl
IFBTRSBlbnZpcm9ubWVudCwgc28gdGhlIHRhY2hvIGlucHV0IGlzIHNpbXBseSBpZ25vcmVkLg0K
Pj4gSWYgcmVidWlsZGluZyB0aGUgUFNFIEZXIChodHRwczovL2dpdGh1Yi5jb20vaW50ZWwvcHNl
LWZ3KSB3aXRoIHRoZSBTRURJIGRyaXZlciBlbmFibGVkLCBFQ0xpdGUgc3RhcnRzIHRvIHJlYWQg
dGFjaG8gYXMgZXhwZWN0ZWQsIGJ1dCB0aGlzIGRvZXMgbWFrZXMgdXMgd29uZGVyIGhvdyB3ZWxs
IGltcGxlbWVudGVkIChvciB1c2VkKSB0aGUgPnRhY2hvIGZlYXR1cmUgcmVhbGx5IGlzLg0KPj4N
Cj4+IEJlc3QgcmVnYXJkcw0KPj4gTWlrYWVsIEx1bmQgSmVwc2VuDQo+PiBTb2Z0d2FyZSBFbmdp
bmVlcg0KPj4gRGFuZWxlYw0KPg0KPiBIaSwNCj4NCj4gbWF5YmUgeW91IGNvdWxkIHByb3ZpZGUg
YSBBQ1BJIEZhbiBkZXZpY2Ugd2hpY2ggaW1wbGVtZW50cyBmYW4gc3BlZWQgcmVwb3J0aW5nIHRo
cm91Z2ggdGhlIF9GU1QgY29udHJvbCBtZXRob2Q/DQo+IEluIHN1Y2ggYSBjYXNlIHRoZSBnZW5l
cmljIEFDUEkgZmFuIGRyaXZlciB3b3VsZCBleHBvcnQgdGhpcyB2YWx1ZSB0byB1c2VyIHNwYWNl
IHRocm91Z2ggc3lzZnMuDQo+DQo+IElmIHlvdSB3YW50IHRvIHVzZSB0aGUgc3RhbmRhcmQgaHdt
b24gc3lzZnMgaW50ZXJmYWNlIGluc3RlYWQsIGkgY2FuIHByb3ZpZGUgeW91IHdpdGggYSBwcm90
b3R5cGUgcGF0Y2ggZm9yIGV4cG9zaW5nIHRoaXMgdmFsdWVzIGFzIGEgc3RhbmRhcmQgaHdtb24g
ZGV2aWNlLg0KPg0KPiBUaGFua3MsDQo+IEFybWluIFdvbGYNCg0KSGkgQXJtaW4sDQoNCkEgc3Rh
bmRhcmQgaHdtb24gZGV2aWNlIHdvdWxkIGFjdHVhbGx5IGJlIHByZWZlcmFibGUgdG8gbWUsIGFz
IHdlIG5lZWQgdG8gc3VwcG9ydCBvbGRlciBwbGF0Zm9ybXMgYXMgd2VsbCBpbiB0aGUgc2FtZSBj
b2RlYmFzZSwgYW5kIHRoZXkgYWxyZWFkeSB1c2UgdGhhdC4NCklmIHlvdSBjb3VsZCBwcm92aWRl
IGEgcHJvdG90eXBlIHBhdGNoLCBJIHdvdWxkIGJlIHZlcnkgZ3JhdGVmdWwuDQoNClRoYW5rcywN
Ck1pa2FlbA0K
