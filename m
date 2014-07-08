From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v2 2/2] asus-wmi: backlight_init: Stop treating -ENODEV as if its not an error
Date: Tue,  8 Jul 2014 10:47:22 +0200
Message-ID: <1404809242-8575-3-git-send-email-hdegoede@redhat.com>
References: <1404809242-8575-1-git-send-email-hdegoede@redhat.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:51702 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751931AbaGHIrj (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 8 Jul 2014 04:47:39 -0400
In-Reply-To: <1404809242-8575-1-git-send-email-hdegoede@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <matthew.garrett@nebula.com>, Corentin Chary <corentin.chary@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, Hans de Goede <hdegoede@redhat.com>

When bl_power support got added to asus-wmi, the error handling for it was
written to ignore -ENODEV, to avoid not registering a backlight interface for
models which have no bl_power control, but do have brightness control.

At the same time the error handling for brightness_max was modified to do the
same, this is wrong, when there is no brightness_max asus-wmi should not
register a backlight interface.

Note the caller of asus_wmi_backlight_init already special cases -ENODEV,
and will not cause the wmi driver regristration to fail because of a
-ENODEV return from asus_wmi_backlight_init.

https://bugzilla.redhat.com/show_bug.cgi?id=1097436

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/asus-wmi.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 70aec19..8a88416 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -1271,10 +1271,7 @@ static int asus_wmi_backlight_init(struct asus_wmi *asus)
 	int power;
 
 	max = read_brightness_max(asus);
-
-	if (max == -ENODEV)
-		max = 0;
-	else if (max < 0)
+	if (max < 0)
 		return max;
 
 	power = read_backlight_power(asus);
-- 
2.0.0
