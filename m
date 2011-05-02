From: Carlos Corbacho <carlos@strangeworlds.co.uk>
Subject: [PATCH 2/4] wmi: Orphan ACPI-WMI driver
Date: Mon, 02 May 2011 09:57:13 +0100
Message-ID: <20110502085713.3581.82128.stgit@localhost>
References: <20110502085707.3581.6671.stgit@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from 5ac7707e.bb.sky.com ([90.199.112.126]:41992 "EHLO valkyrie."
	rhost-flags-OK-OK-FAIL-FAIL) by vger.kernel.org with ESMTP
	id S1756910Ab1EBJRh (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 2 May 2011 05:17:37 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by valkyrie. (8.14.4/8.14.3) with ESMTP id p428vDRt003625
	for <platform-driver-x86@vger.kernel.org>; Mon, 2 May 2011 09:57:13 +0100
In-Reply-To: <20110502085707.3581.6671.stgit@localhost>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org

I no longer have the time to work on this, and haven't really been doing any
work to this either. Time to let someone else take the reins.

Signed-off-by: Carlos Corbacho <carlos@strangeworlds.co.uk>
---
 MAINTAINERS |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5bf19e9..833eb28 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -271,10 +271,8 @@ S:	Supported
 F:	drivers/acpi/video.c
 
 ACPI WMI DRIVER
-M:	Carlos Corbacho <carlos@strangeworlds.co.uk>
 L:	platform-driver-x86@vger.kernel.org
-W:	http://www.lesswatts.org/projects/acpi/
-S:	Maintained
+S:	Orphan
 F:	drivers/platform/x86/wmi.c
 
 AD1889 ALSA SOUND DRIVER
