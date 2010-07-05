From: Axel Lin <axel.lin@gmail.com>
Subject: [PATCH] dell-laptop: make dell_laptop_i8042_filter() static
Date: Mon, 05 Jul 2010 17:21:10 +0800
Message-ID: <1278321670.12801.12.camel@mola>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel <linux-kernel@vger.kernel.org>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Len Brown <len.brown@intel.com>, Alan Jenkins <alan-jenkins@tuffmail.co.uk>, Mario Limonciello <superm1@ubuntu.com>, Stuart Hayes <stuart_hayes@dell.com>, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Make dell_laptop_i8042_filter() static as it's used only in dell-laptop.c

Signed-off-by: Axel Lin <axel.lin@gmail.com>
---
 drivers/platform/x86/dell-laptop.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
index 661e3ac..dbbcaa6 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -467,7 +467,7 @@ static struct backlight_ops dell_ops = {
 	.update_status  = dell_send_intensity,
 };
 
-bool dell_laptop_i8042_filter(unsigned char data, unsigned char str,
+static bool dell_laptop_i8042_filter(unsigned char data, unsigned char str,
 			      struct serio *port)
 {
 	static bool extended;
-- 
1.5.4.3
