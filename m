From: Ike Panhc <ike.pan@canonical.com>
Subject: [PATCH] acer-wmi: support for P key on TM8372
Date: Tue, 24 Jan 2012 04:35:35 +0800
Message-ID: <1327350935-19145-1-git-send-email-ike.pan@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:41971 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752564Ab2AWUfs (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 23 Jan 2012 15:35:48 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Merlin Schumacher <merlin.schumacher@gmail.com>, Joey Lee <jlee@novell.com>, Matthew Garrett <mjg@redhat.com>

From: Merlin Schumacher <merlin.schumacher@gmail.com>

BugLink: http://launchpad.net/bugs/865807

There is no entry for P key on TM8372, so when P key is pressed, only
"acer_wmi: Unknown key number - 0x29" in dmesg.

Signed-off-by: Merlin Schumacher <merlin.schumacher@gmail.com>
Signed-off-by: Ike Panhc <ike.pan@canonical.com>
---
 drivers/platform/x86/acer-wmi.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index b848277..d48262c 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -105,6 +105,7 @@ static const struct key_entry acer_wmi_keymap[] = {
 	{KE_KEY, 0x22, {KEY_PROG2} },    /* Arcade */
 	{KE_KEY, 0x23, {KEY_PROG3} },    /* P_Key */
 	{KE_KEY, 0x24, {KEY_PROG4} },    /* Social networking_Key */
+	{KE_KEY, 0x29, {KEY_PROG3} },    /* P_Key for TM8372 */
 	{KE_IGNORE, 0x41, {KEY_MUTE} },
 	{KE_IGNORE, 0x42, {KEY_PREVIOUSSONG} },
 	{KE_IGNORE, 0x43, {KEY_NEXTSONG} },
-- 
1.7.5.4
