From: Anssi Hannula <anssi.hannula@iki.fi>
Subject: [PATCH 2/7] hp-wmi: remove a variable that is never read
Date: Sun, 20 Feb 2011 19:01:42 +0200
Message-ID: <1298221307-29980-3-git-send-email-anssi.hannula@iki.fi>
References: <1298221307-29980-1-git-send-email-anssi.hannula@iki.fi>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from sinikuusama.dnainternet.net ([83.102.40.134]:55479 "EHLO
	sinikuusama.dnainternet.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754400Ab1BTRMV (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 20 Feb 2011 12:12:21 -0500
In-Reply-To: <1298221307-29980-1-git-send-email-anssi.hannula@iki.fi>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: platform-driver-x86@vger.kernel.org

---
 drivers/platform/x86/hp-wmi.c |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
index 87dfb24..8e27c27 100644
--- a/drivers/platform/x86/hp-wmi.c
+++ b/drivers/platform/x86/hp-wmi.c
@@ -153,7 +153,6 @@ static int hp_wmi_perform_query(int query, int write, u32 *buffer,
 				int buffersize)
 {
 	struct bios_return bios_return;
-	acpi_status status;
 	union acpi_object *obj;
 	struct bios_args args = {
 		.signature = 0x55434553,
@@ -165,7 +164,7 @@ static int hp_wmi_perform_query(int query, int write, u32 *buffer,
 	struct acpi_buffer input = { sizeof(struct bios_args), &args };
 	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
 
-	status = wmi_evaluate_method(HPWMI_BIOS_GUID, 0, 0x3, &input, &output);
+	wmi_evaluate_method(HPWMI_BIOS_GUID, 0, 0x3, &input, &output);
 
 	obj = output.pointer;
 
-- 
1.7.3
