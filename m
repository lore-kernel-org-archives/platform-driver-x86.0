From: Axel Lin <axel.lin@gmail.com>
Subject: [PATCH] hp-wmi: add return value checking for
	input_allocate_device()
Date: Tue, 06 Jul 2010 10:30:26 +0800
Message-ID: <1278383426.12801.15.camel@mola>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:33843 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752453Ab0GFCaU (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 5 Jul 2010 22:30:20 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: linux-kernel <linux-kernel@vger.kernel.org>
Cc: Matthew Garrett <mjg@redhat.com>, Len Brown <len.brown@intel.com>, Andrew Morton <akpm@linux-foundation.org>, Frans Pop <elendil@planet.nl>, Anisse Astier <anisse@astier.eu>, platform-driver-x86@vger.kernel.org

Add error checking and return -ENOMEM if input_allocate_device() fail.

Signed-off-by: Axel Lin <axel.lin@gmail.com>
---
 drivers/platform/x86/hp-wmi.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
index 51c07a0..c508e20 100644
--- a/drivers/platform/x86/hp-wmi.c
+++ b/drivers/platform/x86/hp-wmi.c
@@ -402,6 +402,8 @@ static int __init hp_wmi_input_setup(void)
 	int err;
 
 	hp_wmi_input_dev = input_allocate_device();
+	if (!hp_wmi_input_dev)
+		return -ENOMEM;
 
 	hp_wmi_input_dev->name = "HP WMI hotkeys";
 	hp_wmi_input_dev->phys = "wmi/input0";
-- 
1.5.4.3
