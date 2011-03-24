From: Seth Forshee <seth.forshee-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: [PATCH 2/2] eeepc-wmi: Add support for T101MT
	Home/Express Gate key
Date: Thu, 24 Mar 2011 15:03:55 -0500
Message-ID: <1300997035-14104-2-git-send-email-seth.forshee@canonical.com>
References: <20110324195720.GB31713@thinkpad-t410>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <acpi4asus-user-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <20110324195720.GB31713@thinkpad-t410>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/acpi4asus-user>,
	<mailto:acpi4asus-user-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=acpi4asus-user>
List-Post: <mailto:acpi4asus-user-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:acpi4asus-user-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/acpi4asus-user>,
	<mailto:acpi4asus-user-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: acpi4asus-user-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Corentin Chary <corentin.chary-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chris Bagwell <chris-ZCD0YumhXB+iMFqZbmIluw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, acpi4asus-user-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, Matthew Garrett <mjg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

This key is different than other hotkeys, having seperate scan
codes for press, release, and hold, so it requires some special
handling.

Note that "Home" in the context of this button doesn't mean the
same thing as the usual Home key, and it really isn't clear at
all what is meant by "Home". The manufacurer's description of the
button indicates that it should launch some sort of touch screen
settings interface on short press and apply a desktop rotation on
long press.

Signed-off-by: Seth Forshee <seth.forshee-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
---
 drivers/platform/x86/eeepc-wmi.c |   87 +++++++++++++++++++++++++++++++++-----
 1 files changed, 76 insertions(+), 11 deletions(-)

diff --git a/drivers/platform/x86/eeepc-wmi.c b/drivers/platform/x86/eeepc-wmi.c
index 0ddc434..f9b0ee4 100644
--- a/drivers/platform/x86/eeepc-wmi.c
+++ b/drivers/platform/x86/eeepc-wmi.c
@@ -56,6 +56,19 @@ MODULE_PARM_DESC(hotplug_wireless,
 		 "If your laptop needs that, please report to "
 		 "acpi4asus-user-5NWGOfrQmneRv+LV9MX5uti2KpX7p8Fi@public.gmane.org");
 
