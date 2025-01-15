Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8DB1917E9;
	Wed, 15 Jan 2025 16:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736956835; cv=none; b=EnLBSJFeWG3pth10bKM5wNhxpoIGlFUshbAVngO/LkdYH7xEckQ5XAQpK5bm+V1f+BrCZgUXYGcl0N/y533GM9JArwbLySAX14kPhToZfUsSj46RHUhQYpuS4tdeLzHgq+V3QNX1S2Q4lhTKiDwaHGHAFCIv/CTVcWr5YVOQQ7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736956835; c=relaxed/simple;
	bh=Kd3Z9CDvRwrJz7Gie0mODi+xXsqkl3MWO8TpbUNo5HM=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y8RfAIdcYEDz//MhsjZMTv4zdUdfItmYOfW6E5YCQ7pMbSUrYvOtvE6NahmT/r41flhKj7KJ8ca0/r8PQPjLHpp4+DkdjMJISUD3HhDPa4pt+8Lz4YjI67pxbbHfkvzgqkO6W3hjdahpRdPCiqKSh8EV9Rusc/py5xqkt7hUAUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=bPLlT254; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Y4U7Pe5k; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=bPLlT254; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Y4U7Pe5k; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bPLlT254";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Y4U7Pe5k";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bPLlT254";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Y4U7Pe5k"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4216A1F394;
	Wed, 15 Jan 2025 16:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736956831; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+OddrOmLBOoLSdwiTw9F+5EGdXF79dXStj/yyKLIalU=;
	b=bPLlT254BkX1oOHEY/KDxbX8UJKlZ2+yRg1uTVUgsYG2kcFoqZYMIuppueKY1+etC9LP6R
	dwbvedROEGRqQgk/zhz3rl2RCmm/O35U1yivtTIMH2mqWf5ChKdGO2FHpo/1yDvYwHiehD
	6Ge27urFRqD20YTgNbY/cPXuwd4ca1Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736956831;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+OddrOmLBOoLSdwiTw9F+5EGdXF79dXStj/yyKLIalU=;
	b=Y4U7Pe5kQxAhzQTLULHIVSZeCxKSqhVYU2Ra/qeP2RdGjfB02HvJoLhz3jlNUsmVkmu+qS
	2zZ0L0s7rfaZwaAQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=bPLlT254;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Y4U7Pe5k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736956831; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+OddrOmLBOoLSdwiTw9F+5EGdXF79dXStj/yyKLIalU=;
	b=bPLlT254BkX1oOHEY/KDxbX8UJKlZ2+yRg1uTVUgsYG2kcFoqZYMIuppueKY1+etC9LP6R
	dwbvedROEGRqQgk/zhz3rl2RCmm/O35U1yivtTIMH2mqWf5ChKdGO2FHpo/1yDvYwHiehD
	6Ge27urFRqD20YTgNbY/cPXuwd4ca1Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736956831;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+OddrOmLBOoLSdwiTw9F+5EGdXF79dXStj/yyKLIalU=;
	b=Y4U7Pe5kQxAhzQTLULHIVSZeCxKSqhVYU2Ra/qeP2RdGjfB02HvJoLhz3jlNUsmVkmu+qS
	2zZ0L0s7rfaZwaAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C3AFA139CB;
	Wed, 15 Jan 2025 16:00:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id CVmjLp7bh2fSEwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 15 Jan 2025 16:00:30 +0000
Date: Wed, 15 Jan 2025 17:00:30 +0100
Message-ID: <874j20jcdd.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jackie Dong <xy-jackie@139.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	bo.liu@senarytech.com,
	kovalev@altlinux.org,
	me@oldherl.one,
	jaroslaw.janik@gmail.com,
	songxiebing@kylinos.cn,
	cs@tuxedo.de,
	kailang@realtek.com,
	sbinding@opensource.cirrus.com,
	simont@opensource.cirrus.com,
	josh@joshuagrisham.com,
	rf@opensource.cirrus.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	dongeg1@lenovo.com,
	Mark Pearson <mpearson-lenovo@squebb.ca>
Subject: Re: [PATCH v3] ALSA: hda: Support for Ideapad hotkey mute LEDs
In-Reply-To: <20250115154811.11869-1-xy-jackie@139.com>
References: <20250115154811.11869-1-xy-jackie@139.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 4216A1F394
X-Spam-Score: -2.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[139.com];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[139.com,gmail.com];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,senarytech.com,altlinux.org,oldherl.one,gmail.com,kylinos.cn,tuxedo.de,realtek.com,opensource.cirrus.com,joshuagrisham.com,vger.kernel.org,lenovo.com,squebb.ca];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Wed, 15 Jan 2025 16:48:11 +0100,
Jackie Dong wrote:
> 
> 
> New ideapad helper file with support for handling FN key mute LEDs.
> Update conexant and realtec codec to add LED support.
> 
> Suggested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> Signed-off-by: Jackie Dong  <xy-jackie@139.com>

It's almost fine, just one minor thing:

> @@ -11130,6 +11146,7 @@ static const struct hda_model_fixup alc269_fixup_models[] = {
>  	{.id = ALC290_FIXUP_MONO_SPEAKERS_HSJACK, .name = "mono-speakers"},
>  	{.id = ALC290_FIXUP_SUBWOOFER_HSJACK, .name = "alc290-subwoofer"},
>  	{.id = ALC269_FIXUP_THINKPAD_ACPI, .name = "thinkpad"},
> +	{.id = ALC269_FIXUP_LENOVO_XPAD_ACPI, .name = "lenovo xpad led"},

The model string shouldn't contain a space.  It'd be too difficult to
specify in the boot option.  Use a hyphen instead.


thanks,

Takashi
