Return-Path: <SRS0=uF4I=EO=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1B42C388F9
	for <platform-driver-x86@archiver.kernel.org>; Sun,  8 Nov 2020 09:23:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 71399206E3
	for <platform-driver-x86@archiver.kernel.org>; Sun,  8 Nov 2020 09:23:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=usc-edu.20150623.gappssmtp.com header.i=@usc-edu.20150623.gappssmtp.com header.b="Ld6LXYml"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726099AbgKHJXh (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 8 Nov 2020 04:23:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726178AbgKHJXd (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 8 Nov 2020 04:23:33 -0500
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77C3BC0613CF
        for <platform-driver-x86@vger.kernel.org>; Sun,  8 Nov 2020 01:23:33 -0800 (PST)
Received: by mail-lj1-x243.google.com with SMTP id p15so6326576ljj.8
        for <platform-driver-x86@vger.kernel.org>; Sun, 08 Nov 2020 01:23:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usc-edu.20150623.gappssmtp.com; s=20150623;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=VV98yuV7QKd03t9slDB1Wv6Hk+UzS5rqGDaCNqqreAc=;
        b=Ld6LXYmlH50trc+6gBH7ayVSlnQuPQuhTbCDV3VRQqlczPcnHHvGOEPcrmDAcfTI25
         baFquE4YCfrq/IIdzfwGzucW1vNAHIZRp/5xcMlMQX8w6UicMFPt99DJFxEELnaTlyR/
         a6z0LewUGNlloXV/HJBd5d62dXcHSOPg7k8s67x2Xc9Wrqxr7+EEkSyKCkxvMIKA5GGj
         sNv7isOwz8XwI/og+hnzDgR/IYzlW+HRyLaDKcnehkv6WpNZU1zmC8Uc/0kAm11ffFK+
         P7gNIW6P1NXv4XDL4dGj/zXdl5JepctIrMJWg03CDLoYjT2stZrzWGiZxhEjs+iNz5TR
         bGFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=VV98yuV7QKd03t9slDB1Wv6Hk+UzS5rqGDaCNqqreAc=;
        b=EIFeI/FPEMqsQ4oF1lAOgNrnIJXr3Y55hVAi5dmKIx1qc/qHgmx71R5tuB21N87lFC
         K7Y+tW+weOpuzxnVCDnT2m4iboUDpAe+ldce8qa5JQn2lWOw8VXczAxHMlOS2Qm/Da34
         woB3DVUURTiTVMIHMgS8SeUpF70W3ggEqDj1cq5BxXBT4qTGpB+RmJXG2OEK7WNBYOzC
         qPkKdRBczSrxLvQy087EU6odcesdiyvPw6pLZjRODoOnGn+nXMqZ/w6gs3oD1AuGOUWU
         YKOf7cfoLJSqukVWQmaiHDOIkrgD4hL3x4ZxBZZ/rVz2S66pijwm2jHHbs+sX4l23LNk
         m+wQ==
X-Gm-Message-State: AOAM530uUVsApL8+Hk1NwBgq1P3bNL1GBPxIghA5CufOmwWQk9RlM+7M
        t6W39IrSxWIj/zUfCPTTigly3Ihkvag/2mmV7MKMYg==
X-Google-Smtp-Source: ABdhPJwPtclt89+GnQWAfj61hf3Dov2z7JopahyPBKykDAu8er80I6OuYkp7wlhyiU7Iu+qtAHZbzrg8SCkwmPCiLPs=
X-Received: by 2002:a2e:b0f8:: with SMTP id h24mr4100716ljl.2.1604827411977;
 Sun, 08 Nov 2020 01:23:31 -0800 (PST)
MIME-Version: 1.0
From:   Zhen Gong <zhengong@usc.edu>
Date:   Sun, 8 Nov 2020 01:23:19 -0800
Message-ID: <CAJCLVRCyp0ASdWTx-PxsrDC9zFBPw0U2AtPip+_Hpj2r5gUPwA@mail.gmail.com>
Subject: [PATCH RESEND] platform/x86: intel-hid: fix _DSM function index handling
To:     Alex Hung <alex.hung@canonical.com>
Cc:     Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, Zhen Gong <zhengong@usc.edu>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

According to the ACPI spec 9.1.1 _DSM (Device Specific Method),
intel_hid_dsm_fn_mask, acquired from function index 0, is "a buffer
containing one bit for each function index". When validitaing fn_index,
it should be compared with corresponding bit.

This buffer is usually longer than a byte. Depending on whether
INTEL_HID_DSM_HEBC_V2_FN exist, it could be either
"Buffer (0x02) { 0xFF, 0x01 }" or "Buffer (0x02) { 0xFF, 0x03 }".
Probably it won't grow larger according to the description. On older
platforms, available functions could be fewer or not supported at all,
i.e., "Buffer (One) { 0x00 }".

Signed-off-by: Zhen Gong <zhengong@usc.edu>
---
 drivers/platform/x86/intel-hid.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel-hid.c b/drivers/platform/x86/intel-hid.c
index 86261970bd8f..9a52e56f75da 100644
--- a/drivers/platform/x86/intel-hid.c
+++ b/drivers/platform/x86/intel-hid.c
@@ -141,7 +141,7 @@ static bool intel_hid_execute_method(acpi_handle handle,

  method_name = (char *)intel_hid_dsm_fn_to_method[fn_index];

- if (!(intel_hid_dsm_fn_mask & fn_index))
+ if (!(intel_hid_dsm_fn_mask & BIT(fn_index)))
  goto skip_dsm_exec;

  /* All methods expects a package with one integer element */
@@ -214,7 +214,19 @@ static void intel_hid_init_dsm(acpi_handle handle)
  obj = acpi_evaluate_dsm_typed(handle, &intel_dsm_guid, 1, 0, NULL,
       ACPI_TYPE_BUFFER);
  if (obj) {
- intel_hid_dsm_fn_mask = *obj->buffer.pointer;
+ switch (obj->buffer.length) {
+ default:
+ case 2:
+ intel_hid_dsm_fn_mask = *(u16 *)obj->buffer.pointer;
+ break;
+ case 1:
+ intel_hid_dsm_fn_mask = *obj->buffer.pointer;
+ break;
+ case 0:
+ acpi_handle_warn(handle, "intel_hid_dsm_fn_mask length is zero\n");
+ intel_hid_dsm_fn_mask = 0;
+ break;
+ }
  ACPI_FREE(obj);
  }

-- 
2.29.1
