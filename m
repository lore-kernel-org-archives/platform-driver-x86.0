Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 361DEC433E0
	for <platform-driver-x86@archiver.kernel.org>; Mon, 15 Feb 2021 15:03:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DF55864D9F
	for <platform-driver-x86@archiver.kernel.org>; Mon, 15 Feb 2021 15:03:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230170AbhBOPDL (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 15 Feb 2021 10:03:11 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:10785 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230310AbhBOPCP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 15 Feb 2021 10:02:15 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B602a8ccd0000>; Mon, 15 Feb 2021 07:01:33 -0800
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 15 Feb
 2021 15:01:33 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by HQMAIL111.nvidia.com (172.20.187.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2 via Frontend Transport; Mon, 15 Feb 2021 15:01:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dtLOzgRf5suEbCWsTX+l/4Lafk6jyEr3k82tqy8cri0KCavYlp1wXPt3++Fs6rEi5b0ofHI2t02qIa1I9qQDbwqzxI6K8VL+6zECIzyvwImRXHFo1QjIq+SL28uCT/0Y6xA1qrUUF5tMfGRDJSuO7UCdOftTBrhYL1icyHKOxAqBvAudq5X+Jw7o2SpGi35NTVBHABSa6NKohHq6CdmKBYHmmd6oQDoELL2dRBz6yRYHE0siWMt1lqTQ5/ny+NU1ujn1pHW9mD7mmuRgoXKS8uV4mCYFjeRppsjdjHJr8wn8IcX5sEWqKaQWGhRgpEKgeShpGKAPq/VODqGVgRcmjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PIbtolS7uXAoUw6z8E8AVXsvvKktePPHLW6vgqSCnrc=;
 b=NaCuX3qejdWW71LvBvWOUnZLkVnE03h8YbyQ2/kX5nNA2L/4f0S2sIZR4s86BI60xdb6NUROsoVIEX5apvuK1qdaWqdgc+Fpckh872G58UKKSg/VqzVvR20zRnHo/NlwEGuANrNXejHAHaVWK7Q+b//J4rjAbEVooTUCcx6N3NKWajPWv0nSY1xU2sZm+i4wZcQMFLEAjh7O4paaaRZElmLcq4To1FvekICtCHw85/1f8IbQ4P48gZonW8YVNEiwK+mTiWYALi7WXQC/OYdATXx2Z6t5CUYTtnaMY6sA1vvX8w53L+6qvi4ilNKQTMiPp3JEqStigtkkIQ7bncmipw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from DM6PR12MB3898.namprd12.prod.outlook.com (2603:10b6:5:1c6::18)
 by DM5PR12MB1177.namprd12.prod.outlook.com (2603:10b6:3:6d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25; Mon, 15 Feb
 2021 15:01:31 +0000
Received: from DM6PR12MB3898.namprd12.prod.outlook.com
 ([fe80::7c6c:69b0:b754:6963]) by DM6PR12MB3898.namprd12.prod.outlook.com
 ([fe80::7c6c:69b0:b754:6963%6]) with mapi id 15.20.3846.038; Mon, 15 Feb 2021
 15:01:31 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        "andy@infradead.org" <andy@infradead.org>
CC:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Subject: RE: [PATCH RFC platform-next 0/8] platform: mellanox: Introduce
 initial chassis management support for modular Ethernet system
Thread-Topic: [PATCH RFC platform-next 0/8] platform: mellanox: Introduce
 initial chassis management support for modular Ethernet system
Thread-Index: AQHW+lMm8ed07yXLYE+V3TUAOP5u+KpZXGiAgAABesA=
Date:   Mon, 15 Feb 2021 15:01:31 +0000
Message-ID: <DM6PR12MB3898CB505B0FCDA1F56AD028AF889@DM6PR12MB3898.namprd12.prod.outlook.com>
References: <20210203173622.5845-1-vadimp@nvidia.com>
 <ed879d55-f034-04d4-7b6f-0a39da532381@redhat.com>
In-Reply-To: <ed879d55-f034-04d4-7b6f-0a39da532381@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nvidia.com;
x-originating-ip: [46.116.167.119]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2b9ba0c2-2713-4d05-bf68-08d8d1c29491
x-ms-traffictypediagnostic: DM5PR12MB1177:
x-microsoft-antispam-prvs: <DM5PR12MB117751FFB39BA01F089B3683AF889@DM5PR12MB1177.namprd12.prod.outlook.com>
x-header: ProcessedBy-CMR-outbound
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: F/K8k+QPlT4c++EE5/UtsgxUmTBr2/20Nd3zheiBI+1R/IwTR4lEYrSS9TUgP7r9hiE4DK7kgMy6x0S50W888rQkSHjA6XhS8orVRHJV01HU1Ea3YX4jBmhEMb2vANamlhdcgVLekNyptsJ/8rh1C+3X5r1s6zCGR1KlRITQfb4bz+LMj+9yOcUVJTNfLS11sPArJEUMqILZligxNlcbrJWVRIv12P0twCjFxhe2/mW0FNrZkdIqyKveFWvgeu1WqxC+6kTjtgFbRArSnXFdAfC9vAdX4NiyARSAkPmORlo20N0wrNKKAhyh70WOkPehjxKC9w4zZBc2VXPo4zq7fe6G/3qz+wlQOaqWOMvNYShU4fGN3nuUq8hySsVzmCyqqamDSxrNc1ur/gUh4120nM4iXPOb44ghxN1t4NbKaqm1U5FdH9CL6HwWegX9vxiwiWxTKoja5w53KmQluE5JXXSkCCzucxRX/q92X0jvP5hNE/kNEuWts5uTJ1emUi4wD8b409V12kTd6ey/Rg5NZA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB3898.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(346002)(376002)(396003)(39860400002)(66946007)(4326008)(8676002)(52536014)(76116006)(5660300002)(6506007)(55016002)(66556008)(66446008)(66476007)(64756008)(53546011)(83380400001)(9686003)(316002)(33656002)(2906002)(71200400001)(478600001)(186003)(86362001)(26005)(8936002)(7696005)(110136005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?U3I2bExGQU0rYUhaWnhCYU00UUdoTEE5alUyY25nQ3ZGdGdWeXlYblUzR2Zy?=
 =?utf-8?B?RWlnK2lkUE51TldJdFVUTE85K3RYQk5ONVE1dHd3MHYrek9aVE5yN2MzaU1E?=
 =?utf-8?B?VU1pSjdpRnlhd0Y2RXNFMmdsbG50SXpSSGFVM3N6NW1KOTI2cmZuRnhtcSth?=
 =?utf-8?B?anhNUzJwNmsvcVJZY2Z6L1ZsSi83Q0l5TDEvbjl1RnVraHMyRFZOODdvRm03?=
 =?utf-8?B?ZEppUkRaSmNqR2xrVEV4eHRSd0RCVHJXZFlWUEJEK21pT29uQ2JaUTNjL1Nk?=
 =?utf-8?B?UjJaUENxZHdmSmpNb3BRMmZZMy9panBpbjBSNmtwb2J2Wk9jUXJmMld5NzBv?=
 =?utf-8?B?OXBpSUFCajBocHNKY1I3UWtwRFN3V25FT25NdFAzbkJSWlpJOGJTeGZPNmFa?=
 =?utf-8?B?cjM5MFExeHJJS2xsSGpWZ0VDYWJFTGZCNytYd3dSbkliMVZRSzRvOWErWFFW?=
 =?utf-8?B?T0xMdCtRYy8wRlprdDJmbGFHb3p2TjdhNmRPdFhybXg4Uy9aV00vaC8wN0Vm?=
 =?utf-8?B?bmx4YmNxbU9VMDhtR3BEVjJJN08yM1NpTXZ0eGo3WTBFNnBMeWQ0RWRrRm4z?=
 =?utf-8?B?dHpEOW5saThyU2dxNUlTQllENnJyUFdYQkd5QzdJYVNaYkFvcmtnbWRqZ295?=
 =?utf-8?B?RzZ4cUhuQThyNkpSNVNBV0hBMzVxRHF2NkJ4d3ZXQWJNZW5TZ016N0NGUVpL?=
 =?utf-8?B?NnplUVdWNXY0b2pGYzNYUkl0eWdUeVJvREQwYnhSNmVIT3N1Yy80QUZxV2Y2?=
 =?utf-8?B?US9JQWJzUlpKSXRFUjlvUERoS0ZKMkJ5Ti9DSHV3Zk02L3NsMSt5ODRjYW5X?=
 =?utf-8?B?SXJNK0NPNzMzUnVFWGEyQVRaOUc2bW5BVm9pMUlJUHdqYlRPc0VJTFZJZGI2?=
 =?utf-8?B?a1p1U0NjRG9kWTNaZ3lqMGNlaWFOM0pZeFpON3FIYjNoRVQ5REUwZWtWUHhj?=
 =?utf-8?B?djNNam1mLzVJUUtCREVZbkpLR1JTMFJ5OSt1YzVGM2p6Z1lHNlllQUpoZVd0?=
 =?utf-8?B?MFZteEk2MCtxNFhyRTB6VFBhMTJDanBHYnNONzZkdGZ0S3dMeEV1aTVvWXFu?=
 =?utf-8?B?T2h6UlpULzZ3dkJRcnEveVdxMmpON2wzdHJBcTJYaHp6N2pZS3o1VmhzU3BR?=
 =?utf-8?B?SHV4MXMrcjd2R2pPeUpFdDhFQW5oR0tlT01mTU5LREN1ZXVaZWN6R1Y3M2cv?=
 =?utf-8?B?bUcrMFZYbTlIQ0cvdlpvZjc4eHNWaXliOVUzK3ZsampBYkNXRG1jQWRpSHN1?=
 =?utf-8?B?V1RoN0dxM2VlTUNPRmJIUTFYdVIyd0U1OEZrc0ZUdHF2bTYxNUJwMWFzcFgy?=
 =?utf-8?B?cU95cHJxTi9kWnU0TGVmZHRQd2huaEZnUkowb1ZFMm5hU0ZmMmZ6aUtLTVNQ?=
 =?utf-8?B?czlQbVBDNnFnQ1orMTFtR2VxOTJyNnFwdjlrV0RrUExsUWkxajZFaVpYM3dt?=
 =?utf-8?B?SGVBTE1ybUpDOWtWRnlGTkNyTjd4SVMxVWpjWGhuald3L3FYUU1oenZlNGZJ?=
 =?utf-8?B?aWJWNHFCR3NzZFp3d0dlWWl3T1lJL0c5d1N1c0ZtZ0JOMCt0VXZkWUpzN2xm?=
 =?utf-8?B?ZEYyL2tRS0NZOUNwWjhPMG5mN3YvNnM0R0tNeUpSUkgzZjFhRWw3a1lrK0Zm?=
 =?utf-8?B?SkFUK3h4bm05dmN5c3E0eXR2TmR1UzdIUkhaZjJxbjV0MEduQkhXY1E5c0Fk?=
 =?utf-8?B?OUJhOTkrZGk4MDlTcGIyRmlZdWRPRVdDRUpYRTdzdlBCcDhBbzFDbFh5b2Nn?=
 =?utf-8?Q?CkLh5U5W7LVtcHfSsLsgTcpXtdNfvojM9O9XJQ0?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3898.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b9ba0c2-2713-4d05-bf68-08d8d1c29491
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2021 15:01:31.8126
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cbSJx/rPvtzZ7otkqJTqfa6LCWmwZqPYoxFDQ77sH36w/5pa3qo8Jt3WQhCj6C97HEGyFIONGU4vBp0vFthy6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1177
X-OriginatorOrg: Nvidia.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1613401293; bh=PIbtolS7uXAoUw6z8E8AVXsvvKktePPHLW6vgqSCnrc=;
        h=ARC-Seal:ARC-Message-Signature:ARC-Authentication-Results:From:To:
         CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:References:
         In-Reply-To:Accept-Language:Content-Language:X-MS-Has-Attach:
         X-MS-TNEF-Correlator:authentication-results:x-originating-ip:
         x-ms-publictraffictype:x-ms-office365-filtering-correlation-id:
         x-ms-traffictypediagnostic:x-microsoft-antispam-prvs:x-header:
         x-ms-oob-tlc-oobclassifiers:x-ms-exchange-senderadcheck:
         x-microsoft-antispam:x-microsoft-antispam-message-info:
         x-forefront-antispam-report:x-ms-exchange-antispam-messagedata:
         x-ms-exchange-transport-forked:Content-Type:
         Content-Transfer-Encoding:MIME-Version:
         X-MS-Exchange-CrossTenant-AuthAs:
         X-MS-Exchange-CrossTenant-AuthSource:
         X-MS-Exchange-CrossTenant-Network-Message-Id:
         X-MS-Exchange-CrossTenant-originalarrivaltime:
         X-MS-Exchange-CrossTenant-fromentityheader:
         X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
         X-MS-Exchange-CrossTenant-userprincipalname:
         X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
        b=OlWtHhCm9aGBzpOoaQNwYX6cmvH4WFDrerbJfzofJWNRvjXddiasVbCe4tpzArOnX
         qsqD3hxa36LdeY/gk5vyHvFpCjepq3cK7FWkV2c11Ezi4aH4IA7INxO1LkRA+3a13k
         HA8PRyu0dfWXuf1vwUXbiKdb6TWwu2dzIZ4TTlBpZ53gMKYYj56zzhUrf1znjhSJzv
         Ego4jWDjuryjM9PooA4qKDlFwQH0Nrd6k4C3TiHF8f37R4oy6EexYKvs8+/R+33ieI
         EA70D8JlH37ALEn/uwwpD/v418PO9L90d5Mlh4ut4uWXO5VbJheKaV0RdLdGRkbsHs
         3/HuyHu5Fs+bg==
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

SGkgSGFucywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBIYW5zIGRl
IEdvZWRlIDxoZGVnb2VkZUByZWRoYXQuY29tPg0KPiBTZW50OiBNb25kYXksIEZlYnJ1YXJ5IDE1
LCAyMDIxIDQ6NDEgUE0NCj4gVG86IFZhZGltIFBhc3Rlcm5hayA8dmFkaW1wQG52aWRpYS5jb20+
OyBhbmR5QGluZnJhZGVhZC5vcmcNCj4gQ2M6IHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJu
ZWwub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggUkZDIHBsYXRmb3JtLW5leHQgMC84XSBwbGF0
Zm9ybTogbWVsbGFub3g6IEludHJvZHVjZQ0KPiBpbml0aWFsIGNoYXNzaXMgbWFuYWdlbWVudCBz
dXBwb3J0IGZvciBtb2R1bGFyIEV0aGVybmV0IHN5c3RlbQ0KPiANCj4gSGkgVmFkaW0sDQo+IA0K
PiBPbiAyLzMvMjEgNjozNiBQTSwgVmFkaW0gUGFzdGVybmFrIHdyb3RlOg0KPiA+IEFkZCBpbml0
aWFsIGNoYXNzaXMgbWFuYWdlbWVudCBzdXBwb3J0IGZvciBOdmlkaWEgbW9kdWxhciBFdGhlcm5l
dA0KPiA+IHN3aXRjaCBzeXN0ZW1zIE1TTjQ4MDAsIHByb3ZpZGluZyBhIGhpZ2ggcGVyZm9ybWFu
Y2Ugc3dpdGNoaW5nDQo+ID4gc29sdXRpb24gZm9yIEVudGVycHJpc2UgRGF0YSBDZW50ZXJzIChF
REMpIGZvciBidWlsZGluZyBFdGhlcm5ldCBiYXNlZA0KPiA+IGNsdXN0ZXJzLCBIaWdoLVBlcmZv
cm1hbmNlIENvbXB1dGluZyAoSFBDKSBhbmQgZW1iZWRkZWQgZW52aXJvbm1lbnRzLg0KPiA+DQo+
ID4gVGhpcyBzeXN0ZW0gY291bGQgYmUgZXF1aXBwZWQgd2l0aCB0aGUgZGlmZmVyZW50IHR5cGVz
IG9mIHJlcGxhY2VhYmxlDQo+ID4gbGluZSBjYXJkcyBhbmQgbWFuYWdlbWVudCBib2FyZC4gVGhl
IGZpcnN0IHN5c3RlbSBmbGF2b3Igd2lsbCBzdXBwb3J0DQo+ID4gdGhlIGxpbmUgY2FyZCB0eXBl
IE1TTjQ4MDAtQzE2IGVxdWlwcGVkIHdpdGggTGF0dGljZSBDUExEIGRldmljZXMNCj4gPiBhaW1l
ZCBmb3Igc3lzdGVtIGFuZCBBU0lDIGNvbnRyb2wsIG9uZSBOdmlkaWEgRlBHQSBmb3IgZ2VhcmJv
eGVzDQo+ID4gKFBIWXMpIG1hbmFnZW1lbnQsIGFuZCBmb3VyIE52aWRpYSBnZWFyYm94ZXMgZm9y
IHRoZSBwb3J0IGNvbnRyb2wgYW5kDQo+ID4gd2l0aCAxNngxMDBHYkUgUVNGUDI4IHBvcnRzIGFu
ZCBhbHNvIHdpdGggdmFyaW91cyBkZXZpY2VzIGZvcg0KPiA+IGVsZWN0cmljYWwgY29udHJvbC4N
Cj4gPg0KPiA+IFRoZSBzeXN0ZW0gaXMgZXF1aXBwZWQgd2l0aCBlaWdodCBzbG90cyBmb3IgbGlu
ZSBjYXJkcywgZm91ciBzbG90cyBmb3INCj4gPiBwb3dlciBzdXBwbGllcyBhbmQgc2l4IHNsb3Rz
IGZvciBmYW5zLiBJdCBjb3VsZCBiZSBjb25maWd1cmVkIGFzIGZ1bGx5DQo+ID4gcG9wdWxhdGVk
IG9yIHdpdGggZXZlbiBvbmx5IG9uZSBsaW5lIGNhcmQuIFRoZSBsaW5lIGNhcmRzIGFyZQ0KPiA+
IGhvdC1wbHVnZ2FibGUuDQo+ID4gSW4gdGhlIGZ1dHVyZSB3aGVuIG1vcmUgbGluZSBjYXJkIGZs
YXZvcnMgYXJlIHRvIGJlIGF2YWlsYWJsZSAoZm9yDQo+ID4gZXhhbXBsZSBsaW5lIGNhcmRzIHdp
dGggOHgyMDBHYiBFdGggcG9ydCwgd2l0aCA0eDQwMCBFdGggcG9ydHMsIG9yDQo+ID4gd2l0aCBz
b21lIGtpbmQgb2Ygc21hcnQgY2FyZHMgZm9yIG9mZmxvYWRpbmcgcHVycG9zZSksIGFueSB0eXBl
IG9mDQo+ID4gbGluZSBjYXJkIGNvdWxkIGJlIGluc2VydGVkIGF0IGFueSBzbG90Lg0KPiA+DQo+
ID4gVGhlIHN5c3RlbSBpcyBiYXNlZCBvbiBOdmlkaWEgU3BlY3RydW0tMyBBU0lDLiBUaGUgc3dp
dGNoIGhlaWdodCBpcyA0VQ0KPiA+IGFuZCBpdCBmaXRzIHN0YW5kYXJkIHJhY2sgc2l6ZS4NCj4g
Pg0KPiA+IFRoZSBuZXh0IGNvbWluZyAgY2FyZCBnZW5lcmF0aW9ucyBhcmUgc3VwcG9zZWQgdG8g
c3VwcG9ydDoNCj4gPiAtIExpbmUgY2FyZHMgd2l0aCA4eDIwMEdiZSBRU0ZQMjggRXRoZXJuZXQg
cG9ydHMuDQo+ID4gLSBMaW5lIGNhcmRzIHdpdGggNHg0MDBHYmUgUVNGUC1ERCBFdGhlcm5ldCBw
b3J0cy4NCj4gPiAtIFNtYXJ0IGNhcmRzIGVxdWlwcGVkIHdpdGggTnZpZGlhIEFSTSBDUFUgZm9y
IG9mZmxvYWRpbmcgYW5kIGZvciBmYXN0DQo+ID4gICBhY2Nlc3MgdG8gdGhlIHN0b3JhZ2UgKEVC
b0YpLg0KPiA+IC0gRmFicmljIGNhcmRzIGZvciBpbnRlci1jb25uZWN0aW9uLg0KPiANCj4gSXMg
dGhlcmUgYSBzcGVjaWZpYyByZWFzb24gd2h5IHRoaXMgc2VyaWVzIGlzIFJGQz8gIFR5cGljYWxs
eSB0aGF0IGluZGljYXRlcyB0aGUNCj4gY29kZSBpcyBub3QgeWV0IHJlYWR5IGZvciBtZXJnaW5n
IGFuZCBub3JtYWxseSB0aGUgY292ZXItbGV0dGVyIGluZGljYXRlcyB3aHkNCj4gdGhlIHNlcmll
cyBpcyBSRkMuDQoNClNvcnJ5LCBJIG1pc3NlZCB0byBtZW50aW9uIHRoZSByZWFzb24gd2h5IHRo
aXMgaXMgUkZDLiBJIGRvbid0IGhhdmUNCnJlYWwgaGFyZHdhcmUgeWV0LCB3aGljaCBpcyBhcnJp
dmluZyBpbiAxLjUgbW9udGguDQpDb2RlIGhhcyBiZWVuIHRlc3RlZCBvbiBoYXJkd2FyZSBzaW11
bGF0aW9uIHNldHVwLg0KDQpNeSBpbnRlbnRpb24gd2FzIHRvIGdldCBzb21lIGZlZWRiYWNrLCBz
aW5jZSB0aGUgbW9kdWxhciBzeXN0ZW0gd2l0aA0KdGhlIHJlcGxhY2VhYmxlIGxpbmUgY2FyZHMg
aXMgc29tZXRoaW5nIG5ldyBpbiBrZXJuZWwuDQoNCj4gDQo+IFRoZSBoYXJkd2FyZSB0aGlzIGlz
IGZvciBpcyBwcmV0dHkgc3BlY2lhbGl6ZWQsIHNvIEknbSBtb3N0bHkganVzdCBnb2luZyB0byB0
cnVzdA0KPiB0aGF0IHlvdSBrbm93IHdoYXQgeW91IGFyZSBkb2luZyBoZXJlLg0KPiANCj4gSSBz
ZWUgdGhhdCB0aGlzIGhhcyBub3QgYmVlbiByZXZpZXdlZCBieSBhbnkgb2YgdGhlIG90aGVyIE1l
bGFub3ggcGVvcGxlLCBpdA0KPiB3b3VsZCBiZSBjb3VsZCBpZiB5b3UgY291bGQgZ2V0IHNvbWVv
bmUgZWxzZSBmcm9tIHlvdXIgdGltZSB0byByZXZpZXcgdGhpcw0KPiBzZXJpZXMgYW5kIGdpdmUg
dGhlcmUgUmV2aWV3ZWQtYnkgb25jZSB0aGV5IGFyZSBoYXBweSB3aXRoIGl0Lg0KDQpTdXJlLg0K
DQo+IA0KPiBSZWdhcmRzLA0KPiANCj4gSGFucw0KPiANCj4gDQo+IA0KPiANCj4gPg0KPiA+IFBh
dGNoIHNldCBjb250YWluczoNCj4gPiBQYXRjaCAjMSDigJMgYWRkcyBuZXcgdHlwZXMgZm9yIG1v
ZHVsYXIgc3lzdGVtIHN1cHBvcnQuDQo+ID4gUGF0Y2ggIzIgLSBhZGRzIHN1cHBvcnQgZm9yIHRo
ZSBtb2R1bGFyIHN5c3RlbSBlcXVpcHBlZCB3aXRoIHJlcGxpY2FibGUNCj4gPiAJCWxpbmUgY2Fy
ZHMuDQo+ID4gUGF0Y2hlcyAjMyAmICM4IOKAkyBhZGQgZG9jdW1lbnRhdGlvbi4NCj4gPiBQYXRj
aGVzICM0ICYgIzYgLSBleHRlbmQgbG9naWMgZm9yIGhvdHBsdWcgZGV2aWNlcyBvcGVyYXRpb25z
IGZvciB0aGUNCj4gPiAJCW1vZHVsYXIgc3lzdGVtIHN1cHBvcnQuDQo+ID4gUGF0Y2ggIzUg4oCT
IGV4dGVuZHMgbnVtYmVyIG9mIGh3bW9uIGF0dHJpYnV0ZXMgZm9yIG1seHJlZy1pbyBkcml2ZXIs
DQo+ID4gCQlzaW5jZSBtb2R1bGFyIHN5c3RlbSBpbnRyb2R1Y2VzIG1vcmUgYXR0cmlidXRlcy4N
Cj4gPiBQYXRjaGVzICM3IC0gaW50cm9kdWNlcyBpbml0aWFsIHN1cHBvcnQgZm9yIE1lbGxhbm94
IGxpbmUgY2FyZCBkZXZpY2VzLg0KPiA+DQo+ID4gVmFkaW0gUGFzdGVybmFrICg4KToNCj4gPiAg
IHBsYXRmb3JtX2RhdGEvbWx4cmVnOiBBZGQgbmV3IHR5cGVzIHRvIHN1cHBvcnQgZm9yIG1vZHVs
YXIgc3lzdGVtcw0KPiA+ICAgcGxhdGZvcm0veDg2OiBtbHgtcGxhdGZvcm06IEFkZCBpbml0aWFs
IHN1cHBvcnQgZm9yIG5ldyBtb2R1bGFyIHN5c3RlbQ0KPiA+ICAgRG9jdW1lbnRhdGlvbi9BQkk6
IEFkZCBuZXcgYXR0cmlidXRlcyBmb3IgbWx4cmVnLWlvIHN5c2ZzIGludGVyZmFjZXMNCj4gPiAg
IHBsYXRmb3JtL21lbGxhbm94OiBtbHhyZWctaG90cGx1ZzogRXh0ZW5kIGxvZ2ljIGZvciBob3Rw
bHVnIGRldmljZXMNCj4gPiAgICAgb3BlcmF0aW9ucw0KPiA+ICAgcGxhdGZvcm0vbWVsbGFub3g6
IG1seHJlZy1pbzogRXh0ZW5kIG51bWJlciBvZiBod21vbiBhdHRyaWJ1dGVzDQo+ID4gICBwbGF0
Zm9ybS9tZWxsYW5veDogbWx4cmVnLWhvdHBsdWc6IEFkZCBsaW5lIGNhcmQgZXZlbnQgY2FsbGJh
Y2tzDQo+ID4gICAgIHN1cHBvcnQgZm9yIG1vZHVsYXIgc3lzdGVtDQo+ID4gICBwbGF0Zm9ybS9t
ZWxsYW5veDogbWx4cmVnLWxjOiBBZGQgaW5pdGlhbCBzdXBwb3J0IGZvciBNZWxsYW5veCBsaW5l
DQo+ID4gICAgIGNhcmQgZGV2aWNlcw0KPiA+ICAgRG9jdW1lbnRhdGlvbi9BQkk6IEFkZCBuZXcg
bGluZSBjYXJkIGF0dHJpYnV0ZXMgZm9yIG1seHJlZy1pbyBzeXNmcw0KPiA+ICAgICBpbnRlcmZh
Y2VzDQo+ID4NCj4gPiAgRG9jdW1lbnRhdGlvbi9BQkkvc3RhYmxlL3N5c2ZzLWRyaXZlci1tbHhy
ZWctaW8gfCAgMTk1ICsrKw0KPiA+ICBkcml2ZXJzL3BsYXRmb3JtL21lbGxhbm94L0tjb25maWcg
ICAgICAgICAgICAgICB8ICAgMTIgKw0KPiA+ICBkcml2ZXJzL3BsYXRmb3JtL21lbGxhbm94L01h
a2VmaWxlICAgICAgICAgICAgICB8ICAgIDEgKw0KPiA+ICBkcml2ZXJzL3BsYXRmb3JtL21lbGxh
bm94L21seHJlZy1ob3RwbHVnLmMgICAgICB8ICAxMjAgKy0NCj4gPiAgZHJpdmVycy9wbGF0Zm9y
bS9tZWxsYW5veC9tbHhyZWctaW8uYyAgICAgICAgICAgfCAgICAyICstDQo+ID4gIGRyaXZlcnMv
cGxhdGZvcm0vbWVsbGFub3gvbWx4cmVnLWxjLmMgICAgICAgICAgIHwgIDgwNyArKysrKysrKysr
DQo+ID4gIGRyaXZlcnMvcGxhdGZvcm0veDg2L21seC1wbGF0Zm9ybS5jICAgICAgICAgICAgIHwg
MTgxNyArKysrKysrKysrKysrKysrKysrKy0tDQo+IC0NCj4gPiAgaW5jbHVkZS9saW51eC9wbGF0
Zm9ybV9kYXRhL21seHJlZy5oICAgICAgICAgICAgfCAgIDYxICsNCj4gPiAgOCBmaWxlcyBjaGFu
Z2VkLCAyNzg1IGluc2VydGlvbnMoKyksIDIzMCBkZWxldGlvbnMoLSkgIGNyZWF0ZSBtb2RlDQo+
ID4gMTAwNjQ0IGRyaXZlcnMvcGxhdGZvcm0vbWVsbGFub3gvbWx4cmVnLWxjLmMNCj4gPg0KDQo=
