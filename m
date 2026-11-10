Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794342938;
	b=wM0ZifA1fix+RWzTwy5B7hwktQR4TPOf5s9DM+erXYmqnnhk8tSr5mhJAEhRws/KTrx0
	 wih9bfILMbR2NIe7x945UdDQYBKgRejcdaJesWfecUBMwxzwJdowCQtol0WySN0v8Flt2
	 ByDRKop68mrYMQcQP00XDp3ijzrg+61dIEPSE42FZ8IJOLuNu4VYjzhOmxe3pNRO9qQR0
	 RBxLRPRrF37OZvvppGQtFHTxAN3OFbslowJwunaVVnmh28nXAkGWM6sDLD6j+4vTuyx9b
	 lYDoJ5p1BNu5pNLodCh8CmIfIjirqaU8AoA20rKD6DjF8JJPDq1tfO+3eLDZCOO7Oqw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794342938;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=yShBhjtDnACgtvfq0J6kPqqs6WD4xF02nyZ5JWEefS8=;
	b=Z5us4rpw5erznctGPmw1zScgzUdY6Cp87L1gpKA+pJ1K7mzg+85SmGPAslWeAlyV9BLa
	 cpJwmKBE5WAv6QrmGj2DgA5CiJhQrscoO4WSqB1sLdK9NdsOVzyotXrPKCGGcxwhq4y4Q
	 ldpZwM80/9pzhRTBLWZX9d33J8+CeH7oDq4CrCGbsAEKc3l8ZG7i4ZorPkor8q/8qE8od
	 fJ9yeVknJ/5gkU59q16v/8YbbDBQAXMFSV150nqjKitgebmjoxqQTetNKQK4Mg5Y/yFMX
	 dqIah7ukBuurUhqDsv7fSWQxoD3qSDs4DiP3I8CrJ5uVx07B2Nre4jJy2ZVhbqe3+/w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=weiZmcT+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C25A606A320
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Nov 2026 20:35:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C25A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=weiZmcT+
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so4896579eec.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 10 Nov 2026 12:35:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794342937; cv=none;
        d=google.com; s=arc-20260327;
        b=MO1E6mY05rirheD7hB0UR9VUf9wthMavbPF3C9WM+ToCYOk618GpF7U11+3m7FRQbY
         DSdCuqWyW3YnklyAMzcJmlKIVZGu4JGgqPPGNKSKpJMWpOLtMv186yelH8JejvGVsPTj
         ofThSUeRkuzEVkCZBuVUk3GvmLUtw8DW6VXO55BaXjJiBF5ja1gHSvrtsfPPO8OIXo16
         j2VrFlpLvmUAlN6Yl8XjNuTPgWzdmoNL/llTIvxQWug7cNasLzjyL0WWJRQTy0+M4EAz
         zVLqfNe2udr5hT2/ky/jLUlAW4MabmocIVyw7s94H+K+gW2UGSS+ee15/YwPK7+Fs/QU
         sj8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yShBhjtDnACgtvfq0J6kPqqs6WD4xF02nyZ5JWEefS8=;
        fh=BzCZJpPIMwINr069dkZwVgo48/VjH9q5VL2CHkqj3H4=;
        b=lonb0rhK7zlOHdUpH3Is1tv3nB432hHV10S32g5G/7JKPNVR0bz+7H2h3gfnNCoA2O
         COpMcn8Xhd9ZVH8lHPMgcmMgT56M3QZuOhRZK/jRwc2ACLRsIJBFYrXuo4r5GmnJEljp
         RCnPIRcIZ7BErGrCTMjOc+busztm/J9cKMyRR4zN1ys11XdZPWNEoB/brTDXAjhwTURY
         dHl38kaH2BfKSIAsnTmAlPbk6vr/lOJWS4ih9gsbWpY8z1vCfszd2CkLIG9+YmvvgxsS
         Q99MFRiKm7KXwYh49a1TdtdsxW45L1n1HykXbkzM3rBSEio3cbbUiSa8yxkmw9ATy7Ei
         AoDg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794342937; x=1794947737; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yShBhjtDnACgtvfq0J6kPqqs6WD4xF02nyZ5JWEefS8=;
        b=weiZmcT+35cx3QAHNQNgtmkgewjXQxvAn6lpppvgMN+t8IXsyODd9inkX02H7u0vxL
         EYSOq+QpHpTGJFUIOAC7h0SCYIHXR1/WtmUcNgJe7uGat5T1S9ftoXWgsUL/Iyfc1DZx
         86xHO0iyLCjI3HZAjAgMRpcnNyetn336UnVRMZifdGDp9B4kfJS0k/ff9lBEwSFKcN43
         CIvDlcg3LD9gbqlV7sw3+z/Fskjtfm6xQt5uQJ2H9xxcxa4AAesYwLi60sBdIFgsmj1R
         ZgZXFJeiApLA6tdnzDAahsbJq7MCkSqMR840OKxj2MmeykPEsANfY9vlLWu6i608tdeE
         dZFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794342937; x=1794947737;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yShBhjtDnACgtvfq0J6kPqqs6WD4xF02nyZ5JWEefS8=;
        b=Iq1sIDil92juOMgYgU3VXtcrrni1bxMXxjiYuBZnu+Z4bQ7/z9WnsH1CDmInvbpg6O
         9Ga9yAOK1XMNoeZ82WuInQTwz+Nw7BWPM/jO9IqTlktSqcBhENbkj5RGAeESwFQYYPGj
         wMX2yJjN1G4Kah2eN9TTVdRuhogq6LO4poxhHoE+HuxASTFBrijCZPUyUCgXPwJOIqmj
         HKlDWExi9DdHSAwt3ZtyCN9dfLngKA6Mp0P1JIf634CngyKZYIqfOgroxDf9iMChGnWG
         9jy3zUbnz4rwr6+LsE6bbAPpL3Tiod78Yc4wanLNcIqiFWiGGBGVWbjucoRjZgx+j0ee
         PYyg==
