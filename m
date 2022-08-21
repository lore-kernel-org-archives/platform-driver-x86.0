Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DD13C3F6B0
	for <platform-driver-x86@archiver.kernel.org>; Sun, 21 Aug 2022 20:09:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229924AbiHUUJk (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 21 Aug 2022 16:09:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231328AbiHUUJj (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 21 Aug 2022 16:09:39 -0400
Received: from vorpal.se (vorpal.se [IPv6:2a01:7e00::f03c:91ff:fe73:398e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA9EA1705D
        for <platform-driver-x86@vger.kernel.org>; Sun, 21 Aug 2022 13:09:38 -0700 (PDT)
Received: by vorpal.se (Postfix) with ESMTPSA id 55391147F2;
        Sun, 21 Aug 2022 20:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=vorpal.se; s=2019;
        t=1661112577; bh=LQVWtIU4FcBgwe9IqM5ByqvxNanpbHXWZogdaxH1yTE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=A1XbjmCtIEo1yEK0g/4xFRpfmkonDqRvEsro7a5No+7KAlCXyAJvVPrNtHvExXdGP
         uxH+wYUhtGmzBrxcPr+L9T1t5YFPWg2NgWrsyLlb8yquZLX+u7Do3uWVYXWJEfklMg
         45H9mchgoLIv6iEpH7R0fecypVxzNqc6BhQJ3p5znL8s0Ewx7UMd2OcKp9q6xumOBo
         NMAdcaUULO1hCSxOQ99h64bc9moj82SJLW7DHljVzEpNuhA0tw1ZE6ic6c0vF0rt64
         kx6RV4anBiao1WqOaT5lztKOgLbicnTwdc4ZotJ6xK3FZqmNGP+dXdIvym6vxnScRF
         g7Jkw2BNfki8Q==
From:   Arvid Norlander <lkml@vorpal.se>
To:     platform-driver-x86@vger.kernel.org
Cc:     Azael Avalos <coproscefalo@gmail.com>,
        Arvid Norlander <lkml@vorpal.se>
Subject: [PATCH 1/2] platform/x86: Fix ECO LED control on Toshiba Z830
Date:   Sun, 21 Aug 2022 22:08:21 +0200
Message-Id: <20220821200821.1837460-2-lkml@vorpal.se>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220821200821.1837460-1-lkml@vorpal.se>
References: <20220821200821.1837460-1-lkml@vorpal.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The toshiba_acpi driver checks for TOS_INPUT_DATA_ERROR and tries a
different format. On the Z830 the error returned is TOS_NOT_SUPPORTED
though the different format still works. Allow either error.

Signed-off-by: Arvid Norlander <lkml@vorpal.se>
---
 drivers/platform/x86/toshiba_acpi.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index 0fc9e8b8827b..6cc617b2940e 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -675,12 +675,15 @@ static void toshiba_eco_mode_available(struct toshiba_acpi_dev *dev)
 		return;
 	}
 
-	if (out[0] == TOS_INPUT_DATA_ERROR) {
+	if (out[0] == TOS_INPUT_DATA_ERROR || out[0] == TOS_NOT_SUPPORTED) {
 		/*
 		 * If we receive 0x8300 (Input Data Error), it means that the
 		 * LED device is present, but that we just screwed the input
 		 * parameters.
 		 *
+		 * On some laptops 0x8000 (Not supported) is also returned in
+		 * this case, so we need to allow for that as well.
+		 *
 		 * Let's query the status of the LED to see if we really have a
 		 * success response, indicating the actual presense of the LED,
 		 * bail out otherwise.
-- 
2.37.2

