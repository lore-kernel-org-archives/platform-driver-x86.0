From: Mario Limonciello <mario.limonciello@dell.com>
Subject: [PATCH v11 06/15] platform/x86: wmi: Don't allow drivers to get each other's GUIDs
Date: Fri, 20 Oct 2017 12:40:21 -0500
Message-ID: <e512112f114114c2227717fba9001ddc3fe31a6b.1508515469.git.mario.limonciello@dell.com>
References: <cover.1508515469.git.mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1508515469.git.mario.limonciello@dell.com>
In-Reply-To: <cover.1508515469.git.mario.limonciello@dell.com>
References: <cover.1508515469.git.mario.limonciello@dell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, pali.rohar@gmail.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de, Greg KH <greg@kroah.com>, Alan Cox <gnomes@lxorguk.ukuu.org.uk>, Mario Limonciello <mario.limonciello@dell.com>
List-Id: platform-driver-x86.vger.kernel.org

The only driver using this was dell-wmi, and it really was a hack.
The driver was getting a data attribute from another driver and this
type of action should not be encouraged.

Rather drivers that need to interact with one another should pass
data back and forth via exported functions.

Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
Reviewed-by: Edward O'Callaghan <quasisec@google.com>
Reviewed-by: Pali Rohár <pali.rohar@gmail.com>
---
 drivers/platform/x86/wmi.c | 17 -----------------
 include/linux/wmi.h        |  4 ----
 2 files changed, 21 deletions(-)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index 4d73a87c2ddf..bcb41c1c7f52 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -368,23 +368,6 @@ union acpi_object *wmidev_block_query(struct wmi_device *wdev, u8 instance)
 }
 EXPORT_SYMBOL_GPL(wmidev_block_query);
 
-struct wmi_device *wmidev_get_other_guid(struct wmi_device *wdev,
-					 const char *guid_string)
-{
-	struct wmi_block *this_wb = container_of(wdev, struct wmi_block, dev);
-	struct wmi_block *other_wb;
-
-	if (!find_guid(guid_string, &other_wb))
-		return NULL;
-
-	if (other_wb->acpi_device != this_wb->acpi_device)
-		return NULL;
-
-	get_device(&other_wb->dev.dev);
-	return &other_wb->dev;
-}
-EXPORT_SYMBOL_GPL(wmidev_get_other_guid);
-
 /**
  * wmi_set_block - Write to a WMI block
  * @guid_string: 36 char string of the form fa50ff2b-f2e8-45de-83fa-65417f2f49ba
diff --git a/include/linux/wmi.h b/include/linux/wmi.h
index 2cd10c3b89e9..ddee427e0721 100644
--- a/include/linux/wmi.h
+++ b/include/linux/wmi.h
@@ -36,10 +36,6 @@ extern acpi_status wmidev_evaluate_method(struct wmi_device *wdev,
 extern union acpi_object *wmidev_block_query(struct wmi_device *wdev,
 					     u8 instance);
 
-/* Gets another device on the same bus.  Caller must put_device the result. */
-extern struct wmi_device *wmidev_get_other_guid(struct wmi_device *wdev,
-						const char *guid_string);
-
 struct wmi_device_id {
 	const char *guid_string;
 };
-- 
2.14.1
