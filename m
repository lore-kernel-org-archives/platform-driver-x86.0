From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH] platform/x86: peaq-wmi: Fix peaq_ignore_events_counter handling off by 1
Date: Tue, 11 Jul 2017 13:41:34 +0200
Message-ID: <20170711114134.6706-1-hdegoede@redhat.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:47238 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752175AbdGKLlh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 11 Jul 2017 07:41:37 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

If peaq_ignore_events_counter gets set to 1 we should skip polling 1
time, rather then ignoring it.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/peaq-wmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/peaq-wmi.c b/drivers/platform/x86/peaq-wmi.c
index 23942d5b3525..6e6a3e650e1b 100644
--- a/drivers/platform/x86/peaq-wmi.c
+++ b/drivers/platform/x86/peaq-wmi.c
@@ -50,7 +50,7 @@ static void peaq_wmi_poll(struct input_polled_dev *dev)
 		return;
 	}
 
-	if (peaq_ignore_events_counter && --peaq_ignore_events_counter > 0)
+	if (peaq_ignore_events_counter && --peaq_ignore_events_counter >= 0)
 		return;
 
 	if (obj.integer.value) {
-- 
2.13.0
