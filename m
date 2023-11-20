Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2A65C197A0
	for <platform-driver-x86@archiver.kernel.org>; Mon, 20 Nov 2023 15:42:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233928AbjKTPm7 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 20 Nov 2023 10:42:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234004AbjKTPm6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 Nov 2023 10:42:58 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45560B4
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Nov 2023 07:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1700494973;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=SIpRIOi+45Rlf0KHkxuPCkMk3yeT8+xSmGx51WatUr4=;
        b=T76GWkD7U9CYksLSXKLW+jbuI13gGrnvkUXSBnadz7v0Y8Sm6SMAJpuj7zR0tA/RfXay/S
        0cX/zzkdvpj1dML7bgvRIMj29VXkHH77Pq0XCf807kW/Rf1C8B3gAw1pCeQs29HD9oyOyH
        6ATw13xLZOhDYe3JXEd2DZ94tnpbdEw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-524-v4786KTjM6GUhyUq6V7l2Q-1; Mon, 20 Nov 2023 10:42:49 -0500
X-MC-Unique: v4786KTjM6GUhyUq6V7l2Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CCC3E85A58A;
        Mon, 20 Nov 2023 15:42:48 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.193.19])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 3D4AB10F45;
        Mon, 20 Nov 2023 15:42:47 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Corentin Chary <corentin.chary@gmail.com>,
        "Luke D . Jones" <luke@ljones.dev>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Kai Heng Feng <kai.heng.feng@canonical.com>,
        acpi4asus-user@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 2/3] platform/x86: asus-wmi: Change q500a_i8042_filter() into a generic i8042-filter
Date:   Mon, 20 Nov 2023 16:42:34 +0100
Message-ID: <20231120154235.610808-3-hdegoede@redhat.com>
In-Reply-To: <20231120154235.610808-1-hdegoede@redhat.com>
References: <20231120154235.610808-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Change asus_q500a_i8042_filter() into a generic i8042-filter,
using a new filter_i8042_e1_extended_codes flag in the quirks struct
to decide if e1 extended codes should be filtered out or not.

This is a preparation patch for adding support for filtering volume key
events being reported twice through both the PS/2 keyboard and asus-wmi.

Note while modifying the code also drop the unnecessary unlikely()
annotations, this is not in a hot path so those are not necessary.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/asus-nb-wmi.c | 27 +++++++++++++++------------
 drivers/platform/x86/asus-wmi.c    |  8 ++++----
 drivers/platform/x86/asus-wmi.h    |  7 ++++---
 3 files changed, 23 insertions(+), 19 deletions(-)

diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
index ff794387581d..16241556f6fb 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -49,24 +49,26 @@ MODULE_PARM_DESC(tablet_mode_sw, "Tablet mode detect: -1:auto 0:disable 1:kbd-do
 
 static struct quirk_entry *quirks;
 
-static bool asus_q500a_i8042_filter(unsigned char data, unsigned char str,
-			      struct serio *port)
+static bool asus_i8042_filter(unsigned char data, unsigned char str, struct serio *port)
 {
-	static bool extended;
-	bool ret = false;
+	static bool extended_e1;
 
 	if (str & I8042_STR_AUXDATA)
 		return false;
 
-	if (unlikely(data == 0xe1)) {
-		extended = true;
-		ret = true;
-	} else if (unlikely(extended)) {
-		extended = false;
-		ret = true;
+	if (quirks->filter_i8042_e1_extended_codes) {
+		if (data == 0xe1) {
+			extended_e1 = true;
+			return true;
+		}
+
+		if (extended_e1) {
+			extended_e1 = false;
+			return true;
+		}
 	}
 
-	return ret;
+	return false;
 }
 
 static struct quirk_entry quirk_asus_unknown = {
@@ -75,7 +77,7 @@ static struct quirk_entry quirk_asus_unknown = {
 };
 
 static struct quirk_entry quirk_asus_q500a = {
-	.i8042_filter = asus_q500a_i8042_filter,
+	.filter_i8042_e1_extended_codes = true,
 	.wmi_backlight_set_devstate = true,
 };
 
@@ -619,6 +621,7 @@ static struct asus_wmi_driver asus_nb_wmi_driver = {
 	.input_phys = ASUS_NB_WMI_FILE "/input0",
 	.detect_quirks = asus_nb_wmi_quirks,
 	.key_filter = asus_nb_wmi_key_filter,
+	.i8042_filter = asus_i8042_filter,
 };
 
 
diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 53e25cb467d7..ca668cf04020 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -4567,8 +4567,8 @@ static int asus_wmi_add(struct platform_device *pdev)
 		goto fail_wmi_handler;
 	}
 
-	if (asus->driver->quirks->i8042_filter) {
-		err = i8042_install_filter(asus->driver->quirks->i8042_filter);
+	if (asus->driver->i8042_filter) {
+		err = i8042_install_filter(asus->driver->i8042_filter);
 		if (err)
 			pr_warn("Unable to install key filter - %d\n", err);
 	}
@@ -4609,8 +4609,8 @@ static int asus_wmi_remove(struct platform_device *device)
 	struct asus_wmi *asus;
 
 	asus = platform_get_drvdata(device);
-	if (asus->driver->quirks->i8042_filter)
-		i8042_remove_filter(asus->driver->quirks->i8042_filter);
+	if (asus->driver->i8042_filter)
+		i8042_remove_filter(asus->driver->i8042_filter);
 	wmi_remove_notify_handler(asus->driver->event_guid);
 	asus_wmi_backlight_exit(asus);
 	asus_screenpad_exit(asus);
diff --git a/drivers/platform/x86/asus-wmi.h b/drivers/platform/x86/asus-wmi.h
index adb67c925724..cc30f1853847 100644
--- a/drivers/platform/x86/asus-wmi.h
+++ b/drivers/platform/x86/asus-wmi.h
@@ -39,6 +39,7 @@ struct quirk_entry {
 	bool wmi_backlight_set_devstate;
 	bool wmi_force_als_set;
 	bool wmi_ignore_fan;
+	bool filter_i8042_e1_extended_codes;
 	enum asus_wmi_tablet_switch_mode tablet_switch_mode;
 	int wapf;
 	/*
@@ -49,9 +50,6 @@ struct quirk_entry {
 	 */
 	int no_display_toggle;
 	u32 xusb2pr;
-
-	bool (*i8042_filter)(unsigned char data, unsigned char str,
-			     struct serio *serio);
 };
 
 struct asus_wmi_driver {
@@ -73,6 +71,9 @@ struct asus_wmi_driver {
 	 * Return ASUS_WMI_KEY_IGNORE in code if event should be ignored. */
 	void (*key_filter) (struct asus_wmi_driver *driver, int *code,
 			    unsigned int *value, bool *autorelease);
+	/* Optional standard i8042 filter */
+	bool (*i8042_filter)(unsigned char data, unsigned char str,
+			     struct serio *serio);
 
 	int (*probe) (struct platform_device *device);
 	void (*detect_quirks) (struct asus_wmi_driver *driver);
-- 
2.41.0

