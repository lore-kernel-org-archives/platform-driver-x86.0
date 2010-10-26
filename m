From: chris@cnpbagwell.com
Subject: [PATCH v2] eeepc-wmi: add cpufv sysfs documentation
Date: Mon, 25 Oct 2010 21:08:39 -0500
Message-ID: <1288058919-21216-1-git-send-email-chris@cnpbagwell.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-gw0-f46.google.com ([74.125.83.46]:44595 "EHLO
	mail-gw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756780Ab0JZCIr (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 25 Oct 2010 22:08:47 -0400
Received: by gwj21 with SMTP id 21so2988210gwj.19
        for <platform-driver-x86@vger.kernel.org>; Mon, 25 Oct 2010 19:08:46 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: corentin.chary@gmail.com, platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, yong.y.wang@intel.com
Cc: Chris Bagwell <chris@cnpbagwell.com>

From: Chris Bagwell <chris@cnpbagwell.com>

Based on cpufv text from sysfs-platform-eeepc-laptop that
has almost same behavior.
---
 Documentation/ABI/testing/sysfs-platform-eeepc-wmi |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-platform-eeepc-wmi

diff --git a/Documentation/ABI/testing/sysfs-platform-eeepc-wmi b/Documentation/ABI/testing/sysfs-platform-eeepc-wmi
new file mode 100644
index 0000000..e4b5fef
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-platform-eeepc-wmi
@@ -0,0 +1,10 @@
+What:		/sys/devices/platform/eeepc-wmi/cpufv
+Date:		Oct 2010
+KernelVersion:	2.6.37
+Contact:	"Corentin Chary" <corentincj@iksaif.net>
+Description:
+		Change CPU clock configuration (write-only).
+		There are three available clock configuration:
+		    * 0 -> Super Performance Mode
+		    * 1 -> High Performance Mode
+		    * 2 -> Power Saving Mode
-- 
1.7.3.1
