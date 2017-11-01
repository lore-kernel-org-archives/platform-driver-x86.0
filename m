From: Mario Limonciello <mario.limonciello@dell.com>
Subject: [PATCH v12 08/16] platform/x86: dell-smbios: only run if proper oem string is detected
Date: Wed,  1 Nov 2017 14:25:29 -0500
Message-ID: <6fa8c8ea9e3a7d67f9fc8c27322019e8489f6a32.1509561822.git.mario.limonciello@dell.com>
References: <cover.1509561822.git.mario.limonciello@dell.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1509561822.git.mario.limonciello@dell.com>
In-Reply-To: <cover.1509561822.git.mario.limonciello@dell.com>
References: <cover.1509561822.git.mario.limonciello@dell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, pali.rohar@gmail.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de, Greg KH <greg@kroah.com>, Alan Cox <gnomes@lxorguk.ukuu.org.uk>, Mario Limonciello <mario.limonciello@dell.com>
List-Id: platform-driver-x86.vger.kernel.org

The proper way to indicate that a system is a 'supported' Dell System
is by the presence of this string in OEM strings.

Allowing the driver to load on non-Dell systems will have undefined
results.

Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
Reviewed-by: Edward O'Callaghan <quasisec@google.com>
---
 drivers/platform/x86/dell-smbios.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/platform/x86/dell-smbios.c b/drivers/platform/x86/dell-smbios.c
index ffc174638aa4..12a3eb153911 100644
--- a/drivers/platform/x86/dell-smbios.c
+++ b/drivers/platform/x86/dell-smbios.c
@@ -172,8 +172,15 @@ static void __init find_tokens(const struct dmi_header *dm, void *dummy)
 
 static int __init dell_smbios_init(void)
 {
+	const struct dmi_device *valid;
 	int ret;
 
+	valid = dmi_find_device(DMI_DEV_TYPE_OEM_STRING, "Dell System", NULL);
+	if (!valid) {
+		pr_err("Unable to run on non-Dell system\n");
+		return -ENODEV;
+	}
+
 	dmi_walk(find_tokens, NULL);
 
 	if (!da_tokens)  {
-- 
2.14.1
