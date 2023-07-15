Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24BE0EB64DC
	for <platform-driver-x86@archiver.kernel.org>; Sat, 15 Jul 2023 10:03:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229549AbjGOKD6 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 15 Jul 2023 06:03:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229494AbjGOKD5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 15 Jul 2023 06:03:57 -0400
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92376191
        for <platform-driver-x86@vger.kernel.org>; Sat, 15 Jul 2023 03:03:56 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 0000B3200684;
        Sat, 15 Jul 2023 06:03:52 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Sat, 15 Jul 2023 06:03:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm1; t=
        1689415432; x=1689501832; bh=o+Cfae9ALDbbwfGDSKGEDw8xAWgkTe3TSBG
        /xqQ5EMA=; b=kKnH0SuXRee/Oej0YgwLx9gPBvJzppW3gGKNuzFXxsgzxpIwM0x
        s+j0l0Iw/bq1LF76TG+XDc0WhSbdrDOXnhOeT4GuluTKAPQIoLh52dULkvQqN2/e
        AmErct2UkuXE3KwfNKEpJ5THGfTLqi0XRk5/kHO952Yolc0ljHJNkSNa0RlbJZQ5
        y3+B4iLGf9xyJ8lzVoGWfg9MSTlORD10vrITuOTt7E/j834YvRE62mFv6XmDE3dJ
        H8yDUVN4Cq/B5cdqXf3SoV7Sm1k6KDhRFIaxxTeVZi5/CK24QymmZe7Ygdxg8BVS
        eDxKupdKbsIKnxCgkR0i8sPlEnQcYfsJHww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
        1689415432; x=1689501832; bh=o+Cfae9ALDbbwfGDSKGEDw8xAWgkTe3TSBG
        /xqQ5EMA=; b=BEe/OkvvHRn3Vb+uLQfO4SRRgwJTfgJuNAyt+xHnmlDVMUrSkw5
        UWKZC839e12XYnJwFNdJVtFl2SUN1SqJ7pnKCzAoZ6SJJB0kIEAmDYff15KtWD5S
        1Os254HT6ZHrMo1vXRGEbnNekgZG5Qb/57+E8idx9VYXfIpywHuXXh8T6QjDjRDo
        J6yj7Zc626p5/JgqmxjAwEkBtkaeI59EOlYkPZoJamrFcgfDx/TwBAlXixAFbUxi
        K6iDyhXbLqvdmE4LPWMMX6CuY87VVytAB1GJW9Mu2ZJSCPan2zL4BYYZKvsjyoqv
        yPUZxT6UakSFMAw5ZglfNUrIJChe2eFXEGA==
X-ME-Sender: <xms:B2-yZEQwbmAa9PqoagdCrm221gzbAbQXMwiNd_LzwF6rz_6GLfS8dg>
    <xme:B2-yZBzB7cx9GqPVDRuZslPgYM9tQKJef20RBhuJJ7kop_uYUhEo9ObpHvZ9BJGwe
    7qVTTT0g6etNhep4d4>
X-ME-Received: <xmr:B2-yZB256iEbJKWeUB3JReVJq25L6DfH4dG9S3Gar-uiVtkeu5qApZAqb-9Vw59zgYxeqw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrfeekgddvhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefkuffhvfevffgjfhgtgfgfggesthgsredttderjeenucfhrhhomhepnfhukhgv
    ucflohhnvghsuceolhhukhgvsehljhhonhgvshdruggvvheqnecuggftrfgrthhtvghrnh
    epveejleeludfgheettdelvedtgeejieetieffiefhudeiffffffeftdetffekvdelnecu
    ffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehluhhkvgeslhhjohhnvghsrdguvghv
