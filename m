From: Mattias Jacobsson <2pi@mok.nu>
Subject: [PATCH v4 3/8] platform/x86: dell-smbios-wmi: use MODULE_DEVICE_TABLE() instead of MODULE_ALIAS()
Date: Tue, 19 Feb 2019 20:59:51 +0100
Message-ID: <d91d57dc44b6ca5f922a555bd0023dbede4d4b50.1550603967.git.2pi@mok.nu>
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
 drivers/platform/x86/dell-smbios-wmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/dell-smbios-wmi.c b/drivers/platform/x86/dell-smbios-wmi.c
index cf2229ece9ff..c3ed3c8c17b9 100644
--- a/drivers/platform/x86/dell-smbios-wmi.c
+++ b/drivers/platform/x86/dell-smbios-wmi.c
@@ -277,4 +277,4 @@ void exit_dell_smbios_wmi(void)
 	wmi_driver_unregister(&dell_smbios_wmi_driver);
 }
 
-MODULE_ALIAS("wmi:" DELL_WMI_SMBIOS_GUID);
+MODULE_DEVICE_TABLE(wmi, dell_smbios_wmi_id_table);
-- 
2.20.1
