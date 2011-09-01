From: gregkh@suse.de
Subject: [patch 5/8] Platform: Fix error path in samsung-laptop init
Date: Thu, 01 Sep 2011 15:50:07 -0700
Message-ID: <20110901225331.122692921@clark.kroah.org>
References: <20110901225401.GA26870@kroah.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110901225401.GA26870@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, greg@kroah.com, David Herrmann <dh.herrmann@googlemail.com>, stable <stable@kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

samsung_init() should not return success if not all devices are initialized.
Otherwise, samsung_exit() will dereference sdev NULL pointers and others.

Signed-off-by: David Herrmann <dh.herrmann@googlemail.com>
Cc: stable <stable@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@suse.de>
---
 drivers/platform/x86/samsung-laptop.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

--- a/drivers/platform/x86/samsung-laptop.c
+++ b/drivers/platform/x86/samsung-laptop.c
@@ -799,7 +799,7 @@ static int __init samsung_init(void)
 	sabi_iface = ioremap_nocache(ifaceP, 16);
 	if (!sabi_iface) {
 		pr_err("Can't remap %x\n", ifaceP);
-		goto exit;
+		goto error_no_signature;
 	}
 	if (debug) {
 		printk(KERN_DEBUG "ifaceP = 0x%08x\n", ifaceP);
@@ -851,7 +851,6 @@ static int __init samsung_init(void)
 	if (retval)
 		goto error_file_create;
 
-exit:
 	return 0;
 
 error_file_create:
