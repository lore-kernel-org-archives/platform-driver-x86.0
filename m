From: Carlos Corbacho <carlos@strangeworlds.co.uk>
Subject: [PATCH 1/4] tc1100-wmi: Orphan driver
Date: Mon, 02 May 2011 09:57:08 +0100
Message-ID: <20110502085707.3581.6671.stgit@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from 5ac7707e.bb.sky.com ([90.199.112.126]:41992 "EHLO valkyrie."
	rhost-flags-OK-OK-FAIL-FAIL) by vger.kernel.org with ESMTP
	id S1756910Ab1EBJRf (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 2 May 2011 05:17:35 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by valkyrie. (8.14.4/8.14.3) with ESMTP id p428v8qP003616
	for <platform-driver-x86@vger.kernel.org>; Mon, 2 May 2011 09:57:08 +0100
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org

I've never owned the hardware, this was a port of an existing driver to prove
that the ACPI-WMI code was useful to more than just acer-wmi.

Signed-off-by: Carlos Corbacho <carlos@strangeworlds.co.uk>
---
 MAINTAINERS |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 649600c..5bf19e9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3014,9 +3014,8 @@ S:	Maintained
 F:	drivers/net/wireless/hostap/
 
 HP COMPAQ TC1100 TABLET WMI EXTRAS DRIVER
-M:	Carlos Corbacho <carlos@strangeworlds.co.uk>
 L:	platform-driver-x86@vger.kernel.org
-S:	Odd Fixes
+S:	Orphan
 F:	drivers/platform/x86/tc1100-wmi.c
 
 HP100:	Driver for HP 10/100 Mbit/s Voice Grade Network Adapter Series
