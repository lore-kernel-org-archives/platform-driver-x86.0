From: Bhumika Goyal <bhumirks@gmail.com>
Subject: [PATCH 1/2] acerhdf: add const to thermal_cooling_device_ops structure
Date: Wed, 21 Jun 2017 12:34:16 +0530
Message-ID: <1498028657-12059-2-git-send-email-bhumirks@gmail.com>
References: <1498028657-12059-1-git-send-email-bhumirks@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1498028657-12059-1-git-send-email-bhumirks@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: julia.lawall@lip6.fr, peter@piie.net, dvhart@infradead.org, andy@infradead.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, sujith.thomas@intel.com
Cc: Bhumika Goyal <bhumirks@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

Declare thermal_cooling_device_ops structure as const as it is only passed
as an argument to the function thermal_cooling_device_register and this
argument is of type const. So, declare the structure as const.

Signed-off-by: Bhumika Goyal <bhumirks@gmail.com>
---
 drivers/platform/x86/acerhdf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/acerhdf.c b/drivers/platform/x86/acerhdf.c
index 2acdb0d..ea22591 100644
--- a/drivers/platform/x86/acerhdf.c
+++ b/drivers/platform/x86/acerhdf.c
@@ -557,7 +557,7 @@ static int acerhdf_set_cur_state(struct thermal_cooling_device *cdev,
 }
 
 /* bind fan callbacks to fan device */
-static struct thermal_cooling_device_ops acerhdf_cooling_ops = {
+static const struct thermal_cooling_device_ops acerhdf_cooling_ops = {
 	.get_max_state = acerhdf_get_max_state,
 	.get_cur_state = acerhdf_get_cur_state,
 	.set_cur_state = acerhdf_set_cur_state,
-- 
2.7.4
