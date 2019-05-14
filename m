From: Yurii Pavlovskyi <yurii.pavlovskyi@gmail.com>
Subject: [PATCH v4 04/13] platform/x86: wmi: Add function to get _UID of WMI
 device
Date: Tue, 14 May 2019 20:59:01 +0200
Message-ID: <35811fe2-7aac-aa3c-46dc-2bef515b0f47@gmail.com>
References: <c8cdb347-e206-76b2-0d43-546ef660ffb7@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <c8cdb347-e206-76b2-0d43-546ef660ffb7@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
Cc: Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Daniel Drake <drake@endlessm.com>, Chris Chiu <chiu@endlessm.com>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Add a new function to acpi.h / wmi.c that returns _UID of the ACPI WMI
device. For example, it returns "ATK" for the following declaration in
DSDT:
Device (ATKD)
{
    Name (_HID, "PNP0C14" /* Windows Management Instrumentation Device */)
      // _HID: Hardware ID
    Name (_UID, "ATK")  // _UID: Unique ID
    ..

Generally, it is possible that multiple PNP0C14 ACPI devices are present in
the system as mentioned in the commit message of commit bff431e49ff5
("ACPI: WMI: Add ACPI-WMI mapping driver").

Therefore the _UID is returned for a specific ACPI device that declares the
given GUID, to which it is also mapped by other methods of wmi module.

Signed-off-by: Yurii Pavlovskyi <yurii.pavlovskyi@gmail.com>
---
 drivers/platform/x86/wmi.c | 19 +++++++++++++++++++
 include/linux/acpi.h       |  1 +
 2 files changed, 20 insertions(+)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index 7b26b6ccf1a0..b08ffb769cbe 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -635,6 +635,25 @@ bool wmi_has_guid(const char *guid_string)
 }
 EXPORT_SYMBOL_GPL(wmi_has_guid);
 
+/**
+ * wmi_get_acpi_device_uid() - Get _UID name of ACPI device that defines GUID
+ * @guid_string: 36 char string of the form fa50ff2b-f2e8-45de-83fa-65417f2f49ba
+ *
+ * Find the _UID of ACPI device associated with this WMI GUID.
+ *
+ * Return: The ACPI _UID field value or NULL if the WMI GUID was not found
+ */
+char *wmi_get_acpi_device_uid(const char *guid_string)
+{
+	struct wmi_block *wblock = NULL;
+
+	if (!find_guid(guid_string, &wblock))
+		return NULL;
+
+	return acpi_device_uid(wblock->acpi_device);
+}
+EXPORT_SYMBOL_GPL(wmi_get_acpi_device_uid);
+
 static struct wmi_block *dev_to_wblock(struct device *dev)
 {
 	return container_of(dev, struct wmi_block, dev.dev);
diff --git a/include/linux/acpi.h b/include/linux/acpi.h
index d5dcebd7aad3..d31c7fd66f97 100644
--- a/include/linux/acpi.h
+++ b/include/linux/acpi.h
@@ -376,6 +376,7 @@ extern acpi_status wmi_install_notify_handler(const char *guid,
 extern acpi_status wmi_remove_notify_handler(const char *guid);
 extern acpi_status wmi_get_event_data(u32 event, struct acpi_buffer *out);
 extern bool wmi_has_guid(const char *guid);
+extern char *wmi_get_acpi_device_uid(const char *guid);
 
 #endif	/* CONFIG_ACPI_WMI */
 
-- 
2.17.1
