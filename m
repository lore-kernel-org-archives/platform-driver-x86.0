Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B25FC00A8F
	for <platform-driver-x86@archiver.kernel.org>; Tue, 24 Oct 2023 19:10:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234910AbjJXTKN (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 24 Oct 2023 15:10:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234903AbjJXTKN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 24 Oct 2023 15:10:13 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3B2F10CE
        for <platform-driver-x86@vger.kernel.org>; Tue, 24 Oct 2023 12:10:10 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-507adc3381cso7083355e87.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 24 Oct 2023 12:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698174609; x=1698779409; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j4pI7mazYiEShW5GLJfRC8i43h0ofXrudDoicrGM/OY=;
        b=KkAf/iOZZAgPf4xzDcFrzCkPmlhvpaKK9oKO+7a3FjPwH1pINau+7R/sz5q4ZrudMI
         ExYLgLmOYhH/TV/pZnRq1MUC+YXsETJGrMDjSUsdohJmoAfcOf6Vvbwl6SXNpmE1Tkir
         neU5dcUizrJEOD56dsd+t3SLBM0HnCeML+5iycDnZrsyjyxwWYNNQzFpjKeTInUMoUDX
         r5jcSKprir7mU2uJqwhQrXdEoAT3IWVQ4xkLjMHK/MIswSQn+DdjszPKok1Yg+BWsfPl
         T8aczmEKN327JDrZwf51gnW88+p+S3W3NAA1XDxLhTS5zzJaiHuTOhoEPscn64+z43ke
         5d/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698174609; x=1698779409;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j4pI7mazYiEShW5GLJfRC8i43h0ofXrudDoicrGM/OY=;
        b=NzUWkr8dCOfmQCAS89+Y8kRappEiVgtSsC/0t5yFatcrCrYYfdArpM6tyU/EKCLcXQ
         ILTya/A0BxuQXpII+6AtFxMbgUqD3LEE7AC9hB48fBxejTmoC86oVuUmY/gjwpcstbkQ
         BxrUQCgVt6Ml84T+GmXS5k6e99eP6zCNXbcYyIDDg9kKuDVeKPWQZDFvmm8+SsCLWoRl
         0PYY39HuB/ueK+Tw0CKQ5vyC8z8tjU3HSDPZXbrCn/7EQ9lFoC2Nzryg2KJWjwVTRbMb
         3mVwCixiBODAB4B/M3Hm8OrtecNvsxvlyym/uMmtY2D55G7r1MOQmjuVlWlLGTz9A1xJ
         a88g==
X-Gm-Message-State: AOJu0YxPm8R40Pa9j/MnwMTJPNCDC0wi+EYNd/um/QOj5hoxIdJjG/Kd
        IeK6/jz5etMZEDi+xuJTktY=
X-Google-Smtp-Source: AGHT+IECs0semidy4+/dkDjYCq+1gdymHKuT034zbcY7knE7pn0q9KWPYx/LLckW1TCGIjwDg9Vhmw==
X-Received: by 2002:ac2:5f8b:0:b0:4fe:af1:c3ae with SMTP id r11-20020ac25f8b000000b004fe0af1c3aemr8221385lfe.15.1698174608536;
        Tue, 24 Oct 2023 12:10:08 -0700 (PDT)
Received: from x120e.. (88-112-224-212.elisa-laajakaista.fi. [88.112.224.212])
        by smtp.gmail.com with ESMTPSA id a23-20020a194f57000000b004fce9e8c390sm2271860lfk.63.2023.10.24.12.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 12:10:08 -0700 (PDT)
From:   Olli Asikainen <olli.asikainen@gmail.com>
To:     Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org,
        Olli Asikainen <olli.asikainen@gmail.com>
Subject: [PATCH] platform/x86: thinkpad_acpi: Add battery quirk for Thinkpad X120e
Date:   Tue, 24 Oct 2023 22:09:21 +0300
Message-ID: <20231024190922.2742-1-olli.asikainen@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Thinkpad X120e also needs this battery quirk.

Signed-off-by: Olli Asikainen <olli.asikainen@gmail.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 41584427dc32..a46fc417cb20 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -9816,6 +9816,7 @@ static const struct tpacpi_quirk battery_quirk_table[] __initconst = {
 	 * Individual addressing is broken on models that expose the
 	 * primary battery as BAT1.
 	 */
+	TPACPI_Q_LNV('8', 'F', true),       /* Thinkpad X120e */
 	TPACPI_Q_LNV('J', '7', true),       /* B5400 */
 	TPACPI_Q_LNV('J', 'I', true),       /* Thinkpad 11e */
 	TPACPI_Q_LNV3('R', '0', 'B', true), /* Thinkpad 11e gen 3 */
-- 
2.42.0

