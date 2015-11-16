From: Lukas Wunner <lukas@wunner.de>
Subject: [PATCH 1/1] apple-gmux: Assign apple_gmux_data before registering
Date: Mon, 16 Nov 2015 21:38:40 +0100
Message-ID: <3e4150dc6507efe64cf8c3e03e24702c97565866.1447097319.git.lukas__47507.2691835978$1447707092$gmane$org@wunner.de>
References: <cover.1447097319.git.lukas@wunner.de>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mailout1.hostsharing.net ([83.223.95.204]:33565 "EHLO
	mailout1.hostsharing.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752446AbbKPUvQ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 16 Nov 2015 15:51:16 -0500
In-Reply-To: <cover.1447097319.git.lukas@wunner.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org

From: Matthew Garrett <matthew.garrett@nebula.com>

Registering the handler after both GPUs will trigger a DDC switch for
connector reprobing. This will oops if apple_gmux_data hasn't already
been assigned. Reorder the code to do that.

[Lukas: More generally, this commit fixes a race condition that
is triggered by invoking a handler callback between the call to
vga_switcheroo_register_handler() and the assignment of
apple_gmux_data.]

Tested-by: Pierre Moreau <pierre.morrow@free.fr>
    [MBP  5,3 2009  nvidia MCP79 + G96        pre-retina  15"]
Tested-by: Paul Hordiienko <pvt.gord@gmail.com>
    [MBP  6,2 2010  intel ILK + nvidia GT216  pre-retina  15"]
Tested-by: Lukas Wunner <lukas@wunner.de>
    [MBP  9,1 2012  intel IVB + nvidia GK107  pre-retina  15"]
Tested-by: William Brown <william@blackhats.net.au>
    [MBP  8,2 2011  intel SNB + amd turks     pre-retina  15"]
Tested-by: Bruno Bierbaumer <bruno@bierbaumer.net>
    [MBP 11,3 2013  intel HSW + nvidia GK107  retina      15"]

Signed-off-by: Matthew Garrett <matthew.garrett@nebula.com>
Reviewed-by: Lukas Wunner <lukas@wunner.de>
Signed-off-by: Lukas Wunner <lukas@wunner.de>
---
 drivers/platform/x86/apple-gmux.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/apple-gmux.c b/drivers/platform/x86/apple-gmux.c
index 976efeb..aa58d41 100644
--- a/drivers/platform/x86/apple-gmux.c
+++ b/drivers/platform/x86/apple-gmux.c
@@ -588,18 +588,20 @@ static int gmux_probe(struct pnp_dev *pnp, const struct pnp_device_id *id)
 		gmux_data->gpe = -1;
 	}
 
+	apple_gmux_data = gmux_data;
+	init_completion(&gmux_data->powerchange_done);
+	gmux_enable_interrupts(gmux_data);
+
 	if (vga_switcheroo_register_handler(&gmux_handler)) {
 		ret = -ENODEV;
 		goto err_register_handler;
 	}
 
-	init_completion(&gmux_data->powerchange_done);
-	apple_gmux_data = gmux_data;
-	gmux_enable_interrupts(gmux_data);
-
 	return 0;
 
 err_register_handler:
+	gmux_disable_interrupts(gmux_data);
+	apple_gmux_data = NULL;
 	if (gmux_data->gpe >= 0)
 		acpi_disable_gpe(NULL, gmux_data->gpe);
 err_enable_gpe:
-- 
1.8.5.2 (Apple Git-48)
