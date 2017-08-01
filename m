From: Andy Lutomirski <luto@kernel.org>
Subject: [PATCH 1/3] platform/dell-wmi: Fix driver interface version query
Date: Tue,  1 Aug 2017 08:37:26 -0700
Message-ID: <0cc9b015ed366f3fd104d2de707083c6ca2c2a5a.1501601667.git.luto@kernel.org>
References: <cover.1501601667.git.luto@kernel.org>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:37968 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751685AbdHAPhc (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 1 Aug 2017 11:37:32 -0400
In-Reply-To: <cover.1501601667.git.luto@kernel.org>
In-Reply-To: <cover.1501601667.git.luto@kernel.org>
References: <cover.1501601667.git.luto@kernel.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>, Andy Lutomirski <luto@kernel.org>

When I converted dell-wmi to the new bus infrastructure, I left the
call to dell_wmi_check_descriptor_buffer() in dell_wmi_init().  This
could cause two problems:

 - An error message when loading the driver on a system without
   dell-wmi.  We'd try to read the event descriptor even if the WMI
   GUID wasn't there.

 - A possible race if dell-wmi was loaded manually before wmi was
   fully initialized.

Fix it by moving the call to the probe function where it belongs.

Fixes: bff589be59c5 ("platform/x86: dell-wmi: Convert to the WMI bus infrastructure")
Signed-off-by: Andy Lutomirski <luto@kernel.org>
---
 drivers/platform/x86/dell-wmi.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-wmi.c
index f8978464df31..dad8f4afa17c 100644
--- a/drivers/platform/x86/dell-wmi.c
+++ b/drivers/platform/x86/dell-wmi.c
@@ -626,7 +626,7 @@ static void dell_wmi_input_destroy(struct wmi_device *wdev)
  * WMI Interface Version     8       4    <version>
  * WMI buffer length        12       4    4096
  */
-static int __init dell_wmi_check_descriptor_buffer(void)
+static int dell_wmi_check_descriptor_buffer(void)
 {
 	struct acpi_buffer out = { ACPI_ALLOCATE_BUFFER, NULL };
 	union acpi_object *obj;
@@ -717,9 +717,15 @@ static int dell_wmi_events_set_enabled(bool enable)
 
 static int dell_wmi_probe(struct wmi_device *wdev)
 {
+	int err;
+
 	struct dell_wmi_priv *priv = devm_kzalloc(
 		&wdev->dev, sizeof(struct dell_wmi_priv), GFP_KERNEL);
 
+	err = dell_wmi_check_descriptor_buffer();
+	if (err)
+		return err;
+
 	dev_set_drvdata(&wdev->dev, priv);
 
 	return dell_wmi_input_setup(wdev);
@@ -749,10 +755,6 @@ static int __init dell_wmi_init(void)
 {
 	int err;
 
-	err = dell_wmi_check_descriptor_buffer();
-	if (err)
-		return err;
-
 	dmi_check_system(dell_wmi_smbios_list);
 
 	if (wmi_requires_smbios_request) {
-- 
2.13.3
