From: Mario Limonciello <mario.limonciello@dell.com>
Subject: [PATCH v12 01/16] platform/x86: dell-smbios: Prefix class/select with cmd_
Date: Wed,  1 Nov 2017 14:25:22 -0500
Message-ID: <9b1448731683c407ae1a05c5dcfb9aec1102724a.1509561822.git.mario.limonciello@dell.com>
References: <cover.1509561822.git.mario.limonciello@dell.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from esa7.dell-outbound.iphmx.com ([68.232.153.96]:58038 "EHLO
        esa7.dell-outbound.iphmx.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1754885AbdKATZn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 1 Nov 2017 15:25:43 -0400
In-Reply-To: <cover.1509561822.git.mario.limonciello@dell.com>
In-Reply-To: <cover.1509561822.git.mario.limonciello@dell.com>
References: <cover.1509561822.git.mario.limonciello@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, pali.rohar@gmail.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de, Greg KH <greg@kroah.com>, Alan Cox <gnomes@lxorguk.ukuu.org.uk>, Mario Limonciello <mario.limonciello@dell.com>

Later on these structures will be brought up to userspace.
the word "class" is a reserved word in c++ and this will prevent
uapi headers from being included directly in c++ programs.

To make life easier on these applications, prepare the change now.

Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
---
 drivers/platform/x86/dell-smbios.c | 4 ++--
 drivers/platform/x86/dell-smbios.h | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/dell-smbios.c b/drivers/platform/x86/dell-smbios.c
index e9b1ca07c872..ffc174638aa4 100644
--- a/drivers/platform/x86/dell-smbios.c
+++ b/drivers/platform/x86/dell-smbios.c
@@ -86,8 +86,8 @@ void dell_smbios_send_request(int class, int select)
 	command.ebx = virt_to_phys(buffer);
 	command.ecx = 0x42534931;
 
-	buffer->class = class;
-	buffer->select = select;
+	buffer->cmd_class = class;
+	buffer->cmd_select = select;
 
 	dcdbas_smi_request(&command);
 }
diff --git a/drivers/platform/x86/dell-smbios.h b/drivers/platform/x86/dell-smbios.h
index 45cbc2292cd3..742dd8bd66b9 100644
--- a/drivers/platform/x86/dell-smbios.h
+++ b/drivers/platform/x86/dell-smbios.h
@@ -22,8 +22,8 @@ struct notifier_block;
  * system management mode, hence the volatiles */
 
 struct calling_interface_buffer {
-	u16 class;
-	u16 select;
+	u16 cmd_class;
+	u16 cmd_select;
 	volatile u32 input[4];
 	volatile u32 output[4];
 } __packed;
-- 
2.14.1
