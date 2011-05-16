From: Jean Delvare <khali@linux-fr.org>
Subject: [PATCH] i8k: Avoid lahf in 64-bit code
Date: Mon, 16 May 2011 21:12:44 +0200
Message-ID: <20110516211244.1ec215db@endymion.delvare>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from zone0.gcu-squad.org ([212.85.147.21]:39607 "EHLO
	services.gcu-squad.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753500Ab1EPTOQ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 16 May 2011 15:14:16 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Massimo Dal Zotto <dz@debian.org>
Cc: platform-driver-x86@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Luca Tettamanti <kronos.it@gmail.com>

From: Luca Tettamanti <kronos.it@gmail.com>

i8k uses lahf to read the flag register in 64-bit code; early x86-64
CPUs, however, lack this instruction and we get an invalid opcode
exception at runtime.
Use pushf to load the flag register into the stack instead.

Signed-off-by: Luca Tettamanti <kronos.it@gmail.com>
Reported-by: Jeff Rickman <jrickman@myamigos.us>
Tested-by: Jeff Rickman <jrickman@myamigos.us>
Tested-by: Harry G McGavran Jr <w5pny@arrl.net>
Cc: stable@kernel.org
Cc: Massimo Dal Zotto <dz@debian.org>
Signed-off-by: Jean Delvare <khali@linux-fr.org>
---
If nobody picks this fix quickly, I'll send it to Linus myself. I
haven't heard from Massimo for weeks if not months :(

 drivers/char/i8k.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/char/i8k.c b/drivers/char/i8k.c
index d72433f..ee01716 100644
--- a/drivers/char/i8k.c
+++ b/drivers/char/i8k.c
@@ -139,8 +139,8 @@ static int i8k_smm(struct smm_regs *regs)
 		"movl %%edi,20(%%rax)\n\t"
 		"popq %%rdx\n\t"
 		"movl %%edx,0(%%rax)\n\t"
-		"lahf\n\t"
-		"shrl $8,%%eax\n\t"
+		"pushfq\n\t"
+		"popq %%rax\n\t"
 		"andl $1,%%eax\n"
 		:"=a"(rc)
 		:    "a"(regs)


-- 
Jean Delvare
