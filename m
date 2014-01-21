From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: hp-wmi rfkill change breaks systems
Date: Tue, 21 Jan 2014 15:17:02 +0000
Message-ID: <20140121151702.GA2566@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:49405 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754385AbaAUPRE (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 21 Jan 2014 10:17:04 -0500
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: alex.hung@canonical.com
Cc: platform-driver-x86@vger.kernel.org

Hi Alex,

997daa1bd9aca412ab97955a35b26c460c0ec7a4 seems to break some systems 
(https://bugzilla.kernel.org/show_bug.cgi?id=69131 for example). The 
simplest approach seems to be to simply do something like the following:

@@ -883,8 +883,8 @@ static int __init hp_wmi_bios_setup(struct 
platform_device *device)
 	gps_rfkill = NULL;
 	rfkill2_count = 0;
 
-	if (hp_wmi_bios_2009_later() || hp_wmi_rfkill_setup(device))
-		hp_wmi_rfkill2_setup(device);
+	if (hp_wmi_rfkill2_setup(device))
+		hp_wmi_rfkill_setup(device);

Do you know if there are any cases that would be broken by this?

-- 
Matthew Garrett | mjg59@srcf.ucam.org
