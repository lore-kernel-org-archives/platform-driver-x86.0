Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D101C4332D
	for <platform-driver-x86@archiver.kernel.org>; Mon,  8 Feb 2021 14:17:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 416DA64E60
	for <platform-driver-x86@archiver.kernel.org>; Mon,  8 Feb 2021 14:17:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232504AbhBHORA (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 8 Feb 2021 09:17:00 -0500
Received: from mail-eopbgr1320133.outbound.protection.outlook.com ([40.107.132.133]:34456
        "EHLO APC01-PU1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232563AbhBHOPF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 8 Feb 2021 09:15:05 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cWHXHZrkjYUuwEwblhmlduV7/8S/KJ0oXyGhLPMhF1MnMlFGWWJbWmHog66cRVzDebozClAKSxNQwPDm6fiVayJ5n0/2zFnJtx2Bg6oHnJMEHL7y9XMp/I//mcKj++L2zpmCk4/MsL9t9fjMF/59Nh6xx0VgpHau+ODA2/F1muYIKoSdlOoN12Jye7Fdb5SAZeNOapFTh9I1wi0teAzFiJC32yyXi/jMtUiLJKHiwbUi+Yk+Splp93lIiod8+MBPQh9JsX0sDzJ94eb5SR5/5aE/tQP2iM7B3U98kuhCDyfQNwz7JVvSr3kR4HoLsxdHdAJqZ88T+k2J4cNBv8jFOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BCdXm6jrOzCwFgu+zG47RyJg5yab9WNty84JellPB4U=;
 b=RIurfs2anlkwxMU4KAgIq+zPzMQoYfB3PLGBkqtoLJ4wMyObK7YPvmXvpR1hsavBbUSPA2Ob8Gxm2iQTzYPQZAq1ZZ0KVxd0P5c28gp+ESdFxEndWKiUIfAWNa7u0/HHqVyErGlj48BGkHA0UO2hcOChbChSQGZpysrwKzh1OdGj/84bK1PqEwu3DEwN+jckP2hIbtF7wNdhds3JBkuG4AlPGsbWVFj/IHZRsEqT0g/XX+n4W/eb6mDBSCK7/VN6RYaKtK6XKkKIRnAgoCwB6saNR33SkvNn5B3IdT7lfanODhTDw8wL4OQCB7dS2Tk74naW/dD7g/IevUJqBJ3z8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lenovo.com; dmarc=pass action=none header.from=lenovo.com;
 dkim=pass header.d=lenovo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=LenovoBeijing.onmicrosoft.com; s=selector2-LenovoBeijing-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BCdXm6jrOzCwFgu+zG47RyJg5yab9WNty84JellPB4U=;
 b=q9Mh69kR+WTViTISw76sSd7XXNU0RDxQqLlPZsa0jmpg9wVDiLH9/PIzPdeOYUIu5oy+CplSz19FtUe8jidA4IgqtxBFgbrIKMAd5xrg5Xai+8/nMjtdEUnVT56OvmWIof8pmjD/us2eZC91N333JYrlPwlQx1GLnI6cc1grnFU=
Received: from (2603:1096:404:3f::21) by
 TY2PR03MB4013.apcprd03.prod.outlook.com (2603:1096:404:b3::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.11; Mon, 8 Feb 2021 14:12:39 +0000
Received: from TY2PR03MB3645.apcprd03.prod.outlook.com
 ([fe80::51c4:f02c:2dd9:a1c2]) by TY2PR03MB3645.apcprd03.prod.outlook.com
 ([fe80::51c4:f02c:2dd9:a1c2%7]) with mapi id 15.20.3846.025; Mon, 8 Feb 2021
 14:12:39 +0000
From:   Nitin Joshi1 <njoshi1@lenovo.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Alexander Kobel <a-kobel@a-kobel.de>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        Mark Pearson <mpearson@lenovo.com>
Subject: RE: [External] Re: [PATCH] platform/x86: thinkpad_acpi: handle HKEY
 0x4012, 0x4013 events
Thread-Topic: [External] Re: [PATCH] platform/x86: thinkpad_acpi: handle HKEY
 0x4012, 0x4013 events
Thread-Index: AQHW/fmKnsz0SIzMVkiGRYslxX/JvqpOSqIg
Date:   Mon, 8 Feb 2021 14:12:38 +0000
Message-ID: <TY2PR03MB3645AB67A376974400BFC49A8C8F9@TY2PR03MB3645.apcprd03.prod.outlook.com>
References: <53abdd94-8df4-cc1c-84e9-221face6b07c@a-kobel.de>
 <9d133a27-751a-a436-d255-3dd4a7d411d8@redhat.com>
 <TY2PR03MB3645D33506D85E1EECD6DABA8C8F9@TY2PR03MB3645.apcprd03.prod.outlook.com>
 <0e85bd26-bf2f-734c-1334-15ad591ec811@redhat.com>
In-Reply-To: <0e85bd26-bf2f-734c-1334-15ad591ec811@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=lenovo.com;
x-originating-ip: [114.164.25.243]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e4603a96-6981-42a2-95ad-08d8cc3b979e
x-ms-traffictypediagnostic: TY2PR03MB4013:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY2PR03MB40137AA0FDAD448C95B21DE28C8F9@TY2PR03MB4013.apcprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /bIHvMtFcPKDUB8vZmFxgoe/LCrJoiQMT8dC43S9ii5eRMLJ/qb5PQR3Aij2fFWXEsp3hZ/t7rcRIUQL+bsFKh8caFKiNrDh8QJpDcxCaK3PPOJklOtWKvym13L9aKxcwse0Q4qZMnoRExI7ZNmbkvCZgC19iNlz700Smw1W2e510NFxZSs6kLnZpaGp/rrAqKnLRz+6hQ/OnCobz26IPNZPu4j2i7hCB+rQ3nmXV+KM/hCTo9exJR9NSIEDC67bOJ5m355gtEXg4jcgS/iLK2/ZdqE3fHiWx5z982EbNKMfYpRiWh2hiAo2Xg3rBc6R3hWWVFAYZCqpuxX7CsE1Sox8M7EkPluSUosIHyysGaEhaHIHY6tPnGzCqink1v7LTBiZDJWkyjDz9IpkUMp/sMOefakqMEcQ61jxv3DTvb1QngdPIP75El8KfeTWhzEEZpztADQqCE9yS5cy+Q/01IyjaNgQuOCwOLZV19mvlb9ExY2Azx/fMBXqJ9lA+ed3iV/Eh/seFOFRChxx9vQ4VQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR03MB3645.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(136003)(39860400002)(376002)(346002)(83380400001)(26005)(52536014)(66946007)(64756008)(110136005)(66556008)(66476007)(66446008)(316002)(33656002)(76116006)(5660300002)(2906002)(186003)(71200400001)(8676002)(55016002)(9686003)(6636002)(86362001)(8936002)(53546011)(7696005)(478600001)(6506007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?eGNyczFtd012UGY2Z2Z3dVRqY0lSNGQxa1Z5b0ZIaTFsUFI2cUhoQXpzSVd1?=
 =?utf-8?B?NVd4T2JKR2JIU1pWN1RndXZZc2QxN0J0MVhmRXN2eENzUWhrVTlRajN1eGxY?=
 =?utf-8?B?cVRuWkN2Rk5QcUJ6WmlYT2xtZlR5aGEyWWx5c0pXVVZVdWI1U1NZR3pIVkpJ?=
 =?utf-8?B?NS9kMmwxWFBaeVRJT05UQ1hydVhsblV0SFFpRlA5Zk1wb3B2WDZpMkNML1Mw?=
 =?utf-8?B?SnhaM1hxajJNRGM2QUM3bC9RaXFaNlRiRlVEb3JKNHFYZ0FwYUZyQXBxUVBE?=
 =?utf-8?B?ZkI0TTUvSmtDYUVxeUxSRkJpQ3NzZU01UnFVMXArVVAybWZ6LytyNERBWU5I?=
 =?utf-8?B?Ulh2bS90K1FyL0puMEovdmsycmIvTnZKeGNSRGVrR2FsS2NtcWFPK1lvN1Vw?=
 =?utf-8?B?WkpsbldsMGdBemQybVFMSElzbW92RTJzcXU5aWpDYkg5ZzBtbmt3SkJlcGc5?=
 =?utf-8?B?UjRLSmk3VTNLWjJIUUh5NEkwbmZjZUlvT0VQSjZGeVNNa2pzNXJhZ2p5a3Z2?=
 =?utf-8?B?Z0J2MHpvdmhLazNqd2dxbFRrZmYxMWwwSUIvRnByWmRpWjdPRWFHeXA1YVlD?=
 =?utf-8?B?WE12b2I3Q3dTWE1zM2tMeW5LM2x0L0N3U1RxUERNVUpOaXlRbitVVTd2ejBJ?=
 =?utf-8?B?blRxUlJLUkVHWHZsaTdwWG5JM2VJU0tMSFAzbDNxbVdHOS93QWRvOVN5c1Qr?=
 =?utf-8?B?S0NpakVzZkIxcEFzSU5NZ3RoVFEydFNkSExVbDZraS9sdkxlZUFUVkFFaU91?=
 =?utf-8?B?cTNxa2xnemo2dTE1aEdVdlJMTk1MMEN2SVBtSUpGVWZWdUNBMHlzdUVHRVpR?=
 =?utf-8?B?N3ZMK2h0RnlzZVpnQ2Q4aHBZQWRseHp2UnRoR2gydmdiZldtaGNwNlhTVjY1?=
 =?utf-8?B?RytDVEdVWGNhTUN5dXJzMERZUU83Y1JpSGYrQWRBTm42ZUVmcmJmaW1uc2l4?=
 =?utf-8?B?UWRyQUdNRzhWRit0dy9aaVVhQVRXcXBVaUVuN3lCUjhMM2lKcXVVTVBEcXlT?=
 =?utf-8?B?d1VxTElWbktKaXRWRUwwNlZiUjZ6NWFtTVF2dzdBMUVzSEJuaWk3OWhYMjdT?=
 =?utf-8?B?SnFYOUpxcUFhbml4WjFaWHZRMHVxWGJHL210T1BTTXZBMFdtcTR2QndpUzJM?=
 =?utf-8?B?OERsVW4wMnFjTmcrOHhLVlBaV3JjMHRWdGREbkFsbVVROXFmMWhBUkx4SEx5?=
 =?utf-8?B?c2ErVTZsSGpLNGIrdWZWZVpzMFNzb3IvU2hBTWVmdnVlWkpqeUMzVzlPRmpE?=
 =?utf-8?B?bWd5c1ZXNUM3RjUzYW9YcFBqZisvaXJ6cVhEa2Y4N1lVMm5EczNsYTlRM1Y5?=
 =?utf-8?B?RTFkTUh0SC9lSkEzQlJYU3dQK09vUmY0aHB0QTZkWGhacHIzaEQ3NnFTRkE5?=
 =?utf-8?B?aTJJYXNTeTZ6ZEFjNEhtTlJXN3ZFQTY3SzloQUZqak5vdHJqN2YzNUF1WHR2?=
 =?utf-8?B?bnorMHRWNWRYUWxBNVlLUGpCVXphTzVNYkcvMWs4SzJxYVNVREcwUWViK2sz?=
 =?utf-8?B?UW9mcDAwNmpscjBwYmdPWnc3MCtBWCtwL2dFakNYRFJhUEpYQ3QvRmNQaGFq?=
 =?utf-8?B?dXBYek9Nc1RBMExiamxxdlFMemQ4L1o0SnEvNWhHeEtpd3VUVThsU0FBcGFX?=
 =?utf-8?B?elFGaDUzOHB6US9mMkRKNTlxdGNILzFvODB0ZkFDbzJhdXY5UFJaalB4MUEv?=
 =?utf-8?B?VlJRdkR5eEs0dUs0TGpJcU5PQlFtU0lzNVIzSHY3THlRbUk4YmZudnlraEJV?=
 =?utf-8?Q?RVWk6yLaTxGqshK7Te8rXI/zVUfLyGTCl1Dw9DC?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: lenovo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR03MB3645.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4603a96-6981-42a2-95ad-08d8cc3b979e
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2021 14:12:38.9935
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fJmW0C8DSQq2FeTgctN3HBtSN463AX8RFt/6sBgQc/y/gDi8MATps0jh3+0Otxe7aZYxR+1KCENnmpcDq6f5jA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR03MB4013
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

SGVsbG8gSGFucywNCg0KPi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogSGFucyBk
ZSBHb2VkZSA8aGRlZ29lZGVAcmVkaGF0LmNvbT4NCj5TZW50OiBNb25kYXksIEZlYnJ1YXJ5IDgs
IDIwMjEgNjowNSBQTQ0KPlRvOiBOaXRpbiBKb3NoaTEgPG5qb3NoaTFAbGVub3ZvLmNvbT47IEFs
ZXhhbmRlciBLb2JlbCA8YS1rb2JlbEBhLQ0KPmtvYmVsLmRlPjsgcGxhdGZvcm0tZHJpdmVyLXg4
NkB2Z2VyLmtlcm5lbC5vcmc7IE1hcmsgUGVhcnNvbg0KPjxtcGVhcnNvbkBsZW5vdm8uY29tPg0K
PlN1YmplY3Q6IFJlOiBbRXh0ZXJuYWxdIFJlOiBbUEFUQ0hdIHBsYXRmb3JtL3g4NjogdGhpbmtw
YWRfYWNwaTogaGFuZGxlIEhLRVkNCj4weDQwMTIsIDB4NDAxMyBldmVudHMNCj4NCj5IaSBOaXRp
biwgQWxleGFuZGVyLA0KPg0KPk9uIDIvOC8yMSA4OjE3IEFNLCBOaXRpbiBKb3NoaTEgd3JvdGU6
DQo+PiBIZWxsbyBIYW5zLA0KPj4NCj4+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPj4+
IEZyb206IEhhbnMgZGUgR29lZGUgPGhkZWdvZWRlQHJlZGhhdC5jb20+DQo+Pj4gU2VudDogTW9u
ZGF5LCBGZWJydWFyeSA4LCAyMDIxIDI6MTAgQU0NCj4+PiBUbzogQWxleGFuZGVyIEtvYmVsIDxh
LWtvYmVsQGEta29iZWwuZGU+OyBwbGF0Zm9ybS1kcml2ZXItDQo+Pj4geDg2QHZnZXIua2VybmVs
Lm9yZzsgTWFyayBQZWFyc29uIDxtcGVhcnNvbkBsZW5vdm8uY29tPjsgTml0aW4NCj5Kb3NoaTEN
Cj4+PiA8bmpvc2hpMUBsZW5vdm8uY29tPg0KPj4+IFN1YmplY3Q6IFtFeHRlcm5hbF0gUmU6IFtQ
QVRDSF0gcGxhdGZvcm0veDg2OiB0aGlua3BhZF9hY3BpOiBoYW5kbGUNCj4+PiBIS0VZIDB4NDAx
MiwgMHg0MDEzIGV2ZW50cw0KPj4+DQo+Pj4gSGksDQo+Pj4NCj4+PiBPbiAyLzcvMjEgNTozNCBQ
TSwgQWxleGFuZGVyIEtvYmVsIHdyb3RlOg0KPj4+PiBUaG9zZSBldmVudHMgb2NjdXIgd2hlbiBh
IGtleWJvYXJkIGNvdmVyIGlzIGF0dGFjaGVkIHRvIGEgVGhpbmtQYWQNCj4+Pj4gVGFibGV0IGRl
dmljZS4gIFR5cGljYWxseSwgdGhleSBhcmUgdXNlZCB0byBzd2l0Y2ggZnJvbSBub3JtYWwgdG8N
Cj4+Pj4gdGFibGV0IG1vZGUgaW4gdXNlcnNwYWNlOyBlLmcuLCB0byBvZmZlciB0b3VjaCBrZXli
b2FyZCBjaG9pY2VzIHdoZW4NCj4+Pj4gZm9jdXMgZ29lcyB0byBhIHRleHQgYm94IGFuZCBubyBr
ZXlib2FyZCBpcyBhdHRhY2hlZCwgb3IgdG8gZW5hYmxlDQo+Pj4+IGF1dG9yb3RhdGlvbiBvZiB0
aGUgZGlzcGxheSBhY2NvcmRpbmcgdG8gdGhlIGJ1aWx0aW4gb3JpZW50YXRpb24gc2Vuc29yLg0K
Pj4+DQo+Pj4gVGhhbmsgeW91IGZvciB5b3VyIHBhdGNoLg0KPj4+DQo+Pj4+IE5vIGF0dGVtcHQg
aXMgdGFrZW4gdG8gZW1pdCBhbiBFVl9TVyBldmVudCBmb3IgU1dfVEFCTEVUX01PREU7IHRoaXMN
Cj4+Pj4gaXMgbGVmdCB0byB1c2Vyc3BhY2UuDQo+Pj4NCj4+PiBJIGRvbid0IHVuZGVyc3RhbmQg
dGhpcyBwYXJ0LCBpbiBvcmRlciBmb3IgdXNlcnNwYWNlIHRvIHJlc3BvbmQgdG8NCj4+PiB0aGVz
ZSBldmVudHMgdGhlIHRoaW5rcGFkX2FjcGkgZHJpdmVyIG5lZWRzIHRvIGVtaXQgZXZlbnRzIGZv
ciB0aGlzOw0KPj4+IGFuZCBlbWl0dGluZyBTV19UQUJMRVRfTU9ERSBzZWVtcyBsaWtlIGl0IGlz
IHRoZSByaWdodCB0aGluZyB0byBkby4NCj4+Pg0KPj4+IFdoeSBhcmUgeW91IG5vdCBkb2luZyB0
aGlzID8NCj4+Pg0KPj4+IE5vdGUgdGhhdCBpdCBpcyBpbXBvcnRhbnQgdG8gb25seSBhZHZlcnRp
c2UgU1dfVEFCTEVUX01PREUNCj4+PiBmdW5jdGlvbmFsaXR5IG9uIGRldmljZXMgd2hlcmUgaXQg
YWN0dWFsbHkgd29ya3MuIFdoaWNoIG1pZ2h0IGJlDQo+Y2hhbGxlbmdpbmcgSSBndWVzcy4uLg0K
Pj4+DQo+Pj4gQnV0IHdlIGhhdmUgY29udGFjdHMgaW5zaWRlIExlbm92byBub3csIHNvIHBlcmhh
cHMgdGhleSBjYW4gaGVscC4NCj4+Pg0KPj4+IE1hcmssIE5pdGluLCBpcyB0aGVyZSBhIHdheSBm
b3IgdGhlIHRoaW5rcGFkX2FjcGkgY29kZSB0byBmaWd1cmUgb3V0DQo+Pj4gaWYgMHg0MDEyIC8N
Cj4+PiAweDQwMTMgZXZlbnRzIHdpbGwgYmUgc2VuZCBieSBhIGRldmljZT8NCj4+DQo+PiBJdCBz
ZWVtcyAsIHRoZXNlIGV2ZW50cyBhcmUgdXNlZCBmb3Igbm90IG9ubHkga2V5Ym9hcmQgY292ZXIs
IGJ1dCBhbHNvIG90aGVyDQo+dGFibGV0IG9wdGlvbnMuDQo+PiBJbiBhdHRhY2hlZCBkb2N1bWVu
dCwgSW50ZXJmYWNlIHR5cGUgNCAoR3JhZnQgdHlwZSkgaXMgb2YgVGhpbmtQYWQgWDEgVGFibGV0
DQo+U2VyaWVzLg0KPg0KPkdyZWF0LCBOaXRpbiB0aGFuayB5b3UgZm9yIHRoZSBkb2NzIQ0KPg0K
Pk5pdGluLCBvbmUgcXVlc3Rpb24gYmVsb3cgYWJvdXQgdmVyc2lvbiBjaGVja3MsIGl0IHdvdWxk
IGJlIGdyZWF0IGlmIHlvdSBjYW4NCj5oZWxwIHdpdGggdGhpcy4NCj4NCj4+PiBBbHNvIGlzIHRo
ZXJlIGEgd2F5IHRvIGdldCB0aGUgY3VycmVudCBzdGF0ZSBvZiB0aGUga2V5Ym9hcmQtY292ZXIN
Cj4+PiBiZWluZyBhdHRhY2hlZCBhdCBib290IG9yIG5vdCA/DQo+PiBJdCBzZWVtcyAiR1RPUCIg
QVNMIG1ldGhvZCBjYW4gYmUgdXNlZCB0byBnZXQgY3VycmVudCBzdGF0ZS4NCj4NCj5BY2suDQo+
DQo+QWxleGFuZGVyLCBzbyBpdCBsb29rcyBsaWtlIHdlIG5lZWQgdG8gZG8gdGhlIGZvbGxvd2lu
ZyB0byBzdXBwb3J0IHRoaXMNCj5wcm9wZXJseToNCj4NCj4xLiBBdCBhIG5ldyBUUF9IT1RLRVlf
VEFCTEVUX1VTRVNfR1RPUCB0byB0aGUgaG90a2V5X3RhYmxldCBlbnVtIDIuIEF0DQo+cHJvYmUg
dGltZSBpbiBob3RrZXlfaW5pdF90YWJsZXRfbW9kZSBhZGQgYSBuZXcgaWYgLyBjYXNlIHdpdGgg
SSBndWVzcw0KPiAgIHRoZSBoaWdoZXN0IHByaW8gKHNvIHRyeSBiZWZvcmUgR01NUykgd2hpY2gg
ZG9lczoNCj4gICAxLiBDYWxsIEdUT1Agd2l0aCBwYXJhbWV0ZXIgMHgwMDAwLCBjaGVjayByZXR1
cm4gZXF1YWxzIDB4MDEwMyAob3IgbmV3ZXI/KQ0KPiAgICAgIE5pdGluLCBob3cgc2hvdWxkIHRo
ZSB2ZXJzaW9uIGNoZWNrIGxvb2sgbGlrZSBoZXJlLCBjaGVjayB0aGF0IHRoZQ0KPiAgICAgIHVw
cGVyIGJ5dGUgPT0gMHgwMSBhbmQgdGhlIGxvd2VyIGJ5dGUgPj0gMHgwMyA/DQoNClRoYW5rcyBm
b3IgeW91ciBjb21tZW50cy4NCldlIHNob3VsZCBjaGVjayB2ZXJzaW9uIGJ5IGNoZWNraW5nIHJl
c3BvbnNlIGVxdWFsIG9yIGdyZWF0ZXIgdGhhbiAweDAxMDMgYW5kIG5vdCANCkJ5IGNoZWNraW5n
IHVwcGVyIGJ5dGUgYW5kIGxvd2VyIGJ5dGUuDQoNCj4gICAyLiBDYWxsIEdUT1Agd2l0aCBwYXJh
bWV0ZXIgMHgwMTAwLCBjaGVjayByZXR1cm4gdmFsdWUgZXF1YWxzIDQNCj4gICAzLiBDYWxsIEdU
T1Agd2l0aCBwYXJhbWV0ZXIgMHgwMjAwLCBzZXQgaW5fdGFibGV0X21vZGUgYmFzZWQgb24gYml0
IDANCj4gICAgICBhbmQgYml0IDE2LiBJIHRoaW5rIHdlIHNob3VsZCByZXBvcnQgU1dfVEFCTEVU
X01PREU9MSB3aGVuIHRoZSB0aGluLQ0KPmtiZA0KPiAgICAgIGlzIGF0dGFjaGVkLCBidXQgZm9s
ZGVkIHRvIHRoZSBiYWNrIDMuIE1ha2UgaG90a2V5X2dldF90YWJsZXRfbW9kZQ0KPnN1cHBvcnQg
dGhlIG5ldyBUUF9IT1RLRVlfVEFCTEVUX1VTRVNfR1RPUCBjYXNlIGFuZA0KPiAgIG1ha2UgaXQg
Y2FsbCBHVE9QIHdpdGggcGFyYW1ldGVyIDB4MDIwMCBhbmQgY2hlY2sgYml0IDAgKyBiaXQgMTYg
NC4gT24gdGhlDQo+ZXZlbnRzIHdoaWNoIHlvdSBpZGVudGlmaWVkIGNhbGwgdHBhY3BpX2lucHV0
X3NlbmRfdGFibGV0c3coKQ0KPg0KPkFuZCBjYW4geW91IGFsc28gY2hlY2sgaWYgdGhlcmUgYXJl
IGV2ZW50cyB3aGVuIGZvbGRpbmcgdGhlIGtiZCBiZWhpbmQgdGhlDQo+dGFibGV0Pw0KPg0KPlJl
Z2FyZHMsDQo+DQo+SGFucw0KDQpUaGFua3MgJiBSZWdhcmRzLA0KTml0aW4gSm9zaGkgDQo+DQo+
DQo+DQo+Pj4+IFNvIHRoaXMgcGF0Y2ggaXMgbWFpbmx5IHRvIGF2b2lkIHdhcm5pbmdzIGFib3V0
IHVua25vd24gYW5kDQo+Pj4+IHVuaGFuZGxlZCBldmVudHMsIHdoaWNoIGFyZSBub3cgcmVwb3J0
ZWQgYXM6DQo+Pj4+DQo+Pj4+ICogRXZlbnQgMHg0MDEyOiBhdHRhY2hlZCBrZXlib2FyZCBjb3Zl
cg0KPj4+PiAqIEV2ZW50IDB4NDAxMzogZGV0YWNoZWQga2V5Ym9hcmQgY292ZXINCj4+Pj4NCj4+
Pj4gVGVzdGVkIGFzIHdvcmtpbmcgb24gYSBUaGlua1BhZCBYMSBUYWJsZXQgR2VuIDIsIDIwSkNT
MDBDMDAsIGFuZCBhcw0KPj4+PiBub24taW50ZXJmZXJpbmcgd2l0aCBhIFRoaW5rUGFkIFgxIENh
cmJvbiA3dGgsIDIwUUVTQUJNMDIgKG5vcm1hbA0KPj4+PiBjbGFtc2hlbGwsIHNvIGl0IGRvZXMg
bm90IGhhdmUgYSBrZXlib2FyZCBjb3ZlcikuDQo+Pj4+DQo+Pj4+IFNpZ25lZC1vZmYtYnk6IEFs
ZXhhbmRlciBLb2JlbCA8YS1rb2JlbEBhLWtvYmVsLmRlPg0KPj4+PiAtLS0NCj4+Pj4gIGRyaXZl
cnMvcGxhdGZvcm0veDg2L3RoaW5rcGFkX2FjcGkuYyB8IDggKysrKysrKysNCj4+Pj4gIDEgZmls
ZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykNCj4+Pj4NCj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvcGxhdGZvcm0veDg2L3RoaW5rcGFkX2FjcGkuYw0KPj4+PiBiL2RyaXZlcnMvcGxhdGZvcm0v
eDg2L3RoaW5rcGFkX2FjcGkuYw0KPj4+PiBpbmRleCBjNDA0NzA2Mzc5ZDkuLmZkNTMyMmI1YmJi
ZCAxMDA2NDQNCj4+Pj4gLS0tIGEvZHJpdmVycy9wbGF0Zm9ybS94ODYvdGhpbmtwYWRfYWNwaS5j
DQo+Pj4+ICsrKyBiL2RyaXZlcnMvcGxhdGZvcm0veDg2L3RoaW5rcGFkX2FjcGkuYw0KPj4+PiBA
QCAtMTc0LDYgKzE3NCw4IEBAIGVudW0gdHBhY3BpX2hrZXlfZXZlbnRfdCB7DQo+Pj4+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgb3IgcG9ydCBy
ZXBsaWNhdG9yICovDQo+Pj4+ICAgICAgICAgVFBfSEtFWV9FVl9IT1RQTFVHX1VORE9DSyAgICAg
ICA9IDB4NDAxMSwgLyogdW5kb2NrZWQgZnJvbQ0KPj4+IGhvdHBsdWcNCj4+Pj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkb2NrIG9yIHBvcnQN
Cj4+Pj4gcmVwbGljYXRvciAqLw0KPj4+PiArICAgICAgIFRQX0hLRVlfRVZfS0JEX0NPVkVSX0FU
VEFDSCAgICAgPSAweDQwMTIsIC8qIGF0dGFjaGVkDQo+a2V5Ym9hcmQNCj4+PiBjb3ZlciAqLw0K
Pj4+PiArICAgICAgIFRQX0hLRVlfRVZfS0JEX0NPVkVSX0RFVEFDSCAgICAgPSAweDQwMTMsIC8q
IGRldGFjaGVkDQo+a2V5Ym9hcmQNCj4+PiBjb3ZlciAqLw0KPj4+Pg0KPj4+PiAgICAgICAgIC8q
IFVzZXItaW50ZXJmYWNlIGV2ZW50cyAqLw0KPj4+PiAgICAgICAgIFRQX0hLRVlfRVZfTElEX0NM
T1NFICAgICAgICAgICAgPSAweDUwMDEsIC8qIGxhcHRvcCBsaWQgY2xvc2VkICovDQo+Pj4+IEBA
IC0zOTg5LDYgKzM5OTEsMTIgQEAgc3RhdGljIGJvb2wgaG90a2V5X25vdGlmeV9kb2NrZXZlbnQo
Y29uc3QgdTMyDQo+Pj4gaGtleSwNCj4+Pj4gICAgICAgICBjYXNlIFRQX0hLRVlfRVZfSE9UUExV
R19VTkRPQ0s6IC8qIHVuZG9ja2VkIGZyb20gcG9ydA0KPj4+IHJlcGxpY2F0b3IgKi8NCj4+Pj4g
ICAgICAgICAgICAgICAgIHByX2luZm8oInVuZG9ja2VkIGZyb20gaG90cGx1ZyBwb3J0IHJlcGxp
Y2F0b3JcbiIpOw0KPj4+PiAgICAgICAgICAgICAgICAgcmV0dXJuIHRydWU7DQo+Pj4+ICsgICAg
ICAgY2FzZSBUUF9IS0VZX0VWX0tCRF9DT1ZFUl9BVFRBQ0g6DQo+Pj4+ICsgICAgICAgICAgICAg
ICBwcl9pbmZvKCJhdHRhY2hlZCBrZXlib2FyZCBjb3ZlclxuIik7DQo+Pj4+ICsgICAgICAgICAg
ICAgICByZXR1cm4gdHJ1ZTsNCj4+Pj4gKyAgICAgICBjYXNlIFRQX0hLRVlfRVZfS0JEX0NPVkVS
X0RFVEFDSDoNCj4+Pj4gKyAgICAgICAgICAgICAgIHByX2luZm8oImRldGFjaGVkIGtleWJvYXJk
IGNvdmVyXG4iKTsNCj4+Pj4gKyAgICAgICAgICAgICAgIHJldHVybiB0cnVlOw0KPj4+Pg0KPj4+
PiAgICAgICAgIGRlZmF1bHQ6DQo+Pj4+ICAgICAgICAgICAgICAgICByZXR1cm4gZmFsc2U7DQo+
Pj4+IC0tDQo+Pj4+IDIuMzAuMA0KPj4+Pg0KPj4NCg0K
