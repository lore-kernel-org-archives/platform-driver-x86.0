From: David Herrmann <dh.herrmann@googlemail.com>
Subject: [PATCH] Platform: Fix error path in samsung-laptop init
Date: Tue, 23 Aug 2011 13:03:07 +0200
Message-ID: <1314097387-3665-1-git-send-email-dh.herrmann@googlemail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:63796 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751428Ab1HWLDR (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 23 Aug 2011 07:03:17 -0400
Received: by fxh19 with SMTP id 19so156508fxh.19
        for <platform-driver-x86@vger.kernel.org>; Tue, 23 Aug 2011 04:03:16 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: gregkh@suse.de, dh.herrmann@googlemail.com, mjg@redhat.com

samsung_init() should not return success if not all devices are initialized.
Otherwise, samsung_exit() will dereference sdev NULL pointers and others.

Signed-off-by: David Herrmann <dh.herrmann@googlemail.com>
---
 drivers/platform/x86/samsung-laptop.c |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/samsung-laptop.c b/drivers/platform/x86/samsung-laptop.c
index 3591630..376ca89 100644
--- a/drivers/platform/x86/samsung-laptop.c
+++ b/drivers/platform/x86/samsung-laptop.c
@@ -770,7 +770,7 @@ static int __init samsung_init(void)
 	sabi_iface = ioremap_nocache(ifaceP, 16);
 	if (!sabi_iface) {
 		pr_err("Can't remap %x\n", ifaceP);
-		goto exit;
+		goto error_no_signature;
 	}
 	if (debug) {
 		printk(KERN_DEBUG "ifaceP = 0x%08x\n", ifaceP);
@@ -821,7 +821,6 @@ static int __init samsung_init(void)
 	if (retval)
 		goto error_file_create;
 
-exit:
 	return 0;
 
 error_file_create:
-- 
1.7.6
