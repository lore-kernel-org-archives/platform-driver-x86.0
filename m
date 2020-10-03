Return-Path: <SRS0=eaFJ=DK=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80E25C41604
	for <platform-driver-x86@archiver.kernel.org>; Sat,  3 Oct 2020 11:52:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2CB94206F8
	for <platform-driver-x86@archiver.kernel.org>; Sat,  3 Oct 2020 11:52:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=malazdrewicz-com-ar.20150623.gappssmtp.com header.i=@malazdrewicz-com-ar.20150623.gappssmtp.com header.b="CHjtcHx+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725772AbgJCLwJ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 3 Oct 2020 07:52:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725770AbgJCLwJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 3 Oct 2020 07:52:09 -0400
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BEC3C0613D0
        for <platform-driver-x86@vger.kernel.org>; Sat,  3 Oct 2020 04:52:09 -0700 (PDT)
Received: by mail-qk1-x729.google.com with SMTP id c2so6266876qkf.10
        for <platform-driver-x86@vger.kernel.org>; Sat, 03 Oct 2020 04:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=malazdrewicz-com-ar.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:user-agent:mime-version
         :content-transfer-encoding;
        bh=18Pwy6LERPKcJTlCFwviSLKlI1Wx/tWXunFr2Hk3i/4=;
        b=CHjtcHx+k5OfszfrLGr4bUu4aO8Mr6LvBEibUWCVo9RExtQSM3oEFi1Fxt9xwyPZdY
         7ZY2/6GpoS1KQ6RJaktIvj9+145ke8CH8ikF6fCNywqadTdwRv/aiNBfdEDHNG7uoxie
         SL7l6BDyP/i0Cce8T06NuH6hEwmHrpGYn+8uI7S/gBvfIx4oCbNC2yHtrYQDVn8RzFkt
         7ryXrYJzgYI2yLr7U7rOwqMzBdesshQphtIxq4dlCmnEGABZsnOWWjSEwi1HWoohndnu
         mWJL30eB1b30EWWTFON1xSQubKcxDUGXvZHVRS5g3J8VNykskG0nZAcA0IoYJR0L7dE3
         g+gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:user-agent
         :mime-version:content-transfer-encoding;
        bh=18Pwy6LERPKcJTlCFwviSLKlI1Wx/tWXunFr2Hk3i/4=;
        b=BPjohFXhaZJMc+dj6WIJhranYQt/dH8tbJAzxAKv+Cv2VHL5cSEt9cCCvu2t7Y8HFt
         6PKI4IhIfCI4qvl7/cd12MoS4kXTmucq/2pOmUHMFRiOVyMUjkdAeP32YReYnJUQnAPZ
         ojXLLgadM7RgYRdWTft5Dc/ZfaqEvfU0qGzO5qMcM8CTpuKsO96tWwYyp/RuER2OJ9xc
         8A6pwek5MSeitGRZn0bnVNC8GmR1vH0hItAmWMb0raylerVZFfXwzzkwQ2Bdj55el19a
         hlNMnsb05e+mdNZRp6+Lg9HIZHlX6rCqqbkuOgyfIoDyE3TyjvP/KShbQUvR5GrPRKyF
         8T0Q==
X-Gm-Message-State: AOAM533i89JAU3pUjqjNFmqcU9/QaLuwAyozalG7K1osjTL5oXR6pe8d
        YYy9tnNyAezIXS7hW1IzJhETGw==
X-Google-Smtp-Source: ABdhPJzmBC8b6oILqXb6VJYX7mMunM5SmcnfrvhO+toiYsFL/H6s/ccru/w/H63Mpg97JIotc5sLwg==
X-Received: by 2002:a37:4a57:: with SMTP id x84mr5991061qka.17.1601725928171;
        Sat, 03 Oct 2020 04:52:08 -0700 (PDT)
Received: from area-51m-r2 ([24.224.201.0])
        by smtp.gmail.com with ESMTPSA id t10sm3141010qkt.55.2020.10.03.04.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2020 04:52:07 -0700 (PDT)
Message-ID: <d17b7266b3bcc433477cf4f3b89e0b5cbf0126cb.camel@malazdrewicz.com.ar>
Subject: [ PATCH: 1/1]  dell smbios driver : Consider Alienware a valid OEM
 String
From:   Gerardo Esteban Malazdrewicz <gerardo@malazdrewicz.com.ar>
To:     Pali =?ISO-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
        Mario Limonciello <mario.limonciello@dell.com>
Cc:     platform-driver-x86@vger.kernel.org
Date:   Sat, 03 Oct 2020 08:52:06 -0300
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From bda6b6db0d76186ff37ffce8ac836379447ef2bc Mon Sep 17 00:00:00 2001
From: Gerardo Malazdrewicz <36243997+GerMalaz@users.noreply.github.com>
Date: Sat, 3 Oct 2020 07:43:02 -0300
Subject: [PATCH] dell-smbios-base: Consider Alienware a Dell system

Alienware has been a subsidiary of Dell since 2006.

2020 Alienware laptop:
$ sudo dmidecode | head -3
# dmidecode 3.2
Getting SMBIOS data from sysfs.
SMBIOS 3.2.0 present.
$ sudo dmidecode | grep -A 29 "OEM Strings"
OEM Strings
	String 1: Alienware
	String 2: 1[099B]
	String 3: 3[1.0]
	String 4: 4[0001]
	String 5: 5[0000]
	String 6: 6[D0, D4, D8, DA, DE]
	String 7: 7[]
	String 8: 8[]
	String 9: 9[]
	String 10: 10[1.3.0]
	String 11: 11[]
	String 12: 12[]
	String 13: 13[P38E002]
	String 14: 14[0]
	String 15: 15[0]
	String 16: 16[0]
	String 17: 17[0000000000000000]
	String 18: 18[0]
	String 19: 19[1]
	String 20: 20[]
	String 21: 21[]
	String 22: <BAD INDEX>
	String 23: <BAD INDEX>
	String 24: <BAD INDEX>
	String 25: <BAD INDEX>
	String 26: <BAD INDEX>
	String 27: <BAD INDEX>
	String 28: <BAD INDEX>

2013 Alienware laptop:
OEM Strings
        String 1: Dell System
        String 2: 1[05AA]
        String 3: 14[2]
        String 4: 15[0]
        String 5: String5 for Original Equipment Manufacturer

Don't know when the OEM String changed.
Change tested in the 2020 laptop, loads dell_smbios without further
issues.

Thanks,
        Gerardo

Signed-off-by: Gerardo E. Malazdrewicz <gerardo@malazdrewicz.com.ar>
---
 drivers/platform/x86/dell-smbios-base.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/dell-smbios-base.c
b/drivers/platform/x86/dell-smbios-base.c
index 2e2cd565926aa..5ad6f7c105cf3 100644
--- a/drivers/platform/x86/dell-smbios-base.c
+++ b/drivers/platform/x86/dell-smbios-base.c
@@ -564,7 +564,8 @@ static int __init dell_smbios_init(void)
 	int ret, wmi, smm;
 
 	if (!dmi_find_device(DMI_DEV_TYPE_OEM_STRING, "Dell System",
NULL) &&
-	    !dmi_find_device(DMI_DEV_TYPE_OEM_STRING, "www.dell.com",
NULL)) {
+	    !dmi_find_device(DMI_DEV_TYPE_OEM_STRING, "www.dell.com",
NULL) &&
+	    !dmi_find_device(DMI_DEV_TYPE_OEM_STRING, "Alienware",
NULL)) {
 		pr_err("Unable to run on non-Dell system\n");
 		return -ENODEV;
 	}


