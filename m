From: Colin King <colin.king@canonical.com>
Subject: [PATCH] platform/x86: dell-smbios: make a function and a pointer static
Date: Thu, 21 Jun 2018 19:15:24 +0100
Message-ID: <20180621181524.30550-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mario Limonciello <mario.limonciello@dell.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The function dell_smbios_smm_call and pointer platform_device are
local to the source and do not need to be in global scope, so make
them static.

Cleans up sparse warnings:
warning: symbol 'platform_device' was not declared. Should it be static?
warning: symbol 'dell_smbios_smm_call' was not declared. Should it be
static?

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/platform/x86/dell-smbios-smm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/dell-smbios-smm.c b/drivers/platform/x86/dell-smbios-smm.c
index e9e9da556318..97a90bebc360 100644
--- a/drivers/platform/x86/dell-smbios-smm.c
+++ b/drivers/platform/x86/dell-smbios-smm.c
@@ -24,7 +24,7 @@
 static int da_command_address;
 static int da_command_code;
 static struct calling_interface_buffer *buffer;
-struct platform_device *platform_device;
+static struct platform_device *platform_device;
 static DEFINE_MUTEX(smm_mutex);
 
 static const struct dmi_system_id dell_device_table[] __initconst = {
@@ -82,7 +82,7 @@ static void find_cmd_address(const struct dmi_header *dm, void *dummy)
 	}
 }
 
-int dell_smbios_smm_call(struct calling_interface_buffer *input)
+static int dell_smbios_smm_call(struct calling_interface_buffer *input)
 {
 	struct smi_cmd command;
 	size_t size;
-- 
2.17.0
