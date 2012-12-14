From: "Lee, Chun-Yi" <joeyli.kernel@gmail.com>
Subject: [RESEND][PATCH 1/5] MAINTAINERS: change the mail address of acer-wmi/msi-laptop maintainer
Date: Fri, 14 Dec 2012 16:10:05 +0800
Message-ID: <1355472609-9957-1-git-send-email-jlee@suse.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ie0-f174.google.com ([209.85.223.174]:45243 "EHLO
	mail-ie0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752643Ab2LNILY (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 14 Dec 2012 03:11:24 -0500
Received: by mail-ie0-f174.google.com with SMTP id c11so5408912ieb.19
        for <platform-driver-x86@vger.kernel.org>; Fri, 14 Dec 2012 00:11:23 -0800 (PST)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: mjg@redhat.com
Cc: platform-driver-x86@vger.kernel.org, "Lee, Chun-Yi" <jlee@suse.com>

Due to I moved to use suse.com mail address, so, add patch to change the
mail address in MAINTAINERS file.

Cc: Matthew Garrett <mjg@redhat.com>
Signed-off-by: Lee, Chun-Yi <jlee@suse.com>
---
 MAINTAINERS |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index fdc0119..555bf5b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -218,7 +218,7 @@ S:	Maintained
 F:	drivers/platform/x86/acerhdf.c
 
 ACER WMI LAPTOP EXTRAS
-M:	Joey Lee <jlee@novell.com>
+M:	"Lee, Chun-Yi" <jlee@suse.com>
 L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	drivers/platform/x86/acer-wmi.c
@@ -4577,7 +4577,7 @@ F:	Documentation/serial/moxa-smartio
 F:	drivers/tty/mxser.*
 
 MSI LAPTOP SUPPORT
-M:	"Lee, Chun-Yi" <jlee@novell.com>
+M:	"Lee, Chun-Yi" <jlee@suse.com>
 L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	drivers/platform/x86/msi-laptop.c
-- 
1.6.0.2
