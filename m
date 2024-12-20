Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19BD1A8402;
	Fri, 20 Dec 2024 10:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734690171; cv=none; b=CZ/xXnsqZX6WZprHTxjdIy3EcVSC0A4SVXRvzY5B4RFOInq1eOF6b/gd+MXBr1gTRnZnq4PxJ3BYk2Px+Un+zxKEGvgfN6CPe82TM4cTpXG0L4aEPGvX8cmRpn2d7wjgTmTKwRGE6KrrfCEFs9967I2Ucvijeee+301MDbw7A10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734690171; c=relaxed/simple;
	bh=0W9xOjMhKQKFoC4AGcCogY2G8JtaTZwp8VwgCs2PVHA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l1uc6dBQyRZDdv6PWz8yM426+oRUtNUurb1+AC4hOFtVJvSh2iT3NSgylVAVdo5FnTcQGgmO31aBwdXqEOlomySZrMm07Pxcj9Lu7lIhqY6YkxN6EU3lEMi3qeswXUJpIGDtgh55zSG+q31HUGTmx2uXAFWogQjKXx9MbmGg24Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=lJaGztQA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lZ7kh9em; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=lJaGztQA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lZ7kh9em; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="lJaGztQA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lZ7kh9em";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="lJaGztQA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lZ7kh9em"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id BDD962115C;
	Fri, 20 Dec 2024 10:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1734690166; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CRweNnxSNQpHzZ+N44A7dmnRzpwOn4qjl5JmsqijqFU=;
	b=lJaGztQAw3702Z7ml8HTzZRqE/pJhapyc3ZgeksSNJLVr+/HJpnAbsw0lKuiNnoynfEKN3
	NnyIp1eLFmNyp2qMK5NFRSZHy3S9K3G989pYWOAnuukyGrtrB8GzdqeeZ4QVrTw96woTTA
	9kMd97ZLrP9wYWPy8imc4cnJfH+4ZI4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1734690166;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CRweNnxSNQpHzZ+N44A7dmnRzpwOn4qjl5JmsqijqFU=;
	b=lZ7kh9emQAm1CoEL8dP/MjErF4H3+OwX4UyffG/j+tw2uybK+pQVmG9BC1lyCp0KP3cFlN
	EWEWmAx8j2o6YMCg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=lJaGztQA;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=lZ7kh9em
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1734690166; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CRweNnxSNQpHzZ+N44A7dmnRzpwOn4qjl5JmsqijqFU=;
	b=lJaGztQAw3702Z7ml8HTzZRqE/pJhapyc3ZgeksSNJLVr+/HJpnAbsw0lKuiNnoynfEKN3
	NnyIp1eLFmNyp2qMK5NFRSZHy3S9K3G989pYWOAnuukyGrtrB8GzdqeeZ4QVrTw96woTTA
	9kMd97ZLrP9wYWPy8imc4cnJfH+4ZI4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1734690166;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CRweNnxSNQpHzZ+N44A7dmnRzpwOn4qjl5JmsqijqFU=;
	b=lZ7kh9emQAm1CoEL8dP/MjErF4H3+OwX4UyffG/j+tw2uybK+pQVmG9BC1lyCp0KP3cFlN
	EWEWmAx8j2o6YMCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2C3F913ACA;
	Fri, 20 Dec 2024 10:22:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 9pUQB3VFZWevBQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 20 Dec 2024 10:22:45 +0000
Date: Fri, 20 Dec 2024 11:22:40 +0100
Message-ID: <87v7veu00f.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jackie Dong <xy-jackie@139.com>
Cc: ike.pan@canonical.com,
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
	rf@opensource.cirrus.com,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-sound@vger.kernel.org,
	mpearson-lenovo@squebb.ca,
	waterflowdeg@gmail.com,
	Jackie Dong <dongeg1@lenovo.com>
Subject: Re: [PATCH 2/2] ALSA : hda : Support for Ideapad hotkey mute LEDs
In-Reply-To: <20241219101531.35896-2-xy-jackie@139.com>
References: <20241219101531.35896-1-xy-jackie@139.com>
	<20241219101531.35896-2-xy-jackie@139.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: BDD962115C
X-Spam-Score: -2.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[139.com];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[139.com,gmail.com];
	FREEMAIL_CC(0.00)[canonical.com,redhat.com,linux.intel.com,perex.cz,suse.com,senarytech.com,altlinux.org,oldherl.one,gmail.com,tuxedo.de,kylinos.cn,realtek.com,opensource.cirrus.com,joshuagrisham.com,vger.kernel.org,squebb.ca,lenovo.com];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Thu, 19 Dec 2024 11:15:31 +0100,
