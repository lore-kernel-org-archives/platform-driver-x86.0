From: Josh Boyer <jwboyer@redhat.com>
Subject: [PATCH RESEND] sony-laptop: Enable keyboard backlight by default
Date: Tue, 28 Feb 2012 15:21:41 -0500
Message-ID: <20120228202141.GA9730@zod.bos.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:4781 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S964971Ab2B1UVo (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 28 Feb 2012 15:21:44 -0500
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

When the keyboard backlight support was originally added, the commit said
to default it to on with a 10 second timeout.  That actually wasn't the
case, as the default value is commented out for the kbd_backlight parameter.
Because it is a static variable, it gets set to 0 by default without some
other form of initialization.

However, it seems the function to set the value wasn't actually called
immediately, so whatever state the keyboard was in initially would remain.
Then commit df410d522410e67660 was introduced during the 2.6.39 timeframe to
immediately set whatever value was present (as well as attempt to
restore/reset the state on module removal or resume).  That seems to have
now forced the light off immediately when the module is loaded unless
the option kbd_backlight=1 is specified.

Let's enable it by default again (for the first time).  This should solve
https://bugzilla.redhat.com/show_bug.cgi?id=728478

Acked-by: Mattia Dongili <malattia@linux.it>
Signed-off-by: Josh Boyer <jwboyer@redhat.com>
---

Resent.  Original: https://lkml.org/lkml/2011/11/2/274

 drivers/platform/x86/sony-laptop.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index c006dee..40c4705 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -127,7 +127,7 @@ MODULE_PARM_DESC(minor,
 		 "default is -1 (automatic)");
 #endif
 
-static int kbd_backlight;	/* = 1 */
+static int kbd_backlight = 1;
 module_param(kbd_backlight, int, 0444);
 MODULE_PARM_DESC(kbd_backlight,
 		 "set this to 0 to disable keyboard backlight, "
-- 
1.7.7.6
