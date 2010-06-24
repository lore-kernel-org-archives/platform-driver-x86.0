From: Islam Amer <pharon@gmail.com>
Subject: [ patch ] dell-wmi : Dell studio eject key
Date: Thu, 24 Jun 2010 20:14:41 +0300
Message-ID: <AANLkTin7FA4H5PX1yu6N6IVw8hm0-ROwdnZbRVZDTwZp@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pv0-f174.google.com ([74.125.83.174]:41885 "EHLO
	mail-pv0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754752Ab0FXRWa (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 24 Jun 2010 13:22:30 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, akpm@linux-foundation.org

Fixes pressing the eject key on Dell Studio 1555 does not work and
produces message :
dell-wmi: Unknown key 0 pressed

Signed-off-by: Islam Amer <pharon@gmail.com>
---

--- linux-sidux-2.6-2.6.34/drivers/platform/x86/dell-wmi.c.orig	2010-06-03
00:02:17.418824168 +0300
+++ linux-sidux-2.6-2.6.34/drivers/platform/x86/dell-wmi.c	2010-06-03
00:01:40.641833249 +0300
@@ -221,7 +221,7 @@ static void dell_wmi_notify(u32 value, v
 			return;
 		}

-		if (dell_new_hk_type)
+		if (dell_new_hk_type || buffer_entry[1] == 0x0)
 			reported_key = (int)buffer_entry[2];
 		else
 			reported_key = (int)buffer_entry[1] & 0xffff;
