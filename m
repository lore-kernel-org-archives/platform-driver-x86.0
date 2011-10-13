From: Ike Panhc <ike.pan@canonical.com>
Subject: [PATCH] acer-wmi: blacklist Thinkpad edge E520
Date: Thu, 13 Oct 2011 14:51:58 +0800
Message-ID: <1318488718-4744-1-git-send-email-ike.pan@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:47953 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751118Ab1JMGwF (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 13 Oct 2011 02:52:05 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Matthew Garrett <mjg@redhat.com>, Joey Lee <jlee@novell.com>

BugLink: http://launchpad.net/bugs/836865
BugLink: http://launchpad.net/bugs/826784

There are reports say that acer-wmi is loaded on Thinkpad E520 which
cause wireless connection hard blocked and we can not unblock it. It
will be better not to load acer-wmi on this machine.

Signed-off-by: Ike Panhc <ike.pan@canonical.com>
---
 drivers/platform/x86/acer-wmi.c |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index af2bb20..dc9a116 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -325,6 +325,13 @@ static struct dmi_system_id __devinitdata acer_blacklist[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "AOA150"),
 		},
 	},
+	{
+		.ident = "Lenovo Thinkpad Edge E520",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "114320U"),
+		},
+	},
 	{}
 };
 
-- 
1.7.5.4
