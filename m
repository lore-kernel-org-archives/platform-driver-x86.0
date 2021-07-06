Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA1F0C07E96
	for <platform-driver-x86@archiver.kernel.org>; Tue,  6 Jul 2021 17:20:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C661861C5C
	for <platform-driver-x86@archiver.kernel.org>; Tue,  6 Jul 2021 17:20:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230141AbhGFRXR (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 6 Jul 2021 13:23:17 -0400
Received: from mga04.intel.com ([192.55.52.120]:11415 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230356AbhGFRXQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 6 Jul 2021 13:23:16 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10037"; a="207334541"
X-IronPort-AV: E=Sophos;i="5.83,329,1616482800"; 
   d="scan'208";a="207334541"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2021 10:20:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,329,1616482800"; 
   d="scan'208";a="563385873"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
  by fmsmga001.fm.intel.com with ESMTP; 06 Jul 2021 10:20:35 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 6 Jul 2021 10:20:35 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 6 Jul 2021 10:20:34 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Tue, 6 Jul 2021 10:20:34 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.4; Tue, 6 Jul 2021 10:20:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZKmRaU3sXYv/YEqq/jNnTBFVsuryDXWNpPgab6CuY7VacCpmHwGHexhVYnCchIwh+l0//HVkvGay/5eP5nVi/yi5YWSqSV3mwdNParnOaAFtVGs1HFWj8O9DaHMjzLek6YQM+dooM+qeTc7yfxV/fQZG3JSQTkEdo5njXq8y44Zcz0r7OtT4IUjqQbZvULHz2039pR4ARu/95xvFMsZjh0WnHO1nJvb2WYh/fsdF3Ivdw2rSsZINHUDAfs9nh23mLN5KTWMjiRcr1HsUDlIJsh/IM9vYIJyewhfaCkH/iqCwNylzNQ5pvOx13BQ6Yoby2R8IWHV5WSR4Kzz4J7R9Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ADwbaHrrCn1CcogKBOgEnk7WiCBZCpWRgvBlKy2fR2I=;
 b=TWhW/CJhuCcxXKZrBQGEJhggJvfeJkFuGG/veIdEU95ADfaVu39BfhWXiFvSxKOkND+7rLwvb26qY7EKpV+GXjPhAjmpO7RHVMUW6UabhAbRfE9PAbkpyyeD49JrETurC31BRS3gDskkmQ7L1oTu2phdHBXNgSl8FwYRO0yqcMNu6RDB6yf1JVAZamVRnYrK5s/SLQm9eglfeeJTBpweRHW/oZACTcIm3IfAYtDE6lJDsNSD7Nfd5iHOw1awpZT+v6eOJ+T1coXM/gDZhj1520OaU1cl+HaB1upivgPHqXdFz4zYlBCorCR2RwWskI3LH2wqS9sRm1QZBMAtXhtTWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ADwbaHrrCn1CcogKBOgEnk7WiCBZCpWRgvBlKy2fR2I=;
 b=Ah+oqRO9f7Nukc6xvC0v9JZ9G7ymi5uC6HxqRgFWXWaXTb+qrkBctrUfLzFspBLYYx5MvDqx1J5390nmvfgLqioa771c6JmonX3cOGWAWjs8VGp9pzE/cJrtAk7Q1G8VY3oIfzP6Zqya4eiYB3UBQt9MPEQhtb6ILBUup4M+Gr8=
Received: from MW3PR11MB4523.namprd11.prod.outlook.com (2603:10b6:303:5b::16)
 by CO1PR11MB4819.namprd11.prod.outlook.com (2603:10b6:303:91::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Tue, 6 Jul
 2021 17:20:32 +0000
Received: from MW3PR11MB4523.namprd11.prod.outlook.com
 ([fe80::a87d:ca62:f143:7464]) by MW3PR11MB4523.namprd11.prod.outlook.com
 ([fe80::a87d:ca62:f143:7464%7]) with mapi id 15.20.4287.033; Tue, 6 Jul 2021
 17:20:32 +0000
From:   "Kammela, Gayatri" <gayatri.kammela@intel.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
CC:     "mgross@linux.intel.com" <mgross@linux.intel.com>,
        "irenic.rajneesh@gmail.com" <irenic.rajneesh@gmail.com>,
        "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "Box, David E" <david.e.box@intel.com>
Subject: RE: [PATCH v1 0/4] Add Alder Lake PCH-S support to PMC core driver
Thread-Topic: [PATCH v1 0/4] Add Alder Lake PCH-S support to PMC core driver
Thread-Index: AQHXbuksGoxx3VkXc0OIDyPYbcQjk6s10WEAgABmYlA=
Date:   Tue, 6 Jul 2021 17:20:32 +0000
Message-ID: <MW3PR11MB4523DDB3B1FAB3A4EB224183F21B9@MW3PR11MB4523.namprd11.prod.outlook.com>
References: <cover.1625191274.git.gayatri.kammela@intel.com>
 <730127ef-9569-9c16-08f9-6d86b4e18337@redhat.com>
In-Reply-To: <730127ef-9569-9c16-08f9-6d86b4e18337@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.6.100.41
dlp-reaction: no-action
dlp-product: dlpe-windows
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 87e3a338-d62b-4a2a-71fe-08d940a25c73
x-ms-traffictypediagnostic: CO1PR11MB4819:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CO1PR11MB48198E3AD7EE4AF3DAB0FB0AF21B9@CO1PR11MB4819.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dwaOj3+UO9pbWuTtjQtN2x2IAhoqU1POmJKljCY/keUNkD6dMsQjma0odShrbK4mLrh0L0OXT6LuA6Vm//JVZmEqic06Z3pY5oOZXO1b1hf0m//c9PwoLM7BgTJvFnw92EE7SGd9wgjcmdDunvYA+hFPO6vlsez8jiGhDESb/7dvuG6ov8dAXMX/QqdjHd6mocrmoG6b0v5PD4qqImp32sP9KVchWwiKsWe78RAK9e9RSx0MLuzzM3yyXLgxVB/6IH67kDWA8SJuZlghFA6bskAnC/Dr9jARc+O9P2HPH2ow9EMvrYWNsl/4XVLUwOVAfQgz9sUyM3tpC+4snj5NFaWCCLLiItnXd3JaCEaIg9ALLwN9ajd6/7Dcle/RY8XcLS1TtIb794IsxiXyDuzDKU8VKiU6vev8vekGUAMWgPUP+5BCPzHVmaTuc2EEXP+gjx5/fbSdL/7Sy/fpPZwJbXDq0tLDQg06QlAjrDX6kNah18lxMkguwDp3pFNj3dx+ou4ylfEnhYzWQVK6cCinI2DMlPMS3GzyR1kSRrFwJAnXnpZlibaGNIagKrcdRWw/6dIMOZ9EobN8YwZR0y6AfRcUcmCq94k4guTO8CDveVUXKcAWf1a0Az4KS8ttSrehNjVESIDu3tAqvSprmlykevhnvh78M5N/p+tCISLQNIoeQpfn+uFgM5w1WTU5NruHENdt2A1rEH2SSL71rMkcVEFnEa6hswXPZPK/5Ru7vljbdI76vVGRu51NQDiwI529RAndXdUXO2Ax6i5CVubyTiaWegqoJMOY5K3FXH3fU8dw4RJk8EM4LI7nLBwyB7Fr
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR11MB4523.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(376002)(346002)(39860400002)(136003)(396003)(53546011)(71200400001)(66476007)(8676002)(55016002)(966005)(64756008)(76116006)(33656002)(7696005)(66446008)(66556008)(83380400001)(6506007)(66946007)(122000001)(478600001)(86362001)(5660300002)(38100700002)(186003)(8936002)(2906002)(54906003)(316002)(26005)(4326008)(52536014)(110136005)(9686003)(88260200001)(226253002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TTBuRUFWZlFKOG1WcEJQajNIUHJ6N0dGc0Q1MEFNK1ZBbzFJVXV2ZURxZFJD?=
 =?utf-8?B?ZUJubzEzeHZpVTdJWXNPQ1A3LzZyR2FqWEZJVzB4bEExcDhJTTRhaUY0K3Vx?=
 =?utf-8?B?U3RnUjJkNjJYTkhOdGNTdXZBWFNuazk5bis3cGpPTE5HNFRTYWc3dEFWeUQw?=
 =?utf-8?B?NlE0bkhDeTdrUXNlSk9hUWdsVFRDamRXS3RDc01KTGNyQ3VCYmZsRjMwdU9X?=
 =?utf-8?B?QjMrd0IyYWRSY05kT2NmbUZFa1BVejhzZWtyb1dRQ1N1bURSSnNUdjgvMlIw?=
 =?utf-8?B?M2JpT0x6OGFuWVZiQ2s3a1NPVTZDL1MwazlJbTRQTExzL2lxeEQ5bHAxS2ds?=
 =?utf-8?B?MFdvNlJ0NmdVK3FMTllBUit5QmFNYityY1d0ZUpJaHRRVVhyN3h4ZklVY21V?=
 =?utf-8?B?U1gyRnRkY1B3WGJNc2FaZ1YvOVlBQlQ2dkppUW4rUWFpaEgzYTFDNmtCMXlv?=
 =?utf-8?B?ajZldUFwRFY4R1h6VVdRMWV0d0grbHZGUmU2blpFNWs3c1BrZ2pLYzROcHR4?=
 =?utf-8?B?TDRmUEg4eHk4cVNUa3lUcTYxQXB5SSs5NVZ2dWpMOXovREJqVlluTkZ2bHd4?=
 =?utf-8?B?T3F3MzNyb1JzY3pETXI0VnFRSDk2WnU3UHdpbHhDSzBxZzNwbFBHNUtWb0o1?=
 =?utf-8?B?NFB2UUhHRG9GdDlodFZXSkVLeEtub01nWmJlMUdMQ1BKYTE3OXo1V3RNalN0?=
 =?utf-8?B?TmhaMnVvMzFmMlFWM0xxVE9XTG5TTjFlVExSdVVzUGV3NDdYS3g4YjN0a3A4?=
 =?utf-8?B?Ulo4dmh5ZDZTdVhtZThDYmNXMllJZHRHK0kxbG9mcHgydVljd0tYOEZpSEli?=
 =?utf-8?B?T3hiMlNqV0pRZlZaYklaekVYSHJRZFlEaVVtMm5LUWk5YURvcE56YTRPZXlB?=
 =?utf-8?B?V0pUS215UVJVdDg1R00rL1hnYWZ1enJIbXczZTR1VWR0WHp2QkFIWHVkVGdw?=
 =?utf-8?B?M1dKVnVUeHhTcmh2azZjRWN2QVZvSDJrVWZpL003Y0RpMjM3WVFzcFJZKzg0?=
 =?utf-8?B?amR4cGtNaTBBQU1pV3BDYms4ZmMxVnM4SGtVZ29uN2VVaUV3WFpRUGFmY0Zy?=
 =?utf-8?B?dHlSRmg3WVFFUEVMakZXY2cyQnpKVjg2QXNDMk00VEhsZzkybXpqd0pTdHZP?=
 =?utf-8?B?MzRRYUlqSm9qbW9UaUw4blN4a2ZhQys5UDZybytEWHNMaEFkNzlKR0VZOE5K?=
 =?utf-8?B?c2RtUUpkZWNPV0loWndXKzB5QjFPVjI1dkc4MU1nK2M2M2xxRGpzc1dJdGhC?=
 =?utf-8?B?OTVtR3RKUVM1OEkzMm5YUm1OS3dJVjhuWHVuM1loenpqbjVVRkNpdVgrWHc5?=
 =?utf-8?B?dE1FbDI4aTZGR2lWNExkNnNETG5sK25oR2pZZTNIK1p5VWxITk5Yams1eDBF?=
 =?utf-8?B?dTV5YWVCTGtxTTJuWTVTaWFreStUUUppVUVNeDlheW1LVmRvanFCR1QyZkRt?=
 =?utf-8?B?SExMclBzMjIrVUxBNkM4S0Q2V0JSelY5dFl3SXdEMG5YL1ZYNXNKT01TNmdV?=
 =?utf-8?B?ekZhK25zYk91RkVyYm9wb213Y2ViUVVxUG1hRGF3K25SWGhKeGxibTVXMnlw?=
 =?utf-8?B?bmFzOEdjdWU3a2owam1CZENjVTgxd1hHRmpZOFRhK3JsSjcxNHRYZURGeGRQ?=
 =?utf-8?B?dFNZR0h4TjBvbS91eDgyL2VwR051TFArYm9XZUluTkg1WmFWTVNJTzNUZjBI?=
 =?utf-8?B?eU00VEU2cHpBZ2FnbjZXb1NLaWpuMGtoTzZiN1k5U01xbzk5dzB0cm1RMXF1?=
 =?utf-8?Q?SRXi2OmsBA59oigjqM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4523.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87e3a338-d62b-4a2a-71fe-08d940a25c73
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2021 17:20:32.8768
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PprbT9ziL0t9iymF3fuN4Fdg0vSBlUiabqDiD4cQO/Hap0NA8lC46E3qsM6al2e5MbZ8A7evTb/QLXwlvlpDGOkDRi0TZgA7c9pL1HB1pig=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4819
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBIYW5zIGRlIEdvZWRlIDxoZGVn
b2VkZUByZWRoYXQuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBKdWx5IDYsIDIwMjEgNDoxMSBBTQ0K
PiBUbzogS2FtbWVsYSwgR2F5YXRyaSA8Z2F5YXRyaS5rYW1tZWxhQGludGVsLmNvbT47IHBsYXRm
b3JtLWRyaXZlci0NCj4geDg2QHZnZXIua2VybmVsLm9yZw0KPiBDYzogbWdyb3NzQGxpbnV4Lmlu
dGVsLmNvbTsgaXJlbmljLnJham5lZXNoQGdtYWlsLmNvbTsgUGFuZHJ1dmFkYSwNCj4gU3Jpbml2
YXMgPHNyaW5pdmFzLnBhbmRydXZhZGFAaW50ZWwuY29tPjsgQW5keSBTaGV2Y2hlbmtvDQo+IDxh
bmRyaXkuc2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb20+OyBCb3gsIERhdmlkIEUNCj4gPGRhdmlk
LmUuYm94QGludGVsLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MSAwLzRdIEFkZCBBbGRl
ciBMYWtlIFBDSC1TIHN1cHBvcnQgdG8gUE1DIGNvcmUgZHJpdmVyDQo+IA0KPiBIaSwNCj4gDQo+
IE9uIDcvMi8yMSA0OjE5IEFNLCBHYXlhdHJpIEthbW1lbGEgd3JvdGU6DQo+ID4gSGksDQo+ID4g
VGhlIHBhdGNoIHNlcmllcyBhZGQgQWxkZXIgTGFrZSBQQ0gtUyBzdXBwb3J0IHRvIFBNQyBjb3Jl
IGRyaXZlci4NCj4gPg0KPiA+IFBhdGNoIDE6IEFkZCBBbGRlcmxha2Ugc3VwcG9ydCB0byBwbWNf
Y29yZSBkcml2ZXIgUGF0Y2ggMjogQWRkIExhdGVuY3kNCj4gPiBUb2xlcmFuY2UgUmVwb3J0aW5n
IChMVFIpIHN1cHBvcnQgdG8gQWxkZXIgTGFrZSBQYXRjaCAzOiBBZGQgQWxkZXINCj4gPiBMYWtl
IGxvdyBwb3dlciBtb2RlIHN1cHBvcnQgZm9yIHBtY19jb3JlIFBhdGNoIDQ6IEFkZCBHQkUgUGFj
a2FnZSBDMTANCj4gPiBmaXggZm9yIEFsZGVyIExha2UNCj4gPg0KPiA+IERhdmlkIEUuIEJveCAo
MSk6DQo+ID4gICBwbGF0Zm9ybS94ODY6IGludGVsX3BtY19jb3JlOiBBZGQgR0JFIFBhY2thZ2Ug
QzEwIGZpeCBmb3IgQWxkZXIgTGFrZQ0KPiA+ICAgICBQQ0gNCj4gPg0KPiA+IEdheWF0cmkgS2Ft
bWVsYSAoMyk6DQo+ID4gICBwbGF0Zm9ybS94ODY6IGludGVsX3BtY19jb3JlOiBBZGQgQWxkZXJs
YWtlIHN1cHBvcnQgdG8gcG1jX2NvcmUgZHJpdmVyDQo+ID4gICBwbGF0Zm9ybS94ODY6IGludGVs
X3BtY19jb3JlOiBBZGQgTGF0ZW5jeSBUb2xlcmFuY2UgUmVwb3J0aW5nIChMVFIpDQo+ID4gICAg
IHN1cHBvcnQgdG8gQWxkZXIgTGFrZQ0KPiA+ICAgcGxhdGZvcm0veDg2OiBpbnRlbF9wbWNfY29y
ZTogQWRkIEFsZGVyIExha2UgbG93IHBvd2VyIG1vZGUgc3VwcG9ydA0KPiA+ICAgICBmb3IgcG1j
X2NvcmUNCj4gPg0KPiA+ICBkcml2ZXJzL3BsYXRmb3JtL3g4Ni9pbnRlbF9wbWNfY29yZS5jIHwg
MzA3DQo+ID4gKysrKysrKysrKysrKysrKysrKysrKysrKy0gIGRyaXZlcnMvcGxhdGZvcm0veDg2
L2ludGVsX3BtY19jb3JlLmggfA0KPiA+IDE3ICsrDQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMzIx
IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBDYzogU3Jpbml2YXMgUGFu
ZHJ1dmFkYSA8c3Jpbml2YXMucGFuZHJ1dmFkYUBpbnRlbC5jb20+DQo+ID4gQ2M6IEFuZHkgU2hl
dmNoZW5rbyA8YW5kcml5LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tPg0KPiA+IENjOiBEYXZp
ZCBCb3ggPGRhdmlkLmUuYm94QGludGVsLmNvbT4NCj4gPg0KPiA+IGJhc2UtY29tbWl0OiA2MmZi
OTg3NGY1ZGE1NGZkYjI0MzAwM2IzODYxMjgwMzczMTliMjE5DQo+IA0KPiBUaGFua3MsIHRoZSBz
ZXJpZXMgbG9va3MgZ29vZCB0byBtZToNCj4gDQo+IFJldmlld2VkLWJ5OiBIYW5zIGRlIEdvZWRl
IDxoZGVnb2VkZUByZWRoYXQuY29tPg0KPiANCj4gRm9yIHRoZSBzZXJpZXMuIEFzIEFuZHkgYWxy
ZWFkeSBtZW50aW9uZWQgd2UgYXJlIHRyeWluZyB0byBtb3ZlIGFsbCB0aGUgSW50ZWwNCj4gZmls
ZXMgdG8gZHJpdmVycy9wbGF0Zm9ybS94ODYvaW50ZWwuIENhbiB5b3UgcGxlYXNlIHNlbmQgYSBu
ZXcgdmVyc2lvbiB3aXRoDQo+IGFuIGV4dHJhIHBhdGNoIHdoaWNoIGZpcnN0IG1vdmVzIGFsbCB0
aGUNCj4gDQo+IGRyaXZlcnMvcGxhdGZvcm0veDg2L2ludGVsX3BtY18qLmMgZmlsZXMgdG86IGRy
aXZlcnMvcGxhdGZvcm0veDg2L2ludGVsL3BtYw0KPiBhbmQgdGhlbiBhcHBseSB0aGUgNCBwYXRj
aGVzIGZyb20gdGhpcyBzZXJpZXMgb24gdG9wLCBzZWU6DQo+IA0KPiBodHRwczovL2dpdC5rZXJu
ZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvY29tbWl0
Lz9pDQo+IGQ9NzJmYmNhYzJmNDBlNjkwZTFhNTU4NDM1ODc1MGU1NDZhMjY3OGMyYw0KPiANCj4g
Rm9yIGFuIGV4YW1wbGUgb2YgYSBjb21taXQgbW92aW5nIGZpbGVzIHRvIHVuZGVyDQo+IGRyaXZl
cnMvcGxhdGZvcm0veDg2L2ludGVsLzxzdWJkaXI+DQo+IA0KPiBSZWdhcmRzLA0KPiANCj4gSGFu
cw0KDQpUaGFua3MgSGFucyEgU3VyZSwgSSB3aWxsIHNlbmQgdGhlIG5ldyB2ZXJzaW9uLg0KDQo=
