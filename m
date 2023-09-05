Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 543ADCA1001
	for <platform-driver-x86@archiver.kernel.org>; Tue,  5 Sep 2023 19:00:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240685AbjIETA2 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 5 Sep 2023 15:00:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241063AbjIETAQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 5 Sep 2023 15:00:16 -0400
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73DCD1990
        for <platform-driver-x86@vger.kernel.org>; Tue,  5 Sep 2023 11:59:49 -0700 (PDT)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-401f503b529so28406225e9.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 05 Sep 2023 11:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1693940022; x=1694544822; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vPYbcmhlviFwWzuYOu9Z0ne7hiPspJP6iTCWdpKZ06M=;
        b=JQt+WzsZ/fnvDidYGADRhY3EvXZ2ja2JbU7t5ziFg7kF9Y3cfrb63L+eGekuF/Su8a
         739QfhBKS4580mO4uyL/CmNWcv15dv4o+7zTMzrENPZDwgd/pF+O5lEWYMip8+v76JKL
         7TUq46aFRNv7ik1mAE7J/b3H7eML55axcurEdKoiwI4FhrBi3VNzzvD62e8lGePMa9SQ
         Nu7/npFQaQBnJKhtJRNsTinKJW3t0Tv1oJoWaIaLUz6ZA1saC9z88Nv9VZ2fz41uAe7r
         XNmIfkOs/qAb+ChwkBzc4mbSo2oLI2fU+YBVf6sVk6RJWPMMaCgh4Ho3nvZAD8j1+poZ
         wLZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693940022; x=1694544822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vPYbcmhlviFwWzuYOu9Z0ne7hiPspJP6iTCWdpKZ06M=;
        b=FhEr+i7S3sL5DHbY8oatgqzkk+2M0O6geZPwH9E7hPMkoeN/oRx8pZriKXjoGlfvRb
         vALxc29JQV2f7lzKeXVWnug0UzjOnCTjgOAHnG9o8S1ekJhYvAFETPhjSB7ig3NkearX
         xGEmuehEGXkD5KjB5xpSFlACtLoeAxJguY7XQmdYzAgAmVkyWSAULHD4+s4WMXogtlAq
         EvX5w6KPc7LscA4Sc9ZRnmFCnT7HBCDpwO8GXo4mxFOXB179/bUOy8xFkGuF/PY0aAlk
         qanhjtgkyPUcGxlZtGckAE4fT/DOzs/GgYl6rb2IyAQ9shXOUyh2jtbs7WgP6gPCZHST
         SdaQ==
X-Gm-Message-State: AOJu0Yza9gZKS5jJdZlHVg3yOSmtebxYPZkdbvYfN4nAnQM3F5ZqGL1b
        hdyMuEvjgL5UN6H/8y1dRDRoTg==
X-Google-Smtp-Source: AGHT+IH7bFhmwhJkbEP09mNLLK4toqHl75c1c56y8lKZfC2ULSFpMzvdc2De5dyozg7UIqDbZnvopw==
X-Received: by 2002:a7b:cb96:0:b0:3fe:d6bf:f314 with SMTP id m22-20020a7bcb96000000b003fed6bff314mr414148wmi.39.1693940021910;
        Tue, 05 Sep 2023 11:53:41 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:7a54:5dbc:6d09:48b7])
        by smtp.gmail.com with ESMTPSA id 17-20020a05600c249100b003fbc30825fbsm17550010wms.39.2023.09.05.11.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 11:53:41 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Russell King <linux@armlinux.org.uk>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Dipen Patel <dipenp@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-acpi@vger.kernel.org, timestamp@lists.linux.dev,
        linux-tegra@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 13/21] hte: tegra194: improve the GPIO-related comment
Date:   Tue,  5 Sep 2023 20:53:01 +0200
Message-Id: <20230905185309.131295-14-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230905185309.131295-1-brgl@bgdev.pl>
References: <20230905185309.131295-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Using any of the GPIO interfaces using the global numberspace is
deprecated. Make it clear in the comment.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/hte/hte-tegra194.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/hte/hte-tegra194.c b/drivers/hte/hte-tegra194.c
index 6fe6897047ac..9fd3c00ff695 100644
--- a/drivers/hte/hte-tegra194.c
+++ b/drivers/hte/hte-tegra194.c
@@ -407,12 +407,15 @@ static int tegra_hte_line_xlate(struct hte_chip *gc,
 		return -EINVAL;
 
 	/*
+	 * GPIO consumers can access GPIOs in two ways:
 	 *
-	 * There are two paths GPIO consumers can take as follows:
-	 * 1) The consumer (gpiolib-cdev for example) which uses GPIO global
-	 * number which gets assigned run time.
-	 * 2) The consumer passing GPIO from the DT which is assigned
-	 * statically for example by using TEGRA194_AON_GPIO gpio DT binding.
+	 * 1) Using the global GPIO numberspace.
+	 *
+	 * This is the old, now DEPRECATED method and should not be used in
+	 * new code. TODO: Check if tegra is even concerned by this.
+	 *
+	 * 2) Using GPIO descriptors that can be assigned to consumer devices
+	 * using device-tree, ACPI or lookup tables.
 	 *
 	 * The code below addresses both the consumer use cases and maps into
 	 * HTE/GTE namespace.
-- 
2.39.2

