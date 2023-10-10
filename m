Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 129DDCD8CAC
	for <platform-driver-x86@archiver.kernel.org>; Tue, 10 Oct 2023 17:23:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233887AbjJJRXQ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 10 Oct 2023 13:23:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233484AbjJJRXQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 10 Oct 2023 13:23:16 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA4ACB8
        for <platform-driver-x86@vger.kernel.org>; Tue, 10 Oct 2023 10:23:12 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-5056ca2b6d1so66299e87.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 10 Oct 2023 10:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696958590; x=1697563390; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iwibm9SaTNErdoXF5GMv+K/Hk5BX2h8+gk8z0mNk/b4=;
        b=BYf4+2mM4YRUTzmn7LxAtwkj1slzqmaKneiWlwmlvLzaAsu3o6ucurdfgCxRbFYJzi
         s+xM33556wxzSN1gBnrFefwvuQiFfM502RsWDNdq/6W95nkW9TMeHPiC7BKfTTVJKn9v
         irxT53xFogHsrfDY6SAcWi/C1+K8wirBCDhY8kmYrPrJw8rhR3HxdSGiKA5/NwIqkimN
         MjJl7Rpb1nLOBXM4rUEv/zB2cC9/FpY4MeKSKOZHJ2ZIl3l/4OIcTwMWndsmI6m/Ajop
         XrK1u0PpEyGL+cQE1PTSg2RA4bUz18qGuFIPLIkTlqEjix819CFA9sc4x+RXrh7rm7oI
         /bKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696958590; x=1697563390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Iwibm9SaTNErdoXF5GMv+K/Hk5BX2h8+gk8z0mNk/b4=;
        b=MaY5Kvpgr9tUFdeXVQjirFltoW0xXUCnMpT8OS9VRxDnbCD4Ce18yNzdqr6DmrPbdg
         ImjKdhb5UV83inillVLYbAzmWRO//fY0U4NheTIIQeOCRKEmfxEaPf/b/K7vUc5b3FV5
         nT50U1y7M2l+PfNbPkaQ4xi/s3FdQkgKAAH/UN9kzr2tSGov1SvPrb+RriG4lQejlnLY
         xK3N40aQnRN08bkz3+UOe9H5qKdCMBbdvcuLj5F4oP5aXm1IpUQ468OOazRnP5iLQplL
         4hh6OtH+O9hmBNiAR6EiJ0FDF5UWmIsbR0W/r4h1kyHwFNy5yWn3fCEYRwz0z45gSdQQ
         md1g==
X-Gm-Message-State: AOJu0YxyaBAW/ArQK1UorVMBheEl3/lpwhB913VwxkpqzU0CLPU0jLjX
        oWuXWVME/jd7+oFmGnOjHRMr5OeEwnI=
X-Google-Smtp-Source: AGHT+IEci6RhxnwOk3mRgwB66uvPPHmso8A66sYs1OP7zCqWIZQHgYWHw2IhKDVfAYsH+47ek6PIrQ==
X-Received: by 2002:a05:6512:313c:b0:500:96dd:f95a with SMTP id p28-20020a056512313c00b0050096ddf95amr11580918lfd.24.1696958590298;
        Tue, 10 Oct 2023 10:23:10 -0700 (PDT)
Received: from localhost.localdomain ([81.177.126.138])
        by smtp.gmail.com with ESMTPSA id y2-20020a197502000000b005041f004d33sm1881636lfe.90.2023.10.10.10.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 10:23:09 -0700 (PDT)
From:   Nikita Kravets <teackot@gmail.com>
To:     platform-driver-x86@vger.kernel.org
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Nikita Kravets <teackot@gmail.com>,
        Aakash Singh <mail@singhaakash.dev>,
        Jose Angel Pastrana <japp0005@red.ujaen.es>
Subject: [PATCH 4/5] platform/x86: msi-ec: Add EC bit operation functions
Date:   Tue, 10 Oct 2023 20:20:42 +0300
Message-ID: <20231010172037.611063-11-teackot@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231010172037.611063-3-teackot@gmail.com>
References: <20231010172037.611063-3-teackot@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The EC of MSI laptops supports several features represented by a single
bit. Add ec_set_bit and ec_check_bit functions to operate on these bits.

Cc: Aakash Singh <mail@singhaakash.dev>
Cc: Jose Angel Pastrana <japp0005@red.ujaen.es>
Signed-off-by: Nikita Kravets <teackot@gmail.com>
---
 drivers/platform/x86/msi-ec.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/platform/x86/msi-ec.c b/drivers/platform/x86/msi-ec.c
index 09472b21e093..ae73dcf01d09 100644
--- a/drivers/platform/x86/msi-ec.c
+++ b/drivers/platform/x86/msi-ec.c
@@ -699,6 +699,34 @@ static int ec_read_seq(u8 addr, u8 *buf, u8 len)
 	return 0;
 }
 
+static int ec_set_bit(u8 addr, u8 bit, bool value)
+{
+	int result;
+	u8 stored;
+
+	result = ec_read(addr, &stored);
+	if (result < 0)
+		return result;
+
+	stored ^= (-(u8) value ^ stored) & (1 << bit);
+
+	return ec_write(addr, stored);
+}
+
+static int ec_check_bit(u8 addr, u8 bit, bool *output)
+{
+	int result;
+	u8 stored;
+
+	result = ec_read(addr, &stored);
+	if (result < 0)
+		return result;
+
+	*output = (stored >> bit) & 1;
+
+	return 0;
+}
+
 static int ec_get_firmware_version(u8 buf[MSI_EC_FW_VERSION_LENGTH + 1])
 {
 	int result;
-- 
2.42.0

