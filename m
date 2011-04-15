From: Ike Panhc <ike.pan@canonical.com>
Subject: [Stable-38] [PATCH] ideapad: read brightness setting on brightness key notify
Date: Fri, 15 Apr 2011 19:45:15 +0800
Message-ID: <1302867915-4178-1-git-send-email-ike.pan@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from adelie.canonical.com ([91.189.90.139]:59353 "EHLO
	adelie.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751776Ab1DOLpY (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 15 Apr 2011 07:45:24 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: stable@kernel.org
Cc: Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=25922

On ideapad Y530, the brightness key notify will be blocked if the last notify
is not responsed by getting the brightness value. Read value when we get the
notify shall fix the problem and will not have any difference on other ideapads.

Signed-off-by: Ike Panhc <ike.pan@canonical.com>
Signed-off-by: Matthew Garrett <mjg@redhat.com>
(cherry picked from upstream commit 2165136585b5c7d6f118f1d90fbde550bb7de212)
---
 drivers/platform/x86/ideapad-laptop.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index 114d952..21b1018 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -459,6 +459,8 @@ static void ideapad_acpi_notify(struct acpi_device *adevice, u32 event)
 		if (test_bit(vpc_bit, &vpc1)) {
 			if (vpc_bit == 9)
 				ideapad_sync_rfk_state(adevice);
+			else if (vpc_bit == 4)
+				read_ec_data(handle, 0x12, &vpc2);
 			else
 				ideapad_input_report(priv, vpc_bit);
 		}
-- 
1.7.4.1
