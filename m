Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D2218F2DA;
	Fri,  3 Jan 2025 15:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735917457; cv=none; b=BmBf9Khzu4GBigZP54TKwt8bXmplSunrYm/x41woou8/nXeTKYHbykikV5xPt8K/XW8hvshEAzn3+DT7SoPiUvMrXS7wMGleuvHvJ+Zgp5NYgnuyT5c2g9a7PPXFXzEi/Rh9WeByN7xP3B6HL6RvMNPLbybXUoGLeCaSMzLu/5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735917457; c=relaxed/simple;
	bh=UOxAQYycBbOxD7Bz9XDKOMo3qyeUBFPCOKHeL9lFAwk=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TroXA9o047DPMtf5levFilI594vlQkAsyZynU+jg8wbzSGtsmQgSJXXHWs1kniuoX+mcqEsiQ/2AfvqPMbh4RY/y2eoSfGSvUcglCLTEbnk5XLmC+xERcsUibG1+cDdvcuWgla0JY5B9GiijyxKEsgmhN9bbAe+8dmcHH8ACbos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gvh1vbtv; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ldKYMD9Q; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mrRhbl3O; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=XnTKFst2; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gvh1vbtv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ldKYMD9Q";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mrRhbl3O";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XnTKFst2"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CBCFA21125;
	Fri,  3 Jan 2025 15:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1735917454; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7icf6JOYDz4z6Er/BW1KQJQ9q+bO9oWZn51sAOUW3C4=;
	b=gvh1vbtv6J3TWISq9CV7IYJKD8vPn29e5nwv8CqQIaxCojOhNVB2FtRh9WkCWNZTkAl8Fx
	eAoPLZeq5AcWOpfmnOnRrxRnWDIECIzMdJtypgy+pAhZ+kEiDD3IK5nCDHXkHP7FRfOMBr
	o9eLwd84Tm3D+MQOLpBb5M2hPx0Qchk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1735917454;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7icf6JOYDz4z6Er/BW1KQJQ9q+bO9oWZn51sAOUW3C4=;
	b=ldKYMD9Q2kL+7gUA4NHMpxzQXe1b91SGyl8A/U1laEHKNsZtFgNU1oRTq4HG9USaChl9Xl
	SV7PWRqSKB4jJUBQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=mrRhbl3O;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=XnTKFst2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1735917453; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7icf6JOYDz4z6Er/BW1KQJQ9q+bO9oWZn51sAOUW3C4=;
	b=mrRhbl3OkL0dVUMo3rwO625FlF5fHwbcd8VmugOkklnEFQE799ZMudcHuL+TSck57LbWFF
	LLng/fE53EQkrgq9sXYwk8dsoKBUgpM0apR05QzQel+LeQpMvEwMvOBl0EwtTLwnjiztAI
	ruvobIj3vp6t64wuctMn26M/NATU19o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1735917453;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7icf6JOYDz4z6Er/BW1KQJQ9q+bO9oWZn51sAOUW3C4=;
	b=XnTKFst2nOPTvk2svd8KXyzxoqE/oURnKibGhwWqtVIY9PV/AbsVxWlJ20V42rjfzwL0DF
	0KOkEVw9iM8zkdDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5850B13418;
	Fri,  3 Jan 2025 15:17:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wTcwFI3/d2cFagAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 03 Jan 2025 15:17:33 +0000
Date: Fri, 03 Jan 2025 16:17:32 +0100
Message-ID: <87o70oylir.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jackie EG1 Dong <dongeg1@lenovo.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	Jackie Dong <xy-jackie@139.com>,
	"perex@perex.cz" <perex@perex.cz>,
	"tiwai@suse.com" <tiwai@suse.com>,
	"bo.liu@senarytech.com" <bo.liu@senarytech.com>,
	"kovalev@altlinux.org"
	<kovalev@altlinux.org>,
	"me@oldherl.one" <me@oldherl.one>,
	"jaroslaw.janik@gmail.com" <jaroslaw.janik@gmail.com>,
	"songxiebing@kylinos.cn" <songxiebing@kylinos.cn>,
	"kailang@realtek.com"
	<kailang@realtek.com>,
	"sbinding@opensource.cirrus.com"
	<sbinding@opensource.cirrus.com>,
	"simont@opensource.cirrus.com"
	<simont@opensource.cirrus.com>,
	"josh@joshuagrisham.com"
	<josh@joshuagrisham.com>,
	"rf@opensource.cirrus.com"
	<rf@opensource.cirrus.com>,
	"linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
	"platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>,
	"linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>,
	"mpearson-lenovo@squebb.ca"
	<mpearson-lenovo@squebb.ca>
Subject: Re: [External] Re: [PATCH v2] ALSA: hda: Support for Ideapad hotkey mute LEDs
In-Reply-To: <SEYPR03MB8067D30F466738C51808461995092@SEYPR03MB8067.apcprd03.prod.outlook.com>
References: <20241224083316.20222-1-xy-jackie@139.com>
	<87ikr2dfnc.wl-tiwai@suse.de>
	<SEYPR03MB8067D30F466738C51808461995092@SEYPR03MB8067.apcprd03.prod.outlook.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: CBCFA21125
