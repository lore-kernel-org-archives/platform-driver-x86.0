Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A2C240235;
	Tue, 14 Jan 2025 07:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736839170; cv=none; b=V+CPLPSEfrrtIXtdVDeAgLeDPDRCG8fMTdFo74vJBX2zBW0Iv5Z88ePibYouddRPnJiPGSucB1HbP76mJbCwf4aFTvLbEEsu7VmrWLSI2AyoFz/NzyTV+3uLojxBGJ7LuRrQ62rMr+mqZJuosXdqyAPjKBmDRlHo+o82MIejG98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736839170; c=relaxed/simple;
	bh=rGaK/SP7+YRqcfyhvr5tiXXegd0mAf18G8EAlxKv85I=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GknLoZbbcOcmEPJ9DOee1eEWC1UcgSroB1Wli5G+MNXwIGq/fqiV3GVcbXH5oRgqSMsh4nAxnr9IoOXwXCb+29dJ5e5aeqV1Am9ydqic1A+NFCgb+GI/eu+5wL8MLZbN/YdSbqJ80T/SsM8BEOCNOdbEV7QI1WXiG1GgWZhyS/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LjGFhcJQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6Sh2eX83; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SDSo/7aH; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=tXTK0Xxs; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LjGFhcJQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6Sh2eX83";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SDSo/7aH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tXTK0Xxs"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 79FAB1F38F;
	Tue, 14 Jan 2025 07:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736839159; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UAPv+kWa1BY3LhoCR5csO+fM7Ale+r5lPfIfcZtDhPU=;
	b=LjGFhcJQFdFWIBU3J9xRI42wwLL8OJ+KdH5cxB/zlMfpokL+dNsLQjTM6ei6P3gPtYXIVH
	0PEp9crRJgZGo/Z/90HQE2y+iT8dOcg7SS9j84Dn3lS4J51loIvP6v/uCJlZr03zgHmE23
	Aws7o+MQAi5tMZv0nuwkGU794B3nZrM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736839159;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UAPv+kWa1BY3LhoCR5csO+fM7Ale+r5lPfIfcZtDhPU=;
	b=6Sh2eX83e6epFkZwbcnmckstsAbM3kRRe4izwsmzeUof2iCzua5Xx+vWh5oy5Uc43ZGcRA
	KWpyHnO6TxksnxBA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736839158; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UAPv+kWa1BY3LhoCR5csO+fM7Ale+r5lPfIfcZtDhPU=;
	b=SDSo/7aHt3BAlc9VgnMjPW2jBQPQO1PYdLeyJIym9rfCCpr8MAycuJEQLvd14d5NjqA8NP
	knlcE+3hUwBSP90W8qldNQF6FhIx5SQItOY/xu0ZR7pZg6JUUWGpVxCf6sWhe56CUvErdI
	mRh8dDuB5+GJeH6TrbL8qBKNysw8TOA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736839158;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UAPv+kWa1BY3LhoCR5csO+fM7Ale+r5lPfIfcZtDhPU=;
	b=tXTK0Xxsu2/GpBeFcfVo54IoEJzRXFAZ8B0MmqEM6f62EkuOnx24lSl9ip6T4QafcdnLRw
	XxTnHU7T9agxVjBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DF61A139CB;
	Tue, 14 Jan 2025 07:19:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id DkDXNPUPhmfdTwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 14 Jan 2025 07:19:17 +0000
Date: Tue, 14 Jan 2025 08:19:17 +0100
Message-ID: <87h661277u.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jackie Dong <xy-jackie@139.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	Jackie EG1 Dong <dongeg1@lenovo.com>,
	"perex@perex.cz" <perex@perex.cz>,
	"tiwai@suse.com" <tiwai@suse.com>,
	"bo.liu@senarytech.com" <bo.liu@senarytech.com>,
	"kovalev@altlinux.org" <kovalev@altlinux.org>,
	"me@oldherl.one" <me@oldherl.one>,
	"jaroslaw.janik@gmail.com" <jaroslaw.janik@gmail.com>,
	"songxiebing@kylinos.cn" <songxiebing@kylinos.cn>,
	"kailang@realtek.com" <kailang@realtek.com>,
	"sbinding@opensource.cirrus.com" <sbinding@opensource.cirrus.com>,
	"simont@opensource.cirrus.com" <simont@opensource.cirrus.com>,
	"josh@joshuagrisham.com" <josh@joshuagrisham.com>,
	"rf@opensource.cirrus.com" <rf@opensource.cirrus.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"mpearson-lenovo@squebb.ca" <mpearson-lenovo@squebb.ca>