X-ME-Proxy: <xmx:B2-yZIBL4GRX4rTWyjmJREHg9fuS28r5TKcq2DbQP919F8IjBgmzDQ>
    <xmx:B2-yZNjpmE3V9XWNWvhwmcy80vQhjP2N87ri6HNLnZ17DoPzW6X_5A>
    <xmx:B2-yZEo9OtAs7aFGUYr1-FI3G11zqN1sYloS3DkJqa-zpDXvHmSAlA>
    <xmx:CG-yZNL8uBTEf120tJupsstfPuZVv9p-v7ZgJ-61XhTLOK6xxTXxDw>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 15 Jul 2023 06:03:50 -0400 (EDT)
Message-ID: <1549bab6dae1e4509f7190469c0d2371f127a4f0.camel@ljones.dev>
Subject: Re: [PATCH v2] platform/x86: asus-wmi: Fix setting RGB mode on some
 TUF laptops
From:   Luke Jones <luke@ljones.dev>
To:     Hans de Goede <hdegoede@redhat.com>,
        Kristian Angelov <kristiana2000@abv.bg>
Cc:     platform-driver-x86@vger.kernel.org
Date:   Sat, 15 Jul 2023 22:03:45 +1200
In-Reply-To: <7ae06b8a-6c67-f6a6-06ed-2b6c8430c12c@redhat.com>
References: <ZLGzxoJN_7Dhl_si@wyvern.localdomain>
         <7ae06b8a-6c67-f6a6-06ed-2b6c8430c12c@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.48.3 (by Flathub.org) 
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

