From: Mattias Jacobsson <2pi@mok.nu>
Subject: [PATCH v4 7/8] platform/x86: intel-wmi-thunderbolt: use MODULE_DEVICE_TABLE() instead of MODULE_ALIAS()
Date: Tue, 19 Feb 2019 20:59:55 +0100
Message-ID: <1974b47402bfb029532c00a9a2cc805e1cf0bd84.1550603967.git.2pi@mok.nu>
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
---
 drivers/platform/x86/intel-wmi-thunderbolt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel-wmi-thunderbolt.c b/drivers/platform/x86/intel-wmi-thunderbolt.c
index 9ded8e2af312..4dfa61434a76 100644
--- a/drivers/platform/x86/intel-wmi-thunderbolt.c
+++ b/drivers/platform/x86/intel-wmi-thunderbolt.c
@@ -88,7 +88,7 @@ static struct wmi_driver intel_wmi_thunderbolt_driver = {
 
 module_wmi_driver(intel_wmi_thunderbolt_driver);
 
-MODULE_ALIAS("wmi:" INTEL_WMI_THUNDERBOLT_GUID);
+MODULE_DEVICE_TABLE(wmi, intel_wmi_thunderbolt_id_table);
 MODULE_AUTHOR("Mario Limonciello <mario.limonciello@dell.com>");
 MODULE_DESCRIPTION("Intel WMI Thunderbolt force power driver");
 MODULE_LICENSE("GPL v2");
-- 
2.20.1
