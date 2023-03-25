Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 661FAC6FD1C
	for <platform-driver-x86@archiver.kernel.org>; Sat, 25 Mar 2023 19:31:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230123AbjCYTbw (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 25 Mar 2023 15:31:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbjCYTbv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 25 Mar 2023 15:31:51 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44A5ACC07;
        Sat, 25 Mar 2023 12:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679772711; x=1711308711;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=y3j20Ytb6PM0OXbOtzYPHeDh8nA+816iTYYzLVBX+xk=;
  b=LUpY+zK1wv5SUuIm3FIcBBAkt4CJgyA/OX+oRTlnLJ6VKUFqO58CHjfh
   h933wTyESX/J0uX6EdMo7/xqWfCG/BAazR4zNETPY2ci3MbVUJHi0RpSm
   bsvJPiv2Jkqz55Hn8LVmwfwWAoNedxvhIZrBmx08CYUB8fE/HP2jipdCD
   pNwspQOzN9SY9ZQDHV+vx8WFBZ/rZoNrwxNzIqV9f8+yy+ck/45anZAFl
   Mw0zPdksPqWR4eh96kZoe2/0YnCSzFRJ/CDvdT5fI9C64im9tGXpfcQGZ
   YY7M41xypBjq6ElyYtcWyCV4itWq2O0rJJDMIAZTWeHypegLclskUicqp
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10660"; a="367742848"
X-IronPort-AV: E=Sophos;i="5.98,291,1673942400"; 
   d="scan'208";a="367742848"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2023 12:31:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10660"; a="715602994"
X-IronPort-AV: E=Sophos;i="5.98,291,1673942400"; 
   d="scan'208";a="715602994"
Received: from amochoa-mobl1.amr.corp.intel.com ([10.213.164.71])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2023 12:31:49 -0700
Message-ID: <b7368c892515483f6b041f970da30e99d225a554.camel@linux.intel.com>
Subject: Re: [PATCH] platform/x86: ISST: unlock on error path in
 tpmi_sst_init()
From:   srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
To:     Dan Carpenter <error27@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        platform-driver-x86@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Date:   Sat, 25 Mar 2023 12:31:48 -0700
In-Reply-To: <dcdebbb7-7de6-4d04-8e7a-43d5ca043484@kili.mountain>
References: <dcdebbb7-7de6-4d04-8e7a-43d5ca043484@kili.mountain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

VGhpcyBpcyBmb3IgbGludXgtbmV4dCBhcyB0aGlzIGlzIG5vdCBtZXJnZWQgdG8gbWFpbmxpbmUu
CgpPbiBTYXQsIDIwMjMtMDMtMjUgYXQgMTQ6MDggKzAzMDAsIERhbiBDYXJwZW50ZXIgd3JvdGU6
Cj4gQ2FsbCBtdXRleF91bmxvY2soJmlzc3RfdHBtaV9kZXZfbG9jaykgYmVmb3JlIHJldHVybmlu
ZyBvbiB0aGlzCj4gZXJyb3IgcGF0aC4KPiAKPiBGaXhlczogZDgwNTQ1NmM3MTJmICgicGxhdGZv
cm0veDg2OiBJU1NUOiBFbnVtZXJhdGUgVFBNSSBTU1QgYW5kCj4gY3JlYXRlIGZyYW1ld29yayIp
Cj4gU2lnbmVkLW9mZi1ieTogRGFuIENhcnBlbnRlciA8ZXJyb3IyN0BnbWFpbC5jb20+CkFja2Vk
LWJ5OiBTcmluaXZhcyBQYW5kcnV2YWRhIDxzcmluaXZhcy5wYW5kcnV2YWRhQGxpbnV4LmludGVs
LmNvbT4KCj4gLS0tCj4gwqBkcml2ZXJzL3BsYXRmb3JtL3g4Ni9pbnRlbC9zcGVlZF9zZWxlY3Rf
aWYvaXNzdF90cG1pX2NvcmUuYyB8IDYKPiArKysrLS0KPiDCoDEgZmlsZSBjaGFuZ2VkLCA0IGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdAo+IGEvZHJpdmVycy9w
bGF0Zm9ybS94ODYvaW50ZWwvc3BlZWRfc2VsZWN0X2lmL2lzc3RfdHBtaV9jb3JlLmMKPiBiL2Ry
aXZlcnMvcGxhdGZvcm0veDg2L2ludGVsL3NwZWVkX3NlbGVjdF9pZi9pc3N0X3RwbWlfY29yZS5j
Cj4gaW5kZXggY2RiNTZhMThlYTE3Li42NjRkMmVlNjAzODUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9wbGF0Zm9ybS94ODYvaW50ZWwvc3BlZWRfc2VsZWN0X2lmL2lzc3RfdHBtaV9jb3JlLmMKPiAr
KysgYi9kcml2ZXJzL3BsYXRmb3JtL3g4Ni9pbnRlbC9zcGVlZF9zZWxlY3RfaWYvaXNzdF90cG1p
X2NvcmUuYwo+IEBAIC0xMzk5LDggKzEzOTksMTAgQEAgaW50IHRwbWlfc3N0X2luaXQodm9pZCkK
PiDCoMKgwqDCoMKgwqDCoMKgaXNzdF9jb21tb24uc3N0X2luc3QgPSBrY2FsbG9jKHRvcG9sb2d5
X21heF9wYWNrYWdlcygpLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc2l6ZW9mKCppc3N0X2NvbW1v
bi5zc3RfaW5zdCksCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBHRlBfS0VSTkVMKTsKPiAtwqDCoMKg
wqDCoMKgwqBpZiAoIWlzc3RfY29tbW9uLnNzdF9pbnN0KQo+IC3CoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqByZXR1cm4gLUVOT01FTTsKPiArwqDCoMKgwqDCoMKgwqBpZiAoIWlzc3RfY29t
bW9uLnNzdF9pbnN0KSB7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldCA9IC1F
Tk9NRU07Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGdvdG8gaW5pdF9kb25lOwo+
ICvCoMKgwqDCoMKgwqDCoH0KPiDCoAo+IMKgwqDCoMKgwqDCoMKgwqBtZW1zZXQoJmNiLCAwLCBz
aXplb2YoY2IpKTsKPiDCoMKgwqDCoMKgwqDCoMKgY2IuY21kX3NpemUgPSBzaXplb2Yoc3RydWN0
IGlzc3RfaWZfaW9fcmVnKTsKCg==

