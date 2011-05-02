From: Carlos Corbacho <carlos@strangeworlds.co.uk>
Subject: [PATCH 3/4] acer-wmi: Update MAINTAINERS
Date: Mon, 02 May 2011 09:57:18 +0100
Message-ID: <20110502085718.3581.27358.stgit@localhost>
References: <20110502085707.3581.6671.stgit@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from 5ac7707e.bb.sky.com ([90.199.112.126]:41992 "EHLO valkyrie."
	rhost-flags-OK-OK-FAIL-FAIL) by vger.kernel.org with ESMTP
	id S1756910Ab1EBJRi (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 2 May 2011 05:17:38 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by valkyrie. (8.14.4/8.14.3) with ESMTP id p428vIpX003634
	for <platform-driver-x86@vger.kernel.org>; Mon, 2 May 2011 09:57:18 +0100
In-Reply-To: <20110502085707.3581.6671.stgit@localhost>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org

I don't have the time or much interest these days in maintaining acer-wmi, as I
don't have access to newer Acer hardware. As he's been doing most of the work
these days anyway, Joey Lee has kindly agreed to take over.

Signed-off-by: Carlos Corbacho <carlos@strangeworlds.co.uk>
Cc: Joey Lee <jlee@novell.com>
---
 MAINTAINERS |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 833eb28..a49c15d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -223,10 +223,8 @@ S:	Maintained
 F:	drivers/platform/x86/acerhdf.c
 
 ACER WMI LAPTOP EXTRAS
-M:	Carlos Corbacho <carlos@strangeworlds.co.uk>
-L:	aceracpi@googlegroups.com (subscribers-only)
+M:	Joey Lee <jlee@novell.com>
 L:	platform-driver-x86@vger.kernel.org
-W:	http://code.google.com/p/aceracpi
 S:	Maintained
 F:	drivers/platform/x86/acer-wmi.c
 
