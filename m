From: Keng-Yu Lin <kengyu@canonical.com>
Subject: [PATCH] asus-wmi: explicitly set the wireless LED
Date: Wed,  7 Dec 2011 16:02:02 +0800
Message-ID: <1323244922-2673-1-git-send-email-kengyu@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:43761 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751607Ab1LGICU (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 7 Dec 2011 03:02:20 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentincj@iksaif.net>, Matthew Garrett <mjg@redhat.com>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Keng-Yu Lin <kengyu@canonical.com>

On Asus K54C, the wireless LED is always off without setting explicitly.

Signed-off-by: Keng-Yu Lin <kengyu@canonical.com>
---
 drivers/platform/x86/asus-wmi.c |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index d1049ee..db514c4 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -726,6 +726,9 @@ static int asus_rfkill_set(void *data, bool blocked)
 	struct asus_rfkill *priv = data;
 	u32 ctrl_param = !blocked;
 
+	if (priv->dev_id == ASUS_WMI_DEVID_WLAN)
+		asus_wmi_set_devstate(ASUS_WMI_DEVID_WIRELESS_LED, ctrl_param, NULL);
+
 	return asus_wmi_set_devstate(priv->dev_id, ctrl_param, NULL);
 }
 
-- 
1.7.5.4
