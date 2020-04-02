From: YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next] platform/x86: wmi: Make two functions static
Date: Thu, 2 Apr 2020 15:15:49 +0800
Message-ID: <20200402071549.3304-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, andy@infradead.org, 2pi@mok.nu, yuehaibing@huawei.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Fix sparse warnings:

drivers/platform/x86/xiaomi-wmi.c:26:5: warning: symbol 'xiaomi_wmi_probe' was not declared. Should it be static?
drivers/platform/x86/xiaomi-wmi.c:51:6: warning: symbol 'xiaomi_wmi_notify' was not declared. Should it be static?

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/platform/x86/xiaomi-wmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/xiaomi-wmi.c b/drivers/platform/x86/xiaomi-wmi.c
index 601cbb282f54..54a2546bb93b 100644
--- a/drivers/platform/x86/xiaomi-wmi.c
+++ b/drivers/platform/x86/xiaomi-wmi.c
@@ -23,7 +23,7 @@ struct xiaomi_wmi {
 	unsigned int key_code;
 };
 
-int xiaomi_wmi_probe(struct wmi_device *wdev, const void *context)
+static int xiaomi_wmi_probe(struct wmi_device *wdev, const void *context)
 {
 	struct xiaomi_wmi *data;
 
@@ -48,7 +48,7 @@ int xiaomi_wmi_probe(struct wmi_device *wdev, const void *context)
 	return input_register_device(data->input_dev);
 }
 
-void xiaomi_wmi_notify(struct wmi_device *wdev, union acpi_object *dummy)
+static void xiaomi_wmi_notify(struct wmi_device *wdev, union acpi_object *dummy)
 {
 	struct xiaomi_wmi *data;
 
-- 
2.17.1
