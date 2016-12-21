From: Ladislav Michl <ladis@linux-mips.org>
Subject: [PATCH] hp_accel: Add support for HP ZBook 17
Date: Wed, 21 Dec 2016 10:55:53 +0100
Message-ID: <20161221095553.rbrw7qyulrdsyunl@lenoch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from eddie.linux-mips.org ([148.251.95.138]:60590 "EHLO
        cvs.linux-mips.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1759938AbcLUJz6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 21 Dec 2016 04:55:58 -0500
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Eric Piel <eric.piel@tremplin-utc.net>, Darren Hart <dvhart@infradead.org>, Takashi Iwai <tiwai@suse.de>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

HP ZBook 17 laptop needs a non-standard mapping (xy_swap_yz_inverted).

Signed-off-by: Ladislav Michl <ladis@linux-mips.org>
---
 Test done on patched driver; reading /sys/devices/platform/lis3lv02d/position 
 - laptop is horizontal: (-36,0,1188)
 - the left side is elevated: (522,18,1062)
 - the front side (where the touchpad is) is elevated: (0,-612,990)
 - the laptop is put upside-down: (-36,18,-1188)

 drivers/platform/x86/hp_accel.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/hp_accel.c b/drivers/platform/x86/hp_accel.c
index 09356684c32f..493d8910a74e 100644
--- a/drivers/platform/x86/hp_accel.c
+++ b/drivers/platform/x86/hp_accel.c
@@ -251,6 +251,7 @@ static const struct dmi_system_id lis3lv02d_dmi_ids[] = {
 	AXIS_DMI_MATCH("HPB64xx", "HP EliteBook 84", xy_swap),
 	AXIS_DMI_MATCH("HPB65xx", "HP ProBook 65", x_inverted),
 	AXIS_DMI_MATCH("HPZBook15", "HP ZBook 15", x_inverted),
+	AXIS_DMI_MATCH("HPZBook17", "HP ZBook 17", xy_swap_yz_inverted),
 	{ NULL, }
 /* Laptop models without axis info (yet):
  * "NC6910" "HP Compaq 6910"
