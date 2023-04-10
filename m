Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AB4AC77B61
	for <platform-driver-x86@archiver.kernel.org>; Mon, 10 Apr 2023 16:49:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229771AbjDJQtg (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 10 Apr 2023 12:49:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229664AbjDJQtf (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 10 Apr 2023 12:49:35 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2088.outbound.protection.outlook.com [40.107.93.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08D0A1BC9
        for <platform-driver-x86@vger.kernel.org>; Mon, 10 Apr 2023 09:49:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LTXGtrE/FLP1tTW/EkObBiAO5YsbkAb+qxG6EaocHA7IJ8XKWfCLjFELt62vnjpVqXHEYQjSuRBSzjjFEWUXtsrGEutuwYx8n4cndJdk2PiQ/C3Rid8uUy7KP/lu7GSmnORPABX3YXmJkFyugtrWNXnRvwawBlNC+sgZXcOBFRE+I/tXiN7hlTEFIsDlk/c/0pbzKOXE3SlDBZZFinf9kcG4+VDYpUloXAd7qEHQYpjeslxZysKzDPB//UKr6BudkAwDCeCP0lap/jIdrlXojauOFgx0jGOYfBrOQeDOUlV5hkn01gLBejJpThp18nB1lhiqEriTecRn0fu6OAWawQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Ye6FEtptZbrbouAUjxh6877hlHbOB+VFYptr5XhR2Y=;
 b=Lks0bz1KbS+lYvHcHpQlkgYVsD+mE9WIAv/XOgVPmxJDP7Rxlqjjhxcn6H35xxIaRQ1wf/rspxq+viCB05SM72lPpd7/NLcjrwdlkSLL/fvpTbKIDYOXar7Dz3B3GIyHpuExt91z3d2WGnhrV+tskhuKZQlJONrmT4dO6i43vwkZMoKN5x/dKEkApcvOlztfTKkz6XzbnNzFXHNmWfWVkY+0FxVn/w8fzZX082EuUn5h7TY0z0vcyc9JyzVYgibbCZOoaSc2S8NwQSpayKmEKULUPV85Xm8V+e0/5scon2o1Wq7g8fKaQYQZHV9ma0xfSY5RdTfZ4nxD/iuA6xNrIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Ye6FEtptZbrbouAUjxh6877hlHbOB+VFYptr5XhR2Y=;
 b=rY4g9c/MhdbO7GWzfYhEzqWyIuXwKiyi5qBtprn4O6hdPQf1yy4cEAqPwsni0JdJ4W5sz8CAlKOreYikFlwo8lC9Rj2nquovQw8PooY/dcLzqV3oaZ+YbEpvs53KJ3Hjq0J4QTG34cAItaMSfPkXxGpelRKL+LYjHxJPA/nhLSY=
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SA3PR12MB7832.namprd12.prod.outlook.com (2603:10b6:806:31f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.36; Mon, 10 Apr
 2023 16:49:30 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::f4d:82d0:c8c:bebe]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::f4d:82d0:c8c:bebe%2]) with mapi id 15.20.6277.036; Mon, 10 Apr 2023
 16:49:26 +0000
From:   "Limonciello, Mario" <Mario.Limonciello@amd.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        "S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>,
        "markgross@kernel.org" <markgross@kernel.org>
CC:     "Goswami, Sanket" <Sanket.Goswami@amd.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Subject: RE: [PATCH 0/8] platform/x86/amd/pmc: Updates to AMD PMC driver
Thread-Topic: [PATCH 0/8] platform/x86/amd/pmc: Updates to AMD PMC driver
Thread-Index: AQHZaxTDxIzGc2UmA0qvu6fRJkLoRa8kWn6AgABn9zA=
Date:   Mon, 10 Apr 2023 16:49:26 +0000
Message-ID: <MN0PR12MB6101CD495BC935413CBE981CE2959@MN0PR12MB6101.namprd12.prod.outlook.com>
References: <20230409185348.556161-1-Shyam-sundar.S-k@amd.com>
 <16fc47de-2464-5862-73f7-38a80cd82df4@redhat.com>
In-Reply-To: <16fc47de-2464-5862-73f7-38a80cd82df4@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2023-04-10T16:49:25Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=e0ba4ef9-d3f5-47f6-a1ca-b5d3a35c4117;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_enabled: true
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_setdate: 2023-04-10T16:49:25Z
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_method: Privileged
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_name: Public-AIP 2.0
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_actionid: 2bef3d94-dbdc-4b31-b27b-bbf7f4453e32
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB6101:EE_|SA3PR12MB7832:EE_
x-ms-office365-filtering-correlation-id: b0bad23f-7d06-4af5-9377-08db39e38bc0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HS2sIzLYZqV8Y8bRHY3RmLo8867FLihmPFwBP1mXYp5VE8dCHIGCAOTYi8PVysDW8UdA2s6g+Zk+/ohXClifB8jk6bmz+QHYQpbFH/5NuClilEsDYqf7YfBDqUT0RGSyDOQOXXsNmgMYNVDhQw61a5YIWi2qQxbGu9BicopsNvxp9wOjZ4qA3ZtvyzB1QTj6wP+xbLycTlijIYj/hlTFml61qmBRPhLjX1V5sA1TzOu/6zGGEgZhJYulJ5b/Gv00LfKC7NF29XbY7DrpqQ7QHsgc2Gx9TkZHSINMjwVy4nYaN2XZzlsV58ag+j9YUcXXgjMnhdxDXr4aL2hsb+D7hYHprcaFTqxgECe9ciuaWCXYyq1GOMuhVfvwpKcz3NhZ5Ydhkf1rfVQFexpamyrTSOf/5p8TdYxMRdCbgO5Y4O9Y8KuVAtzPFJvrEBopdb13vp8lVzyY4lC/bT83jj7PZ8/xxLlklxAKvfhDffl1SQl8kYr3LsYgO/zyufRRrBt2QuTYNRBxF7vXL2Ae/mH9xcFl2rI7+8MtUphxkCem5WgaIjRoK4GZ+4lNsN7qrQFzsv6vOhzulFlNGc0dTVDS/amREVTaSE2nqOgbux44OH8ocVHjkP3/8z/PcKK3D5qE
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(396003)(366004)(346002)(376002)(451199021)(66446008)(4326008)(66946007)(64756008)(478600001)(71200400001)(54906003)(7696005)(66476007)(66556008)(8676002)(41300700001)(316002)(76116006)(110136005)(86362001)(33656002)(83380400001)(26005)(9686003)(6506007)(53546011)(8936002)(5660300002)(2906002)(15650500001)(55016003)(38100700002)(38070700005)(52536014)(186003)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UjNKMFRPczZDTklGSUNvOVNUejhEY1cxTVh1WUpWRlNDK25LSUs5TmcreGZG?=
 =?utf-8?B?S2N5QW1wSmp1dE83SllFazBPM3JUVzVZVWFOc0dkUDVHd1dsbmhuWUp4MURm?=
 =?utf-8?B?dm5wYW9NdDJKcFE0cktYRENrSmRRdHYxZG9Kd2t6SkRmWTFLVkt6UVY0eEFy?=
 =?utf-8?B?YTg4em1jVWh3SExNMVBTR2hXTDN4UEZIeGRJK2RtSkpnZ2xBdFlrUndqUS9I?=
 =?utf-8?B?T3dxUFV4TExHbEJHbXFYRm1nRnBrUGZCL3FkdE9zVHJWeEkwZWM4SUhWT0ts?=
 =?utf-8?B?Zk5DSnJ1Rm1aNUZ3eCtzUWxZQzhQK3ZGY2JGYXNJdytMSy90VjVYanVUb0dS?=
 =?utf-8?B?MWFBTVB3cHdFbW5wb1ZlQVJvcjFYc0tpN25aS0huWCtZcXZJTk0yMWFRMnRM?=
 =?utf-8?B?ZUxPNlVmV0RBZVU0Wks4NTFzVEtpd1FwVS9KbTVESDErTXEvOW5LUFNHOEhp?=
 =?utf-8?B?SW81TDVTcHVKSnNISHBMNnkwalFjWnlHMmEzMTJKaU9OWG5xbHFJb0pZOUI3?=
 =?utf-8?B?emc5Y1h4dFFkdTM1OEViYlpDMjNNZFNmY3V6ZzlWa3dIVG1DcG5RZFRsZzRx?=
 =?utf-8?B?SUx1TnlHSVNGTmJXd0NCZ2Y0Vi9QcTk1c2xKUXVjT0Z5SGVlQWcwaUZUc0hu?=
 =?utf-8?B?ZjFlNEJQQTBUWngxMEJ4Wmw1b2lwMFJ3Nm1FakRrV3FNUEFkWEFWd2I1RjdQ?=
 =?utf-8?B?S1ljQVFGNnRBb3lsYWhYWjdqMk1GaUZlYlp5VWJQejcrYVMrYmpQc1VubVR2?=
 =?utf-8?B?TkhHT1loakIyZEc3S203YlB3RE83V21QaTExMjgyb0RCMTRzdlFmWlZlTTFj?=
 =?utf-8?B?ai9LZUUwYnBFRmx1ZjVxelltWndGVlA4WS9PckxONUFZQUVIaG9oakk3bjNQ?=
 =?utf-8?B?ZjVmZGsxT2ZUVW54NUk5SCtPNnd3MEpBR3g0TEtzcUdZVk0vZ1piNGRjMjV0?=
 =?utf-8?B?U1VVMjdIUS9tZWszdEswODBhRGFsMEcwakxZT09paUtSWHRoNUdPNWluOFYr?=
 =?utf-8?B?TzEzT20zYmg3alI0VGRPWW5UU3RxSTBzSEFMMDFWRUY5Ym5OMFUwRWFPQjNW?=
 =?utf-8?B?YytvSjRKdGJYb0Y3K0I0dzZXU0NHS1YwTEFxK0N4cnhxYS9KMFJKTGN4cG41?=
 =?utf-8?B?ZTBPVmZnQ3Jwa3hRTXdpVnNiQzdpSmhaVnd0ZmpUbUdIdkw1b3NJVFA3YlIv?=
 =?utf-8?B?TTdnZHViQXliazVEbUhYNGZ2MEYxd1dSM0hkeldsbTRPMDNRN3NhaTlyNEFn?=
 =?utf-8?B?L1RNUzdaTVhMWnFFOVFxYlhnRzdjOVliK1NEbkFzSHFEZ1lWUEhzYlE1VnM4?=
 =?utf-8?B?OE9GeTF4bGFwT09hL3Q2ZGtNdDNYVlBYczA0ZGhpbmhENkc4aGdyUlFjRG1t?=
 =?utf-8?B?RFUvVEc5R0hIYzdUOXN6b3l2M3QwYmxzcEJqOE52N0NzVnpJa2dTQ3hBOVc3?=
 =?utf-8?B?dmgvSTkxUmlKUG9pa05nbnEwT3JYN2paQTNZNjlvaXJ5V2dncGwyeFB3RUdS?=
 =?utf-8?B?QkZsdHJnNzR0RjRmYUhnRWlwcFJUVVpLNFpoem5GS1JXVEZOWE5zaTRvSHJI?=
 =?utf-8?B?Z05uemZHNlR4Nm9hck53UlYwN2hML0NPQlpCSEVmNi9FdGdUOHJCbm9FaHVw?=
 =?utf-8?B?anRCeExYODlMWWRVZFJabno0c29SaUVrVlRlZ1dzT0tmcUZ3TmgwMk91Rmhi?=
 =?utf-8?B?QUh3TUdjbm8yL1BacVNSL0VXMHB0emp2RklpQUVBdWZYMnZQdW1id2pJd1U4?=
 =?utf-8?B?S0hEd1IwdFZ0K0pRbFVlNWtGdlFIVGdHUHFYb2JNb1BiSlR6aHhBY0pWMkZD?=
 =?utf-8?B?bnFvMFRBWjNxbDBSZkl4Mi91UW5UNGJlZlJvMFhkdk1OWUU5L1dMaUNOVzZt?=
 =?utf-8?B?MlN5ZFFvN0hnaklBckRoQktkY3hjSDlqVGVlc3A5Ny9pSzI2M2Q5Qm9FVVlK?=
 =?utf-8?B?U1ozVTNOQ1BCd1NIN0QzSnlUUStabUVSazlLSFhaOFcySzNLRDlDRUwyVjV2?=
 =?utf-8?B?dmFzV2NnWTdacitLV09XVGw4Y3R4aFdYZ1pIcEcvVldzNnJ1dVJhejl1UWVr?=
 =?utf-8?B?OHVFcG51YWNrOFZmMGZIanRIdml2bFQrVEM1MEpyQXpicWpPSm5lcTk1R2h2?=
 =?utf-8?Q?O+dg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0bad23f-7d06-4af5-9377-08db39e38bc0
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2023 16:49:26.7449
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5iXBdESTwpQrfAoy2S2KU3amz+GXq8OOw+iCK9lRlZtUnhbhiN6x93slAu1DCjPRduN0JW0odAFLUF4u3rPDlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7832
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

W1B1YmxpY10NCg0KDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSGFu
cyBkZSBHb2VkZSA8aGRlZ29lZGVAcmVkaGF0LmNvbT4NCj4gU2VudDogTW9uZGF5LCBBcHJpbCAx
MCwgMjAyMyAwNTozNw0KPiBUbzogUy1rLCBTaHlhbS1zdW5kYXIgPFNoeWFtLXN1bmRhci5TLWtA
YW1kLmNvbT47DQo+IG1hcmtncm9zc0BrZXJuZWwub3JnOyBMaW1vbmNpZWxsbywgTWFyaW8gPE1h
cmlvLkxpbW9uY2llbGxvQGFtZC5jb20+DQo+IENjOiBHb3N3YW1pLCBTYW5rZXQgPFNhbmtldC5H
b3N3YW1pQGFtZC5jb20+OyBwbGF0Zm9ybS1kcml2ZXItDQo+IHg4NkB2Z2VyLmtlcm5lbC5vcmcN
Cj4gU3ViamVjdDogUmU6IFtQQVRDSCAwLzhdIHBsYXRmb3JtL3g4Ni9hbWQvcG1jOiBVcGRhdGVz
IHRvIEFNRCBQTUMNCj4gZHJpdmVyDQo+IA0KPiBIaSBTaHlhbSwgTWFyaW8sDQo+IA0KPiBPbiA0
LzkvMjMgMjA6NTMsIFNoeWFtIFN1bmRhciBTIEsgd3JvdGU6DQo+ID4gVGhpcyBwYXRjaCBzZXJp
ZXMgaW5jbHVkZXM6DQo+ID4NCj4gPiAxLiBGaXhlcyB0byBQaWNhc3NvIGZyb20gTWFyaW8NCj4g
PiAyLiBDaGFuZ2UgdGhlIFNNTiBwYWlyIGluZGV4IGZvciBkcml2ZXIgcHJvYmluZyAmIFNUQiBp
bml0DQo+ID4gMy4gTmV3IGNvbW1hbmQgSUQgZm9yIGdldHRpbmcgRFJBTSBzaXplIGZyb20gUE1G
Vy4NCj4gPiA0LiBDaGFuZ2UgaW4gc211IG1ldHJpY3MgdGFibGUgZGF0YSBzdHJ1Y3R1cmUuDQo+
IA0KPiBTbyBwYXRjaGVzIDEtNiBhbGwgc2VlbSB0byBiZSBidWdmaXhlcywgYnV0IHRoZXkgZG9u
J3Qgc2VlbQ0KPiB0byBiZSB2ZXJ5IHVyZ2VudC4gIEF0IGxlYXN0IEFGQUlDVCB0aGV5IG1vc3Rs
eSBqdXN0IGZpeA0KPiBzb21lIChoYXJtbGVzcykgd2FybmluZ3MgZ2V0dGluZyBsb2dnZWQgKyBm
dXR1cmUgcHJvb2Ygc29tZQ0KPiBvZiB0aGUgY29kZSBmb3IgbmV3ZXIgZmlybXdhcmUgcmV2aXNp
b25zLg0KPiANCj4gR2l2ZW4gdGhhdCByYzYgaGFzIGFscmVhZHkgYmVlbiByZWxlYXNlZCBpdCB3
b3VsZCBiZSBteQ0KPiBwcmVmZXJlbmNlIHRvIGp1c3QgbWVyZ2UgdGhlc2UgaW50byBsaW51eC1u
ZXh0IHNvIHRoYXQgdGhleQ0KPiBnZXQgbWVyZ2VkIGludG8gTGludXMgdHJlZSBmb3IgNi40LXJj
MS4NCj4gDQo+IEVpdGhlciB3YXkgKHVyZ2VudCBzaG91bGQgZ28gdG8gZml4ZXMsIG9yIC1uZXh0
IGlzIGZpbmUpDQo+IHBsZWFzZSBsZXQgbWUga25vdyBob3cgdG8gcHJvY2VlZCB3aXRoIG1lcmdp
bmcgdGhlc2UuDQo+IA0KDQpJTU8gdGhleSBjYW4gd2FpdCBmb3IgNi40LiAgVGhlcmUgaXMgYSBt
YXRjaGluZyBjaGFuZ2UgbmVlZGVkDQpmb3IgTlZNRSBmb3IgdGhlIFBpY2Fzc28gc3R1ZmYgd2hp
Y2ggaXNuJ3QgbGFuZGluZyB1bnRpbCA2LjQgYWxzby4NCg0KPiBSZWdhcmRzLA0KPiANCj4gSGFu
cw0KPiANCj4gDQo+IA0KPiANCj4gDQo+IA0KPiA+DQo+ID4gTWFyaW8gTGltb25jaWVsbG8gKDQp
Og0KPiA+ICAgcGxhdGZvcm0veDg2L2FtZDogcG1jOiBEb24ndCB0cnkgdG8gcmVhZCBTTVUgdmVy
c2lvbiBvbiBQaWNhc3NvDQo+ID4gICBwbGF0Zm9ybS94ODYvYW1kOiBwbWM6IEhpZGUgU01VIHZl
cnNpb24gYW5kIHByb2dyYW0gYXR0cmlidXRlcyBmb3INCj4gPiAgICAgUGljYXNzbw0KPiA+ICAg
cGxhdGZvcm0veDg2L2FtZDogcG1jOiBEb24ndCBkdW1wIGRhdGEgYWZ0ZXIgcmVzdW1lIGZyb20g
czBpMyBvbg0KPiA+ICAgICBwaWNhc3NvDQo+ID4gICBwbGF0Zm9ybS94ODYvYW1kOiBwbWM6IE1v
dmUgaWRsZW1hc2sgY2hlY2sgaW50bw0KPiA+ICAgICBgYW1kX3BtY19pZGxlbWFza19yZWFkYA0K
PiA+DQo+ID4gU2h5YW0gU3VuZGFyIFMgSyAoNCk6DQo+ID4gICBwbGF0Zm9ybS94ODYvYW1kOiBw
bWM6IFV0aWxpemUgU01OIGluZGV4IDAgZm9yIGRyaXZlciBwcm9iZQ0KPiA+ICAgcGxhdGZvcm0v
eDg2L2FtZDogcG1jOiBNb3ZlIG91dCBvZiBCSU9TIFNNTiBwYWlyIGZvciBTVEIgaW5pdA0KPiA+
ICAgcGxhdGZvcm0veDg2L2FtZDogcG1jOiBHZXQgU1RCIERSQU0gc2l6ZSBmcm9tIFBNRlcNCj4g
PiAgIHBsYXRmb3JtL3g4Ni9hbWQ6IHBtYzogdXBkYXRlIG1ldHJpY3MgdGFibGUgaW5mbyBmb3Ig
UGluayBTYXJkaW5lDQo+ID4NCj4gPiAgZHJpdmVycy9wbGF0Zm9ybS94ODYvYW1kL0tjb25maWcg
fCAgIDIgKy0NCj4gPiAgZHJpdmVycy9wbGF0Zm9ybS94ODYvYW1kL3BtYy5jICAgfCAyNDAgKysr
KysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLQ0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDE0NSBp
bnNlcnRpb25zKCspLCA5NyBkZWxldGlvbnMoLSkNCj4gPg0K
