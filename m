Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91018EEC5;
	Sun, 22 Dec 2024 08:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734857384; cv=none; b=eyQjwmxZnfMu/IQptSOH056NgFnvfgMr4MEqx8uur3aferw/V2OH9M8L8saSV8f474MQjV+QNnRzDMdEefpHZuX0uUIm4lfudDIeW60cFPTRmm2qbKRHSaAIWFxPuNljxBo+GJDmm657nnjZFk0s0tSr0O9LX+XBLeyAi9B2a1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734857384; c=relaxed/simple;
	bh=t9LKB8duX7BHWeimepjRYB4oegPGn5YU7/J5zXPgMVU=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oN1oIFhPcWEN3hsokFcrP6M+WSG0jpukSmHkAPXYqe7F+NCgf/FlIOe//+qyZgjk1rgINICPCWYOAytgayPEmweSX9OMDG0LnpGQLTkXrD9+9qblRWXKeYUvEa3+t/vSeOMbnbRnb3j9qGD31oueoKbTeGp2NLxBdYojTqP5YTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xjIr/dLW; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Xd+h6bSv; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xjIr/dLW; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Xd+h6bSv; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xjIr/dLW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Xd+h6bSv";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xjIr/dLW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Xd+h6bSv"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 040701F37E;
	Sun, 22 Dec 2024 08:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1734857380; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DnHva3XwoFhcr2C3S7vjHvCxv30H7Sh0Zclv4tO3TmY=;
	b=xjIr/dLWwxKaliMegNJ3Wd5DsP/pNad2ieIMJtn8AG3Ya3oGvPxOQhKGZhcaRAanXTlkK6
	G34uNmDU+HJG9M3bPSVswa4PT9U4GpUQY5NE8LDtF2Ru5yUbBwTlNvq/yDl4MTjb7OKJor
	GE2nQiygmvBNBSi04rVp2uG45oPwYcw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1734857380;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DnHva3XwoFhcr2C3S7vjHvCxv30H7Sh0Zclv4tO3TmY=;
	b=Xd+h6bSvVLp5eifHogwK939Y9NUdzfWFG/fYeshVgciSYVkEhI+AxO1sFQmfyufVgkjVjq
	vv/r8rHkoGauRVAA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="xjIr/dLW";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Xd+h6bSv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1734857380; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DnHva3XwoFhcr2C3S7vjHvCxv30H7Sh0Zclv4tO3TmY=;
	b=xjIr/dLWwxKaliMegNJ3Wd5DsP/pNad2ieIMJtn8AG3Ya3oGvPxOQhKGZhcaRAanXTlkK6
	G34uNmDU+HJG9M3bPSVswa4PT9U4GpUQY5NE8LDtF2Ru5yUbBwTlNvq/yDl4MTjb7OKJor
	GE2nQiygmvBNBSi04rVp2uG45oPwYcw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1734857380;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DnHva3XwoFhcr2C3S7vjHvCxv30H7Sh0Zclv4tO3TmY=;
	b=Xd+h6bSvVLp5eifHogwK939Y9NUdzfWFG/fYeshVgciSYVkEhI+AxO1sFQmfyufVgkjVjq
	vv/r8rHkoGauRVAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7BCF913A6D;
	Sun, 22 Dec 2024 08:49:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id BF9GGqLSZ2d0EAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 22 Dec 2024 08:49:38 +0000
Date: Sun, 22 Dec 2024 09:49:22 +0100
Message-ID: <87ed209k6l.wl-tiwai@suse.de>
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
In-Reply-To: <87v7veu00f.wl-tiwai@suse.de>
References: <20241219101531.35896-1-xy-jackie@139.com>
	<20241219101531.35896-2-xy-jackie@139.com>
	<87v7veu00f.wl-tiwai@suse.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 040701F37E
X-Spam-Level: 
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
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_TWELVE(0.00)[23];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_TO(0.00)[139.com];
	FREEMAIL_ENVRCPT(0.00)[139.com,gmail.com];
	FREEMAIL_CC(0.00)[canonical.com,redhat.com,linux.intel.com,perex.cz,suse.com,senarytech.com,altlinux.org,oldherl.one,gmail.com,tuxedo.de,kylinos.cn,realtek.com,opensource.cirrus.com,joshuagrisham.com,vger.kernel.org,squebb.ca,lenovo.com];
	RCVD_COUNT_TWO(0.00)[2];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -2.01
X-Spam-Flag: NO

