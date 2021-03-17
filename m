Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48D28C433E0
	for <platform-driver-x86@archiver.kernel.org>; Wed, 17 Mar 2021 20:40:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E6F3F64F30
	for <platform-driver-x86@archiver.kernel.org>; Wed, 17 Mar 2021 20:40:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233356AbhCQUkP (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 17 Mar 2021 16:40:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233269AbhCQUjy (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 17 Mar 2021 16:39:54 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04501C06174A
        for <platform-driver-x86@vger.kernel.org>; Wed, 17 Mar 2021 13:39:54 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id z25so4861643lja.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 17 Mar 2021 13:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=wBlcBqItxhN4k3IlfJ8T+gvy61+2XtxUuTbIu4871dg=;
        b=Gred+eovD+3ODGYb0WI6kSAmhMxGJ7/3xaRj2Am6S6GZ8Ylpf2TuVK6doXTOuWpC4A
         lZ0+43RAQ7scpyJCHB5RRJ9+QYCCxkTtORDoNnHQAPR5H1kruLW8G6Vs14vflCNAaDfm
         TMk8pW7+zE2ajO2r+JDKLEpaZQBX0+ZrP3FLcms961gu8wmEBAT2xz6k1vCyygyDIS4M
         os+0ReBTwlkcsP2QtIQ/l6gXbHpwfWrKmOcgNL56TYqMYWEN5XFw3UM8waqQyvk9cOt0
         LTx1N9cnuwsAnSrR9K6KiPf0L5ldEo4H5ifhDEbWQfYxK4DsBqViEsajGIvv1G9pFF9A
         OSYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=wBlcBqItxhN4k3IlfJ8T+gvy61+2XtxUuTbIu4871dg=;
        b=LbOo50MIwS02AEaSUXa0uwPGGCHyKSAmc+MXU2lJV4LZGhhBq2Yua52/as2RTJeuVl
         5/9J7tmXaQQuyTQt7Z2fGKEHT895o3iaExDfxGv+KAKYdJi0rRc9M3XX3yH2Ryouzaf5
         qOu8gF2Ddo7F8wPE85uSnZ/csCB/OehDDkCYX1sKt1tAZjxgnzmhnbuCs+33yVBl9jlZ
         ieI7TqVUDJLVM+JyXfm0q7hjb5fknB97wI4UHclDUkQE1UoA6RMm472msbe+R9mcGpz4
         6YE6H5lmw06HN4h2yPI+6qIA1pEzMZ65swXcP8AzpxGrBj/ZAikGJFztE5cfeRBcyNV1
         Nk3g==
X-Gm-Message-State: AOAM532Cgb9Bukt9VcrkasG6FkSNa/d8+AJViKg82NosFr4Rr/QNoGBE
        rmwcAb2v5VuwfpIp+eFGQaIKTHUIdfMy0b4NQ0lqN9d0KjA=
X-Google-Smtp-Source: ABdhPJw0LPx9iX+YZKANGpVyVzkKNl+v2Qg7GRAXKaA6kIrgmvmrIqjvT/vX8fYyebnAWw74J6cVOrJzBBnnOrPbeIo=
X-Received: by 2002:a05:651c:201d:: with SMTP id s29mr3319662ljo.315.1616013592421;
 Wed, 17 Mar 2021 13:39:52 -0700 (PDT)
MIME-Version: 1.0
From:   =?UTF-8?Q?Ambro=C5=BE_Bizjak?= <abizjak.pro@gmail.com>
Date:   Wed, 17 Mar 2021 21:39:39 +0100
Message-ID: <CAJ4FQ9A=Xcom1d0fWVw+dRLX+yKAg3ACeXW=LgQEo9W-D7EfrQ@mail.gmail.com>
Subject: ideapad-laptop incorrectly sets RF-kill block on initialization
To:     platform-driver-x86@vger.kernel.org
Content-Type: multipart/mixed; boundary="000000000000236d0105bdc17c92"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

--000000000000236d0105bdc17c92
Content-Type: text/plain; charset="UTF-8"

Hi,

I have found an issue in the ideapad-laptop driver which causes WiFi
to not work on the Lenovo Legion Y720 laptop. It seems the issue is
generally present on this laptop as can be found by googling and
finding that the workaround is to blacklist ideapad-laptop.

In the code comment here:
https://github.com/torvalds/linux/blob/1df27313f50a57497c1faeb6a6ae4ca939c85a7d/drivers/platform/x86/ideapad-laptop.c#L1462
it is explained that the driver has a list of devices which are known
to have an RF-kill switch and for other devices it assumes that it
does not have one. Since the list is in fact empty, one would conclude
that the driver should never cause an RF-kill block. However on this
laptop loading the driver has this exact effect.

The reason is what seems to be a bug here:
https://github.com/torvalds/linux/blob/1df27313f50a57497c1faeb6a6ae4ca939c85a7d/drivers/platform/x86/ideapad-laptop.c#L1001
At initialization, ideapad_register_rfkill() sets the initial RF-kill
block state based on reading the state of the possibly nonexisting
RF-kill switch without considering priv->features.hw_rfkill_switch.
This is inconsistent with ideapad_sync_rfk_state() which sets
unblocked if hw_rfkill_switch is false. The result is that
ideapad_register_rfkill() would block but ideapad_sync_rfk_state()
would unblock as soon as it is called. But on my laptop
ideapad_sync_rfk_state() is presumably never called and the blocked
state persists indefinitely. I have verified this by changing
ideapad_register_rfkill() to use the same logic as
ideapad_sync_rfk_state() which has fixed the problem.

I am attaching a patch for master and 5.4, I have only tested the latter.

--000000000000236d0105bdc17c92
Content-Type: text/x-patch; charset="US-ASCII"; name="ideapad-laptop-rfkill-master.diff"
Content-Disposition: attachment; 
	filename="ideapad-laptop-rfkill-master.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_kmdwo8sm0>
X-Attachment-Id: f_kmdwo8sm0

LS0tIGEvZHJpdmVycy9wbGF0Zm9ybS94ODYvaWRlYXBhZC1sYXB0b3AuYwkyMDIxLTAzLTE3IDIx
OjI3OjM5LjA5ODU0NDAyMyArMDEwMAorKysgYi9kcml2ZXJzL3BsYXRmb3JtL3g4Ni9pZGVhcGFk
LWxhcHRvcC5jCTIwMjEtMDMtMTcgMjE6Mjg6NTkuMDU5MzQzMDI4ICswMTAwCkBAIC05OTgsOSAr
OTk4LDEzIEBACiAJaWYgKCFwcml2LT5yZmtbZGV2XSkKIAkJcmV0dXJuIC1FTk9NRU07CiAKLQll
cnIgPSByZWFkX2VjX2RhdGEocHJpdi0+YWRldi0+aGFuZGxlLCBpZGVhcGFkX3Jma19kYXRhW2Rl
dl0ub3Bjb2RlIC0gMSwgJnJmX2VuYWJsZWQpOwotCWlmIChlcnIpCisJaWYgKCFwcml2LT5mZWF0
dXJlcy5od19yZmtpbGxfc3dpdGNoKSB7CiAJCXJmX2VuYWJsZWQgPSAxOworCX0gZWxzZSB7CisJ
CWVyciA9IHJlYWRfZWNfZGF0YShwcml2LT5hZGV2LT5oYW5kbGUsIGlkZWFwYWRfcmZrX2RhdGFb
ZGV2XS5vcGNvZGUgLSAxLCAmcmZfZW5hYmxlZCk7CisJCWlmIChlcnIpCisJCQlyZl9lbmFibGVk
ID0gMTsKKwl9CiAKIAlyZmtpbGxfaW5pdF9zd19zdGF0ZShwcml2LT5yZmtbZGV2XSwgIXJmX2Vu
YWJsZWQpOwogCg==
--000000000000236d0105bdc17c92
Content-Type: text/x-patch; charset="US-ASCII"; name="ideapad-laptop-rfkill-5.4.patch"
Content-Disposition: attachment; filename="ideapad-laptop-rfkill-5.4.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_kmdwojl01>
X-Attachment-Id: f_kmdwojl01

ZGlmZiAtdXJOIGxpbnV4LTUuNC4xMDQub3JpZy9kcml2ZXJzL3BsYXRmb3JtL3g4Ni9pZGVhcGFk
LWxhcHRvcC5jIGxpbnV4LTUuNC4xMDQvZHJpdmVycy9wbGF0Zm9ybS94ODYvaWRlYXBhZC1sYXB0
b3AuYwotLS0gbGludXgtNS40LjEwNC5vcmlnL2RyaXZlcnMvcGxhdGZvcm0veDg2L2lkZWFwYWQt
bGFwdG9wLmMJMjAyMS0wMy0xNiAxOTowMjoxMi4xMjYzODMwOTkgKzAxMDAKKysrIGxpbnV4LTUu
NC4xMDQvZHJpdmVycy9wbGF0Zm9ybS94ODYvaWRlYXBhZC1sYXB0b3AuYwkyMDIxLTAzLTE2IDE5
OjA3OjA0LjM4MDk2MTEyOSArMDEwMApAQCAtNjE2LDcgKzYxNiw4IEBACiAJaWYgKCFwcml2LT5y
ZmtbZGV2XSkKIAkJcmV0dXJuIC1FTk9NRU07CiAKLQlpZiAocmVhZF9lY19kYXRhKHByaXYtPmFk
ZXYtPmhhbmRsZSwgaWRlYXBhZF9yZmtfZGF0YVtkZXZdLm9wY29kZS0xLAorCWlmICghcHJpdi0+
aGFzX2h3X3Jma2lsbF9zd2l0Y2ggfHwKKyAgICAgICAgICAgIHJlYWRfZWNfZGF0YShwcml2LT5h
ZGV2LT5oYW5kbGUsIGlkZWFwYWRfcmZrX2RhdGFbZGV2XS5vcGNvZGUtMSwKIAkJCSAmc3dfYmxv
Y2tlZCkpIHsKIAkJcmZraWxsX2luaXRfc3dfc3RhdGUocHJpdi0+cmZrW2Rldl0sIDApOwogCX0g
ZWxzZSB7Cg==
--000000000000236d0105bdc17c92--
