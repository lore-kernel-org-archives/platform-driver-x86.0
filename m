Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7C5DC48BD1
	for <platform-driver-x86@archiver.kernel.org>; Thu, 10 Jun 2021 22:13:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C7D7B613F1
	for <platform-driver-x86@archiver.kernel.org>; Thu, 10 Jun 2021 22:13:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230001AbhFJWPq (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 10 Jun 2021 18:15:46 -0400
Received: from mga06.intel.com ([134.134.136.31]:52505 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230385AbhFJWPq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 10 Jun 2021 18:15:46 -0400
IronPort-SDR: JOH0s2bp9WxbRo4Qz0NwLAmRt1+k4HcvI/wuPKvEm9VybeUAx+bAvjcOYTbhrEOK/kkZRe161C
 VyJKa46A28uA==
X-IronPort-AV: E=McAfee;i="6200,9189,10011"; a="266568206"
X-IronPort-AV: E=Sophos;i="5.83,264,1616482800"; 
   d="scan'208";a="266568206"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2021 15:13:49 -0700
IronPort-SDR: SH3gVmaXD+vEc9AxzI1QJgZrYNCBbKjqQwb8rCEyMzDZIO7Sd7yZyrvss5D3B5q4xGORgx/Ma/
 30PEd30wSe6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,264,1616482800"; 
   d="scan'208";a="483028069"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga001.jf.intel.com with ESMTP; 10 Jun 2021 15:13:49 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Thu, 10 Jun 2021 15:13:48 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Thu, 10 Jun 2021 15:13:48 -0700
Received: from orsmsx610.amr.corp.intel.com ([10.22.229.23]) by
 ORSMSX610.amr.corp.intel.com ([10.22.229.23]) with mapi id 15.01.2242.008;
 Thu, 10 Jun 2021 15:13:48 -0700
From:   "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>
To:     "hdegoede@redhat.com" <hdegoede@redhat.com>
CC:     "mgross@linux.intel.com" <mgross@linux.intel.com>,
        "srinivas.pandruvada@linux.intel.com" 
        <srinivas.pandruvada@linux.intel.com>,
        "prarit@redhat.com" <prarit@redhat.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Subject: [GIT PULL]: tools/power/x86/intel-speed-select pull request for
 5.14-rc1
Thread-Topic: [GIT PULL]: tools/power/x86/intel-speed-select pull request for
 5.14-rc1
Thread-Index: AQHXXkXiRliJoZf/k0SuwUhmssLxjA==
Date:   Thu, 10 Jun 2021 22:13:48 +0000
Message-ID: <37f1eff940cdc2113e9d6ff9848a0165380b957d.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.38.4 (3.38.4-1.fc33) 
x-originating-ip: [10.1.200.100]
Content-Type: text/plain; charset="utf-8"
Content-ID: <B3E36A7C6072F245BA69CAB95FEBD812@intel.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

SGkgSGFucywNCg0KVGhlc2UgY2hhbmdlcyBhcmUgb24gdG9wIG9mDQpodHRwczovL2tlcm5lbC5n
b29nbGVzb3VyY2UuY29tL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9wZHg4Ni9wbGF0Zm9ybS1k
cml2ZXJzLXg4Ni9mb3ItbmV4dA0KDQpUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0
DQo1MDFmMTg2NGU2Mzg3YmYwYWJjNWQwYmIyMmE4OWZkZDllZDViOTdmOg0KDQogIHBsYXRmb3Jt
L3g4NjogdGhpbmstbG1pOiBBdm9pZCBwb3RlbnRpYWwgcmVhZCBiZWZvcmUgc3RhcnQgb2YgdGhl
DQpidWZmZXIgKDIwMjEtMDYtMDkgMTc6MTg6MjUgKzAyMDApDQoNCmFyZSBhdmFpbGFibGUgaW4g
dGhlIEdpdCByZXBvc2l0b3J5IGF0Og0KDQogIGh0dHBzOi8vZ2l0aHViLmNvbS9zcGFuZHJ1dmFk
YS9saW51eC1rZXJuZWwuZ2l0IGludGVsLXNzdA0KDQpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMg
dXAgdG8NCjAxOTkyMGQwZGViMDYxNThhNWZmNDhiNWJjMzhhMWU3Yzc4MDliZTU6DQoNCiAgdG9v
bHMvcG93ZXIveDg2L2ludGVsLXNwZWVkLXNlbGVjdDogdjEuMTAgcmVsZWFzZSAoMjAyMS0wNi0x
MA0KMTQ6Mzc6MjggLTA3MDApDQoNCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NClNyaW5pdmFzIFBhbmRydXZhZGEgKDIpOg0K
ICAgICAgdG9vbHMvcG93ZXIveDg2L2ludGVsLXNwZWVkLXNlbGVjdDogRml4IHVuY29yZSBtZW1v
cnkgZnJlcXVlbmN5DQpkaXNwbGF5DQogICAgICB0b29scy9wb3dlci94ODYvaW50ZWwtc3BlZWQt
c2VsZWN0OiB2MS4xMCByZWxlYXNlDQoNCiB0b29scy9wb3dlci94ODYvaW50ZWwtc3BlZWQtc2Vs
ZWN0L2lzc3QtY29uZmlnLmMgIHwgMTgNCisrKysrKysrKysrKysrKysrLQ0KIHRvb2xzL3Bvd2Vy
L3g4Ni9pbnRlbC1zcGVlZC1zZWxlY3QvaXNzdC1jb3JlLmMgICAgfCAxNSArKysrKysrKysrKysr
KysNCiB0b29scy9wb3dlci94ODYvaW50ZWwtc3BlZWQtc2VsZWN0L2lzc3QtZGlzcGxheS5jIHwg
IDIgKy0NCiB0b29scy9wb3dlci94ODYvaW50ZWwtc3BlZWQtc2VsZWN0L2lzc3QuaCAgICAgICAg
IHwgIDIgKysNCiA0IGZpbGVzIGNoYW5nZWQsIDM1IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pDQoNClRoYW5rcywNClNyaW5pdmFzDQo=
