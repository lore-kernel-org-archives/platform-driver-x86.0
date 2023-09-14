Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 000E7CA553C
	for <platform-driver-x86@archiver.kernel.org>; Thu, 14 Sep 2023 13:04:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238568AbjINNER (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 14 Sep 2023 09:04:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238848AbjINNEG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 14 Sep 2023 09:04:06 -0400
Received: from raptor.dennisbonke.com (vmi485017.contaboserver.net [161.97.139.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C8082136
        for <platform-driver-x86@vger.kernel.org>; Thu, 14 Sep 2023 06:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dennisbonke.com;
        s=default; t=1694696636;
        bh=4X8K4dTUdoltVBfdFHdayi5ExakIhj0nvJfI4mFvPT4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=HNGjXuU7lfraIYoTjRe/g0AGdUbi6emzkWb4IP73o2iEJaqqMw4O1n5lOIDAA+jKe
         tVsq3pub4gBFFzvrgLl/aPORRVLSgv3KNZpn4whmX8jnx95KLdt8VBY8JJ9CgfkTPv
         FGSJv3oY+n38s+AKdGmfHI2P8HYKRjvv9pMIGlketRf25Lc7iT3+7OaOJouJkbyJit
         lZp+itTfc5T0A7fCjkEk19nTeGAkPvF3SBu643vnRCu+dhz/alVBz5Z/TgwX6niDFO
         +rf4Eqp7GWBFQ4uHogix4h9tXSda+hPD6TcIcFRb6E+B0muOLfePQTrpXyY1S4jO1b
         GATEYgaT6/b/Q==
Received: from DENNIS-MAIN-LAPTOP-SIDUCTION.wireless.hhs.nl (unknown [145.52.166.9])
        by raptor.dennisbonke.com (Postfix) with ESMTPSA id 95DB9A051C8;
        Thu, 14 Sep 2023 15:03:56 +0200 (CEST)
From:   Dennis Bonke <admin@dennisbonke.com>
To:     platform-driver-x86@vger.kernel.org
Cc:     Dennis Bonke <admin@dennisbonke.com>,
        =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH v3] platform/x86: thinkpad_acpi: Take mutex in hotkey_resume
Date:   Thu, 14 Sep 2023 15:03:56 +0200
Message-Id: <20230914130356.235912-1-admin@dennisbonke.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230913231829.192842-1-admin@dennisbonke.com>
References: <20230913231829.192842-1-admin@dennisbonke.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

hotkey_status_set expects the hotkey_mutex to be held.
It seems like it was missed here and that gives lockdep
warnings while resuming.

Fixes: 38831eaf7d4c ("platform/x86: thinkpad_acpi: use lockdep annotations")
Cc: stable@vger.kernel.org
Reviewed-by: Thomas Weißschuh <linux@weissschuh.net>
Signed-off-by: Dennis Bonke <admin@dennisbonke.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index d70c89d32534..41584427dc32 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -4116,9 +4116,11 @@ static void hotkey_resume(void)
 {
 	tpacpi_disable_brightness_delay();
 
+	mutex_lock(&hotkey_mutex);
 	if (hotkey_status_set(true) < 0 ||
 	    hotkey_mask_set(hotkey_acpi_mask) < 0)
 		pr_err("error while attempting to reset the event firmware interface\n");
+	mutex_unlock(&hotkey_mutex);
 
 	tpacpi_send_radiosw_update();
 	tpacpi_input_send_tabletsw();
-- 
2.40.1

