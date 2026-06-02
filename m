Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8710C25B08D
	for <platform-driver-x86@vger.kernel.org>; Tue,  2 Jun 2026 13:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780407188; cv=pass; b=lMHVS0twQWN06RZJyhg9D1nnxx5ZOvx5n9zgFBk+zpGWZbPv7s5YJJiQzgntFwcXqgolKscDHOetVEgY9PRdLhMAxhG1jwEcdSmZOUzakcOdrqW4wC4/Z2v15TYcIWdxHXlyOxWe8qjy86IkxQxo5AlgcsHcw1V/sC2Bjin52pU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780407188; c=relaxed/simple;
	bh=EjxRn7j04J91d6OPr21I6sBz8ays1maGtq4PBxYi5Xo=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=uMOJQ/6OaivZHXDunwPEA0X55+3hOtJYnOeZ67AUfkFf2vzU0MXTODDlxLrt7EJjq1eY31yQibkgDvR8PTfBSVOatWa+wW1EgYDRZO7zJkf/gLibIHUDXnTo7+ooxvDcsd/Lmz0Coi6RvvdHWIFWzaNnBTEX5whU4RxTCzvK8L4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PEVPx+bz; arc=pass smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PEVPx+bz"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-69d694cecd2so3860603eaf.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 02 Jun 2026 06:33:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780407185; cv=none;
        d=google.com; s=arc-20240605;
        b=TCcHjozD6uKPa0Gg7Zkoh4394WkGlFHDkee4NYFqXga1PB5y8Jpftq1mkr2f90vHXE
         3sS1Z5SJrSVG4n4E64IxaP4e4KGeW0VeisiSArf1ChQxtOkZFm/xQJ6lO/fXHIiNbReJ
         RMYp3B8qSaBAOAT93WH+HMt8ra/1M5c196U0H0haRPn+YRFPNNzY0r0EjEGQwcD5piP+
         oGCCLrThsHJy0p3u2BE14RnuB3WauRu/nRehUOY5PUlxBMWqGJ2kGMfBtrGlr/94C6zN
         HQWANTSmllY5qVrLupV0xg4ceF51/EgOMa4oXPY3JzQ0SYkhRJAnvia9aQY5W3QFW36D
         p+lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=3+hdPURsKaRDWPfKlcZWCKF9JH2UM9+MwJBWlbbC9do=;
        fh=Y3tI68rJcvjk6k0z+Th0dis8SilyHfsRdL1ywX0Iwgc=;
        b=C0aEPyi4A47FTdcPe6gr80vAcjVBuYrZQB7gemgVwdXxUU+yI9IQdyzJxy5THaE4bg
         s6KL3HQIL3UL/EwrrAWuH1Z+40DpoKK8v/ESub1cNMUVqTu0IYEDu1CPUjvpUki9sv+p
         Etv8uzH79gkHfAt4ODSr8p9Ksixc173YPgS/jJZIWmFMZkxaM9P9JOXi/QIrtbch8aG8
         U/LtVknO+iyywEP8fSPnSRNj+9bJZK1pCjDiI5K0FNvry5d4R6zq9TjOzLdEQxTl4cf6
         9zAJT7zI/DMjGZlqrsJ6wWdIwjnkTQVM/yackHbm4kErwNOlVeP0RPksJK1REpxt7jgn
         D5+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780407185; x=1781011985; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3+hdPURsKaRDWPfKlcZWCKF9JH2UM9+MwJBWlbbC9do=;
        b=PEVPx+bznvY1Oe2vS65BZ/HcYI+s+ngczfVpp/94XsgSntX7qsB69L5xHhn+v6l9TF
         zBD+99mXWtVG/1xFL9wjl+8r06NmN33scu59HTWTwRfBNbeH+Fl5TBD2kT9d8Enoyygl
         jAKm2ywzWLg3V4DS4GYn46VPQXGkdJSpvqmx6lZI2Ey5Zcvc92BmBAJ9at/FXKO2L4ey
         90SHUlHYxgxDWjG4CZriPghT+sPjL5DQcNV6erT+lBjdjvDGysFOFXVqu8jqnK0fPvIA
         l+2r6MAe9s61FWzmG78d5+naSVbqTxHfzRoLTMQYpqvSwoC/5YeWpLXV7L/i5b55TemO
         ELEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780407185; x=1781011985;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3+hdPURsKaRDWPfKlcZWCKF9JH2UM9+MwJBWlbbC9do=;
        b=fwmOYwpp4sbgObra7RfFtAxEJ7iY5SCTyoohQeh8y7kE107jHp34DEpXIy9z595jzC
         EoZDZ1cEy4jePgc3DL17QJYw43mzBi7y0ZptrtEq1qjGNeu3XAPnan8x89yitB/59GpA
         0aFAgLAJMCk8NjZ1qb+49Kh8SrAUMiA/4PqZIVAWhWMBfTQrMqZ4sfZq1h7/urDOMPAc
         FnEOIvf2mm82Q2BYCh9nM8ylV3tU6XIzfeEzMUakuuazRs+iQa8GixHdxqECdqjscWgm
         80VUwuJKySb1rrkvEvcwt5xU8eoqU6h2n30oAYAjD2lmdyr3Q88Qg37x69pVaz+hHbAt
         OTIg==
