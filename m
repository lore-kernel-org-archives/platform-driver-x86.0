From: Axel Lin <axel.lin@gmail.com>
Subject: [PATCH] platform-driver-x86: intel_mid_thermal: fix unterminated
 platform_device_id table
Date: Sat, 26 Feb 2011 23:03:34 +0800
Message-ID: <1298732614.2762.6.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:55684 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751343Ab1BZPDq (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 26 Feb 2011 10:03:46 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Durgadoss R <durgadoss.r@intel.com>, Alan Cox <alan@linux.intel.com>, Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org

The platform_device_id table is supposed to be zero-terminated.

Signed-off-by: Axel Lin <axel.lin@gmail.com>
---
 drivers/platform/x86/intel_mid_thermal.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/platform/x86/intel_mid_thermal.c b/drivers/platform/x86/intel_mid_thermal.c
index 1215c30..6c12db5 100644
--- a/drivers/platform/x86/intel_mid_thermal.c
+++ b/drivers/platform/x86/intel_mid_thermal.c
@@ -543,6 +543,7 @@ static int mid_thermal_remove(struct platform_device *pdev)
 
 static const struct platform_device_id therm_id_table[] = {
        { DRIVER_NAME, 1 },
+       { }
 };
 
 static struct platform_driver mid_thermal_driver = {
-- 
1.7.1
