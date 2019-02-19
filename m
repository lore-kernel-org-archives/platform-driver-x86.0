From: Mattias Jacobsson <2pi@mok.nu>
Subject: [PATCH v4 6/8] platform/x86: huawei-wmi: use MODULE_DEVICE_TABLE() instead of MODULE_ALIAS()
Date: Tue, 19 Feb 2019 20:59:54 +0100
Message-ID: <9ff0634026ad398bf0338915d9b8c7b5f32066ba.1550603967.git.2pi@mok.nu>
References: <cover.1550603967.git.2pi@mok.nu>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1550603967.git.2pi@mok.nu>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, andy@infradead.org
Cc: 2pi@mok.nu, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

WMI drivers can if they have specified an array of struct wmi_device_id
use the MODULE_DEVICE_TABLE() macro to automatically generate the
appropriate MODULE_ALIAS() output. Thus avoiding to keep both the array
of struct wmi_device_id and the MODULE_ALIAS() declaration(s) in sync.

Change driver to use MODULE_DEVICE_TABLE() instead of MODULE_ALIAS().

Signed-off-by: Mattias Jacobsson <2pi@mok.nu>
---
 drivers/platform/x86/huawei-wmi.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/platform/x86/huawei-wmi.c b/drivers/platform/x86/huawei-wmi.c
index 59872f87b741..52fcac5b393a 100644
--- a/drivers/platform/x86/huawei-wmi.c
+++ b/drivers/platform/x86/huawei-wmi.c
@@ -201,8 +201,7 @@ static struct wmi_driver huawei_wmi_driver = {
 
 module_wmi_driver(huawei_wmi_driver);
 
-MODULE_ALIAS("wmi:"WMI0_EVENT_GUID);
-MODULE_ALIAS("wmi:"AMW0_EVENT_GUID);
+MODULE_DEVICE_TABLE(wmi, huawei_wmi_id_table);
 MODULE_AUTHOR("Ayman Bagabas <ayman.bagabas@gmail.com>");
 MODULE_DESCRIPTION("Huawei WMI hotkeys");
 MODULE_LICENSE("GPL v2");
-- 
2.20.1
