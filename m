Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7596570816;
	Wed, 15 Jan 2025 16:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736960348; cv=none; b=ob84wb56OMl4iGxrJlK8xh80N9RRoi18MzD4z4XNH7qPi8pfPG/xjOD2pYa57pDppBczfxd4kNlJy+TVwUSkhjua0AKmEm7byLbYM3mSIL3SqmwWywI+Jkggrb9KyfzAiwiODidew9UbQiG4wqkYAaTFW6KiMkLVof85iDLAfoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736960348; c=relaxed/simple;
	bh=kbWbuDeb4qN7Z9yFOZ+Gbby59klpWxuekkPVeiYyH2A=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UIlo2nlcxyb2KRrqcizrq+CSwoR2ZSnQIe6koHvx4AaZ12JFT5UkOyCP7qVB/scH5RWSaSUXzdDHE9g5Vy8or0iGGWhnNavO9jM/6rk6qXlRFxO+xNOki9nQxvgzU5E92PtoSU9kYgj0/0OWLYzrW+Gro7GMx6So1iMDri2Ye3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=joCtCBez; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=GRVE0WAC; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=joCtCBez; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=GRVE0WAC; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="joCtCBez";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GRVE0WAC";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="joCtCBez";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GRVE0WAC"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6B8801F37E;
	Wed, 15 Jan 2025 16:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736960344; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7cHeIcLFH2Le2MqrG+Ktd02IGFq/bF88bBMS+TMf/aM=;
	b=joCtCBezNXegwlzp9aJWAoNwY3z7OB0V15Evx9O1TknPyZqFX89ySMxa+a5en9g2EAySXM
	x80fpCoggZBjD3OWrwxyOU39ZaQpIXX8d+Mu3D07tNfuDSGTJbGv7RvN9YgpLv/VIK3UTW
	vU6EBIUBVy7uSixc96Vm6wbXDb6J4a0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736960344;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7cHeIcLFH2Le2MqrG+Ktd02IGFq/bF88bBMS+TMf/aM=;
	b=GRVE0WAC99K3hpew8JWiux6dmqVusyd1OewpFJFPkLEVKnB4UwTI9+NHXLGkn0Lt8Jt80L
	nXJRG1pOrFm2DWCg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=joCtCBez;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=GRVE0WAC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736960344; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7cHeIcLFH2Le2MqrG+Ktd02IGFq/bF88bBMS+TMf/aM=;
	b=joCtCBezNXegwlzp9aJWAoNwY3z7OB0V15Evx9O1TknPyZqFX89ySMxa+a5en9g2EAySXM
	x80fpCoggZBjD3OWrwxyOU39ZaQpIXX8d+Mu3D07tNfuDSGTJbGv7RvN9YgpLv/VIK3UTW
	vU6EBIUBVy7uSixc96Vm6wbXDb6J4a0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736960344;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7cHeIcLFH2Le2MqrG+Ktd02IGFq/bF88bBMS+TMf/aM=;
	b=GRVE0WAC99K3hpew8JWiux6dmqVusyd1OewpFJFPkLEVKnB4UwTI9+NHXLGkn0Lt8Jt80L
	nXJRG1pOrFm2DWCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EAC9E13A6F;
	Wed, 15 Jan 2025 16:59:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wnyJN1fph2djJgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 15 Jan 2025 16:59:03 +0000
Date: Wed, 15 Jan 2025 17:59:03 +0100
Message-ID: <87y0zchv3c.wl-tiwai@suse.de>
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
Subject: Re: [PATCH v4] ALSA: hda: Support for Ideapad hotkey mute LEDs
In-Reply-To: <20250115162515.15026-1-xy-jackie@139.com>
References: <20250115162515.15026-1-xy-jackie@139.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 6B8801F37E
X-Spam-Score: -2.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_TO(0.00)[139.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[139.com,gmail.com];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,senarytech.com,altlinux.org,oldherl.one,gmail.com,kylinos.cn,tuxedo.de,realtek.com,opensource.cirrus.com,joshuagrisham.com,vger.kernel.org,lenovo.com,squebb.ca];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Wed, 15 Jan 2025 17:25:15 +0100,
Jackie Dong wrote:
> 
> New ideapad helper file with support for handling FN key mute LEDs.
> Update conexant and realtec codec to add LED support.
> 
> Suggested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> Signed-off-by: Jackie Dong  <xy-jackie@139.com>

Applied now.  Thanks.


Takashi
