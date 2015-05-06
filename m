From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH v3 3/5] toshiba_acpi: Comments cleanup
Date: Wed,  6 May 2015 09:35:11 -0600
Message-ID: <1430926513-6264-4-git-send-email-coproscefalo@gmail.com>
References: <1430926513-6264-1-git-send-email-coproscefalo@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=yes
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1430926513-6264-1-git-send-email-coproscefalo@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

This patch simply does some misc cleanup to comments, mainly
capitalizes some left over comments from a previous clean up and
adds some comments at the beginning of some feature function calls,
as well as some misc changes to some comments.

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 drivers/platform/x86/toshiba_acpi.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86=
/toshiba_acpi.c
index 19efb05..8a9dacc 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -81,7 +81,7 @@ MODULE_LICENSE("GPL");
=20
 #define TCI_WORDS			6
=20
-/* operations */
+/* Operations */
 #define HCI_SET				0xff00
 #define HCI_GET				0xfe00
 #define SCI_OPEN			0xf100
@@ -89,7 +89,7 @@ MODULE_LICENSE("GPL");
 #define SCI_GET				0xf300
 #define SCI_SET				0xf400
=20
-/* return codes */
+/* Return codes */
 #define TOS_SUCCESS			0x0000
 #define TOS_OPEN_CLOSE_OK		0x0044
 #define TOS_FAILURE			0x1000
@@ -104,7 +104,7 @@ MODULE_LICENSE("GPL");
 #define TOS_NOT_INITIALIZED		0x8d50
 #define TOS_NOT_INSTALLED		0x8e00
=20
-/* registers */
+/* Registers */
 #define HCI_FAN				0x0004
 #define HCI_TR_BACKLIGHT		0x0005
 #define HCI_SYSTEM_EVENT		0x0016
@@ -126,7 +126,7 @@ MODULE_LICENSE("GPL");
 #define SCI_TOUCHPAD			0x050e
 #define SCI_KBD_FUNCTION_KEYS		0x0522
=20
-/* field definitions */
+/* Field definitions */
 #define HCI_ACCEL_MASK			0x7fff
 #define HCI_HOTKEY_DISABLE		0x0b
 #define HCI_HOTKEY_ENABLE		0x09
@@ -493,7 +493,7 @@ static enum led_brightness toshiba_illumination_get=
(struct led_classdev *cdev)
 			struct toshiba_acpi_dev, led_dev);
 	u32 state, result;
=20
-	/*=C2=A0First request : initialize communication. */
+	/* First request : initialize communication. */
 	if (!sci_open(dev))
 		return LED_OFF;
=20
@@ -1183,6 +1183,7 @@ static int toshiba_hotkey_event_type_get(struct t=
oshiba_acpi_dev *dev,
 	return 0;
 }
=20
+/* Transflective Backlight */
 static int get_tr_backlight_status(struct toshiba_acpi_dev *dev, bool =
*enabled)
 {
 	u32 hci_result;
@@ -1202,8 +1203,9 @@ static int set_tr_backlight_status(struct toshiba=
_acpi_dev *dev, bool enable)
 	return hci_result =3D=3D TOS_SUCCESS ? 0 : -EIO;
 }
=20
-static struct proc_dir_entry *toshiba_proc_dir /*=3D 0*/;
+static struct proc_dir_entry *toshiba_proc_dir;
=20
+/* LCD Brightness */
 static int __get_lcd_brightness(struct toshiba_acpi_dev *dev)
 {
 	u32 hci_result;
@@ -1411,7 +1413,8 @@ static ssize_t video_proc_write(struct file *file=
, const char __user *buf,
 			_set_bit(&new_video_out, HCI_VIDEO_OUT_TV, tv_out);
 		/*
 		 * To avoid unnecessary video disruption, only write the new
-		 * video setting if something changed. */
+		 * video setting if something changed.
+		 */
 		if (new_video_out !=3D video_out)
 			ret =3D write_acpi_int(METHOD_VIDEO_OUT, new_video_out);
 	}
--=20
2.3.6
