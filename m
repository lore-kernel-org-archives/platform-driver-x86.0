Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7115C001B0
	for <platform-driver-x86@archiver.kernel.org>; Tue, 15 Aug 2023 23:35:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239099AbjHOXep (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 15 Aug 2023 19:34:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240620AbjHOXeX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 15 Aug 2023 19:34:23 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BF6513E
        for <platform-driver-x86@vger.kernel.org>; Tue, 15 Aug 2023 16:34:22 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4fe21e7f3d1so9586755e87.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 15 Aug 2023 16:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692142460; x=1692747260;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bYGbYHxglGSO09fv3jXWvZ/Qps6KmHcn+IsSYo2giWA=;
        b=fb6eNIcb4rgqD+S13VAl54Td8AIz2jaUyG2yz2Qdy0OQkwoZXPUn+1MzePpcm1JPGx
         MCcCpv0q8I7NJSXndN9b3EOQx7J/PiPRqogai46/jtBGB1U/x/NI8eBWIFXTFFrqeSI8
         mDoQemzW8Ai/Vc9msW3CCbDlaCL8wXwYw8jdnzaqROBRCIWN7DmWiiSgCseTe5nn/bUb
         lj5ixIeO6Al/NhyaRSc3/aNKXA5FfGSg58lP4q65AojfI+Xx4PNi83DLLoPhMygj30r/
         AdLD6u1DrigQWHzw3/Z7ljzN/0NnSV0gdG4d3MljuNCG/QhlzZf4XzpyWiM3kpsv6zUd
         DrvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692142460; x=1692747260;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bYGbYHxglGSO09fv3jXWvZ/Qps6KmHcn+IsSYo2giWA=;
        b=cUkyMbVmNf0LgN5AUPBntSAVcAaa8UOgWRGY4Z6o3rOXYseu7Mhl58ZIbOjcSRZTnO
         ml0ri4R40tYS3+3t9BNbOB22dN9ohgjkogq8f/uyQUc3rM0FIRxEWnKLhpwZkMm/aclM
         kn292/vsxiio6kiwk9xpOWfTlRds6/bkUagK1H//VTgwGRWOCR9pJKdwHHXyxyUc3sEg
         5uB2Mkurn8HkJns11LHrTcu/Y1bC6v8ZLBbG1NmJPwEmHvvFRFOwN5Be87jBVhRz/LnJ
         BkCXioOhyUbxMSLnwyrWXnMfixmGm2y6rAhgV+FsK7T++M6iD4ezHwXNdqDtFb/c3BmD
         6Y7g==
X-Gm-Message-State: AOJu0YyFcby/YYs5WdvRW/8f1uEg2K3TjO07lPYDy/APlltBro6uhYkT
        IXmalQXUg3vCy2jaC8TQ4gAxJBxzCPvGtYTnvuotFqUL8nyyRA==
X-Google-Smtp-Source: AGHT+IHyfD4o+d/a7ve3hJ3NYqK/bjoF5NXlMrRtqsEnURG2KkBzL2MA6KigS4kBZ1arQvcu1B0dyP/1fiQb8Rq2lp0=
X-Received: by 2002:a05:6512:3c87:b0:4fb:8939:d95c with SMTP id
 h7-20020a0565123c8700b004fb8939d95cmr287043lfv.30.1692142459737; Tue, 15 Aug
 2023 16:34:19 -0700 (PDT)
MIME-Version: 1.0
From:   Swapnil Devesh <sid.swapnildevesh@gmail.com>
Date:   Wed, 16 Aug 2023 05:04:08 +0530
Message-ID: <CAH-ry+a38SW4hqXw-n8nEMLV9rX-eoGp2+VT6ivNqFpKVSfDYw@mail.gmail.com>
Subject: Add Lenovo Yoga 7 14ACN6 (82N7) to ec_trigger_quirk_dmi_table in the
 new Lenovo YMC driver
To:     platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

This adds my laptop Lenovo Yoga 7 14ACN6, with Product Name: 82N7
(from `dmidecode -t1 | grep "Product Name"`) to the
ec_trigger_quirk_dmi_table, have tested that this is required for the
YMC driver to work correctly on this model.

Thanks to Gergo, the author of the Lenovo YMC driver for guiding this.

Signed-off-by: Swapnil Devesh <me@sidevesh.com>
---
 drivers/platform/x86/lenovo-ymc.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/platform/x86/lenovo-ymc.c
b/drivers/platform/x86/lenovo-ymc.c
index 41676188b373..7d38151a5b27 100644
--- a/drivers/platform/x86/lenovo-ymc.c
+++ b/drivers/platform/x86/lenovo-ymc.c
@@ -32,6 +32,13 @@ static const struct dmi_system_id
ec_trigger_quirk_dmi_table[] = {
  DMI_MATCH(DMI_PRODUCT_NAME, "82QF"),
  },
  },
+ {
+ /* Lenovo Yoga 7 14ACN6 */
+ .matches = {
+ DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+ DMI_MATCH(DMI_PRODUCT_NAME, "82N7"),
+ },
+ },
  { }
 };
