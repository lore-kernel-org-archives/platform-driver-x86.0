Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73C1DC433FE
	for <platform-driver-x86@archiver.kernel.org>; Mon,  7 Dec 2020 22:34:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 49A6523998
	for <platform-driver-x86@archiver.kernel.org>; Mon,  7 Dec 2020 22:34:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727304AbgLGWe2 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 7 Dec 2020 17:34:28 -0500
Received: from mga09.intel.com ([134.134.136.24]:9724 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727896AbgLGWe1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 7 Dec 2020 17:34:27 -0500
IronPort-SDR: kazuy9yPxv6wngggvkYM0NLmooRAbXRq5JDlK646DHG2067Z7owW9SiBToUStafv/4MvyN6UlO
 WzRChb/Fpf1w==
X-IronPort-AV: E=McAfee;i="6000,8403,9828"; a="173938007"
X-IronPort-AV: E=Sophos;i="5.78,400,1599548400"; 
   d="scan'208";a="173938007"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2020 14:33:46 -0800
IronPort-SDR: 5CcJfhbPAPXR4LulcOEhrRISZtgVA2+wizLBBfphl0egjmSdbWK0SnXK4hLv8stwxe/f+8d3AP
 S53AHokveEvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,400,1599548400"; 
   d="scan'208";a="483384433"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga004.jf.intel.com with ESMTP; 07 Dec 2020 14:33:46 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 7 Dec 2020 14:33:46 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 7 Dec 2020 14:33:46 -0800
Received: from orsmsx610.amr.corp.intel.com ([10.22.229.23]) by
 ORSMSX610.amr.corp.intel.com ([10.22.229.23]) with mapi id 15.01.1713.004;
 Mon, 7 Dec 2020 14:33:46 -0800
From:   "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>
To:     "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "andy@infradead.org" <andy@infradead.org>,
        "prarit@redhat.com" <prarit@redhat.com>,
        "mgross@linux.intel.com" <mgross@linux.intel.com>
CC:     "srinivas.pandruvada@linux.intel.com" 
        <srinivas.pandruvada@linux.intel.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Subject: [GIT PULL]: tools/power/x86/intel-speed-select pull request for
 5.11-rc1
Thread-Topic: [GIT PULL]: tools/power/x86/intel-speed-select pull request for
 5.11-rc1
Thread-Index: AQHWzOkGzHEQ7jdJpECpGVcnYZvDfQ==
Date:   Mon, 7 Dec 2020 22:33:46 +0000
Message-ID: <57d6648282491906e0e1f70fe3b9a44f72cec90d.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.34.4 (3.34.4-1.fc31) 
x-originating-ip: [10.1.200.100]
Content-Type: text/plain; charset="utf-8"
Content-ID: <880DB36B469D964EAF73A3D20F2B3027@intel.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

SGkgTWFyaywgSGFucywNCg0KVGhlIGZvbGxvd2luZyBjaGFuZ2VzIGFyZSBvbiB0b3Agb2YNCmh0
dHA6Ly9naXQuaW5mcmFkZWFkLm9yZy9saW51eC1wbGF0Zm9ybS1kcml2ZXJzLXg4Ni5naXQvc2hv
cnRsb2cvcmVmcy9oZWFkcy9mb3ItbmV4dA0KDQoNClRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5j
ZSBjb21taXQNCmU4YTYwYWE3NDA0YmZlZjM3NzA1ZGE1NjA3Yzk3NzM3MDczYWMzOGQ6DQoNCiAg
cGxhdGZvcm0veDg2OiBJbnRyb2R1Y2Ugc3VwcG9ydCBmb3IgU3lzdGVtcyBNYW5hZ2VtZW50IERy
aXZlciBvdmVyDQpXTUkgZm9yIERlbGwgU3lzdGVtcyAoMjAyMC0xMC0yOCAxMDo1MjoxNiArMDEw
MCkNCg0KYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6DQoNCiAgaHR0cHM6
Ly9naXRodWIuY29tL3NwYW5kcnV2YWRhL2xpbnV4LWtlcm5lbC5naXQgaW50ZWwtc3N0DQoNCmZv
ciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0bw0KNzg1ZWM2NzhiOWExY2ZmNTcwNTg5YTQyYzQ3
MWUzZDE4MGZiNjJmZjoNCg0KICB0b29scy9wb3dlci94ODYvaW50ZWwtc3BlZWQtc2VsZWN0OiBV
cGRhdGUgdmVyc2lvbiBmb3IgdjUuMTEgKDIwMjAtDQoxMi0wNyAxNDoyMDozOSAtMDgwMCkNCg0K
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQ0KU3Jpbml2YXMgUGFuZHJ1dmFkYSAoMyk6DQogICAgICB0b29scy9wb3dlci94ODYv
aW50ZWwtc3BlZWQtc2VsZWN0OiBSZWFkIFRSTCBmcm9tIG1haWxib3gNCiAgICAgIHRvb2xzL3Bv
d2VyL3g4Ni9pbnRlbC1zcGVlZC1zZWxlY3Q6IEFjY291bnQgZm9yIG1pc3Npbmcgc3lzZnMgZm9y
DQpkaWVfaWQNCiAgICAgIHRvb2xzL3Bvd2VyL3g4Ni9pbnRlbC1zcGVlZC1zZWxlY3Q6IFVwZGF0
ZSB2ZXJzaW9uIGZvciB2NS4xMQ0KDQogdG9vbHMvcG93ZXIveDg2L2ludGVsLXNwZWVkLXNlbGVj
dC9pc3N0LWNvbmZpZy5jIHwgOCArKysrKystLQ0KIHRvb2xzL3Bvd2VyL3g4Ni9pbnRlbC1zcGVl
ZC1zZWxlY3QvaXNzdC1jb3JlLmMgICB8IDIgKy0NCiB0b29scy9wb3dlci94ODYvaW50ZWwtc3Bl
ZWQtc2VsZWN0L2lzc3QuaCAgICAgICAgfCAxICsNCiAzIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0
aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCg0KDQpUaGFua3MsDQpTcmluaXZhcw0K
