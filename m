Received: from mail-dl2-f12.google.com (mail-dl2-f12.google.com [74.125.229.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD10B245020
	for <platform-driver-x86@vger.kernel.org>; Fri,  2 Oct 2026 00:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790902310; cv=pass; b=W0BCW+TnHcgOr0Z1a+oS12Gg3eQcfgH6ijhm2D2KTApbdHkneHiAGV0OW7SLBYkVY+F4QQsSXA95trALEgd70G74Fwf2UYF0VXFczw1ttcrl83uzJ53/pzsC3ecLRvx/hz0DVwofdNu95TqtfMUXG4Dg/kNyi7sc2BKJ0iXycoM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790902310; c=relaxed/simple;
	bh=9QQqHOadwXuusF7gU35Z6uz7wb0aFhZEe5rXnNisqoI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bIn75ppvI+KITO5B4Q+Xb3bCWoSoLim3I9Aq03JbjLdQbq0nTpmdIG9NAKnji2KM9hermuPx7yCBE6kASiw9YOK9TIeTTliNsQnjGC9gd0+ELmZ78ZQipGiZfIa+TbBOJMw3JeOx5mWZGm9WKPvbW4nQ4QfpKt6CBuheG58G7Gk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DGlBSW6t; arc=pass smtp.client-ip=74.125.229.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DGlBSW6t"
Received: by mail-dl2-f12.google.com with SMTP id a92af1059eb24-142dd046b87so5645405c88.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 01 Oct 2026 17:51:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790902308; cv=none;
        d=google.com; s=arc-20260327;
        b=MSddVnrJhoa9XZnkCvs/k3IyazV6ksaFD3gNzMysp8aqeGioOhinGiAQ3VpzGr6bcm
         IZ3+bb2EL3fMidSbU3xrWJu1okDH28LPR4dBzSbbdraaonkZ6uB8IvDjuUaq5Lq6zJ11
         7npj5x8ut7edyWsTPR1b3D5SKTBimcg34JoeZwQX4vKjPdHwh+57SamfU3IHeaXArsgy
         wzsrQJ+YdR3Tgs0XjxH8S6AL1+/yVu+Y+CCqI10+CGx4Oso30kSMyhifOHR5rziY54EZ
         tD0NQ6roQXYuT411kbLIMJsxLAcwNPyvq+GWCbhG9nEFK+3eVfIu9ylPRnTOtHAcF7Yc
         nRvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=sE/CuYpD2omdv56O8W5E92PUkQBPf5btg8nJi2MeDfM=;
        fh=4sYtVjLJBnrEE4r4ZH11p4l6Rpif/Xkj85BG3wxqs9M=;
        b=XIRCxRzOKPgAtfIVjUoyoH7a74YTmcLmYgL3j2mgncg8WntvXJcez2ttvmyylJVX40
         d9FgrFifQwPFy0ckRGDO9dEgBHA6VQ8Q8ZQBnEDVffDMMIOjFyja1AVrP+2YpSHaTlix
         ubmtYoZEeSDYdV9s959OwIGkP+C/uB2TR0Y7V86Xa3ZOdq9kduKQqsBySfrwoh2RivUn
         xbRzQNUqTPPd/Jcj6pS22s34l1KUpM5HWFgjHDzApmfQFIFWatfCQRaw3qUJCKX8a1eC
         xG/xV9MH/iybHh6rlQ34P2JIATpI9OMvGsDkqB0izCmrQ7/uAybgQr1Bq+QvzZjZAmC4
         w/qw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790902308; x=1791507108; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sE/CuYpD2omdv56O8W5E92PUkQBPf5btg8nJi2MeDfM=;
        b=DGlBSW6tbtzm8scziDGC/fo36r5objBX3C7/2/p/rD54/k+e06GxRfeUvRoK8UfWqW
         bLS6V1X4yDLuUUU/N47Jk00H7ciXYSmw9GjYP3YSZFVWlZFhAPNU0ahEq2kLSMBZAEAA
         QmTYcnKs2rFSEJPv6VueJRRXPLlbrVRbw4Q9hvo6cj6uHt2cbCuB1IbzrjGAEjQn91Xb
         9INTCTyT1xL0jKtkoUJhKMCy4bzcznRDVmE0h7yMx6NbvNw2XYxoEuMmyGNjeF2xehIU
         Q93GL8RxAY0+8Yss0tyt2F0Oxamk4E4OIlFLzeBydvfyawPSXlzxwfKRJJtR63GXwkLM
         RqOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790902308; x=1791507108;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sE/CuYpD2omdv56O8W5E92PUkQBPf5btg8nJi2MeDfM=;
        b=y9SFvjHB4J+WW7M85qAkEnbV/NNZLQMOyJ6EszQyT51hmHl8sZ0haoFk+t+0cuIB3g
         t+Bj4HijwCNhViaZ9/cotR/Y++CJEorJ30413eM9/Qx3wZMqV2IV8gzJzc2I/k6TFrlt
         4By6PxwQUF7xQCWpIe0fLMdEqP00KwDHhM+QJKhRetqfelhFbHIjmeSNVj+jRLn85Xda
         hiAVjY3hTIxMlXb/IuQDicXrpkrz58y+8Rd8/VqsFlbuK5ARLEn+fek6TNDW3syxco1f
         f82qe5pLM3qHAll1aDUhcLZWOTlBkU9EFcY2Ol/SQSOf19vHq8p8e/tIdt8s5QMKoyAl
         7Wag==
X-Forwarded-Encrypted: i=1; AKwUvByVy4V3x+s7SmYn8Rxr+DGGLQwA/aHU18X2qaFJQ4g5EspWiRVjEZutQfHxZdZJ29rJVyMUR4lLPPdqoaSja8fub/XU@vger.kernel.org
X-Gm-Message-State: AFuF++m8P2mBhRV1bWaVExGGuqf6xifwbL1zkQ+n19CNwIofUeceZlZh
	0X0GsMWeD8KuX0woHBv7+N5lktaB2zi/5ru/45LDp4F2VyJNE0t9B/Su0623wPYaBwSbSd7XsaE
	2Fyzh4jGM8AXQ1/c0C8M4Tio8L+JP8Ro=
X-Gm-Gg: AYBFou1TjB5/9any97PYCV4GGe9wNvJsBZA04LLhUn2W6cZG+Zq4RThv/YFFSOp6661
	a1lHrl9KyBOw8z1oiIl6fKYQkYnDIIUYV41fuaqGv7HoV+sWQnCpweQTXdXhJToItzjgp/nK1PQ
	/cmfKFZZnoyPkWondmjnEGIPIsOPtX7aAvNnWb/pGoU2jyc/ecjFwPlQyOg13cYYG+xr0/twT1C
	/K0v52ihD2Lch9OYPx7WAAyidX9KpN7KeqPuTohVSUxtQn3aV7CEYkqDRrNnCvOq7tR+zY3Jf+1
	Khy05nzY0RdtyN7Ms8C/yjHKFnMO6OcQ4FaTvIaW8IpwSzx29EHNWXOxEpxF9I3oixlW8aIys5r
	H/XEA9gayhgmeRvOfO2pSWN7Dq1v5EZu1Xmyfiho=
X-Received: by 2002:a05:7022:b053:20b0:143:8865:cc7 with SMTP id
 a92af1059eb24-14f5b51545dmr1167883c88.21.1790902307643; Thu, 01 Oct 2026
 17:51:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929134503.17249-1-qby140326@gmail.com> <20260929134503.17249-6-qby140326@gmail.com>
 <20260930015058.3076905-1-uselessfire@gmail.com> <CAObHBTwnv+kEaFdCp+cr31HtdSo3CaRq84T8vr-Pm75yZMTHqQ@mail.gmail.com>
In-Reply-To: <CAObHBTwnv+kEaFdCp+cr31HtdSo3CaRq84T8vr-Pm75yZMTHqQ@mail.gmail.com>
From: =?UTF-8?Q?Milo=C5=A1_Vlku?= <vlku.milos.fun@gmail.com>
Date: Fri, 2 Oct 2026 02:51:35 +0200
X-Gm-Features: AclHuK8cR2FAAtPPVrY8Kiipfv2sKqbjaHguEsz76PnmybJp07-9EQAMJkpjaMY
Message-ID: <CAObHBTxHQDfVH8Su1DLABtC5uUsAGBBk=KvcCOvtTs5gMGamnA@mail.gmail.com>
Subject: Re: [PATCH v6 5/5] platform/x86: bitland-mifs-wmi: Add per-machine
 ops table
To: Anton Karasev <uselessfire@gmail.com>
Cc: qby140326@gmail.com, ilpo.jarvinen@linux.intel.com, hansg@kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	W_Armin@gmx.de, ilya.gladyshev@linux.dev, foxido@foxido.dev, kento@kekto.ru, 
	ericted8810@gmail.com, chris@miget.com, matias.civadda2342001@gmail.com, 
	btx342@gmail.com, wleizc7319@gmail.com, wolf109909@outlook.com, i@rsplwe.com, 
	bozhenpeng93@gmail.com, martiya.ar@gmail.com, aleksejirlik@gmail.com
Content-Type: multipart/mixed; boundary="000000000000e0cfcc065cd0ef84"

--000000000000e0cfcc065cd0ef84
Content-Type: text/plain; charset="UTF-8"

Follow-up to my own mail: I have now run those values rather than only
reading them out of the tables.

Built current pdx86 for-next with Chris's GET-only function-id change
and balanced 1 / quiet 2 / performance 3 / full speed 4 on top. All four
profiles apply and read back correctly, checked against the EC register
each time:

  low-power            -> QFAN 2
  balanced             -> QFAN 1
  balanced-performance -> QFAN 3
  performance          -> QFAN 4

All three power-profiles-daemon profiles work as well, so the desktop
slider works end to end on TM2307.

Two things fell out of that:

- Without Chris's change every one of those writes fails with -ENOMSG
  here, exactly as you described, and with it all of them succeed. So
  that is a Tested-by from a second board if it is useful.

- No machine-specific capability check is needed on this one.
  WMI_FN_SYSTEM_AC_TYPE is unimplemented, Armin's work reports that as
  -EOPNOTSUPP, and bitland_pp_check_capability() already treats that as
  "skip the check". The stock one is fine as-is.

So the TM2307 entry comes out as just a mode map plus a DMI match.
Attached, against the v9 ops table and checkpatch-clean, in case it is
useful to have in hand while you write the TM2309 one. I will resend it
properly once that series settles -- posting it now mainly so the values
sit somewhere concrete, and Mingyou can fold it straight into v10 if
that is easier than carrying a separate patch.

Thanks,
Milos

--000000000000e0cfcc065cd0ef84
Content-Type: application/octet-stream; name="0001-tm2307-ops-entry.patch"
Content-Disposition: attachment; filename="0001-tm2307-ops-entry.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_muq8xglt0>
X-Attachment-Id: f_muq8xglt0

RnJvbTogTWlsb8WhIFZsa3UgPHZsa3UubWlsb3MuZnVuQGdtYWlsLmNvbT4KRGF0ZTogVGh1LCAy
IE9jdCAyMDI2IDAyOjQ1OjAwICswMjAwClN1YmplY3Q6IFtQQVRDSF0gcGxhdGZvcm0veDg2OiBi
aXRsYW5kLW1pZnMtd21pOiBBZGQgWGlhb21pIFJlZG1pIEJvb2sgUHJvIDE0CiAyMDI0CgpUaGUg
WGlhb21pIFJlZG1pIEJvb2sgUHJvIDE0IDIwMjQgKGJvYXJkIFRNMjMwNykgc3BlYWtzIHRoZSBz
YW1lIE1JRlMKV01JIGludGVyZmFjZSBidXQgZW5jb2RlcyBXTUlfRk5fU1lTVEVNX1BFUl9NT0RF
IGRpZmZlcmVudGx5IGZyb20gdGhlCkJpdGxhbmQgZGVmYXVsdC4KCldNQUEgKFNTRFQgd2l0aCBP
RU0gVGFibGUgSUQgWE1DQzE4MDYpIHdyaXRlcyB0aGUgdmFsdWUgaGFuZGVkIHRvCldNSV9GTl9T
WVNURU1fUEVSX01PREUgc3RyYWlnaHQgaW50byB0aGUgRUMgcmVnaXN0ZXIgUUZBTiwgYW5kIE5U
RFAgaW4KdGhlIERTRFQgbWFwcyBRRkFOIG9udG8gdGhlIERQVEYgdmFyaWFibGUgT0RWMToKCiAg
UUZBTiAgbWVhbmluZyAgICAgICAgICAgICAgICAgIE9EVjEKICAxICAgICBiYWxhbmNlZCAgICAg
ICAgICAgICAgICAgMAogIDIgICAgIHF1aWV0ICAgICAgICAgICAgICAgICAgICAyCiAgMyAgICAg
cGVyZm9ybWFuY2UgICAgICAgICAgICAgIDEKICA0ICAgICBmdWxsIHNwZWVkICAgICAgICAgICAg
ICAgNAoKMCBpcyBub3QgYSBtb2RlLiBOZWl0aGVyIHRoZSBmbjggZ2V0dGVyIG5vciB0aGUgRm4r
ZmFuIGhvdGtleSBoYW5kbGVyCmVudW1lcmF0ZXMgaXQsIGFuZCB3cml0aW5nIGl0IGxlYXZlcyB0
aGUgRUMgd2l0aCBubyBmYW4gY3VydmUgYXQgYWxsOgptZWFzdXJlZCBvdmVyIGEgZml4ZWQgMTUw
IHMgd2luZG93IGZyb20gdGhlIHNhbWUgODAgQyBzdGFydCBhdCB0aGUgc2FtZQpwaW5uZWQgcG93
ZXIgbGltaXQsIHRoZSBwYWNrYWdlIHNoZWQgMTUuMiBDIChzZCAxLjQ4LCBuPTQpIGF0IFFGQU4g
MAphZ2FpbnN0IDI5LjUgQyAoc2QgMS4xMiwgbj00KSBhdCBRRkFOIDEsIHdpdGggbm8gb3Zlcmxh
cCBiZXR3ZWVuIHRoZQp0d28gcmFuZ2VzLCBhbmQgdGhlIGNoYXNzaXMgc2Vuc29ycyBlbmRlZCA4
LTEwIEMgaG90dGVyLiBUaGUgZGVmYXVsdApiaXRsYW5kX21vZGVfbWFwIHNlbmRzIDAgZm9yIFBM
QVRGT1JNX1BST0ZJTEVfQkFMQU5DRUQsIHdoaWNoIGlzIHRoZQpwcm9maWxlIHBvd2VyLXByb2Zp
bGVzLWRhZW1vbiBzZWxlY3RzIGF0IGV2ZXJ5IGJvb3QuCgpObyBtYWNoaW5lLXNwZWNpZmljIGNh
cGFiaWxpdHkgY2hlY2sgaXMgbmVlZGVkLiBUaGlzIGZpcm13YXJlIGRvZXMgbm90CmltcGxlbWVu
dCBXTUlfRk5fU1lTVEVNX0FDX1RZUEUsIGFuZCBzaW5jZSBjb21taXQgIkRldGVjdCBmYWlsZWQK
ZnVuY3Rpb24gY2FsbHMiIHRoYXQgaXMgcmVwb3J0ZWQgYXMgLUVPUE5PVFNVUFAsIHdoaWNoCmJp
dGxhbmRfcHBfY2hlY2tfY2FwYWJpbGl0eSgpIGFscmVhZHkgdHJlYXRzIGFzICJza2lwIHRoZSBj
aGVjayIuCgpUZXN0ZWQgb24gVE0yMzA3IChCSU9TIFJNQU1UNEIwUDBCMEIgMDYvMTAvMjAyNSwg
Ymlvc19yZWxlYXNlIGFuZAplY19maXJtd2FyZV9yZWxlYXNlIDEuMTEpOiBhbGwgZm91ciBwcm9m
aWxlcyBhcHBseSBhbmQgcmVhZCBiYWNrCmNvcnJlY3RseSwgdmVyaWZpZWQgYWdhaW5zdCB0aGUg
RUMgcmVnaXN0ZXIsIGFuZCB0aGUgdGhyZWUKcG93ZXItcHJvZmlsZXMtZGFlbW9uIHByb2ZpbGVz
IHdvcmsuCgpTaWduZWQtb2ZmLWJ5OiBNaWxvxaEgVmxrdSA8dmxrdS5taWxvcy5mdW5AZ21haWwu
Y29tPgotLS0KRGVwZW5kcyBvbiAiW1BBVENIIHY5IDUvNl0gcGxhdGZvcm0veDg2OiBiaXRsYW5k
LW1pZnMtd21pOiBBZGQKcGVyLW1hY2hpbmUgb3BzIHRhYmxlIiBhbmQgb24gQ2hyaXMncyAiT25s
eSBjaGVjayB0aGUgZnVuY3Rpb24gaWQgb2YKR0VUIHJlc3BvbnNlcyIgLS0gd2l0aG91dCB0aGUg
bGF0dGVyIGV2ZXJ5IFNFVCBvbiB0aGlzIGZpcm13YXJlIHJldHVybnMKLUVOT01TRywgYmVjYXVz
ZSBXTUFBIGZpbGxzIGluIHRoZSBmdW5jdGlvbiBpZCBvbmx5IG9uIEdFVCByZXNwb25zZXMuCgog
ZHJpdmVycy9wbGF0Zm9ybS94ODYvYml0bGFuZC1taWZzLXdtaS5jIHwgMjkgKysrKysrKysrKysr
KysrKysrKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDI4IGluc2VydGlvbnMoKyksIDEgZGVsZXRp
b24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3BsYXRmb3JtL3g4Ni9iaXRsYW5kLW1pZnMtd21p
LmMgYi9kcml2ZXJzL3BsYXRmb3JtL3g4Ni9iaXRsYW5kLW1pZnMtd21pLmMKLS0tIGEvZHJpdmVy
cy9wbGF0Zm9ybS94ODYvYml0bGFuZC1taWZzLXdtaS5jCisrKyBiL2RyaXZlcnMvcGxhdGZvcm0v
eDg2L2JpdGxhbmQtbWlmcy13bWkuYwpAQCAtOTcsNiArOTcsMjEgQEAgc3RhdGljIGNvbnN0IHN0
cnVjdCBiaXRsYW5kX3Byb2ZpbGVfbW9kZV9tYXAgYml0bGFuZF9tb2RlX21hcCA9IHsKIAkuZnVs
bF9zcGVlZCA9IFdNSV9QUF9GVUxMX1NQRUVELAogfTsKIAorLyoKKyAqIFhpYW9taSBSZWRtaSBC
b29rIFBybyAxNCAyMDI0IChUTTIzMDcpLiBXTUFBIHdyaXRlcyB0aGUgdmFsdWUgc3RyYWlnaHQK
KyAqIGludG8gdGhlIEVDIFFGQU4gcmVnaXN0ZXIsIHdoaWNoIGVudW1lcmF0ZXMgMS00OyAwIGlz
IG5vdCBhIG1vZGUgYW5kCisgKiBsZWF2ZXMgdGhlIEVDIHdpdGhvdXQgYSBmYW4gY3VydmUuCisg
Ki8KK3N0YXRpYyBjb25zdCBzdHJ1Y3QgYml0bGFuZF9wcm9maWxlX21vZGVfbWFwIHJlZG1pX3Rt
MjMwN19tb2RlX21hcCA9IHsKKwkuYmFsYW5jZWQgPSAxLAorCS5wZXJmb3JtYW5jZSA9IDMsCisJ
LnF1aWV0ID0gMiwKKwkuZnVsbF9zcGVlZCA9IDQsCit9OworCiBzdGF0aWMgaW50IGJpdGxhbmRf
cHBfY2hlY2tfY2FwYWJpbGl0eShzdHJ1Y3QgYml0bGFuZF9taWZzX3dtaV9kYXRhICpkYXRhKTsK
IAogLyoKQEAgLTExOCw4ICsxMzMsMjAgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBiaXRsYW5kX21p
ZnNfb3BzIGJpdGxhbmRfb3BzID0gewogCS5oYXNfZnVsbF9zcGVlZCA9IHRydWUsCiB9OwogCitz
dGF0aWMgY29uc3Qgc3RydWN0IGJpdGxhbmRfbWlmc19vcHMgcmVkbWlfdG0yMzA3X29wcyA9IHsK
KwkubmFtZSA9ICJSZWRtaSBCb29rIFBybyAxNCAyMDI0IiwKKwkubW9kZV9tYXAgPSAmcmVkbWlf
dG0yMzA3X21vZGVfbWFwLAorCS5jaGVja19wZXJmb3JtYW5jZV9jYXBhYmlsaXR5ID0gYml0bGFu
ZF9wcF9jaGVja19jYXBhYmlsaXR5LAorCS5oYXNfZnVsbF9zcGVlZCA9IHRydWUsCit9OworCiBz
dGF0aWMgY29uc3Qgc3RydWN0IGRtaV9zeXN0ZW1faWQgYml0bGFuZF9taWZzX2RtaV90YWJsZVtd
ID0geworCXsKKwkJLyogWGlhb21pIFJlZG1pIEJvb2sgUHJvIDE0IDIwMjQgKi8KKwkJLm1hdGNo
ZXMgPSB7CisJCQlETUlfTUFUQ0goRE1JX1NZU19WRU5ET1IsICJYSUFPTUkiKSwKKwkJCURNSV9N
QVRDSChETUlfQk9BUkRfTkFNRSwgIlRNMjMwNyIpLAorCQl9LAorCQkuZHJpdmVyX2RhdGEgPSAo
dm9pZCAqKSZyZWRtaV90bTIzMDdfb3BzLAorCX0sCiAJe30KIH07CiAK
--000000000000e0cfcc065cd0ef84--
