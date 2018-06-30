From: Colin King <colin.king@canonical.com>
Subject: [PATCH] platform/x86: dell-smbios-wmi: make function dell_smbios_wmi_call static
Date: Sat, 30 Jun 2018 13:10:24 +0100
Message-ID: <20180630121024.18993-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mario Limonciello <mario.limonciello@dell.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The function dell_smbios_wmi_call is local to the source and does not
need to be in global scope, so make it static.

Cleans up sparse warning:
symbol 'dell_smbios_wmi_call' was not declared. Should it be static?

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/platform/x86/dell-smbios-wmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/dell-smbios-wmi.c b/drivers/platform/x86/dell-smbios-wmi.c
index fbefedb1c172..88afe5651d24 100644
--- a/drivers/platform/x86/dell-smbios-wmi.c
+++ b/drivers/platform/x86/dell-smbios-wmi.c
@@ -82,7 +82,7 @@ static int run_smbios_call(struct wmi_device *wdev)
 	return 0;
 }
 
-int dell_smbios_wmi_call(struct calling_interface_buffer *buffer)
+static int dell_smbios_wmi_call(struct calling_interface_buffer *buffer)
 {
 	struct wmi_smbios_priv *priv;
 	size_t difference;
-- 
2.17.1
