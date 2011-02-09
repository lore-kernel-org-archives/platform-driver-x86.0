From: Matthew Garrett <mjg@redhat.com>
Subject: [PATCH] acer-wmi: Fix capitalisation of GUID
Date: Wed,  9 Feb 2011 16:41:52 -0500
Message-ID: <1297287712-14708-1-git-send-email-mjg@redhat.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:46612 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754055Ab1BIVmI (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 9 Feb 2011 16:42:08 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: Matthew Garrett <mjg@redhat.com>, Carlos Corbacho <carlos@strangeworlds.co.uk>

6AF4F258-B401-42fd-BE91-3D4AC2D7C0D3 needs to be
6AF4F258-B401-42FD-BE91-3D4AC2D7C0D3 to match the hardware alias.

Signed-off-by: Matthew Garrett <mjg@redhat.com>
Cc: Carlos Corbacho <carlos@strangeworlds.co.uk>
---
 drivers/platform/x86/acer-wmi.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index c5c4b8c..d82b0f0 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -84,7 +84,7 @@ MODULE_LICENSE("GPL");
  */
 #define AMW0_GUID1		"67C3371D-95A3-4C37-BB61-DD47B491DAAB"
 #define AMW0_GUID2		"431F16ED-0C2B-444C-B267-27DEB140CF9C"
-#define WMID_GUID1		"6AF4F258-B401-42fd-BE91-3D4AC2D7C0D3"
+#define WMID_GUID1		"6AF4F258-B401-42FD-BE91-3D4AC2D7C0D3"
 #define WMID_GUID2		"95764E09-FB56-4e83-B31A-37761F60994A"
 #define WMID_GUID3		"61EF69EA-865C-4BC3-A502-A0DEBA0CB531"
 
-- 
1.7.4
