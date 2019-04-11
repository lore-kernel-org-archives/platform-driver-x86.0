From: Yurii Pavlovskyi <yurii.pavlovskyi@gmail.com>
Subject: [PATCH v2 04/11] platform/x86: asus-wmi: Add quirk to force DSTS WMI
 method detection
Date: Thu, 11 Apr 2019 07:42:52 +0200
Message-ID: <78af5288-78f6-cf51-6bc8-b24a4467927f@gmail.com>
References: <a8dd77f3-1e28-6416-5f04-aff44d5bb6d6@gmail.com>
 <d8e0f65c-8c4e-7b60-93bd-3bf90e2da344@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d8e0f65c-8c4e-7b60-93bd-3bf90e2da344@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
Cc: Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Daniel Drake <drake@endlessm.com>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

The DSTS method detection fails, as nothing is returned if method is not
defined in WMNB. As a result the control of keyboard backlight is not
functional for TUF Gaming series laptops (at the time the only
functionality of the driver on this model implemented with WMI methods).

Patch was tested on a newer TUF Gaming FX505GM and older K54C model.

FX505GM:
Method (WMNB, 3, Serialized)
{ ...
    If ((Local0 == 0x53545344))
    {
        ...
        Return (Zero)
    }
    ...
    // No return
}

K54C:
Method (WMNB, 3, Serialized)
{ ...
    If ((Local0 == 0x53545344))
    {
        ...
        Return (0x02)
    }
    ...
    Return (0xFFFFFFFE)
}

The non-existing method ASUS_WMI_METHODID_DSTS=0x53544344 (actually it is
DCTS in little endian ASCII) is selected in asus->dsts.

One way to fix this would be to call both for every known device ID until
some answers - this would increase module load time.

Another option is to check some device that is known to exist on every
model - none known at the time.

Last option, which is implemented, is to check for presence of the
ASUS7000 device in ACPI tree (it is a dummy device), which is the
condition used for loading the vendor driver for this model. This might
not fix every affected model ever produced, but it likely does not
introduce any regressions. The patch introduces a quirk that is enabled
when ASUS7000 is found.

Scope (_SB)
{
    Device (ATK)
    {
        Name (_HID, "ASUS7000")  // _HID: Hardware ID
    }
}

Signed-off-by: Yurii Pavlovskyi <yurii.pavlovskyi@gmail.com>
---
 drivers/platform/x86/asus-nb-wmi.c |  5 +++++
 drivers/platform/x86/asus-wmi.c    | 14 ++++++++++++--
 drivers/platform/x86/asus-wmi.h    |  5 +++++
 3 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
index b6f2ff95c3ed..cc5f0765a8d9 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -28,6 +28,7 @@
 #include <linux/fb.h>
 #include <linux/dmi.h>
 #include <linux/i8042.h>
+#include <linux/acpi.h>
 
 #include "asus-wmi.h"
 
@@ -434,6 +435,10 @@ static void asus_nb_wmi_quirks(struct asus_wmi_driver *driver)
 		}
 		pr_info("Using i8042 filter function for receiving events\n");
 	}
+
+	if (acpi_dev_found("ASUS7000")) {
+		driver->quirks->force_dsts = true;
+	}
 }
 
 static const struct key_entry asus_nb_wmi_keymap[] = {
diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index cfccfc0b8c2f..80f3447734fc 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -1885,11 +1885,21 @@ static int asus_wmi_platform_init(struct asus_wmi *asus)
 	 * Note, on most Eeepc, there is no way to check if a method exist
 	 * or note, while on notebooks, they returns 0xFFFFFFFE on failure,
 	 * but once again, SPEC may probably be used for that kind of things.
+	 *
+	 * Additionally at least TUF Gaming series laptops return 0 for unknown
+	 * methods, so the detection in this way is not possible and method must
+	 * be forced. Likely the presence of ACPI device ASUS7000 indicates
+	 * this.
 	 */
-	if (!asus_wmi_evaluate_method(ASUS_WMI_METHODID_DSTS, 0, 0, NULL))
+	if (asus->driver->quirks->force_dsts) {
+		pr_info("DSTS method forced\n");
+		asus->dsts_id = ASUS_WMI_METHODID_DSTS2;
+	} else if (!asus_wmi_evaluate_method(ASUS_WMI_METHODID_DSTS,
+			0, 0, NULL)) {
 		asus->dsts_id = ASUS_WMI_METHODID_DSTS;
-	else
+	} else {
 		asus->dsts_id = ASUS_WMI_METHODID_DSTS2;
+	}
 
 	/* CWAP allow to define the behavior of the Fn+F2 key,
 	 * this method doesn't seems to be present on Eee PCs */
diff --git a/drivers/platform/x86/asus-wmi.h b/drivers/platform/x86/asus-wmi.h
index 6c1311f4b04d..94056da02fde 100644
--- a/drivers/platform/x86/asus-wmi.h
+++ b/drivers/platform/x86/asus-wmi.h
@@ -54,6 +54,11 @@ struct quirk_entry {
 	 */
 	int no_display_toggle;
 	u32 xusb2pr;
+	/**
+	 * Force DSTS instead of DSCS and skip detection. Useful if WMNB
+	 * returns nothing on unknown method call.
+	 */
+	bool force_dsts;
 
 	bool (*i8042_filter)(unsigned char data, unsigned char str,
 			     struct serio *serio);
-- 
2.17.1
