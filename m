From: Marco Chiappero <marco@absence.it>
Subject: [PATCH] sony-laptop: fix potential improper handle usage
Date: Wed, 08 Jun 2011 20:49:04 +0200
Message-ID: <4DEFC420.4040201@absence.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from aa013-1msr.fastwebnet.it ([62.101.93.133]:34490 "EHLO
	aa013-1msr.fastwebnet.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751538Ab1FHStH (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 8 Jun 2011 14:49:07 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, Mattia Dongili <malattia@linux.it>

SNC handles are positive numbers, all handles are valid with the sole 
exception of handle 0x0. This patch fixes sony_find_snc_handle, now 
using unsigned int for the handle variable and returning -1 when 
argument its value is 0x0.


Signed-off-by: Marco Chiappero <marco@absence.it>
---

--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -811,12 +811,12 @@ static int sony_nc_handles_cleanup(struc
  	return 0;
  }

-static int sony_find_snc_handle(int handle)
+static int sony_find_snc_handle(unsigned int handle)
  {
  	int i;

-	/* not initialized yet, return early */
-	if (!handles)
+	/* not initialized yet or invalid handle, return early */
+	if (!handles || !handle)
  		return -1;

  	for (i = 0; i < 0x10; i++) {
