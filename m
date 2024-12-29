Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C43F27462;
	Sun, 29 Dec 2024 09:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735463052; cv=none; b=t047sEtl9oODyg8FDMpO6QIELJQAQgNO9f7IkwZxO1QrHBJqWZSPtzIQ2p9dkfkF/3iOS4Akxvf6JYOevHkLh7MzY/AdWmezrvOv1YjXQuKxZdVBON//az3XelfMO8SbnUvKuelwqnWjYGFYxwcNomhx5jAe/87KXFmWmq+VNQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735463052; c=relaxed/simple;
	bh=ZzSghP2FVei/k8acj4m91YTJ60GLpuGtAb4lA+pqwYw=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hxf4t+A9kpLKjF2i4/9iDhZ3OJevywPg8+kXA2BnmzFfbmzTP4HXpUaZ+zFPh80Z/+Cs9FqZ3R5zCKifxJnEr9ZVYQWgNruE1NtQ3xq91uhkbtOPiNtlaRibxgZbGH8jr7jv6zseGY9yzKW8aiXMOpALbnc3Dw+fLAVxg0zClQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=y9LN95ft; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=88gLYnSe; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KxNps521; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=XC51ySni; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="y9LN95ft";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="88gLYnSe";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KxNps521";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XC51ySni"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0834A1F7C3;
	Sun, 29 Dec 2024 09:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1735463049; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0jM5HAVzV9EJZWEtFdFDH2XLkc1QCrwTp4s+vcnT9rI=;
	b=y9LN95ftJeD3jhXFAr2EAZog9DDHvZaFvyzpeLUvljYly2q4fuQEnmq1fF9bYOrQKPNlnJ
	Nwxe5oibPuqDTSWA9l9K2/6elziXMUGM0aRESFJQhDmN8mrSdmfKVDJBZnnk5NIbYXJCz2
	P15k7PIUWWSvPsiots2HnnbJN4vuTpY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1735463049;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0jM5HAVzV9EJZWEtFdFDH2XLkc1QCrwTp4s+vcnT9rI=;
	b=88gLYnSe3LIoMV7JJqXuQd/HwNMa6rUCNpkU/EM1Inao8xRsUZRItxsV9Wu18K5C1KtgYS
	fkurydLar1Evs9CA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=KxNps521;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=XC51ySni
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1735463048; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0jM5HAVzV9EJZWEtFdFDH2XLkc1QCrwTp4s+vcnT9rI=;
	b=KxNps521l6glBNXuD8mjcC8wAZAo5j0Vdf9zhnLmEbey1beBjqhGby2lHncNyqlWYGuOht
	E2aqCD5yruQCfEZ5zeSzql/LRer5peVNwSOQNdpRDKeEOIkENM5scXpjdnQOoEGdCuHnLC
	uyq9uWGzE4ygavoiMLg6t+zqHOg8nqE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1735463048;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0jM5HAVzV9EJZWEtFdFDH2XLkc1QCrwTp4s+vcnT9rI=;
	b=XC51ySniC8ULE/tMA1VHo9bUPTxlABhfEPRJzdCvmvAzf7qv6T6CuH0wE6R9Qi294zahOT
	NYPsYB+vim+qCsCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8444313A30;
	Sun, 29 Dec 2024 09:04:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id T7yPHocQcWfZSAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 29 Dec 2024 09:04:07 +0000
Date: Sun, 29 Dec 2024 10:04:07 +0100
Message-ID: <87ikr2dfnc.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jackie Dong <xy-jackie@139.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	bo.liu@senarytech.com,
	kovalev@altlinux.org,
	me@oldherl.one,
	jaroslaw.janik@gmail.com,
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
	dongeg1@lenovo.com
Subject: Re: [PATCH v2] ALSA: hda: Support for Ideapad hotkey mute LEDs
In-Reply-To: <20241224083316.20222-1-xy-jackie@139.com>
References: <20241224083316.20222-1-xy-jackie@139.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 0834A1F7C3
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
	RCPT_COUNT_TWELVE(0.00)[18];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[139.com,gmail.com];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,senarytech.com,altlinux.org,oldherl.one,gmail.com,kylinos.cn,realtek.com,opensource.cirrus.com,joshuagrisham.com,vger.kernel.org,squebb.ca,lenovo.com];
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

On Tue, 24 Dec 2024 09:33:16 +0100,
Jackie Dong wrote:
> 
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

So this unconditionally call alc_fixup_no_shutup(), and this
introduces another behavior to the existing entry -- i.e. there is a
chance of breakage.

If we want to be very conservative, this call should be limited to
Ideapad.


thanks,

Takashi

