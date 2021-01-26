Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8633DC433E0
	for <platform-driver-x86@archiver.kernel.org>; Tue, 26 Jan 2021 16:05:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4ECB3207B3
	for <platform-driver-x86@archiver.kernel.org>; Tue, 26 Jan 2021 16:05:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404401AbhAZQFb (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 26 Jan 2021 11:05:31 -0500
Received: from mail-eopbgr1320113.outbound.protection.outlook.com ([40.107.132.113]:42255
        "EHLO APC01-PU1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2405270AbhAZQEw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 26 Jan 2021 11:04:52 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pvs/+/kqpguY1rCEdQD2k5Czwnb7WmpIOc2wzIoRtR1rUTbGoTP+QFXipV6LMxGaGvjaecXGq/A/R1VQZlEBGgq/gvbHWXvHRVi9VTZVBmooMvEyWQrKty0s7Q8YQxdXo8TxbkYnVEyPIpkvNcoY0Bi8pscV9r00h5i2/TlL+Vd5A1Y3DpNDdxJ19glDZ4CzLQO+ZRUUKeA1hh1uWPdF8vRpkk2zDj77OQqfWrLvsq+UL8+bEpoQHuFJ3184x4rqy1PTQVtHpMstzEbbauFfEBGc3gi0YRm7CtQn4Y99+/aaSylM0Ky5Csr2rn9ky12UArTZr+j/5JGDCaT/6zAbhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6gbGesl+RbhDBM6lhGq6+tUihIJGRJCK29WkAMYtRHs=;
 b=AFdlyLtqFb34Z9GHvO1nyDTUg1wDVy/PJmhLBRgptAFKn26+fJ7dS7neu9gF+SijTXf58YivgGU0xgbAD8wV0jGRU7EOLAUjTaQnj8jO4I4ePi438natlUqXonFzNdtLTv7qoXpXeor5+VxFRYzFcsZkdMdlPfupx2sxTI/XRiA9GgwwfrMgRAz1zZTQ3r7JG+9Vr0uAMMogdZ/fuKwFuam5W66jY0B5CWZlzSqETHZbTWLufabgUFOERqTVyMFZOgIQbBQu92MiFOAyfEq5XGbJ2QoAYnvMxyKF9piazYWesTduoJmCNm+SPovwuFo0o3KGRViTaouJFCnVxQUPMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lenovo.com; dmarc=pass action=none header.from=lenovo.com;
 dkim=pass header.d=lenovo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=LenovoBeijing.onmicrosoft.com; s=selector2-LenovoBeijing-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6gbGesl+RbhDBM6lhGq6+tUihIJGRJCK29WkAMYtRHs=;
 b=hBfYPw7MENx9UaC2CEdfvqgEk6Qho5++1Wv4KntRa+0dSFi2JbtWDixGSEXQtMT0E8jnmvA8ftTnAde6nCO9JfV+bRnwMHpm64sta5FF+57icpDPez8KsPT1xyKJ+RGZKufQ+qpdF7cv/Re5VCM5mXsRtypEppLp3buNz5BGKGE=
Received: from (2603:1096:3:1e::22) by SG2PR03MB4582.apcprd03.prod.outlook.com
 (2603:1096:4:8b::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.7; Tue, 26 Jan
 2021 16:02:27 +0000
Received: from SG2PR03MB2718.apcprd03.prod.outlook.com
 ([fe80::2133:3b93:e239:7be5]) by SG2PR03MB2718.apcprd03.prod.outlook.com
 ([fe80::2133:3b93:e239:7be5%5]) with mapi id 15.20.3805.015; Tue, 26 Jan 2021
 16:02:27 +0000
From:   Nitin Joshi1 <njoshi1@lenovo.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Nitin Joshi <nitjoshi@gmail.com>
CC:     Hans de Goede <hdegoede@redhat.com>,
        Benjamin Berg <bberg@redhat.com>,
        "peter.hutterer@redhat.com" <peter.hutterer@redhat.com>,
        Tomoki Maruichi <maruichit@lenovo.com>,
        Mark Pearson <mpearson@lenovo.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Subject: RE: [External]  Re: [PATCH] [v2] platform/x86: thinkpad_acpi: set
 keyboard language
Thread-Topic: [External]  Re: [PATCH] [v2] platform/x86: thinkpad_acpi: set
 keyboard language
Thread-Index: AQHW82F4bVoBHmH9+UefKZ+x1fJsB6o59nUAgAAbByA=
Date:   Tue, 26 Jan 2021 16:02:27 +0000
Message-ID: <SG2PR03MB27184A262460E827CB7975988CBC0@SG2PR03MB2718.apcprd03.prod.outlook.com>
References: <20210125025916.180831-1-nitjoshi@gmail.com>
 <CAHp75VddS69zFvfWem9ZkzAkTFG2yxPKzT7OpH1GAcNiqAZJkA@mail.gmail.com>
 <CAHp75VdHFRU=0=1SH1FDuatfdHzKJhB-qv7Y9EzsBTeRvjooyQ@mail.gmail.com>
In-Reply-To: <CAHp75VdHFRU=0=1SH1FDuatfdHzKJhB-qv7Y9EzsBTeRvjooyQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=lenovo.com;
x-originating-ip: [114.164.25.243]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 30509fcf-d1d6-48a0-9646-08d8c213c74b
x-ms-traffictypediagnostic: SG2PR03MB4582:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SG2PR03MB4582D5B8BBF62DE53586FC9E8CBC0@SG2PR03MB4582.apcprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WTdw9j9CdgGV6LNKYvy1vFh0ZZ055Vy9Py4PfKwFyWNkU2FXN9QW8ihHgh3VDeFhfd7mRczLInBr+Azszkd2tQNtABMg8IViUpGQOVt4I38H+DAfj17GCcFhO8jbZRgcu7HiSvnOAmdgMTqMI/VZXmREStK0Q15hCs+pIxNa0np8fp8xlRIbo4DfGY7ZqKmeb1M3UC55+i55BpRuTTMULwte+tHzJ+eST1CS+YRyJJny5gp5RPSqFDlMIfK6H+ZtPmy+c8QT9rSmvztFyATSdVru//UVSOExEtJ29wpjrYZtqM3ojv7GU8kiGhbbjg1vb7T+8HVS7ShMBK2kWGJEO9aQ4BkcmgXK3NLnZ5kuRGZaVCqRR/a+idZDGEHDqvdI9RmKogSgOpWN4pNG8Xtb1mhpJATg+9UwUavNUlZw6Ktmuq1FwzaEKerTcDT3lvgiZP8EKajN+ksEuYoly5Q6T7PS8/SagqPC2Vs60ayTN22HVqhIIeNG76wd2P3u5JUt11Ulktr7+AKBsxWNomJblA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR03MB2718.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(39860400002)(136003)(366004)(396003)(66446008)(5660300002)(83380400001)(66946007)(2906002)(86362001)(66476007)(71200400001)(478600001)(8676002)(4326008)(76116006)(66556008)(9686003)(52536014)(64756008)(55016002)(33656002)(6506007)(110136005)(316002)(8936002)(186003)(26005)(54906003)(53546011)(7696005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?cGJKaUNkbmRqREZqMHdvV09wbytBcTRaNW0yajBTcTZVWFA5ZnlIWlJEd3U5?=
 =?utf-8?B?U3hIZkFVK1VXWHBKdGZ1Qng1bkIxV3pIYzM1Q0tjKzhCWE8wTEZpZ0lENitZ?=
 =?utf-8?B?YkJhbk9OdjJTU3JPMlI5Q0RlaUdTMHNKVVlHMzRBdEt4R3RWbm9DY0lPcnMr?=
 =?utf-8?B?R2lwaVFDNER5WjNJdzZ4OVR5UFBiREJTSmJkenZ3a2t0TjRXTnlHd1J1K0lt?=
 =?utf-8?B?emhkaGFjbUFNcEhZeFZpeGNTNzVDVjY3R0xxZE1peXJxUlp0dFozMnVXeFBJ?=
 =?utf-8?B?dHJQc0gvZExya0hmaVZKcW9kU0dJOTVqQlE1Z01nUDBVU3hjb1NVbDZmaHVs?=
 =?utf-8?B?K1dHTDM1Q1V4NDFpckJhNENQRWdVV0pSQTJJNmJhSUZSUldUNDBxUmp1Szlp?=
 =?utf-8?B?ZTRjVW5NbmZKRHBaejF2YXpzK1BxQXk0c0pSMTMxWmVUYmdmTHZiWitTeFUx?=
 =?utf-8?B?dHpmMXBnaUF6R24wTDR3dUdISUIwYUpEWkF0azgya2x1NTlPWTQ1MGYxaU1Q?=
 =?utf-8?B?dEUxYkt6MEpuL3B3cXR6ZFNZc2pDVjkzMWRlMGppVCtQZmJxQ2UvdkJPQmUy?=
 =?utf-8?B?Z3JYOUlkbUIyUzFuSzl5QUdsL3FVNWZjYzVHaGhhdlMyS3hhQlJiRHdLTkdP?=
 =?utf-8?B?NitiWmExMkowMWlhUS9mTVBkcFd3NW5zV2EreVJiVlNTZDdYN0JzWXZXdzJ3?=
 =?utf-8?B?b0tQdjU1SEdJTlFuM29oL05RdytjMmprb3cyMjFYSU93Q2QwUWQvVXkxamw5?=
 =?utf-8?B?bzN4TU5BcXJxaDlTT0RXbVF4S3FCekZ5MGM2YWpUa1BrcUxvaXgvVk9maVpw?=
 =?utf-8?B?UlNzRVdzSkUxTW42MmtGcVpzRUoraUMrWkJ2Nnpjd3VGWllXK3VwTWRpaDdO?=
 =?utf-8?B?YVBjYjlkV2p1NzVSeWF1NWIzVzhLR3RtaWxHQWJQakYrb0xUYUVadmpHQzVP?=
 =?utf-8?B?OFZzVmg5Q0JhbWlQcDVSTU1oTWZHUUF5dGdZYnJPdWNCazVUeG12Z0JNSDR4?=
 =?utf-8?B?ZExlbklWRGUrK0t2cWhsOTI3aW1CQ1U1ZFJQR01rMXQrSlVpb1kzYzBYM1c0?=
 =?utf-8?B?Y2o1V09lTWFXYXF6azNoc0ZZVXAxQUtCOXRmR0s2blczcllDVE1LdDRIS01r?=
 =?utf-8?B?anFOTU9MYkFod2h4VDNhc1c2cm5KMlNsRGhjZFBYQnIxRXVwN2hHcU1sT1pY?=
 =?utf-8?B?bGJtb0NqMU0raUlDTmtlUnhFQU5IRXJoalBxTEtkMGcybW5QS2tCZVQvL1Ny?=
 =?utf-8?B?K1pSbEV2bDRvVVFTLzFWMHhZb0VudFEwaDkvcm85UXhVZi9jSWRRM3NPd3dq?=
 =?utf-8?B?YXArQmh3LzVhTzVXb2dzLzVGSW5xcVJtZ2ZvaVZ6dXYzTGJxOHZBNGJHNGZX?=
 =?utf-8?B?R2RDTFFXU1N4QjZEYUpKVlUrdW8wQ29WUFQ2a0x6T0lqcWY5K1JYaEtvTUlh?=
 =?utf-8?Q?GWZf+coh?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: lenovo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR03MB2718.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30509fcf-d1d6-48a0-9646-08d8c213c74b
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2021 16:02:27.4903
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3ziHQ4cXcVcgRJ47/Ts+zrFHNObf6NI0GWqkyESgX8dHwoSXiGCmq95iCNYukUuASBrZ84IpVKbgFaa93nq+hA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR03MB4582
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

SGVsbG8gQW5keSAsDQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IEFuZHkg
U2hldmNoZW5rbyA8YW5keS5zaGV2Y2hlbmtvQGdtYWlsLmNvbT4NCj5TZW50OiBUdWVzZGF5LCBK
YW51YXJ5IDI2LCAyMDIxIDExOjIyIFBNDQo+VG86IE5pdGluIEpvc2hpIDxuaXRqb3NoaUBnbWFp
bC5jb20+DQo+Q2M6IEhhbnMgZGUgR29lZGUgPGhkZWdvZWRlQHJlZGhhdC5jb20+OyBCZW5qYW1p
biBCZXJnDQo+PGJiZXJnQHJlZGhhdC5jb20+OyBwZXRlci5odXR0ZXJlckByZWRoYXQuY29tOyBU
b21va2kgTWFydWljaGkNCj48bWFydWljaGl0QGxlbm92by5jb20+OyBNYXJrIFBlYXJzb24gPG1w
ZWFyc29uQGxlbm92by5jb20+OyBQbGF0Zm9ybQ0KPkRyaXZlciA8cGxhdGZvcm0tZHJpdmVyLXg4
NkB2Z2VyLmtlcm5lbC5vcmc+OyBOaXRpbiBKb3NoaTENCj48bmpvc2hpMUBsZW5vdm8uY29tPg0K
PlN1YmplY3Q6IFtFeHRlcm5hbF0gUmU6IFtQQVRDSF0gW3YyXSBwbGF0Zm9ybS94ODY6IHRoaW5r
cGFkX2FjcGk6IHNldCBrZXlib2FyZA0KPmxhbmd1YWdlDQo+DQo+T24gTW9uLCBKYW4gMjUsIDIw
MjEgYXQgMTE6MzAgUE0gQW5keSBTaGV2Y2hlbmtvDQo+PGFuZHkuc2hldmNoZW5rb0BnbWFpbC5j
b20+IHdyb3RlOg0KPj4NCj4+IE9uIE1vbiwgSmFuIDI1LCAyMDIxIGF0IDU6MDMgQU0gTml0aW4g
Sm9zaGkgPG5pdGpvc2hpQGdtYWlsLmNvbT4gd3JvdGU6DQo+PiA+DQo+PiA+IEZyb206IE5pdGlu
IEpvc2hpIDxuam9zaGkxQGxlbm92by5jb20+DQo+DQo+PiBNYXliZSBpdCdzIGEgYml0IGxhdGUs
IGJ1dC4uLiBuZXZlcnRoZWxlc3MgbXkgY29tbWVudHMgYmVsb3cuDQo+DQo+Tml0aW4sIGlmIHlv
dSBhcmUgbm90IGdvaW5nIHRvIHN1Ym1pdCBhIHNlcmllcyBvZiBmaXggdXBzIGFzIHBlciBteSBj
b21tZW50cyBJDQo+d291bGQgcHJvYmFibHkgZG8gaXQgbXlzZWxmIGxhdGVyIG9uLiBKdXN0IHRl
bGwgd2hhdCB5b3Ugd2FudCBvbiB0aGlzIG1hdHRlciwNCg0KVGhhbmsgeW91IGZvciB5b3VyIGNv
bW1lbnRzIGFuZCBpdHMgaGVscGZ1bCBmb3IgbWUgYXMgSSBoYXZlIGp1c3Qgc3RhcnRlZCBwdXNo
aW5nIHBhdGNoIGZvciB1cHN0cmVhbS4NCkFwb2xvZ2l6ZSBmb3Igbm90IHJlcGx5aW5nIHRvZGF5
IG1vcm5pbmcgYXMgSSB3YW50ZWQgdG8gY2hlY2sgaXQgaW4gZGV0YWlsLg0KDQpJIGhhdmUganVz
dCByZXBsaWVkIG9uIHlvdXIgcmV2aWV3IGNvbW1lbnQgZS1tYWlsIGFuZCB3aWxsIGZvbGxvdy11
cCBvbiB0aGF0IGUtbWFpbCBjaGFpbi4uDQoNCj4NCj4tLQ0KPldpdGggQmVzdCBSZWdhcmRzLA0K
PkFuZHkgU2hldmNoZW5rbw0KDQpUaGFua3MgJiBSZWdhcmRzLA0KTml0aW4gSm9zaGkgDQo=
