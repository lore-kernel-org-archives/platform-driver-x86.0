Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F9E3C47080
	for <platform-driver-x86@archiver.kernel.org>; Tue,  1 Jun 2021 14:47:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 21FDA61159
	for <platform-driver-x86@archiver.kernel.org>; Tue,  1 Jun 2021 14:47:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234221AbhFAOtI (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 1 Jun 2021 10:49:08 -0400
Received: from mail-co1nam11on2047.outbound.protection.outlook.com ([40.107.220.47]:65473
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233797AbhFAOtF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 1 Jun 2021 10:49:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F91+XXXKf/XOjGFPsCOpqWWzgFemNIyactHgcriOahCBGNp8L4/jcRKWXqNmG8qkYTPbEvb+lNMStfAKS86U/PYndcAhn1GOaW20SqjKN9IE4T32M9tUby5NHMpMysNPACs0xUu+LJ+6AsCqfaEUEfqRTRUm6KeeWrGNfPmIEy0dyqrKi2nPdDfPTZrOiNZZgM0JmKV85aF7ywQBixGXC0G/Z9lwDFuLt0eNhH2xGa8PrU1pGQKjy7HnROVduHvkwCWBY9fJENqbBbcerGfq5izObBgNwLtnXIKTAWWXgF7wru8txBr/g80HuMRjJCeu7Cy4EWkq1X5QN23leuMtBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QE/wu0ztRoBjRIV0v5aDAePuKEn5s/qq00lZD8tczf0=;
 b=ltIY2fnUOYcVmGtzgaweoW8YySvI8L/kqpve13UYWryDCDclMfe9slmgAjuKEtZaaR9EnXJUAheH8/RdspmxNsyl4ahbp3RFeedlDK8C5ktiDZGYtboOv2aivJr0yTy+rJgQw/TZK6E1IhnV7RBS0ptTb4wCgnqNY0UJhDzDQU4iHR9KcYc1fSLcDXdafujzsrp6j55fIW0BT37ZxErimiWivn9BWQxFmtS7nRKbXA+EU0kxiSXHWFF6DSaPBt2EQqJ0vNfnYZICFyygwnkngoI9QfV8l78celKyNnJuYsrPU6lIoTVOWl0DfYsBW5Jqg7GxbhOh2TTmjCq9qzhoVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QE/wu0ztRoBjRIV0v5aDAePuKEn5s/qq00lZD8tczf0=;
 b=PdPOwLvzSD4rl4C3HB4v85yObjfmgnxoUopdKbez5Aq3yDDg41FbAVHnqYpalHG0B1E2wSqlZMV8wksQqOypwWICSPiEIJpFV5129fpcWjVTurYmFc3va7+8EjNSh5sHncoZ0QxI/LAbeuq6h3CuQKZVSAEmjhJtiNCpGTT56h6YCUvVfa2sCG4u7P5p3lWef+Y9dsQ5tHRnI4HIT+iH0zUT47LvRZ8aV8Ob/qc8ej0pN1FicHDwNoXTUZekAKmCuhIcJ3IqT//KIa8OhwjeR4RoHQDyJEMWHwdxGNmU4EDtHv6BHwm2Guu8R0d5aVp+5SMK5LMX+kV8TxDddPcSkw==
Received: from DM6PR12MB4155.namprd12.prod.outlook.com (2603:10b6:5:221::15)
 by DM5PR12MB2358.namprd12.prod.outlook.com (2603:10b6:4:b3::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.22; Tue, 1 Jun
 2021 14:47:23 +0000
Received: from DM6PR12MB4155.namprd12.prod.outlook.com
 ([fe80::4905:2e9c:8541:448e]) by DM6PR12MB4155.namprd12.prod.outlook.com
 ([fe80::4905:2e9c:8541:448e%9]) with mapi id 15.20.4173.030; Tue, 1 Jun 2021
 14:47:23 +0000
From:   Mykola Kostenok <c_mykolak@nvidia.com>
To:     Hans de Goede <hdegoede@redhat.com>
CC:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: RE: [PATCH platform] platform/mellanox: mlxreg-hotplug: remove
 IRQF_NO_AUTOEN flag from request_irq
Thread-Topic: [PATCH platform] platform/mellanox: mlxreg-hotplug: remove
 IRQF_NO_AUTOEN flag from request_irq
Thread-Index: AQHXVthqjXfGLeuu5EOrUdDiuHnTYqr/EE4AgAArPKA=
Date:   Tue, 1 Jun 2021 14:47:23 +0000
Message-ID: <DM6PR12MB4155CB9B89EE94338D2BFC8BE23E9@DM6PR12MB4155.namprd12.prod.outlook.com>
References: <20210601111744.2247071-1-c_mykolak@nvidia.com>
 <3986919a-45b0-7cde-acbe-26877c7525ab@redhat.com>
In-Reply-To: <3986919a-45b0-7cde-acbe-26877c7525ab@redhat.com>
Accept-Language: ru-RU, en-US
Content-Language: ru-RU
X-Mentions: vadimp@nvidia.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nvidia.com;
x-originating-ip: [188.115.152.209]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3a9380fa-de4b-49bc-163b-08d9250c2a84
x-ms-traffictypediagnostic: DM5PR12MB2358:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB23584CB09C35D39D8C308C83E23E9@DM5PR12MB2358.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: D+DokzvltaGiNCKQVmeJ0dmB53hm8ETvY1e9B93zOFPTkP0Fr9gkGEdNI8Qk9DOtR9vjqgTOOReOheWizgRsa+qjfowGlSMht54rYeFHY3be9drLBdIlwC+ifVJO/ZX5IPQeE46Ke9Ir25mf7txbCW55Z71p2TDijKtuyywtdkOft6jTIrPtNS4tFZ32fEDEWowpmYzhJnCgzJ3wCcRPQOVKl3Mc3kLC1BzNweVcm+Zs0Y+EmlnsE9LGNl/43SsCZjWymJOQ9nvrcfP9b1YGZksOdniTP5exKoTGzogx8/rLsta9XWdQoftsppf+e1359v9JTtEX7HobocNs+FTGzJVPSe1OQsVpqnQ8ug17esykuDEufHI/ZvJ1VEm9luTRNHm02ouZfrWhRORlPOEoZ9L8FWN0eXLYOqpWnzTyaObQprh7Xp/ersKOGgz641pxKLbKT93UfV5JUyLErGfkvyo5Qi0Xg0rPnWI346zU4rsT3NekMPX6lPc8XeB6eSwkp/KqHjvxfHWNsK5CWDpjkSg0HUSFo+XCNAXVzuaG+pkNoZh8OdyRKkI799QNJgTjlsoH3ex67BrE0sYQQ7GotAbUXmbaXi1ETQBWKnnLflQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4155.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(396003)(366004)(136003)(376002)(54906003)(55016002)(7696005)(2906002)(86362001)(38100700002)(186003)(83380400001)(26005)(66446008)(9686003)(66476007)(53546011)(8676002)(6506007)(66556008)(5660300002)(64756008)(122000001)(316002)(66946007)(6916009)(33656002)(52536014)(71200400001)(107886003)(76116006)(478600001)(55236004)(8936002)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?c21tNFcvVk1sOXNGanVXNWVPenk2RFp5dk8wa2FQcnF3VTFFa2t1anZadW00?=
 =?utf-8?B?dDJ3MW5kckgzOWlNRU1PZmFmTFE2UU1Ba0lZcHltWVl3VDdVMDVjRVorVzFv?=
 =?utf-8?B?Q2ZyR0VkVklIcEdxTVhwZ28raW12OGNHbFlZdFo2QlcxZG9JenZFUi90ajMw?=
 =?utf-8?B?M004OGxJa2JFRWJMK0tOMkNzV3dxNEJuNEdnVDFLRC9IcjhIRWs3UFJzWEd5?=
 =?utf-8?B?Y1VVTmdYZVV1dlBmdUl4bTF0eG4ydi9TNFhWRGllSnBFQzd1WjdCMndtckdO?=
 =?utf-8?B?Q3F0R0tiMkxzcXNha2VIUDVWUmVjWWdtNDY3eVlrQzNjRWk2MWdCU3E5UUNv?=
 =?utf-8?B?b3ZER0ZwQkxuVjVuZzNSVWxTQlM4cms2bER4R2ZzL2RNc0dSMmlUVVRqM3Zr?=
 =?utf-8?B?d0ZHcW1YYXg0NUpnRVl4MXNoV2xFWG12UTlGZHpsdHB6Ty9FWWlUTkJPbzRs?=
 =?utf-8?B?VEh2amVtMjVwcDRCbDhkUkdWSmJnRCtWakM3Ulhpd0JkU3VXYWMxSk91Q2k5?=
 =?utf-8?B?T1QxZWhsbjVlYXR0TXlvcWl4V2Ria2YxRW5Icms1M2NIVCtWVmkyQUlBYlhv?=
 =?utf-8?B?cXh3Wnk3NmtRNXhXWXNXS09vTmQ0QTFkUEFtajVnZEd0RURlYXI5MzAwSWNr?=
 =?utf-8?B?UjRZT25xaU9vVkZCYU1VZXgvLzlQcEQ4SDkybXpEMXFteVVSazRzMFIvNnpm?=
 =?utf-8?B?dUx0NkFrS093aEpxa1hHaEdrS29XSUFHa0d3VFFBSkZzSmtYVE1ISE83RkRV?=
 =?utf-8?B?MmE3K05GK2dvaDFrN0ptcGZkR1NYN0VqWDllMldIbDlTTEtiMlVINjlUejFz?=
 =?utf-8?B?UFB0cjBjQ3FHNkkyd2ZCWmszQXd5YjljcWQ4bEZVYUVOaDVxdnNRTUZaYzJT?=
 =?utf-8?B?MVc1Tm5BVW5pSzVDSFh1YVpDQ0cySHlaeFJLQVNFd0pRNS81cHhxTXBpK1VK?=
 =?utf-8?B?QUhZdk9HTVRia090ZXNPZ2ZOYllLazVoakJZRVh0T0Zud1lrMmVZTEpGbk1n?=
 =?utf-8?B?OTJXU0tQUW81SXJzTXpsdEdKN3VEdnlkTFNpQTdGN1RsazdnT2VpRTd6T0Yv?=
 =?utf-8?B?QmIvNnNzUm5KdG5OaEVRSVI3QUhxVXRiaWhHa1owYmZxUFJUR3M1WVFOQ0lz?=
 =?utf-8?B?dFRLRERzS1MrRkt1RzdySWswZkVnbVJOQU1rTC9oNzdNUzRSdVRCL1NxTDFG?=
 =?utf-8?B?ZzVMeENScndHOTVnRG9rZk9INDIvbGZubCt0c015eHZqQ2hpMjg2QTVicW5R?=
 =?utf-8?B?U1BBblM3OFpmWnh0cUQxNUEwdEZFTWNkamJzY1NGdGxPZ0dOMU5kTmJVeVdY?=
 =?utf-8?B?ZHdEMzk2SEdNZEV0VkczQXRzMFhxL01kUXdSZ1NQWUdrNU1VUmlSMDlzSjdE?=
 =?utf-8?B?VVN1MGdWaEdzSitnQUgvWlBib2JKeURBaXl4MGRaVGJhcGhLT01YeFducjIw?=
 =?utf-8?B?SUJRaGprSUdtMmVGM3d1TkJVZExKeTNrMVFuQ3ptcjRreXFRcVNxRTZjeVhF?=
 =?utf-8?B?MitJY2xvOU9FZUlrSVdSZCtIUktwMWF6a1JmWGZVMGs1OVJjMGpTYUtLcFpV?=
 =?utf-8?B?ZmNrcEJ5WXZnQk81Sk1QS3Jad1VtbUdjeDZlcTcxT1FtVkVxZEt6NEhuTnVm?=
 =?utf-8?B?eVhtMnNscFVLMDFGYzltZFpSaXBwNGxLa3RUckFCalFWKytjcUp3eTlRanR1?=
 =?utf-8?B?U0RCTTkwRkFuaytpdmRRTVZJTExYOEt6QUtjR25ZaXd4Ry9EdmNQMU4rNDZ5?=
 =?utf-8?Q?yJ6DKRlU16rqbmmNwOPWSP2vPK7Z9eG54IoCpX9?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4155.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a9380fa-de4b-49bc-163b-08d9250c2a84
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2021 14:47:23.1476
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3WVe9C5MXV2GR8Snm4s5axjPtGA4Mb7NlbxU1Xp1MKhWflEdaQ2WYGrXzLwzIlRDqZe4dalCZdxAAQPyRne75Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2358
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

SGksDQpXZSBtdXN0IGhhdmUgSVJRRl9TSEFSRUQgZmxhZy4gVGhpcyBpcyBmb3Igc3lzdGVtIGlu
dGVycnVwdHMgKEZBTiwgUFMsIGNhYmxlIHBvd2VyLCBBU0lDIGhlYWx0aCkgYW5kIG5vdyBpdCdz
IHVzZWQgZm9yIG5ldyBsaW5lIGNhcmQgZHJpdmVyLCB3aGljaCBzaG91bGQgYmUgcmVsZWFzZWQg
c29vbiAodGhpcyBpcyBmb3IgbmV3IG1vZHVsYXIgc3lzdGVtKS4NCkFjdHVhbGx5ICJtbHhyZWct
aG90cGx1ZyIgZHJpdmVyIGlzIHJlc3BvbnNpYmxlIHRvIGluc3RhbnRpYXRlIGFueSBvdGhlciBk
cml2ZXIsIHdoaWNoIFdpbGwgc2hhcmUgdGhpcyBJUlEgbGluZS4NClNvLCBhdCB0aGUgbW9tZW50
ICJtbHhyZWctaG90cGx1ZyIgaXMgcHJvYmVkLCBubyBvdGhlciB1c2VycyBzaGFyZWQgdGhpcyBs
aW5lIGFyZSBleGlzdC4NCg0KSXQgbWVhbnMgdGhhdCAiIGRpc2FibGVfaXJxKHByaXYtPmlycSk7
IiBpbiB0aGlzIGRyaXZlciB3aWxsIG5vdCBpbXBhY3QgYW55b25lIHdobyBpcyBzdXBwb3NlZCB0
byB1c2UgdGhpcyBJUlEgbGluZS4gDQoNCkl0IHdhcyBpbml0aWFsIGludGVuc2lvbiB0byByZXZl
cnQgY29tbWl0LCBhZGRlZCBJUlFGX05PX0FVVE9FTiBmbGFnLg0KSG93ZXZlciwgaXQgc2VlbXMg
c2FmZSByZW1vdmUgImRpc2FibGVfaXJxKHByaXYtPmlycSk7IiBsaW5lLg0KDQpCdXQgbWF5YmUg
aXQgbW9yZSBsb2dpY2FsIHRvIGp1c3QgbW92ZSBkaXNhYmxlX2lycSgpIHRvIG1seHJlZ19ob3Rw
bHVnX3NldF9pcnEoKS4NClVudGlsIG1seHJlZ19ob3RwbHVnX3NldF9pcnEoKSBkb2Vzbid0IG9w
ZW4gdG9wIGFnZ3JlZ2F0aW9uIG1hc2ssIGludGVycnVwdHMgY2FuIG5vdCBnZXQgdG8gQ1BVLg0K
U28sIG1heWJlIEkgbW9kaWZ5IHBhdGNoIGluIHRoaXMgd2F5Lg0KDQpCZXN0IHJlZ2FyZHMsIE15
a29sYSBLb3N0ZW5vaw0KDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTog
SGFucyBkZSBHb2VkZSA8aGRlZ29lZGVAcmVkaGF0LmNvbT4NCj4gU2VudDogVHVlc2RheSwgSnVu
ZSAxLCAyMDIxIDM6MTAgUE0NCj4gVG86IE15a29sYSBLb3N0ZW5vayA8Y19teWtvbGFrQG52aWRp
YS5jb20+DQo+IENjOiBwbGF0Zm9ybS1kcml2ZXIteDg2QHZnZXIua2VybmVsLm9yZw0KPiBTdWJq
ZWN0OiBSZTogW1BBVENIIHBsYXRmb3JtXSBwbGF0Zm9ybS9tZWxsYW5veDogbWx4cmVnLWhvdHBs
dWc6IHJlbW92ZQ0KPiBJUlFGX05PX0FVVE9FTiBmbGFnIGZyb20gcmVxdWVzdF9pcnENCj4gDQo+
IEhpLA0KPiANCj4gT24gNi8xLzIxIDE6MTcgUE0sIE15a29sYSBLb3N0ZW5vayB3cm90ZToNCj4g
PiBUaGlzIGZsYWcgY2F1c2VzIG1seHJlZy1ob3RwbHVnIHByb2JpbmcgZmFpbHVyZSBhZnRlciBm
bGFnDQo+ICJJUlFGX05PX0FVVE9FTiINCj4gPiBoYXMgYmVlbiBhZGRlZCB0bzoNCj4gPiAJZXJy
ID0gZGV2bV9yZXF1ZXN0X2lycSgmcGRldi0+ZGV2LCBwcml2LT5pcnEsDQo+ID4gCQkJICAgICAg
IG1seHJlZ19ob3RwbHVnX2lycV9oYW5kbGVyLA0KPiBJUlFGX1RSSUdHRVJfRkFMTElORw0KPiA+
IAkJCSAgICAgICB8IElSUUZfU0hBUkVEIHwgSVJRRl9OT19BVVRPRU4sDQo+ID4gCQkJICAgICAg
ICJtbHhyZWctaG90cGx1ZyIsIHByaXYpOw0KPiANCj4gDQo+IFJpZ2h0LCBidXQgaWYgeW91IGxv
b2sgYXQgY29tbWl0IGJlZTNlY2ZlZDBmYzkgKCJwbGF0Zm9ybS9tZWxsYW5veDogbWx4cmVnLQ0K
PiBob3RwbHVnOg0KPiBtb3ZlIHRvIHVzZSByZXF1ZXN0X2lycSBieSBJUlFGX05PX0FVVE9FTiBm
bGFnIikgdGhlbiB0aGF0IGFsc28gcmVtb3Zlcw0KPiBhDQo+IA0KPiBkaXNhYmxlX2lycShwcml2
LT5pcnEpOw0KPiANCj4gSW1tZWRpYXRlbHkgYWZ0ZXIgdGhpcyBjYWxsLCBpZiB0aGUgSVJRRl9O
T19BVVRPRU4gZmxhZyBpcyBnb2luZyB0byBiZQ0KPiBkcm9wcGVkIHRoZW4gdGhhdCBjYWxsIHNo
b3VsZCBiZSByZS1hZGRlZC4gSW4gY2FzZXMgbGlrZSB0aGlzIGl0IGlzIHVzdWFsbHkNCj4gYmV0
dGVyIHRvIGp1c3QgZG8gYSBnaXQgcmV2ZXJ0IG9mIHRoZSBvZmZlbmRpbmcgcGF0Y2gsIHRoYXQg
d291bGQgaGF2ZSBhbHNvIHJlLQ0KPiBhZGRlZCB0aGUgZGlzYWJsZV9pcnEoKSBjYWxsLiBBbHNv
IHNlZSBiZWxvdy4NCj4gDQo+ID4gVGhpcyBpcyBiZWNhdXNlIHJlcXVlc3RfdGhyZWFkZWRfaXJx
KCkgcmV0dXJucyBFSU5WQUwgZHVlIHRvIHRydWUNCj4gPiB2YWx1ZSBvZg0KPiA+IGNvbmRpdGlv
bjoNCj4gPiAoKGlycWZsYWdzICYgSVJRRl9TSEFSRUQpICYmIChpcnFmbGFncyAmIElSUUZfTk9f
QVVUT0VOKSkNCj4gDQo+IElzIHRoZSBJUlFGX1NIQVJFRCBmbGFnIHJlYWxseSBuZWNlc3Nhcnkg
dGhvdWdoID8gSU9XIGlzIHRoZSBJUlEgYWN0dWFsbHkNCj4gc2hhcmVkPyAgSWYgaXQgaXMgcmVh
bGx5IHNoYXJlZCB0aGVuIHRoZSBkaXNhYmxlX2lycSgpIGNhbGwgd2lsbCBhbHNvIGJsb2NrIHRo
ZSBpcnENCj4gZm9yIG90aGVyIHVzZXJzIG9mIHRoZSBpcnEuIERyaXZlcnMgd2hpY2ggYXJlIHBy
b3Blcmx5IGNvZGVkIHRvIHNoYXJlDQo+IGludGVycnVwdHMgc2hvdWxkIHRodXMgYXZvaWQgdXNp
bmcgZGlzYWJsZV9pcnEoKS4gIEJ1dCBvZnRlbiB0aGUgSVJRRl9TSEFSRUQNCj4gZmxhZyBoYXMg
anVzdCBiZWVuIGNvcGllZCBmcm9tIG90aGVyIGNvZGUgd2l0aG91dCB0aGUgSVJRIGFjdHVhbGx5
IGJlaW5nDQo+IHNoYXJlZC4NCj4gDQo+IFBsZWFzZSBjaGVjayBpZiB0aGUgSVJRRl9TSEFSRUQg
ZmxhZyBpcyByZWFsbHkgbmVjZXNzYXJ5IGFuZCBpZiBpdCBpcyBub3QNCj4gbmVjZXNzYXJ5LCBw
bGVhc2UgZHJvcCB0aGF0IGluc3RlYWQuDQo+IA0KPiBSZWdhcmRzLA0KPiANCj4gSGFucw0KPiAN
Cj4gDQo+IA0KPiANCj4gPiBGaXhlczogYmVlM2VjZmVkMGZjOSAoInBsYXRmb3JtL21lbGxhbm94
OiBtbHhyZWctaG90cGx1ZzogbW92ZSB0byB1c2UNCj4gPiByZXF1ZXN0X2lycSBieSBJUlFGX05P
X0FVVE9FTiBmbGFnIikNCj4gPiBTaWduZWQtb2ZmLWJ5OiBNeWtvbGEgS29zdGVub2sgPGNfbXlr
b2xha0BudmlkaWEuY29tPg0KPiA+IFJldmlld2VkLWJ5OiBWYWRpbSBQYXN0ZXJuYWsgPHZhZGlt
cEBudmlkaWEuY29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL3BsYXRmb3JtL21lbGxhbm94L21s
eHJlZy1ob3RwbHVnLmMgfCAzICstLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDIgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9wbGF0Zm9y
bS9tZWxsYW5veC9tbHhyZWctaG90cGx1Zy5jDQo+ID4gYi9kcml2ZXJzL3BsYXRmb3JtL21lbGxh
bm94L21seHJlZy1ob3RwbHVnLmMNCj4gPiBpbmRleCBhOWRiMmYzMjY1OGYuLjA3NzA2ZjBhNmQ3
NyAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL3BsYXRmb3JtL21lbGxhbm94L21seHJlZy1ob3Rw
bHVnLmMNCj4gPiArKysgYi9kcml2ZXJzL3BsYXRmb3JtL21lbGxhbm94L21seHJlZy1ob3RwbHVn
LmMNCj4gPiBAQCAtNjgzLDggKzY4Myw3IEBAIHN0YXRpYyBpbnQgbWx4cmVnX2hvdHBsdWdfcHJv
YmUoc3RydWN0DQo+ID4gcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiA+DQo+ID4gIAllcnIgPSBk
ZXZtX3JlcXVlc3RfaXJxKCZwZGV2LT5kZXYsIHByaXYtPmlycSwNCj4gPiAgCQkJICAgICAgIG1s
eHJlZ19ob3RwbHVnX2lycV9oYW5kbGVyLA0KPiBJUlFGX1RSSUdHRVJfRkFMTElORw0KPiA+IC0J
CQkgICAgICAgfCBJUlFGX1NIQVJFRCB8IElSUUZfTk9fQVVUT0VOLA0KPiA+IC0JCQkgICAgICAg
Im1seHJlZy1ob3RwbHVnIiwgcHJpdik7DQo+ID4gKwkJCSAgICAgICB8IElSUUZfU0hBUkVELCAi
bWx4cmVnLWhvdHBsdWciLCBwcml2KTsNCj4gPiAgCWlmIChlcnIpIHsNCj4gPiAgCQlkZXZfZXJy
KCZwZGV2LT5kZXYsICJGYWlsZWQgdG8gcmVxdWVzdCBpcnE6ICVkXG4iLCBlcnIpOw0KPiA+ICAJ
CXJldHVybiBlcnI7DQo+ID4NCg0K
