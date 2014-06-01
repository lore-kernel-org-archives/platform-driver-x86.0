From: Matthew Garrett <matthew.garrett@nebula.com>
Subject: [PATCH 07/11] vga_switcheroo: Reprobe old device on switching
Date: Sun,  1 Jun 2014 12:38:39 -0400
Message-ID: <1401640723-2058-8-git-send-email-matthew.garrett@nebula.com>
References: <1401640723-2058-1-git-send-email-matthew.garrett@nebula.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:60120 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752533AbaFAQjX (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 1 Jun 2014 12:39:23 -0400
In-Reply-To: <1401640723-2058-1-git-send-email-matthew.garrett@nebula.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org, Matthew Garrett <matthew.garrett@nebula.com>

We need to force the previously active device to reprobe its connectors
when we switch in order to allow it to give up connectors that are no
longer in use.

Signed-off-by: Matthew Garrett <matthew.garrett@nebula.com>
---
 drivers/gpu/vga/vga_switcheroo.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/vga/vga_switcheroo.c b/drivers/gpu/vga/vga_switcheroo.c
index 199a111..d380158 100644
--- a/drivers/gpu/vga/vga_switcheroo.c
+++ b/drivers/gpu/vga/vga_switcheroo.c
@@ -429,6 +429,9 @@ static int vga_switchto_stage2(struct vga_switcheroo_client *new_client)
 	if (new_client->ops->reprobe)
 		new_client->ops->reprobe(new_client->pdev);
 
+	if (active->ops->reprobe)
+		active->ops->reprobe(active->pdev);
+
 	if (active->pwr_state == VGA_SWITCHEROO_ON)
 		vga_switchoff(active);
 
-- 
1.8.5.3
