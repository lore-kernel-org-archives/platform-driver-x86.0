From: Corentin Chary <corentincj@iksaif.net>
Subject: [PATCH v2 15/16] samsung-laptop: tweak traces
Date: Sat, 26 Nov 2011 11:00:12 +0100
Message-ID: <1322301613-8801-16-git-send-email-corentincj@iksaif.net>
References: <1322301613-8801-1-git-send-email-corentincj@iksaif.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1322301613-8801-1-git-send-email-corentincj@iksaif.net>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Matthew Garrett <mjg@redhat.com>, Corentin Chary <corentincj@iksaif.net>, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

- don't output error when probing features at load
- print the SABI signature if samsung_sabi_init()
  succeed

Signed-off-by: Corentin Chary <corentincj@iksaif.net>
---
 drivers/platform/x86/samsung-laptop.c |   19 +++++++++++++++----
 1 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/samsung-laptop.c b/drivers/platform/x86/samsung-laptop.c
index 487a1f0..573e94b 100644
--- a/drivers/platform/x86/samsung-laptop.c
+++ b/drivers/platform/x86/samsung-laptop.c
@@ -366,10 +366,11 @@ static int sabi_command(struct samsung_laptop *samsung, u16 command,
 
 	if (debug) {
 		if (in)
-			pr_info("SABI 0x%04x {0x%08x, 0x%08x, 0x%04x, 0x%02x}",
+			pr_info("SABI command:0x%04x "
+				"data:{0x%08x, 0x%08x, 0x%04x, 0x%02x}",
 				command, in->d0, in->d1, in->d2, in->d3);
 		else
-			pr_info("SABI 0x%04x", command);
+			pr_info("SABI command:0x%04x", command);
 	}
 
 	/* enable memory to be able to write to it */
@@ -393,10 +394,17 @@ static int sabi_command(struct samsung_laptop *samsung, u16 command,
 	/* see if the command actually succeeded */
 	complete = readb(samsung->sabi_iface + SABI_IFACE_COMPLETE);
 	iface_data = readb(samsung->sabi_iface + SABI_IFACE_DATA);
-	if (complete != 0xaa || iface_data == 0xff) {
+
+	/* iface_data = 0xFF happens when a command is not known
+	 * so we only add a warning in debug mode since we will
+	 * probably issue some unknown command at startup to find
+	 * out which features are supported */
+	if (complete != 0xaa || (iface_data == 0xff && debug))
 		pr_warn("SABI command 0x%04x failed with"
 			" completion flag 0x%02x and interface data 0x%02x",
 			command, complete, iface_data);
+
+	if (complete != 0xaa || iface_data == 0xff) {
 		ret = -EINVAL;
 		goto exit;
 	}
@@ -409,7 +417,7 @@ static int sabi_command(struct samsung_laptop *samsung, u16 command,
 	}
 
 	if (debug && out) {
-		pr_info("SABI {0x%08x, 0x%08x, 0x%04x, 0x%02x}",
+		pr_info("SABI return data:{0x%08x, 0x%08x, 0x%04x, 0x%02x}",
 			out->d0, out->d1, out->d2, out->d3);
 	}
 
@@ -1370,6 +1378,9 @@ static int __init samsung_sabi_init(struct samsung_laptop *samsung)
 	if (samsung->handle_backlight)
 		check_for_stepping_quirk(samsung);
 
+	pr_info("detected SABI interface: %s\n",
+		samsung->config->test_string);
+
 exit:
 	if (ret)
 		samsung_sabi_exit(samsung);
-- 
1.7.5.4
