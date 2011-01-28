From: Huang Weiyi <weiyi.huang@gmail.com>
Subject: [PATCH 2/4] acer-wmi: remove duplicated #include
Date: Fri, 28 Jan 2011 22:05:00 +0800
Message-ID: <1296223500-3488-1-git-send-email-weiyi.huang@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:49791 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753485Ab1A1OFP (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 28 Jan 2011 09:05:15 -0500
Received: by pzk35 with SMTP id 35so441468pzk.19
        for <platform-driver-x86@vger.kernel.org>; Fri, 28 Jan 2011 06:05:15 -0800 (PST)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: jlee@novell.com
Cc: platform-driver-x86@vger.kernel.org, Huang Weiyi <weiyi.huang@gmail.com>

Remove duplicated #include('s) in
  drivers/platform/x86/acer-wmi.c

Signed-off-by: Huang Weiyi <weiyi.huang@gmail.com>
---
 drivers/platform/x86/acer-wmi.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index c5c4b8c..f21eb53 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -39,7 +39,6 @@
 #include <linux/slab.h>
 #include <linux/input.h>
 #include <linux/input/sparse-keymap.h>
-#include <linux/dmi.h>
 
 #include <acpi/acpi_drivers.h>
 
-- 
1.6.1.3
