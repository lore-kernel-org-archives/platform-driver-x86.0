From: Guillaume =?utf-8?Q?Dou=C3=A9zan-Grard?= <gdouezangrard@gmail.com>
Subject: [PATCH v2 2/4] platform/x86: topstar-laptop: change to generic module
Date: Sun, 29 Oct 2017 00:51:44 +0200
Message-ID: <1e1492d958ec60dcd3b61d3269f0aa72cc9cc93e.1509229280.git.gdouezangrard@gmail.com>
References: <cover.1509229280.git.gdouezangrard@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:55694 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751314AbdJ1Wvr (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 28 Oct 2017 18:51:47 -0400
Content-Disposition: inline
In-Reply-To: <cover.1509229280.git.gdouezangrard@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy@infradead.org>
Cc: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Signed-off-by: Guillaume Douézan-Grard <gdouezangrard@gmail.com>
---
 drivers/platform/x86/topstar-laptop.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/topstar-laptop.c b/drivers/platform/x86/topstar-laptop.c
index 106537fdc4e6..714d9d56c79f 100644
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
 
 MODULE_AUTHOR("Herton Ronaldo Krzesinski");
 MODULE_AUTHOR("Guillaume Douézan-Grard");
-- 
2.14.3
