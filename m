From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH] platform/x86: peaq-wmi: silence a static checker warning
Date: Tue, 18 Jul 2017 12:28:49 +0300
Message-ID: <20170718092849.nim5tiaycdenfyfz@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from userp1040.oracle.com ([156.151.31.81]:20204 "EHLO
        userp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751349AbdGRJ3s (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 18 Jul 2017 05:29:48 -0400
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, Hans de Goede <hdegoede@redhat.com>
Cc: Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org

Static checkers complain because:

	if (peaq_ignore_events_counter && --peaq_ignore_events_counter >= 0)
                                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
The second part of the condition is always true because
"peaq_ignore_events_counter" is unsigned.  It doesn't cause a problem
because the first part of the condition prevents underflows, but it's
simple enough to make the static checker happy.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/platform/x86/peaq-wmi.c b/drivers/platform/x86/peaq-wmi.c
index 77d1f90b0794..ab5d5b060587 100644
--- a/drivers/platform/x86/peaq-wmi.c
+++ b/drivers/platform/x86/peaq-wmi.c
@@ -20,7 +20,7 @@
 
 MODULE_ALIAS("wmi:"PEAQ_DOLBY_BUTTON_GUID);
 
-static unsigned int peaq_ignore_events_counter;
+static int peaq_ignore_events_counter;
 static struct input_polled_dev *peaq_poll_dev;
 
 /*
