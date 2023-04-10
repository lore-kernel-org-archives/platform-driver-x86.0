Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A434C77B61
	for <platform-driver-x86@archiver.kernel.org>; Mon, 10 Apr 2023 17:36:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229703AbjDJRgV (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 10 Apr 2023 13:36:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229645AbjDJRgU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 10 Apr 2023 13:36:20 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2052.outbound.protection.outlook.com [40.107.223.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4348D10DB
        for <platform-driver-x86@vger.kernel.org>; Mon, 10 Apr 2023 10:36:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IYrUVnGy5or6X2nTx/AREnJIJvcO61VbqUB3HU2Z6U92E9C2CQ2E6Pdwi4cdMRTrAA7pETnf9yokxEn+9bxTWBU8lwCNkEaNWtZ37/Bw4N/Bfr86VFcXEQNVxx+jNmLizGR9LpYtxSqDHUeoYUqKyguqzz4xEzBm+xw73nFZD9BWJO9PvQHDGUcA0aGomwVO+vdp/CGEcmlPjUfoeHpcHuc7jbv0EKhTZ/FJdjIkArD+GCrpbHGbV+Ks5Ul7VSI9kJb5wky+p4HdN37ecw09dvncYfB2cR4TLSvCZicGlZ3EBagXlJqzkeKzKn4gFJuWjReeRl6kd3A52yJR9+6xbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WAdaMfXkziS75IId9/l/S6xrd/7f9GoI2oFbw/fgUwQ=;
 b=jTTJs7lD43U4/YTqzE9W8ahLhMyz7vmnBf7Of7E0XlA8R4qqoXP8WbKa+pTc8XkVWuV92KetYe8eyoAGLU8OLTdr3Qzc/RsxfU7P2C2Bnw4TnkR5KhayfPzfRZ819DqD2AcTg1SrHvp5q/UgYUScrmGSKuk2DQzsFQgRoS07iWStoYky/0Gv2W3USX8FPOvadayDrj6Sf6Nc7VqhgjyMbT4oIxTKL5MBDTfQqRniMyQM6aV9RZilhIjG22CbbWcZez9hGjnBZ23tQbO5Q42HsLZudezM0WjG4hfAI7FYpo1/RqgWbQlZJ6bm3wXmi0UdD6H+YsYLLCgB5ezbOJ4YHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WAdaMfXkziS75IId9/l/S6xrd/7f9GoI2oFbw/fgUwQ=;
 b=ZwS68j1Ljl9GTF5EvXErA/PKUwXe5mfGO3d4tzV19o3oyo1hLh7cWKssFRgNdHwf+IeDNlGzc5V475P0vLeIgmOs2fbwBxhz9W+c6cSqQMM7bzDflhSFI9vcgmMqHELkuNno/8Nn12ptTFuhheBy8ihPupSDZtCpa4bMoOZ17CA=
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CY8PR12MB7219.namprd12.prod.outlook.com (2603:10b6:930:59::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.36; Mon, 10 Apr
 2023 17:36:16 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::f4d:82d0:c8c:bebe]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::f4d:82d0:c8c:bebe%2]) with mapi id 15.20.6277.036; Mon, 10 Apr 2023
 17:36:13 +0000
From:   "Limonciello, Mario" <Mario.Limonciello@amd.com>
To:     "S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>,
        "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "markgross@kernel.org" <markgross@kernel.org>
CC:     "Goswami, Sanket" <Sanket.Goswami@amd.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Subject: RE: [PATCH 7/8] platform/x86/amd: pmc: Get STB DRAM size from PMFW
Thread-Topic: [PATCH 7/8] platform/x86/amd: pmc: Get STB DRAM size from PMFW
Thread-Index: AQHZaxTJOWCgGTuV4ESVpW+kTvfA6q8jcxAAgAFccYCAAAAYAA==
Date:   Mon, 10 Apr 2023 17:36:13 +0000
Message-ID: <MN0PR12MB61019ACE0B0CEED652B2D1F8E2959@MN0PR12MB6101.namprd12.prod.outlook.com>
References: <20230409185348.556161-1-Shyam-sundar.S-k@amd.com>
 <20230409185348.556161-8-Shyam-sundar.S-k@amd.com>
 <0a38a599-b0fe-630d-5367-7ae38a01c566@amd.com>
 <79e72f1a-b2f0-b55d-26e8-4880ef5cd941@amd.com>
