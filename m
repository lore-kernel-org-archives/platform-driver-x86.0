From: Simon Danner <danner.simon@gmail.com>
Subject: [PATCH 1/1]  thinkpad_acpi: Make ThinkLight work with suspend / resume
Date: Wed,  2 Jan 2013 10:34:46 +0000
Message-ID: <1357122886-6000-1-git-send-email-danner.simon@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-bk0-f47.google.com ([209.85.214.47]:55368 "EHLO
	mail-bk0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752351Ab3ABJez (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 2 Jan 2013 04:34:55 -0500
Received: by mail-bk0-f47.google.com with SMTP id j4so5876199bkw.20
        for <platform-driver-x86@vger.kernel.org>; Wed, 02 Jan 2013 01:34:53 -0800 (PST)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: Simon Danner <danner.simon@gmail.com>

 The status of the ThinkLight was not restored on resume,
 make it work

Signed-off-by: Simon Danner <danner.simon@gmail.com>
Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
---
 drivers/platform/x86/thinkpad_acpi.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 75dd651..c046909 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -4762,6 +4762,8 @@ static struct ibm_struct video_driver_data = {
  * Light (thinklight) subdriver
  */
 
+static int light_resume_status;
+
 TPACPI_HANDLE(lght, root, "\\LGHT");	/* A21e, A2xm/p, T20-22, X20-21 */
 TPACPI_HANDLE(ledb, ec, "LEDB");		/* G4x */
 
@@ -4921,11 +4923,38 @@ static int light_write(char *buf)
 	return light_set_status(newstatus);
 }
 
+static void light_suspend(void)
+{
+	if (!tp_features.light || !tp_features.light_status)
+		return;
+
+	light_resume_status = light_get_status();
+
+	if (light_resume_status < 0)
+		pr_notice("failed to read light status for later restore"
+				"during resume: %d\n", light_resume_status);
+}
+
+static void light_resume(void)
+{
+	int rc;
+
+	if (!tp_features.light || !tp_features.light_status)
+		return;
+
+	rc = light_set_status(light_resume_status);
+	if (rc < 0)
+		pr_notice("failed to restore light status: %d\n", rc);
+
+}
+
 static struct ibm_struct light_driver_data = {
 	.name = "light",
 	.read = light_read,
 	.write = light_write,
 	.exit = light_exit,
+	.suspend = light_suspend,
+	.resume = light_resume,
 };
 
 /*************************************************************************
-- 
1.8.0.2
