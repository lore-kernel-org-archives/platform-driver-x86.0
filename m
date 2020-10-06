Return-Path: <SRS0=8/nu=DN=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADA5AC4363D
	for <platform-driver-x86@archiver.kernel.org>; Tue,  6 Oct 2020 03:23:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 675BD208B6
	for <platform-driver-x86@archiver.kernel.org>; Tue,  6 Oct 2020 03:23:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=malazdrewicz-com-ar.20150623.gappssmtp.com header.i=@malazdrewicz-com-ar.20150623.gappssmtp.com header.b="qij56yQJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726745AbgJFDXn (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 5 Oct 2020 23:23:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725917AbgJFDXm (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 5 Oct 2020 23:23:42 -0400
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DC83C0613CE
        for <platform-driver-x86@vger.kernel.org>; Mon,  5 Oct 2020 20:23:42 -0700 (PDT)
Received: by mail-qk1-x734.google.com with SMTP id q5so15238834qkc.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 05 Oct 2020 20:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=malazdrewicz-com-ar.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=8QCmXwOvjemDGHCfQZaqz3cB0sH/J/ZTlqW6A0CfrL8=;
        b=qij56yQJzZ8aYKE3xEKd+vqb2RCSibf+BOCHR4ur9Wy8XmH7xTEHMRB/mIKcmIw8bz
         u5uwULbrjgR6/8ZyVrx4fB2KcqEYMjCiRSfw9dd+OJBfBecph7N5I8olaZuLzmraejnj
         ZBm5NUe6Hk/pRvbVToObpeAmQlONPaR2aXXQKQqKsAyUs/zLW3leazww9IWpjRwTOxgB
         0e5G5K1N/ZJoe0TBgGFJscOZpW2hue/SBRW5Shs7enXNvFHfG+LFfazG6o8IyPgKo6l2
         0Q5XLyNKdrvyEbZLdkv27ElFZhIFNE9cnXHjRVlxzlvsDWNDkA7XhZC70MSr4I/yqTjE
         lNoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=8QCmXwOvjemDGHCfQZaqz3cB0sH/J/ZTlqW6A0CfrL8=;
        b=T2XFpZEETVA0dMgkjAv8Gg5oRUwi/S7rDwa6NcXvxGHJ3WQ1snM/5eHeQAh8fV3x/7
         JRopJcil6eDR0p/m18pSS0Yu3Xz4xJ5jcV9f9m9vVB4pGCT973K2L7qJB8ekDNvzJqcJ
         B+43zMLAjGtGOvhXS4/5oRHHRuOXBAq5C+Yt4NVGVl+90YqF4oG+/Ps37Y2ySpNq8Jxh
         Homvls/mrF2DCz4bJd3QraBc4aif0up5XYA/WJu5lP6FXXefkqmw/jaXNJxC4BkGrpLP
         TRBtQtfEag5DjgqzZi3M18P1BYoD63NOon8IXzim5p/KxKypJH09gh21Fm19zEkRaQKo
         d0cg==
X-Gm-Message-State: AOAM5335C2a6QaaHEWj9Qe+J2bHhEYzMwl4g9HI9DdN9183ZJJ2X1xNY
        zVzMWBj82H2mhfizDBkgpsYGxKv6LyGrfF+PF2rmQQ==
X-Google-Smtp-Source: ABdhPJy48gT49IfgxErJU9FaFGEiYsEZ4VoDuLtlQcn3/yA0XsckzZzlWuo0BCZHDgzy0He6M6ywpg==
X-Received: by 2002:a37:bf04:: with SMTP id p4mr3116664qkf.345.1601954620983;
        Mon, 05 Oct 2020 20:23:40 -0700 (PDT)
Received: from area-51m-r2 ([24.224.201.0])
        by smtp.gmail.com with ESMTPSA id r21sm1346108qtj.80.2020.10.05.20.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2020 20:23:40 -0700 (PDT)
Message-ID: <b415a7bf2e98e734cc78579159e5c88fd5cd30df.camel@malazdrewicz.com.ar>
Subject: [ PATCH v2 1/1] dell smbios driver : Consider Alienware a valid OEM
 String
From:   Gerardo Esteban Malazdrewicz <gerardo@malazdrewicz.com.ar>
To:     "Limonciello, Mario" <Mario.Limonciello@dell.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Pali =?ISO-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Cc:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Date:   Tue, 06 Oct 2020 00:23:39 -0300
In-Reply-To: <DM6PR19MB26362F0581FA78C7E777BF56FA0C0@DM6PR19MB2636.namprd19.prod.outlook.com>
References: <d17b7266b3bcc433477cf4f3b89e0b5cbf0126cb.camel@malazdrewicz.com.ar>
         <de108a8c-672f-4136-dc80-9ad7f14cea32@redhat.com>
         <DM6PR19MB26362F0581FA78C7E777BF56FA0C0@DM6PR19MB2636.namprd19.prod.outlook.com>
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

Signed-off-by: Gerardo E. Malazdrewicz <gerardo@malazdrewicz.com.ar> 
Reviewed-by: Mario Limonciello <mario.limonciello@dell.com>
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



