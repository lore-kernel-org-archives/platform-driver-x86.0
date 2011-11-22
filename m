From: Corentin Chary <corentincj@iksaif.net>
Subject: [PATCH 14/15] samsung-laptop: dump model and version informations
Date: Tue, 22 Nov 2011 23:02:45 +0100
Message-ID: <1321999366-23784-15-git-send-email-corentincj@iksaif.net>
References: <1321999366-23784-1-git-send-email-corentincj@iksaif.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1321999366-23784-1-git-send-email-corentincj@iksaif.net>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Corentin Chary <corentincj@iksaif.net>, Matthew Garrett <mjg@redhat.com>, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

We still need to figure out exactly what each of different fields
represent, but they contain at least model and version informatiosn.

Signed-off-by: Corentin Chary <corentincj@iksaif.net>
---
 drivers/platform/x86/samsung-laptop.c |   32 ++++++++++++++++++++++++++++++++
 1 files changed, 32 insertions(+), 0 deletions(-)

diff --git a/drivers/platform/x86/samsung-laptop.c b/drivers/platform/x86/samsung-laptop.c
index 9940525..c03a466 100644
--- a/drivers/platform/x86/samsung-laptop.c
+++ b/drivers/platform/x86/samsung-laptop.c
@@ -326,6 +326,8 @@ struct samsung_laptop {
 
 	bool handle_backlight;
 	bool has_stepping_quirk;
+
+	char sdiag[64];
 };
 
 
@@ -1239,6 +1241,34 @@ static __init void samsung_sabi_infos(struct samsung_laptop *samsung, int loca,
 	printk(KERN_DEBUG " SABI pointer = 0x%08x\n", ifaceP);
 }
 
+static void __init samsung_sabi_diag(struct samsung_laptop *samsung)
+{
+	int loca = find_signature(samsung->f0000_segment, "SDiaG@");
+	int i;
+
+	if (loca == 0xffff)
+		return ;
+
+	/* Example:
+	 * Ident: @SDiaG@686XX-N90X3A/966-SEC-07HL-S90X3A
+	 *
+	 * Product name: 90X3A
+	 * BIOS Version: 07HL
+	 */
+	loca += 1;
+	for (i = 0; loca < 0xffff && i < sizeof(samsung->sdiag) - 1; loca++) {
+		char temp = readb(samsung->f0000_segment + loca);
+
+		if (isalnum(temp) || temp == '/' || temp == '-')
+			samsung->sdiag[i++] = temp;
+		else
+			break ;
+	}
+
+	if (samsung->sdiag[0])
+		pr_info("sdiag: %s", samsung->sdiag);
+}
+
 static int __init samsung_sabi_init(struct samsung_laptop *samsung)
 {
 	const struct sabi_config *config = NULL;
@@ -1256,6 +1286,8 @@ static int __init samsung_sabi_init(struct samsung_laptop *samsung)
 		goto exit;
 	}
 
+	samsung_sabi_diag(samsung);
+
 	/* Try to find one of the signatures in memory to find the header */
 	for (i = 0; sabi_configs[i].test_string != 0; ++i) {
 		samsung->config = &sabi_configs[i];
-- 
1.7.5.4
