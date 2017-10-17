From: Guillaume =?utf-8?Q?Dou=C3=A9zan-Grard?= <gdouezangrard@gmail.com>
Subject: [PATCH 2/4] platform/x86: topstar-laptop: change to generic module
Date: Tue, 17 Oct 2017 18:18:03 +0200
Message-ID: <182e90217e61a03b17237b4c1aa633813fcde6e5.1508255487.git.gdouezangrard@gmail.com>
References: <cover.1508255487.git.gdouezangrard@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:48349 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934240AbdJQQSG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 17 Oct 2017 12:18:06 -0400
Content-Disposition: inline
In-Reply-To: <cover.1508255487.git.gdouezangrard@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Signed-off-by: Guillaume Douézan-Grard <gdouezangrard@gmail.com>
---
 drivers/platform/x86/topstar-laptop.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/topstar-laptop.c b/drivers/platform/x86/topstar-laptop.c
index d3197302aa91..ce33754c1f29 100644
--- a/drivers/platform/x86/topstar-laptop.c
+++ b/drivers/platform/x86/topstar-laptop.c
@@ -213,7 +213,25 @@ static struct acpi_driver topstar_acpi_driver = {
 		.notify = topstar_acpi_notify,
 	},
 };
-module_acpi_driver(topstar_acpi_driver);
+
+static int __init topstar_laptop_init(void)
+{
+	int res;
+
+	res = acpi_bus_register_driver(&topstar_acpi_driver);
+	if (res < 0)
+		return res;
+
+	return 0;
+}
+
+static void __exit topstar_laptop_exit(void)
+{
+	acpi_bus_unregister_driver(&topstar_acpi_driver);
+}
+
+module_init(topstar_laptop_init);
+module_exit(topstar_laptop_exit);
 
 MODULE_AUTHOR("Herton Ronaldo Krzesinski, Guillaume Douézan-Grard");
 MODULE_DESCRIPTION("Topstar Laptop ACPI Extras");
-- 
2.14.1
