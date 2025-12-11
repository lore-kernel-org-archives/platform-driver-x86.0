Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D7432D46C8
	for <platform-driver-x86@vger.kernel.org>; Thu, 11 Dec 2025 12:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765455476; cv=none; b=qjJXjDD7tbXsv1GYN9bQx8yJK0ib8vrmy35yIy6ymjr1Zt4ORhVu2eNT8qm9vJvsOogqq9l6ecFx/U57GWIJ8PPq4N/2382z/H9UlZaPf9szdNjjEXppZVCRSiWCp9qzMl3Y4vaH4mYNNHHlBAwEKw3WHBuPT8IWS5sfQKhCDh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765455476; c=relaxed/simple;
	bh=v4rJKuuxRMkgzAG93pq0RV9VPuqij/wN0dzhLJiID40=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HNR3wAICf+GYAv5Uy06oXbaeUKxbUnGUAyjqRtLhW0RwNoG7ZfyAlNOzSww/Mxbdm3rqxukFlPsXP46eMiizGmlb5hM5epJ/cf3MGA84f/v6CeHWCcEKLBxlWLTDjTfy5M0uT6NNxwAJRAbUnr1O0Rtc6alv9knrjKS70OzH49A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=H0neUTRH; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=U2jrFeC6; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=aPq8nRJC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=RKcOXoei; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="H0neUTRH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="U2jrFeC6";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="aPq8nRJC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RKcOXoei"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 399065BDD7;
	Thu, 11 Dec 2025 12:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765455473; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eR0I2k1zE7N9g1eGwiHFzaLk27fKIo0xzJjO0exyI9s=;
	b=H0neUTRH0a5Rv1BaE3jG0bairJSapCc/GnA9bcN4PTLMjDl0/IsY0zW/l33p8y5izgUGYK
	aZXXBf1oBbf+do3FAVn0D5J4gr/WF4hQNYMcHQ+Dx48IBOuUYX4lfEYRscD+/uSyGuGg9y
	IBpucczU/avM5RCSDud7yywZ4kj9ek4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765455473;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eR0I2k1zE7N9g1eGwiHFzaLk27fKIo0xzJjO0exyI9s=;
	b=U2jrFeC6K4pOaN8HUkH6iAzbavENAtGgW2jzaJmkM1QgPmSwUvtQQkeWsQ0B7oyGxXeL1S
	XbhoR82lqSoumpAw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=aPq8nRJC;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=RKcOXoei
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765455472; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eR0I2k1zE7N9g1eGwiHFzaLk27fKIo0xzJjO0exyI9s=;
	b=aPq8nRJC5hBJVCeIpnDy5m99FY3lsQbIZJhiS5GqDLdSp4hW+Wo1MhcTL9+5EqCoq69x0N
	PNQcEhCnVUFephwQezYCkxWfVRYSjpd2nAGAj+n6ZnZbHelxjvNDAcXy7qgj+j530dkGI6
	SN3pplAdpK7QQIyZqOAtd02SR4+PY4I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765455472;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eR0I2k1zE7N9g1eGwiHFzaLk27fKIo0xzJjO0exyI9s=;
	b=RKcOXoeiZsDKCniNp9oqdDu5ByQPTRFEpLTIGtxQpENeqIysTjLZHQQ0kQRRvIQW2+DFc7
	mmdiMJj65jINMXAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D16363EA63;
	Thu, 11 Dec 2025 12:17:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 7VBxMW+2OmmnFwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 11 Dec 2025 12:17:51 +0000
Date: Thu, 11 Dec 2025 13:17:51 +0100
Message-ID: <87pl8lb4b4.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Baojun Xu <baojun.xu@ti.com>
Cc: <hansg@kernel.org>,
	<ilpo.jarvinen@linux.intel.com>,
	<broonie@kernel.org>,
	<andriy.shevchenko@linux.intel.com>,
	<alsa-devel@alsa-project.org>,
	<shenghao-ding@ti.com>,
	<13916275206@139.com>,
	<platform-driver-x86@vger.kernel.org>,
	<linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>,
	<letitia.tsai@hp.com>,
	<bill.yu@canonical.com>
Subject: Re: [PATCH v1] ALSA: hda/tas2781: Add new quirk for HP new project
In-Reply-To: <20251211092427.1648-1-baojun.xu@ti.com>
References: <20251211092427.1648-1-baojun.xu@ti.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Rspamd-Queue-Id: 399065BDD7
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[139.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,alsa-project.org,ti.com,139.com,vger.kernel.org,hp.com,canonical.com];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ti.com:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Level: 

On Thu, 11 Dec 2025 10:24:26 +0100,
Baojun Xu wrote:
> 
> Add new vendor_id and subsystem_id in quirk for HP new project (NexusX).
> 
> Signed-off-by: Baojun Xu <baojun.xu@ti.com>

Thanks, applied.


Takashi
