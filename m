From: Konrad Zapalowicz <bergo.torino@gmail.com>
Subject: [PATCH 00/11] driver: thikpad_acpi: deal with checkpatch issues
Date: Mon, 21 Apr 2014 21:10:45 +0200
Message-ID: <1398107456-31080-1-git-send-email-bergo.torino@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ee0-f42.google.com ([74.125.83.42]:33109 "EHLO
	mail-ee0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753471AbaDUTLF (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 21 Apr 2014 15:11:05 -0400
Received: by mail-ee0-f42.google.com with SMTP id d17so3892975eek.29
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Apr 2014 12:11:03 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: ibm-acpi@hmh.eng.br, matthew.garrett@nebula.com, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org
Cc: Konrad Zapalowicz <bergo.torino@gmail.com>

This serie of patches deals with the checkpatch errors and warnings
found in the ./drivers/platform/x86/thinkpad_acpi.c file. In total
approx. 76 items have been fixed and in particular these are:
	- spaces required around that '?' (ctx:VxW)
	- "foo* const bar" should be "foo * const bar"
	- Prefer seq_puts to seq_printf
	- Missing a blank line after declarations
	- braces {} are not necessary for any arm of this statement
	- inline keyword should sit between storage class and type
	- static const char * array should probably be
	  static const char * const
	- simple_strtoul is obsolete, use kstrtoul instead
	- __packed is preferred over __attribute__((packed))
	- Missing a blank line after declarations
	- Unnecessary space before function pointer arguments
	- Use #include <linux/uaccess.h> instead of <asm/uaccess.h>
	- Prefer [subsystem eg: netdev]_dbg([subsystem]dev, ... then
	  dev_dbg(dev, ... then pr_debug(...  to printk(KERN_DEBUG ...

The most significiant change is the "simple_strtoul is obsolete, use
kstrtoul instead" therefore this patch should be reviewed carefully.

The linux-next tree (36efbdf) has been used as a base for this work.

Konrad Zapalowicz (11):
  driver: thinkpad_acpi: add spaces around ?
  driver: thinkpad_acpi: add parenthesis around complex macro
  driver: thinkpad_acpi: fix minor checkpatch errors
  driver: thinkpad_acpi: replace seq_printf with seq_puts
  driver: thinkpad_acpi: add blank line after declaration
  driver: thinkpad_acpi: remove unnecessary spaces
  driver: thinkpad_acpi: remove not necessary {} braces
  driver: thinkpad_acpi: replace printk with pr_debug
  driver: thinkpad_acpi: replace simple_strtoul with kstrtoul
  driver: thinkpad_acpi: fix minor checkpatch warnings
  driver: thinkpad_acpi: remove spaces at the beginning

 drivers/platform/x86/thinkpad_acpi.c | 230 ++++++++++++++++++-----------------
 1 file changed, 119 insertions(+), 111 deletions(-)

-- 
1.8.1.2
