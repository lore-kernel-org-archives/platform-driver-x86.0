From: "Lee, Chun-Yi" <joeyli.kernel@gmail.com>
Subject: [PATCH] acer-wmi: No wifi rfkill on Sony machines
Date: Fri, 23 Mar 2012 12:36:44 +0800
Message-ID: <1332477404-13632-1-git-send-email-jlee@suse.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-we0-f174.google.com ([74.125.82.174]:45043 "EHLO
	mail-we0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751328Ab2CWEij (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 23 Mar 2012 00:38:39 -0400
Received: by wejx9 with SMTP id x9so2367359wej.19
        for <platform-driver-x86@vger.kernel.org>; Thu, 22 Mar 2012 21:38:38 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: mjg@redhat.com
Cc: platform-driver-x86@vger.kernel.org, stable@kernel.org, "Lee, Chun-Yi" <jlee@suse.com>, Carlos Corbacho <carlos@strangeworlds.co.uk>, Mattia Dongili <malattia@linux.it>, Dimitris N <ddarlac@gmail.com>

The wireless rfkill should charged by sony-laptop but not acer-wmi.
So, add Sony's SNY5001 acpi device to blacklist in acer-wmi.

Tested on Sony Vaio

Cc: Carlos Corbacho <carlos@strangeworlds.co.uk> 
Cc: Matthew Garrett <mjg@redhat.com>
Cc: Mattia Dongili <malattia@linux.it>
Cc: Dimitris N <ddarlac@gmail.com>
Tested-by: Dimitris N <ddarlac@gmail.com>
Signed-off-by: Lee, Chun-Yi <jlee@suse.com>
---
 drivers/platform/x86/acer-wmi.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index 1e5290b..110e4af 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -692,6 +692,7 @@ static const struct acpi_device_id norfkill_ids[] = {
 	{ "VPC2004", 0},
 	{ "IBM0068", 0},
 	{ "LEN0068", 0},
+	{ "SNY5001", 0},	/* sony-laptop in charge */
 	{ "", 0},
 };
 
-- 
1.6.0.2
