Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63B86C433C1
	for <platform-driver-x86@archiver.kernel.org>; Mon, 29 Mar 2021 19:11:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2F97961934
	for <platform-driver-x86@archiver.kernel.org>; Mon, 29 Mar 2021 19:11:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231645AbhC2TKo (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 29 Mar 2021 15:10:44 -0400
Received: from mga04.intel.com ([192.55.52.120]:51450 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231695AbhC2TKf (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 29 Mar 2021 15:10:35 -0400
IronPort-SDR: Ev16HbaEGto0f3B92GpsiJPQ+OCW9JOk5QCar1SogMhxTEqG5dDRwY9/iQ36psEJEb0bDW+Uoc
 9TJHaD1UtCdA==
X-IronPort-AV: E=McAfee;i="6000,8403,9938"; a="189362554"
X-IronPort-AV: E=Sophos;i="5.81,288,1610438400"; 
   d="scan'208";a="189362554"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2021 12:10:35 -0700
IronPort-SDR: OKA4T1bS1Ln+4H1kSQSTUlfsWWJnjiEgwIsjC12p9lMdVKqcyIS0nmlAih7RaduR1bsy/7DBsz
 rWxwHcMmuTYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,288,1610438400"; 
   d="scan'208";a="438011325"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
  by fmsmga004.fm.intel.com with ESMTP; 29 Mar 2021 12:10:34 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 29 Mar 2021 12:10:34 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 29 Mar 2021 12:10:33 -0700
Received: from orsmsx610.amr.corp.intel.com ([10.22.229.23]) by
 ORSMSX610.amr.corp.intel.com ([10.22.229.23]) with mapi id 15.01.2106.013;
 Mon, 29 Mar 2021 12:10:33 -0700
From:   "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>
To:     "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "mgross@linux.intel.com" <mgross@linux.intel.com>
CC:     "srinivas.pandruvada@linux.intel.com" 
        <srinivas.pandruvada@linux.intel.com>,
        "prarit@redhat.com" <prarit@redhat.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Subject: [GIT PULL]: tools/power/x86/intel-speed-select pull request for
 5.13-rc1
Thread-Topic: [GIT PULL]: tools/power/x86/intel-speed-select pull request for
 5.13-rc1
Thread-Index: AQHXJM8x7bni6jfs1ke01S2Gfe3VPQ==
Date:   Mon, 29 Mar 2021 19:10:33 +0000
Message-ID: <96f15cef07d3995d9893ff3e671b0f78e2cdbf68.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.34.4 (3.34.4-1.fc31) 
x-originating-ip: [10.22.254.132]
Content-Type: text/plain; charset="utf-8"
Content-ID: <E2B08CED36627C4C9DA2C9BA5EF1D111@intel.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

SGkgTWFyaywgSGFucywNCg0KVGhlIGZvbGxvd2luZyBjaGFuZ2VzIGFyZSBvbiB0b3Agb2Y6DQpn
aXQ6Ly9naXQuaW5mcmFkZWFkLm9yZy9saW51eC1wbGF0Zm9ybS1kcml2ZXJzLXg4Ni5naXQgZm9y
LW5leHQNCg0KDQpUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0DQowNzMzZTU0NWZh
NTk2NjcwMWJjMDU2Y2Y2MmUzMTk1ZWU5MmU0MTkxOg0KDQogIHBsYXRmb3JtL3g4NjogdG91Y2hz
Y3JlZW5fZG1pOiBIYW5kbGUgZGV2aWNlIHByb3BlcnRpZXMgd2l0aCBzb2Z0d2FyZQ0Kbm9kZSBB
UEkgKDIwMjEtMDMtMDYgMTA6MjY6MDIgKzAxMDApDQoNCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdp
dCByZXBvc2l0b3J5IGF0Og0KDQogIGh0dHBzOi8vZ2l0aHViLmNvbS9zcGFuZHJ1dmFkYS9saW51
eC1rZXJuZWwuZ2l0IGludGVsLXNzdA0KDQpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8N
CjI2ZmE0YzU4OGYyODk0YWJlZTlhYWVkMzA5N2YzOGM2YTBkZmQxZDI6DQoNCiAgdG9vbHMvcG93
ZXIveDg2L2ludGVsLXNwZWVkLXNlbGVjdDogdjEuOSByZWxlYXNlICgyMDIxLTAzLTI5IDExOjQ1
OjA0DQotMDcwMCkNCg0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KQW50b25pbyBUZXJjZWlybyAoMSk6DQogICAgICB0b29s
cy9wb3dlci94ODYvaW50ZWwtc3BlZWQtc2VsZWN0OiBEcm9wIF9fREFURV9fIGFuZCBfX1RJTUVf
Xw0KbWFjcm9zDQoNClNyaW5pdmFzIFBhbmRydXZhZGEgKDQpOg0KICAgICAgdG9vbHMvcG93ZXIv
eDg2L2ludGVsLXNwZWVkLXNlbGVjdDogSW5jcmVhc2Ugc3RyaW5nIHNpemUNCiAgICAgIHRvb2xz
L3Bvd2VyL3g4Ni9pbnRlbC1zcGVlZC1zZWxlY3Q6IFByb2Nlc3MgbWFpbGJveCByZWFkIGVycm9y
DQpmb3IgY29yZS1wb3dlcg0KICAgICAgdG9vbHMvcG93ZXIveDg2L2ludGVsLXNwZWVkLXNlbGVj
dDogQWRkIG9wdGlvbnMgdG8gZm9yY2Ugb25saW5lDQogICAgICB0b29scy9wb3dlci94ODYvaW50
ZWwtc3BlZWQtc2VsZWN0OiB2MS45IHJlbGVhc2UNCg0KIHRvb2xzL3Bvd2VyL3g4Ni9pbnRlbC1z
cGVlZC1zZWxlY3QvaXNzdC1jb25maWcuYyAgfCAzMA0KKysrKysrKysrKysrKysrKysrKysrKysr
KystLS0tDQogdG9vbHMvcG93ZXIveDg2L2ludGVsLXNwZWVkLXNlbGVjdC9pc3N0LWRpc3BsYXku
YyB8IDEyICsrKysrKysrKystLQ0KIDIgZmlsZXMgY2hhbmdlZCwgMzYgaW5zZXJ0aW9ucygrKSwg
NiBkZWxldGlvbnMoLSkNCg0KVGhhbmtzLA0KU3Jpbml2YXMNCg==
