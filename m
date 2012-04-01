From: Jonathan Nieder <jrnieder@gmail.com>
Subject: [PATCH 3.0.y] acer-wmi: No wifi rfkill on Sony machines
Date: Sun, 1 Apr 2012 13:40:07 -0500
Message-ID: <20120401184007.GA20556@burratino>
References: <1332477404-13632-1-git-send-email-jlee@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:56638 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751820Ab2DASkP (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 1 Apr 2012 14:40:15 -0400
Content-Disposition: inline
In-Reply-To: <1332477404-13632-1-git-send-email-jlee@suse.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: stable@vger.kernel.org
Cc: "Lee, Chun-Yi" <joeyli.kernel@gmail.com>, Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, stable@kernel.org, "Lee, Chun-Yi" <jlee@suse.com>, Carlos Corbacho <carlos@strangeworlds.co.uk>, Mattia Dongili <malattia@linux.it>, Dimitris N <ddarlac@gmail.com>, Kalle Olavi Niemitalo <kon@iki.fi>

From: Lee, Chun-Yi <joeyli.kernel@gmail.com>
Date: Fri, 23 Mar 2012 12:36:44 +0800

commit 5719b81988f3c24ff694dc3a37e35b35630a3966 upstream.

The wireless rfkill should charged by sony-laptop but not acer-wmi.
So, add Sony's SNY5001 acpi device to blacklist in acer-wmi.

Tested on Sony Vaio

Addresses http://bugs.debian.org/666568

Cc: Carlos Corbacho <carlos@strangeworlds.co.uk>
Cc: Mattia Dongili <malattia@linux.it>
Tested-by: Dimitris N <ddarlac@gmail.com>
Signed-off-by: Lee, Chun-Yi <jlee@suse.com>
Signed-off-by: Matthew Garrett <mjg@redhat.com>
Tested-by: Kalle Olavi Niemitalo <kon@iki.fi> (on v3.2.13)
Signed-off-by: Jonathan Nieder <jrnieder@gmail.com>
---
Hi Greg,

Please consider this patch for the 3.0, 3.2, and 3.3-stable series.

Without this patch, on affected machines wireless simply doesn't work
unless you unload the acer-wmi driver, regardless of the state of the
physical WIRELESS switch.  "rfkill list" reports sony-wifi unblocked
and acer-wireless soft blocked.  "rfkill unblock 2" has no effect.

Kalle (cc-ed) tried the patch on top of 3.2.y and wifi started working
again on his Sony VAIO VPCYA1V9E.  More details are at
<http://bugs.debian.org/666568>.

Thanks,
Jonathan

 drivers/platform/x86/acer-wmi.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index db9b25abeb66..2080b223c74a 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -689,6 +689,7 @@ static const struct acpi_device_id norfkill_ids[] = {
 	{ "VPC2004", 0},
 	{ "IBM0068", 0},
 	{ "LEN0068", 0},
+	{ "SNY5001", 0},	/* sony-laptop in charge */
 	{ "", 0},
 };
 
-- 
1.7.10.rc3
