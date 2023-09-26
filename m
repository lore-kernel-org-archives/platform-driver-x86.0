Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5720E7E648
	for <platform-driver-x86@archiver.kernel.org>; Tue, 26 Sep 2023 14:59:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235001AbjIZPAC (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 26 Sep 2023 11:00:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234910AbjIZPAA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 26 Sep 2023 11:00:00 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBBD411D
        for <platform-driver-x86@vger.kernel.org>; Tue, 26 Sep 2023 07:59:52 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-31c5cac3ae2so8731218f8f.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 26 Sep 2023 07:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1695740391; x=1696345191; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vfLYtgRnxIhfGIuZ3AuQPnmd6mF7Zk5St0BXq4vGsIQ=;
        b=TLzw53xlfCA4B2yyekGcmN2Gow3tYsMQZDMag7APmsRKZLKRwPcuPoc7Xfm9pZ1N8A
         i8XZ6fbmgckGNwnl/tB/4I5ppkDl4KZpStL4Xiv9ChBKbHtPW+I1ipHDcBULsm4XLdE3
         aBu2drv72zmlMLQSx51xCIobXP2ySCWI7bFE7fqUuQCm41h1B3nTdBqVBLZk+3Wqr9TQ
         UQcxODnyP08mnU+n1WxUthfrUHGcjCBdV14jAzYfqloN4c3Y2vLkGRyoEGR/WlHc5Kh+
         TuNVFJ7KMX7DuFMdygi7a54VJGyS0URP4mSdyyDhwbZ4H+ipRDjnQ5o8xw/GHYglb4jt
         R8xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695740391; x=1696345191;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vfLYtgRnxIhfGIuZ3AuQPnmd6mF7Zk5St0BXq4vGsIQ=;
        b=qeq5j1urUo50Gb+tyIFZD5PCe9MnU7tENFM/oGeSiY28I1a9wNqsgxqV8HJCDcMYso
         mlWEGb4HM/lq1ARqGLC63Fpdg5IbwUDI7aD1/Hkq2GO13Ne1pGF1Gf/RFMYz2FD2f/Fd
         YWmAwrPjGXyFSz6lULbRhhWObS0GG8yCAPkYz3CX/SRSBJKRAQl5k4rtAYrkVtKltxo6
         K0k906AIKo3XfrARJZKB7mPqnip9xt+HN2wQhmTI8INXJdDL3Mecgg7nLxVdiSdsxwLD
         Sf0xGEkFCNwrhNVBWkeHuVDz3SlPZMB9JjP2XukXt03xbDrmMBhxnPrYgYJL8ETttrOZ
         JtqA==
X-Gm-Message-State: AOJu0YwDqut2n6SLm1CzxEfDIO/p5lp3mOPEd9MQ9YJJy2nhwANHyUyL
        d8kWwWxPQ0Hz3xwaYxn8/qjUCQ==
X-Google-Smtp-Source: AGHT+IHPHclId6kylza566id26/po9Ed756snf6AMpJqfTNPum1ErtRmJjfjJVGvOnVFQwtK5zDvsw==
X-Received: by 2002:a5d:44ca:0:b0:31f:d52a:82af with SMTP id z10-20020a5d44ca000000b0031fd52a82afmr8678818wrr.49.1695740391015;
        Tue, 26 Sep 2023 07:59:51 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:686:c497:30b1:d2b9])
        by smtp.gmail.com with ESMTPSA id s2-20020a5d5102000000b0031f82743e25sm14871634wrt.67.2023.09.26.07.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 07:59:50 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Scally <djrscally@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>
Cc:     linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [RFT PATCH 0/4] platform/x86: int3472: don't use gpiod_toggle_active_low()
Date:   Tue, 26 Sep 2023 16:59:39 +0200
Message-Id: <20230926145943.42814-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

gpiod_toggle_active_low() is a badly designed API that should have never
been used elsewhere then in the MMC code. And even there we should find
a better solution.

Replace the uses of it in the int3472 driver with the good old temporary
lookup table trick. This is not very pretty either but it's the lesser
evil.

Bartosz Golaszewski (4):
  platform/x86: int3472: provide a helper for getting GPIOs from lookups
  platform/x86: int3472: led: don't use gpiod_toggle_active_low()
  platform/x86: int3472: clk_and_regulator: use GPIO lookup tables
  gpio: acpi: remove acpi_get_and_request_gpiod()

 drivers/gpio/gpiolib-acpi.c                   | 28 ------------------
 .../x86/intel/int3472/clk_and_regulator.c     | 22 ++++++--------
 drivers/platform/x86/intel/int3472/common.c   | 29 +++++++++++++++++++
 drivers/platform/x86/intel/int3472/common.h   |  9 ++++++
 drivers/platform/x86/intel/int3472/led.c      | 12 +++-----
 include/linux/gpio/consumer.h                 |  8 -----
 6 files changed, 51 insertions(+), 57 deletions(-)

-- 
2.39.2

