Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DA74C433E0
	for <platform-driver-x86@archiver.kernel.org>; Mon, 15 Feb 2021 09:09:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4810864E64
	for <platform-driver-x86@archiver.kernel.org>; Mon, 15 Feb 2021 09:09:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229895AbhBOJJT (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 15 Feb 2021 04:09:19 -0500
Received: from mail-eopbgr1310122.outbound.protection.outlook.com ([40.107.131.122]:6498
        "EHLO APC01-SG2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229783AbhBOJI7 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 15 Feb 2021 04:08:59 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=erIrPhtFkS07J+Q6fodf1JBbLqyeb2vUucvW6Lw5oZ4tUUlFmeKLqkimiMOqNjnJj2n6sWZlAy96Hg5k/6mQOsRnmVl6PCPF/8JqGAv/iLCpyBWmDjJIwQgPkQSeATzhdiSeOVGwA7n/HwuhCaG+s4M+cCDW2KUAwh+AmAm1WGtC8CUktIA2VOSmNtsGYe0JIyoWXHRfGSvgoW3Y2HiCmSSLo3Ho+pxdWjZtE3enaaZ6/81PkZmDj7rj4MAZnuv5pDY7pL5yxzmrPsFWqRocySWSQXXutZyy0MPEPOiISNoN5Sxqr60E7sUAnuyLJabAVJXHQHKOF07/xrkFFhHJDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xAKfEaCnr0BoJvz/t6BleLIwwHQi12TF1xSFzLsRLO4=;
 b=k38Kpf/xPB2u70a7Xso/KRqz7cO0Ko9vv+dQ0pe61Awg0FTUqzdMUvmH9DEqw77TeDWCq8l66I0wIHEXHXuIW38koG5fCGqf1TjAqfOwbrMEelu28TjSUsDqPmDYflFZH1eVPGziq+P6Tqzw212RQAsGKT8HenWykuClp3SBQXodPurcGz6VNZblNEI44lGqc8AGgPZ05VatziM/H4KZ3tMLtHKmOCZpSPRCzXjEqkU9xJhD9T89ZQ47XNgXvlm6uEBgDm32Yrcw4gLKfuCvsxO9OmLJbBWSGF9S1ICQFORZY1qNOHdRz1MPef9WDx9qXnk3bS8XvGqm+wxtHr37iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lenovo.com; dmarc=pass action=none header.from=lenovo.com;
 dkim=pass header.d=lenovo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=LenovoBeijing.onmicrosoft.com; s=selector2-LenovoBeijing-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xAKfEaCnr0BoJvz/t6BleLIwwHQi12TF1xSFzLsRLO4=;
 b=wjMORSnF8niq0F2q6XYb5Gay31vb8I8mdFb0qMfT2JofTkUc6rcvUz5ByuXBhE4QTGFChFU23mQ2HH4U8qRVco0SoiFJ5mGFLbk2L55Z6CYi1l1MdvEEcSkrMWwlITWpjTEvlYUiJrfOF0jblz7f1aI+uOq3CAOQdT5fc7sZI54=
Received: from TY2PR03MB3645.apcprd03.prod.outlook.com (2603:1096:404:3f::21)
 by TY2PR03MB3582.apcprd03.prod.outlook.com (2603:1096:404:33::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.11; Mon, 15 Feb
 2021 09:07:17 +0000
Received: from TY2PR03MB3645.apcprd03.prod.outlook.com
 ([fe80::51c4:f02c:2dd9:a1c2]) by TY2PR03MB3645.apcprd03.prod.outlook.com
 ([fe80::51c4:f02c:2dd9:a1c2%7]) with mapi id 15.20.3868.022; Mon, 15 Feb 2021
 09:07:17 +0000
From:   Nitin Joshi1 <njoshi1@lenovo.com>
To:     =?utf-8?B?QmFybmFiw6FzIFDFkWN6ZQ==?= <pobrn@protonmail.com>,
        Nitin Joshi <nitjoshi@gmail.com>
CC:     "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "ibm-acpi-devel@lists.sourceforge.net" 
        <ibm-acpi-devel@lists.sourceforge.net>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        Mark RH Pearson <markpearson@lenovo.com>
Subject: RE: [External]  Re: [PATCH 2/2] platorm/x86: thinkpad_acpi: sysfs
 interface to interface to get wwan antenna type
Thread-Topic: [External]  Re: [PATCH 2/2] platorm/x86: thinkpad_acpi: sysfs
 interface to interface to get wwan antenna type
Thread-Index: AQHXAkjrVEF6NmVBMkOenQ95jC39CapY6duA
Date:   Mon, 15 Feb 2021 09:07:17 +0000
Message-ID: <TY2PR03MB3645EAC79E07F88ABE5D36BF8C889@TY2PR03MB3645.apcprd03.prod.outlook.com>
References: <20210212055856.232702-1-njoshi1@lenovo.com>
 <20210212055856.232702-2-njoshi1@lenovo.com>
 <Z37uykc5gmsuJ0GzzVV8r1w2247m33IZ49gGcW-wSZI8Xu43M2C8jgpSizSvKm2-iVDy0BVY3mGcRAybwkz-OOnZi6VQYmpHe3miOc0dQF8=@protonmail.com>
In-Reply-To: <Z37uykc5gmsuJ0GzzVV8r1w2247m33IZ49gGcW-wSZI8Xu43M2C8jgpSizSvKm2-iVDy0BVY3mGcRAybwkz-OOnZi6VQYmpHe3miOc0dQF8=@protonmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: protonmail.com; dkim=none (message not signed)
 header.d=none;protonmail.com; dmarc=none action=none header.from=lenovo.com;
x-originating-ip: [114.164.25.243]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c145b4f9-1429-4c2c-eb81-08d8d19117d1
x-ms-traffictypediagnostic: TY2PR03MB3582:
x-ld-processed: 5c7d0b28-bdf8-410c-aa93-4df372b16203,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY2PR03MB3582712F0969713803C0B3C88C889@TY2PR03MB3582.apcprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zTjG6q0Tad5Tbj3yc8smWo5G146bM5tZ0fKevZsiKAdWIVN4Gd6uIgEn8hKj931oFKqR3+VF5tRq51R013gegXYRulgkv6BBXkG97l77ViTB1V/2nG4GWROqMLx+fSlXN6KSBN+hpmCT79EDCIM9tihcCIpVbUwmBxSTOvVDo/EOKWzO6h2fhhdWfrpSVIUI4YPSG8igySdG80OEeik+xRXpdRo1XqoX25gV4exMWFjG7wsO5ZydUwJ1KiYko1PR5GzIhDYFuvarUGbfoLOgdhgpFAIyfuqlLyQNaXIj7nRpBiGxxU/qeCpuWLMtDvlcClwWt8ma7RY0yhGK9vbtGmtti3jV/WL5/UZrnHZsdMHr+h1gK2BxQ4qU/7NS0FHIAAJ7YwxaiINjgY/COtsdCtHsjHUhsmfKtKwb849cyqhyIWnEEYQlz2b+XFMFZR3hgbaE+NjqsqX/JuMIwaACVSiZF8oSn5jdzpwAwEaMuTpTRD+SuscxuDdafTguH8zETVGnbQdnS7eYLgxFFE2BuA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR03MB3645.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(366004)(376002)(346002)(396003)(26005)(54906003)(478600001)(5660300002)(76116006)(9686003)(71200400001)(8676002)(66574015)(6506007)(110136005)(66476007)(64756008)(55016002)(86362001)(66946007)(66446008)(52536014)(33656002)(316002)(83380400001)(7696005)(107886003)(2906002)(186003)(4326008)(8936002)(66556008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?eEVMODJ0T05TK2tnMzB1ZXVBZmUwU2Z0bUQ0T1BLWkI3WndoWURoWDFoTElB?=
 =?utf-8?B?TklYK1BrMW5nYThuMXlrVEVBbmJoLzRHYnliRXRRbnBZcHhFaUc3eGFtRGJy?=
 =?utf-8?B?aDhsKzliNjRFYUdmMythbFgveWorK2RBL2JIZDR2ZTYzaGR6dnl3VkExYlJ4?=
 =?utf-8?B?N2NpYWNaajk5MzdLNGZnWEpCTW1ScVJnV29QS0s2d1ljVi93RWZvaW4zZ0xr?=
 =?utf-8?B?TnNWZEhBRy9ZZTdHdmorWDZLL21DeG5rVGdsMkgwQllZSEhnM3dpcm13Y2ZM?=
 =?utf-8?B?VXZLUDZ5ZEhNYW9aWnhiMGFZeElnZHpjbFd2enM2OEZnblA5YXcvellKRWRN?=
 =?utf-8?B?NnJteks4RUJKcFpYYW5GRDdBUkg1dUdhR2pRR1YvOW5iWVRjaGdTTzJDdi9D?=
 =?utf-8?B?K3V0RERxaTdWRUpLVmREMktVNGtkTXFZaUZFU0JrZ0RlNVdKOU1WanFQTWth?=
 =?utf-8?B?R3A3dWdGeWMyN3YyQ1plUE9nYXhmY3hKUm1BQ3pFNS8xSEttQXQzeUVWTUgv?=
 =?utf-8?B?VkdNUDhFMEdlVXhJSCtzbjNEOUMybkM0VDJzRURneFcyUnhaMDZ4eGxXV0xI?=
 =?utf-8?B?L2t5MlA1VUFzYUluaElUSU83YVAzVGd3d1I5ck5jSGI0MVZxcVYxby93RHp1?=
 =?utf-8?B?ZXYzTnd2ZmVnUEZMSFFlSGdZR3NlUGYzUE5HUFlpZ0hwc0s3dnk3d0Mwd2h0?=
 =?utf-8?B?bkhBUnBuN3VOMDB3VlA5N2JLaTFlbmdrNjZjTWNPT2VMbFVQZlQ4dmxmMzh0?=
 =?utf-8?B?NDlGeFlGQ3dWNm1yQ1BXVlkvQTdLSDBNdHVxa3pHUjNCWHlOdFI5MGZHZ3N1?=
 =?utf-8?B?TjU1RGRaMjJOTS9sTWppMHpTYnhGYUFCUnFFL0l3bkd4YmdxaFg0YjdWT3kz?=
 =?utf-8?B?TnEzSFkrTHhKQWhzSk90RmJBWGxONTVGZzRiK0w1dFFvQVFQdzgyanpySkkx?=
 =?utf-8?B?a2dCaEUyK1NSdXlSUDFsOGZjK1Y0VHd5Q3hBUTJhWDh1ZEVlZThNcW1wR1Vl?=
 =?utf-8?B?T1RQQWhLTlhVTFZyQklEWkIzWWtsRnZzN0NLWk1qbCtYRVVyM3BWdWVPQmN1?=
 =?utf-8?B?Vm5URW9laUprQllnbURqaFh3bmxhOGZLOHFZaTMrUWRIVXY1M2lmSHFoUWNC?=
 =?utf-8?B?b3lwcElSaU5kWEM1SmM0NE4xcWNPd1pnVVFESWFVZ2o0a0x2WVBSU1BiVC9o?=
 =?utf-8?B?TkJtQk93c2g3SE1KaTBhOEZrc0IrdVgxVzAvMnFjSVUxZ09sQWxhcG1acDh6?=
 =?utf-8?B?MW9yeTVWMFlMK0RJTFFIcDR1U0ZBTjlyOUc3ZmlaRUxXL1VYMFZhTVVQRUs2?=
 =?utf-8?B?THdrd0c0V295cGJDVnlwc2pBNjVDWWNBaHByNEdhaXgvK09zWDE0MFBvcU9W?=
 =?utf-8?B?T3E0Q0syTGNMVTlMRFNodGZxT21teHdYUFdmVTFISVJUTG0vYS95S2huYXIz?=
 =?utf-8?B?OTRVTXkvb1hVTzJNeFI0dUdKb0hMVGJXTXpWTml6VkNFNUlwd1Nna214bDRW?=
 =?utf-8?B?SXQvcGdtZ0RaRGJKOTVDem5MWU1iaVJhcXZkQ3FyTHpoY3NFRld2bytFc0py?=
 =?utf-8?B?dGV3d3VobkJiZTZJdnIyTkd5dWhNTEdmWXo1RTcxQ3ZDR09ERENaZy9STy92?=
 =?utf-8?B?Tm44TEsyNG9NU3VjbmE5YmpBNWwrOW1jUWIrQ1lLZ0tDWXBjN3FLMHNpZFA0?=
 =?utf-8?B?QXRZaHM2WWNmNU5tT0xtUVgvbjNSdi9udkhPV1J6TXVCWUtSbXJoT21tZXow?=
 =?utf-8?Q?QUtjUvTBOzPn3LR7XnGMESwFxeSQG/ieNQId2cr?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: lenovo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR03MB3645.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c145b4f9-1429-4c2c-eb81-08d8d19117d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2021 09:07:17.1612
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1JQGLFZgaTjUDP7CtULFtk+HhYeCrhhgiHMS3x05hXwfNQMZ5R67wsXh7gJW4SEojhD9r3Z62jaXorITv8Wcfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR03MB3582
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

SGkNCg0KPi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogQmFybmFiw6FzIFDFkWN6
ZSA8cG9icm5AcHJvdG9ubWFpbC5jb20+DQo+U2VudDogU3VuZGF5LCBGZWJydWFyeSAxNCwgMjAy
MSA1OjQzIEFNDQo+VG86IE5pdGluIEpvc2hpIDxuaXRqb3NoaUBnbWFpbC5jb20+DQo+Q2M6IGhk
ZWdvZWRlQHJlZGhhdC5jb207IGlibS1hY3BpLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldDsg
cGxhdGZvcm0tDQo+ZHJpdmVyLXg4NkB2Z2VyLmtlcm5lbC5vcmc7IE5pdGluIEpvc2hpMSA8bmpv
c2hpMUBsZW5vdm8uY29tPjsgTWFyayBSSA0KPlBlYXJzb24gPG1hcmtwZWFyc29uQGxlbm92by5j
b20+DQo+U3ViamVjdDogW0V4dGVybmFsXSBSZTogW1BBVENIIDIvMl0gcGxhdG9ybS94ODY6IHRo
aW5rcGFkX2FjcGk6IHN5c2ZzDQo+aW50ZXJmYWNlIHRvIGludGVyZmFjZSB0byBnZXQgd3dhbiBh
bnRlbm5hIHR5cGUNCj4NCj5IaQ0KPg0KPg0KPjIwMjEuIGZlYnJ1w6FyIDEyLiwgcMOpbnRlayA2
OjU4IGtlbHRlesOpc3NlbCwgTml0aW4gSm9zaGkgw61ydGE6DQo+DQo+PiBbLi4uXQ0KPj4gKy8q
IHN5c2ZzIHd3YW4gYW50ZW5uYSB0eXBlIGVudHJ5ICovDQo+PiArc3RhdGljIHNzaXplX3Qgd3dh
bl9hbnRlbm5hX3R5cGVfc2hvdyhzdHJ1Y3QgZGV2aWNlICpkZXYsDQo+PiArCQkJCXN0cnVjdCBk
ZXZpY2VfYXR0cmlidXRlICphdHRyLA0KPj4gKwkJCQljaGFyICpidWYpDQo+PiArew0KPj4gKwlz
d2l0Y2ggKHd3YW5fYW50ZW5uYXR5cGUpIHsNCj4+ICsJY2FzZSAxOg0KPj4gKwkJcmV0dXJuIHN5
c2ZzX2VtaXQoYnVmLCAidHlwZSBhXG4iKTsNCj4+ICsJY2FzZSAyOg0KPj4gKwkJcmV0dXJuIHN5
c2ZzX2VtaXQoYnVmLCAidHlwZSBiXG4iKTsNCj4+ICsJZGVmYXVsdDoNCj4+ICsJCXJldHVybiBz
eXNmc19lbWl0KGJ1ZiwgInVua25vd24gdHlwZVxuIik7DQo+DQo+SSBmZWVsIGxpa2UgcmV0dXJu
aW5nIC1FTk9EQVRBIHdvdWxkIGJlIG1vcmUgYXBwcm9wcmlhdGUgaGVyZS4gT3IgbWF5YmUNCj55
b3UgY291bGQgY2hvb3NlIG5vdCB0byBjcmVhdGUgdGhlIGF0dHJpYnV0ZSBpZiB0aGUgYW50ZW5u
YSB0eXBlIGlzIHVua25vd24uDQo+QW5kIEknbSBub3Qgc3VyZSBpZiB0aGUgInR5cGUiIHByZWZp
eCBpcyBuZWNlc3NhcnkuIEkgYmVsaWV2ZSB0aGUgbmFtZSBvZiB0aGUNCj5hdHRyaWJ1dGUgJ3d3
YW5fYW50ZW5uYV90eXBlJw0KQWNrIC4gSSB3aWxsIGNoZWNrIGl0LiANClJlZ2FyZGluZyBwcmVm
aXgsIGl0J3Mgbm90IHNvIG5lY2Vzc2FyeSBidXQgbGV0IG1lIGtlZXAgInR5cGUiIHByZWZpeC4N
CiAgIA0KPmFscmVhZHkgaW1wbGllcyB0aGF0IHRoZSBjb250ZW50IHdpbGwgZGVzY3JpYmUgYSB0
eXBlLiBGdXJ0aGVybW9yZSwgSSB0aGluayB5b3UNCj5jb3VsZCBvbWl0IHRoZSBgaGFzX2FudGVu
bmF0eXBlYCB2YXJpYWJsZSBhbHRvZ2V0aGVyLCBzdG9yaW5nIG9ubHkNCj5gd3dhbl9hbnRlbm5h
dHlwZWAgaXMgZW5vdWdoLg0KQWNrIC4gSSB3aWxsIGNoZWNrIGl0DQo+DQo+DQo+PiArCX0NCj4+
ICt9DQo+PiArDQo+PiAgc3RhdGljIHNzaXplX3Qgd2xhbl90eF9zdHJlbmd0aF9yZWR1Y2Vfc3Rv
cmUoc3RydWN0IGRldmljZSAqZGV2LA0KPj4gIAkJCQlzdHJ1Y3QgZGV2aWNlX2F0dHJpYnV0ZSAq
YXR0ciwNCj4+ICAJCQkJY29uc3QgY2hhciAqYnVmLCBzaXplX3QgY291bnQpDQo+PiBAQCAtMTAw
NzYsMjQgKzEwMTE0LDI5IEBAIHN0YXRpYyBzc2l6ZV90DQo+d2xhbl90eF9zdHJlbmd0aF9yZWR1
Y2Vfc3RvcmUoc3RydWN0IGRldmljZSAqZGV2LA0KPj4gIAl9DQo+Pg0KPj4gIAlzeXNmc19ub3Rp
ZnkoJnRwYWNwaV9wZGV2LT5kZXYua29iaiwgTlVMTCwNCj4+ICJ3bGFuX3R4X3N0cmVuZ3RoX3Jl
ZHVjZSIpOw0KPj4gKw0KPg0KPklmIHlvdSB3YW50IHRoZSBlbXB0eSBsaW5lIGhlcmUsIEkgdGhp
bmsgeW91IHNob3VsZCBwbGFjZSBpdCBpbiB0aGUgcHJldmlvdXMNCj5wYXRjaC4NCkFjayAuIEkg
d2lsbCByZW1vdmUgaXQuDQo+DQo+DQo+PiAgCXJldHVybiBjb3VudDsNCj4+ICB9DQo+PiAgc3Rh
dGljIERFVklDRV9BVFRSX1JXKHdsYW5fdHhfc3RyZW5ndGhfcmVkdWNlKTsNCj4+ICtzdGF0aWMg
REVWSUNFX0FUVFJfUk8od3dhbl9hbnRlbm5hX3R5cGUpOw0KPj4NCj4+ICBzdGF0aWMgaW50IHRw
YWNwaV9kcHJjX2luaXQoc3RydWN0IGlibV9pbml0X3N0cnVjdCAqaWlibSkgIHsNCj4+IC0JaW50
IHdsYW50eF9lcnIsIGVycjsNCj4+ICsJaW50IHdsYW50eF9lcnIsIHd3YW5hbnRlbm5hX2Vyciwg
ZXJyOw0KPj4NCj4+ICAJd2xhbnR4X2VyciA9IGdldF93bGFuX3N0YXRlKCZoYXNfd2xhbnR4cmVk
dWNlLCAmd2xhbl90eHJlZHVjZSk7DQo+PiArCXd3YW5hbnRlbm5hX2VyciA9IGdldF93d2FuX2Fu
dGVubmEoJmhhc19hbnRlbm5hdHlwZSwNCj4md3dhbl9hbnRlbm5hdHlwZSk7DQo+PiAgCS8qDQo+
PiAgCSAqIElmIHN1cHBvcnQgaXNuJ3QgYXZhaWxhYmxlIChFTk9ERVYpIGZvciBib3RoIGRldmlj
ZXMgdGhlbiBxdWl0LCBidXQNCj4+ICAJICogZG9uJ3QgcmV0dXJuIGFuIGVycm9yLg0KPj4gIAkg
Ki8NCj4+IC0JaWYgKHdsYW50eF9lcnIgPT0gLUVOT0RFVikNCj4+ICsJaWYgKCh3bGFudHhfZXJy
ID09IC1FTk9ERVYpICYmICh3d2FuYW50ZW5uYV9lcnIgPT0gLUVOT0RFVikpDQo+PiAgCQlyZXR1
cm4gMDsNCj4+ICAJLyogT3RoZXJ3aXNlLCBpZiB0aGVyZSB3YXMgYW4gZXJyb3IgcmV0dXJuIGl0
ICovDQo+PiAgCWlmICh3bGFudHhfZXJyICYmICh3bGFudHhfZXJyICE9IC1FTk9ERVYpKQ0KPj4g
IAkJcmV0dXJuIHdsYW50eF9lcnI7DQo+PiArCWlmICh3d2FuYW50ZW5uYV9lcnIgJiYgKHd3YW5h
bnRlbm5hX2VyciAhPSAtRU5PREVWKSkNCj4+ICsJCXJldHVybiB3d2FuYW50ZW5uYV9lcnI7DQo+
Pg0KPj4gIAlpZiAoaGFzX3dsYW50eHJlZHVjZSkgew0KPj4gIAkJZXJyID0gc3lzZnNfY3JlYXRl
X2ZpbGUoJnRwYWNwaV9wZGV2LT5kZXYua29iaiwNCj4+IEBAIC0xMDEwMSw2ICsxMDE0NCwxMiBA
QCBzdGF0aWMgaW50IHRwYWNwaV9kcHJjX2luaXQoc3RydWN0DQo+aWJtX2luaXRfc3RydWN0ICpp
aWJtKQ0KPj4gIAkJaWYgKGVycikNCj4+ICAJCQlyZXR1cm4gZXJyOw0KPj4gIAl9DQo+PiArDQo+
PiArCWlmIChoYXNfYW50ZW5uYXR5cGUpIHsNCj4+ICsJCWVyciA9IHN5c2ZzX2NyZWF0ZV9maWxl
KCZ0cGFjcGlfcGRldi0+ZGV2LmtvYmosDQo+JmRldl9hdHRyX3d3YW5fYW50ZW5uYV90eXBlLmF0
dHIpOw0KPj4gKwkJaWYgKGVycikNCj4+ICsJCQlyZXR1cm4gZXJyOw0KPj4gKwl9DQo+PiAgCXJl
dHVybiAwOw0KPj4gIH0NCj4+IFsuLi5dDQo+DQo+DQo+UmVnYXJkcywNCj5CYXJuYWLDoXMgUMWR
Y3plDQoNClRoYW5rcyAmIHJlZ2FyZHMsDQpOaXRpbiBKb3NoaSANCg==
