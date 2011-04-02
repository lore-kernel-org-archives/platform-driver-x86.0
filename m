From: Mattia Dongili <malattia@linux.it>
Subject: Re: NULL pointer dereference in sony-laptop
Date: Sat, 2 Apr 2011 10:06:25 +0900
Message-ID: <20110402010624.GA24489@kamineko.org>
References: <4D94B9AE.6090004@alessandroguido.name>
 <20110401002935.GA25651@kamineko.org>
 <20110401173619.GB26851@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:46657 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755044Ab1DBBGd (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 1 Apr 2011 21:06:33 -0400
Received: by iwn34 with SMTP id 34so4036919iwn.19
        for <platform-driver-x86@vger.kernel.org>; Fri, 01 Apr 2011 18:06:33 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20110401173619.GB26851@srcf.ucam.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: Alessandro Guido <ag@alessandroguido.name>, platform-driver-x86@vger.kernel.org

On Fri, Apr 01, 2011 at 06:36:19PM +0100, Matthew Garrett wrote:
> Looks good to me. I'll send this to Linus with a couple of other fixes.

ok, if you want the full commit as I have it here, here you go:

commit 5d2aa67eee2f55d34fb8be32b69886a49b93c3c1
Author: Mattia Dongili <malattia@linux.it>
Date:   Fri Apr 1 10:01:41 2011 +0900

    sony-laptop: fix early NULL pointer dereference
    
    The SNC acpi driver could get early notifications before it fully
    initializes and that could lead to dereferencing the sony_nc_handles
    structure pointer that is still NULL at that stage.
    Make sure we return early from the handle lookup function in these
    cases.
    
    Signed-off-by: Mattia Dongili <malattia@linux.it>

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index b2ce172..7082c55 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -810,6 +810,11 @@ static int sony_nc_handles_cleanup(struct platform_device *pd)
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
