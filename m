Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 048D0EE0213
	for <platform-driver-x86@archiver.kernel.org>; Thu, 14 Sep 2023 00:26:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229947AbjINA0E (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 13 Sep 2023 20:26:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229485AbjINA0D (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 13 Sep 2023 20:26:03 -0400
Received: from raptor.dennisbonke.com (vmi485017.contaboserver.net [161.97.139.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6846C98
        for <platform-driver-x86@vger.kernel.org>; Wed, 13 Sep 2023 17:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dennisbonke.com;
        s=default; t=1694651158;
        bh=bP+dCR99V+pKF+LVLkoCvj1yJcJEzNXWPV7RsDP/YM4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=b1LpLYCyZkJFSfMMbQajopNTMNMvlY8WFKCIRfEL8N7mQ7do5e96SoJgvZZHctUC8
         V3vVi7d+wwVAHYCXbsp9FM7iCgKXNyZ9WEhsSosWq3zO2yecDr2pnfHD8K6lKgm26p
         mP83RpPfya9c8iCedRSQ0GDtZuGV4zio4rhtXZ81M/l/Lo9QPTaq6S8+GbYMxx4X0H
         0Vo+8DDkkWBc9jqTaIf3x8QmOCkGM+3PLw2WHvPo1Af6EOvq5PwC+4ge0sG5u9sHm1
         CLx7/K8Mw/OEHRCRiL5GIPnf0uzdgBKN+f6YEhZLa/wEVgGOC5cqVJIU6hShe9FiMp
         SbK42UzpwhlZw==
Received: from localhost.localdomain (050-179-172-081.dynamic.caiway.nl [81.172.179.50])
        by raptor.dennisbonke.com (Postfix) with ESMTPSA id E7234A05B06;
        Thu, 14 Sep 2023 02:25:57 +0200 (CEST)
From:   Dennis Bonke <admin@dennisbonke.com>
To:     platform-driver-x86@vger.kernel.org
Cc:     Dennis Bonke <admin@dennisbonke.com>
Subject: [PATCH v2] platform/x86: thinkpad_acpi: Take mutex in hotkey_resume
Date:   Thu, 14 Sep 2023 02:25:00 +0200
Message-Id: <20230914002500.201442-2-admin@dennisbonke.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230913231829.192842-1-admin@dennisbonke.com>
References: <20230913231829.192842-1-admin@dennisbonke.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

hotkey_status_set expects the hotkey_mutex to be held.
It seems like it was missed here and that gives lockdep
warnings while resuming.

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

