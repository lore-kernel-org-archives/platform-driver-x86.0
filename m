From: Mattias Jacobsson <2pi@mok.nu>
Subject: [PATCH v4 4/8] platform/x86: dell-wmi-descriptor: use MODULE_DEVICE_TABLE() instead of MODULE_ALIAS()
Date: Tue, 19 Feb 2019 20:59:52 +0100
Message-ID: <94088cad97f6db9f656c8a67fde35f2fcbbca7af.1550603967.git.2pi@mok.nu>
References: <cover.1550603967.git.2pi@mok.nu>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1550603967.git.2pi@mok.nu>
Sender: linux-kernel-owner@vger.kernel.org
To: mario.limonciello@dell.com, dvhart@infradead.org, andy@infradead.org
Cc: 2pi@mok.nu, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

WMI drivers can if they have specified an array of struct wmi_device_id
use the MODULE_DEVICE_TABLE() macro to automatically generate the
appropriate MODULE_ALIAS() output. Thus avoiding to keep both the array
of struct wmi_device_id and the MODULE_ALIAS() declaration(s) in sync.

Change driver to use MODULE_DEVICE_TABLE() instead of MODULE_ALIAS().

Signed-off-by: Mattias Jacobsson <2pi@mok.nu>
Reviewed-by: Mario Limonciello <mario.limonciello@dell.com>
---
 drivers/platform/x86/dell-wmi-descriptor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/dell-wmi-descriptor.c b/drivers/platform/x86/dell-wmi-descriptor.c
index 072821aa47fc..14ab250b7d5a 100644
--- a/drivers/platform/x86/dell-wmi-descriptor.c
+++ b/drivers/platform/x86/dell-wmi-descriptor.c
@@ -207,7 +207,7 @@ static struct wmi_driver dell_wmi_descriptor_driver = {
 
 module_wmi_driver(dell_wmi_descriptor_driver);
 
-MODULE_ALIAS("wmi:" DELL_WMI_DESCRIPTOR_GUID);
+MODULE_DEVICE_TABLE(wmi, dell_wmi_descriptor_id_table);
 MODULE_AUTHOR("Mario Limonciello <mario.limonciello@dell.com>");
 MODULE_DESCRIPTION("Dell WMI descriptor driver");
 MODULE_LICENSE("GPL");
-- 
2.20.1