In-Reply-To: <79e72f1a-b2f0-b55d-26e8-4880ef5cd941@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2023-04-10T17:36:11Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=35370513-dbcf-4004-8cb7-d5f4992245ad;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_enabled: true
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_setdate: 2023-04-10T17:36:11Z
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_method: Privileged
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_name: Public-AIP 2.0
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_actionid: 3d3d84d9-47ef-423c-8616-6b9078a90a88
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB6101:EE_|CY8PR12MB7219:EE_
x-ms-office365-filtering-correlation-id: 2b47fbe5-792c-454d-28c0-08db39ea14cd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eELy1l7KV1o+ihI0BXoW+T8cC//Q1og1AvvuGK2ctMvwRIO9V2udcvQn5Dfe+rf7E/s2IoLnl1u7sHhKq6iUN2VK5IS/IWsoMpEPQT2Ix6REeCeP1bwutZyOqGc+hKEHB5XP/TTgcFnhULa1k9WJnF4XhCGpPTyz6UWpvmRDkxfyz1SJlk/+cvCBgr8K0PHATaJcxxmEEhpWjTpnxdLBUVqTMyN4IRib0cxFoi4QuSkw/xGi9X5NIPc1mbuNp59JVa4NYH/2W69tUm/U7+BBpSnmI15idSAO4Iw4SVGacA0MqoTVbGggaYVNeNCAblIXusIcAQ/WwQr5iRNgtNcCn+fq5tpQC8T+eEDreGfJYBiZGhSCSgm2lDLcUtYRJjB3s4Mta7G8/rxbYBVNcR7c87dHnXFpyigj3FtTPVAGz6rwGX9+YWQPIbvV9cvYsg8aJNhDEkKXqJ1BG+VeiZWGLqr3w+xfHkQBqap91iSAHF7FDqt0vy+LV0aZeySFZqCAS/Bwaxz/uLFGVUeo0StjLUwqK+egjsZyoNtyorRK2n8Q0kH1OYyeRV+nvbmB9MX//okCiuWGV6ToXXvDn6UlxbR89wIO1aK/9mEvBOWlTii8lwGry1qvdWwh+a47WqkX
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(136003)(376002)(396003)(346002)(39860400002)(451199021)(478600001)(7696005)(71200400001)(316002)(110136005)(9686003)(53546011)(26005)(6506007)(186003)(54906003)(2906002)(5660300002)(4326008)(76116006)(66946007)(66446008)(8936002)(8676002)(41300700001)(66476007)(64756008)(52536014)(66556008)(38100700002)(38070700005)(122000001)(86362001)(55016003)(33656002)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TGs5TTUrY1VodlRWK3lLdFlYamtVeGJjYkMrZmZFZk1YZElxb3JuVy9CMURI?=
 =?utf-8?B?dDJnemxyNG5wSU5teGY1cUo4Zm1yZ09rRmw5cmV6S2VHQTlNOGFCREEzSFBL?=
 =?utf-8?B?U0FkZFVsMmc0S2ZoOXVaWSsrckMrcFJqOUZHazNNYzdaWUpoSER3QVpPOTBv?=
 =?utf-8?B?ZWRtUFRYY1MvREl6ZkNYZGpuTXp0c0duNGVJZ3MwRlhtSjh5L2J1enFtSjA1?=
 =?utf-8?B?R1VLV2R3c2crZkZjZHZJWkpIVXMzUVU4MlRRY2tFWDJqNFU3YlhVTE9oU2lI?=
 =?utf-8?B?TnhvY2Z4bkxnOFdPM3FySjAvbllYRHU5Z1Z6YXJJcHZCYUVhWEtrL1IvUFhn?=
 =?utf-8?B?a3lBVE5aTWNRVUs1dC9neHZsa2xWaXFzcDVJamY1blA3cWxDamVKTUtIaTdw?=
 =?utf-8?B?V3M4SFNyVnI5OTlHTHdZS3JKUElsRjAwc2p5UTdXanllRnNUN0NxRlVHNk5G?=
 =?utf-8?B?Mk1yTDlPL0YzdnZDaVh1Z3Nuck5vYTU1NnFJMjJvazRya0xwVWM0dm9URkox?=
 =?utf-8?B?dkxNM0pFcElwOUtxTlNpU3c3clErLzIzcGx4bTZpMmxIVjVrVitWd0xXYTBK?=
 =?utf-8?B?OGgzazBrTWJXR0Vuak1uc2dXM3lpcVRaNnhtYUplZHdVWmZ3L3dTVXpGNk5t?=
 =?utf-8?B?OUpnRmFkaEZnZ2JLOFljYUp6RHZ5b0JqRzFNV0JhTU1BSG1LdUlKbVZ0MnFW?=
 =?utf-8?B?aCtNNC9SRWRrN3ZHRjdhTC9sRXptWEpkQXptMXMzS1QvdWhtTTZ3bitjR0d4?=
 =?utf-8?B?YjZoYXBtdXRRdkFQTE84Y2d3WEdsS0F3YjVoc1dOWnhwSDVQMG1vZldIdmxP?=
 =?utf-8?B?Rm1qZXZFRWFLa2VoaklyODZHMFcwbTVZT2lJbVBUK3Z0S1hRQ3RLVWRTcGF5?=
 =?utf-8?B?WTAwKzRMcjBvclA2dStUYVlld0N1TW1jdkVCU3hSSzZ4bnZrbmlKeUk3azY2?=
 =?utf-8?B?Zko5NHh6RUZFa1VoWUVVQnRkZStIOG5zOWpRcE1ZbDlBQ1hHUVhCUUpSMHdF?=
 =?utf-8?B?S0w2NS8vaktlYy9NYTBPSFdZVkFkeUp5SUNtVkdsOTd0ckQweWJSZktHTFRG?=
 =?utf-8?B?VFh5d1Rvc3RuREdTUFVxNE9BaFNNR3BpNDB0cWNVdEQ3aFRNQ1JnZW9IQm5Z?=
 =?utf-8?B?cVR3eVNDRVhUbGxKS3ZHWXpnUWZnNExYck1pY3VyTGxReTg3MTFnYzJoNjd2?=
 =?utf-8?B?eXgzaVM5TmN4RTZ1MDc4emFIRFM1VjdxZkZsVnlHd1Vqbi9WSFp6ZXY5MnFy?=
 =?utf-8?B?TkkxQmVKTjZSRGV1KzU2UGIxRWJTeFhwRU1ZTDc5c2NQRXNhRDNpc3FFQ2xD?=
 =?utf-8?B?OWdyKzBZSDg5VFEreTMyMjJielYyMEloM08wbG5kL24rUy91cGlZdUtMa2tQ?=
 =?utf-8?B?M0lzU3BVb0ZuMGYxT1FXaEgyZlpHYS9ORFE4WkFmVEE3bVVDMmRVK0tUWk9k?=
 =?utf-8?B?TitIV3VrNUlNOWpDYmN5dFMvU0Vqc2puMnZIMmo4NjI3ZkpSckNzZFlKN2JM?=
 =?utf-8?B?WU9jUVBTaldGSjhGQzlnMllSSGtNaEdOVFA0M29YdVlmV3ExNkwzVnY2Visz?=
 =?utf-8?B?RHE0L3YvRXArdkVkYVQrYzg3Y0FtRkx2QkRKV0IwWTQrYUx3L25HVkx0cThp?=
 =?utf-8?B?UTRuNnovRGlJMFZBUlRDQ3ZaRkZWQUR2Wm5CeXZENlVFU0VuNG5BTklYK0t6?=
 =?utf-8?B?d3FIZkROY0V4aStaSFBpYVk0V2ozYkpSQ3pUazN0Ui9YaXJGbi8zaTFGS1Mx?=
 =?utf-8?B?aklaYTRFQndJVURrRE5IUWNJaFo5bGhEV1FyajFUejB3SFVXcTJXMTAvelVJ?=
 =?utf-8?B?QXRQU0QxanpaakRSbDNjNy82cDd1OXFiaDBqUVgyTDdKYjNrdDQrZ3ZseU9C?=
 =?utf-8?B?amFGdG1CY0t5T21wNS9pOWhRb25nRm8xN045T1JoaU03cTRhVDhKZ3ExTHFr?=
 =?utf-8?B?cXExNjVsYlFBVnI3UEJyRkwyTStDdm1EOU5CZWs1M3RCMktZNUdzV1Q3MURW?=
 =?utf-8?B?ZEZaelExS2VGQWF5M3huOWwydjB0MDZqTG5xWGRHQW1VenNLcFBrMmFzdWlY?=
 =?utf-8?B?R2s1eUIrcXVCd0M0UmJTaS9aWlIyc2FSVWtFTW1SZFZiZ0ZobkRuMnM1Ym9v?=
 =?utf-8?Q?nbE8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b47fbe5-792c-454d-28c0-08db39ea14cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2023 17:36:13.7119
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kAcWfMrRCVbolYfRChG3dl49uVhKh6abdeVF03zk401XL1EWJ3bma4s8repoUs+EP8mcqUcbqgVXnECMlBfxzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7219
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

