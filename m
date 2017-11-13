From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH] platform/x86: dell-smbios-wmi: Unlock on error in
 dell_smbios_wmi_call()
Date: Mon, 13 Nov 2017 13:05:55 +0300
Message-ID: <20171113100555.sbn32ls22snpfgpg@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <kernel-janitors-owner@vger.kernel.org>
Content-Disposition: inline
Sender: kernel-janitors-owner@vger.kernel.org
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

We have to unlock before returning if get_first_smbios_priv() fails.

Fixes: 1a258e670434 ("platform/x86: dell-smbios-wmi: Add new WMI dispatcher driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/platform/x86/dell-smbios-wmi.c b/drivers/platform/x86/dell-smbios-wmi.c
index 35c13815b24c..7b0e3ca74ca0 100644
--- a/drivers/platform/x86/dell-smbios-wmi.c
+++ b/drivers/platform/x86/dell-smbios-wmi.c
@@ -91,8 +91,10 @@ int dell_smbios_wmi_call(struct calling_interface_buffer *buffer)
 
 	mutex_lock(&call_mutex);
 	priv = get_first_smbios_priv();
-	if (!priv)
-		return -ENODEV;
+	if (!priv) {
+		ret = -ENODEV;
+		goto unlock;
+	}
 
 	size = sizeof(struct calling_interface_buffer);
 	difference = priv->req_buf_size - sizeof(u64) - size;
@@ -101,6 +103,7 @@ int dell_smbios_wmi_call(struct calling_interface_buffer *buffer)
 	memcpy(&priv->buf->std, buffer, size);
 	ret = run_smbios_call(priv->wdev);
 	memcpy(buffer, &priv->buf->std, size);
+unlock:
 	mutex_unlock(&call_mutex);
 
 	return ret;
