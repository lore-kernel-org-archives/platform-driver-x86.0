Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AF94EB64DC
	for <platform-driver-x86@archiver.kernel.org>; Sat, 15 Jul 2023 10:32:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229549AbjGOKcH (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 15 Jul 2023 06:32:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229494AbjGOKcG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 15 Jul 2023 06:32:06 -0400
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB4221FDB
        for <platform-driver-x86@vger.kernel.org>; Sat, 15 Jul 2023 03:32:05 -0700 (PDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
        by mailout.west.internal (Postfix) with ESMTP id 281F432002D8;
        Sat, 15 Jul 2023 06:32:05 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Sat, 15 Jul 2023 06:32:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm1; t=
        1689417124; x=1689503524; bh=53zTCJqtw6B1ofQs4+6OxxUBWeGL/OdnQw7
        zl5y4xbE=; b=brwerP2Htdc7Bid0xltkiqkUTEiIsxlxXecroVG11oDFtoSESxi
        5pOilGWWCv61E1DL8MKSHkzlfGDa2DsDUL1SW5yvL+Rj/Si0rAW3YOfet4jS5O2j
        glCaegAubsEm3ByKG1fVRDusDN3lwh4FzmwldC8eCk8bVujOF1HQppugJgJvWfXx
        5ffXatMZw5iUw5CuPcwSRXfx7gmmXFKlJdCyMyX2YvTl9/JHQHOetHfK9os3sHMq
        ZBiq9tMr+cpqcCBKKIiZGZRwJPniXyHgZJFotUDhrUfSloRUCzqZS/Qtow03Wa4+
        DjFasRrnJFbv1QlsgmBY9CYbiDhCQeIs3RA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
        1689417124; x=1689503524; bh=53zTCJqtw6B1ofQs4+6OxxUBWeGL/OdnQw7
        zl5y4xbE=; b=OpUIHDJIgJ2tVH7MBpbbQFoKi8KN86KS/VNDGv/I7z33N+t/dnx
        yZABBfOHn9f4uAIV4qjWjSb16p5ALRvb7aZX/XKy99OkO8KnDPXAy1JxOxCHTHl3
        aeGMfi5xXJGQfDcYnJ8eR3PoX/szk+tUF4XFQwAn6EPnW4/FuBARZPyjkK2cmzps
        dCRvcD06A5gnqOGmNDr8/VW8YyP/ARYEEUCFWuieF17XWT10dcmzYYyTZGB+le8S
        cJ9QNcPlyjF1tByoQ4vZ3zdcC2jRXeFOzwiPkAOomLi7zLslNm6KOhf3yU0c1nVk
        yY1+23Ax2kTNltpdhP5pVwbkAXVNXqcpIJQ==
X-ME-Sender: <xms:pHWyZCinnkTcGHY7Ai2JaYrawEw0ruAxE7vEbrpS89ILTDwbK24rOg>
    <xme:pHWyZDA4kdIPA_vkw1h9IwLmZTT4xfUp6eHlXMCkeaVsqVCrwGou01-BtJmWLqnTv
    LkLDZGxhofXjBcVSwU>
X-ME-Received: <xmr:pHWyZKFk8INF3Fnr6ryHRN8dqMjhSjz_yPf9yjc9n1wlGUSPI0NyIk7NHgHAtAhuY5gXDA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrfeekgdeftdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefkuffhvfevffgjfhgtgfgfggesthgsredttderjeenucfhrhhomhepnfhukhgv
    ucflohhnvghsuceolhhukhgvsehljhhonhgvshdruggvvheqnecuggftrfgrthhtvghrnh
    epveejleeludfgheettdelvedtgeejieetieffiefhudeiffffffeftdetffekvdelnecu
    ffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehluhhkvgeslhhjohhnvghsrdguvghv
X-ME-Proxy: <xmx:pHWyZLTqEs-VAuhF3S2vd9gqFmttVaq_4-OYI_sEgp1jYRCdr_qpPQ>
    <xmx:pHWyZPxqH9x2_dimqw0KC7GbD7YKo_YvhkTGrCrfhzf_bRkdedUdzg>
    <xmx:pHWyZJ6RtZxmgxWgTIgI80kAerIzvGB1xupeH3-3jbEAIczKWp6XZQ>
    <xmx:pHWyZNYUDwO9MChzip92IxxP4H8uyTUarnaL07-BzRkH1exAg2RKuA>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 15 Jul 2023 06:32:02 -0400 (EDT)
Message-ID: <5bc0abe6f218bf7ae59dc20de099e3609e077a36.camel@ljones.dev>
Subject: Re: [PATCH v2] platform/x86: asus-wmi: Fix setting RGB mode on some
 TUF laptops
From:   Luke Jones <luke@ljones.dev>
To:     Hans de Goede <hdegoede@redhat.com>,
        Kristian Angelov <kristiana2000@abv.bg>
Cc:     platform-driver-x86@vger.kernel.org
Date:   Sat, 15 Jul 2023 22:31:56 +1200
In-Reply-To: <87d34e1d-1fcb-6d24-662f-91ff62f65dc2@redhat.com>
References: <ZLGzxoJN_7Dhl_si@wyvern.localdomain>
         <7ae06b8a-6c67-f6a6-06ed-2b6c8430c12c@redhat.com>
         <1549bab6dae1e4509f7190469c0d2371f127a4f0.camel@ljones.dev>
         <87d34e1d-1fcb-6d24-662f-91ff62f65dc2@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.48.3 (by Flathub.org) 
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

PiBIaSwKPiAKPiBPbiA3LzE1LzIzIDEyOjAzLCBMdWtlIEpvbmVzIHdyb3RlOgo+ID4gT24gU2F0
LCAyMDIzLTA3LTE1IGF0IDExOjQwICswMjAwLCBIYW5zIGRlIEdvZWRlIHdyb3RlOgo+ID4gPiBI
aSBLcmlzdGlhbiwKPiA+ID4gCj4gPiA+IE9uIDcvMTQvMjMgMjI6NDQsIEtyaXN0aWFuIEFuZ2Vs
b3Ygd3JvdGU6Cj4gPiA+ID4gVGhpcyBwYXRjaCBmaXhlcyBzZXR0aW5nIHRoZSBjbWQgdmFsdWVz
IHRvIDB4YjMgYW5kIDB4YjQuCj4gPiA+ID4gVGhpcyBpcyBuZWNlc3Nhcnkgb24gc29tZSBUVUYg
bGFwdG9wcyBpbiBvcmRlciB0byBzZXQgdGhlIFJHQgo+ID4gPiA+IG1vZGUuCj4gPiA+ID4gCj4g
PiA+ID4gQ2xvc2VzOgo+ID4gPiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3BsYXRmb3JtLWRy
aXZlci14ODYvNDQzMDc4MTQ4LjQ5MTAyMi4xNjc3NTc2Mjk4MTMzQG5tODMuYWJ2LmJnCj4gPiA+
ID4gU2lnbmVkLW9mZi1ieTogS3Jpc3RpYW4gQW5nZWxvdiA8a3Jpc3RpYW5hMjAwMEBhYnYuYmc+
Cj4gPiA+ID4gLS0tCj4gPiA+ID4gwqBWMSAtPiBWMi4gTWFrZSBzZXR0aW5nIDB4YjMgYW5kIDB4
YjQgdGhlIGRlZmF1bHQgbG9naWMKPiA+ID4gPiDCoAo+ID4gPiA+IMKgZHJpdmVycy9wbGF0Zm9y
bS94ODYvYXN1cy13bWkuYyB8IDEzICsrKysrKysrKysrLS0KPiA+ID4gPiDCoDEgZmlsZSBjaGFu
Z2VkLCAxMSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4gPiA+IAo+ID4gPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL3BsYXRmb3JtL3g4Ni9hc3VzLXdtaS5jCj4gPiA+ID4gYi9kcml2
ZXJzL3BsYXRmb3JtL3g4Ni9hc3VzLXdtaS5jCj4gPiA+ID4gaW5kZXggMTAzOGRmZGNkZDMyLi5l
YjgyZWQ3MjNiNDIgMTAwNjQ0Cj4gPiA+ID4gLS0tIGEvZHJpdmVycy9wbGF0Zm9ybS94ODYvYXN1
cy13bWkuYwo+ID4gPiA+ICsrKyBiL2RyaXZlcnMvcGxhdGZvcm0veDg2L2FzdXMtd21pLmMKPiA+
ID4gPiBAQCAtNzM4LDEzICs3MzgsMjIgQEAgc3RhdGljIHNzaXplX3Qga2JkX3JnYl9tb2RlX3N0
b3JlKHN0cnVjdAo+ID4gPiA+IGRldmljZSAqZGV2LAo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGRl
dmljZV9hdHRyaWJ1dGUgKmF0dHIsCj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb25zdCBjaGFyICpidWYsIHNp
emVfdCBjb3VudCkKPiA+ID4gPiDCoHsKPiA+ID4gPiAtwqDCoMKgwqDCoMKgwqB1MzIgY21kLCBt
b2RlLCByLCBnLMKgIGIswqAgc3BlZWQ7Cj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgdTMyIGNtZCwg
bW9kZSwgciwgZywgYiwgc3BlZWQ7Cj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoGludCBlcnI7Cj4g
PiA+ID4gwqAKPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgaWYgKHNzY2FuZihidWYsICIlZCAlZCAl
ZCAlZCAlZCAlZCIsICZjbWQsICZtb2RlLCAmciwKPiA+ID4gPiAmZywKPiA+ID4gPiAmYiwgJnNw
ZWVkKSAhPSA2KQo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJu
IC1FSU5WQUw7Cj4gPiA+ID4gwqAKPiA+ID4gPiAtwqDCoMKgwqDCoMKgwqBjbWQgPSAhIWNtZDsK
PiA+ID4gPiArwqDCoMKgwqDCoMKgwqAvKiBCMyBpcyBzZXQgYW5kIEI0IGlzIHNhdmUgdG8gQklP
Uy4gT25seSBzZXQgYnkKPiA+ID4gPiBkZWZhdWx0Ki8KPiA+ID4gPiArwqDCoMKgwqDCoMKgwqBz
d2l0Y2ggKGNtZCkgewo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoGRlZmF1bHQ6Cj4gPiA+ID4gK8Kg
wqDCoMKgwqDCoMKgY2FzZSAwOgo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqBjbWQgPSAweGIzOwo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBicmVh
azsKPiA+ID4gPiArwqDCoMKgwqDCoMKgwqBjYXNlIDE6Cj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoGNtZCA9IDB4YjQ7Cj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoGJyZWFrOwo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoH0KPiA+ID4gCj4gPiA+IFlv
dSBhcmUgbm93IGxlYXZpbmcgdGhlIHZhbHVlIG9mIGNtZCB1bm1vZGlmaWVkIGZvciB2YWx1ZXMg
d2hpY2gKPiA+ID4gYXJlCj4gPiA+IG5vdCAwIGFuZCAxLgo+ID4gPiAKPiA+ID4gSSB0aGluayB5
b3UgbmVlZCB0byBhZGQgYToKPiA+ID4gCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqBkZWZhdWx0Ogo+
ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiAtRUlOVkFMOwo+ID4g
PiAKPiA+ID4gaGVyZSB0byBjYXRjaCBjbWQgbm90IGJlaW5nIGVpdGhlciAwIG9yIDEuCj4gPiA+
IAo+ID4gPiBMdWtlLCB3aGF0IGRvIHlvdSB0aGluayA/Cj4gPiAKPiA+IExvb2tzIGZpbmUgdG8g
bWUuCj4gCj4gRmluZSB3aXRoIG9yIHdpdGhvdXQgdGhlIGRlZmF1bHQ6IHJldHVybiAtRUlOVkFM
OyBhZGRlZCA/CgpTb3JyeSwgaSB3YXNuJ3QgdmVyeSBjbGVhciBhdCBhbGwuIFdpdGggLUVJTlZB
TC4gSSBkb24ndCBzZWUgYW55IHJlYXNvbgppdCBzaG91bGQgY29udGludWUgd2l0aCB1bi1pbml0
aWFsaXNlZCBjbWQsIG9yIGEgZGVmYXVsdCB2YWx1ZSBhcyBhCmRlZmF1bHQgbWlnaHQgZ2l2ZSBm
YWxzZSBleHBlY3RhdGlvbnMuCgo+IAo+ID4gU2lnbmVkLW9mZi1ieTogTHVrZSBELiBKb25lcyA8
bHVrZUBsam9uZXMuZGV2Pgo+IAo+IEkgZ3Vlc3MgeW91IG1lYW4gUmV2aWV3ZWQtYnkgPwoKWWVz
IHNvcnJ5LCBJIHNob3VsZG4ndCBoYXZlIGV2ZW4gYWRkZWQgdGhhdC4gSSB3aWxsIGFkZCByZXZp
ZXcgZm9yIFYzLgoKPiAKPiBSZWdhcmRzLAo+IAo+IEhhbnMKPiAKPiAKPiAKPiAKPiA+ID4gPiDC
oMKgwqDCoMKgwqDCoMKgLyogVGhlc2UgYXJlIHRoZSBrbm93biB1c2FibGUgbW9kZXMgYWNyb3Nz
IGFsbCBUVUYvUk9HCj4gPiA+ID4gKi8KPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgaWYgKG1vZGUg
Pj0gMTIgfHwgbW9kZSA9PSA5KQo+ID4gPiAKPiA+IAo+IAoK

