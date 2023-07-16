Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0DACEB64DD
	for <platform-driver-x86@archiver.kernel.org>; Sun, 16 Jul 2023 22:06:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231439AbjGPWGz (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 16 Jul 2023 18:06:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231440AbjGPWGn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 16 Jul 2023 18:06:43 -0400
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2E2B1FCD
        for <platform-driver-x86@vger.kernel.org>; Sun, 16 Jul 2023 15:05:54 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 0C14D5C0082;
        Sun, 16 Jul 2023 17:56:27 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Sun, 16 Jul 2023 17:56:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm1; t=
        1689544587; x=1689630987; bh=OZHeGa9L4v/wd3t4pAleBnFFMVcGvRw1og5
        iJfleq6E=; b=Ih9bKAf5tSDVgXdjI7G36uDP+KtT5Ak09CItWv0fjfvtPYu2dim
        T4kS3pGKK6UCbxDn1ntbKtby/jjqEXYdKEwa5vg8Bkv5BmsaaWvL5zXYGMjgzy4t
        3oZX/SpMQC/JuflFvp08NnrKeG1VNCm+VlRAcaB3+RtqOgb7GuY1uoDvcOMKA3Wc
        c4JMMWV40wY5QqXIHys6Uu+snR9yj+FB/P3chB7PnRZoHCX3ZJg3fiOc1SY0Hmeq
        aDgIoZWAmO1UYYYKYVX3pgKWNJ2GQkiZjl4v6WTlRFX7mzZED618Qrm6tf8GLi1J
        l19FkXjDSLdBs1VA76ib3/L8A5gGW8mX/uA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
        1689544587; x=1689630987; bh=OZHeGa9L4v/wd3t4pAleBnFFMVcGvRw1og5
        iJfleq6E=; b=oaYcLiNc773XaBcnDwsMgU6wLwVCoGKVeJGKjroLVgo1a+cCEjk
        enq421QGNMeHIW1c1zCLFyiHockThr3cBhMhwyQfcp3ohL9Uu6GCV/LJ05MjGFv3
        yI8ZuEMoagRBOG5wD7tUcY7EHAPeaMbVB7noAA0QIRUGBRXqPDg8sutwEb6ZZ3jm
        CBLYB/Iwgj0caj64bI9KW0KPe+MJKttF+lb5zzYr8r3nX52qLWB0P4VQndxEJwGU
        ox5KnxVjzTv1mjKhQXL8hB+XZOYrUrAn3lYHLsiLiXe4ShPSnxdV7PUAXV8gmYle
        Ee7wFDHfUdLc8yj0DKV43f8BCZNU8ZKuBKA==
X-ME-Sender: <xms:ime0ZKScoD1NMlq-YJtg7PDfc8rUcxFtiu6cKzS_GahtIXFBeB7M3Q>
    <xme:ime0ZPwlRHFnUuWkFgCi3lU6LKc4845rPeaiuekKthtW0DRHqXkf9ew69j7QslYAG
    cQsjHAzLq6_kDqzSDk>
X-ME-Received: <xmr:ime0ZH3s1PeKGwcnT3S2x6GSiq4rPQBqjCey20pX7zvfpGdcAx0aLXojFvjKBcHzbaiGmQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrgedugddtgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefkuffhvfevffgjfhgtgfgfggesthgsredttderjeenucfhrhhomhepnfhukhgv
    ucflohhnvghsuceolhhukhgvsehljhhonhgvshdruggvvheqnecuggftrfgrthhtvghrnh
    epveejleeludfgheettdelvedtgeejieetieffiefhudeiffffffeftdetffekvdelnecu
    ffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehluhhkvgeslhhjohhnvghsrdguvghv
X-ME-Proxy: <xmx:ime0ZGBrQIDhhDsemdBsJlMu3Fh-VH0ox8EWP2Rjz_M0jCH_TpaWAA>
    <xmx:ime0ZDi8qfRkXBedNF63q26glCWWPg4sP_skWD7Hh38XbijeU0D6cg>
    <xmx:ime0ZCoQ5j_3o2xLU9qTT3M3mCr1MacCRl1FJPeN7n4_BZSty5ujkQ>
    <xmx:i2e0ZDI8sipArD9YgAJ0vk22Rd2M3RIPQg7Rmi5T5ub-kntUmzzQRQ>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Jul 2023 17:56:24 -0400 (EDT)
Message-ID: <03480f41ced8a854ad341291e1875c4e30b6a57f.camel@ljones.dev>
Subject: Re: [PATCH v2] platform/x86: asus-wmi: Fix setting RGB mode on some
 TUF laptops
From:   Luke Jones <luke@ljones.dev>
To:     Kristian Angelov <kristiana2000@abv.bg>
Cc:     hdegoede@redhat.com, platform-driver-x86@vger.kernel.org
Date:   Mon, 17 Jul 2023 09:56:18 +1200
In-Reply-To: <826952617.2041770.1689442828976@nm81.abv.bg>
References: <ZLGzxoJN_7Dhl_si@wyvern.localdomain>
         <7ae06b8a-6c67-f6a6-06ed-2b6c8430c12c@redhat.com>
         <1549bab6dae1e4509f7190469c0d2371f127a4f0.camel@ljones.dev>
         <87d34e1d-1fcb-6d24-662f-91ff62f65dc2@redhat.com>
         <5bc0abe6f218bf7ae59dc20de099e3609e077a36.camel@ljones.dev>
         <826952617.2041770.1689442828976@nm81.abv.bg>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.48.3 (by Flathub.org) 
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

T24gU2F0LCAyMDIzLTA3LTE1IGF0IDIwOjQwICswMzAwLCBLcmlzdGlhbiBBbmdlbG92IHdyb3Rl
Ogo+IE9uIDE1LzA3LzIzIDA5OjQwLMKgSGFucyBkZSBHb2VkZSB3cm90ZToKPiA+IEhpIEtyaXN0
aWFuLAo+ID4gwqAKPiA+IE9uIDcvMTQvMjMgMjI6NDQsIEtyaXN0aWFuIEFuZ2Vsb3Ygd3JvdGU6
Cj4gPiA+IFRoaXMgcGF0Y2ggZml4ZXMgc2V0dGluZyB0aGUgY21kIHZhbHVlcyB0byAweGIzIGFu
ZCAweGI0Lgo+ID4gPiBUaGlzIGlzIG5lY2Vzc2FyeSBvbiBzb21lIFRVRiBsYXB0b3BzIGluIG9y
ZGVyIHRvIHNldCB0aGUgUkdCCj4gPiA+IG1vZGUuCj4gPiA+IMKgCj4gPiA+IENsb3NlczoKPiA+
ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvcGxhdGZvcm0tZHJpdmVyLXg4Ni80NDMwNzgxNDgu
NDkxMDIyLjE2Nzc1NzYyOTgxMzNAbm04My5hYnYuYmcKPiA+ID4gU2lnbmVkLW9mZi1ieTogS3Jp
c3RpYW4gQW5nZWxvdiA8a3Jpc3RpYW5hMjAwMEBhYnYuYmc+Cj4gPiA+IC0tLQo+ID4gPiDCoCBW
MSAtPiBWMi4gTWFrZSBzZXR0aW5nIDB4YjMgYW5kIDB4YjQgdGhlIGRlZmF1bHQgbG9naWMKPiA+
ID4gwqDCoAo+ID4gPiDCoCBkcml2ZXJzL3BsYXRmb3JtL3g4Ni9hc3VzLXdtaS5jIHwgMTMgKysr
KysrKysrKystLQo+ID4gPiDCoCAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkKPiA+ID4gwqAKPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGxhdGZvcm0v
eDg2L2FzdXMtd21pLmMKPiA+ID4gYi9kcml2ZXJzL3BsYXRmb3JtL3g4Ni9hc3VzLXdtaS5jCj4g
PiA+IGluZGV4IDEwMzhkZmRjZGQzMi4uZWI4MmVkNzIzYjQyIDEwMDY0NAo+ID4gPiAtLS0gYS9k
cml2ZXJzL3BsYXRmb3JtL3g4Ni9hc3VzLXdtaS5jCj4gPiA+ICsrKyBiL2RyaXZlcnMvcGxhdGZv
cm0veDg2L2FzdXMtd21pLmMKPiA+ID4gQEAgLTczOCwxMyArNzM4LDIyIEBAIHN0YXRpYyBzc2l6
ZV90IGtiZF9yZ2JfbW9kZV9zdG9yZShzdHJ1Y3QKPiA+ID4gZGV2aWNlICpkZXYsCj4gPiA+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgc3RydWN0IGRldmljZV9hdHRyaWJ1dGUgKmF0dHIsCj4gPiA+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29uc3Qg
Y2hhciAqYnVmLCBzaXplX3QgY291bnQpCj4gPiA+IMKgIHsKPiA+ID4gLcKgwqDCoMKgwqDCoMKg
dTMyIGNtZCwgbW9kZSwgciwgZyzCoCBiLMKgIHNwZWVkOwo+ID4gPiArwqDCoMKgwqDCoMKgwqB1
MzIgY21kLCBtb2RlLCByLCBnLCBiLCBzcGVlZDsKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoGludCBl
cnI7Cj4gPiA+IMKgwqAKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoGlmIChzc2NhbmYoYnVmLCAiJWQg
JWQgJWQgJWQgJWQgJWQiLCAmY21kLCAmbW9kZSwgJnIsICZnLAo+ID4gPiAmYiwgJnNwZWVkKSAh
PSA2KQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiAtRUlOVkFM
Owo+ID4gPiDCoMKgCj4gPiA+IC3CoMKgwqDCoMKgwqDCoGNtZCA9ICEhY21kOwo+ID4gPiArwqDC
oMKgwqDCoMKgwqAvKiBCMyBpcyBzZXQgYW5kIEI0IGlzIHNhdmUgdG8gQklPUy4gT25seSBzZXQg
YnkKPiA+ID4gZGVmYXVsdCovCj4gPiA+ICvCoMKgwqDCoMKgwqDCoHN3aXRjaCAoY21kKSB7Cj4g
PiA+ICvCoMKgwqDCoMKgwqDCoGRlZmF1bHQ6Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoGNhc2UgMDoK
PiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGNtZCA9IDB4YjM7Cj4gPiA+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBicmVhazsKPiA+ID4gK8KgwqDCoMKgwqDCoMKg
Y2FzZSAxOgo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgY21kID0gMHhiNDsK
PiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGJyZWFrOwo+ID4gPiArwqDCoMKg
wqDCoMKgwqB9Cj4gPiDCoAo+ID4gWW91IGFyZSBub3cgbGVhdmluZyB0aGUgdmFsdWUgb2YgY21k
IHVubW9kaWZpZWQgZm9yIHZhbHVlcyB3aGljaAo+ID4gYXJlIG5vdCAwIGFuZCAxLgo+ID4gwqAK
PiA+IEkgdGhpbmsgeW91IG5lZWQgdG8gYWRkIGE6Cj4gPiDCoAo+ID4gwqDCoMKgwqDCoMKgwqDC
oGRlZmF1bHQ6Cj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiAtRUlO
VkFMOwo+ID4gwqAKPiA+IGhlcmUgdG8gY2F0Y2ggY21kIG5vdCBiZWluZyBlaXRoZXIgMCBvciAx
Lgo+ID4gwqAKPiA+IEx1a2UsIHdoYXQgZG8geW91IHRoaW5rID8KPiA+IMKgCj4gPiBSZWdhcmRz
LAo+ID4gwqAKPiA+IEhhbnMKPiAKPiAKPiBIaSBIYW5zLAo+IAo+IAo+IElmIHlvdSB3b3VsZCBu
b3RpY2UgSSBkaWQ6Cj4gPiDCoMKgwqDCoMKgwqDCoMKgc3dpdGNoIChjbWQpIHsKPiA+IMKgwqDC
oMKgwqDCoMKgwqBkZWZhdWx0Ogo+ID4gwqDCoMKgwqDCoMKgwqDCoGNhc2UgMDoKPiA+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgY21kID0gMHhiMzsKPiA+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgYnJlYWs7Cj4gCj4gCj4gSW4gdGhlIGNhc2Ugb2YgY21kIG5vdCBi
ZWluZyAxIG9yIDAuIEl0IHdvdWxkIGRlZmF1bHQgdG8gMCB3aGljaAo+IHdvdWxkIG9ubHkgc2V0
Cj4gdGhlIFJHQiBtb2RlLCBub3Qgc2F2ZSBpdCB0byBCSU9TLiBJIGd1ZXNzIHRoaXMgd291bGQg
ZGVwZW5kIG9uCj4gcHJlZmVyZW5jZS4KPiBJcyBpdCBiZXR0ZXIgdG8gZmFpbCBvdXQgb24gaW52
YWxpZCBpbnB1dCBvciBzaW1wbHkgaWdub3JlIGl0IGFuZAo+IHBlcmZvcm0gdGhlCj4gImRlZmF1
bHQiIGFjdGlvbi4gU2V0dGluZyB0aGUgUkdCIG1vZGUgaXMgbm90IHBlcnNpc3RlbnQsIG9ubHkg
c2F2aW5nCj4gaXQgaXMuIFNvCj4gZGVmYXVsdGluZyB0byB0aGlzIHNlZW1zIHJlYXNvbmFibGUs
IGJ1dCBpZiBub3QgSSdsbCBkbyBhIHYzIHdpdGgKPiBFSU5WQUwgZmFpbC4KCk11Y2ggb2YsIGlm
IG5vdCBhbGwgb2YgYXN1cy13bWkgZm9sbG93cyBhIHN0cmljdCBpL28gYW5kIHdpbGwgRUlOVkFM
IGlmCnRoZSBpbnB1dCBpcyBub3QgY29ycmVjdC4gSXQgd291bGQgYmUgYmVzdCB0byBrZWVwIHRo
aXMgYmVoYXZpb3VyCmNvbnNpc3RlbnQuIEl0IHdvdWxkIGJlIG1pc2xlYWRpbmcgdG8gZm9sa3Mg
aWYgYW55IHZhbHVlIGV4Y2VwdCAxCnByb2R1Y2VkIHRoZSBzYW1lIHJlc3VsdCwgYW5kIHRoZW4g
aWYgdGhlcmUgd2FzIHJlYXNvbiB0byBtYWtlIGEgMgpwcm9kdWNlIHNvbWUgb3RoZXIgZWZmZWN0
IHRoZW4gaXQgYnJlYWtzIHNvbWVvbmUncyBleHBlY3RhdGlvbgpzb21ld2hlcmUuCgoKCg==

