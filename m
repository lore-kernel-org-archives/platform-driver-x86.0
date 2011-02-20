From: Anssi Hannula <anssi.hannula@iki.fi>
Subject: [PATCH 2/7] hp-wmi: remove a variable that is never read
Date: Sun, 20 Feb 2011 20:07:21 +0200
Message-ID: <1298225246-21991-3-git-send-email-anssi.hannula@iki.fi>
References: <1298225246-21991-1-git-send-email-anssi.hannula@iki.fi>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from sypressi.dnainternet.net ([83.102.40.135]:46653 "EHLO
	sypressi.dnainternet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754446Ab1BTSHe (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 20 Feb 2011 13:07:34 -0500
In-Reply-To: <1298225246-21991-1-git-send-email-anssi.hannula@iki.fi>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: platform-driver-x86@vger.kernel.org

Remove the status variable from hp_wmi_perform_query which holds the
return value from wmi_evaluate_method(). It is never checked as the
function bails out if the output buffer hasn't been allocated which
indicates the call failed.

Signed-off-by: Anssi Hannula <anssi.hannula@iki.fi>
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