On Fri, 20 Dec 2024 11:22:40 +0100,
Takashi Iwai wrote:
> 
> On Thu, 19 Dec 2024 11:15:31 +0100,
> Jackie Dong wrote:
> > 
> > New ideapad helper file with support for handling FN key mute LEDS.
> > Update conexant and realtec codec to add LED support.
> > 
> > Suggested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> > Signed-off-by: Jackie Dong  <xy-jackie@139.com>
> > Signed-off-by: Jackie Dong  <dongeg1@lenovo.com>
> > ---
> >  sound/pci/hda/ideapad_hotkey_led_helper.c | 36 +++++++++++++++++++++++
> >  sound/pci/hda/patch_conexant.c            | 10 +++++++
> >  sound/pci/hda/patch_realtek.c             | 20 +++++++++++++
> >  3 files changed, 66 insertions(+)
> >  create mode 100644 sound/pci/hda/ideapad_hotkey_led_helper.c
> > 
> > diff --git a/sound/pci/hda/ideapad_hotkey_led_helper.c b/sound/pci/hda/ideapad_hotkey_led_helper.c
> > new file mode 100644
> > index 000000000000..e49765304cc0
> > --- /dev/null
> > +++ b/sound/pci/hda/ideapad_hotkey_led_helper.c
> > @@ -0,0 +1,36 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Ideapad helper functions for Lenovo Ideapad LED control,
> > + * It should be included from codec driver.
> > + */
> > +
> > +#if IS_ENABLED(CONFIG_IDEAPAD_LAPTOP)
> > +
> > +#include <linux/acpi.h>
> > +#include <linux/leds.h>
> > +
> > +static bool is_ideapad(struct hda_codec *codec)
> > +{
> > +	return (codec->core.subsystem_id >> 16 == 0x17aa) &&
> > +	       (acpi_dev_found("LHK2019") || acpi_dev_found("VPC2004"));
> > +}
> > +
> > +static void hda_fixup_ideapad_acpi(struct hda_codec *codec,
> > +				   const struct hda_fixup *fix, int action)
> > +{
> > +	if (action == HDA_FIXUP_ACT_PRE_PROBE) {
> > +		if (!is_ideapad(codec))
> > +			return;
> > +		snd_hda_gen_add_mute_led_cdev(codec, NULL);
> > +		snd_hda_gen_add_micmute_led_cdev(codec, NULL);
> > +	}
> > +}
> > +
> > +#else /* CONFIG_IDEAPAD_LAPTOP */
> > +
> > +static void hda_fixup_ideapad_acpi(struct hda_codec *codec,
> > +				   const struct hda_fixup *fix, int action)
> > +{
> > +}
> > +
> > +#endif /* CONFIG_IDEAPAD_LAPTOP */
> > diff --git a/sound/pci/hda/patch_conexant.c b/sound/pci/hda/patch_conexant.c
> > index 538c37a78a56..127f9a9565c9 100644
> > --- a/sound/pci/hda/patch_conexant.c
> > +++ b/sound/pci/hda/patch_conexant.c
> > @@ -291,6 +291,7 @@ enum {
> >  	CXT_FIXUP_GPIO1,
> >  	CXT_FIXUP_ASPIRE_DMIC,
> >  	CXT_FIXUP_THINKPAD_ACPI,
> > +	CXT_FIXUP_IDEAPAD_ACPI,
> >  	CXT_FIXUP_OLPC_XO,
> >  	CXT_FIXUP_CAP_MIX_AMP,
> >  	CXT_FIXUP_TOSHIBA_P105,
> > @@ -313,6 +314,9 @@ enum {
> >  /* for hda_fixup_thinkpad_acpi() */
> >  #include "thinkpad_helper.c"
> >  
> > +/* for hda_fixup_ideapad_acpi() */
> > +#include "ideapad_hotkey_led_helper.c"
> > +
> >  static void cxt_fixup_stereo_dmic(struct hda_codec *codec,
> >  				  const struct hda_fixup *fix, int action)
> >  {
> > @@ -928,6 +932,10 @@ static const struct hda_fixup cxt_fixups[] = {
> >  		.type = HDA_FIXUP_FUNC,
> >  		.v.func = hda_fixup_thinkpad_acpi,
> >  	},
> > +	[CXT_FIXUP_IDEAPAD_ACPI] = {
> > +		.type = HDA_FIXUP_FUNC,
> > +		.v.func = hda_fixup_ideapad_acpi,
> > +	},
> >  	[CXT_FIXUP_OLPC_XO] = {
> >  		.type = HDA_FIXUP_FUNC,
> >  		.v.func = cxt_fixup_olpc_xo,
> > @@ -1120,6 +1128,7 @@ static const struct hda_quirk cxt5066_fixups[] = {
> >  	SND_PCI_QUIRK(0x17aa, 0x3978, "Lenovo G50-70", CXT_FIXUP_STEREO_DMIC),
> >  	SND_PCI_QUIRK(0x17aa, 0x397b, "Lenovo S205", CXT_FIXUP_STEREO_DMIC),
> >  	SND_PCI_QUIRK_VENDOR(0x17aa, "Thinkpad", CXT_FIXUP_THINKPAD_ACPI),
> > +	SND_PCI_QUIRK_VENDOR(0x17aa, "IdeaPad", CXT_FIXUP_IDEAPAD_ACPI),
> 
> I'm afraid that this doesn't work.  The former entry with the vendor
> 17aa already hits and it's used as the matched quirk.
> 
> You'd need to create a chained quirk entry instead.

That is, add a new enum CXT_FIXUP_LENOVO_XPAD_ACPI, and define an
entry like:

	[CXT_FIXUP_LENOVO_XPAD_ACPI] = {
		.type = HDA_FIXUP_FUNC,
		.v.func = hda_fixup_ideapad_acpi,
		.chained = true,
		.chain_id = ALC269_FIXUP_THINKPAD_ACPI,
	},

then replace the line
 	SND_PCI_QUIRK_VENDOR(0x17aa, "Thinkpad", CXT_FIXUP_THINKPAD_ACPI),
with
 	SND_PCI_QUIRK_VENDOR(0x17aa, "Thinkpad/Ideapad", CXT_FIXUP_LENOVO_XPAD_ACPI),

Care to rewrite the patch in that way, and resubmit v2 patch?


thanks,

Takashi
