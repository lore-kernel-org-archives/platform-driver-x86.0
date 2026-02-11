Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA2E3328E0
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Feb 2026 09:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770800473; cv=none; b=ObU7wIr8l4cDdd8ab0vpbe0bSNlXPRQvoWfHt2DbG9xGaozlGG6KBIbTJdLcMN3RXnbcRn81dlwqMYVGt86Kp0FCvPGaaEXAoChvof+aU4xadwffkePknqDEnov3sVoTEfe8u6WJG5JR8UW3R10h2zUZcWwiYFno+0HyH5s4iW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770800473; c=relaxed/simple;
	bh=62zEXBYExhhZbdpNw6d3qOYHqN+cK0QpCLMD+zQm8Ps=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GJVG3L6chZtXj77Z1phGdPMQuBldfQ3SGNAn+5HGJ9hBx7GRtCRAAA1vQNV9DOzYYuf/6v+weKos4mSIYUY0FeVIaHQQACgoj7Py1JvuVOehvEm8fHQjO/9tU6lLrHg2OhYzAvWpHPRgV4BpDC84mRziCNCLqlP2hHO3u2q4LTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ztcBwBlO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=yJT0gBRZ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=bD/i24RE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=cfEQ80qV; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ztcBwBlO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yJT0gBRZ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bD/i24RE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cfEQ80qV"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 79A643E714;
	Wed, 11 Feb 2026 09:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770800468; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=n6mg1AgJ/Zv/uMqqj8vXv/O6j+UTAjREDyNqAY++xKU=;
	b=ztcBwBlOLa5fjUx7NF22AT3t1hIq28na22M0Gjcnl1WgVaKaD6yjR1CtHJZur9ddGzBUag
	g9kPFmz9z+35fR+fgoQ+d3pBWU0J5Z6xpCBax3OdSWVt8uM3du3PhaKBucMO8k+4UlMtAd
	LGPlJfCijK+W5fcr87JzNThB7NWZq78=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770800468;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=n6mg1AgJ/Zv/uMqqj8vXv/O6j+UTAjREDyNqAY++xKU=;
	b=yJT0gBRZObxHhdIjr2Qm3lIF68BvBkzFMqtE4IfQVpGCPYL0ilHntfx+DG/8bfAINbtLvT
	0OW4LAF4wY+YPvAw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="bD/i24RE";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=cfEQ80qV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770800463; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=n6mg1AgJ/Zv/uMqqj8vXv/O6j+UTAjREDyNqAY++xKU=;
	b=bD/i24REOcf1dsLvVAH+lVvO6aVPcKjM4xyt6bYiqpfl6v2LA0bBqJQrnVsJLk1o2YgkTa
	i8amorA02CsXcMqEpAm+WN3V0HDR4dnDELcPD2NbJUhSgtxCaVyc+PcxYvDvmBuezv2f6H
	PW6Mue6cYAQjeJeYgfJlZZKGRwDfkLg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770800463;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=n6mg1AgJ/Zv/uMqqj8vXv/O6j+UTAjREDyNqAY++xKU=;
	b=cfEQ80qVX81hwIsIqA3tFAziQkz+kbj2oh/2r+mdhd6fMletQp/7I4vkTyuQ1sT97xZc1m
	gVkTGjsvCcC2rNCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1149B3EA62;
	Wed, 11 Feb 2026 09:00:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id PDC9AkpFjGnOfQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 11 Feb 2026 09:00:58 +0000
Date: Wed, 11 Feb 2026 10:00:57 +0100
Message-ID: <87ms1fu01i.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Baojun Xu <baojun.xu@ti.com>
Cc: <tiwai@suse.de>,
	<hansg@kernel.org>,
	<ilpo.jarvinen@linux.intel.com>,
	<broonie@kernel.org>,
	<andriy.shevchenko@linux.intel.com>,
	<shenghao-ding@ti.com>,
	<13916275206@139.com>,
	<platform-driver-x86@vger.kernel.org>,
	<linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>,
	<letitia.tsai@hp.com>,
	<bill.yu@canonical.com>
Subject: Re: [PATCH v2] ALSA: hda/tas2781: Ignore reset check for SPI device
In-Reply-To: <20260211030946.2330-1-baojun.xu@ti.com>
References: <20260211030946.2330-1-baojun.xu@ti.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ASN_FAIL(0.00)[7.9.0.0.4.6.0.0.0.5.1.0.0.1.0.0.4.0.1.0.1.8.2.b.0.4.e.d.7.0.a.2.asn6.rspamd.com:server fail];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[139.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.de,kernel.org,linux.intel.com,ti.com,139.com,vger.kernel.org,hp.com,canonical.com];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid];
	URIBL_BLOCKED(0.00)[ti.com:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Rspamd-Queue-Id: 79A643E714
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Level: 

On Wed, 11 Feb 2026 04:09:46 +0100,
Baojun Xu wrote:
> 
> In the SPI driver probe, the device should be in the default state, so the
> device status check is not necessary. It should be forced to do the
> firmware download as I2C device.
> 
> Signed-off-by: Baojun Xu <baojun.xu@ti.com>

Thanks, applied now.


Takashi
