Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87AAEC6FD19
	for <platform-driver-x86@archiver.kernel.org>; Thu, 16 Mar 2023 19:02:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229620AbjCPTC3 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 16 Mar 2023 15:02:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229634AbjCPTC2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 16 Mar 2023 15:02:28 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BB9DE41DF
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Mar 2023 12:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678993329; x=1710529329;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=hGxbXytV8/qNz0E7ETdmyj1cjJtE9s/nCA+D75Rf0vE=;
  b=fjR/sx8P28IbS0wh95fXK6IPWcdtKGjH7DJM5FxKsoyK1akwZ8PXitc+
   ny9i/Me9ZtPy/NSpXOmmzKybrdEZOwHEEJ0H/4JAvPu5/M5aRULQLC6gB
   DgP6kS/29YR8sV7kyLXpogFQsgbffuzxUAaxBPiJpaI6Pc6HDWTigSN7x
   qyvJc5fbVbz+mn9/pL8XVj3YeW6atgik7f7/D/VcA02Y7ZgEz93z7uzeD
   +81bqr57ColrbZpO5WHy9YrNDoH59tRxlhnIGSIJBsdZ2q3QNqPBJrUF1
   M2sZQIfw2rmyXYY/QwDnMseb++4TzUUQN/OkGo7Botv/QbD2GitdGiTT3
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="321944128"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; 
   d="scan'208";a="321944128"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2023 12:02:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="925864491"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; 
   d="scan'208";a="925864491"
Received: from mgisomme-mobl1.amr.corp.intel.com ([10.212.42.167])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2023 12:02:05 -0700
Message-ID: <c6e93a83e9605ca127483dc3e7dbcf97c6961e06.camel@linux.intel.com>
Subject: Re: [bug report] platform/x86: ISST: Add IOCTL default callback
From:   srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
To:     Dan Carpenter <error27@gmail.com>
Cc:     platform-driver-x86@vger.kernel.org
Date:   Thu, 16 Mar 2023 12:02:04 -0700
In-Reply-To: <25a8ef35-5274-4990-a683-040aacaa8d3a@kili.mountain>
References: <25a8ef35-5274-4990-a683-040aacaa8d3a@kili.mountain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

