Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4F72C43381
	for <platform-driver-x86@archiver.kernel.org>; Tue,  9 Feb 2021 19:49:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7637264E7D
	for <platform-driver-x86@archiver.kernel.org>; Tue,  9 Feb 2021 19:49:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233155AbhBITrS (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 9 Feb 2021 14:47:18 -0500
Received: from mga05.intel.com ([192.55.52.43]:54296 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233698AbhBITpE (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 9 Feb 2021 14:45:04 -0500
IronPort-SDR: 0do0+o/Z3L9r2T6utAszwJdBSpTvaENUUBCPTdvfDlFlPjcSIM5Xwob2ce9Ap115b4AGWTyjeq
 fhDM97JYZJlA==
X-IronPort-AV: E=McAfee;i="6000,8403,9890"; a="266769533"
X-IronPort-AV: E=Sophos;i="5.81,166,1610438400"; 
   d="scan'208";a="266769533"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2021 10:30:19 -0800
IronPort-SDR: BFd17Z3xV3MQDv9kdRJP4EUUbC3mFLjzfyUjFWdJbpgUj/DMG/7QC2tGPHUrIcxjEd7canOYfc
 L1VDEgapA67A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,166,1610438400"; 
   d="scan'208";a="379210042"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
  by fmsmga008.fm.intel.com with ESMTP; 09 Feb 2021 10:30:18 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 9 Feb 2021 10:30:17 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 9 Feb 2021 10:30:17 -0800
Received: from orsmsx610.amr.corp.intel.com ([10.22.229.23]) by
 ORSMSX610.amr.corp.intel.com ([10.22.229.23]) with mapi id 15.01.2106.002;
 Tue, 9 Feb 2021 10:30:17 -0800
From:   "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>
To:     "hdegoede@redhat.com" <hdegoede@redhat.com>
CC:     "mgross@linux.intel.com" <mgross@linux.intel.com>,
        "srinivas.pandruvada@linux.intel.com" 
        <srinivas.pandruvada@linux.intel.com>,
        "prarit@redhat.com" <prarit@redhat.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Subject: Re: [GIT PULL]: tools/power/x86/intel-speed-select pull request for
 5.12-rc1
Thread-Topic: [GIT PULL]: tools/power/x86/intel-speed-select pull request for
 5.12-rc1
Thread-Index: AQHW/xFRz7bTyexEF0GEPhkjP6VNGqpQqzIA
Date:   Tue, 9 Feb 2021 18:30:17 +0000
Message-ID: <2c5938999eca021eb4b79e8b06522e45afa502f2.camel@intel.com>
References: <456011d0252d0ddf137c1c3c73ac637283b707c8.camel@intel.com>
In-Reply-To: <456011d0252d0ddf137c1c3c73ac637283b707c8.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.34.4 (3.34.4-1.fc31) 
x-originating-ip: [10.1.200.100]
Content-Type: text/plain; charset="utf-8"
Content-ID: <63FCFDF04CC7E04A81817C16E777F278@intel.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

U29ycnksIGZvcmdvdCB0byBhZGQgb3RoZXIgZW1haWwgYWRkcmVzc2VzLg0KDQpPbiBUdWUsIDIw
MjEtMDItMDkgYXQgMTA6MjggLTA4MDAsIFNyaW5pdmFzIFBhbmRydXZhZGEgd3JvdGU6DQo+IEhp
IEhhbnMgYW5kIE1hcmssDQo+IA0KPiBUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0
DQo+IDYwYWNjYzAxMWFmMGZmODY5ODc1YjFkZWQ4MWNiZDA5NDgyNjdmMDU6DQo+IA0KPiAgIHBs
YXRmb3JtL3g4Ni9pbnRlbC11bmNvcmUtZnJlcTogQWRkIFNhcHBoaXJlIFJhcGlkcyBzZXJ2ZXIg
c3VwcG9ydA0KPiAoMjAyMS0wMi0wMyAxMzoxMDozNCArMDEwMCkNCj4gDQo+IGFyZSBhdmFpbGFi
bGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0Og0KPiANCj4gICANCj4gaHR0cDovL2dpdC5pbmZy
YWRlYWQub3JnL2xpbnV4LXBsYXRmb3JtLWRyaXZlcnMteDg2LmdpdC9zaG9ydGxvZy9yZWZzL2hl
YWRzL2Zvci1uZXh0DQo+ICANCj4gDQo+IGZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0bw0K
PiAyYTc2ZDIzNWJjN2VhYzMyYWYwOGFmNGM3NTU0Yjc0Yzc1NDA0NzFmOg0KPiANCj4gICB0b29s
cy9wb3dlci94ODYvaW50ZWwtc3BlZWQtc2VsZWN0OiBVcGRhdGUgdmVyc2lvbiB0byAxLjggKDIw
MjEtMDItDQo+IDA4IA0KPiAxMTo1Njo1NSAtMDgwMCkNCj4gDQo+IC0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gU3Jpbml2
YXMgUGFuZHJ1dmFkYSAoMyk6DQo+ICAgICAgIHRvb2xzL3Bvd2VyL3g4Ni9pbnRlbC1zcGVlZC1z
ZWxlY3Q6IEFkZCBuZXcgY29tbWFuZCB0dXJiby1tb2RlDQo+ICAgICAgIHRvb2xzL3Bvd2VyL3g4
Ni9pbnRlbC1zcGVlZC1zZWxlY3Q6IEFkZCBuZXcgY29tbWFuZCB0byBnZXQvc2V0DQo+IFRSTA0K
PiAgICAgICB0b29scy9wb3dlci94ODYvaW50ZWwtc3BlZWQtc2VsZWN0OiBVcGRhdGUgdmVyc2lv
biB0byAxLjgNCj4gDQo+ICB0b29scy9wb3dlci94ODYvaW50ZWwtc3BlZWQtc2VsZWN0L2lzc3Qt
Y29uZmlnLmMgIHwgMTE1DQo+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKy0tDQo+ICB0b29scy9wb3dlci94ODYvaW50ZWwtc3BlZWQtc2Vs
ZWN0L2lzc3QtY29yZS5jICAgIHwgIDExICsrKysrKw0KPiAgdG9vbHMvcG93ZXIveDg2L2ludGVs
LXNwZWVkLXNlbGVjdC9pc3N0LWRpc3BsYXkuYyB8ICAxOCArKysrKysrKysrDQo+ICB0b29scy9w
b3dlci94ODYvaW50ZWwtc3BlZWQtc2VsZWN0L2lzc3QuaCAgICAgICAgIHwgICAyICsrDQo+ICA0
IGZpbGVzIGNoYW5nZWQsIDE0NCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiANCj4g
VGhhbmtzLA0KPiBTcmluaXZhcw0KPiANCj4gDQo=
