From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH] sony-laptop: fix sparse non-ANSI function warning
Date: Sat, 8 Jan 2011 19:56:44 -0800
Message-ID: <20110108195644.c134865e.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:55327 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751816Ab1AIEB3 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 8 Jan 2011 23:01:29 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platx86 <platform-driver-x86@vger.kernel.org>
Cc: Matthew Garrett <mjg@redhat.com>, Mattia Dongili <malattia@linux.it>

From: Randy Dunlap <randy.dunlap@oracle.com>

Fix sparse warning for non-ANSI function declaration:

drivers/platform/x86/sony-laptop.c:1134:35: warning: non-ANSI function declaration of function 'sony_nc_rfkill_update'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
Cc:	Matthew Garrett <mjg@redhat.com>
Cc:	Mattia Dongili <malattia@linux.it>
---
 drivers/platform/x86/sony-laptop.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- lnx0107.orig/drivers/platform/x86/sony-laptop.c
+++ lnx0107/drivers/platform/x86/sony-laptop.c
@@ -1131,7 +1131,7 @@ static int sony_nc_setup_rfkill(struct a
 	return err;
 }
 
-static void sony_nc_rfkill_update()
+static void sony_nc_rfkill_update(void)
 {
 	enum sony_nc_rfkill i;
 	int result;
