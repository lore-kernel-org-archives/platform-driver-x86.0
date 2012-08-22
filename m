From: Seth Forshee <seth.forshee@canonical.com>
Subject: [PATCH] apple-gmux: Fix port address calculation in gmux_pio_write32()
Date: Tue, 21 Aug 2012 21:56:49 -0500
Message-ID: <1345604209-24947-1-git-send-email-seth.forshee@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:33484 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752019Ab2HVC5B (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 21 Aug 2012 22:57:01 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: Seth Forshee <seth.forshee@canonical.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

This function fails to add the start address of the gmux I/O range to
the requested port address and thus writes to the wrong location.

Signed-off-by: Seth Forshee <seth.forshee@canonical.com>
---
 drivers/platform/x86/apple-gmux.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/apple-gmux.c b/drivers/platform/x86/apple-gmux.c
index dfb1a92..ee21056 100644
--- a/drivers/platform/x86/apple-gmux.c
+++ b/drivers/platform/x86/apple-gmux.c
@@ -101,7 +101,7 @@ static void gmux_pio_write32(struct apple_gmux_data *gmux_data, int port,
 
 	for (i = 0; i < 4; i++) {
 		tmpval = (val >> (i * 8)) & 0xff;
-		outb(tmpval, port + i);
+		outb(tmpval, gmux_data->iostart + port + i);
 	}
 }
 
-- 
1.7.9.5
