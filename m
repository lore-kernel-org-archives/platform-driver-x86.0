From: Bhumika Goyal <bhumirks@gmail.com>
Subject: [PATCH] platform/x86: wmi: declare device_type structure as constant
Date: Sun, 28 Oct 2018 11:37:00 +0530
Message-ID: <20181028060700.22110-1-bhumirks@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, andy@infradead.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: julia.lawall@lip6.fr, Bhumika Goyal <bhumirks@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

The only usage of device_type structure is getting stored as
a reference in the type field of device structure. This type
field is declared const. Therefore, the device_type structure
can never be modified and can be declared as const.

Signed-off-by: Bhumika Goyal <bhumirks@gmail.com>
---
 drivers/platform/x86/wmi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index 04791ea5d97b..bea35be68706 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -987,19 +987,19 @@ static struct bus_type wmi_bus_type = {
 	.remove = wmi_dev_remove,
 };
 
-static struct device_type wmi_type_event = {
+static const struct device_type wmi_type_event = {
 	.name = "event",
 	.groups = wmi_event_groups,
 	.release = wmi_dev_release,
 };
 
-static struct device_type wmi_type_method = {
+static const struct device_type wmi_type_method = {
 	.name = "method",
 	.groups = wmi_method_groups,
 	.release = wmi_dev_release,
 };
 
-static struct device_type wmi_type_data = {
+static const struct device_type wmi_type_data = {
 	.name = "data",
 	.groups = wmi_data_groups,
 	.release = wmi_dev_release,
-- 
2.14.5