X-Spam-Level: 
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_TWELVE(0.00)[19];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[139.com,gmail.com];
	FREEMAIL_CC(0.00)[suse.de,139.com,perex.cz,suse.com,senarytech.com,altlinux.org,oldherl.one,gmail.com,kylinos.cn,realtek.com,opensource.cirrus.com,joshuagrisham.com,vger.kernel.org,squebb.ca];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -2.01
X-Spam-Flag: NO

On Mon, 30 Dec 2024 01:33:01 +0100,
Jackie EG1 Dong wrote:
> 
> > On Tue, 24 Dec 2024 09:33:16 +0100,
>  > Jackie Dong wrote:
>  >>
>  >> --- a/sound/pci/hda/patch_realtek.c
>  >> +++ b/sound/pci/hda/patch_realtek.c
>  >> @@ -6934,6 +6934,16 @@ static void alc_fixup_thinkpad_acpi(struct hda_codec *codec,
>  >>   	hda_fixup_thinkpad_acpi(codec, fix, action);
>  >>   }
>  >>
>  >> +/* for hda_fixup_ideapad_acpi() */
>  >> +#include "ideapad_hotkey_led_helper.c"
>  >> +
>  >> +static void alc_fixup_ideapad_acpi(struct hda_codec *codec,
>  >> +				   const struct hda_fixup *fix, int action)
>  >> +{
>  >> +	alc_fixup_no_shutup(codec, fix, action); /* reduce click noise */
>  >> +	hda_fixup_ideapad_acpi(codec, fix, action);
>  >> +}
>  >
>  > So this unconditionally call alc_fixup_no_shutup(), and this  > introduces another behavior to the existing entry -- i.e. there is a  > chance of breakage.
>  >
>  > If we want to be very conservative, this call should be limited to  > Ideapad.
>  > For alc_fixup_no_shutup(codec, fix, action),
>  I want to keep same behavior with alc_fixup_thinkpad_apci() and alc_fixup_idea_acpi() for one sound card. So, I add alc_fixup_no_shutup() in alc_fixup_ideapad_acpi().
> ----------Related source code of patch_reatek.c are FYR as below.
> static void alc_fixup_thinkpad_acpi(struct hda_codec *codec,
>                                      const struct hda_fixup *fix, int
> action)
> {
>          alc_fixup_no_shutup(codec, fix, action); /* reduce click noise */
>          hda_fixup_thinkpad_acpi(codec, fix, action); }
> 
> /* for hda_fixup_ideapad_acpi() */
> #include "ideapad_hotkey_led_helper.c"
> 
> static void alc_fixup_ideapad_acpi(struct hda_codec *codec,
>                                     const struct hda_fixup *fix, int action) {
>          alc_fixup_no_shutup(codec, fix, action); /* reduce click noise */
>          hda_fixup_ideapad_acpi(codec, fix, action);
> }

Oh yeah, but then it can be bad in other way round; the chain call of
alc_fixup_thinkpad_acpi() contains alc_fixup_no_shutup() and the
alc_fixup_ideadpad_acpi() also contains alc_fixup_no_shutup().
That is, alc_fixup_no_shutup() will be called twice for Thinkpad.

Instead, you can change like:

--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -6925,11 +6925,16 @@ static void alc285_fixup_hp_envy_x360(struct hda_codec *codec,
 /* for hda_fixup_thinkpad_acpi() */
 #include "thinkpad_helper.c"
 
-static void alc_fixup_thinkpad_acpi(struct hda_codec *codec,
-				    const struct hda_fixup *fix, int action)
+/* for hda_fixup_ideapad_acpi() */
+#include "ideapad_hotkey_led_helper.c"
+
+/* generic fixup for both Lenovo Thinkpad and Ideapad */
+static void alc_fixup_xpad_acpi(struct hda_codec *codec,
+				const struct hda_fixup *fix, int action)
 {
 	alc_fixup_no_shutup(codec, fix, action); /* reduce click noise */
 	hda_fixup_thinkpad_acpi(codec, fix, action);
+	hda_fixup_ideapad_acpi(codec, fix, action);
 }
 
 /* Fixup for Lenovo Legion 15IMHg05 speaker output on headset removal. */
@@ -8321,7 +8326,7 @@ static const struct hda_fixup alc269_fixups[] = {
 	},
 	[ALC269_FIXUP_THINKPAD_ACPI] = {
 		.type = HDA_FIXUP_FUNC,
-		.v.func = alc_fixup_thinkpad_acpi,
+		.v.func = alc_fixup_xpad_acpi,
 		.chained = true,
 		.chain_id = ALC269_FIXUP_SKU_IGNORE,
 	},

Since hda_fixup_ideapad_acpi() is NOP except for Ideapad, this
shouldn't break other models, while it covers the Ideadpad now.


thanks,

Takashi
