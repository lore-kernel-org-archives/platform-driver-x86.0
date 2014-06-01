From: Matthew Garrett <matthew.garrett@nebula.com>
Subject: [PATCH 10/11] apple-gmux: Indicate that driver supports changing of GPU power states
Date: Sun,  1 Jun 2014 12:38:42 -0400
Message-ID: <1401640723-2058-11-git-send-email-matthew.garrett@nebula.com>
References: <1401640723-2058-1-git-send-email-matthew.garrett@nebula.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:60240 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751742AbaFAQyW (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 1 Jun 2014 12:54:22 -0400
In-Reply-To: <1401640723-2058-1-git-send-email-matthew.garrett@nebula.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org, Matthew Garrett <matthew.garrett@nebula.com>

The Apple GMUX can cut power to the discrete GPU, so should declare this
to the vga_switcheroo core.

Signed-off-by: Matthew Garrett <matthew.garrett@nebula.com>
---
 drivers/platform/x86/apple-gmux.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/apple-gmux.c b/drivers/platform/x86/apple-gmux.c
index e9b6d77..17f906d 100644
--- a/drivers/platform/x86/apple-gmux.c
+++ b/drivers/platform/x86/apple-gmux.c
@@ -359,6 +359,7 @@ static struct vga_switcheroo_handler gmux_handler = {
 	.switch_ddc = gmux_switch_ddc,
 	.power_state = gmux_set_power_state,
 	.get_client_id = gmux_get_client_id,
+	.handler_pm = true,
 };
 
 static inline void gmux_disable_interrupts(struct apple_gmux_data *gmux_data)
-- 
1.8.5.3
