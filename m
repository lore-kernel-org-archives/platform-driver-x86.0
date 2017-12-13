From: Dhaval Shah <dhaval.shah@softnautics.com>
Subject: [PATCH 1/3] platform/x86: dell-laptop: Block comments use * on subsequent lines
Date: Wed, 13 Dec 2017 13:43:07 +0530
Message-ID: <20171213081309.22851-2-dhaval.shah@softnautics.com>
References: <20171213081309.22851-1-dhaval.shah@softnautics.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ma1ind01on0097.outbound.protection.outlook.com ([104.47.100.97]:53986
        "EHLO IND01-MA1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751088AbdLMIO0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 13 Dec 2017 03:14:26 -0500
In-Reply-To: <20171213081309.22851-1-dhaval.shah@softnautics.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: mjg59@srcf.ucam.org, pali.rohar@gmail.com, andy@infradead.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Dhaval Shah <dhaval.shah@softnautics.com>

Resolved Block comments use * on subsequent lines checkpatch warnings.
Issue found by checkpatch.

Signed-off-by: Dhaval Shah <dhaval.shah@softnautics.com>
---
 drivers/platform/x86/dell-laptop.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
index cd4725e7e0b5..9b0855236e3d 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -449,7 +449,8 @@ static int dell_rfkill_set(void *data, bool blocked)
 	hwswitch = buffer->output[1];
 
 	/* If the hardware switch controls this radio, and the hardware
-	   switch is disabled, always disable the radio */
+	 * switch is disabled, always disable the radio
+	 */
 	if (ret == 0 && (hwswitch & BIT(hwswitch_bit)) &&
 	    (status & BIT(0)) && !(status & BIT(16)))
 		disable = 1;
-- 
2.11.0
