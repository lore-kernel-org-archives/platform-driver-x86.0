From: Bill Pemberton <wfp5p@virginia.edu>
Subject: [PATCH 330/493] platform/x86: remove use of __devinitdata
Date: Mon, 19 Nov 2012 13:24:39 -0500
Message-ID: <1353349642-3677-330-git-send-email-wfp5p@virginia.edu>
References: <1353349642-3677-1-git-send-email-wfp5p@virginia.edu>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from viridian.itc.Virginia.EDU ([128.143.12.139]:41474 "EHLO
	viridian.itc.virginia.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754087Ab2KSSea (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 19 Nov 2012 13:34:30 -0500
In-Reply-To: <1353349642-3677-1-git-send-email-wfp5p@virginia.edu>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: gregkh@linuxfoundation.org
Cc: Joey Lee <jlee@novell.com>, Matthew Garrett <mjg@redhat.com>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net

CONFIG_HOTPLUG is going away as an option so __devinitdata is no
longer needed.

Signed-off-by: Bill Pemberton <wfp5p@virginia.edu>
Cc: Joey Lee <jlee@novell.com> 
Cc: Matthew Garrett <mjg@redhat.com> 
Cc: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br> 
Cc: platform-driver-x86@vger.kernel.org 
Cc: ibm-acpi-devel@lists.sourceforge.net 
---
 drivers/platform/x86/acer-wmi.c      | 2 +-
 drivers/platform/x86/dell-laptop.c   | 2 +-
 drivers/platform/x86/thinkpad_acpi.c | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index aa68a96..06f4eb7 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -335,7 +335,7 @@ static struct quirk_entry quirk_lenovo_ideapad_s205 = {
 };
 
 /* The Aspire One has a dummy ACPI-WMI interface - disable it */
-static struct dmi_system_id __devinitdata acer_blacklist[] = {
+static struct dmi_system_id acer_blacklist[] = {
 	{
 		.ident = "Acer Aspire One (SSD)",
 		.matches = {
diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
index f6b50a0..fa3ee62 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -115,7 +115,7 @@ static const struct dmi_system_id dell_device_table[] __initconst = {
 };
 MODULE_DEVICE_TABLE(dmi, dell_device_table);
 
-static struct dmi_system_id __devinitdata dell_quirks[] = {
+static struct dmi_system_id dell_quirks[] = {
 	{
 		.callback = dmi_matched,
 		.ident = "Dell Vostro V130",
diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 75dd651..f946ca7 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -6732,7 +6732,7 @@ static int volume_alsa_mute_put(struct snd_kcontrol *kcontrol,
 	return volume_alsa_set_mute(!ucontrol->value.integer.value[0]);
 }
 
-static struct snd_kcontrol_new volume_alsa_control_vol __devinitdata = {
+static struct snd_kcontrol_new volume_alsa_control_vol = {
 	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 	.name = "Console Playback Volume",
 	.index = 0,
@@ -6741,7 +6741,7 @@ static struct snd_kcontrol_new volume_alsa_control_vol __devinitdata = {
 	.get = volume_alsa_vol_get,
 };
 
-static struct snd_kcontrol_new volume_alsa_control_mute __devinitdata = {
+static struct snd_kcontrol_new volume_alsa_control_mute = {
 	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 	.name = "Console Playback Switch",
 	.index = 0,
-- 
1.8.0
