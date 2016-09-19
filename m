From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH] platform/x86: Use ACPI_FAILURE at appropriate places
Date: Mon, 19 Sep 2016 09:33:51 +0800
Message-ID: <1474248831-29832-1-git-send-email-axel.lin@ingics.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:33657 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932720AbcISBeT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 18 Sep 2016 21:34:19 -0400
Received: by mail-pf0-f194.google.com with SMTP id q2so3779174pfj.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 18 Sep 2016 18:34:19 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Alex Hung <alex.hung@canonical.com>, AceLan Kao <acelan.kao@canonical.com>, Harald Welte <laforge@gnumonks.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net, Axel Lin <axel.lin@ingics.com>

Use ACPI_FAILURE() to replace !ACPI_SUCCESS(), this avoid !! operations.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/platform/x86/intel-hid.c          | 6 +++---
 drivers/platform/x86/intel-smartconnect.c | 2 +-
 drivers/platform/x86/intel-vbtn.c         | 2 +-
 drivers/platform/x86/panasonic-laptop.c   | 2 +-
 drivers/platform/x86/thinkpad_acpi.c      | 2 +-
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/intel-hid.c b/drivers/platform/x86/intel-hid.c
index ed58742..00cbeca 100644
--- a/drivers/platform/x86/intel-hid.c
+++ b/drivers/platform/x86/intel-hid.c
@@ -69,7 +69,7 @@ static int intel_hid_set_enable(struct device *device, int enable)
 
 	arg0.integer.value = enable;
 	status = acpi_evaluate_object(ACPI_HANDLE(device), "HDSM", &args, NULL);
-	if (!ACPI_SUCCESS(status)) {
+	if (ACPI_FAILURE(status)) {
 		dev_warn(device, "failed to %sable hotkeys\n",
 			 enable ? "en" : "dis");
 		return -EIO;
@@ -148,7 +148,7 @@ static void notify_handler(acpi_handle handle, u32 event, void *context)
 	}
 
 	status = acpi_evaluate_integer(handle, "HDEM", NULL, &ev_index);
-	if (!ACPI_SUCCESS(status)) {
+	if (ACPI_FAILURE(status)) {
 		dev_warn(&device->dev, "failed to get event index\n");
 		return;
 	}
@@ -167,7 +167,7 @@ static int intel_hid_probe(struct platform_device *device)
 	int err;
 
 	status = acpi_evaluate_integer(handle, "HDMM", NULL, &mode);
-	if (!ACPI_SUCCESS(status)) {
+	if (ACPI_FAILURE(status)) {
 		dev_warn(&device->dev, "failed to read mode\n");
 		return -ENODEV;
 	}
diff --git a/drivers/platform/x86/intel-smartconnect.c b/drivers/platform/x86/intel-smartconnect.c
index 04cf5df..bbe4c06 100644
--- a/drivers/platform/x86/intel-smartconnect.c
+++ b/drivers/platform/x86/intel-smartconnect.c
@@ -29,7 +29,7 @@ static int smartconnect_acpi_init(struct acpi_device *acpi)
 	acpi_status status;
 
 	status = acpi_evaluate_integer(acpi->handle, "GAOS", NULL, &value);
-	if (!ACPI_SUCCESS(status))
+	if (ACPI_FAILURE(status))
 		return -EINVAL;
 
 	if (value & 0x1) {
diff --git a/drivers/platform/x86/intel-vbtn.c b/drivers/platform/x86/intel-vbtn.c
index 146d02f..f04a394 100644
--- a/drivers/platform/x86/intel-vbtn.c
+++ b/drivers/platform/x86/intel-vbtn.c
@@ -97,7 +97,7 @@ static int intel_vbtn_probe(struct platform_device *device)
 	int err;
 
 	status = acpi_evaluate_object(handle, "VBDL", NULL, NULL);
-	if (!ACPI_SUCCESS(status)) {
+	if (ACPI_FAILURE(status)) {
 		dev_warn(&device->dev, "failed to read Intel Virtual Button driver\n");
 		return -ENODEV;
 	}
diff --git a/drivers/platform/x86/panasonic-laptop.c b/drivers/platform/x86/panasonic-laptop.c
index 3f87097..59b8eb6 100644
--- a/drivers/platform/x86/panasonic-laptop.c
+++ b/drivers/platform/x86/panasonic-laptop.c
@@ -458,7 +458,7 @@ static void acpi_pcc_generate_keyinput(struct pcc_acpi *pcc)
 
 	rc = acpi_evaluate_integer(pcc->handle, METHOD_HKEY_QUERY,
 				   NULL, &result);
-	if (!ACPI_SUCCESS(rc)) {
+	if (ACPI_FAILURE(rc)) {
 		ACPI_DEBUG_PRINT((ACPI_DB_ERROR,
 				 "error getting hotkey status\n"));
 		return;
diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index b65ce75..31fb979 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -9018,7 +9018,7 @@ static int mute_led_on_off(struct tp_led_table *t, bool state)
 	acpi_handle temp;
 	int output;
 
-	if (!ACPI_SUCCESS(acpi_get_handle(hkey_handle, t->name, &temp))) {
+	if (ACPI_FAILURE(acpi_get_handle(hkey_handle, t->name, &temp))) {
 		pr_warn("Thinkpad ACPI has no %s interface.\n", t->name);
 		return -EIO;
 	}
-- 
2.7.4