X-Forwarded-Encrypted: i=1; AFNElJ+HiutIJOVd5DCGZZdCiNp6XGmbbKPxMxDmvDmo9ZOKWPmuabXmh9gKGDpFvvhBjbb1edmcOBP3OJ+PGDtP2jOVfjsF@vger.kernel.org
X-Gm-Message-State: AOJu0YyhxvASAaQuq1xzn/FyojDPQz9R3hYVZ3Mda6XGtUgKP5vBMaVr
	W4VJUx4LNePXLuK0CHJ523aLJ8K3Gahhkltdzn2O6lrxYwagLncCMFFUFCge7MuIGZMxfF4MFlq
	P4GfLNfZIe99OVi178oWmiGa1hHHImVCgFNqtQPQ=
X-Gm-Gg: Acq92OHaCZ0zPwTpIw8Rg2HDhEN4lWHUofQX/J33w9TtXx/nNN4U4gWXbFuZVsQ6vXu
	Mh3cz4wbC4LTS6/HtTQQeSfeljPhQeQTYHRMl6ONQE1Vs5VrO71hxAcrCpItomjiERnVqVrJ87H
	NFY5NSQGQ4AUvs4jHHImpJThcZXCs4hlzTZVaLlzj2GUbQYUDmP80hB+OOVEwIfBro12Lk3jiaP
	Pv5DyN+nssK8ACyeRvsDt/YGPRuLUaSM2yIjz76I842VuylrQLMJZPCc/M6PKU65b/6PUUokLHH
	lfBlBQQ+KWESKDwdkwFCg+mp3X1D
X-Received: by 2002:a05:6820:168f:b0:69d:8222:5953 with SMTP id
 006d021491bc7-69e1061c79amr8156706eaf.60.1780407185477; Tue, 02 Jun 2026
 06:33:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Nikolay Metchev <nikolaymetchev@gmail.com>
Date: Tue, 2 Jun 2026 14:32:53 +0100
X-Gm-Features: AVHnY4IgwvitQDDxWS-qzWXHQKm5J5rEZXI5S0UxxIq2hL2wjYUPd-aq7xdmKoY
Message-ID: <CAMPeJfpKCV=cbxbMJen3FFfJ1J9Q7i4Wup4AZJLP4PvScmNYzg@mail.gmail.com>
Subject: [PATCH] platform/x86: intel-hid: Add HP ProBook x360 440 G1 to button_array_table
To: hansg@kernel.org
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="000000000000d8e11306534559a5"

--000000000000d8e11306534559a5
Content-Type: text/plain; charset="UTF-8"

The HP ProBook x360 440 G1 convertible sends
 5-button-array event codes
 (0xc4/0xc5 volume-up, 0xc6/0xc7 volume-down for the
 side volume rocker)
 to the intel-hid ACPI device (INT33D5), but it does
 not advertise the
 array through the HEBC capability method. As a result
 button_array_present() returns false, the "Intel HID
 5 button array"
 input device is never created, and the rocker events
 are dropped in
 notify_handler() with "intel-hid INT33D5:00: unknown
 event 0xc4".

 Add the machine to button_array_table so the 5 button
 array input
 device is set up, which makes the side volume rocker
 emit
 KEY_VOLUMEUP / KEY_VOLUMEDOWN as expected.

 Tested on an HP ProBook x360 440 G1: with
 enable_5_button_array=1
 (same code path as this quirk) the kernel logs
 "platform supports 5
 button array" and the rocker generates native
 KEY_VOLUMEUP /
 KEY_VOLUMEDOWN events.

 Signed-off-by: Nikolay Metchev
 <nikolaymetchev@gmail.com>

--000000000000d8e11306534559a5
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-platform-x86-intel-hid-Add-HP-ProBook-x360-440-G1-to.patch"
Content-Disposition: attachment; 
	filename="0001-platform-x86-intel-hid-Add-HP-ProBook-x360-440-G1-to.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mpwofx1s0>
X-Attachment-Id: f_mpwofx1s0

