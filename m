From: Wei Yongjun <weiyongjun1@huawei.com>
Subject: [PATCH -next] platform/x86: dell-smbios-wmi: fix missing unlock on error in dell_smbios_wmi_call()
Date: Tue, 14 Nov 2017 06:58:15 +0000
Message-ID: <1510642695-123751-1-git-send-email-weiyongjun1@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from szxga05-in.huawei.com ([45.249.212.191]:10532 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752302AbdKNGzf (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 14 Nov 2017 01:55:35 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario Limonciello <mario.limonciello@dell.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, platform-driver-x86@vger.kernel.org

Add the missing unlock before return from function dell_smbios_wmi_call()
in the error handling case.

Fixes: 1a258e670434 ("platform/x86: dell-smbios-wmi: Add new WMI dispatcher driver")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/platform/x86/dell-smbios-wmi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/dell-smbios-wmi.c b/drivers/platform/x86/dell-smbios-wmi.c
index 35c13815..04da5a7 100644
--- a/drivers/platform/x86/dell-smbios-wmi.c
+++ b/drivers/platform/x86/dell-smbios-wmi.c
@@ -91,8 +91,10 @@ int dell_smbios_wmi_call(struct calling_interface_buffer *buffer)
 
 	mutex_lock(&call_mutex);
 	priv = get_first_smbios_priv();
-	if (!priv)
+	if (!priv) {
+		mutex_unlock(&call_mutex);
 		return -ENODEV;
+	}
 
 	size = sizeof(struct calling_interface_buffer);
 	difference = priv->req_buf_size - sizeof(u64) - size;
