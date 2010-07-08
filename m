From: Axel Lin <axel.lin@gmail.com>
Subject: [PATCH] msi-wmi: make needlessly global symbols static
Date: Thu, 08 Jul 2010 09:50:30 +0800
Message-ID: <1278553830.7162.9.camel@mola>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:48651 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758303Ab0GHBuP (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 7 Jul 2010 21:50:15 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: linux-kernel <linux-kernel@vger.kernel.org>
Cc: Anisse Astier <anisse@astier.eu>, Matthew Garrett <mjg@redhat.com>, Thomas Renninger <trenn@suse.de>, Richard Purdie <rpurdie@linux.intel.com>, Carlos Corbacho <carlos@strangeworlds.co.uk>, platform-driver-x86@vger.kernel.org

backlight is needlessly defined global.
This patch makes the symbol static.

Signed-off-by: Axel Lin <axel.lin@gmail.com>
---
 drivers/platform/x86/msi-wmi.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/platform/x86/msi-wmi.c b/drivers/platform/x86/msi-wmi.c
index d173600..42a5469 100644
--- a/drivers/platform/x86/msi-wmi.c
+++ b/drivers/platform/x86/msi-wmi.c
@@ -57,7 +57,7 @@ static struct key_entry msi_wmi_keymap[] = {
 };
 static ktime_t last_pressed[ARRAY_SIZE(msi_wmi_keymap) - 1];
 
-struct backlight_device *backlight;
+static struct backlight_device *backlight;
 
 static int backlight_map[] = { 0x00, 0x33, 0x66, 0x99, 0xCC, 0xFF };
 
-- 
1.5.4.3
