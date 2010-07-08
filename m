From: Axel Lin <axel.lin@gmail.com>
Subject: [PATCH] acerhdf: make needlessly global symbols static
Date: Thu, 08 Jul 2010 09:46:20 +0800
Message-ID: <1278553580.7162.1.camel@mola>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-px0-f174.google.com ([209.85.212.174]:46249 "EHLO
	mail-px0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755640Ab0GHBqJ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 7 Jul 2010 21:46:09 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: linux-kernel <linux-kernel@vger.kernel.org>
Cc: Peter Feuerer <peter@piie.net>, Matthew Garrett <mjg@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Borislav Petkov <petkovbb@gmail.com>, Alexey Dobriyan <adobriyan@gmail.com>, platform-driver-x86@vger.kernel.org

The following symbols are needlessly defined global:

thz_dev
cl_dev
acerhdf_dev
acerhdf_dev_ops
acerhdf_cooling_ops

This patch makes the symbols static.

Signed-off-by: Axel Lin <axel.lin@gmail.com>
---
 drivers/platform/x86/acerhdf.c |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/acerhdf.c b/drivers/platform/x86/acerhdf.c
index 7b2384d..5caaaf0 100644
--- a/drivers/platform/x86/acerhdf.c
+++ b/drivers/platform/x86/acerhdf.c
@@ -92,9 +92,9 @@ static unsigned int fanstate = ACERHDF_FAN_AUTO;
 static char force_bios[16];
 static char force_product[16];
 static unsigned int prev_interval;
-struct thermal_zone_device *thz_dev;
-struct thermal_cooling_device *cl_dev;
-struct platform_device *acerhdf_dev;
+static struct thermal_zone_device *thz_dev;
+static struct thermal_cooling_device *cl_dev;
+static struct platform_device *acerhdf_dev;
 
 module_param(kernelmode, uint, 0);
 MODULE_PARM_DESC(kernelmode, "Kernel mode fan control on / off");
@@ -374,7 +374,7 @@ static int acerhdf_get_crit_temp(struct thermal_zone_device *thermal,
 }
 
 /* bind callback functions to thermalzone */
-struct thermal_zone_device_ops acerhdf_dev_ops = {
+static struct thermal_zone_device_ops acerhdf_dev_ops = {
 	.bind = acerhdf_bind,
 	.unbind = acerhdf_unbind,
 	.get_temp = acerhdf_get_ec_temp,
@@ -449,7 +449,7 @@ err_out:
 }
 
 /* bind fan callbacks to fan device */
-struct thermal_cooling_device_ops acerhdf_cooling_ops = {
+static struct thermal_cooling_device_ops acerhdf_cooling_ops = {
 	.get_max_state = acerhdf_get_max_state,
 	.get_cur_state = acerhdf_get_cur_state,
 	.set_cur_state = acerhdf_set_cur_state,
-- 
1.5.4.3
