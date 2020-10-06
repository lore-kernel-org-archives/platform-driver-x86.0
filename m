Return-Path: <SRS0=8/nu=DN=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24584C4363D
	for <platform-driver-x86@archiver.kernel.org>; Tue,  6 Oct 2020 14:03:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D67CF20760
	for <platform-driver-x86@archiver.kernel.org>; Tue,  6 Oct 2020 14:03:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726012AbgJFODe (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 6 Oct 2020 10:03:34 -0400
Received: from mga14.intel.com ([192.55.52.115]:16137 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725902AbgJFODd (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 6 Oct 2020 10:03:33 -0400
IronPort-SDR: q/G1EA0HSdhZD/qmbIgR9ZBj1bFtla6Rmt7wcjiXHQjRLsze1fLgzRnZNT/DHqFx+d8K8GriMT
 MgQPAA+d5EEg==
X-IronPort-AV: E=McAfee;i="6000,8403,9765"; a="163730117"
X-IronPort-AV: E=Sophos;i="5.77,343,1596524400"; 
   d="scan'208";a="163730117"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2020 07:02:22 -0700
IronPort-SDR: gVKguJfQTO84CL+3TSlK2eBmmX1SEX2cpEvlFaYG63rPVx923U9txte0hT9FBlfEmhU9azH2fj
 rVvf8b0z4rKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,343,1596524400"; 
   d="scan'208";a="517230188"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmsmga006.fm.intel.com with ESMTP; 06 Oct 2020 07:02:22 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 6 Oct 2020 07:02:21 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 6 Oct 2020 07:02:21 -0700
Received: from orsmsx610.amr.corp.intel.com ([10.22.229.23]) by
 ORSMSX610.amr.corp.intel.com ([10.22.229.23]) with mapi id 15.01.1713.004;
 Tue, 6 Oct 2020 07:02:21 -0700
From:   "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>
To:     "andy@infradead.org" <andy@infradead.org>,
        "prarit@redhat.com" <prarit@redhat.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
CC:     "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "mgross@linux.intel.com" <mgross@linux.intel.com>,
        "srinivas.pandruvada@linux.intel.com" 
        <srinivas.pandruvada@linux.intel.com>,
        "dvhart@infradead.org" <dvhart@infradead.org>
Subject: [GIT PULL]: tools/power/x86/intel-speed-select second pull request
 for 5.10-rc1
Thread-Topic: [GIT PULL]: tools/power/x86/intel-speed-select second pull
 request for 5.10-rc1
Thread-Index: AQHWm+lPtxB4hk5bGUiTyjOd3Vf7bg==
Date:   Tue, 6 Oct 2020 14:02:21 +0000
Message-ID: <02c960a0ab75672007527e167b89b986ec5f9441.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.34.4 (3.34.4-1.fc31) 
x-originating-ip: [10.1.200.100]
Content-Type: text/plain; charset="utf-8"
Content-ID: <4474D2D99D81D84EB201C12528437983@intel.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

VGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdA0KNzIwZWY3M2QxYTIzOWUzM2MzYWQ4
ZmFjMzU2YjliMTM0OGU2OGFhZjoNCg0KICBwbGF0Zm9ybS94ODY6IHRoaW5rcGFkX2FjcGk6IHJl
LWluaXRpYWxpemUgQUNQSSBidWZmZXIgc2l6ZSB3aGVuDQpyZXVzZSAoMjAyMC0xMC0wNSAxMjoy
MDo0MiArMDMwMCkNCg0KYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6DQoN
CiAgaHR0cHM6Ly9naXRodWIuY29tL3NwYW5kcnV2YWRhL2xpbnV4LWtlcm5lbC5naXQgZm9yLW5l
eHQNCg0KZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvDQoxZmU0NTg2MTdhZjQ1Zjc5MjZj
ZTMzOGI3YWNjZWM1YzBmZWExZjVjOg0KDQogIHRvb2xzL3Bvd2VyL3g4Ni9pbnRlbC1zcGVlZC1z
ZWxlY3Q6IFVwZGF0ZSB2ZXJzaW9uIGZvciB2NS4xMCAoMjAyMC0NCjEwLTA2IDA2OjUwOjQ5IC0w
NzAwKQ0KDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tDQpKb25hdGhhbiBEb21hbiAoMSk6DQogICAgICB0b29scy9wb3dlci94
ODYvaW50ZWwtc3BlZWQtc2VsZWN0OiBGaXggbWlzc2luZyBiYXNlLWZyZXEgY29yZQ0KSURzDQoN
ClNyaW5pdmFzIFBhbmRydXZhZGEgKDEpOg0KICAgICAgdG9vbHMvcG93ZXIveDg2L2ludGVsLXNw
ZWVkLXNlbGVjdDogVXBkYXRlIHZlcnNpb24gZm9yIHY1LjEwDQoNCiB0b29scy9wb3dlci94ODYv
aW50ZWwtc3BlZWQtc2VsZWN0L2lzc3QtY29uZmlnLmMgfCAyMyArKysrKysrKysrKysrLS0tDQot
LS0tLS0tDQogdG9vbHMvcG93ZXIveDg2L2ludGVsLXNwZWVkLXNlbGVjdC9pc3N0LWNvcmUuYyAg
IHwgIDggKysrKy0tLS0NCiB0b29scy9wb3dlci94ODYvaW50ZWwtc3BlZWQtc2VsZWN0L2lzc3Qu
aCAgICAgICAgfCAgMiArLQ0KIDMgZmlsZXMgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgMTUg
ZGVsZXRpb25zKC0pDQo=
