From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH] MAINTAINERS: Add entry for the PEAQ WMI hotkeys driver
Date: Thu,  5 Oct 2017 16:31:47 +0200
Message-ID: <20171005143147.5092-1-hdegoede@redhat.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:47396 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751409AbdJEObw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 5 Oct 2017 10:31:52 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Add an entry to make myself the maintainer of the PEAQ WMI hotkeys driver.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ea7d7955516e..e250a9c356c5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10544,6 +10544,12 @@ S:	Maintained
 F:	crypto/pcrypt.c
 F:	include/crypto/pcrypt.h
 
+PEAQ WMI HOTKEYS DRIVER
+M:	Hans de Goede <hdegoede@redhat.com>
+L:	platform-driver-x86@vger.kernel.org
+S:	Maintained
+F:	drivers/platform/x86/peaq-wmi.c
+
 PER-CPU MEMORY ALLOCATOR
 M:	Tejun Heo <tj@kernel.org>
 M:	Christoph Lameter <cl@linux.com>
-- 
2.14.2