X-Gm-Message-State: APuU4Z/ScHhkt2LFvVzXnUoq+qTzfhPEiWmrDlzyTUg8TEXQda+FoLaT
	oh49UTD4s4WR+8F82ukJXpBL1uagShY7QplzJsufhGHBb3+Gcn+De/OYaBxaXmbAoWHMKPgHEa4
	7ArOnPuROXo0fXPLZQlyDJHQ123jW3sqVL8Qy
X-Gm-Gg: AYBFou11uQv04eZcBjbEU/DzoWwwkzYN6wAcG+X7JMPqw9ntHH37apK/PKPaMicNs7h
	0BmyGe/O6GT4qB92ImA9yRzL65NKCwzZUtBgXzMkfs7J5sth3Sc5IRI2yR0hmrfID7g2Gy3fksO
	230SVx1d36Y8SvW8ZSb225AFk/zxL7NOqIwDyXnC04W5hWlBxD0HqcBdyjuifJoWkBvTh3G02Qy
	xOgjs/U9d19Y4EGWV6laeLdSWkcniZ94cdbGJW/hPmsxuPUBBvPnFuRLXh4CkiO+carT+ibct1k
	Q9KtQytZvKgBAm83yenqWY7QCx2uoqU5tBtkDXDJ45BH2AnttZwO0qbQkepoOVJIB8jFlegcFFm
	kUDJnFyNCvhWxSbwNh0pJoqa/Yk7+GIEa9hlnpw==
X-Received: by 2002:a05:701b:280a:b0:1b0:c224:5bdc with SMTP id
 a92af1059eb24-1b3c02f0c64mr2919c88.14.1794342936296; Tue, 10 Nov 2026
 12:35:36 -0800 (PST)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CA+Kibh6FHk-QgmPsi4spmQ5MHGvt05xYHuRiiMMQdPP+31Z70A@mail.gmail.com>
 <f718e7cd-24f1-428b-b9f7-28bb1a923a11@gmail.com> <CA+Kibh6T9tPKwhSF2X5Jwoo8OUoieypuAyM4GBKVujUDWgpr-g@mail.gmail.com>
 <08e0f238-4330-418b-ae3b-fa7ce0f6ef62@gmail.com>
