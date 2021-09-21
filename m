Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B85A6C433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue, 21 Sep 2021 14:29:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A04F060FA0
	for <platform-driver-x86@archiver.kernel.org>; Tue, 21 Sep 2021 14:29:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233634AbhIUObZ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 21 Sep 2021 10:31:25 -0400
Received: from mail-mw2nam12on2083.outbound.protection.outlook.com ([40.107.244.83]:32064
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233569AbhIUObY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 21 Sep 2021 10:31:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CFmylVC/5p3NZcjKJldgHw9yBjRskQtst/fEiwPY41f6ObfR/TSboZ8KuZnd1T5Flp1D0jwhNzFDmiG+WPb1toZXViKAcdBOdVDkYh9XeU5O4b/m4t+Swab6vFtV5EEQIPed5MHaDGJGPmStU7VrNAU15Fi1rqe14S6QNe953WVibGjXmP52JMSIfxkaNqJDQDRAqlYlkhi8yaIHm/cfVrosnjk8gUxSbtiIiM8lzkUZZxOIDmosu02jKFR27cG6Xsk/FxB1KeXv+lGOxHA5wJS+rWLxgxE4T0rj4bYiHVz4avarbGmxkaVncDtDgj6HrKEaDni6SGERCPAgI/+6pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=oLf7+TQlniyU4sSKRfPoo5awG+yaBRTFudtLGM8mC6Y=;
 b=Pk8Z3ioO5+DtfCKu4hYmMbyJkf/nLEP5coShO9mwdE/bL25GHt54ypUDTMeM1VpFg8g78GBt0jq0UYInSfDIvDAMoIZUn/akqX1YmHM9RTdU0B47dLJWLuXb467hfJslfnxuhuPpaTVt/xvSrt1VzeXLhYg1UjFXUXAS2LZ/CxgNmcMbsbHFUZooekpi+eHg996NkxWYqoiM4Jn4Hj19M32hz0w9UG73O+dTa47xVTPYKRnvvahj1aCjN2eVHRwwMZfQF65h0RqZYuzVKaK+sdLR78a5B3GBB/MkzfGXNAsOOz5IQjdN6XCEj91/csMx7/QOq6KJn+vDyawWZx93Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oLf7+TQlniyU4sSKRfPoo5awG+yaBRTFudtLGM8mC6Y=;
 b=ZLm2IHx1aC34gjCmLxzICMuw5P/j8nT4CBoj17RxU802HtlgCmHekeRUiJiss89K9B3fCtz4kyiuuNSO4u1ktb3NSuLopF7V7qz+jsAQjsX8AR5NfNtySPvwe6Tx7YQVeInmvIw4wSkQb4uGl0hVsl98xTaF/822EYRBOzfJW0xxLKxabwBmPZiKXL9BqaM4QP+ZPvWMexra2P5VE3uZNPCwLUQk7NURGAPmuo1jHGzuhfikmGy+fg4kkxMTfmdSCqeg8fJYyRSfVhPwpiUN8Plk/SUTPre+Kq1S6Fsk6gKe3ihI9bXrXbOS1RHGRiQYc1WjKWN1Fl51yS4difARlQ==
Received: from DM6PR12MB2763.namprd12.prod.outlook.com (2603:10b6:5:48::16) by
 DM5PR1201MB0044.namprd12.prod.outlook.com (2603:10b6:4:54::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.16; Tue, 21 Sep 2021 14:29:54 +0000
Received: from DM6PR12MB2763.namprd12.prod.outlook.com
 ([fe80::9c74:5831:5412:9ba5]) by DM6PR12MB2763.namprd12.prod.outlook.com
 ([fe80::9c74:5831:5412:9ba5%3]) with mapi id 15.20.4523.018; Tue, 21 Sep 2021
 14:29:54 +0000
From:   Daniel Dadap <ddadap@nvidia.com>
To:     Hans de Goede <hdegoede@redhat.com>
CC:     =?utf-8?B?UGFsaSBSb2jDoXI=?= <pali@kernel.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "mario.limonciello@outlook.com" <mario.limonciello@outlook.com>,
        "pobrn@protonmail.com" <pobrn@protonmail.com>,
        "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>,
        Aaron Plattner <aplattner@nvidia.com>,
        =?utf-8?B?VGhvbWFzIFdlacOfc2NodWg=?= <linux@weissschuh.net>
Subject: Re: [PATCH v6] platform/x86: Add driver for ACPI WMAA EC-based
 backlight control
Thread-Topic: [PATCH v6] platform/x86: Add driver for ACPI WMAA EC-based
 backlight control
Thread-Index: AQHXoFyMqt1KOoaWpUidFYXV4TUqlKuhu0AAgAtLBYCAAAEoAIAABPcAgAGS/4CAAAotaQ==
Date:   Tue, 21 Sep 2021 14:29:54 +0000
Message-ID: <A116D719-A0BD-4FA5-A758-E48D6428A8A6@nvidia.com>
References: <e63904b7-105b-4401-bd40-82854b7d42d1@t-8ch.de>
 <20210903003838.15797-1-ddadap@nvidia.com>
 <11ffe8bc-b4ee-c451-9860-46997de8fe55@redhat.com>
 <20210920132911.cus27elz36dme63g@pali>
 <8b07125d-83b9-9de4-fd52-1cb01466364a@redhat.com>
 <20210920135106.y6mi57bcmurczmka@pali>
 <57a958e2-93d7-3eea-ec7b-9496acd6aae5@redhat.com>
In-Reply-To: <57a958e2-93d7-3eea-ec7b-9496acd6aae5@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0ea4618d-7072-4c1b-ee93-08d97d0c47c4
x-ms-traffictypediagnostic: DM5PR1201MB0044:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR1201MB004457DBD9430977BD336193BCA19@DM5PR1201MB0044.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: T4ekd+tk7dlplNiOSGT5UqdXLCxg/6VUv1AdUoFZlWdTKHV5mILiR7GhdPlYZKeWuUL/LbZmOR+dK3/l7T3BKLn+5ivGb5LU5/SCKUW6PR8AGaLXLTRJAN0akeUhhGC3CVWF0ft8jHrYEupwdA5RHixLs9FYCanssuw2Zd1grk2dC60v5/OtvfppiAKKn1a/wq+qaCj7MGfTIZ3Jx+1CsFLXPJMNt/hZdNvuZbK7zW73GLl2IwrsGkVeIM4dpKrVEcOhsGnMuey+Yk7ukm426qeL2S9h2DmGM+gRZZ9kNJXsjv9PTzYn7JD15QvrEN4jCfJ9WfM0eROr6d3Q7n/GdFi91tlqREZ2Errh/yzjN7WOXDZ0dJv/HtjhtI180T5oemCX7gx2Vdzv2cptrMOjnWRws+sKioO/1YAsdZ/F+CHzUNeRG/hjZ5pX7RzlwW/KGh6SWuPYXVWC0c2/RMmP2p7o65GEMKbIegqSyCclEYwseAjBXc4UzN17uVipLgvCPHBdfm6477wpa8vvYn6zP9bPNUpa6gFqIvNufEInNM3X9GPZNTFLHR21+EHJA+txTYXSvLfs+AT3fQEZzVA1u2wTtq7K8egkCv+B7q8gla/BvxwA5lS2An8mfqMY9kK6m3dyz5h3kJzGcz3YPOh4d32bjufDVHCjT2v6uMx//sbrJKyeOrvQ+pGPmy+0YZtSKAr+qsECMJ4tSL40jX9YhlnVqhfKYNSTyLqtvcpNufjI+2VyqI1yBCbQ9lpEAKueZP09COtlTJvd22PpUJP98RvbBxBxJAg+LH/DADhk8g7pwkYwNBF9/rPIxGFLXvgd
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB2763.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(64756008)(66446008)(76116006)(2906002)(66946007)(66574015)(66556008)(91956017)(54906003)(66476007)(508600001)(83380400001)(71200400001)(36756003)(966005)(4326008)(6512007)(316002)(8676002)(33656002)(8936002)(2616005)(5660300002)(86362001)(6916009)(6506007)(53546011)(26005)(38070700005)(38100700002)(186003)(122000001)(6486002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aXRqNVg2SG9zbTlTbGttdGFnU2pOZXRUK3VZYmhnKzkySGVqclBGTm1zTTZP?=
 =?utf-8?B?d25ORXlUZjJaMGQrd1IwNjJNMVhXMG1Eb0VmRkVwSzh3MVlHM0FLbGIyLzBw?=
 =?utf-8?B?SnFwWGtsY2lpZE9XeVRLVTJsMWl6Wmxua0FMWGpBcUx5ZlRHMGpBTDB1L2Ry?=
 =?utf-8?B?VDJhMEVjakU1ZjdCZWhoYUl3NnhTak82dXFzeXRHUHhSeVRVRU84dmFkWkV3?=
 =?utf-8?B?eGpkQ3VhT2Q1aEJFeTBxdW9NUDVSODladTZwbG9rRmNBaERiMHhTWHhsNUsv?=
 =?utf-8?B?b1NxTjVEWmJpbnc5T014WXFlcHR3V01nblpiSlBZam5mVm4ycVNnRExRSjI5?=
 =?utf-8?B?aHZZdFF3elBsTVFvS1R3bjlJZSttbWVJaWZvYllZTXZha1JtcnFJK21iSExI?=
 =?utf-8?B?ZHdOWGgyL1VNZ1ZsVW5RYytNKzV3VkJKbThudUFaSGllWms4T0NidjArN2x4?=
 =?utf-8?B?M1o2QkZHUG42NFVnRVFqYWcxOHN4dkxxTDdLY29BUzNwZEVjS1dkZWpoaHhK?=
 =?utf-8?B?WXRlNzZTb0NXVUpIT1YxSWZSOXVxNndyalUxNjVaUmxzQSs3L3pJUC94MEh2?=
 =?utf-8?B?dlppcVMxTkZMaTZxVUtwR0hWaEFTNW1ZdDNLd2l6M2FvM1Bhb29rL2krVTR3?=
 =?utf-8?B?bmJoSmw4T1RBeG82UWJxZE1ud2xnc3kvN0lROTlUQ2IzTUg1bVFGTkI2Zy9Z?=
 =?utf-8?B?MnNhZUZNNG1RbVRxaVAvR0J2cm1zZlpOYmlkSnlScklRQWJINjlCWVlwMDZ6?=
 =?utf-8?B?MXNaeHlLcDMxa3ZpZWhjdzhZbWw1dm1VN2RnQUF5eXp2Yjl3c3RCZlVCTmxX?=
 =?utf-8?B?cXBMcWJITnl3dVAzc1dlY1FwVi9iMkdaYXBzc1JkZ04yMWh1LzZsb1dhWm50?=
 =?utf-8?B?Q2hDMi82ckhibHVnWG9XalczS3ErOW9HYnozQ0RKbXlSb1VGWHBhRzlFWHpa?=
 =?utf-8?B?eXBzS2FHSTg5L25LUVIwUnBBcVBhSHBwNDFmQ3BYTDRBU292TmtTcStkREE3?=
 =?utf-8?B?N1M3alZrREZZS09aU0owM29NZ2QvWkFEemlKUTBnK3RiYzNVcVBIS3Y2bGdu?=
 =?utf-8?B?NndqaVRvTHF0Wmk2emlzQXE0V2VHU1FOTkhFSUZpRlMvcmNIZUZDK0VLOUQy?=
 =?utf-8?B?R0NYNmpPcHA1LysvZ0E3VEVkbXE4WEJ0VUlxSkhkUVlWbUtFWUlodXRQanRq?=
 =?utf-8?B?OVM1UVU5dXdBT2VuU296Y3JnZmlmdFFCRExjcVUxZFViV3ZNemU2SUgxZFhH?=
 =?utf-8?B?RFRiZ3JtcUpZaG53NnJjWSt6V1FLQWVKdUlXc0RlWlZSNTNWQmhVK0VXS2ZI?=
 =?utf-8?B?NXAzeDNiZERhOWg2MW0xc2tMbHZyazZ0ZGQzUTVHNEt6OWRpTXRlL05YREFB?=
 =?utf-8?B?NGZnWkNoQ1JvRXBUR01GN1ZMZXFSVnQ3dFdUeCtybGtBbGtoektpT0hqWTFG?=
 =?utf-8?B?a1R4QnVQcFMxY2xYV2RkSWFnM25uWUxlOFJuQWVIcE5TN1doaW1hYll0YXNo?=
 =?utf-8?B?TTVRaU1LU2VJVC84dDFHaWl4VW5JbmdlR0ZBRHYrQ0NFRUJjRXBRUjBhRzdZ?=
 =?utf-8?B?Q2dqUkkyRE9kWXlZaGpHVWExRC9QYmZOL1llVDZ1M3V3cHNZUlBibC9vTmxo?=
 =?utf-8?B?WDlnSUQ1MXhIY2tmYXZPZXZiOUd6b25ZUTRpT0t0M0VWNC9wd2p5b0dYWGUr?=
 =?utf-8?B?czIvc0JWb0NYMjRTNGlncGlPTnV3SXVkMVl5dWg1dVBuRTlGVlhkTEFIT0p4?=
 =?utf-8?Q?D6Oy/LhYUj20cBVMM4VRE4FenbJix0BrrDhiJze?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2763.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ea4618d-7072-4c1b-ee93-08d97d0c47c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2021 14:29:54.6034
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6u2W8DHvTuZofX9w2LpFOlHyyg8tH1Lr9nNvDoYF+fZ/QjVD8y0VkQFZhdaFUndRbw+7SsGuazDp3Jg+UTfIyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0044
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

DQo+IE9uIFNlcCAyMSwgMjAyMSwgYXQgMDg6NTMsIEhhbnMgZGUgR29lZGUgPGhkZWdvZWRlQHJl
ZGhhdC5jb20+IHdyb3RlOg0KPiANCj4g77u/SGksDQo+IA0KPj4gT24gOS8yMC8yMSAzOjUxIFBN
LCBQYWxpIFJvaMOhciB3cm90ZToNCj4+PiBPbiBNb25kYXkgMjAgU2VwdGVtYmVyIDIwMjEgMTU6
MzM6MjAgSGFucyBkZSBHb2VkZSB3cm90ZToNCj4+PiBIaSBQYWxpLA0KPj4+IA0KPj4+IE9uIDkv
MjAvMjEgMzoyOSBQTSwgUGFsaSBSb2jDoXIgd3JvdGU6DQo+Pj4+IE9uIE1vbmRheSAxMyBTZXB0
ZW1iZXIgMjAyMSAxMTowMTo1MCBIYW5zIGRlIEdvZWRlIHdyb3RlOg0KPj4+Pj4gSGksDQo+Pj4+
PiANCj4+Pj4+IE9uIDkvMy8yMSAyOjM4IEFNLCBEYW5pZWwgRGFkYXAgd3JvdGU6DQo+Pj4+Pj4g
QSBudW1iZXIgb2YgdXBjb21pbmcgbm90ZWJvb2sgY29tcHV0ZXIgZGVzaWducyBkcml2ZSB0aGUg
aW50ZXJuYWwNCj4+Pj4+PiBkaXNwbGF5IHBhbmVsJ3MgYmFja2xpZ2h0IFBXTSB0aHJvdWdoIHRo
ZSBFbWJlZGRlZCBDb250cm9sbGVyIChFQykuDQo+Pj4+Pj4gVGhpcyBFQy1iYXNlZCBiYWNrbGln
aHQgY29udHJvbCBjYW4gYmUgcGx1bWJlZCB0aHJvdWdoIHRvIGFuIEFDUEkNCj4+Pj4+PiAiV01B
QSIgbWV0aG9kIGludGVyZmFjZSwgd2hpY2ggaW4gdHVybiBjYW4gYmUgd3JhcHBlZCBieSBXTUkg
d2l0aA0KPj4+Pj4+IHRoZSBHVUlEIGhhbmRsZSA2MDNFOTYxMy1FRjI1LTQzMzgtQTNEMC1DNDYx
Nzc1MTZEQjcuDQo+Pj4+Pj4gDQo+Pj4+Pj4gQWRkIGEgbmV3IGRyaXZlciwgYWxpYXNlZCB0byB0
aGUgV01BQSBXTUkgR1VJRCwgdG8gZXhwb3NlIGEgc3lzZnMNCj4+Pj4+PiBiYWNrbGlnaHQgY2xh
c3MgZHJpdmVyIHRvIGNvbnRyb2wgYmFja2xpZ2h0IGxldmVscyBvbiBzeXN0ZW1zIHdpdGgNCj4+
Pj4+PiBFQy1kcml2ZW4gYmFja2xpZ2h0cy4NCj4+Pj4+PiANCj4+Pj4+PiBTaWduZWQtb2ZmLWJ5
OiBEYW5pZWwgRGFkYXAgPGRkYWRhcEBudmlkaWEuY29tPg0KPj4+Pj4+IFJldmlld2VkLUJ5OiBU
aG9tYXMgV2Vpw59zY2h1aCA8bGludXhAd2Vpc3NzY2h1aC5uZXQ+DQo+Pj4+PiANCj4+Pj4+IFRo
YW5rIHlvdSBmb3IgeW91ciBwYXRjaCwgSSd2ZSBhcHBsaWVkIHRoaXMgcGF0Y2ggdG8gbXkgcmV2
aWV3LWhhbnMgDQo+Pj4+PiBicmFuY2g6DQo+Pj4+PiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1
Yi9zY20vbGludXgva2VybmVsL2dpdC9wZHg4Ni9wbGF0Zm9ybS1kcml2ZXJzLXg4Ni5naXQvbG9n
Lz9oPXJldmlldy1oYW5zDQo+Pj4+PiANCj4+Pj4+IE5vdGUgaXQgd2lsbCBzaG93IHVwIGluIG15
IHJldmlldy1oYW5zIGJyYW5jaCBvbmNlIEkndmUgcHVzaGVkIG15DQo+Pj4+PiBsb2NhbCBicmFu
Y2ggdGhlcmUsIHdoaWNoIG1pZ2h0IHRha2UgYSB3aGlsZS4NCj4+Pj4+IA0KPj4+Pj4gT25jZSBJ
J3ZlIHJ1biBzb21lIHRlc3RzIG9uIHRoaXMgYnJhbmNoIHRoZSBwYXRjaGVzIHRoZXJlIHdpbGwg
YmUNCj4+Pj4+IGFkZGVkIHRvIHRoZSBwbGF0Zm9ybS1kcml2ZXJzLXg4Ni9mb3ItbmV4dCBicmFu
Y2ggYW5kIGV2ZW50dWFsbHkNCj4+Pj4+IHdpbGwgYmUgaW5jbHVkZWQgaW4gdGhlIHBkeDg2IHB1
bGwtcmVxdWVzdCB0byBMaW51cyBmb3IgdGhlIG5leHQNCj4+Pj4+IG1lcmdlLXdpbmRvdy4NCj4+
Pj4gDQo+Pj4+IEhlbGxvIEhhbnMhDQo+Pj4+IA0KPj4+PiBJIHdvdWxkIHN1Z2dlc3QgdG8gcmVu
YW1lIHRoaXMgZHJpdmVyIGFuZCBjb25maWcgb3B0aW9uIHRvIG5vdCBpbmNsdWRlDQo+Pj4+IC1B
QSBpbiBpdHMgbmFtZS4gV01BQSBpcyBqdXN0IGludGVybmFsIG5hbWUgb2YgQUNQSSBtZXRob2Qs
IGNvbXBvc2VkDQo+Pj4+IGZyb20gdHdvIHBhcnRzOiAiV00iIGFuZCAiQUEiLiBTZWNvbmQgcGFy
dCAiQUEiIGlzIHJlYWQgZnJvbSB0aGUgX1dERw0KPj4+PiB3aGVyZSBpcyB0aGUgdHJhbnNsYXRp
b24gdGFibGUgZnJvbSBXTUkgR1VJRCAoaW4gdGhpcyBjYXNlIDYwM0U5NjEzLi4uKQ0KPj4+PiB0
byBBQ1BJIG1ldGhvZCBuYW1lLiAiQUEiIGlzIGp1c3QgYXV0b2dlbmVyYXRlZCBpZGVudGlmaWVy
IGJ5IHdtaQ0KPj4+PiBjb21waWxlciBhbmQgYmVjYXVzZSBuYW1lcyBhcmUgQVNDSUkgc3RyaW5n
cywgSSBndWVzcyAiQUEiIGNvdWxkIG1lYW4NCj4+Pj4gdGhlIGZpcnN0IChhdXRvZ2VuZXJhdGVk
KSBtZXRob2QuIEluIHRoZSB3aG9sZSBkcml2ZXIgY29kZSB5b3UgYXJlIG5vdA0KPj4+PiB1c2lu
ZyBBQSBmdW5jdGlvbiBuYW1lLCBidXQgZGlyZWN0bHkgV01JIEdVSUQsIHdoaWNoIGFsc28gbWVh
bnMgdGhhdA0KPj4+PiBkcml2ZXIgaXMgcHJlcGFyZWQgaWYgdmVuZG9yICJyZWNvbXBpbGVzIiB3
bWkgY29kZSBpbiBhY3BpIChhbmQgY29tcGlsZXINCj4+Pj4gZ2VuZXJhdGVzIGFub3RoZXIgaWRl
bnRpZmllciwgbm90IEFBKS4gQWxzbyBhbm90aGVyIGFyZ3VtZW50IGlzIHRoYXQNCj4+Pj4gdGhl
cmUgY2FuIGJlIGxvdCBvZiBvdGhlciBsYXB0b3BzIHdoaWNoIGhhdmUgV01BQSBBQ1BJIG1ldGhv
ZCBidXQgdGhleQ0KPj4+PiBjYW4gaGF2ZSBkaWZmZXJlbnQgQVBJIG9yIGRvIHNvbWV0aGluZyB0
b3RhbGx5IGRpZmZlcmVudC4gU28gbmFtZSBXTUFBDQo+Pj4+IGlzIGluIHRoaXMgd21pIGNvbnRl
eHQgdmVyeSBtaXNsZWFkaW5nLiBSYXRoZXIgaXQgc2hvdWxkIGJlIG5hbWVkIGJ5DQo+Pj4+IHZl
bmRvci4NCj4+PiANCj4+PiBSaWdodCwgdGhhdCBpcyBhIHZlcnkgdmFsaWQgcG9pbnQuIEkgc2hv
dWxkIGhhdmUgc3BvdHRlZCB0aGlzIG15c2VsZi4NCj4+PiANCj4+PiBTbyB3aGF0IHdvdWxkIGJl
IGEgYmV0dGVyIG5hbWUgd21pLW52aWRpYS1iYWNrbGlnaHQua28gSSBndWVzcyA/DQo+Pj4gKGFu
ZCB1cGRhdGUgdGhlIHJlc3QgdG8gbWF0Y2ggPykNCj4+IA0KPj4gSXQgbG9va3MgbGlrZSB0aGF0
IG5vIHZlbmRvciBkcml2ZXIgc3RhcnRzIHdpdGggIndtaS0iIHByZWZpeC4gIi13bWkiDQo+PiBz
dHJpbmcgaXMgdXNlZCBhcyBhIHN1ZmZpeC4gU28gZm9yIGNvbnNpc3RlbmN5IGl0IHdvdWxkIGJl
IGJldHRlciB0bw0KPj4gY2hvb3NlICJudmlkaWEtYmFja2xpZ2h0LXdtaS5rbyIuDQo+IA0KPiBS
aWdodCwgSSBzaG91bGQgaGF2ZSBjaGVja2VkIGZpcnN0Lg0KPiANCj4gU28gSSBqdXN0IGNoZWNr
ZWQgYW5kIHRoZSBzdGFuZGFyZCBwYXR0ZXJuIHVzZWQgaXM6DQo+IHZlbmRvcl93bWlfZmVhdHVy
ZQ0KPiANCj4gU28gbGV0cyBnbyB3aXRoIG52aWRpYV93bWlfYmFja2xpZ2h0LmtvDQo+IA0KPiBE
YW5pZWwsIGNhbiB5b3UgcHJlcGFyZSBhIHBhdGNoIG9uIHRvcCBvZiB5b3VyIG1lcmdlZCBwYXRj
aCB0byBkbw0KPiB0aGUgcmVuYW1lIG9mIHRoZSBLY29uZmlnIGVudHJ5IGFuZCB0aGUgbW9kdWxl
LW5hbWUgcGxlYXNlPw0KPiANCg0KWWVzLCBJIGFscmVhZHkgaGFkIGEgcGF0Y2ggcHJlcGFyZWQg
dG8gcmVuYW1lIHRoaW5ncyB0byBudmlkaWEtYmFja2xpZ2h0LXdtaTsgSSBhbSB3YWl0aW5nIHRv
IGhlYXIgYmFjayBmcm9tIHNvbWUgZm9sa3MgaWYgdGhlcmXigJlzIGEgbW9yZSBzcGVjaWZpYyBu
YW1lIHRoYXQgbWlnaHQgYmUgYXBwcm9wcmlhdGUgKGUuZy4gYSBuYW1lIG9mIGEgcGFydGljdWxh
ciBmZWF0dXJlIHRpZWQgdG8gdGhpcykgb3IgaWYgaXQgc2hvdWxkIGJlIG1vcmUgZ2VuZXJpYyAo
ZS5nLiwgaWYgdGhlcmUgaXMgYSBzdHJvbmcgcG9zc2liaWxpdHkgdGhpcyBkZXNpZ24gbWF5IGJl
IHVzZWQgaW4gc3lzdGVtcyB3aXRoIG5vIE5WSURJQSBHUFUpOyB3aGlsZSBJ4oCZbSB3YWl0aW5n
IGZvciB0aG9zZSBhbnN3ZXJzLCBJ4oCZbGwgc3dpdGNoIHRvIG52aWRpYS13bWktYmFja2xpZ2h0
IGFzIHRoZSBhc3N1bWVkIG9wdGlvbiwgaWYgdGhlcmUgaXNu4oCZdCBzb21ldGhpbmcgbW9yZSBh
cHByb3ByaWF0ZS4NCg0KPiBSZWdhcmRzLA0KPiANCj4gSGFucw0KPiANCg==
