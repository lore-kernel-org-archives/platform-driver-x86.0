From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [PATCH 15/15] thinkpad_acpi: Mark volume_alsa_control_{vol,mute}
 as __initdata
Date: Wed, 16 Jul 2014 16:03:54 -0300
Message-ID: <20140716190354.GA19382@khazad-dum.debian.net>
References: <1405532597-28262-1-git-send-email-minipli@googlemail.com>
 <1405532597-28262-16-git-send-email-minipli@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:46569 "EHLO
	out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S934924AbaGPTEG (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 16 Jul 2014 15:04:06 -0400
Received: from compute6.internal (compute6.nyi.mail.srv.osa [10.202.2.46])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id 3554C20EA5
	for <platform-driver-x86@vger.kernel.org>; Wed, 16 Jul 2014 15:04:00 -0400 (EDT)
Content-Disposition: inline
In-Reply-To: <1405532597-28262-16-git-send-email-minipli@googlemail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mathias Krause <minipli@googlemail.com>
Cc: Matthew Garrett <matthew.garrett@nebula.com>, platform-driver-x86@vger.kernel.org, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>

On Wed, 16 Jul 2014, Mathias Krause wrote:
> Mark volume_alsa_control_vol and volume_alsa_control_mute as __initdata,
> as snd_ctl_new1() will copy the relevant parts, so there is no need to
> keep the master copies around after initialization.
> 
> Signed-off-by: Mathias Krause <minipli@googlemail.com>
> Cc: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>

Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>

> ---
>  drivers/platform/x86/thinkpad_acpi.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index d82f196e3c..0f48cade28 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -6860,7 +6860,7 @@ static int volume_alsa_mute_put(struct snd_kcontrol *kcontrol,
>  	return volume_alsa_set_mute(!ucontrol->value.integer.value[0]);
>  }
>  
> -static struct snd_kcontrol_new volume_alsa_control_vol = {
> +static struct snd_kcontrol_new volume_alsa_control_vol __initdata = {
>  	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
>  	.name = "Console Playback Volume",
>  	.index = 0,
> @@ -6869,7 +6869,7 @@ static struct snd_kcontrol_new volume_alsa_control_vol = {
>  	.get = volume_alsa_vol_get,
>  };
>  
> -static struct snd_kcontrol_new volume_alsa_control_mute = {
> +static struct snd_kcontrol_new volume_alsa_control_mute __initdata = {
>  	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
>  	.name = "Console Playback Switch",
>  	.index = 0,

-- 
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh
