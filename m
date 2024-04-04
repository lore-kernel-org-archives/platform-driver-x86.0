Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on2138.outbound.protection.outlook.com [40.107.7.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB8D6F53D
	for <platform-driver-x86@vger.kernel.org>; Thu,  4 Apr 2024 08:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.7.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712219841; cv=fail; b=kbGIGwzUoK0+3VZq8MNLvQrtjkisoRvq+ALOe0CQHmaAsajSrWFxccD3wG0BzDv8DKHYRztH0GRiZgvzV+w5PQfNVsctUZjK/jc/N3EQPiZ5CDUvGrZmwhtUhJ/VmX1cBVxs8Kh9szMcUdFnMnVftVVuTSC83Zj+LRGfEqx+qX8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712219841; c=relaxed/simple;
	bh=+HgZOsb5MxqtuD4+8ogHKGUjViB8Plm9rCdZK45WC7c=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=MrFwfkK5qZRgxwy/QYSdsg7cryXp6c/ADfuovNEyq0EhpzVFlIFjZ1LtNR24C4w5bAmXGDxLwtkyz3Zqt2tkTKi10zEE+cTREaiVimQAVtCQrUl1oAyQLY3wQhYvodWKsxLflh5UCibdutP57HnBJGpN1cALCqfImG23CHj2EV8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=danelec.com; spf=pass smtp.mailfrom=danelec.com; dkim=pass (2048-bit key) header.d=danelec365.onmicrosoft.com header.i=@danelec365.onmicrosoft.com header.b=aj+FoTFK; arc=fail smtp.client-ip=40.107.7.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=danelec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=danelec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=danelec365.onmicrosoft.com header.i=@danelec365.onmicrosoft.com header.b="aj+FoTFK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ayj83MtEgaM/szQQUUomBbHQZ+iARXuYt7pFTSUJzBYFVLnUXWdq4xOePQ7byRFSN8C4D/xIRbRC94IIZU11hCtH6oLmh1BlaU/pzfqmPVO1Hgq1eQngN8eeZ7d1Bw2PXyLTF8inc/4oxJ5rc25LmQ8k2kVLRGd7oXF0PdvDrmuW8g9GzAxVDvxgl+Qj7sxr4XGJ8fL4wcAfvbVknbPYNLGwWQUwfZ3DVPDbOEyy8TOtvzMuPmYcWiP7od+M3ryLLinh2jyFIvBdwhcqE6zVxmI4KHkmw0bFYhU32TlwDRvoSeHtUEieWyebLT20Bey0iQBw7JRRq1BBjHRMMo87hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+HgZOsb5MxqtuD4+8ogHKGUjViB8Plm9rCdZK45WC7c=;
 b=RBfoPXT5iD3RqSrnWkO92SIcb8r47ZgzV1TcQ3gsN4qgKXVu6rkggNCaZmHSeSmoV8nfRp89sstWL8PvmIdfAf72zICLavSYjHawqiqkIu21KnGWlIUnqFR1nuKiYQgmCaglervKHaXeUTlURkRuozuItMoaKS0qUK0+qZTABWBmM2LT1wKLiPgNSFQRcaLMWaTv2RDBZJA0j7mqLOvb57tFt7xO4RDBU87TvmhSlGUDnJQ4CTvuwjLZJDkZnlY+T4mnZA6wEShYp1kwtDuGld8h5W6L+ZT71KgPHLnSBPiv664FCR8cCccORSGzAu6CpoT4d0SjCHdv9mtRZ5l31A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=danelec.com; dmarc=pass action=none header.from=danelec.com;
 dkim=pass header.d=danelec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=danelec365.onmicrosoft.com; s=selector1-danelec365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+HgZOsb5MxqtuD4+8ogHKGUjViB8Plm9rCdZK45WC7c=;
 b=aj+FoTFKvwSMYqy4QojqvSv7Anm/S6cet5l3SZuVFBK9UKl7A26GWi+hrQunuXIx0Jyu0zUoxKL78yO1l0tcFqUBGm+0i3tqG026fd7k8Z2/dOmwmhr7j29lqRxRZtnGDWY2xxYPEsdF7UptwVY31bjDRcUZJREeSVJ+l6M7g/a07BKNqcEYLvSCNCwPq3E1KCS40IszQXPC4KB4lnap8cMUevXZwYnnLdZOkP0kMiVfFVecezC69mlHa9XwSirlfGoViWD71PxqpS4K5RjR7BPJvM9/53bpkM/wRVAMYc2YFNJ6pw1AEAKpd4jPiJWwbzW46TUJ29kfeIcsLnv55w==
Received: from AS4P189MB2133.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:518::15)
 by DU0P189MB2138.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:3b6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Thu, 4 Apr
 2024 08:37:14 +0000
Received: from AS4P189MB2133.EURP189.PROD.OUTLOOK.COM
 ([fe80::834a:241:19fa:337d]) by AS4P189MB2133.EURP189.PROD.OUTLOOK.COM
 ([fe80::834a:241:19fa:337d%5]) with mapi id 15.20.7409.042; Thu, 4 Apr 2024
 08:37:13 +0000
From: Mikael Lund Jepsen <mlj@danelec.com>
To: "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>
Subject: ishtp_eclite: reading fan tacho value from ElkgartLake PSE
Thread-Topic: ishtp_eclite: reading fan tacho value from ElkgartLake PSE
Thread-Index: AdqGaW9B7MEW5nyYRIiwM/72OqfmsA==
Date: Thu, 4 Apr 2024 08:37:13 +0000
Message-ID:
 <AS4P189MB2133A68C6CB82C58E0268311BA3C2@AS4P189MB2133.EURP189.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-xink-handled: Yes
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS4P189MB2133:EE_|DU0P189MB2138:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Bifg0iXELc/ZJS/19GN/wveNOfA/Wd+y/8mMb++7SFSANkkukylzGRJl6ZTSWYpUcuBU+oozr6hNaiStAcEhf1J+SKvfoaaoGKrOGBOfwrgVuz98SG95fRQXISxLOgLPbuFcDBdX3rco09k2EFG/6en2pzu9QnsxySkgaZ8oTTuVY86CJ16bqBQXdv+ADBTmUU/ozFf4YcydtU2Wc5WD2r99TbkGvkUL0WfJlJFQyhtc8iwit3aRA+OwaY/zLsJurYMSXHgerMRl1g2rw+/a+ZIh9QViyvUM+pTq7d94rvY28DvHhhL/T7TW7SNVezDuc4FT6fNLJcZBy7GuK8dJ2jb1L2f1OYWxujmPOoB3o7wE2EHltcIUS2O9+UgEdXh28sU/YVJP9nOq+bmlPuNdV6nMdeRl4a9hGKjDH1qqxsbCn6r9CLXT4R1TUta/HoBeVBhWVVa8GU01gIlkojWK8EhF4HJQgCFbzG30NOXs6nmuSgFNHX95gkh8mphm+HNak/8/BMPIc0fSdG2QNTKEcPgp8riy4cfg1St9R9+yQclxURAhPuf2okKVetwG2EXx7nmuGQWFyFT4Ao31SDtQfmdnCtUlX/VS+k4fgRvC4GZun9ZEDCf1v4jdD4mI0gw4Ztpi6/qTsOH9TzXxrjBfen2oMEV+zaKvEAEUzHKkzBE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4P189MB2133.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?d1YzSDRpNVh0WnBNSVN3aXpzNVQwQW1qZHkzL3RkOFFXRnFMTU1hZzZad3dw?=
 =?utf-8?B?S2pGN3dudTROTDJBVllZajlmL1BXSFdIVE9GRGtPWHVSTGEzOWVQa0dIZzdv?=
 =?utf-8?B?QTgrNGxMWEpqMCtGQVhyKzFibktjTFB4K1c1K0c1Rm45VlZLR0xxQ0swT1gx?=
 =?utf-8?B?cFlkUmwvbUZudk5PbEovak9IMktqQTNhWGcyODF6TG10OUdWNjVZUkNvdFhK?=
 =?utf-8?B?VG1EMkxoWkFpcEVKcGt3NUowaVBOWko3MWJSWUVuMno3WkZHTFNJVmJNM3Jo?=
 =?utf-8?B?KzBicFlKM3ZFZXFTYkhDblBCSjJiZzhjQmM5UzVhQjI0eldVc1p0SUtaN284?=
 =?utf-8?B?ZjVCZFlrM0pJK2dJd21sVXdGWk5LaEk3VGRqb1pXMTIwZWZmUEtuNmNMREFr?=
 =?utf-8?B?SndBYWhzekUrLzZhbmpNMVNhZlBmeVU3L2ZqOW9zSWRXb1RQUWlCUHNNaVpK?=
 =?utf-8?B?SDhMOG5BZTBES3VoN3YxTE9hREVpNWc1Y2lOUTlvbUVoeGo3RmZJc1JjL2Y3?=
 =?utf-8?B?VXZKUTFXbktXTURUdkgwek5QRGV4aDZXeE1JRlluektkZGkvcncxczlUVHNC?=
 =?utf-8?B?QktaTGVDaDNCaHFvS1ZpR1JJbTgwN2RoVTA3blhCOXphMkNwM0xlTjBLTXJu?=
 =?utf-8?B?T3BsK1lQMlJmTlV2TXVHUHNZOXlDQlNHdmVVeldSUE4vMFBST3dINFV5MHdN?=
 =?utf-8?B?YnJueDhaZURsK3BOdERreTZlb2hkTExsT1hISE5xUkVKTWczZURJcjB0Z0s1?=
 =?utf-8?B?MDZ5T3Nmb1hqVHd4N2lDQmNMM3JPWk9JZVBQVmowS1ViTVIzN1BoWlFDUXp6?=
 =?utf-8?B?U2VDbVRYL1AzWXl3a1FyR3lDRWlEUU5zQS83M1hhZzJwT1ZZck5teDlzZnU4?=
 =?utf-8?B?OXRUTFluOGJ1K25KeXpKTWI2RDhJZTFtU3U2WXJzS2JYdFVUT0FDbUdKcURV?=
 =?utf-8?B?TWFKMXlTd1c2MG9YWVhrVmF1cVBodTUxNHRIeHoxM0pad0J5ZURqSUZCQWRF?=
 =?utf-8?B?dEtsUW1lTGZyREppVXUvUERzVzRiek5WUE5QY3NrTE1mUFJuVU81S3YreHVH?=
 =?utf-8?B?aXFjNnRwd21qYXRvczhXeUNDNlJHRGFsOS8zUHFYSkp2a1FOTGozU0s1SlNY?=
 =?utf-8?B?YzZjWlQzSitzNFo0TXZ4WVBWMVFycSt1VUxTeE52OGlwNTl2aUQvY05tNzkv?=
 =?utf-8?B?SGVLRXphSWhaVHRvb2xHdy9hNVRTV3E3cXJxOTA5OXRqUzd1aXFYTXZvVE1T?=
 =?utf-8?B?WGxrMzZRUU94aUhVN2M5SWxrekMzZzkzT0NQc25WOTFzRmNRMVZZbjNBM1lO?=
 =?utf-8?B?VFRUeUUyb2pEZHNRVStiMXBHNU43SjNqZHlzVm5aeGhpZTFxZEw3QWZVeklT?=
 =?utf-8?B?SGs2eG9vTkxGWVc3dFZtNGljYUFpQklKWExCMi9QUXFneGNpVmVlZHRLbUVQ?=
 =?utf-8?B?dmJOd2xzR3RoK1NyOEhaQ2s3WkpyMkFla280UnpUUEVsMlBYWFV5NXFnbGk4?=
 =?utf-8?B?a0tNRmFvQTZVOVc3UWVSNDltNEFkZXptSWRJYXQvMzZBc0g4RERtRW8ydllR?=
 =?utf-8?B?OFI0RzhZSmwra1liYnl3OU9RSFYvdmNScWJ6a3FxNGQ2TnBRRHpWMXFZbWw4?=
 =?utf-8?B?bnhxbUxJVzBtQ2dXSnN2SXBTWkNVVTZtelVnVU80SjRFQVFJck5wc3ZVRXdy?=
 =?utf-8?B?WXF6WTZZeEtDQTdmTGpWaUpNWW9tQ2FQNHdTWWFXVzZtbGRkMXNCNElhUUhI?=
 =?utf-8?B?K29rTWZSUFkrN25VaHpBdGpYSjF0aFBCK2Ixd3lVb2pvMndUYTFwWndZMWhF?=
 =?utf-8?B?U3NQbW5FSDZQMU40VU95TTROZ3V5MC9TVmJDQVJ2K3U2Z29oTFRkRHBacUVR?=
 =?utf-8?B?OGNLV3R4elBGc09XUU5aaE56MlZzWE9kN2dCMXpSamdXSXhkTTlaT1pOdlgr?=
 =?utf-8?B?OXRYQmY3UWs5blFoTHlWRXJVVEhZb0ZWTHloY1R2aUozeXE4OGdhL2VIeGFV?=
 =?utf-8?B?NmFzV0J4TEdMekdhUDJoRnA2Tmd3dGxVbVkwMTNGOFRYVWJvM3FDMlV3dlRw?=
 =?utf-8?B?UlV2VUplNkhhRXJKQVJ0d2FtSXBjU1VEZllzUDNVL0IyVlBmOFhXZlUzdGdS?=
 =?utf-8?Q?MGuE=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: cdbb43f0-70ea-4998-e86a-08dc54826d71
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Apr 2024 08:37:13.8364
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d6bfedfe-b78c-47c3-8370-03356c3b6cf5
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eXVWO/d6eG7Ntobeafn2XI3w4yi5vur5FkigM7I+D95QVbqVut8ZTAyk59t0bzVv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P189MB2138

