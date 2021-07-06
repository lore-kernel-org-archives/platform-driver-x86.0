Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6A0BC07E96
	for <platform-driver-x86@archiver.kernel.org>; Tue,  6 Jul 2021 17:17:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 80FF761C5C
	for <platform-driver-x86@archiver.kernel.org>; Tue,  6 Jul 2021 17:17:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230371AbhGFRUD (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 6 Jul 2021 13:20:03 -0400
Received: from mga18.intel.com ([134.134.136.126]:7277 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230347AbhGFRUC (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 6 Jul 2021 13:20:02 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10037"; a="196440862"
X-IronPort-AV: E=Sophos;i="5.83,329,1616482800"; 
   d="scan'208";a="196440862"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2021 10:17:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,329,1616482800"; 
   d="scan'208";a="449292944"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga007.jf.intel.com with ESMTP; 06 Jul 2021 10:17:22 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 6 Jul 2021 10:17:22 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Tue, 6 Jul 2021 10:17:22 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.4; Tue, 6 Jul 2021 10:17:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mfFRapPRt/z6ISEs/OMlpIvTvyQAbV7qRFpw9G0x7X7FNSajxVio0pJERH+13mbv/TKKDkmded6VHguVKbbR2+5jzc4nee4R0u6fu8KCXbFx2xHEyCQADw9bnN9bvGKYCU+fHO9Uf0DK/uyQBTdvQVd6vwB7tr4wA+99xVxkhJVpqh2kvbwSAR6WY51PREhmy5+lujDm/rHEjmROoPyd6DqdxoPAakJiFBAK7MNDsNiiP7lG/BOIhPA5c1STw3PM0AxhReSwaU0YmzCbcnaNPpMaCYiC67PoBhsIq5Mz1OH23en6yzhsWLKtnzmk3W1Snxk1a0MOvJSeTw4Q9PMvMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iCUtQAl4EuePlI2DjaMsyiA5Ol+v09i4DN2JJWY5EPc=;
 b=jbqaLq3FasuH1tBDdZHf3Mk4sqfBcMY2WoKL2l03EhCNYCgdTCySYlSUVIAYaH60+Mwe+EDTkeA8wddvoZN6SYmflS3v0LcstjpDIjRsCOMfUSh30vhqlE492BkPGZdJlaSWhVXqG+d7u2I5BFw8a2jVKmvJC5x0vEvjThBV7RogR+2U+C/zuyCEqtSSr/aQEIR0rDJLc5CiF32WdU9xRFvmpzLI/86m+slP1hqHRef7FWnM9R0GULrNZ6SCFTeoPOejvlhiUjtQli5yNi7OJqh8cPrggibmt/D4w7x00XqQRjxOzCATtvGQIOeY8md2Ld9TjUyEFORhrIaWtan/zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iCUtQAl4EuePlI2DjaMsyiA5Ol+v09i4DN2JJWY5EPc=;
 b=uBdn7HvQtVZfJH4wih+lrXTNKuNiBKNeD/xodW6LYmk85ipuG7R+2NVS1T9Cceeeop60KI5hH4rbEt1eluzcYcIfzkc/y3Z2RsA10LP6Db6P0F+ImIOOSM9jfT9SgQQckGxnTm2TyU2TIaBCtTXox8n48nZv3Xxyjuws39CueLQ=
Received: from MW3PR11MB4523.namprd11.prod.outlook.com (2603:10b6:303:5b::16)
 by MWHPR1101MB2207.namprd11.prod.outlook.com (2603:10b6:301:58::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.27; Tue, 6 Jul
 2021 17:17:20 +0000
Received: from MW3PR11MB4523.namprd11.prod.outlook.com
 ([fe80::a87d:ca62:f143:7464]) by MW3PR11MB4523.namprd11.prod.outlook.com
 ([fe80::a87d:ca62:f143:7464%7]) with mapi id 15.20.4287.033; Tue, 6 Jul 2021
 17:17:20 +0000
From:   "Kammela, Gayatri" <gayatri.kammela@intel.com>
To:     You-Sheng Yang <vicamo.yang@canonical.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
CC:     "mgross@linux.intel.com" <mgross@linux.intel.com>,
        "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "irenic.rajneesh@gmail.com" <irenic.rajneesh@gmail.com>,
        "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "Box, David E" <david.e.box@intel.com>
Subject: RE: [PATCH v1 0/4] Add Alder Lake PCH-S support to PMC core driver
Thread-Topic: [PATCH v1 0/4] Add Alder Lake PCH-S support to PMC core driver
Thread-Index: AQHXbuksGoxx3VkXc0OIDyPYbcQjk6s0O6EAgAH7/QA=
Date:   Tue, 6 Jul 2021 17:17:20 +0000
Message-ID: <MW3PR11MB4523B0D3B70C4820DAB5AD18F21B9@MW3PR11MB4523.namprd11.prod.outlook.com>
References: <cover.1625191274.git.gayatri.kammela@intel.com>
 <21ab8bdf-cc5e-55bd-6f82-bc267100d732@canonical.com>
In-Reply-To: <21ab8bdf-cc5e-55bd-6f82-bc267100d732@canonical.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.6.100.41
dlp-reaction: no-action
dlp-product: dlpe-windows
authentication-results: canonical.com; dkim=none (message not signed)
 header.d=none;canonical.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 761c7748-6ad5-415f-f015-08d940a1ea01
x-ms-traffictypediagnostic: MWHPR1101MB2207:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR1101MB2207C659FB451F4E13341448F21B9@MWHPR1101MB2207.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:101;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SvR3gcs9C/xojyBy9VTITPXAWjwfLbHyPtPsPUvEw3FNfkMagn5MXo7a4BgizlZK2UX8OVcG8yU4pGPL2vZP0MaV1hAAhDHd716TlRynVfG992BzbNjWt4KFjm0aa8X+I2kHbruRbVTqjX/FZMhAbZhh9/fZdHcexkkCuRq8/dop32ZSKrgJZBUHHhPyseRj+n2DvSKpNVQk7vDjNExUxtRuSs3QY50Y8w5XjDhxB3qTajB6SEvjyeo2DoaCThKE6Xdmv4KL11J1MZd6Ww+olG3vR81nqM5fuhSmniDb0bm5nMJINT/yyXkpclRC4ZX8gHZlmQTSEFWkCI0wgPg3TAiIXMSLNLvRQbFunzc1hMGoX5gAhExhMelNdj/hNixmSMLT7iUWEQtg2J9bdtylaTDCHVTGKt2oi/OEu0UAMlsXfmFSexa8yb1ZEeaHVrH/TYJQUCBUCap001xEwoPL7D+2E1r6VmfgIj5DQqP1zas4cF12RPadZbIDTc/gTm4A0BHksunHz5gUbcoqWCvx1nXoDoPG8O/RYA3nybVUlV63B2ZM2Kiprpvrz9zMVJrvF8URYWjHXm4Y10tmuVgSW+2OCzyYzoz9yVHF0xtlWkPrdKmYDNMrqlXV5aikpqHqxzS0k7mgu7Gxbqjq9VtfRpunqtdJcQ/frneaL67yDt9Zlc5UdfyBBAU4c7fF5ttQqyRrHT2RN20+YvdPQ6R0zdfXdBLdGD6VHUsRPvlhr58LMeDRMsBRNGeFoeF25zPz
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR11MB4523.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(366004)(376002)(346002)(136003)(39860400002)(83380400001)(8676002)(186003)(122000001)(7696005)(53546011)(55016002)(66476007)(26005)(8936002)(66946007)(6506007)(71200400001)(38100700002)(9686003)(86362001)(54906003)(76116006)(478600001)(2906002)(66446008)(52536014)(64756008)(316002)(66556008)(33656002)(110136005)(5660300002)(4326008)(88260200001)(226253002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZlllSG1vM0Y0dm9YZVFacU1ZQmRkaU1MUFVqVUtsWkwza0VIY3BkSENPUXpp?=
 =?utf-8?B?VnZ3ckJENmNGa0srNkNFTndqUmtzcURUZVl1UFZ3TjJMQ2hrdGM0RGZUQit6?=
 =?utf-8?B?bzVUbzMyRURTaEt5VzROMTd3QVp5VVBlWVkrR2REdXFhdkU1OWZlM1JTVVdG?=
 =?utf-8?B?T0JhUWVjWFo4ejlreTVrRE1HYUs3c1pYNzFqSlNqVVJ1MkFJRVo0b0RiNUQr?=
 =?utf-8?B?Zy9CcVgvVlhCYjhkb3JhbFlFQTRDa2pzcVV3ZWpyTzJSdEljZ0JJVFRrS09v?=
 =?utf-8?B?UjF1TUFGQkFnNHZZNEV2Rm1teHZlb0RIZjhjb3NCSFZza3lIaVZETUtxUmtZ?=
 =?utf-8?B?SFNaVzh1c3NBZEY1UHVtYmMya2llZlRCR1UweCtMcHFMOU1qSnhiem1Sbjk1?=
 =?utf-8?B?MmhTcVE4ZlpSdHZkYm1iZnkwYm51MGVWam41OEl3ZG13TjA0RFZIeWRFN2FL?=
 =?utf-8?B?dXU4b2V2UUE2eHJpbXMzMTJrL2Z3ZUlwaGdzdU9RSDYwN2NhaFM3TUNtOGJU?=
 =?utf-8?B?dm9oTmp4Y3BCNzRYZ1VpQ1RCU0tCOXI3L1BqdmU3K1RrOEh6R0d6RjFUS3gz?=
 =?utf-8?B?Slo4N0taOExpQ0oxVXpsRlIvcmVQQmRzTDlSTlVoSEV3UmRPa1lBNzVxRitR?=
 =?utf-8?B?VHFMbUhUcmhpNTluYU5ycDhhNThpbGJ1UUp0ZmxsSE5tU2RKekhxd0pWRXlu?=
 =?utf-8?B?WG5PL3ZzMFZjeWxkWGtjN2NtZ3NqYlpDWVFWY2lMKzFrVGQxUXRkcGNWbWxn?=
 =?utf-8?B?Qlc3NmR1cjNHUmhiOUwwckdkdnhJaXVOSmtBdkdKbFRKV20rS2N4dFYzbDlh?=
 =?utf-8?B?YkUxNWtkUWFuUkw2WjVkSW03L3VXeC9INE9VRSsvWEdQYkVUaE9ITityZUQx?=
 =?utf-8?B?NjRxelExSmFyNWlUQ29vOEVWT1ZiS3ppVGIzaitpV1liRHVHZUU3SlBmMThJ?=
 =?utf-8?B?Q2tPZzh0N1Y1dzl5bklCSUJIaVNBL1FkUVB0TkVCNGl2a2VPTWVYSEZZYS9z?=
 =?utf-8?B?YUNPWnpZcHhwK1pmQVBYbHdQdmZlUi9WTkZFKzF4ck1vMHlYNzQ1SnJjTGFD?=
 =?utf-8?B?bEdFOU9EaWxNM2VrUW01VnZuSXdjMHBXc3JFcnNyQkgyVWdWWW5BMWhoWlIr?=
 =?utf-8?B?WE5WUlNCT3JWOVFVRjIxbjAwYm1tSFB1Rzdsby9rNkh0M25XRDczcVBna1Vu?=
 =?utf-8?B?VTVsZll5dHNZMXN3VU1mN1FCaXJ4MkZ5SThxQnhlc1Q3VGFicFl2NndielZQ?=
 =?utf-8?B?R0VTbGI2NTYxWjdQZDFaM0JkQmRLY3F3Y252UkY3THMrZ25BYXNvblRjb243?=
 =?utf-8?B?SlFmTnFvYklIaURGR21EUGNFRXpCcTFlcldMUnlkNTBhaFZXQTE3elZLbHdO?=
 =?utf-8?B?T3JYZHQ5K0ZJVFd6WVh4U281U1pBZjUzSWtQeXo5RTBuL3I1WFlCZTJjbXZN?=
 =?utf-8?B?bEcyTlNmSTRtSFVwNGJkVU1ha0ZiR08vNXN2SWV4a2t1QjdrVVRXQmRlanM3?=
 =?utf-8?B?aGVZRmVQVXhjK0VBMGZyRTNFNUZSdk5FbysrTnNmMkkyOGI3OXVlc2UyTHBl?=
 =?utf-8?B?dDVnYjJsZjNPTW5BVXBvVHJreko1WTFnZGpNZGI2dk1EajNFUGVhcFB2OEpN?=
 =?utf-8?B?ZmtKbkdCUjg4RnQ5cUpkSFFFY1l1ZTdiaUwrVVg0dExxVFdyWmN5a242Rjhr?=
 =?utf-8?B?M1BnS1A5eTNJUWpJTlVBSFBDcXViU3c3RlJaK09HMjZ5bnZOUWJwVldTK1No?=
 =?utf-8?Q?Hzc7PtWbEPPsSCLO7Y=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4523.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 761c7748-6ad5-415f-f015-08d940a1ea01
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2021 17:17:20.8836
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 95hfnJ+Ydow86huyEdMTgKhVfOcNF9ziOPSKYFzlGOkf4vbgimmBrtY/aIh88J2dI9mEhIAdsryO9ZYewpFv4YXjfShH6vZ7WxlaUD6HJkY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2207
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBZb3UtU2hlbmcgWWFuZyA8dmlj
YW1vLnlhbmdAY2Fub25pY2FsLmNvbT4NCj4gU2VudDogTW9uZGF5LCBKdWx5IDUsIDIwMjEgMzo1
OSBBTQ0KPiBUbzogS2FtbWVsYSwgR2F5YXRyaSA8Z2F5YXRyaS5rYW1tZWxhQGludGVsLmNvbT47
IHBsYXRmb3JtLWRyaXZlci0NCj4geDg2QHZnZXIua2VybmVsLm9yZw0KPiBDYzogbWdyb3NzQGxp
bnV4LmludGVsLmNvbTsgaGRlZ29lZGVAcmVkaGF0LmNvbTsNCj4gaXJlbmljLnJham5lZXNoQGdt
YWlsLmNvbTsgUGFuZHJ1dmFkYSwgU3Jpbml2YXMNCj4gPHNyaW5pdmFzLnBhbmRydXZhZGFAaW50
ZWwuY29tPjsgQW5keSBTaGV2Y2hlbmtvDQo+IDxhbmRyaXkuc2hldmNoZW5rb0BsaW51eC5pbnRl
bC5jb20+OyBCb3gsIERhdmlkIEUNCj4gPGRhdmlkLmUuYm94QGludGVsLmNvbT4NCj4gU3ViamVj
dDogUmU6IFtQQVRDSCB2MSAwLzRdIEFkZCBBbGRlciBMYWtlIFBDSC1TIHN1cHBvcnQgdG8gUE1D
IGNvcmUgZHJpdmVyDQo+IA0KPiBIaSwgdGhpcyB3b3JrcyBmb3IgbWUuDQo+IA0KPiBUZXN0ZWQt
Qnk6IFlvdS1TaGVuZyBZYW5nIDx2aWNhbW8ueWFuZ0BjYW5vbmljYWwuY29tPg0KVGhhbmsgeW91
IQ0KPiANCj4gT24gNy8yLzIxIDEwOjE5IEFNLCBHYXlhdHJpIEthbW1lbGEgd3JvdGU6DQo+ID4g
SGksDQo+ID4gVGhlIHBhdGNoIHNlcmllcyBhZGQgQWxkZXIgTGFrZSBQQ0gtUyBzdXBwb3J0IHRv
IFBNQyBjb3JlIGRyaXZlci4NCj4gPg0KPiA+IFBhdGNoIDE6IEFkZCBBbGRlcmxha2Ugc3VwcG9y
dCB0byBwbWNfY29yZSBkcml2ZXIgUGF0Y2ggMjogQWRkIExhdGVuY3kNCj4gPiBUb2xlcmFuY2Ug
UmVwb3J0aW5nIChMVFIpIHN1cHBvcnQgdG8gQWxkZXIgTGFrZSBQYXRjaCAzOiBBZGQgQWxkZXIN
Cj4gPiBMYWtlIGxvdyBwb3dlciBtb2RlIHN1cHBvcnQgZm9yIHBtY19jb3JlIFBhdGNoIDQ6IEFk
ZCBHQkUgUGFja2FnZSBDMTANCj4gPiBmaXggZm9yIEFsZGVyIExha2UNCj4gPg0KPiA+IERhdmlk
IEUuIEJveCAoMSk6DQo+ID4gICBwbGF0Zm9ybS94ODY6IGludGVsX3BtY19jb3JlOiBBZGQgR0JF
IFBhY2thZ2UgQzEwIGZpeCBmb3IgQWxkZXIgTGFrZQ0KPiA+ICAgICBQQ0gNCj4gPg0KPiA+IEdh
eWF0cmkgS2FtbWVsYSAoMyk6DQo+ID4gICBwbGF0Zm9ybS94ODY6IGludGVsX3BtY19jb3JlOiBB
ZGQgQWxkZXJsYWtlIHN1cHBvcnQgdG8gcG1jX2NvcmUgZHJpdmVyDQo+ID4gICBwbGF0Zm9ybS94
ODY6IGludGVsX3BtY19jb3JlOiBBZGQgTGF0ZW5jeSBUb2xlcmFuY2UgUmVwb3J0aW5nIChMVFIp
DQo+ID4gICAgIHN1cHBvcnQgdG8gQWxkZXIgTGFrZQ0KPiA+ICAgcGxhdGZvcm0veDg2OiBpbnRl
bF9wbWNfY29yZTogQWRkIEFsZGVyIExha2UgbG93IHBvd2VyIG1vZGUgc3VwcG9ydA0KPiA+ICAg
ICBmb3IgcG1jX2NvcmUNCj4gPg0KPiA+ICBkcml2ZXJzL3BsYXRmb3JtL3g4Ni9pbnRlbF9wbWNf
Y29yZS5jIHwgMzA3DQo+ID4gKysrKysrKysrKysrKysrKysrKysrKysrKy0gIGRyaXZlcnMvcGxh
dGZvcm0veDg2L2ludGVsX3BtY19jb3JlLmggfA0KPiA+IDE3ICsrDQo+ID4gIDIgZmlsZXMgY2hh
bmdlZCwgMzIxIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBDYzogU3Jp
bml2YXMgUGFuZHJ1dmFkYSA8c3Jpbml2YXMucGFuZHJ1dmFkYUBpbnRlbC5jb20+DQo+ID4gQ2M6
IEFuZHkgU2hldmNoZW5rbyA8YW5kcml5LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tPg0KPiA+
IENjOiBEYXZpZCBCb3ggPGRhdmlkLmUuYm94QGludGVsLmNvbT4NCj4gPg0KPiA+IGJhc2UtY29t
bWl0OiA2MmZiOTg3NGY1ZGE1NGZkYjI0MzAwM2IzODYxMjgwMzczMTliMjE5DQo+ID4NCg==
