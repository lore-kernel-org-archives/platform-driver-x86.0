From: Mattia Dongili <malattia@linux.it>
Subject: Re: NULL pointer dereference in sony-laptop
Date: Fri, 1 Apr 2011 09:29:40 +0900
Message-ID: <20110401002935.GA25651@kamineko.org>
References: <4D94B9AE.6090004@alessandroguido.name>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:45303 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751573Ab1DAA3q (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 31 Mar 2011 20:29:46 -0400
Received: by iwn34 with SMTP id 34so2941019iwn.19
        for <platform-driver-x86@vger.kernel.org>; Thu, 31 Mar 2011 17:29:46 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <4D94B9AE.6090004@alessandroguido.name>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Alessandro Guido <ag@alessandroguido.name>
Cc: platform-driver-x86@vger.kernel.org

Hi Alessandro,

On Thu, Mar 31, 2011 at 07:28:14PM +0200, Alessandro Guido wrote:
> With 2.6.39-rc1-00103-g6aba74f, trying to load the sony-laptop module leads to:
> 
> Mar 31 19:18:16 [kernel] BUG: unable to handle kernel NULL pointer dereference at   (null)
> Mar 31 19:18:16 [kernel] IP: [<f8021060>] sony_find_snc_handle+0x10/0x70 [sony_laptop]
> Mar 31 19:18:16 [kernel] *pde = 00000000 
> Mar 31 19:18:16 [kernel] Modules linked in: sony_laptop(+)
> Mar 31 19:18:16 [kernel] Pid: 1464, comm: modprobe Not tainted 2.6.39-rc1-00103-g6aba74f #1 Sony Corporation VGN-FS215S
> Mar 31 19:18:16 [kernel] EIP: 0060:[<f8021060>] EFLAGS: 00010282 CPU: 0
> Mar 31 19:18:16 [kernel] EIP is at sony_find_snc_handle+0x10/0x70 [sony_laptop]
> Mar 31 19:18:16 [kernel] EAX: 0000012f EBX: 00000000 ECX: 00000000 EDX: 00000000
> Mar 31 19:18:16 [kernel] ESI: f480fe04 EDI: f65d7400 EBP: 00000000 ESP: f480fdb0
> Mar 31 19:18:16 [kernel]  DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 0068
> Mar 31 19:18:16 [kernel]  f80255cc f480fe04 f65d7400 f80255cc f8023126 f80255ed f80255d0 f80255cc
> Mar 31 19:18:16 [kernel]  f5c2ef60 f645e300 00000000 c10f35b5 f480fe18 f5c2ef00 f480fe18 c10f2dcc
> Mar 31 19:18:16 [kernel]  c10f2ad3 000041ed f6747e60 f5f671e0 f645e300 00000000 f65d7400 f8025840
> Mar 31 19:18:16 [kernel]  [<f8023126>] ? sony_nc_add+0x286/0x8b0 [sony_laptop]

I am under the impression that the SNC devices gets a notification early
during initialization when we still haven't read the available handles.
This patch should fix it but if my thoughts are incorrect then it may
break something else later.
Give it a try and let me know (it may apply with a little fuzz).
Also, could you try to load the module with and without the patch using
the parameter debug=1 ?

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index cfe4493..bed6ebd 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -808,6 +808,11 @@ static int sony_nc_handles_cleanup(struct platform_device *pd)
 static int sony_find_snc_handle(int handle)
 {
 	int i;
+
+	/* not initialized yet, return early */
+	if (!handles)
+		return -1;
+
 	for (i = 0; i < 0x10; i++) {
 		if (handles->cap[i] == handle) {
 			dprintk("found handle 0x%.4x (offset: 0x%.2x)\n",
-- 
mattia
:wq!
