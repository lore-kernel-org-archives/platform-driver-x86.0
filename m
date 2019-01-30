From: Mattias Jacobsson <2pi@mok.nu>
Subject: [PATCH v3 1/3] platform/x86: wmi: move struct wmi_device_id to mod_devicetable.h
Date: Wed, 30 Jan 2019 16:14:38 +0100
Message-ID: <de9fb65f88eea485814d19d5708d70845e24032f.1548860212.git.2pi@mok.nu>
References: <cover.1548860212.git.2pi@mok.nu>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1548860212.git.2pi@mok.nu>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, andy@infradead.org
Cc: 2pi@mok.nu, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

In preparation for adding WMI support to MODULE_DEVICE_TABLE() move the
definition of struct wmi_device_id to mod_devicetable.h and inline
guid_string in the struct.

Changing guid_string to an inline char array changes the loop conditions
when looping over an array of struct wmi_device_id. Therefore update
wmi_dev_match()'s loop to check for an empty guid_string instead of a
NULL pointer.

Signed-off-by: Mattias Jacobsson <2pi@mok.nu>
---
 drivers/platform/x86/wmi.c      |  2 +-
 include/linux/mod_devicetable.h | 12 ++++++++++++
 include/linux/wmi.h             |  5 +----
 3 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index b0f3d8ecd898..7b26b6ccf1a0 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -771,7 +771,7 @@ static int wmi_dev_match(struct device *dev, struct device_driver *driver)
 	if (id == NULL)
 		return 0;
 
-	while (id->guid_string) {
+	while (*id->guid_string) {
 		uuid_le driver_guid;
 
 		if (WARN_ON(uuid_le_to_bin(id->guid_string, &driver_guid)))
diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
index f9bd2f34b99f..e44b90fa0aef 100644
--- a/include/linux/mod_devicetable.h
+++ b/include/linux/mod_devicetable.h
@@ -779,4 +779,16 @@ struct typec_device_id {
 	kernel_ulong_t driver_data;
 };
 
+/* WMI */
+
+#define WMI_MODULE_PREFIX	"wmi:"
+
+/**
+ * struct wmi_device_id - WMI device identifier
+ * @guid_string: 36 char string of the form fa50ff2b-f2e8-45de-83fa-65417f2f49ba
+ */
+struct wmi_device_id {
+	const char guid_string[UUID_STRING_LEN+1];
+};
+
 #endif /* LINUX_MOD_DEVICETABLE_H */
diff --git a/include/linux/wmi.h b/include/linux/wmi.h
index 4757cb5077e5..592f81afecbb 100644
--- a/include/linux/wmi.h
+++ b/include/linux/wmi.h
@@ -18,6 +18,7 @@
 
 #include <linux/device.h>
 #include <linux/acpi.h>
+#include <linux/mod_devicetable.h>
 #include <uapi/linux/wmi.h>
 
 struct wmi_device {
@@ -39,10 +40,6 @@ extern union acpi_object *wmidev_block_query(struct wmi_device *wdev,
 
 extern int set_required_buffer_size(struct wmi_device *wdev, u64 length);
 
-struct wmi_device_id {
-	const char *guid_string;
-};
-
 struct wmi_driver {
 	struct device_driver driver;
 	const struct wmi_device_id *id_table;
-- 
2.20.1
