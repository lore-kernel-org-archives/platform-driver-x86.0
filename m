From: Mattias Jacobsson <2pi@mok.nu>
Subject: [PATCH v2] platform/x86: wmi: fix potential null pointer dereference
Date: Wed, 30 Jan 2019 16:14:24 +0100
Message-ID: <20190130151424.28140-1-2pi@mok.nu>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, andy@infradead.org
Cc: 2pi@mok.nu, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

In the function wmi_dev_match() the variable id is dereferenced without
first performing a NULL check. The variable can for example be NULL if
a WMI driver is registered without specifying the id_table field in
struct wmi_driver.

Add a NULL check and return that the driver can't handle the device if
the variable is NULL.

Fixes: 844af950da94 ("platform/x86: wmi: Turn WMI into a bus driver")
Signed-off-by: Mattias Jacobsson <2pi@mok.nu>
---
 drivers/platform/x86/wmi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index bea35be68706..b0f3d8ecd898 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -768,6 +768,9 @@ static int wmi_dev_match(struct device *dev, struct device_driver *driver)
 	struct wmi_block *wblock = dev_to_wblock(dev);
 	const struct wmi_device_id *id = wmi_driver->id_table;
 
+	if (id == NULL)
+		return 0;
+
 	while (id->guid_string) {
 		uuid_le driver_guid;
 
-- 
2.20.1
