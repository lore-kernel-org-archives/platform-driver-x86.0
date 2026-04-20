Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D6E382285
	for <platform-driver-x86@vger.kernel.org>; Mon, 20 Apr 2026 06:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776665722; cv=none; b=jQ2PZLTcCOGBfgROn/lOh7WkfnXv6l/y2yY/O3544Y/PxPK3xd7hWcAN8HZUKd+f/gJkWNs1qcQYDa0/HDTlGAoOWb8ZiMyRK1BCfkgpCbxWlW3ZXhbdpJ0X6uNegoQi/Cr+/sMwvvyImqL0rzfk1WsJhsjhLyOsgKjfUbw4/TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776665722; c=relaxed/simple;
	bh=56ARSDX4wXc+/FiYvSWvjgLl5XSxVeoNL/GdKNbOk+k=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qwI5WeOm0XnO4lpXFJ88eQHR312XxUGu/mXQ8x/OalywBgeQSl0uPcTjTR6wux7MmMkrG66RCNReEjfy7/KKf0fOG6TvxgLHYMH63Wr2+BTI1rhpEzHrioyNBGR4/jQmOP8dF+nV5yaBa3KI+kAH33Jv7cJGwsSPMYVydYBIy04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zZeJyNMI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=WNOYClyR; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pqzol+iv; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ZMiSfHjr; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zZeJyNMI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WNOYClyR";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pqzol+iv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZMiSfHjr"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id EF8275BD10;
	Mon, 20 Apr 2026 06:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776665719; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pfLrTMbteG/y8jv3hrDvh5Ac3JhcpS5tz7oWTWqcbe0=;
	b=zZeJyNMIGp1rldI1xVHpPWlqmuyVm17vunD7YXUuHwKkv4pi/huosu149fwXlgOv0wUVqd
	AX3rotDo+dubd33ll4DoZas9tpACtun15FGgE3ge+ToQybMCP3aq0f8jC7BBXyIrqL9jE9
	+1sLIvXbuKImSwhz4z2ac0G7DG+o1DQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776665719;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pfLrTMbteG/y8jv3hrDvh5Ac3JhcpS5tz7oWTWqcbe0=;
	b=WNOYClyRzWBXaf7143jjObZ+/lQGlD7X2z/AUM2Nm7RfUvMEIYB3tYzbJes/vcPwMNyivs
	b4a9o7e7jt/p4TDw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=pqzol+iv;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ZMiSfHjr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776665718; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pfLrTMbteG/y8jv3hrDvh5Ac3JhcpS5tz7oWTWqcbe0=;
	b=pqzol+ivYkiyxbl2ItY+Cz+tRo8cqI0lWzpfQZmmApfLtqz97bUPUCdLAgpiWobGVbANcj
	pv2nloDHCRVPykxh/GAPoPh+I5EERSHZBKW1Efy8GXqahMe8ix26UsOx1RXUk+uI4gTptR
	4Tj07Qpnqd7QmRLXNqJaoPBQ+ajgviQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776665718;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pfLrTMbteG/y8jv3hrDvh5Ac3JhcpS5tz7oWTWqcbe0=;
	b=ZMiSfHjrNVviDXZn6AW+q1Fs5OPt/zgY+TNqFpYaRF8QUvFekqqhklpkjLAfri/ClO++1O
	EEc9EnqWej9oHtBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 97880593AE;
	Mon, 20 Apr 2026 06:15:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Q0O5I3bE5WlCDgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 20 Apr 2026 06:15:18 +0000
Date: Mon, 20 Apr 2026 08:15:18 +0200
Message-ID: <87y0iib1jd.wl-tiwai@suse.de>
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
Subject: Re: [PATCH v1] ALSA: hda/tas2781: Fix sound abnormal issue on some SPI device
In-Reply-To: <20260418055030.765-1-baojun.xu@ti.com>
References: <20260418055030.765-1-baojun.xu@ti.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[139.com];
	FREEMAIL_CC(0.00)[suse.de,kernel.org,linux.intel.com,ti.com,139.com,vger.kernel.org,hp.com,canonical.com];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Queue-Id: EF8275BD10
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 

On Sat, 18 Apr 2026 07:50:30 +0200,
Baojun Xu wrote:
> 
> In the SPI driver probe, the chip ID must be set to TAS2781. Without this
> initialization, calibration data fails to load correctly, causing audio
> abnormalities on some devices.
> And update the register bulk read API to handle the distinct requirements
> of SPI and I2C devices.
> 
> Fixes: 05ac3846ffe5 ("ALSA: hda/tas2781: A workaround solution to lower-vol issue among lower calibrated-impedance micro-speaker on TAS2781")
> Signed-off-by: Baojun Xu <baojun.xu@ti.com>

Applied now.  Thanks.


Takashi
