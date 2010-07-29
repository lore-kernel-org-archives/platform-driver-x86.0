From: Thomas Renninger <trenn@suse.de>
Subject: [PATCH 1/3] hp-wmi: Fix input buffer size of perform_query
Date: Thu, 29 Jul 2010 12:27:58 +0200
Message-ID: <1280399280-31219-2-git-send-email-trenn@suse.de>
References: <1280399280-31219-1-git-send-email-trenn@suse.de>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:51489 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756583Ab0G2K2K (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 29 Jul 2010 06:28:10 -0400
In-Reply-To: <1280399280-31219-1-git-send-email-trenn@suse.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: mjg59@srcf.ucam.org
Cc: platform-driver-x86@vger.kernel.org, trenn@suse.de, linux-acpi@vger.kernel.or, mjg@redhat.com

The input query object has a 16 byte fixed header (signature, command,
command type, datasize) and an additional variable size of 0, 4, 128,... bytes.

This patch fixes the static wrong size (char*) and allocates the correct memory
size dynamically.
This should not have resulted in an oops, because ACPI will detect that the
buffer is too small when the query gets executed on queries needing more than
4 bytes as input buffer. Thus queries needing 128 byte size or more result in
a "exceeding buffer" acpi error or similar when the query gets executed.
This is the fix for that.

Signed-off-by: Thomas Renninger <trenn@suse.de>
CC: linux-acpi@vger.kernel.or
CC: platform-driver-x86@vger.kernel.org
CC: mjg@redhat.com
---
 drivers/platform/x86/hp-wmi.c |   40 +++++++++++++++++++++++-----------------
 1 files changed, 23 insertions(+), 17 deletions(-)

diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
index 479ec3b..4c30dd3 100644
--- a/drivers/platform/x86/hp-wmi.c
+++ b/drivers/platform/x86/hp-wmi.c
@@ -75,14 +75,6 @@ static int __devinit hp_wmi_bios_setup(struct platform_device *device);
 static int __exit hp_wmi_bios_remove(struct platform_device *device);
 static int hp_wmi_resume_handler(struct device *device);
 
-struct bios_args {
-	u32 signature;
-	u32 command;
-	u32 commandtype;
-	u32 datasize;
-	char *data;
-};
-
 struct bios_return {
 	u32 sigpass;
 	u32 return_code;
@@ -155,17 +147,28 @@ static int hp_wmi_perform_query(int query, int write, char *buffer,
 	struct bios_return bios_return;
 	acpi_status status;
 	union acpi_object *obj;
-	struct bios_args args = {
-		.signature = 0x55434553,
-		.command = write ? 0x2 : 0x1,
-		.commandtype = query,
-		.datasize = buffersize,
-		.data = buffer,
-	};
-	struct acpi_buffer input = { sizeof(struct bios_args), &args };
+	struct acpi_buffer input;
 	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
 	int method_id;
 
+	u32 *command_buffer = kmalloc(buffersize + 16, GFP_KERNEL);
+	if (!command_buffer)
+		return -ENOMEM;
+
+	/* Signature */
+	*command_buffer = 0x55434553;
+	/* Command */
+	*(command_buffer + 1) = write ? 0x2 : 0x1;
+	/* Command Type */
+	*(command_buffer + 2) = query;
+	/* Datasize */
+	*(command_buffer + 3) = buffersize;
+	/* Data */
+	memcpy(command_buffer + 4, buffer, buffersize);
+
+	input.length = buffersize  + 16;
+	input.pointer = command_buffer;
+
 	/*
 	 * Each query method has a return buffer size defined. Could get
 	 * double checked against a static list of query methods and return
@@ -190,13 +193,16 @@ static int hp_wmi_perform_query(int query, int write, char *buffer,
 		method_id = 0x5;
 		break;
 	default:
-		pr_err(PREFIX "Invalid query buffer size %d\n", buffersize);
+		pr_err(PREFIX "Invalid query 0x%x with buffer size %d\n",
+		       query, buffersize);
+		kfree(command_buffer);
 		return -EINVAL;
 	};
 
 	status = wmi_evaluate_method(HPWMI_BIOS_GUID, 0,
 				     method_id, &input, &output);
 
+	kfree(command_buffer);
 	obj = output.pointer;
 
 	if (!obj)
-- 
1.6.3
