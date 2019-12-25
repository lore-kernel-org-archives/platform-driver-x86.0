From: Ayman Bagabas <ayman.bagabas@gmail.com>
Subject: [PATCH] platform/x86: huawei-wmi: Fix a possible NULL deref
Date: Wed, 25 Dec 2019 18:58:38 -0500
Message-ID: <20191225235841.14393-1-ayman.bagabas@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Ayman Bagabas <ayman.bagabas@gmail.com>, Mattias Jacobsson <2pi@mok.nu>, Dan Carpenter <dan.carpenter@oracle.com>, kbuild test robot <lkp@intel.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

We're iterating over a NULL terminated array.

Fixes: 1ac9abeb2e5b ("platform/x86: huawei-wmi: Move to platform driver")
Signed-off-by: Ayman Bagabas <ayman.bagabas@gmail.com>
---
 drivers/platform/x86/huawei-wmi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/huawei-wmi.c b/drivers/platform/x86/huawei-wmi.c
index a2d846c4a7ee..42d461eeeff4 100644
--- a/drivers/platform/x86/huawei-wmi.c
+++ b/drivers/platform/x86/huawei-wmi.c
@@ -784,13 +784,13 @@ static const struct wmi_device_id huawei_wmi_events_id_table[] = {
 static int huawei_wmi_probe(struct platform_device *pdev)
 {
 	const struct wmi_device_id *guid = huawei_wmi_events_id_table;
+	struct input_dev *idev = *huawei_wmi->idev;
 	int err;
 
 	platform_set_drvdata(pdev, huawei_wmi);
 	huawei_wmi->dev = &pdev->dev;
 
-	while (*guid->guid_string) {
-		struct input_dev *idev = *huawei_wmi->idev;
+	while (guid->guid_string) {
 
 		if (wmi_has_guid(guid->guid_string)) {
 			err = huawei_wmi_input_setup(&pdev->dev, guid->guid_string, &idev);
@@ -820,7 +820,7 @@ static int huawei_wmi_remove(struct platform_device *pdev)
 {
 	const struct wmi_device_id *guid = huawei_wmi_events_id_table;
 
-	while (*guid->guid_string) {
+	while (guid->guid_string) {
 		if (wmi_has_guid(guid->guid_string))
 			huawei_wmi_input_exit(&pdev->dev, guid->guid_string);
 

base-commit: 46cf053efec6a3a5f343fead837777efe8252a46
-- 
2.24.1
