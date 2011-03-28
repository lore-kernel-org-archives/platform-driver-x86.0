From: Seth Forshee <seth.forshee-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: [PATCH v3 2/3] eeepc-wmi: Add support for T101MT
	Home/Express Gate key
Date: Mon, 28 Mar 2011 13:33:43 -0500
Message-ID: <1301337224-3293-3-git-send-email-seth.forshee@canonical.com>
References: <AANLkTi=U2Qkqv7FKfe18f0a=8Xg0QwRX_cxFj-j7ZPC=@mail.gmail.com>
	<1301337224-3293-1-git-send-email-seth.forshee@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <acpi4asus-user-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <1301337224-3293-1-git-send-email-seth.forshee-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/acpi4asus-user>,
	<mailto:acpi4asus-user-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=acpi4asus-user>
List-Post: <mailto:acpi4asus-user-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:acpi4asus-user-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/acpi4asus-user>,
	<mailto:acpi4asus-user-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: acpi4asus-user-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Corentin Chary <corentin.chary-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: acpi4asus-user-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chris Bagwell <chris-ZCD0YumhXB+iMFqZbmIluw@public.gmane.org>, Matthew Garrett <mjg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

This key is different than other hotkeys, having seperate scan
codes for press, release, and hold, so it requires some special
filtering. Press and release events are passed on, and hold events
are ignored since sparse-keymap does not support hardware
autorepeat.

Note that "Home" in the context of this button doesn't mean the
same thing as the usual Home key, and it really isn't clear at
all what is meant by "Home". The manufacurer's description of the
button indicates that it should launch some sort of touch screen
settings interface on short press and apply a desktop rotation on
long press.

Signed-off-by: Seth Forshee <seth.forshee-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
---
 drivers/platform/x86/eeepc-wmi.c |   26 ++++++++++++++++++++++++++
 1 files changed, 26 insertions(+), 0 deletions(-)

diff --git a/drivers/platform/x86/eeepc-wmi.c b/drivers/platform/x86/eeepc-wmi.c
index 0ddc434..8f3112d5 100644
--- a/drivers/platform/x86/eeepc-wmi.c
+++ b/drivers/platform/x86/eeepc-wmi.c
@@ -56,6 +56,11 @@ MODULE_PARM_DESC(hotplug_wireless,
 		 "If your laptop needs that, please report to "
 		 "acpi4asus-user-5NWGOfrQmneRv+LV9MX5uti2KpX7p8Fi@public.gmane.org");
 
+/* Values for T101MT "Home" key */
+#define HOME_PRESS	0xe4
+#define HOME_HOLD	0xea
+#define HOME_RELEASE	0xe5
+
 static const struct key_entry eeepc_wmi_keymap[] = {
 	/* Sleep already handled via generic ACPI code */
 	{ KE_KEY, 0x30, { KEY_VOLUMEUP } },
@@ -70,6 +75,7 @@ static const struct key_entry eeepc_wmi_keymap[] = {
 	{ KE_KEY, 0xcc, { KEY_SWITCHVIDEOMODE } },
 	{ KE_KEY, 0xe0, { KEY_PROG1 } }, /* Task Manager */
 	{ KE_KEY, 0xe1, { KEY_F14 } }, /* Change Resolution */
+	{ KE_KEY, HOME_PRESS, { KEY_CONFIG } },
 	{ KE_KEY, 0xe9, { KEY_BRIGHTNESS_ZERO } },
 	{ KE_KEY, 0xeb, { KEY_CAMERA_ZOOMOUT } },
 	{ KE_KEY, 0xec, { KEY_CAMERA_UP } },
@@ -79,6 +85,25 @@ static const struct key_entry eeepc_wmi_keymap[] = {
 	{ KE_END, 0},
 };
 
+static void eeepc_wmi_key_filter(struct asus_wmi_driver *asus_wmi, int *code,
+				 unsigned int *value, bool *autorelease)
+{
+	switch (*code) {
+	case HOME_PRESS:
+		*value = 1;
+		*autorelease = 0;
+		break;
+	case HOME_HOLD:
+		*code = ASUS_WMI_KEY_IGNORE;
+		break;
+	case HOME_RELEASE:
+		*code = HOME_PRESS;
+		*value = 0;
+		*autorelease = 0;
+		break;
+	}
+}
+
 static acpi_status eeepc_wmi_parse_device(acpi_handle handle, u32 level,
 						 void *context, void **retval)
 {
@@ -149,6 +174,7 @@ static struct asus_wmi_driver asus_wmi_driver = {
 	.keymap = eeepc_wmi_keymap,
 	.input_name = "Eee PC WMI hotkeys",
 	.input_phys = EEEPC_WMI_FILE "/input0",
+	.key_filter = eeepc_wmi_key_filter,
 	.probe = eeepc_wmi_probe,
 	.quirks = eeepc_wmi_quirks,
 };
-- 
1.7.4.1


------------------------------------------------------------------------------
Create and publish websites with WebMatrix
Use the most popular FREE web apps or write code yourself; 
WebMatrix provides all the features you need to develop and publish 
your website. http://p.sf.net/sfu/ms-webmatrix-sf
