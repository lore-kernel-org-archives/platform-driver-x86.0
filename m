Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21A60EE0211
	for <platform-driver-x86@archiver.kernel.org>; Wed, 13 Sep 2023 23:21:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232883AbjIMXVq (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 13 Sep 2023 19:21:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231515AbjIMXVq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 13 Sep 2023 19:21:46 -0400
X-Greylist: delayed 61 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 13 Sep 2023 16:21:42 PDT
Received: from raptor.dennisbonke.com (vmi485017.contaboserver.net [161.97.139.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D9361BCB
        for <platform-driver-x86@vger.kernel.org>; Wed, 13 Sep 2023 16:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dennisbonke.com;
        s=default; t=1694647239;
        bh=gVrf1iK7O9zAR8Vs1sEqbCVpvQ1ZBhNE7O1hL6GtMb0=;
        h=From:To:Cc:Subject:Date:From;
        b=NdPeC2uyV4rlTcEz2B00xK9eZMJ6xaHLpL0+z0rN9A8i/CibczWWoFQ7obM16w2yJ
         KrXXo2WZAJ3susfovuQcLmqe1VGsDTxZ/1HcdYcIoEcJ/FutMS3RKBrEH+K1ThoHQ3
         28wzqFtxfAkSToRhD9FKE7q94hZ/IafucUVHLXhlBV5jBHsAQLahZIfiSnKy3XZ7W9
         Hc470Me5QCg54hekzzFdoYQyn4cLqsz4NN/2Fgp2dlQnwQi2RaWnqumJGxQ5cLgilV
         5oSzaI6oyJnwAE0zpKr6sNk1TIjv5ecgba9mqcrY374zowO68F5b65mzlN0IicjbjR
         r5TTyqJZc5vaw==
Received: from localhost.localdomain (050-179-172-081.dynamic.caiway.nl [81.172.179.50])
        by raptor.dennisbonke.com (Postfix) with ESMTPSA id AF8D1A05ADA;
        Thu, 14 Sep 2023 01:20:39 +0200 (CEST)
From:   admin@dennisbonke.com
To:     platform-driver-x86@vger.kernel.org
Cc:     Dennis Bonke <admin@dennisbonke.com>
Subject: [PATCH] platform/x86: thinkpad_acpi: Take mutex in hotkey_resume
Date:   Thu, 14 Sep 2023 01:18:29 +0200
Message-Id: <20230913231829.192842-1-admin@dennisbonke.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Dennis Bonke <admin@dennisbonke.com>

hotkey_status_{set,get} expect the hotkey_mutex to be held.
It seems like it was missed here and that gives warnings while resuming.

Signed-off-by: Dennis Bonke <admin@dennisbonke.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index d70c89d32534..de5859a5eb0d 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -4116,9 +4116,11 @@ static void hotkey_resume(void)
 {
 	tpacpi_disable_brightness_delay();
 
+	mutex_lock(&hotkey_mutex)
 	if (hotkey_status_set(true) < 0 ||
 	    hotkey_mask_set(hotkey_acpi_mask) < 0)
 		pr_err("error while attempting to reset the event firmware interface\n");
+	mutex_unlock(&hotkey_mutex);
 
 	tpacpi_send_radiosw_update();
 	tpacpi_input_send_tabletsw();
-- 
2.40.1