In-Reply-To: <08e0f238-4330-418b-ae3b-fa7ce0f6ef62@gmail.com>
From: Oleg Rybalov <rybalov.oleg.dev@gmail.com>
Date: Tue, 10 Nov 2026 23:35:24 +0300
X-Gm-Features: AclHuK84S-wSVuEwuytdxrmUZgbKUipecVgBYTEbrwAjz9A0BoyUxR2Lz9GtGDQ
Message-ID: <CA+Kibh4GtWjz97Fnxa3n8-B9+dTtcG5oPtn8b3HvcpUcR3Su_Q@mail.gmail.com>
Subject: Re: [REGRESSION] platform/x86: bitland-mifs-wmi: platform profiles
 cannot be changed on USB-C-only RedmiBook Pro 15 (TM2017)
To: Mingyou Chen <qby140326@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com, 
	regressions@leemhuis.info, regressions@lists.linux.dev, shlyapugin@gmail.com, 
	Musaev Ibragim <atomicus.xyz@gmail.com>
Content-Type: multipart/mixed; boundary="00000000000053a8f3065ff2054c"

--00000000000053a8f3065ff2054c
Content-Type: text/plain; charset="UTF-8"

Follow-up with what I found while testing, and a correction.

Correction: v15 does handle WMI_EVENT_PERFORMANCE_PLAN_ALT, so
platform_profile_notify() is called on Fn+K. I misread that earlier.
The profile did not change in my tests because profile_get read
SystemPerMode, which Fn+K does not seem to touch.

From the decompiled tables, as far as I can tell, the mode on this
board is a byte in EC RAM, STNM (\_SB.PCI0.LPC0.EC0, SystemMemory
0xFE0B0300 + 0x7E). Fn+K raises EC0._Q24, which notifies WMID, sleeps
500 ms and calls HPTC (STNM). STNM itself is rotated by EV20 case
0x16, which runs only when the event is read through _WED, so without
a driver reading the event Fn+K does not change the mode. HPTC appears
to program the SoC limits from STNM.

What I observed: with your quirk loaded, writes to platform_profile
returned 0, but STNM did not change.

Attached is a patch (written with an AI assistant, feel free to reuse
or rewrite) on top of v15 that works on my machine. It replaces my
previous one. It may well not be the right way to do it in the driver,
I'm sharing it in case it helps:
- profile_get reads STNM with acpi_evaluate_integer()
- profile_set writes STNM via ioremap under the ACPI global lock (the
field is declared with Lock) and evaluates EC0.HPTC
- AE_AML_BUFFER_LIMIT from HPTC is treated as success: SVRP sets the
size field to 0x12 for three 5-byte entries (0x11 bytes), so A032
starts a fourth entry and reads past the end of the buffer, after the
limits have already been sent. The ACPI error is still printed to
dmesg on every profile change
- The capability check still applies, and on this board it gets in the
way: on battery, setting performance fails with EOPNOTSUPP and
power-profiles-daemon rolls the profile back, while Fn+K selects the
top step without problems. The firmware already bounds the limits by
AC state and battery level (HDC1..3), so the check looks unnecessary
here

With it, on AC, through power-profiles-daemon: profiles set and stay
set, Fn+K changes the reported profile, and package power looks
consistent with the firmware tables.

Not covered: the address comes from BIOS RMAPH5B0P0909 only;
profile_get returns an error if STNM is outside 1..3.

Cc'ing Musaev Ibragim, who tested the Redmibook side of this series on
the same board and BIOS in July.

--00000000000053a8f3065ff2054c
Content-Type: text/x-patch; charset="US-ASCII"; name="TM2209-quirk-ec-mode.patch"
Content-Disposition: attachment; filename="TM2209-quirk-ec-mode.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mwb5fy770>
X-Attachment-Id: f_mwb5fy770

ZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGxhdGZvcm0veDg2L2JpdGxhbmQtbWlmcy13bWkuYyBiL2Ry
aXZlcnMvcGxhdGZvcm0veDg2L2JpdGxhbmQtbWlmcy13bWkuYwppbmRleCBhNDMxZDNmZWYuLmE1
ODZjODNhNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9wbGF0Zm9ybS94ODYvYml0bGFuZC1taWZzLXdt
aS5jCisrKyBiL2RyaXZlcnMvcGxhdGZvcm0veDg2L2JpdGxhbmQtbWlmcy13bWkuYwpAQCAtMTgs
NiArMTgsNyBAQAogI2luY2x1ZGUgPGxpbnV4L2Vyci5oPgogI2luY2x1ZGUgPGxpbnV4L2h3bW9u
Lmg+CiAjaW5jbHVkZSA8bGludXgvaW5pdC5oPgorI2luY2x1ZGUgPGxpbnV4L2lvLmg+CiAjaW5j
bHVkZSA8bGludXgvaW5wdXQtZXZlbnQtY29kZXMuaD4KICNpbmNsdWRlIDxsaW51eC9pbnB1dC5o
PgogI2luY2x1ZGUgPGxpbnV4L2lucHV0L3NwYXJzZS1rZXltYXAuaD4KQEAgLTk5LDYgKzEwMCwx
MCBAQCBzdHJ1Y3QgYml0bGFuZF9taWZzX3F1aXJrcyB7CiAKIAlib29sIHJldHVybl9jb2RlX2F0
X2VuZDsKIAlib29sIHNraXBfYWNfdHlwZV9jaGVjazsKKworCWNvbnN0IGNoYXIgKmVjX21vZGVf
ZmllbGQ7CisJY29uc3QgY2hhciAqZWNfbW9kZV9hcHBseTsKKwlwaHlzX2FkZHJfdCBlY19tb2Rl
X2FkZHI7CiB9OwogCiBzdGF0aWMgY29uc3Qgc3RydWN0IGJpdGxhbmRfcHJvZmlsZV9lbnRyeSBk
ZWZhdWx0X3Byb2ZpbGVfZW50cmllc1tdID0gewpAQCAtMTEzLDcgKzExOCwzMCBAQCBzdGF0aWMg
Y29uc3Qgc3RydWN0IGJpdGxhbmRfbWlmc19xdWlya3MgZGVmYXVsdF9xdWlya3MgPSB7CiAJLm51
bV9wcm9maWxlX2VudHJpZXMgPSBBUlJBWV9TSVpFKGRlZmF1bHRfcHJvZmlsZV9lbnRyaWVzKSwK
IH07CiAKK3N0YXRpYyBjb25zdCBzdHJ1Y3QgYml0bGFuZF9wcm9maWxlX2VudHJ5IHRtMjIwOV9w
cm9maWxlX2VudHJpZXNbXSA9IHsKKwl7IFBMQVRGT1JNX1BST0ZJTEVfTE9XX1BPV0VSLCAgIDIg
fSwKKwl7IFBMQVRGT1JNX1BST0ZJTEVfQkFMQU5DRUQsICAgIDEgfSwKKwl7IFBMQVRGT1JNX1BS
T0ZJTEVfUEVSRk9STUFOQ0UsIDMgfSwKK307CisKK3N0YXRpYyBjb25zdCBzdHJ1Y3QgYml0bGFu
ZF9taWZzX3F1aXJrcyB0bTIyMDlfcXVpcmtzID0geworCS5wcm9maWxlX2VudHJpZXMgPSB0bTIy
MDlfcHJvZmlsZV9lbnRyaWVzLAorCS5udW1fcHJvZmlsZV9lbnRyaWVzID0gQVJSQVlfU0laRSh0
bTIyMDlfcHJvZmlsZV9lbnRyaWVzKSwKKwkucmV0dXJuX2NvZGVfYXRfZW5kID0gdHJ1ZSwKKwku
c2tpcF9hY190eXBlX2NoZWNrID0gdHJ1ZSwKKwkuZWNfbW9kZV9maWVsZCA9ICJcXF9TQi5QQ0kw
LkxQQzAuRUMwLlNUTk0iLAorCS5lY19tb2RlX2FwcGx5ID0gIlxcX1NCLlBDSTAuTFBDMC5FQzAu
SFBUQyIsCisJLmVjX21vZGVfYWRkciA9IDB4RkUwQjAzMDAgKyAweDdFLAorfTsKKwogc3RhdGlj
IGNvbnN0IHN0cnVjdCBkbWlfc3lzdGVtX2lkIGJpdGxhbmRfbWlmc19kbWlfdGFibGVbXSA9IHsK
Kwl7CisJCS5tYXRjaGVzID0geworCQkJRE1JX0VYQUNUX01BVENIKERNSV9TWVNfVkVORE9SLCAi
WElBT01JIiksCisJCQlETUlfRVhBQ1RfTUFUQ0goRE1JX0JPQVJEX05BTUUsICJUTTIyMDkiKSwK
KwkJfSwKKwkJLmRyaXZlcl9kYXRhID0gKHZvaWQqKSZ0bTIyMDlfcXVpcmtzLAorCX0sCiAJe30K
IH07CiAKQEAgLTI3MSw2ICsyOTksNDggQEAgc3RhdGljIGludCBiaXRsYW5kX21pZnNfd21pX2Nh
bGwoc3RydWN0IGJpdGxhbmRfbWlmc193bWlfZGF0YSAqZGF0YSwKIAlyZXR1cm4gMDsKIH0KIAor
c3RhdGljIGludCBiaXRsYW5kX2VjX21vZGVfZ2V0KGNvbnN0IHN0cnVjdCBiaXRsYW5kX21pZnNf
cXVpcmtzICpxdWlya3MsIHU4ICp2YWwpCit7CisJdW5zaWduZWQgbG9uZyBsb25nIHY7CisJYWNw
aV9zdGF0dXMgc3RhdHVzOworCisJc3RhdHVzID0gYWNwaV9ldmFsdWF0ZV9pbnRlZ2VyKE5VTEws
IChhY3BpX3N0cmluZylxdWlya3MtPmVjX21vZGVfZmllbGQsCisJCQkJICAgICAgIE5VTEwsICZ2
KTsKKwlpZiAoQUNQSV9GQUlMVVJFKHN0YXR1cykpCisJCXJldHVybiAtRUlPOworCisJKnZhbCA9
IHY7CisJcmV0dXJuIDA7Cit9CisKK3N0YXRpYyBpbnQgYml0bGFuZF9lY19tb2RlX3NldChjb25z
dCBzdHJ1Y3QgYml0bGFuZF9taWZzX3F1aXJrcyAqcXVpcmtzLCB1OCB2YWwpCit7CisJdm9pZCBf
X2lvbWVtICphZGRyOworCWFjcGlfc3RhdHVzIHN0YXR1czsKKwl1MzIgZ2xrOworCisJYWRkciA9
IGlvcmVtYXAocXVpcmtzLT5lY19tb2RlX2FkZHIsIDEpOworCWlmICghYWRkcikKKwkJcmV0dXJu
IC1FTk9NRU07CisKKwlzdGF0dXMgPSBhY3BpX2FjcXVpcmVfZ2xvYmFsX2xvY2soMTAwMCwgJmds
ayk7CisJaWYgKEFDUElfRkFJTFVSRShzdGF0dXMpKSB7CisJCWlvdW5tYXAoYWRkcik7CisJCXJl
dHVybiAtRUJVU1k7CisJfQorCXdyaXRlYih2YWwsIGFkZHIpOworCWFjcGlfcmVsZWFzZV9nbG9i
YWxfbG9jayhnbGspOworCWlvdW5tYXAoYWRkcik7CisKKwlzdGF0dXMgPSBhY3BpX2V4ZWN1dGVf
c2ltcGxlX21ldGhvZChOVUxMLCAoY2hhciAqKXF1aXJrcy0+ZWNfbW9kZV9hcHBseSwgdmFsKTsK
KwlpZiAoc3RhdHVzID09IEFFX0FNTF9CVUZGRVJfTElNSVQpCisJCXJldHVybiAwOworCWlmIChB
Q1BJX0ZBSUxVUkUoc3RhdHVzKSkKKwkJcmV0dXJuIC1FSU87CisKKwlyZXR1cm4gMDsKK30KKwog
c3RhdGljIGludCBsYXB0b3BfcHJvZmlsZV9nZXQoc3RydWN0IGRldmljZSAqZGV2LAogCQkJICAg
ICAgZW51bSBwbGF0Zm9ybV9wcm9maWxlX29wdGlvbiAqcHJvZmlsZSkKIHsKQEAgLTI4MiwxNCAr
MzUyLDIwIEBAIHN0YXRpYyBpbnQgbGFwdG9wX3Byb2ZpbGVfZ2V0KHN0cnVjdCBkZXZpY2UgKmRl
diwKIAl9OwogCXN0cnVjdCBiaXRsYW5kX21pZnNfb3V0cHV0X2hlYWRfcmMgcmVzdWx0OwogCXNp
emVfdCBpOworCXU4IHZhbDsKIAlpbnQgcmV0OwogCi0JcmV0ID0gYml0bGFuZF9taWZzX3dtaV9j
YWxsKGRhdGEsICZpbnB1dCwgJnJlc3VsdCk7CisJaWYgKHF1aXJrcy0+ZWNfbW9kZV9maWVsZCkg
eworCQlyZXQgPSBiaXRsYW5kX2VjX21vZGVfZ2V0KHF1aXJrcywgJnZhbCk7CisJfSBlbHNlIHsK
KwkJcmV0ID0gYml0bGFuZF9taWZzX3dtaV9jYWxsKGRhdGEsICZpbnB1dCwgJnJlc3VsdCk7CisJ
CXZhbCA9IHJlc3VsdC5kYXRhWzBdOworCX0KIAlpZiAocmV0KQogCQlyZXR1cm4gcmV0OwogCiAJ
Zm9yIChpID0gMDsgaSA8IHF1aXJrcy0+bnVtX3Byb2ZpbGVfZW50cmllczsgaSsrKSB7Ci0JCWlm
IChxdWlya3MtPnByb2ZpbGVfZW50cmllc1tpXS53bWlfdmFsID09IHJlc3VsdC5kYXRhWzBdKSB7
CisJCWlmIChxdWlya3MtPnByb2ZpbGVfZW50cmllc1tpXS53bWlfdmFsID09IHZhbCkgewogCQkJ
KnByb2ZpbGUgPSBxdWlya3MtPnByb2ZpbGVfZW50cmllc1tpXS5wcm9maWxlOwogCQkJcmV0dXJu
IDA7CiAJCX0KQEAgLTM1MCw2ICs0MjYsOSBAQCBzdGF0aWMgaW50IGxhcHRvcF9wcm9maWxlX3Nl
dChzdHJ1Y3QgZGV2aWNlICpkZXYsCiAJZm9yIChpID0gMDsgaSA8IHF1aXJrcy0+bnVtX3Byb2Zp
bGVfZW50cmllczsgaSsrKSB7CiAJCWlmIChxdWlya3MtPnByb2ZpbGVfZW50cmllc1tpXS5wcm9m
aWxlID09IHByb2ZpbGUgJiYKIAkJICAgICFxdWlya3MtPnByb2ZpbGVfZW50cmllc1tpXS5ub19z
ZXQpIHsKKwkJCWlmIChxdWlya3MtPmVjX21vZGVfYWRkcikKKwkJCQlyZXR1cm4gYml0bGFuZF9l
Y19tb2RlX3NldChxdWlya3MsCisJCQkJCQkJICAgcXVpcmtzLT5wcm9maWxlX2VudHJpZXNbaV0u
d21pX3ZhbCk7CiAJCQlpbnB1dC5wYXlsb2FkWzBdID0gcXVpcmtzLT5wcm9maWxlX2VudHJpZXNb
aV0ud21pX3ZhbDsKIAkJCXJldHVybiBiaXRsYW5kX21pZnNfd21pX2NhbGwoZGF0YSwgJmlucHV0
LCBOVUxMKTsKIAkJfQo=
--00000000000053a8f3065ff2054c--