+struct eeepc_wmi_driver {
+	struct asus_wmi_driver	asus_wmi_driver;
+	int			home_key_state;
+};
+
+#define to_eeepc_wmi_driver(asus_drv) \
+	container_of((asus_drv), struct eeepc_wmi_driver, asus_wmi_driver)
+
+/* Values for T101MT "Home" key */
+#define HOME_PRESS	0xe4
+#define HOME_HOLD	0xea
+#define HOME_RELEASE	0xe5
+
 static const struct key_entry eeepc_wmi_keymap[] = {
 	/* Sleep already handled via generic ACPI code */
 	{ KE_KEY, 0x30, { KEY_VOLUMEUP } },
@@ -70,7 +83,9 @@ static const struct key_entry eeepc_wmi_keymap[] = {
 	{ KE_KEY, 0xcc, { KEY_SWITCHVIDEOMODE } },
 	{ KE_KEY, 0xe0, { KEY_PROG1 } }, /* Task Manager */
 	{ KE_KEY, 0xe1, { KEY_F14 } }, /* Change Resolution */
+	{ KE_KEY, HOME_PRESS, { BTN_TASK } },
 	{ KE_KEY, 0xe9, { KEY_BRIGHTNESS_ZERO } },
+	{ KE_KEY, HOME_HOLD, { KEY_PROG2 } },
 	{ KE_KEY, 0xeb, { KEY_CAMERA_ZOOMOUT } },
 	{ KE_KEY, 0xec, { KEY_CAMERA_UP } },
 	{ KE_KEY, 0xed, { KEY_CAMERA_DOWN } },
@@ -79,6 +94,52 @@ static const struct key_entry eeepc_wmi_keymap[] = {
 	{ KE_END, 0},
 };
 
+static void eeepc_wmi_key_filter(struct asus_wmi_driver *asus_wmi, int *code,
+				 int *value, int *autorelease)
+{
+	struct eeepc_wmi_driver *eeepc = to_eeepc_wmi_driver(asus_wmi);
+	int is_press;
+
+	/*
+	 * The following behavior is used for T101MT "Home" key:
+	 * 
+	 *   On press:   No event set
+	 *   On hold:    KEY_PROG2 press sent once w/o autorelease
+	 *   On release: If key was held, KEY_PROG2 release sent.
+	 *               Otherwise KEY_HOME press sent w/ autorelease.
+	 *
+	 * The simple state machine below implements this behavior.
+	 */
+	switch (*code) {
+	case HOME_PRESS:
+		eeepc->home_key_state = HOME_PRESS;
+		*code = ASUS_WMI_KEY_IGNORE;
+		break;
+	case HOME_HOLD:
+		if (eeepc->home_key_state == HOME_HOLD) {
+			*code = ASUS_WMI_KEY_IGNORE;
+		} else {
+			eeepc->home_key_state = HOME_HOLD;
+			*value = 1;
+			*autorelease = 0;
+		}
+		break;
+	case HOME_RELEASE:
+		if (eeepc->home_key_state == HOME_RELEASE) {
+			dev_warn(&asus_wmi->platform_device->dev,
+				 "Unexpected home key release event\n");
+			*code = ASUS_WMI_KEY_IGNORE;
+		} else {
+			*code = eeepc->home_key_state;
+			eeepc->home_key_state = HOME_RELEASE;
+			is_press = (*code == HOME_PRESS);
+			*value = is_press;
+			*autorelease = is_press;
+		}
+		break;
+	}
+}
+
 static acpi_status eeepc_wmi_parse_device(acpi_handle handle, u32 level,
 						 void *context, void **retval)
 {
@@ -142,26 +203,30 @@ static void eeepc_wmi_quirks(struct asus_wmi_driver *driver)
 	eeepc_dmi_check(driver);
 }
 
-static struct asus_wmi_driver asus_wmi_driver = {
-	.name = EEEPC_WMI_FILE,
-	.owner = THIS_MODULE,
-	.event_guid = EEEPC_WMI_EVENT_GUID,
-	.keymap = eeepc_wmi_keymap,
-	.input_name = "Eee PC WMI hotkeys",
-	.input_phys = EEEPC_WMI_FILE "/input0",
-	.probe = eeepc_wmi_probe,
-	.quirks = eeepc_wmi_quirks,
+static struct eeepc_wmi_driver eeepc_wmi_driver = {
+	.asus_wmi_driver = {
+		.name = EEEPC_WMI_FILE,
+		.owner = THIS_MODULE,
+		.event_guid = EEEPC_WMI_EVENT_GUID,
+		.keymap = eeepc_wmi_keymap,
+		.input_name = "Eee PC WMI hotkeys",
+		.input_phys = EEEPC_WMI_FILE "/input0",
+		.key_filter = eeepc_wmi_key_filter,
+		.probe = eeepc_wmi_probe,
+		.quirks = eeepc_wmi_quirks,
+	},
+	.home_key_state = HOME_RELEASE,
 };
 
 
 static int __init eeepc_wmi_init(void)
 {
-	return asus_wmi_register_driver(&asus_wmi_driver);
+	return asus_wmi_register_driver(&eeepc_wmi_driver.asus_wmi_driver);
 }
 
 static void __exit eeepc_wmi_exit(void)
 {
-	asus_wmi_unregister_driver(&asus_wmi_driver);
+	asus_wmi_unregister_driver(&eeepc_wmi_driver.asus_wmi_driver);
 }
 
 module_init(eeepc_wmi_init);
-- 
1.7.4.1


------------------------------------------------------------------------------
Enable your software for Intel(R) Active Management Technology to meet the
growing manageability and security demands of your customers. Businesses
are taking advantage of Intel(R) vPro (TM) technology - will your software 
be a part of the solution? Download the Intel(R) Manageability Checker 
today! http://p.sf.net/sfu/intel-dev2devmar