V2UgYXJlIHVzaW5nIHRoZSBJbnRlbCBFbGtoYXJ0TGFrZSBDUkIgYm9hcmQgYW5kIG5lZWQgdG8g
cmVhZCB0aGUgQ1BVIEZhbiB0YWNobyBzaWduYWwgZnJvbSBMaW51eCB1c2Vyc3BhY2UgKHNvIHdl
IGNhbiByYWlzZSBhbiBhcHBsaWNhdGlvbi1sZXZlbCBhbGVydCBpZiBmYW4gaXMgYnJva2VuKS4N
Cg0KVGhlIENQVSBGYW4gUFdNIG91dHB1dCBhbmQgdGFjaG8gaW5wdXRzIGFyZSBjb250cm9sbGVk
IGJ5IGZpcm13YXJlIHJ1bm5pbmcgb24gdGhlIFBTRSBjb250cm9sbGVyIChDb3J0ZXgtTSksIHdo
aWNoIGlzIGVtYmVkZGVkIGluIHRoZSBFbGtoYXJ0TGFrZSBTb0MuIA0KVGhlIFBTRSBGaXJtd2Fy
ZSBjb250YWlucyBhbiBFQ0xpdGUgZmVhdHVyZSB3aGljaCB1cGRhdGVzIHRoZSBlY2xpdGVfb3By
ZWdpb24udGFjaG9fcnBtIGZpZWxkLiBUaGlzIGZpZWxkIGlzIGFsc28gZGVjbGFyZWQgaW4gQUNQ
SSAob2Zmc2V0IDMzMCkgYnkgdGhlIGJvb3Rsb2FkZXIgKFNsaW1ib290bG9hZGVyKS4NCg0KRmFu
IGNvbnRyb2wgd29ya3MgZmluZSB2aWEgdGhlIHRoZXJtYWxfem9uZSBzeXNmcyBpbnRlcmZhY2Us
IGJ1dCB3ZSBjYW5ub3QgZmluZCBhbnkgZW50cmllcyBmb3IgdGhlIHRhY2hvLg0KQXMgd2UgdW5k
ZXJzdGFuZCBpdCwgdGhlIGlzaHRwX2VjbGl0ZSBkcml2ZXIgbWVyZWx5IGFjdHMgYXMgZ2x1ZSBs
YXllciB0byB0aGUgUFNFL0VDTGl0ZSwgc28gc29tZSBvdGhlciBrZXJuZWwgY29kZSBuZWVkcyB0
byBjYWxsIGl0LCB3ZSBndWVzcyBiYXNlZCBvbiBBQ1BJIGRlZmluaXRpb25zLg0KDQpEb2VzIGFu
eSBkcml2ZXJzIGV4aXN0IHdoaWNoIGV4cG9zZSB0aGUgdGFjaG8gdmFsdWUgdG8gdXNlcnNwYWNl
IChwcmVmZXJhYmx5IHZpYSBod21vbiBhcyBpcyB0aGUgc3RhbmRhcmQgd2F5IHRvIGRvIHRoaXMg
aW4gcHJldmlvdXMgSW50ZWwgZGVzaWducyB3aXRoIExQQyArIFN1cGVySU8pPw0KT3IgaWYgbm9u
ZSBleGlzdCwgd2UgbWF5IG5lZWQgdG8gYWRkIHRoaXMsIGJ1dCBjb3VsZCByZWFsbHkgdXNlIHNv
bWUgcG9pbnRlcnMgdG8gdW5kZXJzdGFuZCBob3cgc3VjaCBhIGRyaXZlciBzaG91bGQgY29tbXVu
aWNhdGUgd2l0aCBFQ0xpdGUgdmlhIHRoZSBpc2h0cF9lY2xpdGUgZHJpdmVyLg0KDQpOb3RlOiBU
aGUgb2ZmaWNpYWwgSW50ZWwgYmluYXJ5IHJlbGVhc2Ugb2YgdGhlIFBTRSBGVyAoTVI3KSBkb2Vz
IG5vdCBlbmFibGUgdGhlIGxvdy1sZXZlbCBUR1BJTyBTRURJIGRyaXZlciBpbiB0aGUgUFNFIGVu
dmlyb25tZW50LCBzbyB0aGUgdGFjaG8gaW5wdXQgaXMgc2ltcGx5IGlnbm9yZWQuDQpJZiByZWJ1
aWxkaW5nIHRoZSBQU0UgRlcgKGh0dHBzOi8vZ2l0aHViLmNvbS9pbnRlbC9wc2UtZncpIHdpdGgg
dGhlIFNFREkgZHJpdmVyIGVuYWJsZWQsIEVDTGl0ZSBzdGFydHMgdG8gcmVhZCB0YWNobyBhcyBl
eHBlY3RlZCwgYnV0IHRoaXMgZG9lcyBtYWtlcyB1cyB3b25kZXIgaG93IHdlbGwgaW1wbGVtZW50
ZWQgKG9yIHVzZWQpIHRoZSB0YWNobyBmZWF0dXJlIHJlYWxseSBpcy4NCg0KQmVzdCByZWdhcmRz
DQpNaWthZWwgTHVuZCBKZXBzZW4NClNvZnR3YXJlIEVuZ2luZWVyDQpEYW5lbGVjDQo=
