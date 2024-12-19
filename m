Received: from n169-110.mail.139.com (n169-110.mail.139.com [120.232.169.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7461FBCBE;
	Thu, 19 Dec 2024 10:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=120.232.169.110
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734603400; cv=none; b=jdMOYb+eYgGUrsW3ktx3K1eWbA+ojIuV0m2nvEdMyAIpAy8c/zIUo0vgidmFSB1JgGgWEDTTqDbWmni8sPJvMagPlpVC2hnlz5yAJTDbXZTOSQsMI7G12560P3grbVpxqn8e1bfhsfS2hEGDBM/nYy6FeRZLTDY9RIywENv+mvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734603400; c=relaxed/simple;
	bh=Pm0VTH6kBKitCPmJ1H71VWxL6W/JJSFVqyqH5Oxtvik=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RN3i6Owzl9gpr8E2hBcDXlxsDEY2CzG+4thpK39wHSppyycCOLf1GyklzHGGqGHpHUgMHSMYB058FYwGw+SUBqHR83Ltx88maZGBo+3Z7T5fIMKHEMqsxSFugKvHMb8/Zf7y1PNnOZIKFsDkuUBWd6qNopATc7w33E+ZZnDsqKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=139.com; spf=pass smtp.mailfrom=139.com; arc=none smtp.client-ip=120.232.169.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=139.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=139.com
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM:                                                                                        
X-RM-SPAM-FLAG:00000000
Received:from  (unknown[123.114.236.251])
	by rmsmtp-lg-appmail-02-12080 (RichMail) with SMTP id 2f306763f2517c0-1392f;
	Thu, 19 Dec 2024 18:16:28 +0800 (CST)
X-RM-TRANSID:2f306763f2517c0-1392f
From: Jackie Dong <xy-jackie@139.com>
To: ike.pan@canonical.com,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	perex@perex.cz,
	tiwai@suse.com,
	bo.liu@senarytech.com,
	kovalev@altlinux.org,
	me@oldherl.one,
	jaroslaw.janik@gmail.com,
	cs@tuxedo.de,
	songxiebing@kylinos.cn,
	kailang@realtek.com,
	sbinding@opensource.cirrus.com,
	simont@opensource.cirrus.com,
	josh@joshuagrisham.com,
	rf@opensource.cirrus.com
Cc: linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-sound@vger.kernel.org,
	mpearson-lenovo@squebb.ca,
	waterflowdeg@gmail.com,
	Jackie Dong <xy-jackie@139.com>,
	Jackie Dong <dongeg1@lenovo.com>
Subject: [PATCH 2/2] ALSA : hda : Support for Ideapad hotkey mute LEDs
Date: Thu, 19 Dec 2024 18:15:31 +0800
Message-Id: <20241219101531.35896-2-xy-jackie@139.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241219101531.35896-1-xy-jackie@139.com>
References: <20241219101531.35896-1-xy-jackie@139.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

New ideapad helper file with support for handling FN key mute LEDS.
Update conexant and realtec codec to add LED support.

Suggested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Jackie Dong  <xy-jackie@139.com>
Signed-off-by: Jackie Dong  <dongeg1@lenovo.com>
---
 sound/pci/hda/ideapad_hotkey_led_helper.c | 36 +++++++++++++++++++++++
 sound/pci/hda/patch_conexant.c            | 10 +++++++
 sound/pci/hda/patch_realtek.c             | 20 +++++++++++++
 3 files changed, 66 insertions(+)
 create mode 100644 sound/pci/hda/ideapad_hotkey_led_helper.c

diff --git a/sound/pci/hda/ideapad_hotkey_led_helper.c b/sound/pci/hda/ideapad_hotkey_led_helper.c
new file mode 100644
index 000000000000..e49765304cc0
--- /dev/null
+++ b/sound/pci/hda/ideapad_hotkey_led_helper.c
@@ -0,0 +1,36 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Ideapad helper functions for Lenovo Ideapad LED control,
+ * It should be included from codec driver.
+ */
+
+#if IS_ENABLED(CONFIG_IDEAPAD_LAPTOP)
+
+#include <linux/acpi.h>
+#include <linux/leds.h>
+
+static bool is_ideapad(struct hda_codec *codec)
+{
+	return (codec->core.subsystem_id >> 16 == 0x17aa) &&
+	       (acpi_dev_found("LHK2019") || acpi_dev_found("VPC2004"));
+}
+
+static void hda_fixup_ideapad_acpi(struct hda_codec *codec,
+				   const struct hda_fixup *fix, int action)
+{
+	if (action == HDA_FIXUP_ACT_PRE_PROBE) {
+		if (!is_ideapad(codec))
+			return;
+		snd_hda_gen_add_mute_led_cdev(codec, NULL);
+		snd_hda_gen_add_micmute_led_cdev(codec, NULL);
+	}
+}
+
+#else /* CONFIG_IDEAPAD_LAPTOP */
+
+static void hda_fixup_ideapad_acpi(struct hda_codec *codec,
+				   const struct hda_fixup *fix, int action)
+{
+}
+
+#endif /* CONFIG_IDEAPAD_LAPTOP */
diff --git a/sound/pci/hda/patch_conexant.c b/sound/pci/hda/patch_conexant.c
index 538c37a78a56..127f9a9565c9 100644
--- a/sound/pci/hda/patch_conexant.c
+++ b/sound/pci/hda/patch_conexant.c
@@ -291,6 +291,7 @@ enum {
 	CXT_FIXUP_GPIO1,
 	CXT_FIXUP_ASPIRE_DMIC,
 	CXT_FIXUP_THINKPAD_ACPI,
+	CXT_FIXUP_IDEAPAD_ACPI,
 	CXT_FIXUP_OLPC_XO,
 	CXT_FIXUP_CAP_MIX_AMP,
 	CXT_FIXUP_TOSHIBA_P105,
@@ -313,6 +314,9 @@ enum {
 /* for hda_fixup_thinkpad_acpi() */
 #include "thinkpad_helper.c"
 
+/* for hda_fixup_ideapad_acpi() */
+#include "ideapad_hotkey_led_helper.c"
+
 static void cxt_fixup_stereo_dmic(struct hda_codec *codec,
 				  const struct hda_fixup *fix, int action)
 {
@@ -928,6 +932,10 @@ static const struct hda_fixup cxt_fixups[] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = hda_fixup_thinkpad_acpi,
 	},
+	[CXT_FIXUP_IDEAPAD_ACPI] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = hda_fixup_ideapad_acpi,
+	},
 	[CXT_FIXUP_OLPC_XO] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = cxt_fixup_olpc_xo,
@@ -1120,6 +1128,7 @@ static const struct hda_quirk cxt5066_fixups[] = {
 	SND_PCI_QUIRK(0x17aa, 0x3978, "Lenovo G50-70", CXT_FIXUP_STEREO_DMIC),
 	SND_PCI_QUIRK(0x17aa, 0x397b, "Lenovo S205", CXT_FIXUP_STEREO_DMIC),
 	SND_PCI_QUIRK_VENDOR(0x17aa, "Thinkpad", CXT_FIXUP_THINKPAD_ACPI),
+	SND_PCI_QUIRK_VENDOR(0x17aa, "IdeaPad", CXT_FIXUP_IDEAPAD_ACPI),
 	SND_PCI_QUIRK(0x1c06, 0x2011, "Lemote A1004", CXT_PINCFG_LEMOTE_A1004),
 	SND_PCI_QUIRK(0x1c06, 0x2012, "Lemote A1205", CXT_PINCFG_LEMOTE_A1205),
 	HDA_CODEC_QUIRK(0x2782, 0x12c3, "Sirius Gen1", CXT_PINCFG_TOP_SPEAKER),
@@ -1133,6 +1142,7 @@ static const struct hda_model_fixup cxt5066_fixup_models[] = {
 	{ .id = CXT_FIXUP_HEADPHONE_MIC_PIN, .name = "headphone-mic-pin" },
 	{ .id = CXT_PINCFG_LENOVO_TP410, .name = "tp410" },
 	{ .id = CXT_FIXUP_THINKPAD_ACPI, .name = "thinkpad" },
+	{ .id = CXT_FIXUP_IDEAPAD_ACPI, .name = "ideapad" },
 	{ .id = CXT_PINCFG_LEMOTE_A1004, .name = "lemote-a1004" },
 	{ .id = CXT_PINCFG_LEMOTE_A1205, .name = "lemote-a1205" },
 	{ .id = CXT_FIXUP_OLPC_XO, .name = "olpc-xo" },
diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 61ba5dc35b8b..3b82be7469a8 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -6934,6 +6934,16 @@ static void alc_fixup_thinkpad_acpi(struct hda_codec *codec,
 	hda_fixup_thinkpad_acpi(codec, fix, action);
 }
 
+/* for hda_fixup_ideapad_acpi() */
+#include "ideapad_hotkey_led_helper.c"
+
+static void alc_fixup_ideapad_acpi(struct hda_codec *codec,
+				   const struct hda_fixup *fix, int action)
+{
+	alc_fixup_no_shutup(codec, fix, action); /* reduce click noise */
+	hda_fixup_ideapad_acpi(codec, fix, action);
+}
+
 /* Fixup for Lenovo Legion 15IMHg05 speaker output on headset removal. */
 static void alc287_fixup_legion_15imhg05_speakers(struct hda_codec *codec,
 						  const struct hda_fixup *fix,
@@ -7556,6 +7566,7 @@ enum {
 	ALC290_FIXUP_SUBWOOFER,
 	ALC290_FIXUP_SUBWOOFER_HSJACK,
 	ALC269_FIXUP_THINKPAD_ACPI,
+	ALC269_FIXUP_IDEAPAD_ACPI,
 	ALC269_FIXUP_DMIC_THINKPAD_ACPI,
 	ALC269VB_FIXUP_INFINIX_ZERO_BOOK_13,
 	ALC269VC_FIXUP_INFINIX_Y4_MAX,
@@ -8327,6 +8338,12 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC269_FIXUP_SKU_IGNORE,
 	},
+	[ALC269_FIXUP_IDEAPAD_ACPI] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc_fixup_ideapad_acpi,
+		.chained = true,
+		.chain_id = ALC269_FIXUP_SKU_IGNORE,
+	},
 	[ALC269_FIXUP_DMIC_THINKPAD_ACPI] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc_fixup_inv_dmic,
@@ -10897,6 +10914,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x3880, "Yoga S780-16 pro dual YC", ALC287_FIXUP_TAS2781_I2C),
 	SND_PCI_QUIRK(0x17aa, 0x3881, "YB9 dual power mode2 YC", ALC287_FIXUP_TAS2781_I2C),
 	SND_PCI_QUIRK(0x17aa, 0x3882, "Lenovo Yoga Pro 7 14APH8", ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN),
+	SND_PCI_QUIRK_VENDOR(0x17aa, "IdeaPad", ALC269_FIXUP_IDEAPAD_ACPI),
 	SND_PCI_QUIRK(0x17aa, 0x3884, "Y780 YG DUAL", ALC287_FIXUP_TAS2781_I2C),
 	SND_PCI_QUIRK(0x17aa, 0x3886, "Y780 VECO DUAL", ALC287_FIXUP_TAS2781_I2C),
 	SND_PCI_QUIRK(0x17aa, 0x3891, "Lenovo Yoga Pro 7 14AHP9", ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN),
@@ -11130,6 +11148,7 @@ static const struct hda_model_fixup alc269_fixup_models[] = {
 	{.id = ALC290_FIXUP_MONO_SPEAKERS_HSJACK, .name = "mono-speakers"},
 	{.id = ALC290_FIXUP_SUBWOOFER_HSJACK, .name = "alc290-subwoofer"},
 	{.id = ALC269_FIXUP_THINKPAD_ACPI, .name = "thinkpad"},
+	{.id = ALC269_FIXUP_IDEAPAD_ACPI, .name = "ideapad-led"},
 	{.id = ALC269_FIXUP_DMIC_THINKPAD_ACPI, .name = "dmic-thinkpad"},
 	{.id = ALC255_FIXUP_ACER_MIC_NO_PRESENCE, .name = "alc255-acer"},
 	{.id = ALC255_FIXUP_ASUS_MIC_NO_PRESENCE, .name = "alc255-asus"},
-- 
2.34.1