Jackie Dong wrote:
> 
> New ideapad helper file with support for handling FN key mute LEDS.
> Update conexant and realtec codec to add LED support.
> 
> Suggested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> Signed-off-by: Jackie Dong  <xy-jackie@139.com>
> Signed-off-by: Jackie Dong  <dongeg1@lenovo.com>
> ---
>  sound/pci/hda/ideapad_hotkey_led_helper.c | 36 +++++++++++++++++++++++
>  sound/pci/hda/patch_conexant.c            | 10 +++++++
>  sound/pci/hda/patch_realtek.c             | 20 +++++++++++++
>  3 files changed, 66 insertions(+)
>  create mode 100644 sound/pci/hda/ideapad_hotkey_led_helper.c
> 
> diff --git a/sound/pci/hda/ideapad_hotkey_led_helper.c b/sound/pci/hda/ideapad_hotkey_led_helper.c
> new file mode 100644
> index 000000000000..e49765304cc0
> --- /dev/null
> +++ b/sound/pci/hda/ideapad_hotkey_led_helper.c
> @@ -0,0 +1,36 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Ideapad helper functions for Lenovo Ideapad LED control,
> + * It should be included from codec driver.
> + */
> +
> +#if IS_ENABLED(CONFIG_IDEAPAD_LAPTOP)
> +
> +#include <linux/acpi.h>
> +#include <linux/leds.h>
> +
> +static bool is_ideapad(struct hda_codec *codec)
> +{
> +	return (codec->core.subsystem_id >> 16 == 0x17aa) &&
> +	       (acpi_dev_found("LHK2019") || acpi_dev_found("VPC2004"));
> +}
> +
> +static void hda_fixup_ideapad_acpi(struct hda_codec *codec,
> +				   const struct hda_fixup *fix, int action)
> +{
> +	if (action == HDA_FIXUP_ACT_PRE_PROBE) {
> +		if (!is_ideapad(codec))
> +			return;
> +		snd_hda_gen_add_mute_led_cdev(codec, NULL);
> +		snd_hda_gen_add_micmute_led_cdev(codec, NULL);
> +	}
> +}
> +
> +#else /* CONFIG_IDEAPAD_LAPTOP */
> +
> +static void hda_fixup_ideapad_acpi(struct hda_codec *codec,
> +				   const struct hda_fixup *fix, int action)
> +{
> +}
> +
> +#endif /* CONFIG_IDEAPAD_LAPTOP */
> diff --git a/sound/pci/hda/patch_conexant.c b/sound/pci/hda/patch_conexant.c
> index 538c37a78a56..127f9a9565c9 100644
> --- a/sound/pci/hda/patch_conexant.c
> +++ b/sound/pci/hda/patch_conexant.c
> @@ -291,6 +291,7 @@ enum {
>  	CXT_FIXUP_GPIO1,
>  	CXT_FIXUP_ASPIRE_DMIC,
>  	CXT_FIXUP_THINKPAD_ACPI,
> +	CXT_FIXUP_IDEAPAD_ACPI,
>  	CXT_FIXUP_OLPC_XO,
>  	CXT_FIXUP_CAP_MIX_AMP,
>  	CXT_FIXUP_TOSHIBA_P105,
> @@ -313,6 +314,9 @@ enum {
>  /* for hda_fixup_thinkpad_acpi() */
>  #include "thinkpad_helper.c"
>  
> +/* for hda_fixup_ideapad_acpi() */
> +#include "ideapad_hotkey_led_helper.c"
> +
>  static void cxt_fixup_stereo_dmic(struct hda_codec *codec,
>  				  const struct hda_fixup *fix, int action)
>  {
> @@ -928,6 +932,10 @@ static const struct hda_fixup cxt_fixups[] = {
>  		.type = HDA_FIXUP_FUNC,
>  		.v.func = hda_fixup_thinkpad_acpi,
>  	},
> +	[CXT_FIXUP_IDEAPAD_ACPI] = {
> +		.type = HDA_FIXUP_FUNC,
> +		.v.func = hda_fixup_ideapad_acpi,
> +	},
>  	[CXT_FIXUP_OLPC_XO] = {
>  		.type = HDA_FIXUP_FUNC,
>  		.v.func = cxt_fixup_olpc_xo,
> @@ -1120,6 +1128,7 @@ static const struct hda_quirk cxt5066_fixups[] = {
>  	SND_PCI_QUIRK(0x17aa, 0x3978, "Lenovo G50-70", CXT_FIXUP_STEREO_DMIC),
>  	SND_PCI_QUIRK(0x17aa, 0x397b, "Lenovo S205", CXT_FIXUP_STEREO_DMIC),
>  	SND_PCI_QUIRK_VENDOR(0x17aa, "Thinkpad", CXT_FIXUP_THINKPAD_ACPI),
> +	SND_PCI_QUIRK_VENDOR(0x17aa, "IdeaPad", CXT_FIXUP_IDEAPAD_ACPI),

I'm afraid that this doesn't work.  The former entry with the vendor
17aa already hits and it's used as the matched quirk.

You'd need to create a chained quirk entry instead.

>  	SND_PCI_QUIRK(0x1c06, 0x2011, "Lemote A1004", CXT_PINCFG_LEMOTE_A1004),
>  	SND_PCI_QUIRK(0x1c06, 0x2012, "Lemote A1205", CXT_PINCFG_LEMOTE_A1205),
>  	HDA_CODEC_QUIRK(0x2782, 0x12c3, "Sirius Gen1", CXT_PINCFG_TOP_SPEAKER),
> @@ -1133,6 +1142,7 @@ static const struct hda_model_fixup cxt5066_fixup_models[] = {
>  	{ .id = CXT_FIXUP_HEADPHONE_MIC_PIN, .name = "headphone-mic-pin" },
>  	{ .id = CXT_PINCFG_LENOVO_TP410, .name = "tp410" },
>  	{ .id = CXT_FIXUP_THINKPAD_ACPI, .name = "thinkpad" },
> +	{ .id = CXT_FIXUP_IDEAPAD_ACPI, .name = "ideapad" },
>  	{ .id = CXT_PINCFG_LEMOTE_A1004, .name = "lemote-a1004" },
>  	{ .id = CXT_PINCFG_LEMOTE_A1205, .name = "lemote-a1205" },
>  	{ .id = CXT_FIXUP_OLPC_XO, .name = "olpc-xo" },
> diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
> index 61ba5dc35b8b..3b82be7469a8 100644
> --- a/sound/pci/hda/patch_realtek.c
> +++ b/sound/pci/hda/patch_realtek.c
> @@ -6934,6 +6934,16 @@ static void alc_fixup_thinkpad_acpi(struct hda_codec *codec,
>  	hda_fixup_thinkpad_acpi(codec, fix, action);
>  }
>  
> +/* for hda_fixup_ideapad_acpi() */
> +#include "ideapad_hotkey_led_helper.c"
> +
> +static void alc_fixup_ideapad_acpi(struct hda_codec *codec,
> +				   const struct hda_fixup *fix, int action)
> +{
> +	alc_fixup_no_shutup(codec, fix, action); /* reduce click noise */
> +	hda_fixup_ideapad_acpi(codec, fix, action);
> +}
> +
>  /* Fixup for Lenovo Legion 15IMHg05 speaker output on headset removal. */
>  static void alc287_fixup_legion_15imhg05_speakers(struct hda_codec *codec,
>  						  const struct hda_fixup *fix,
> @@ -7556,6 +7566,7 @@ enum {
>  	ALC290_FIXUP_SUBWOOFER,
>  	ALC290_FIXUP_SUBWOOFER_HSJACK,
>  	ALC269_FIXUP_THINKPAD_ACPI,
> +	ALC269_FIXUP_IDEAPAD_ACPI,
>  	ALC269_FIXUP_DMIC_THINKPAD_ACPI,
>  	ALC269VB_FIXUP_INFINIX_ZERO_BOOK_13,
>  	ALC269VC_FIXUP_INFINIX_Y4_MAX,
> @@ -8327,6 +8338,12 @@ static const struct hda_fixup alc269_fixups[] = {
>  		.chained = true,
>  		.chain_id = ALC269_FIXUP_SKU_IGNORE,
>  	},
> +	[ALC269_FIXUP_IDEAPAD_ACPI] = {
> +		.type = HDA_FIXUP_FUNC,
> +		.v.func = alc_fixup_ideapad_acpi,
> +		.chained = true,
> +		.chain_id = ALC269_FIXUP_SKU_IGNORE,
> +	},
>  	[ALC269_FIXUP_DMIC_THINKPAD_ACPI] = {
>  		.type = HDA_FIXUP_FUNC,
>  		.v.func = alc_fixup_inv_dmic,
> @@ -10897,6 +10914,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
>  	SND_PCI_QUIRK(0x17aa, 0x3880, "Yoga S780-16 pro dual YC", ALC287_FIXUP_TAS2781_I2C),
>  	SND_PCI_QUIRK(0x17aa, 0x3881, "YB9 dual power mode2 YC", ALC287_FIXUP_TAS2781_I2C),
>  	SND_PCI_QUIRK(0x17aa, 0x3882, "Lenovo Yoga Pro 7 14APH8", ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN),
> +	SND_PCI_QUIRK_VENDOR(0x17aa, "IdeaPad", ALC269_FIXUP_IDEAPAD_ACPI),
>  	SND_PCI_QUIRK(0x17aa, 0x3884, "Y780 YG DUAL", ALC287_FIXUP_TAS2781_I2C),
>  	SND_PCI_QUIRK(0x17aa, 0x3886, "Y780 VECO DUAL", ALC287_FIXUP_TAS2781_I2C),
>  	SND_PCI_QUIRK(0x17aa, 0x3891, "Lenovo Yoga Pro 7 14AHP9", ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN),

Also, this doesn't look right.  The vendor match should be put after
all Lenovo entries.  I guess the similar chained quirk is needed like
for Conexant.


thanks,

Takashi
