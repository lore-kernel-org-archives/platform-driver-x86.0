Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 654EEC28D13
	for <platform-driver-x86@archiver.kernel.org>; Thu, 25 Aug 2022 14:17:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238171AbiHYORB (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 25 Aug 2022 10:17:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241972AbiHYOOe (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 25 Aug 2022 10:14:34 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9D51B6D65
        for <platform-driver-x86@vger.kernel.org>; Thu, 25 Aug 2022 07:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1661436861;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yLjXhPoFWJh0BS4tWgMq4jt/qW3/RS4b/ONVguiT+Kw=;
        b=d7sETZEP066/FSszyklXkTACKQ7mMGtCgsvOVv+i7fQXryqHD4s66kDCMESQhmnFYf/CmA
        6TRAFY1hAK/8DhTGhzlkeH+cR0SSPbDCGd5aQcnxJksK3ox6NakT7+d/q6dy8HW5eGa0Dn
        JiCamJ0G3Bk/O7QruFrJL0SAWs/rvX8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-74-J9he1LyaMrus8YhTzeYFCQ-1; Thu, 25 Aug 2022 10:14:15 -0400
X-MC-Unique: J9he1LyaMrus8YhTzeYFCQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E92D7280DB29;
        Thu, 25 Aug 2022 14:13:39 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.193.46])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 3DD8F492C3B;
        Thu, 25 Aug 2022 14:13:39 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 2/3] platform/x86: msi-laptop: Simplify ec_delay handling
Date:   Thu, 25 Aug 2022 16:13:35 +0200
Message-Id: <20220825141336.208597-2-hdegoede@redhat.com>
In-Reply-To: <20220825141336.208597-1-hdegoede@redhat.com>
References: <20220825141336.208597-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

There is no reason to have both non-delayed and delayed work structs
for the rfkill and touchpad work.

Instead simply call schedule_delayed_work() with a delay of 0 for
the quirks->ec_delay == fase case.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/msi-laptop.c | 31 +++++++++++--------------------
 1 file changed, 11 insertions(+), 20 deletions(-)

diff --git a/drivers/platform/x86/msi-laptop.c b/drivers/platform/x86/msi-laptop.c
index 54170172a666..65db18c6e3e8 100644
--- a/drivers/platform/x86/msi-laptop.c
+++ b/drivers/platform/x86/msi-laptop.c
@@ -590,6 +590,14 @@ static int dmi_check_cb(const struct dmi_system_id *dmi)
 	return 1;
 }
 
+static unsigned long msi_work_delay(int msecs)
+{
+	if (quirks->ec_delay)
+		return msecs_to_jiffies(msecs);
+
+	return 0;
+}
+
 static const struct dmi_system_id msi_dmi_table[] __initconst = {
 	{
 		.ident = "MSI S270",
@@ -784,7 +792,6 @@ static void msi_update_rfkill(struct work_struct *ignored)
 		msi_rfkill_set_state(rfk_threeg, !threeg_s);
 }
 static DECLARE_DELAYED_WORK(msi_rfkill_dwork, msi_update_rfkill);
-static DECLARE_WORK(msi_rfkill_work, msi_update_rfkill);
 
 static void msi_send_touchpad_key(struct work_struct *ignored)
 {
@@ -800,7 +807,6 @@ static void msi_send_touchpad_key(struct work_struct *ignored)
 		KEY_TOUCHPAD_ON : KEY_TOUCHPAD_OFF, 1, true);
 }
 static DECLARE_DELAYED_WORK(msi_touchpad_dwork, msi_send_touchpad_key);
-static DECLARE_WORK(msi_touchpad_work, msi_send_touchpad_key);
 
 static bool msi_laptop_i8042_filter(unsigned char data, unsigned char str,
 				struct serio *port)
@@ -818,20 +824,12 @@ static bool msi_laptop_i8042_filter(unsigned char data, unsigned char str,
 		extended = false;
 		switch (data) {
 		case 0xE4:
-			if (quirks->ec_delay) {
-				schedule_delayed_work(&msi_touchpad_dwork,
-					round_jiffies_relative(0.5 * HZ));
-			} else
-				schedule_work(&msi_touchpad_work);
+			schedule_delayed_work(&msi_touchpad_dwork, msi_work_delay(500));
 			break;
 		case 0x54:
 		case 0x62:
 		case 0x76:
-			if (quirks->ec_delay) {
-				schedule_delayed_work(&msi_rfkill_dwork,
-					round_jiffies_relative(0.5 * HZ));
-			} else
-				schedule_work(&msi_rfkill_work);
+			schedule_delayed_work(&msi_rfkill_dwork, msi_work_delay(500));
 			break;
 		}
 	}
@@ -898,12 +896,7 @@ static int rfkill_init(struct platform_device *sdev)
 	}
 
 	/* schedule to run rfkill state initial */
-	if (quirks->ec_delay) {
-		schedule_delayed_work(&msi_rfkill_init,
-			round_jiffies_relative(1 * HZ));
-	} else
-		schedule_work(&msi_rfkill_work);
-
+	schedule_delayed_work(&msi_rfkill_init, msi_work_delay(1000));
 	return 0;
 
 err_threeg:
@@ -1114,7 +1107,6 @@ static int __init msi_init(void)
 	if (quirks->load_scm_model) {
 		i8042_remove_filter(msi_laptop_i8042_filter);
 		cancel_delayed_work_sync(&msi_rfkill_dwork);
-		cancel_work_sync(&msi_rfkill_work);
 		rfkill_cleanup();
 	}
 fail_scm_model_init:
@@ -1135,7 +1127,6 @@ static void __exit msi_cleanup(void)
 		i8042_remove_filter(msi_laptop_i8042_filter);
 		input_unregister_device(msi_laptop_input_dev);
 		cancel_delayed_work_sync(&msi_rfkill_dwork);
-		cancel_work_sync(&msi_rfkill_work);
 		rfkill_cleanup();
 	}
 
-- 
2.37.2

