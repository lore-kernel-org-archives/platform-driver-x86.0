From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH 01/10] WMI: remove EC region handler when _WDG parsing fails
Date: Thu, 26 Aug 2010 00:14:42 -0700
Message-ID: <20100826071442.7976.93972.stgit@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:54921 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752811Ab0HZHOr (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 26 Aug 2010 03:14:47 -0400
Received: by iwn5 with SMTP id 5so1332835iwn.19
        for <platform-driver-x86@vger.kernel.org>; Thu, 26 Aug 2010 00:14:46 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: Carlos Corbacho <carlos@strangeworlds.co.uk>, platform-driver-x86@vger.kernel.org

Driver initialization was forgetting to remove EC address space handler
in cases when parse_wdg() method failed.

Signed-off-by: Dmitry Torokhov <dtor@mail.ru>
---

 drivers/platform/x86/wmi.c |    9 +++++++--
 1 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index b2978a0..7a77f03 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -968,12 +968,17 @@ static int acpi_wmi_add(struct acpi_device *device)
 						    ACPI_ADR_SPACE_EC,
 						    &acpi_wmi_ec_space_handler,
 						    NULL, NULL);
-	if (ACPI_FAILURE(status))
+	if (ACPI_FAILURE(status)) {
+		printk(KERN_ERR PREFIX "Error installing EC region handler\n");
 		return -ENODEV;
+	}
 
 	status = parse_wdg(device->handle);
 	if (ACPI_FAILURE(status)) {
-		printk(KERN_ERR PREFIX "Error installing EC region handler\n");
+		acpi_remove_address_space_handler(device->handle,
+						  ACPI_ADR_SPACE_EC,
+						  &acpi_wmi_ec_space_handler);
+		printk(KERN_ERR PREFIX "Failed to parse WDG method\n");
 		return -ENODEV;
 	}
 
