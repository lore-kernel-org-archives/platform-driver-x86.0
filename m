From: Thomas Renninger <trenn@suse.de>
Subject: [PATCH 3/3] hp-wmi: acpi_drivers.h is already included through acpi.h two lines below
Date: Thu, 29 Jul 2010 12:28:00 +0200
Message-ID: <1280399280-31219-4-git-send-email-trenn@suse.de>
References: <1280399280-31219-1-git-send-email-trenn@suse.de>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:37898 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756418Ab0G2K2K (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 29 Jul 2010 06:28:10 -0400
In-Reply-To: <1280399280-31219-1-git-send-email-trenn@suse.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: mjg59@srcf.ucam.org
Cc: platform-driver-x86@vger.kernel.org, trenn@suse.de, linux-acpi@vger.kernel.or, mjg@redhat.com

Signed-off-by: Thomas Renninger <trenn@suse.de>
CC: linux-acpi@vger.kernel.or
CC: platform-driver-x86@vger.kernel.org
CC: mjg@redhat.com
---
 drivers/platform/x86/hp-wmi.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
index f324c55..db792d2 100644
--- a/drivers/platform/x86/hp-wmi.c
+++ b/drivers/platform/x86/hp-wmi.c
@@ -29,7 +29,6 @@
 #include <linux/slab.h>
 #include <linux/types.h>
 #include <linux/input.h>
-#include <acpi/acpi_drivers.h>
 #include <linux/platform_device.h>
 #include <linux/acpi.h>
 #include <linux/rfkill.h>
-- 
1.6.3