SGkgRGFuLAoKT24gRnJpLCAyMDIzLTAzLTEwIGF0IDE0OjU3ICswMzAwLCBEYW4gQ2FycGVudGVy
IHdyb3RlOgo+IEhlbGxvIFNyaW5pdmFzIFBhbmRydXZhZGEsCj4gCj4gVGhlIHBhdGNoIDMzYzE2
ZGMxYTJkMTogInBsYXRmb3JtL3g4NjogSVNTVDogQWRkIElPQ1RMIGRlZmF1bHQKPiBjYWxsYmFj
ayIgZnJvbSBGZWIgMTAsIDIwMjMsIGxlYWRzIHRvIHRoZSBmb2xsb3dpbmcgU21hdGNoIHN0YXRp
Ywo+IGNoZWNrZXIgd2FybmluZzoKPiAKPiDCoMKgwqDCoMKgwqDCoMKgZHJpdmVycy9wbGF0Zm9y
bS94ODYvaW50ZWwvc3BlZWRfc2VsZWN0X2lmL2lzc3RfaWZfY29tbW9uLmM6Ngo+IDI5IGlzc3Rf
aWZfZGVmX2lvY3RsKCkKPiDCoMKgwqDCoMKgwqDCoMKgaW5mbzogcmV0dXJuIGEgbGl0ZXJhbCBp
bnN0ZWFkIG9mICdyZXQnCj4gCkkgdXNlIHlvdXIgYmxvZwpodHRwczovL2Jsb2dzLm9yYWNsZS5j
b20vbGludXgvcG9zdC9zbWF0Y2gtc3RhdGljLWFuYWx5c2lzLXRvb2wtb3ZlcnZpZXctYnktZGFu
LWNhcnBlbnRlcgoKc21hdGNoL3NtYXRjaF9zY3JpcHRzL2tjaGVja2VyIC0tc3BhbW15CmRyaXZl
cnMvcGxhdGZvcm0veDg2L2ludGVsL3NwZWVkX3NlbGVjdF9pZi9pc3N0X2lmX2NvbW1vbi5jCiAg
Q0hFQ0sgICBzY3JpcHRzL21vZC9lbXB0eS5jCiAgQ0FMTCAgICBzY3JpcHRzL2NoZWNrc3lzY2Fs
bHMuc2gKICBERVNDRU5EIG9ianRvb2wKICBJTlNUQUxMIGxpYnN1YmNtZF9oZWFkZXJzCiAgQ0Mg
W01dICBkcml2ZXJzL3BsYXRmb3JtL3g4Ni9pbnRlbC9zcGVlZF9zZWxlY3RfaWYvaXNzdF9pZl9j
b21tb24ubwogIENIRUNLICAgZHJpdmVycy9wbGF0Zm9ybS94ODYvaW50ZWwvc3BlZWRfc2VsZWN0
X2lmL2lzc3RfaWZfY29tbW9uLmMKCkFsc28gdHJpZWQgd2l0aCAKaHR0cHM6Ly9zbWF0Y2guc291
cmNlZm9yZ2UubmV0LwoKbWFrZSBDSEVDSz0ifi9wYXRoL3RvL3NtYXRjaC9zbWF0Y2ggLXA9a2Vy
bmVsIiBDPTEgXAogICAgICAgICAgICAgICAgYnpJbWFnZSBtb2R1bGUKCldoYXQgaXMgdGhlIGNv
cnJlY3Qgd2F5IHRvIHJ1biB0aGlzIHRvIGdldCB0aGlzIGVycm9yPwoKVGhhbmtzLApTcmluaXZh
cwoKPiBkcml2ZXJzL3BsYXRmb3JtL3g4Ni9pbnRlbC9zcGVlZF9zZWxlY3RfaWYvaXNzdF9pZl9j
b21tb24uYwo+IMKgwqDCoCA2MTXCoMKgwqDCoMKgwqDCoMKgIGNhc2UgSVNTVF9JRl9NU1JfQ09N
TUFORDoKPiDCoMKgwqAgNjE2wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY21kX2Ni
LmNtZF9zaXplID0gc2l6ZW9mKHN0cnVjdAo+IGlzc3RfaWZfbXNyX2NtZCk7Cj4gwqDCoMKgIDYx
N8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNtZF9jYi5vZmZzZXQgPSBvZmZzZXRv
ZihzdHJ1Y3QKPiBpc3N0X2lmX21zcl9jbWRzLCBtc3JfY21kKTsKPiDCoMKgwqAgNjE4wqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY21kX2NiLmNtZF9jYWxsYmFjayA9IGlzc3RfaWZf
bXNyX2NtZF9yZXE7Cj4gwqDCoMKgIDYxOcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHJldCA9IGlzc3RfaWZfZXhlY19tdWx0aV9jbWQoYXJncCwgJmNtZF9jYik7Cj4gwqDCoMKgIDYy
MMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOwo+IMKgwqDCoCA2MjHCoMKg
wqDCoMKgwqDCoMKgIGRlZmF1bHQ6Cj4gwqDCoMKgIDYyMsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGZvciAoaSA9IDA7IGkgPCBJU1NUX0lGX0RFVl9NQVg7ICsraSkgewo+IMKgwqDC
oCA2MjPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3Ry
dWN0IGlzc3RfaWZfY21kX2NiICpjYiA9Cj4gJnB1bml0X2NhbGxiYWNrc1tpXTsKPiDCoMKgwqAg
NjI0wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGludCBy
ZXQ7Cj4gwqDCoMKgIDYyNSAKPiDCoMKgwqAgNjI2wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChjYi0+ZGVmX2lvY3RsKSB7Cj4gwqDCoMKgIDYyN8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgcmV0ID0gY2ItPmRlZl9pb2N0bChmaWxlLAo+IGNtZCwgYXJnKTsKPiDCoMKgwqAgNjI4
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBpZiAoIXJldCkKPiAtLT4gNjI5wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJu
IHJldDsKPiAKPiBUaGlzIHJldHVybnMgdGhlIGZpcnN0IHRpbWUgc29tZXRoaW5nIHN1Y2NlZWRz
LsKgIE5vcm1hbGx5IGl0IHdvdWxkIGJlCj4gdGhlIG90aGVyIHdheSBhcm91bmQsIHdoZXJlIHdl
IHJldHVybiB0aGUgZmlyc3QgdGltZSBzb21ldGhpbmcgZmFpbHMuCj4gSWYgdGhpcyBpcyByZWFs
bHkgaW50ZW50aW9uYWwgaXQgd291bGQgYmUgYmV0dGVyIHRvIGRvIGFuIGV4cGxpY2l0Cj4gInJl
dHVybiAwOyIKPiAKPiDCoMKgwqAgNjMwwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIH0KPiDCoMKgwqAgNjMxwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgfQo+IMKgwqDCoCA2MzLCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBicmVh
azsKPiDCoMKgwqAgNjMzwqDCoMKgwqDCoMKgwqDCoCB9Cj4gwqDCoMKgIDYzNCAKPiDCoMKgwqAg
NjM1wqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gcmV0Owo+IMKgwqDCoCA2MzYgfQo+IAo+IHJlZ2Fy
ZHMsCj4gZGFuIGNhcnBlbnRlcgoK

