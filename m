Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51A04C7EE33
	for <platform-driver-x86@archiver.kernel.org>; Wed,  1 Mar 2023 20:17:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230030AbjCAURA (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 1 Mar 2023 15:17:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230024AbjCAUQU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 1 Mar 2023 15:16:20 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9985C51FAC
        for <platform-driver-x86@vger.kernel.org>; Wed,  1 Mar 2023 12:15:59 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id l7-20020a05600c4f0700b003e79fa98ce1so262941wmq.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 01 Mar 2023 12:15:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677701752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FS5MMzUrtYY5N2w5QCadh2L/6Lyuv9jfcaqNKoRqTRU=;
        b=Wh1pDVCEqhjlJTafWbx23xgrU9MTAStk8awP1aqswW8Gi720ZllVpBTdpV3pypOdWz
         2/1vcLJXoc2h8DLn7W+CYb7HiFJpY7f/LNhRdj9ryZbyr7m8zfnh18M7I6xmMREEqzNb
         E47oMtCLR2ltG9x6r3qAYDSCAlyuIENYjlwWtwF0VQ8JGHJVJ6W/gRJXjsJOmz9UUGL6
         SGa/FjUFqa4l4hfO97J8INxHyV02noj65Yz08aDuXf5G4HQO77iriljdBwmilKvw8MQX
         4kMJ5yIx2ReX6Pl9Cio9VyyByqM4ZHizUjCXu3kUXuUbTX0s0ADV336rk7PqnW4mGKxm
         AZpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677701752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FS5MMzUrtYY5N2w5QCadh2L/6Lyuv9jfcaqNKoRqTRU=;
        b=v1aQ4ri3KIC4nKtycuN9dNeYnuRW4gfHereODlExT4mcx2bw6neDwMmwkqGwyqz9om
         uyntTGY7bP2If0x8kDxj/Zb63k0bgFdtmvPU9seOqp5zm6j32SufFb02NdjlaehoP4gK
         XTUwY+0T8SIOIDOO7MuhGLyki+UzVT8A/iu1P2gd4Tm6h0Hq+39/YzdO3AVPjTediixV
         J1yJZ6G0U7JMoQYOXudolHz9ngGbIKkMDgX08DxVZ7Fkm8xQ4hgv/FmJuH3rzGHQ1miU
         4IhqYF+FtTvyqnU6Egk+OsSsuCMA9QERAMeqGLB3heo75nxgMeY/cKj4HJv3K/KHe7e2
         i0pw==
X-Gm-Message-State: AO0yUKX1cTrlRKl0YrHSMsQN+VRIjKbsXS3SVxd0wEzfkoGV5Ryw8zLQ
        Cis10ASZe4a7MdKcL5xQxeXNyA==
X-Google-Smtp-Source: AK7set9/48B3UkJzRbD9ghUuPOZUq417aVxqF4bZ/zrpzF6PhFApIvpjoxt3GWWtJuYzeCOE4ikdug==
X-Received: by 2002:a05:600c:1716:b0:3eb:2e66:9 with SMTP id c22-20020a05600c171600b003eb2e660009mr6538243wmn.30.1677701752097;
        Wed, 01 Mar 2023 12:15:52 -0800 (PST)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:6ffe:ce4f:bd31:1e6d])
        by smtp.gmail.com with ESMTPSA id x16-20020a1c7c10000000b003e70a7c1b73sm576546wmc.16.2023.03.01.12.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Mar 2023 12:15:51 -0800 (PST)
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
To:     rafael@kernel.org, daniel.lezcano@linaro.org
Cc:     linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Kaestle <peter@piie.net>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org (open list:ACER ASPIRE ONE
        TEMPERATURE AND FAN DRIVER)
Subject: [PATCH v5 18/18] thermal/drivers/acerhdf: Remove pointless governor test
Date:   Wed,  1 Mar 2023 21:14:46 +0100
Message-Id: <20230301201446.3713334-19-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230301201446.3713334-1-daniel.lezcano@linaro.org>
References: <20230301201446.3713334-1-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The thermal zone parameter specifies the bang-bang governor.

The Kconfig selects the bang-bang governor. So it is pointless to test
if the governor was set for the thermal zone assuming it may not have
been compiled-in.

Remove the test and prevent another access into the thermal internals.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Acked-by: Peter Kaestle <peter@piie.net>
---
 drivers/platform/x86/acerhdf.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/platform/x86/acerhdf.c b/drivers/platform/x86/acerhdf.c
index 61f1c3090867..71b9c1f922d9 100644
--- a/drivers/platform/x86/acerhdf.c
+++ b/drivers/platform/x86/acerhdf.c
@@ -697,13 +697,6 @@ static int __init acerhdf_register_thermal(void)
 	if (ret)
 		return ret;
 
-	if (strcmp(thz_dev->governor->name,
-				acerhdf_zone_params.governor_name)) {
-		pr_err("Didn't get thermal governor %s, perhaps not compiled into thermal subsystem.\n",
-				acerhdf_zone_params.governor_name);
-		return -EINVAL;
-	}
-
 	return 0;
 }
 
-- 
2.34.1

