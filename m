From: Darren Hart <dvhart@infradead.org>
Subject: [PATCH] MAINTAINERS: Update platform-drivers-x86 maintainer and tree
Date: Thu, 28 Aug 2014 01:07:53 -0700
Message-ID: <e181ba15ed6273684bb525f83b7a93ad4112f543.1409212840.git.dvhart@linux.intel.com>
References: <1409213273-60997-1-git-send-email-dvhart@infradead.org>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:3959 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S934203AbaH1IIs (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 28 Aug 2014 04:08:48 -0400
In-Reply-To: <1409213273-60997-1-git-send-email-dvhart@infradead.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@linux.intel.com>

From: Darren Hart <dvhart@linux.intel.com>

Update the general entry for drivers/platform/x86 with myself as
maintainer and point to my tree.

Leave Matthew Garrett as maintainer of the two drivers called out
specifically elsewhere in MAINTAINERS.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1ff06de..b700f5f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10057,9 +10057,9 @@ F:	Documentation/x86/
 F:	arch/x86/
 
 X86 PLATFORM DRIVERS
-M:	Matthew Garrett <matthew.garrett@nebula.com>
+M:	Darren Hart <dvhart@infradead.org>
 L:	platform-driver-x86@vger.kernel.org
-T:	git git://cavan.codon.org.uk/platform-drivers-x86.git
+T:	git git://git.infradead.org/users/dvhart/linux-platform-drivers-x86.git
 S:	Maintained
 F:	drivers/platform/x86/
 
-- 
2.1.0.rc1
