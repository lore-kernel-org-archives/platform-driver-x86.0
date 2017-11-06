From: Mario Limonciello <mario.limonciello@dell.com>
Subject: [PATCH 2/2] platform/x86: dell-smbios-wmi: release mutex lock on WMI call failure
Date: Sun,  5 Nov 2017 21:34:34 -0600
Message-ID: <1509939274-2813-3-git-send-email-mario.limonciello@dell.com>
References: <1509939274-2813-1-git-send-email-mario.limonciello@dell.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1509939274-2813-1-git-send-email-mario.limonciello@dell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Mario Limonciello <mario.limonciello@dell.com>
List-Id: platform-driver-x86.vger.kernel.org

Unbound devices may race with calling this function causing the mutex
to stay locked.  This failure mode should have released the mutex too.

Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
---
 drivers/platform/x86/dell-smbios-wmi.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/dell-smbios-wmi.c b/drivers/platform/x86/dell-smbios-wmi.c
index 35c13815..5cf9b13 100644
--- a/drivers/platform/x86/dell-smbios-wmi.c
+++ b/drivers/platform/x86/dell-smbios-wmi.c
@@ -91,8 +91,10 @@ int dell_smbios_wmi_call(struct calling_interface_buffer *buffer)
 
 	mutex_lock(&call_mutex);
 	priv = get_first_smbios_priv();
-	if (!priv)
-		return -ENODEV;
+	if (!priv) {
+		ret = -ENODEV;
+		goto out_wmi_call;
+	}
 
 	size = sizeof(struct calling_interface_buffer);
 	difference = priv->req_buf_size - sizeof(u64) - size;
@@ -101,6 +103,7 @@ int dell_smbios_wmi_call(struct calling_interface_buffer *buffer)
 	memcpy(&priv->buf->std, buffer, size);
 	ret = run_smbios_call(priv->wdev);
 	memcpy(buffer, &priv->buf->std, size);
+out_wmi_call:
 	mutex_unlock(&call_mutex);
 
 	return ret;
-- 
2.7.4
