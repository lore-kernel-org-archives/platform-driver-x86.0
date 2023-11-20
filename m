Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35ED2C5AD4C
	for <platform-driver-x86@archiver.kernel.org>; Mon, 20 Nov 2023 15:42:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232186AbjKTPm7 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 20 Nov 2023 10:42:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234174AbjKTPm6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 Nov 2023 10:42:58 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B35F7A7
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Nov 2023 07:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1700494974;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Jsgm5ps5x7tKOZ1oQcj5XpQmYvGY7oMZgxKw75gYUeY=;
        b=FaHXbwku5Qnjtc7bqJ1HfhTuRmANs/kVpsRb5uA0V0tggkncQxcMpTCVj+b7T3harknT1I
        UjZdsQieMXZ79Sd0dwbmayjk+oaLPj95OW024d8L9UYa+sTp/rMznIMx2tE8X0YF9nkOrv
        wENefz1ULwauJe0vLOF4NL4znQYEjuU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-357-JAmfRkPuOEGCLEAgaLmkPQ-1; Mon, 20 Nov 2023 10:42:47 -0500
X-MC-Unique: JAmfRkPuOEGCLEAgaLmkPQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0AEB1811E7E;
        Mon, 20 Nov 2023 15:42:47 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.193.19])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 8D3D210F44;
        Mon, 20 Nov 2023 15:42:45 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Corentin Chary <corentin.chary@gmail.com>,
        "Luke D . Jones" <luke@ljones.dev>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Kai Heng Feng <kai.heng.feng@canonical.com>,
        acpi4asus-user@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org,
        Oleksij Rempel <linux@rempel-privat.de>
Subject: [PATCH 1/3] platform/x86: asus-wmi: Move i8042 filter install to shared asus-wmi code
Date:   Mon, 20 Nov 2023 16:42:33 +0100
Message-ID: <20231120154235.610808-2-hdegoede@redhat.com>
In-Reply-To: <20231120154235.610808-1-hdegoede@redhat.com>
References: <20231120154235.610808-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

asus-nb-wmi calls i8042_install_filter() in some cases, but it never
calls i8042_remove_filter(). This means that a dangling pointer to
the filter function is left after rmmod leading to crashes.

Fix this by moving the i8042-filter installation to the shared
asus-wmi code and also remove it from the shared code on driver unbind.

Fixes: b5643539b825 ("platform/x86: asus-wmi: Filter buggy scan codes on ASUS Q500A")
Cc: Oleksij Rempel <linux@rempel-privat.de>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/Kconfig       |  2 +-
 drivers/platform/x86/asus-nb-wmi.c | 11 -----------
 drivers/platform/x86/asus-wmi.c    |  8 ++++++++
 3 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 7e69fdaccdd5..c94f31a5c6a3 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -263,6 +263,7 @@ config ASUS_WMI
 	depends on RFKILL || RFKILL = n
 	depends on HOTPLUG_PCI
 	depends on ACPI_VIDEO || ACPI_VIDEO = n
+	depends on SERIO_I8042 || SERIO_I8042 = n
 	select INPUT_SPARSEKMAP
 	select LEDS_CLASS
 	select NEW_LEDS
@@ -279,7 +280,6 @@ config ASUS_WMI
 config ASUS_NB_WMI
 	tristate "Asus Notebook WMI Driver"
 	depends on ASUS_WMI
-	depends on SERIO_I8042 || SERIO_I8042 = n
 	help
 	  This is a driver for newer Asus notebooks. It adds extra features
 	  like wireless radio and bluetooth control, leds, hotkeys, backlight...
diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
index 9aa1226e74e6..ff794387581d 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -503,8 +503,6 @@ static const struct dmi_system_id asus_quirks[] = {
 
 static void asus_nb_wmi_quirks(struct asus_wmi_driver *driver)
 {
-	int ret;
-
 	quirks = &quirk_asus_unknown;
 	dmi_check_system(asus_quirks);
 
@@ -519,15 +517,6 @@ static void asus_nb_wmi_quirks(struct asus_wmi_driver *driver)
 
 	if (tablet_mode_sw != -1)
 		quirks->tablet_switch_mode = tablet_mode_sw;
-
-	if (quirks->i8042_filter) {
-		ret = i8042_install_filter(quirks->i8042_filter);
-		if (ret) {
-			pr_warn("Unable to install key filter\n");
-			return;
-		}
-		pr_info("Using i8042 filter function for receiving events\n");
-	}
 }
 
 static const struct key_entry asus_nb_wmi_keymap[] = {
diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 6a79f16233ab..53e25cb467d7 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -4567,6 +4567,12 @@ static int asus_wmi_add(struct platform_device *pdev)
 		goto fail_wmi_handler;
 	}
 
+	if (asus->driver->quirks->i8042_filter) {
+		err = i8042_install_filter(asus->driver->quirks->i8042_filter);
+		if (err)
+			pr_warn("Unable to install key filter - %d\n", err);
+	}
+
 	asus_wmi_battery_init(asus);
 
 	asus_wmi_debugfs_init(asus);
@@ -4603,6 +4609,8 @@ static int asus_wmi_remove(struct platform_device *device)
 	struct asus_wmi *asus;
 
 	asus = platform_get_drvdata(device);
+	if (asus->driver->quirks->i8042_filter)
+		i8042_remove_filter(asus->driver->quirks->i8042_filter);
 	wmi_remove_notify_handler(asus->driver->event_guid);
 	asus_wmi_backlight_exit(asus);
 	asus_screenpad_exit(asus);
-- 
2.41.0