T24gU2F0LCAyMDIzLTA3LTE1IGF0IDExOjQwICswMjAwLCBIYW5zIGRlIEdvZWRlIHdyb3RlOgo+
IEhpIEtyaXN0aWFuLAo+IAo+IE9uIDcvMTQvMjMgMjI6NDQsIEtyaXN0aWFuIEFuZ2Vsb3Ygd3Jv
dGU6Cj4gPiBUaGlzIHBhdGNoIGZpeGVzIHNldHRpbmcgdGhlIGNtZCB2YWx1ZXMgdG8gMHhiMyBh
bmQgMHhiNC4KPiA+IFRoaXMgaXMgbmVjZXNzYXJ5IG9uIHNvbWUgVFVGIGxhcHRvcHMgaW4gb3Jk
ZXIgdG8gc2V0IHRoZSBSR0IgbW9kZS4KPiA+IAo+ID4gQ2xvc2VzOgo+ID4gaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvcGxhdGZvcm0tZHJpdmVyLXg4Ni80NDMwNzgxNDguNDkxMDIyLjE2Nzc1NzYy
OTgxMzNAbm04My5hYnYuYmcKPiA+IFNpZ25lZC1vZmYtYnk6IEtyaXN0aWFuIEFuZ2Vsb3YgPGty
aXN0aWFuYTIwMDBAYWJ2LmJnPgo+ID4gLS0tCj4gPiDCoFYxIC0+IFYyLiBNYWtlIHNldHRpbmcg
MHhiMyBhbmQgMHhiNCB0aGUgZGVmYXVsdCBsb2dpYwo+ID4gwqAKPiA+IMKgZHJpdmVycy9wbGF0
Zm9ybS94ODYvYXN1cy13bWkuYyB8IDEzICsrKysrKysrKysrLS0KPiA+IMKgMSBmaWxlIGNoYW5n
ZWQsIDExIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL3BsYXRmb3JtL3g4Ni9hc3VzLXdtaS5jCj4gPiBiL2RyaXZlcnMvcGxhdGZvcm0v
eDg2L2FzdXMtd21pLmMKPiA+IGluZGV4IDEwMzhkZmRjZGQzMi4uZWI4MmVkNzIzYjQyIDEwMDY0
NAo+ID4gLS0tIGEvZHJpdmVycy9wbGF0Zm9ybS94ODYvYXN1cy13bWkuYwo+ID4gKysrIGIvZHJp
dmVycy9wbGF0Zm9ybS94ODYvYXN1cy13bWkuYwo+ID4gQEAgLTczOCwxMyArNzM4LDIyIEBAIHN0
YXRpYyBzc2l6ZV90IGtiZF9yZ2JfbW9kZV9zdG9yZShzdHJ1Y3QKPiA+IGRldmljZSAqZGV2LAo+
ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBzdHJ1Y3QgZGV2aWNlX2F0dHJpYnV0ZSAqYXR0ciwKPiA+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29u
c3QgY2hhciAqYnVmLCBzaXplX3QgY291bnQpCj4gPiDCoHsKPiA+IC3CoMKgwqDCoMKgwqDCoHUz
MiBjbWQsIG1vZGUsIHIsIGcswqAgYizCoCBzcGVlZDsKPiA+ICvCoMKgwqDCoMKgwqDCoHUzMiBj
bWQsIG1vZGUsIHIsIGcsIGIsIHNwZWVkOwo+ID4gwqDCoMKgwqDCoMKgwqDCoGludCBlcnI7Cj4g
PiDCoAo+ID4gwqDCoMKgwqDCoMKgwqDCoGlmIChzc2NhbmYoYnVmLCAiJWQgJWQgJWQgJWQgJWQg
JWQiLCAmY21kLCAmbW9kZSwgJnIsICZnLAo+ID4gJmIsICZzcGVlZCkgIT0gNikKPiA+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIC1FSU5WQUw7Cj4gPiDCoAo+ID4gLcKg
wqDCoMKgwqDCoMKgY21kID0gISFjbWQ7Cj4gPiArwqDCoMKgwqDCoMKgwqAvKiBCMyBpcyBzZXQg
YW5kIEI0IGlzIHNhdmUgdG8gQklPUy4gT25seSBzZXQgYnkgZGVmYXVsdCovCj4gPiArwqDCoMKg
wqDCoMKgwqBzd2l0Y2ggKGNtZCkgewo+ID4gK8KgwqDCoMKgwqDCoMKgZGVmYXVsdDoKPiA+ICvC
oMKgwqDCoMKgwqDCoGNhc2UgMDoKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBj
bWQgPSAweGIzOwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGJyZWFrOwo+ID4g
K8KgwqDCoMKgwqDCoMKgY2FzZSAxOgo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oGNtZCA9IDB4YjQ7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgYnJlYWs7Cj4g
PiArwqDCoMKgwqDCoMKgwqB9Cj4gCj4gWW91IGFyZSBub3cgbGVhdmluZyB0aGUgdmFsdWUgb2Yg
Y21kIHVubW9kaWZpZWQgZm9yIHZhbHVlcyB3aGljaCBhcmUKPiBub3QgMCBhbmQgMS4KPiAKPiBJ
IHRoaW5rIHlvdSBuZWVkIHRvIGFkZCBhOgo+IAo+IMKgwqDCoMKgwqDCoMKgwqBkZWZhdWx0Ogo+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIC1FSU5WQUw7Cj4gCj4gaGVy
ZSB0byBjYXRjaCBjbWQgbm90IGJlaW5nIGVpdGhlciAwIG9yIDEuCj4gCj4gTHVrZSwgd2hhdCBk
byB5b3UgdGhpbmsgPwoKTG9va3MgZmluZSB0byBtZS4KClNpZ25lZC1vZmYtYnk6IEx1a2UgRC4g
Sm9uZXMgPGx1a2VAbGpvbmVzLmRldj4KCj4gCj4gUmVnYXJkcywKPiAKPiBIYW5zCj4gCj4gCj4g
Cj4gPiDCoAo+ID4gwqDCoMKgwqDCoMKgwqDCoC8qIFRoZXNlIGFyZSB0aGUga25vd24gdXNhYmxl
IG1vZGVzIGFjcm9zcyBhbGwgVFVGL1JPRyAqLwo+ID4gwqDCoMKgwqDCoMKgwqDCoGlmIChtb2Rl
ID49IDEyIHx8IG1vZGUgPT0gOSkKPiAKCg==

