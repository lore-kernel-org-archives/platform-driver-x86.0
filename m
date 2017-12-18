From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH 2/2] platform/x86/thinkpad_acpi: Improve a size determination
 in tpacpi_new_rfkill()
Date: Mon, 18 Dec 2017 22:30:05 +0100
Message-ID: <36da9194-4254-91ef-5b82-ab150801b911@users.sourceforge.net>
References: <81459d11-693a-eb51-9173-9c189677f422@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.17.11]:50416 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S934777AbdLRVce (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 18 Dec 2017 16:32:34 -0500
In-Reply-To: <81459d11-693a-eb51-9173-9c189677f422@users.sourceforge.net>
Content-Language: en-GB
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 18 Dec 2017 22:13:53 +0100

Replace the specification of a data structure by a pointer dereference
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/platform/x86/thinkpad_acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 729144925880..40b7a1b9a019 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -1258,7 +1258,7 @@ static int __init tpacpi_new_rfkill(const enum tpacpi_rfk_id id,
 
 	BUG_ON(id >= TPACPI_RFK_SW_MAX || tpacpi_rfkill_switches[id]);
 
-	atp_rfk = kzalloc(sizeof(struct tpacpi_rfk), GFP_KERNEL);
+	atp_rfk = kzalloc(sizeof(*atp_rfk), GFP_KERNEL);
 	if (atp_rfk)
 		atp_rfk->rfkill = rfkill_alloc(name,
 						&tpacpi_pdev->dev,
-- 
2.15.1