RnJvbSAwZDNjOTA3NDMwZjNiMzZlMWNlMTdhZTdhNzg2ZmZmNzhmZjJkMmY5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBOaWtvbGF5IE1ldGNoZXYgPG5pa29sYXltZXRjaGV2QGdtYWls
LmNvbT4KRGF0ZTogVHVlLCAyIEp1biAyMDI2IDE0OjI1OjQ5ICswMTAwClN1YmplY3Q6IFtQQVRD
SF0gcGxhdGZvcm0veDg2OiBpbnRlbC1oaWQ6IEFkZCBIUCBQcm9Cb29rIHgzNjAgNDQwIEcxIHRv
CiBidXR0b25fYXJyYXlfdGFibGUKClRoZSBIUCBQcm9Cb29rIHgzNjAgNDQwIEcxIGNvbnZlcnRp
YmxlIHNlbmRzIDUtYnV0dG9uLWFycmF5IGV2ZW50IGNvZGVzCigweGM0LzB4YzUgdm9sdW1lLXVw
LCAweGM2LzB4Yzcgdm9sdW1lLWRvd24gZm9yIHRoZSBzaWRlIHZvbHVtZSByb2NrZXIpCnRvIHRo
ZSBpbnRlbC1oaWQgQUNQSSBkZXZpY2UgKElOVDMzRDUpLCBidXQgaXQgZG9lcyBub3QgYWR2ZXJ0
aXNlIHRoZQphcnJheSB0aHJvdWdoIHRoZSBIRUJDIGNhcGFiaWxpdHkgbWV0aG9kLiBBcyBhIHJl
c3VsdApidXR0b25fYXJyYXlfcHJlc2VudCgpIHJldHVybnMgZmFsc2UsIHRoZSAiSW50ZWwgSElE
IDUgYnV0dG9uIGFycmF5IgppbnB1dCBkZXZpY2UgaXMgbmV2ZXIgY3JlYXRlZCwgYW5kIHRoZSBy
b2NrZXIgZXZlbnRzIGFyZSBkcm9wcGVkIGluCm5vdGlmeV9oYW5kbGVyKCkgd2l0aCAiaW50ZWwt
aGlkIElOVDMzRDU6MDA6IHVua25vd24gZXZlbnQgMHhjNCIuCgpBZGQgdGhlIG1hY2hpbmUgdG8g
YnV0dG9uX2FycmF5X3RhYmxlIHNvIHRoZSA1IGJ1dHRvbiBhcnJheSBpbnB1dApkZXZpY2UgaXMg
c2V0IHVwLCB3aGljaCBtYWtlcyB0aGUgc2lkZSB2b2x1bWUgcm9ja2VyIGVtaXQKS0VZX1ZPTFVN
RVVQIC8gS0VZX1ZPTFVNRURPV04gYXMgZXhwZWN0ZWQuCgpUZXN0ZWQgb24gYW4gSFAgUHJvQm9v
ayB4MzYwIDQ0MCBHMTogd2l0aCBlbmFibGVfNV9idXR0b25fYXJyYXk9MQooc2FtZSBjb2RlIHBh
dGggYXMgdGhpcyBxdWlyaykgdGhlIGtlcm5lbCBsb2dzICJwbGF0Zm9ybSBzdXBwb3J0cyA1CmJ1
dHRvbiBhcnJheSIgYW5kIHRoZSByb2NrZXIgZ2VuZXJhdGVzIG5hdGl2ZSBLRVlfVk9MVU1FVVAg
LwpLRVlfVk9MVU1FRE9XTiBldmVudHMuCgpTaWduZWQtb2ZmLWJ5OiBOaWtvbGF5IE1ldGNoZXYg
PG5pa29sYXltZXRjaGV2QGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL3BsYXRmb3JtL3g4Ni9pbnRl
bC9oaWQuYyB8IDcgKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvcGxhdGZvcm0veDg2L2ludGVsL2hpZC5jIGIvZHJpdmVycy9wbGF0
Zm9ybS94ODYvaW50ZWwvaGlkLmMKaW5kZXggMDg1MDkzNS4uNzM4NzRkNCAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9wbGF0Zm9ybS94ODYvaW50ZWwvaGlkLmMKKysrIGIvZHJpdmVycy9wbGF0Zm9ybS94
ODYvaW50ZWwvaGlkLmMKQEAgLTE1Niw2ICsxNTYsMTMgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBk
bWlfc3lzdGVtX2lkIGJ1dHRvbl9hcnJheV90YWJsZVtdID0gewogCQkJRE1JX01BVENIKERNSV9Q
Uk9EVUNUX05BTUUsICJTdXJmYWNlIEdvIDQiKSwKIAkJfSwKIAl9LAorCXsKKwkJLmlkZW50ID0g
IkhQIFByb0Jvb2sgeDM2MCA0NDAgRzEiLAorCQkubWF0Y2hlcyA9IHsKKwkJCURNSV9NQVRDSChE
TUlfU1lTX1ZFTkRPUiwgIkhQIiksCisJCQlETUlfTUFUQ0goRE1JX1BST0RVQ1RfTkFNRSwgIkhQ
IFByb0Jvb2sgeDM2MCA0NDAgRzEiKSwKKwkJfSwKKwl9LAogCXsgfQogfTsKIAotLSAKMi41NC4w
Cgo=
--000000000000d8e11306534559a5--
