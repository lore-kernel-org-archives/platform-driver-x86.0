From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH] WMI: properly cleanup devices to avoid crashes
Date: Wed, 7 Sep 2011 15:00:02 -0700
Message-ID: <20110907220002.GB7104@core.coreip.homeip.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-yx0-f174.google.com ([209.85.213.174]:34770 "EHLO
	mail-yx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757294Ab1IGWAI (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 7 Sep 2011 18:00:08 -0400
Received: by yxj19 with SMTP id 19so111271yxj.19
        for <platform-driver-x86@vger.kernel.org>; Wed, 07 Sep 2011 15:00:07 -0700 (PDT)
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: Carlos Corbacho <carlos@strangeworlds.co.uk>, Colin Ian King <colin.king@canonical.com>, platform-driver-x86@vger.kernel.org

We need to remove devices that we destroy from the list, otherwise
we'll crash if there are more than one "_WDG" methods in DSDT.

This fixes https://bugzilla.kernel.org/show_bug.cgi?id=32052

Tested-by: Ilya Tumaykin <librarian_rus@yahoo.com>
Cc: stable@kernel.org
Signed-off-by: Dmitry Torokhov <dtor@mail.ru>
---

 drivers/platform/x86/wmi.c |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)


diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index f23d5a8..9b88be4 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -754,9 +754,13 @@ static void wmi_free_devices(void)
 	struct wmi_block *wblock, *next;
 
 	/* Delete devices for all the GUIDs */
-	list_for_each_entry_safe(wblock, next, &wmi_block_list, list)
+	list_for_each_entry_safe(wblock, next, &wmi_block_list, list) {
+		list_del(&wblock->list);
 		if (wblock->dev.class)
 			device_unregister(&wblock->dev);
+		else
+			kfree(wblock);
+	}
 }
 
 static bool guid_already_parsed(const char *guid_string)
