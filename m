From: Konrad Zapalowicz <bergo.torino@gmail.com>
Subject: [PATCH 06/11] driver: thinkpad_acpi: remove unnecessary spaces
Date: Mon, 21 Apr 2014 21:10:51 +0200
Message-ID: <1398107456-31080-7-git-send-email-bergo.torino@gmail.com>
References: <1398107456-31080-1-git-send-email-bergo.torino@gmail.com>
 <1398107456-31080-2-git-send-email-bergo.torino@gmail.com>
 <1398107456-31080-3-git-send-email-bergo.torino@gmail.com>
 <1398107456-31080-4-git-send-email-bergo.torino@gmail.com>
 <1398107456-31080-5-git-send-email-bergo.torino@gmail.com>
 <1398107456-31080-6-git-send-email-bergo.torino@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ee0-f51.google.com ([74.125.83.51]:42022 "EHLO
	mail-ee0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753959AbaDUTLM (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 21 Apr 2014 15:11:12 -0400
Received: by mail-ee0-f51.google.com with SMTP id c13so3893881eek.10
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Apr 2014 12:11:11 -0700 (PDT)
In-Reply-To: <1398107456-31080-6-git-send-email-bergo.torino@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: ibm-acpi@hmh.eng.br, matthew.garrett@nebula.com, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org
Cc: Konrad Zapalowicz <bergo.torino@gmail.com>

This commit fixes the "Unnecessary space before function pointer
arguments" checkpatch warnings.

Signed-off-by: Konrad Zapalowicz <bergo.torino@gmail.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index f846d79..940f83b 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -258,7 +258,7 @@ struct tp_acpi_drv_struct {
 	const struct acpi_device_id *hid;
 	struct acpi_driver *driver;
 
-	void (*notify) (struct ibm_struct *, u32);
+	void (*notify)(struct ibm_struct *, u32);
 	acpi_handle *handle;
 	u32 type;
 	struct acpi_device *device;
@@ -267,12 +267,12 @@ struct tp_acpi_drv_struct {
 struct ibm_struct {
 	char *name;
 
-	int (*read) (struct seq_file *);
-	int (*write) (char *);
-	void (*exit) (void);
-	void (*resume) (void);
-	void (*suspend) (void);
-	void (*shutdown) (void);
+	int (*read)(struct seq_file *);
+	int (*write)(char *);
+	void (*exit)(void);
+	void (*resume)(void);
+	void (*suspend)(void);
+	void (*shutdown)(void);
 
 	struct list_head all_drivers;
 
@@ -290,7 +290,7 @@ struct ibm_struct {
 struct ibm_init_struct {
 	char param[32];
 
-	int (*init) (struct ibm_init_struct *);
+	int (*init)(struct ibm_init_struct *);
 	umode_t base_procfs_mode;
 	struct ibm_struct *data;
 };
-- 
1.8.1.2
