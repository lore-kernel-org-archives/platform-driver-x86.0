Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37ACC385D92
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Jun 2026 07:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781076291; cv=none; b=VmXiP6fhgCqziJAkekVPh3ztdruEdAXehIWRQb92fHloa9qIoKB+PVpwfsjAzlhUPd22AbKoluEWnUrNSOKYWBDQJvlu8+wFBC8JkDM9hY+sUK7X/02YR/Kxwthl2zqFtFrLSrpNVKBm8P0A5Zu3TQqv/BFwZWMkML8Kfp328UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781076291; c=relaxed/simple;
	bh=WGprcbK9zqMsvHjp5O0DWnGI/97xMHtNKZH7Dx3Eidc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rcws1N+U9bPeg4vErnylJfbsITW2l2/1BEkyBJA8U9V+TODJNl5FF/mDIMWwZejSoZX8PDi8FRP1Ip0KNq4XVDWYv12ToPt3uwLbFV8uat7p1su4PPRklZCvKIpNxSiSbiT+kiNsO61Vpl2VAKTRlUjz1BZZefxcIjMG4gDK4po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FabjmXT6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9hbXpd+S; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FabjmXT6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9hbXpd+S; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FabjmXT6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9hbXpd+S";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FabjmXT6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9hbXpd+S"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7FD606AC58;
	Wed, 10 Jun 2026 07:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781076287; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EK0hG92NBHsWBOoJ4ZRiX9jHIfHNt5Wx7i6cNWNTYNs=;
	b=FabjmXT6WFU+lKh+N1q6HzdKkIunlaiv+DdyhTUag7UNjqaPPO16xArwSnA0bOa+Qwzk+P
	CXarfuVBQBDEcC7brsuzjIHmBhMs6NtBA37LB27Xuu5t0M72AgOzC8m7bPpQmdBJVWD8Q6
	zAQh9Eg+dfpRtsTvQgorAWwBichKMPQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781076287;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EK0hG92NBHsWBOoJ4ZRiX9jHIfHNt5Wx7i6cNWNTYNs=;
	b=9hbXpd+SxhT+tsJD0TKP6J8k8yU+4FiPKp9JFaNBRcT0ut/jk6WsvZEV5PwszC09rpDB8o
	i7WzWtI+8LE3TkAQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=FabjmXT6;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=9hbXpd+S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781076287; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EK0hG92NBHsWBOoJ4ZRiX9jHIfHNt5Wx7i6cNWNTYNs=;
	b=FabjmXT6WFU+lKh+N1q6HzdKkIunlaiv+DdyhTUag7UNjqaPPO16xArwSnA0bOa+Qwzk+P
	CXarfuVBQBDEcC7brsuzjIHmBhMs6NtBA37LB27Xuu5t0M72AgOzC8m7bPpQmdBJVWD8Q6
	zAQh9Eg+dfpRtsTvQgorAWwBichKMPQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781076287;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EK0hG92NBHsWBOoJ4ZRiX9jHIfHNt5Wx7i6cNWNTYNs=;
	b=9hbXpd+SxhT+tsJD0TKP6J8k8yU+4FiPKp9JFaNBRcT0ut/jk6WsvZEV5PwszC09rpDB8o
	i7WzWtI+8LE3TkAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2212D779A7;
	Wed, 10 Jun 2026 07:24:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id CtzuBj8RKWoDQAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 10 Jun 2026 07:24:47 +0000
Date: Wed, 10 Jun 2026 09:24:46 +0200
Message-ID: <87v7bq6eo1.wl-tiwai@suse.de>
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
	<bill.yu@canonical.com>,
	<pin-hao.huang@hp.com>
Subject: Re: [PATCH v1] ALSA: hda/tas2781: Fix device-0 reset issue and handle -EXDEV in block data processing
In-Reply-To: <20260609105253.19510-1-baojun.xu@ti.com>
References: <20260609105253.19510-1-baojun.xu@ti.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 7FD606AC58
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[139.com];
	FREEMAIL_CC(0.00)[suse.de,kernel.org,linux.intel.com,ti.com,139.com,vger.kernel.org,hp.com,canonical.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

On Tue, 09 Jun 2026 12:52:53 +0200,
Baojun Xu wrote:
> 
> Fix reset for device-0:‌ In older projects (e.g., Merino), the hardware
> reset pin for the first SPI device (device-0) is ineffective, causing
> initialization failures. Added a software reset sequence for device-0
> to ensure proper initialization.
> 
> ‌Handle -EXDEV correctly:‌ When processing block data, if the data does
> not belong to the current SPI device, the driver returned -EXDEV.
> This error code is now ignored to allow the driver to continue iterating
> through the block data and correctly calculate the total block size.
> 
> Signed-off-by: Baojun Xu <baojun.xu@ti.com>

Applied to for-next branch now.  Thanks.


Takashi
