Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33F75C74A44
	for <platform-driver-x86@archiver.kernel.org>; Fri, 10 Mar 2023 19:30:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230037AbjCJTaT (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 10 Mar 2023 14:30:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230286AbjCJTaM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 10 Mar 2023 14:30:12 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 662BFB5FF5
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Mar 2023 11:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678476565;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=y8l/CWBJuX1y5EPl4GX+elbQQ57+iHsuSsPv5DqoqZk=;
        b=C6thpHu71oyAhuHJQh5AdSDwzr6AQwPjFxfts+z03ygsixyUGsEchm4a13gU2Kv1xnsXrE
        T9zAcmnScXsJIkOGIvJyrRfSNKGyvV0fbuasSAD9ywbqE/idlg0i9PRJ8SczNURVBoOmXa
        ceOuhPrfDPjVU4es4lQvecMkxLLPX6g=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-18-hJYzeGslPhOBOtTcIMa3JQ-1; Fri, 10 Mar 2023 14:29:24 -0500
X-MC-Unique: hJYzeGslPhOBOtTcIMa3JQ-1
Received: by mail-qk1-f200.google.com with SMTP id d72-20020ae9ef4b000000b0072db6346c39so3645961qkg.16
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Mar 2023 11:29:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678476563;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y8l/CWBJuX1y5EPl4GX+elbQQ57+iHsuSsPv5DqoqZk=;
        b=vpqNM4HBymOBxGta0my0JkTcc/hxsxBauHCGPDLQ6EHtzBdBOH7FmeKU2VLY6bel9x
         3TJxpmIjtEsJLaAZAbh9z7Xfj2XQU5uP9oohY47yQTHQafiAtZzzLaEL74SF4z4bwO2q
         YkDa+CjoKFwpmcnbDw6IjSIzUKLsS3B6zGTN/CkZOW9FtuvilgqF9D3oyaWw3m1zsdc9
         /LVh+0qwATm6jZf7/ptEb5YcTvABRKM10toqVlXoOEdDCnPzD2nvheO7/Y2985uTHd6X
         HCECqZNSIL1RF7UxLkSPIPtmkCGpjJypCn6JEaSyhfwHzCn9Q0/a+xZA/ps4RuB07sSE
         6PoQ==
X-Gm-Message-State: AO0yUKX5yQDpK7ZTicpkJQohARTfNGuOMXV7tbKd5jn9Tsumm0MsOJ26
        LtwlN+WXFwX8AXIoBZtaMmSb0NQYESNomXvATWgYWznG8fMuzxp7tiWWjx8+fiW631cfCy6d+g3
        gIpnIxDaF1pMz9FMR6sxBWoM5UhyWRODixQ==
X-Received: by 2002:a05:622a:1a86:b0:3bf:c355:9ad4 with SMTP id s6-20020a05622a1a8600b003bfc3559ad4mr45221386qtc.34.1678476563409;
        Fri, 10 Mar 2023 11:29:23 -0800 (PST)
X-Google-Smtp-Source: AK7set9p6QTglxUhaENPHKfFZq9rVgTHs0Xubm/clFXEHX2vfoItSR5lGlHnUyw4Q1N4ymCoUNJc7A==
X-Received: by 2002:a05:622a:1a86:b0:3bf:c355:9ad4 with SMTP id s6-20020a05622a1a8600b003bfc3559ad4mr45221362qtc.34.1678476563185;
        Fri, 10 Mar 2023 11:29:23 -0800 (PST)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id w25-20020a05620a129900b0073b8512d2dbsm340236qki.72.2023.03.10.11.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 11:29:22 -0800 (PST)
From:   Tom Rix <trix@redhat.com>
To:     hdegoede@redhat.com, markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tom Rix <trix@redhat.com>
Subject: [PATCH] platform/x86: x86-android-tablets: select PMIC_OPREGION to resolve a link error of intel_soc_pmic_exec_mipi_pmic_seq_element
Date:   Fri, 10 Mar 2023 14:29:15 -0500
Message-Id: <20230310192915.2700069-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

A rand config causes this link error
drivers/platform/x86/x86-android-tablets/lenovo.o: In function `lenovo_yt3_init':
lenovo.c:(.init.text+0x6c): undefined reference to `intel_soc_pmic_exec_mipi_pmic_seq_element'

The rand config has
CONFIG_X86_ANDROID_TABLETS=y
CONFIG_PMIC_OPREGION=n

PMIC_OPREGION should be selected to build the
intel_soc_pmic_exec_mipi_pmic_seq_element symbol.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/platform/x86/x86-android-tablets/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/x86-android-tablets/Kconfig b/drivers/platform/x86/x86-android-tablets/Kconfig
index 2b3daca5380b..65980229d783 100644
--- a/drivers/platform/x86/x86-android-tablets/Kconfig
+++ b/drivers/platform/x86/x86-android-tablets/Kconfig
@@ -6,6 +6,7 @@
 config X86_ANDROID_TABLETS
 	tristate "X86 Android tablet support"
 	depends on I2C && SPI && SERIAL_DEV_BUS && ACPI && EFI && GPIOLIB
+	select PMIC_OPREGION
 	help
 	  X86 tablets which ship with Android as (part of) the factory image
 	  typically have various problems with their DSDTs. The factory kernels
-- 
2.27.0

