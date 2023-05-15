Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C727DC77B7D
	for <platform-driver-x86@archiver.kernel.org>; Mon, 15 May 2023 05:50:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234659AbjEOFuN (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 15 May 2023 01:50:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238236AbjEOFuI (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 15 May 2023 01:50:08 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 477642708
        for <platform-driver-x86@vger.kernel.org>; Sun, 14 May 2023 22:49:51 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-528dd896165so8777855a12.2
        for <platform-driver-x86@vger.kernel.org>; Sun, 14 May 2023 22:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1684129791; x=1686721791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/iGXLwFtJb/ikFg1cYTajKxo15m1ntUjHJP3AtJxPHQ=;
        b=dzjo8FojeRcnufXLfXC0KBxuYEA22LD3hfHOwXg4ZDuLKLv0BrqZuH8SGOB++jp5uO
         wzKiYKHcGFS22nfktsiZ/0soliO+6KwkV1F/CT4cSacQXjZNHJvQslYLfkfOySySRtSC
         8UjaZJDHoN+NS64WsDBJKuPA3FJoVOmbNNpbeSntaVz+MYmRbJtjWSbb0awzzHpNTzQM
         iMrORsenLXTKP1MfGL3i50980w+juwmbTsihGPxC1TFAomikj8sy7z3tZ5zOxuVobKLf
         PO/dJlkFK4Nme80wJtwvZuMrtkTbpTOttq+0KOfxO/f5tg65WVxizgRj349mCeC4zcqw
         YAGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684129791; x=1686721791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/iGXLwFtJb/ikFg1cYTajKxo15m1ntUjHJP3AtJxPHQ=;
        b=STxvjeLESC76ST6K3JLrXt5NZl2EU9n5fE0/RynfjJatkrkB6eote3NZsnR/KtWz/o
         5a2F9qyKOC9IeURx8DJpMxqSTh6Q6K+XU6YdoG3GS4/EwRiYz+WTHMS4uk607Tlndped
         Ns7B8Dgcmlzp71V2bK2vSiuPm7XsAFuUVvJK9/OttqEbwE5h2WB3UQcwkmxgWyl4+0Ic
         96Jn304A5+r1qgCyhSa4Ok2LuYBd70fLbE5B0HFsqBgmQzwq7KvNin2y75kCo5fYdnF/
         DIMzRsa4cFPqSxK42qToJyu2VCQrd9ar1hTiDqxv/fXQjeUEEpene18VNgzqNBN/vwj8
         9fTw==
X-Gm-Message-State: AC+VfDxgk1nbXyyBFAZrS6EMYhqHHliL51QN41orBGbSncqAkKlEkuQw
        f+pQqllIZAReaCNejb3XIOGXjA==
X-Google-Smtp-Source: ACHHUZ5Z2n4/ARSq3kgTidyaSTNrk+RwN40D33bxOlnfkr8ZPEoD5Bs6K7sM3BLGphGdcRXft9Eprw==
X-Received: by 2002:a17:902:e5cf:b0:1ad:e3a8:3bf with SMTP id u15-20020a170902e5cf00b001ade3a803bfmr12750021plf.21.1684129790858;
        Sun, 14 May 2023 22:49:50 -0700 (PDT)
Received: from localhost.localdomain ([106.51.191.118])
        by smtp.gmail.com with ESMTPSA id f10-20020a17090274ca00b001ab28f620d0sm12423277plt.290.2023.05.14.22.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 May 2023 22:49:50 -0700 (PDT)
From:   Sunil V L <sunilvl@ventanamicro.com>
To:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
        linux-crypto@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        llvm@lists.linux.dev
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Sunil V L <sunilvl@ventanamicro.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Weili Qian <qianweili@huawei.com>,
        Zhou Wang <wangzhou1@hisilicon.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        Marc Zyngier <maz@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>
Subject: [PATCH V6 02/21] platform/surface: Disable for RISC-V
Date:   Mon, 15 May 2023 11:19:09 +0530
Message-Id: <20230515054928.2079268-3-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230515054928.2079268-1-sunilvl@ventanamicro.com>
References: <20230515054928.2079268-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

With CONFIG_ACPI enabled for RISC-V, this driver gets enabled
in allmodconfig build. However, RISC-V doesn't support sub-word
atomics which is used by this driver and hence allmodconfig
build will fail.

There is currently no plan to support this driver for RISC-V. So,
disable this driver for RISC-V even when ACPI is enabled.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Maximilian Luz <luzmaximilian@gmail.com>
---
 drivers/platform/surface/aggregator/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/surface/aggregator/Kconfig b/drivers/platform/surface/aggregator/Kconfig
index c114f9dd5fe1..88afc38ffdc5 100644
--- a/drivers/platform/surface/aggregator/Kconfig
+++ b/drivers/platform/surface/aggregator/Kconfig
@@ -4,7 +4,7 @@
 menuconfig SURFACE_AGGREGATOR
 	tristate "Microsoft Surface System Aggregator Module Subsystem and Drivers"
 	depends on SERIAL_DEV_BUS
-	depends on ACPI
+	depends on ACPI && !RISCV
 	select CRC_CCITT
 	help
 	  The Surface System Aggregator Module (Surface SAM or SSAM) is an
-- 
2.34.1

