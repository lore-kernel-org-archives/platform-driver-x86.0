From: Mathias Krause <minipli@googlemail.com>
Subject: [PATCH 15/15] thinkpad_acpi: Mark volume_alsa_control_{vol,mute} as __initdata
Date: Wed, 16 Jul 2014 19:43:17 +0200
Message-ID: <1405532597-28262-16-git-send-email-minipli@googlemail.com>
References: <1405532597-28262-1-git-send-email-minipli@googlemail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-we0-f174.google.com ([74.125.82.174]:46037 "EHLO
	mail-we0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965508AbaGPRnw (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 16 Jul 2014 13:43:52 -0400
Received: by mail-we0-f174.google.com with SMTP id x48so1309614wes.33
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Jul 2014 10:43:50 -0700 (PDT)
In-Reply-To: <1405532597-28262-1-git-send-email-minipli@googlemail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <matthew.garrett@nebula.com>
Cc: platform-driver-x86@vger.kernel.org, Mathias Krause <minipli@googlemail.com>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>

Mark volume_alsa_control_vol and volume_alsa_control_mute as __initdata,
as snd_ctl_new1() will copy the relevant parts, so there is no need to
keep the master copies around after initialization.

Signed-off-by: Mathias Krause <minipli@googlemail.com>
Cc: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>
---
 drivers/platform/x86/thinkpad_acpi.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index d82f196e3c..0f48cade28 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -6860,7 +6860,7 @@ static int volume_alsa_mute_put(struct snd_kcontrol *kcontrol,
 	return volume_alsa_set_mute(!ucontrol->value.integer.value[0]);
 }
 
-static struct snd_kcontrol_new volume_alsa_control_vol = {
+static struct snd_kcontrol_new volume_alsa_control_vol __initdata = {
 	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 	.name = "Console Playback Volume",
 	.index = 0,
@@ -6869,7 +6869,7 @@ static struct snd_kcontrol_new volume_alsa_control_vol = {
 	.get = volume_alsa_vol_get,
 };
 
-static struct snd_kcontrol_new volume_alsa_control_mute = {
+static struct snd_kcontrol_new volume_alsa_control_mute __initdata = {
 	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 	.name = "Console Playback Switch",
 	.index = 0,
-- 
1.7.10.4
