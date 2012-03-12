From: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Subject: [PATCH] acer-wmi: ignore missing Aspire 5741G keys (checkpatched)
Date: Mon, 12 Mar 2012 13:07:13 +0300
Message-ID: <20120312100643.GA24726@swordfish.minsk.epam.com>
References: <20120306123355.GA3904@swordfish.minsk.epam.com>
 <1331266669.10557.107.camel@linux-s257.site>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f178.google.com ([209.85.212.178]:47814 "EHLO
	mail-wi0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751389Ab2CLKHY (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 12 Mar 2012 06:07:24 -0400
Content-Disposition: inline
In-Reply-To: <1331266669.10557.107.camel@linux-s257.site>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Joey Lee <jlee@novell.com>
Cc: Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

acer-wmi: ignore missing Aspire 5741G keys

Ignore Aspire's 5741G:
 KEY_PREVIOUSSONG
 KEY_NEXTSONG
 KEY_PLAYPAUSE
 KEY_STOP
 KEY_VOLUMEDOWN
 
Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>

---

 drivers/platform/x86/acer-wmi.c |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index b848277..e45b9ad 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -107,11 +107,16 @@ static const struct key_entry acer_wmi_keymap[] = {
 	{KE_KEY, 0x24, {KEY_PROG4} },    /* Social networking_Key */
 	{KE_IGNORE, 0x41, {KEY_MUTE} },
 	{KE_IGNORE, 0x42, {KEY_PREVIOUSSONG} },
+	{KE_IGNORE, 0x4d, {KEY_PREVIOUSSONG} },
 	{KE_IGNORE, 0x43, {KEY_NEXTSONG} },
+	{KE_IGNORE, 0x4e, {KEY_NEXTSONG} },
 	{KE_IGNORE, 0x44, {KEY_PLAYPAUSE} },
+	{KE_IGNORE, 0x4f, {KEY_PLAYPAUSE} },
 	{KE_IGNORE, 0x45, {KEY_STOP} },
+	{KE_IGNORE, 0x50, {KEY_STOP} },
 	{KE_IGNORE, 0x48, {KEY_VOLUMEUP} },
 	{KE_IGNORE, 0x49, {KEY_VOLUMEDOWN} },
+	{KE_IGNORE, 0x4a, {KEY_VOLUMEDOWN} },
 	{KE_IGNORE, 0x61, {KEY_SWITCHVIDEOMODE} },
 	{KE_IGNORE, 0x62, {KEY_BRIGHTNESSUP} },
 	{KE_IGNORE, 0x63, {KEY_BRIGHTNESSDOWN} },
