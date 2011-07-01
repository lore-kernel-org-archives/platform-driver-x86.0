From: Corentin Chary <corentin.chary@gmail.com>
Subject: [PATCH 16/16] asus-wmi: add uwb rfkill support
Date: Fri,  1 Jul 2011 11:34:41 +0200
Message-ID: <1309512881-2901-17-git-send-email-corentin.chary@gmail.com>
References: <1309512881-2901-1-git-send-email-corentin.chary@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1309512881-2901-1-git-send-email-corentin.chary@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: Corentin Chary <corentin.chary@gmail.com>, Corentin Chary <corentincj@iksaif.net>, Matthew Garrett <mjg@redhat.com>, "open list:ASUS NOTEBOOKS AN..." <acpi4asus-user@lists.sourceforge.net>, open list <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

Signed-off-by: Corentin Chary <corentin.chary@gmail.com>
---
 drivers/platform/x86/asus-wmi.c |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 83d4d26..1ea6b5b 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -195,6 +195,7 @@ struct asus_wmi {
 	struct asus_rfkill wimax;
 	struct asus_rfkill wwan3g;
 	struct asus_rfkill gps;
+	struct asus_rfkill uwb;
 
 	struct hotplug_slot *hotplug_slot;
 	struct mutex hotplug_lock;
@@ -841,6 +842,11 @@ static void asus_wmi_rfkill_exit(struct asus_wmi *asus)
 		rfkill_destroy(asus->gps.rfkill);
 		asus->gps.rfkill = NULL;
 	}
+	if (asus->uwb.rfkill) {
+		rfkill_unregister(asus->uwb.rfkill);
+		rfkill_destroy(asus->uwb.rfkill);
+		asus->uwb.rfkill = NULL;
+	}
 }
 
 static int asus_wmi_rfkill_init(struct asus_wmi *asus)
@@ -881,6 +887,12 @@ static int asus_wmi_rfkill_init(struct asus_wmi *asus)
 	if (result && result != -ENODEV)
 		goto exit;
 
+	result = asus_new_rfkill(asus, &asus->uwb, "asus-uwb",
+				 RFKILL_TYPE_UWB, ASUS_WMI_DEVID_UWB);
+
+	if (result && result != -ENODEV)
+		goto exit;
+
 	if (!asus->driver->hotplug_wireless)
 		goto exit;
 
@@ -1737,6 +1749,10 @@ static int asus_hotk_restore(struct device *device)
 		bl = !asus_wmi_get_devstate_simple(asus, ASUS_WMI_DEVID_GPS);
 		rfkill_set_sw_state(asus->gps.rfkill, bl);
 	}
+	if (asus->uwb.rfkill) {
+		bl = !asus_wmi_get_devstate_simple(asus, ASUS_WMI_DEVID_UWB);
+		rfkill_set_sw_state(asus->uwb.rfkill, bl);
+	}
 
 	return 0;
 }
-- 
1.7.3.4
