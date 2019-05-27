From: Mattias Jacobsson <2pi@mok.nu>
Subject: [PATCH 1/3] platform/x86: wmi: add context pointer field to struct wmi_device_id
Date: Mon, 27 May 2019 18:21:29 +0200
Message-ID: <c69e613dc6087487962166dbf2e780db77ee8a82.1558968964.git.2pi@mok.nu>
References: <cover.1558968964.git.2pi@mok.nu>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1558968964.git.2pi@mok.nu>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, andy@infradead.org
Cc: 2pi@mok.nu, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

When using wmi_install_notify_handler() to initialize a WMI handler a
data pointer can be supplied which will be passed on to the notification
handler. No similar feature exist when handling WMI events via struct
wmi_driver.

Add a context field pointer to struct wmi_device_id and add a function
find_guid_context() to retrieve that context pointer.

Signed-off-by: Mattias Jacobsson <2pi@mok.nu>
---
 drivers/platform/x86/wmi.c      | 22 ++++++++++++++++++++++
 include/linux/mod_devicetable.h |  1 +
 2 files changed, 23 insertions(+)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index 7b26b6ccf1a0..f41f1410da9d 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -146,6 +146,28 @@ static bool find_guid(const char *guid_string, struct wmi_block **out)
 	return false;
 }
 
+static const void *find_guid_context(struct wmi_block *wblock,
+				      struct wmi_driver *wdriver)
+{
+	const struct wmi_device_id *id;
+	uuid_le guid_input;
+
+	if (wblock == NULL || wdriver == NULL)
+		return NULL;
+	if (wdriver->id_table == NULL)
+		return NULL;
+
+	id = wdriver->id_table;
+	while (*id->guid_string) {
+		if (uuid_le_to_bin(id->guid_string, &guid_input))
+			continue;
+		if (!memcmp(wblock->gblock.guid, &guid_input, 16))
+			return id->context;
+		id++;
+	}
+	return NULL;
+}
+
 static int get_subobj_info(acpi_handle handle, const char *pathname,
 			   struct acpi_device_info **info)
 {
diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
index 448621c32e4d..09366859aac2 100644
--- a/include/linux/mod_devicetable.h
+++ b/include/linux/mod_devicetable.h
@@ -798,6 +798,7 @@ struct tee_client_device_id {
  */
 struct wmi_device_id {
 	const char guid_string[UUID_STRING_LEN+1];
+	const void *context;
 };
 
 #endif /* LINUX_MOD_DEVICETABLE_H */
-- 
2.21.0