W1B1YmxpY10NCg0KDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUy1r
LCBTaHlhbS1zdW5kYXIgPFNoeWFtLXN1bmRhci5TLWtAYW1kLmNvbT4NCj4gU2VudDogTW9uZGF5
LCBBcHJpbCAxMCwgMjAyMyAxMjozNQ0KPiBUbzogTGltb25jaWVsbG8sIE1hcmlvIDxNYXJpby5M
aW1vbmNpZWxsb0BhbWQuY29tPjsNCj4gaGRlZ29lZGVAcmVkaGF0LmNvbTsgbWFya2dyb3NzQGtl
cm5lbC5vcmcNCj4gQ2M6IEdvc3dhbWksIFNhbmtldCA8U2Fua2V0Lkdvc3dhbWlAYW1kLmNvbT47
IHBsYXRmb3JtLWRyaXZlci0NCj4geDg2QHZnZXIua2VybmVsLm9yZw0KPiBTdWJqZWN0OiBSZTog
W1BBVENIIDcvOF0gcGxhdGZvcm0veDg2L2FtZDogcG1jOiBHZXQgU1RCIERSQU0gc2l6ZSBmcm9t
DQo+IFBNRlcNCj4gDQo+IA0KPiANCj4gT24gNC8xMC8yMDIzIDI6MTggQU0sIE1hcmlvIExpbW9u
Y2llbGxvIHdyb3RlOg0KPiA+DQo+ID4gT24gNC85LzIzIDEzOjUzLCBTaHlhbSBTdW5kYXIgUyBL
IHdyb3RlOg0KPiA+PiBSZWNlbnQgUE1GVydzIGhhdmUgc3VwcG9ydCBmb3IgcXVlcnlpbmcgdGhl
IFNUQiBEUkFNIHNpemUuIEFkZCB0aGlzDQo+ID4+IHN1cHBvcnQgdG8gdGhlIGRyaXZlci4NCj4g
Pj4NCj4gPj4gQ28tZGV2ZWxvcGVkLWJ5OiBTYW5rZXQgR29zd2FtaSA8U2Fua2V0Lkdvc3dhbWlA
YW1kLmNvbT4NCj4gPj4gU2lnbmVkLW9mZi1ieTogU2Fua2V0IEdvc3dhbWkgPFNhbmtldC5Hb3N3
YW1pQGFtZC5jb20+DQo+ID4+IFNpZ25lZC1vZmYtYnk6IFNoeWFtIFN1bmRhciBTIEsgPFNoeWFt
LXN1bmRhci5TLWtAYW1kLmNvbT4NCj4gPj4gLS0tDQo+ID4+IMKgIGRyaXZlcnMvcGxhdGZvcm0v
eDg2L2FtZC9wbWMuYyB8IDI5DQo+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKystDQo+ID4+
IMKgIDEgZmlsZSBjaGFuZ2VkLCAyOCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4+
DQo+ID4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BsYXRmb3JtL3g4Ni9hbWQvcG1jLmMNCj4gPj4g
Yi9kcml2ZXJzL3BsYXRmb3JtL3g4Ni9hbWQvcG1jLmMNCj4gPj4gaW5kZXggYjE0ZDA2OGE2NDc0
Li44NmYzMmIwMWUzZmYgMTAwNjQ0DQo+ID4+IC0tLSBhL2RyaXZlcnMvcGxhdGZvcm0veDg2L2Ft
ZC9wbWMuYw0KPiA+PiArKysgYi9kcml2ZXJzL3BsYXRmb3JtL3g4Ni9hbWQvcG1jLmMNCj4gPj4g
QEAgLTExNCw2ICsxMTQsNyBAQCBlbnVtIHMyZF9hcmcgew0KPiA+PiDCoMKgwqDCoMKgIFMyRF9Q
SFlTX0FERFJfTE9XLA0KPiA+PiDCoMKgwqDCoMKgIFMyRF9QSFlTX0FERFJfSElHSCwNCj4gPj4g
wqDCoMKgwqDCoCBTMkRfTlVNX1NBTVBMRVMsDQo+ID4+ICvCoMKgwqAgUzJEX0RSQU1fU0laRSwN
Cj4gPj4gwqAgfTsNCj4gPj4gwqAgwqAgc3RydWN0IGFtZF9wbWNfYml0X21hcCB7DQo+ID4+IEBA
IC0xNDYsNiArMTQ3LDcgQEAgc3RydWN0IGFtZF9wbWNfZGV2IHsNCj4gPj4gwqDCoMKgwqDCoCB1
MzIgYmFzZV9hZGRyOw0KPiA+PiDCoMKgwqDCoMKgIHUzMiBjcHVfaWQ7DQo+ID4+IMKgwqDCoMKg
wqAgdTMyIGFjdGl2ZV9pcHM7DQo+ID4+ICvCoMKgwqAgdTMyIGRyYW1fc2l6ZTsNCj4gPj4gwqAg
LyogU01VIHZlcnNpb24gaW5mb3JtYXRpb24gKi8NCj4gPj4gwqDCoMKgwqDCoCB1OCBzbXVfcHJv
Z3JhbTsNCj4gPj4gwqDCoMKgwqDCoCB1OCBtYWpvcjsNCj4gPj4gQEAgLTg5NSwxMSArODk3LDMx
IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcGNpX2RldmljZV9pZCBwbWNfcGNpX2lkc1tdID0NCj4g
ew0KPiA+PiDCoMKgwqDCoMKgIHsgfQ0KPiA+PiDCoCB9Ow0KPiA+PiDCoCArc3RhdGljIGludCBh
bWRfcG1jX2dldF9kcmFtX3NpemUoc3RydWN0IGFtZF9wbWNfZGV2ICpkZXYpDQo+ID4+ICt7DQo+
ID4+ICvCoMKgwqAgaWYgKGRldi0+Y3B1X2lkICE9IEFNRF9DUFVfSURfWUMpDQo+ID4+ICvCoMKg
wqDCoMKgwqDCoCBnb3RvIGVycl9kcmFtX3NpemU7DQo+ID4+ICsNCj4gPj4gK8KgwqDCoCBpZiAo
ZGV2LT5tYWpvciA+IDkwIHx8IChkZXYtPm1ham9yID09IDkwICYmIGRldi0+bWlub3IgPiAzOSkp
DQo+ID4+ICvCoMKgwqDCoMKgwqDCoCBnb3RvIGVycl9kcmFtX3NpemU7DQo+ID4NCj4gPiBJcyB0
aGlzIG9ubHkgZm9yIFlDIGFuZCBub3QgZm9yIFBTPw0KPiANCj4gSXRzIG9ubHkgWUMgZm9yIG5v
dywgYXMgdGhpcyBpcyBpbXBvcnRhbnQgb2YgdGhlIENocm9tZSB3b3JrLiBGVyB0ZWFtDQo+IGhh
cyB0byBzdGlsbCBwb3J0IHRoZSBzYW1lIGNoYW5nZSBmcm9tIFlDIHRvIFBTIGJyYW5jaC4NCj4g
DQo+IE9uY2UgdGhhdCBpcyBkb25lLCB3ZSBjYW4gbWFrZSBvdGhlciBjaGFuZ2VzIHRvby4gQWdy
ZWU/DQo+IA0KDQpTb3VuZHMgZ29vZC4NCg0KPiANCj4gPg0KPiA+IFRoZSB2ZXJzaW9uIGNoZWNr
IEkgdGhpbmsgeW91IHNob3VsZCBtYWtlIGl0IGNsZWFyIGl0J3Mgb25seSBpbnRlbmRlZA0KPiA+
IGZvciB0aGlzIHByb2dyYW0uDQo+ID4NCj4gPiBzd2l0Y2goZGV2LT5jcHVfaWQpIHsNCj4gPiBj
YXNlIEFNRF9DUFVfSURfWUM6DQo+ID4gwqDCoMKgIGlmICh2ZXJzaW9uX2NoZWNrKQ0KPiA+IMKg
wqDCoCDCoMKgwqAgZ290byBlcnJfZHJhbV9zaXplOw0KPiA+IMKgwqDCoCBicmVhazsNCj4gPg0K
PiA+IGRlZmF1bHQ6DQo+ID4gwqDCoMKgIGdvdG8gZXJyX2RyYW1fc2l6ZTsNCj4gPg0KPiA+IH0N
Cj4gPg0KPiA+IFRoZW4gd2hlbiBpdCBjb21lcyB0aW1lIHRvIGFkZCBhbm90aGVyIHN5c3RlbSBp
dCBlaXRoZXIgd2lsbCBuZWVkIGENCj4gPiBsb2NhbGl6ZWQNCj4gPiB2ZXJzaW9uIGNoZWNrIG9y
IGl0IHdpbGwganVzdCBiZSBzdXBwb3J0ZWQgYW5kIG5vIGNoZWNrIG5lZWRlZC4gRWl0aGVyDQo+
ID4gd2F5IGl0DQo+ID4gaXMgY2xlYW5lciBpbiB0aGUgY29kZS4NCj4gPg0KPiA+PiArDQo+ID4+
ICvCoMKgwqAgYW1kX3BtY19zZW5kX2NtZChkZXYsIFMyRF9EUkFNX1NJWkUsICZkZXYtPmRyYW1f
c2l6ZSwNCj4gPj4gU1RCX1NQSUxMX1RPX0RSQU0sIDEpOw0KPiA+PiArwqDCoMKgIGlmICghZGV2
LT5kcmFtX3NpemUpDQo+ID4+ICvCoMKgwqDCoMKgwqDCoCBnb3RvIGVycl9kcmFtX3NpemU7DQo+
ID4+ICsNCj4gPj4gK8KgwqDCoCByZXR1cm4gMDsNCj4gPj4gKw0KPiA+PiArZXJyX2RyYW1fc2l6
ZToNCj4gPj4gK8KgwqDCoCBkZXZfZXJyKGRldi0+ZGV2LCAiRFJBTSBzaXplIGNvbW1hbmQgbm90
IHN1cHBvcnRlZCBmb3IgdGhpcw0KPiA+PiBwbGF0Zm9ybVxuIik7DQo+ID4+ICvCoMKgwqAgcmV0
dXJuIC1FSU5WQUw7DQo+ID4+ICt9DQo+ID4+ICsNCj4gPj4gwqAgc3RhdGljIGludCBhbWRfcG1j
X3MyZF9pbml0KHN0cnVjdCBhbWRfcG1jX2RldiAqZGV2KQ0KPiA+PiDCoCB7DQo+ID4+IMKgwqDC
oMKgwqAgdTMyIHBoeXNfYWRkcl9sb3csIHBoeXNfYWRkcl9oaTsNCj4gPj4gwqDCoMKgwqDCoCB1
NjQgc3RiX3BoeXNfYWRkcjsNCj4gPj4gwqDCoMKgwqDCoCB1MzIgc2l6ZSA9IDA7DQo+ID4+ICvC
oMKgwqAgaW50IHJldDsNCj4gPj4gwqAgwqDCoMKgwqDCoCAvKiBTcGlsbCB0byBEUkFNIGZlYXR1
cmUgdXNlcyBzZXBhcmF0ZSBTTVUgbWVzc2FnZSBwb3J0ICovDQo+ID4+IMKgwqDCoMKgwqAgZGV2
LT5tc2dfcG9ydCA9IDE7DQo+ID4+IEBAIC05MDgsNiArOTMwLDExIEBAIHN0YXRpYyBpbnQgYW1k
X3BtY19zMmRfaW5pdChzdHJ1Y3QNCj4gYW1kX3BtY19kZXYgKmRldikNCj4gPj4gwqDCoMKgwqDC
oCBpZiAoc2l6ZSAhPSBTMkRfVEVMRU1FVFJZX0JZVEVTX01BWCkNCj4gPj4gwqDCoMKgwqDCoMKg
wqDCoMKgIHJldHVybiAtRUlPOw0KPiA+PiDCoCArwqDCoMKgIC8qIEdldCBEUkFNIHNpemUgKi8N
Cj4gPj4gK8KgwqDCoCByZXQgPSBhbWRfcG1jX2dldF9kcmFtX3NpemUoZGV2KTsNCj4gPj4gK8Kg
wqDCoCBpZiAocmV0KQ0KPiA+PiArwqDCoMKgwqDCoMKgwqAgZGV2LT5kcmFtX3NpemUgPSBTMkRf
VEVMRU1FVFJZX0RSQU1CWVRFU19NQVg7DQo+ID4+ICsNCj4gPj4gwqDCoMKgwqDCoCAvKiBHZXQg
U1RCIERSQU0gYWRkcmVzcyAqLw0KPiA+PiDCoMKgwqDCoMKgIGFtZF9wbWNfc2VuZF9jbWQoZGV2
LCBTMkRfUEhZU19BRERSX0xPVywgJnBoeXNfYWRkcl9sb3csDQo+ID4+IFNUQl9TUElMTF9UT19E
UkFNLCAxKTsNCj4gPj4gwqDCoMKgwqDCoCBhbWRfcG1jX3NlbmRfY21kKGRldiwgUzJEX1BIWVNf
QUREUl9ISUdILCAmcGh5c19hZGRyX2hpLA0KPiA+PiBTVEJfU1BJTExfVE9fRFJBTSwgMSk7DQo+
ID4+IEBAIC05MTcsNyArOTQ0LDcgQEAgc3RhdGljIGludCBhbWRfcG1jX3MyZF9pbml0KHN0cnVj
dCBhbWRfcG1jX2Rldg0KPiAqZGV2KQ0KPiA+PiDCoMKgwqDCoMKgIC8qIENsZWFyIG1zZ19wb3J0
IGZvciBvdGhlciBTTVUgb3BlcmF0aW9uICovDQo+ID4+IMKgwqDCoMKgwqAgZGV2LT5tc2dfcG9y
dCA9IDA7DQo+ID4+IMKgIC3CoMKgwqAgZGV2LT5zdGJfdmlydF9hZGRyID0gZGV2bV9pb3JlbWFw
KGRldi0+ZGV2LCBzdGJfcGh5c19hZGRyLA0KPiA+PiBTMkRfVEVMRU1FVFJZX0RSQU1CWVRFU19N
QVgpOw0KPiA+PiArwqDCoMKgIGRldi0+c3RiX3ZpcnRfYWRkciA9IGRldm1faW9yZW1hcChkZXYt
PmRldiwgc3RiX3BoeXNfYWRkciwNCj4gPj4gZGV2LT5kcmFtX3NpemUpOw0KPiA+PiDCoMKgwqDC
oMKgIGlmICghZGV2LT5zdGJfdmlydF9hZGRyKQ0KPiA+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0
dXJuIC1FTk9NRU07DQo+ID4+DQo=
