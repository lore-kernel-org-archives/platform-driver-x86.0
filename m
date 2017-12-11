From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH] platform/x86: dell-wmi: check for kmalloc() errors
Date: Mon, 11 Dec 2017 13:54:27 +0300
Message-ID: <20171211105427.ed6wmdsz2s4xxfht@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <kernel-janitors-owner@vger.kernel.org>
Content-Disposition: inline
Sender: kernel-janitors-owner@vger.kernel.org
To: Matthew Garrett <mjg59@srcf.ucam.org>, Mario Limonciello <mario.limonciello@dell.com>
Cc: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

This allocation won't fail in the current kernel because it's small but
not checking for kmalloc() failures introduces static checker warnings
so let's fix it.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-wmi.c
index 39d2f4518483..fb25b20df316 100644
--- a/drivers/platform/x86/dell-wmi.c
+++ b/drivers/platform/x86/dell-wmi.c
@@ -639,6 +639,8 @@ static int dell_wmi_events_set_enabled(bool enable)
 	int ret;
 
 	buffer = kzalloc(sizeof(struct calling_interface_buffer), GFP_KERNEL);
+	if (!buffer)
+		return -ENOMEM;
 	buffer->cmd_class = CLASS_INFO;
 	buffer->cmd_select = SELECT_APP_REGISTRATION;
 	buffer->input[0] = 0x10000;
