From: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] Lenovo IdeaPAD ACPI driver
Date: Thu, 12 Aug 2010 10:42:31 +0100
Message-ID: <1281606151.12475.57.camel@localhost>
References: <1281480758.5887.33.camel@localhost>
	 <AANLkTin=Dwbe3gPDGd89Oc25mfOVVvc2_goP77sSVNeo@mail.gmail.com>
	 <1281533999.3236.8.camel@localhost>
	 <AANLkTinBqq+0rDE8DM0wz-FvUQqzH2Rf0F=YJgqVLHqM@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:35577 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759218Ab0HLJmg (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 12 Aug 2010 05:42:36 -0400
In-Reply-To: <AANLkTinBqq+0rDE8DM0wz-FvUQqzH2Rf0F=YJgqVLHqM@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentin.chary@gmail.com>
Cc: mjg59@srcf.ucam.org, platform-driver-x86@vger.kernel.org

On Wed, 2010-08-11 at 15:51 +0200, Corentin Chary wrote:
> And you should probably make it a platform driver (being the parent of
> acpi, wmi, input, backlight, rfkill, etc..).
> 
> Is there a lot of thing hidden in ACPI / WMI on these models (like
> hotkeys, backlight, light sensors)  ?

I hooked up something (below) to dump the AE or IO WMI blocks each time
we get a notification on the VPC2004 device. Although the notification
happens when we press a key, nothing ever changes in either of them.

I *did* notice that we're actually getting proper keycodes for the
hotkeys though, so for now I've lost what little interest I already had
in doing anything with WMI. If anyone (Florian?) wants to do more, I'd
be happy to do some testing.

As I said, my main reason for looking at this was to implement the
rkfill support, without which some people can't get the wireless working
on these devices at all (without booting to Windows to unblock it). And
that much is working in git://git.infradead.org/~dwmw2/ideapad-2.6.git

diff --git a/drivers/platform/x86/ideapad-wmi.c b/drivers/platform/x86/ideapad-wmi.c
index 53046d1..5bdbd9c 100644
--- a/drivers/platform/x86/ideapad-wmi.c
+++ b/drivers/platform/x86/ideapad-wmi.c
@@ -28,6 +28,10 @@
 #include <acpi/acpi_drivers.h>
 #include <linux/rfkill.h>
 
+#define IDEAPAD_EVENT_GUID	"ABBC0F20-8EA1-11D1-00A0-C90629100000"
+#define IDEAPAD_IO_GUID		"ABBC0F40-8EA1-11D1-00A0-C90629100000"
+#define IDEAPAD_AE_GUID		"05901221-D566-11D1-B2F0-00A0C9062910"
+
 #define IDEAPAD_DEV_CAMERA	0
 #define IDEAPAD_DEV_WLAN	1
 #define IDEAPAD_DEV_BLUETOOTH	2
@@ -268,9 +272,44 @@ static int ideapad_acpi_remove(struct acpi_device *adevice, int type)
 	return 0;
 }
 
+static int oldlen;
+static unsigned char oldresponse[4096];
+
 static void ideapad_acpi_notify(struct acpi_device *adevice, u32 event)
 {
+	struct acpi_buffer response = { ACPI_ALLOCATE_BUFFER, NULL };
+	union acpi_object *obj;
+	acpi_status status;
+
 	ideapad_sync_rfk_state(adevice);
+
+	status = wmi_query_block(IDEAPAD_AE_GUID, 1, &response);
+	if (ACPI_FAILURE(status))
+		return;
+
+	obj = response.pointer;
+	if (obj && obj->type == ACPI_TYPE_BUFFER) {
+		int i;
+#if 1
+		for (i=0 ; i<obj->buffer.length; i++) {
+			if (!(i&0xf)) {
+				if (i)
+					printk("\n");
+				printk(KERN_INFO "%04x:", i);
+			}
+			printk(" %02x", ((unsigned char *)obj->buffer.pointer)[i]);
+		}
+		printk("\n");
+#endif
+		for (i=0 ; i < obj->buffer.length && i < oldlen; i++) {
+			if (oldresponse[i] != obj->buffer.pointer[i])
+				printk(KERN_INFO "Byte %04x: %02x->%02x\n",
+				       i, oldresponse[i], obj->buffer.pointer[i]);
+		}
+		oldlen = min(sizeof(oldresponse), obj->buffer.length);
+		memcpy(oldresponse, obj->buffer.pointer, oldlen);
+	}
+	kfree(obj);
 }
 
 static struct acpi_driver ideapad_acpi_driver = {


-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
