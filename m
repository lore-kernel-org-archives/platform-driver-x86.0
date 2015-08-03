From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH] MAINTAINERS: Remove Toshiba Linux mailing list address
Date: Mon,  3 Aug 2015 11:44:08 -0600
Message-ID: <1438623848-3707-1-git-send-email-coproscefalo@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-oi0-f45.google.com ([209.85.218.45]:33351 "EHLO
	mail-oi0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754195AbbHCRoP (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 3 Aug 2015 13:44:15 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>

As of March 31th 2015, the mailing-list service finished [1].

This patch simply removes such address.

[1] http://goo.gl/F6jS5r

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
Hi Darren,

I hope you can queue this patch through your tree, I ran the
"get_maintainer.pl" script but didn't come up w/ a defined
maintainer (other than the general mailing list).

I wanted to send this patch since April, but somehow I kept
delaying/forgeting it.

 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8133cef..87e5d0c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10296,7 +10296,6 @@ F:	drivers/platform/x86/toshiba_haps.c
 
 TOSHIBA SMM DRIVER
 M:	Jonathan Buzzard <jonathan@buzzard.org.uk>
-L:	tlinux-users@tce.toshiba-dme.co.jp
 W:	http://www.buzzard.org.uk/toshiba/
 S:	Maintained
 F:	drivers/char/toshiba.c
-- 
2.4.5
