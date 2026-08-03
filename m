Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C5339A80E
	for <platform-driver-x86@vger.kernel.org>; Mon,  3 Aug 2026 07:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785740661; cv=none; b=Ts+h3IOyBfjPz+/f+435X9n3K64sup/gPaBA4ItJG5FD7fZcMJtDNtzTKpGL+e2GpHx7y8OYvxZxXRG26AdcWFvZ+qty3zfcmDcUb4gB3lmayRHdsLAImho4ExXpgv3oseSmJqoMHeZIeApMIFtzl9nuLzCHCgFWKSR+h7WntCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785740661; c=relaxed/simple;
	bh=cQEDfKJfC3JK3/7D95JCLfUlgZKiEtU20r0Lo4yJmWY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cmO10C0gOCTh+D7FXGneqwwoE0arOx00LTW6vs1TQhh/jEeKF2/1FW7dG/VKN15iYcTZ66zv1JBRbzgvCniPb8V7sMHuHrJ6MrARgVvU/k/9z0Q+wO1ffkhtnoRpo99LImVpMDmHNo2mIZD110H7z8I3AXj46eh692ByES7rCmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1ls4H2GY; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=i9xKJi1l; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KUgSJm6p; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=U9IbSUHA; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1ls4H2GY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="i9xKJi1l";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KUgSJm6p";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="U9IbSUHA"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7287D46FB;
	Mon,  3 Aug 2026 07:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785740654; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wrNqFo03pRqpNM1zDNIDxRoXv8zGFUavIgUp+bRl2oA=;
	b=1ls4H2GYEh/aVkmLLLLsNg/rc1tykepilIFMYt8AevIRwYX+vKds+dAtyKthLGdJzp2zJ1
	Lsgoqzo6oY7qkAFFKSURceAQcsbJ4bm9iCg8eWaMIFlIhL498HVugrNSGofUFGxxJHVy+d
	xOa5zYoXhaFTazGLrMDEYzWZIGSTcbU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785740654;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wrNqFo03pRqpNM1zDNIDxRoXv8zGFUavIgUp+bRl2oA=;
	b=i9xKJi1lSieY+ZRaddWCYOxj8v2iFR2tARPfMMX5EtOi+b+6yhaH04RbLF6GA8yLBS23u3
	dMknnWcy+v1tkIDw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=KUgSJm6p;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=U9IbSUHA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785740650; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wrNqFo03pRqpNM1zDNIDxRoXv8zGFUavIgUp+bRl2oA=;
	b=KUgSJm6pMFf6EDAdaj1cqCJfWGfFXmjPRacDfZB8E2BP9Nvjlc1Q/eMUjZVOuU678w/acx
	c/sU6FQhw17HvRU3p6hia6vC4iarbcIyRsUswSOdu3Kf5VI9skzg0Y2VDnBxMEItv1out/
	Ck/tGvnUFKsvpsPbEnGb27zBYsaQUis=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785740650;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wrNqFo03pRqpNM1zDNIDxRoXv8zGFUavIgUp+bRl2oA=;
	b=U9IbSUHAXZkaAWJ7zw+xmUHg6MzWuT/kcu4ocVOdZ7uPsXhBs5bTFPHJWO/0xTgupBSblp
	bRykRii/7C22PPAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 16F9E779A1;
	Mon,  3 Aug 2026 07:04:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id oAtYBGo9cGrRDAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 03 Aug 2026 07:04:10 +0000
Date: Mon, 03 Aug 2026 09:04:09 +0200
Message-ID: <875x1rbs7q.wl-tiwai@suse.de>
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
	<robinchen@ti.com>,
	<bill.yu@canonical.com>,
	<pin-hao.huang@hp.com>
Subject: Re: [PATCH v1] ALSA: hda/tas2781: Add new quirk for HP new project (Messi)
In-Reply-To: <20260801022831.1241-1-baojun.xu@ti.com>
References: <20260801022831.1241-1-baojun.xu@ti.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 7287D46FB
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	URIBL_BLOCKED(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,ti.com:email];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_ENVRCPT(0.00)[139.com];
	FREEMAIL_CC(0.00)[suse.de,kernel.org,linux.intel.com,ti.com,139.com,vger.kernel.org,canonical.com,hp.com];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,ti.com:email,suse.de:mid,suse.de:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

On Sat, 01 Aug 2026 04:28:31 +0200,
Baojun Xu wrote:
> 
> Add new vendor_id and subsystem_id in quirk for HP new project (Messi).
> 
> Signed-off-by: Baojun Xu <baojun.xu@ti.com>

Applied to for-next branch now.  Thanks.


Takashi
