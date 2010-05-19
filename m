From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: [PATCH 08/14] thinkpad-acpi: disclose usertask for ALSA callbacks
Date: Wed, 19 May 2010 00:26:18 -0300
Message-ID: <1274239584-17743-9-git-send-email-hmh@hmh.eng.br>
References: <1274239584-17743-1-git-send-email-hmh@hmh.eng.br>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out3.smtp.messagingengine.com ([66.111.4.27]:44239 "EHLO
	out3.smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1756050Ab0ESD0h (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 18 May 2010 23:26:37 -0400
In-Reply-To: <1274239584-17743-1-git-send-email-hmh@hmh.eng.br>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net, Henrique de Moraes Holschuh <hmh@hmh.eng.br>

Disclose the user task doing ALSA access when requested by
the debug bitmask.

Signed-off-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
---
 drivers/platform/x86/thinkpad_acpi.c |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index fa412a4..b03cb3e 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -6740,6 +6740,8 @@ static int volume_alsa_vol_get(struct snd_kcontrol *kcontrol,
 static int volume_alsa_vol_put(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
+	tpacpi_disclose_usertask("ALSA", "set volume to %ld\n",
+				 ucontrol->value.integer.value[0]);
 	return volume_alsa_set_volume(ucontrol->value.integer.value[0]);
 }
 
@@ -6763,6 +6765,9 @@ static int volume_alsa_mute_get(struct snd_kcontrol *kcontrol,
 static int volume_alsa_mute_put(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
+	tpacpi_disclose_usertask("ALSA", "%smute\n",
+				 ucontrol->value.integer.value[0] ?
+					"un" : "");
 	return volume_alsa_set_mute(!ucontrol->value.integer.value[0]);
 }
 
-- 
1.7.1

