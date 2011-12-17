From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: [PATCH] (resend)intel_scu_ipc: Match the changes in the x86
 configuration
Date: Sat, 17 Dec 2011 17:42:27 +0000
Message-ID: <20111217174215.7096.7786.stgit@bob.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from lxorguk.ukuu.org.uk ([81.2.110.251]:55206 "EHLO
	lxorguk.ukuu.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751936Ab1LQRaV (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 17 Dec 2011 12:30:21 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: mjg@redhat.com, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, mingo@elte.hu

From: Alan Cox <alan@linux.intel.com>

We need to depend on INTEL_MID because the SCU is Moorestown and Medfield.

Signed-off-by: Alan Cox <alan@linux.intel.com>
---

 drivers/platform/x86/Kconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)


diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 7f43cf8..f995e6e 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -639,7 +639,7 @@ config ACPI_CMPC
 
 config INTEL_SCU_IPC
 	bool "Intel SCU IPC Support"
-	depends on X86_MRST
+	depends on X86_INTEL_MID
 	default y
 	---help---
 	  IPC is used to bridge the communications between kernel and SCU on