Subject: Re: [External] Re: [PATCH v2] ALSA: hda: Support for Ideapad hotkeymute LEDs
In-Reply-To: <b02fbf19-280c-48b0-8853-40139a573d6a@139.com>
References: <20241224083316.20222-1-xy-jackie@139.com>
	<87ikr2dfnc.wl-tiwai@suse.de>
	<SEYPR03MB8067D30F466738C51808461995092@SEYPR03MB8067.apcprd03.prod.outlook.com>
	<87o70oylir.wl-tiwai@suse.de>
	<da1959f2-a30e-45b4-bf64-2d413254d7bc@139.com>
	<b02fbf19-280c-48b0-8853-40139a573d6a@139.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TAGGED_RCPT(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[139.com,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.de,lenovo.com,perex.cz,suse.com,senarytech.com,altlinux.org,oldherl.one,gmail.com,kylinos.cn,realtek.com,opensource.cirrus.com,joshuagrisham.com,vger.kernel.org,squebb.ca];
	FREEMAIL_TO(0.00)[139.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Score: -1.80
X-Spam-Flag: NO

On Tue, 14 Jan 2025 07:54:01 +0100,
Jackie Dong wrote:
> 
> On 1/6/25 20:49, Jackie Dong wrote:
> > On 2025/1/3 23:17, Takashi Iwai wrote:
> >> On Mon, 30 Dec 2024 01:33:01 +0100,
> >> Jackie EG1 Dong wrote:
> >>> 
> >>>> On Tue, 24 Dec 2024 09:33:16 +0100,
> >>>   > Jackie Dong wrote:
> >>>   >>
> >>>   >> --- a/sound/pci/hda/patch_realtek.c
> >>>   >> +++ b/sound/pci/hda/patch_realtek.c
> >>>   >> @@ -6934,6 +6934,16 @@ static void
> >>> alc_fixup_thinkpad_acpi(struct hda_codec *codec,
> >>>   >>       hda_fixup_thinkpad_acpi(codec, fix, action);
> >>>   >>   }
> >>>   >>
> >>>   >> +/* for hda_fixup_ideapad_acpi() */
> >>>   >> +#include "ideapad_hotkey_led_helper.c"
> >>>   >> +
> >>>   >> +static void alc_fixup_ideapad_acpi(struct hda_codec *codec,
> >>>   >> +                   const struct hda_fixup *fix, int action)
> >>>   >> +{
> >>>   >> +    alc_fixup_no_shutup(codec, fix, action); /* reduce click
> >>> noise */
> >>>   >> +    hda_fixup_ideapad_acpi(codec, fix, action);
> >>>   >> +}
> >>>   >
> >>>   > So this unconditionally call alc_fixup_no_shutup(), and this 
> >>> > introduces another behavior to the existing entry -- i.e. there
> >>> is a  > chance of breakage.
> >>>   >
> >>>   > If we want to be very conservative, this call should be
> >>> limited to  > Ideapad.
> >>>   > For alc_fixup_no_shutup(codec, fix, action),
> >>>   I want to keep same behavior with alc_fixup_thinkpad_apci() and
> >>> alc_fixup_idea_acpi() for one sound card. So, I add
> >>> alc_fixup_no_shutup() in alc_fixup_ideapad_acpi().
> >>> ----------Related source code of patch_reatek.c are FYR as below.
> >>> static void alc_fixup_thinkpad_acpi(struct hda_codec *codec,
> >>>                                       const struct hda_fixup *fix, int
> >>> action)
> >>> {
> >>>           alc_fixup_no_shutup(codec, fix, action); /* reduce click
> >>> noise */
> >>>           hda_fixup_thinkpad_acpi(codec, fix, action); }
> >>> 
> >>> /* for hda_fixup_ideapad_acpi() */
> >>> #include "ideapad_hotkey_led_helper.c"
> >>> 
> >>> static void alc_fixup_ideapad_acpi(struct hda_codec *codec,
> >>>                                      const struct hda_fixup *fix,
> >>> int action) {
> >>>           alc_fixup_no_shutup(codec, fix, action); /* reduce click
> >>> noise */
> >>>           hda_fixup_ideapad_acpi(codec, fix, action);
> >>> }
> >> 
> >> Oh yeah, but then it can be bad in other way round; the chain call of
> >> alc_fixup_thinkpad_acpi() contains alc_fixup_no_shutup() and the
> >> alc_fixup_ideadpad_acpi() also contains alc_fixup_no_shutup().
> >> That is, alc_fixup_no_shutup() will be called twice for Thinkpad.
> >> 
> > Many thanks to Takashi for your detail comments  and sample code, I
> > understand it now.
> > 
> > I'll check the logic of the code and update the patch later.
> > 
> > Best Regards,
> > 
> > Jackie Dong
> 
> Hi Takashi,
>   For this function, I added three debug message in patch_realtek.c as
> below. I find alc_fixup_no_shutup() only run once, no matter it's in
> alc_fixup_thinkpad_acpi(), or it's in alc_fixup_ideadpad_acpi(). Some
> kernel log for your reference.
>   So, I think the patch is ok for this concern.
>   If you have any other concern for the patch, let me know.
>   Thanks for your comment and guide in past.

That's really weird.  Are you testing your v2 patch, right?
(That is, the ALC269_FIXUP_LENOVO_XPAD_ACPI entry calls
alc_fixup_ideadpad_acpi() and is chained with
ALC269_FIXUP_THINKPAD_ACPI.  If this entry is really used, it *must*
call the alc_fixup_thinkpad_acpi() as well.

Please double-check.


Takashi
