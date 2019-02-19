From: Mattias Jacobsson <2pi@mok.nu>
Subject: [PATCH v4 5/8] platform/x86: dell-wmi: use MODULE_DEVICE_TABLE() instead of MODULE_ALIAS()
Date: Tue, 19 Feb 2019 20:59:53 +0100
Message-ID: <6a0b0a721a1fc8d7db3395c03601eb475234bae0.1550603967.git.2pi@mok.nu>
References: <cover.1550603967.git.2pi@mok.nu>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1550603967.git.2pi@mok.nu>
Sender: linux-kernel-owner@vger.kernel.org
To: mario.limonciello@dell.com, dvhart@infradead.org, andy@infradead.org, mjg59@srcf.ucam.org, pali.rohar@gmail.com
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
 drivers/platform/x86/dell-wmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-wmi.c
index 16c7f3d9a335..0602aba62b3f 100644
--- a/drivers/platform/x86/dell-wmi.c
+++ b/drivers/platform/x86/dell-wmi.c
@@ -50,8 +50,6 @@ MODULE_LICENSE("GPL");
 
 static bool wmi_requires_smbios_request;
 
-MODULE_ALIAS("wmi:"DELL_EVENT_GUID);
-
 struct dell_wmi_priv {
 	struct input_dev *input_dev;
 	u32 interface_version;
@@ -738,3 +736,5 @@ static void __exit dell_wmi_exit(void)
 	wmi_driver_unregister(&dell_wmi_driver);
 }
 module_exit(dell_wmi_exit);
+
+MODULE_DEVICE_TABLE(wmi, dell_wmi_id_table);
-- 
2.20.1
