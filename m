From: Corentin Chary <corentincj-EjuBZuxMvz2sTnJN9+BGXg@public.gmane.org>
Subject: [PATCH 11/14] eeepc-wmi: add camera and card
	reader support
Date: Mon, 24 Jan 2011 17:23:55 +0100
Message-ID: <1295886238-15961-12-git-send-email-corentincj@iksaif.net>
References: <1295886238-15961-1-git-send-email-corentincj@iksaif.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <acpi4asus-user-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <1295886238-15961-1-git-send-email-corentincj-EjuBZuxMvz2sTnJN9+BGXg@public.gmane.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/acpi4asus-user>,
	<mailto:acpi4asus-user-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=acpi4asus-user>
List-Post: <mailto:acpi4asus-user-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:acpi4asus-user-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/acpi4asus-user>,
	<mailto:acpi4asus-user-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: acpi4asus-user-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Matthew Garrett <mjg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: acpi4asus-user-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chris Bagwell <chris-ZCD0YumhXB+iMFqZbmIluw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Randy Dunlap <rdunlap-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

Signed-off-by: Corentin Chary <corentincj-EjuBZuxMvz2sTnJN9+BGXg@public.gmane.org>
---
 Documentation/ABI/testing/sysfs-platform-eeepc-wmi |   14 +++
 drivers/platform/x86/eeepc-wmi.c                   |   89 +++++++++++++++++++-
 2 files changed, 102 insertions(+), 1 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-platform-eeepc-wmi b/Documentation/ABI/testing/sysfs-platform-eeepc-wmi
index e4b5fef..9fc8d33 100644
--- a/Documentation/ABI/testing/sysfs-platform-eeepc-wmi
+++ b/Documentation/ABI/testing/sysfs-platform-eeepc-wmi
@@ -8,3 +8,17 @@ Description:
 		    * 0 -> Super Performance Mode
 		    * 1 -> High Performance Mode
 		    * 2 -> Power Saving Mode
+
+What:		/sys/devices/platform/eeepc-wmi/camera
+Date:		Jan 2010
+KernelVersion:	2.6.39
+Contact:	"Corentin Chary" <corentincj-EjuBZuxMvz2sTnJN9+BGXg@public.gmane.org>
+Description:
+		Control the camera. 1 means on, 0 means off.
+
+What:		/sys/devices/platform/eeepc-wmi/cardr
+Date:		Jan 2010
+KernelVersion:	2.6.39
+Contact:	"Corentin Chary" <corentincj-EjuBZuxMvz2sTnJN9+BGXg@public.gmane.org>
+Description:
+		Control the card reader. 1 means on, 0 means off.
diff --git a/drivers/platform/x86/eeepc-wmi.c b/drivers/platform/x86/eeepc-wmi.c
index 391c32b..83415dd 100644
--- a/drivers/platform/x86/eeepc-wmi.c
+++ b/drivers/platform/x86/eeepc-wmi.c
@@ -73,6 +73,8 @@ MODULE_ALIAS("wmi:"EEEPC_WMI_MGMT_GUID);
 #define EEEPC_WMI_DEVID_BLUETOOTH	0x00010013
 #define EEEPC_WMI_DEVID_WWAN3G		0x00010019
 #define EEEPC_WMI_DEVID_BACKLIGHT	0x00050012
+#define EEEPC_WMI_DEVID_CAMERA		0x00060013
+#define EEEPC_WMI_DEVID_CARDREADER	0x00080013
 #define EEEPC_WMI_DEVID_TPDLED		0x00100011
 
 #define EEEPC_WMI_DSTS_STATUS_BIT	0x00000001
@@ -879,6 +881,70 @@ static void eeepc_wmi_notify(u32 value, void *context)
 	kfree(obj);
 }
 
+/*
+ * Sys helpers
+ */
+static int parse_arg(const char *buf, unsigned long count, int *val)
+{
+	if (!count)
+		return 0;
+	if (sscanf(buf, "%i", val) != 1)
+		return -EINVAL;
+	return count;
+}
+
+static ssize_t store_sys_wmi(int devid, const char *buf, size_t count)
+{
+	acpi_status status;
+	u32 retval;
+	int rv, value;
+
+	value = eeepc_wmi_get_devstate_simple(devid);
+	if (value == -ENODEV) /* Check device presence */
+		return value;
+
+	rv = parse_arg(buf, count, &value);
+	status = eeepc_wmi_set_devstate(devid, value, &retval);
+
+	if (ACPI_FAILURE(status))
+		return -EIO;
+	return rv;
+}
+
+static ssize_t show_sys_wmi(int devid, char *buf)
+{
+	int value = eeepc_wmi_get_devstate_simple(devid);
+
+	if (value < 0)
+		return value;
+
+	return sprintf(buf, "%d\n", value);
+}
+
+#define EEEPC_WMI_CREATE_DEVICE_ATTR(_name, _mode, _cm)			\
+	static ssize_t show_##_name(struct device *dev,			\
+				    struct device_attribute *attr,	\
+				    char *buf)				\
+	{								\
+		return show_sys_wmi(_cm, buf);				\
+	}								\
+	static ssize_t store_##_name(struct device *dev,		\
+				     struct device_attribute *attr,	\
+				     const char *buf, size_t count)	\
+	{								\
+		return store_sys_wmi(_cm, buf, count);			\
+	}								\
+	static struct device_attribute dev_attr_##_name = {		\
+		.attr = {						\
+			.name = __stringify(_name),			\
+			.mode = _mode },				\
+		.show   = show_##_name,					\
+		.store  = store_##_name,				\
+	}
+
+EEEPC_WMI_CREATE_DEVICE_ATTR(camera, 0644, EEEPC_WMI_DEVID_CAMERA);
+EEEPC_WMI_CREATE_DEVICE_ATTR(cardr, 0644, EEEPC_WMI_DEVID_CARDREADER);
+
 static ssize_t store_cpufv(struct device *dev, struct device_attribute *attr,
 			   const char *buf, size_t count)
 {
@@ -904,11 +970,32 @@ static DEVICE_ATTR(cpufv, S_IRUGO | S_IWUSR, NULL, store_cpufv);
 
 static struct attribute *platform_attributes[] = {
 	&dev_attr_cpufv.attr,
+	&dev_attr_camera.attr,
+	&dev_attr_cardr.attr,
 	NULL
 };
 
+static mode_t eeepc_sysfs_is_visible(struct kobject *kobj,
+				     struct attribute *attr,
+				     int idx)
+{
+	bool supported = true;
+	int devid = -1;
+
+	if (attr == &dev_attr_camera.attr)
+		devid = EEEPC_WMI_DEVID_CAMERA;
+	else if (attr == &dev_attr_cardr.attr)
+		devid = EEEPC_WMI_DEVID_CARDREADER;
+
+	if (devid != -1)
+		supported = eeepc_wmi_get_devstate_simple(devid) != -ENODEV;
+
+	return supported ? attr->mode : 0;
+}
+
 static struct attribute_group platform_attribute_group = {
-	.attrs = platform_attributes
+	.is_visible	= eeepc_sysfs_is_visible,
+	.attrs		= platform_attributes
 };
 
 static void eeepc_wmi_sysfs_exit(struct platform_device *device)
-- 
1.7.3.4


------------------------------------------------------------------------------
Special Offer-- Download ArcSight Logger for FREE (a $49 USD value)!
Finally, a world-class log management solution at an even better price-free!
Download using promo code Free_Logger_4_Dev2Dev. Offer expires 
February 28th, so secure your free ArcSight Logger TODAY! 
http://p.sf.net/sfu/arcsight-sfd2d
