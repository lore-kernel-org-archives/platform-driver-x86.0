Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792564185;
	b=t1GNS/WHnjU9oLiBoJsjZlVtLbJ/9UfbpW5VM1Yts6wRVQ9k3wS/nbmM++ztNJpkrGKo
	 a04bVvE1dbA7EL0eV07kHWbc5N8KsQo4+FMJn/AjozdYzgyDWEKsOE73vEto/HBz2uXoL
	 ubbBz6JVnGxCDIG8NYQH7DQN08Py50+HBKoPSJSGBCxHhR0toJgN5u+LhhyRvnfjGpZ7n
	 LDYmMEFv7prFS24towckhVBhpHnHswZxUz0cZiF0PhVbxAPaVdzYz5G3MnSpioQ1ffxlJ
	 xnzqHbZpzXDhYwUgBdUQLl8YZb4bIPPMC+x4X9JHdO4oxRZbBbZzGdCuhCqWWMulVvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792564185;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Spamd-Result:X-Spam-Score:X-Spam-Level:
	 X-Spam-Flag;
	bh=6xSciQaDxf0QTUEgEMRd7J5MDPBVIhr/8xJSewisc+o=;
	b=JkvtmyxjUYUYp5Aq0Drz+AaY/Z5j8VqjMl3w3hFCwnBKp4XFMhKXOK0VchS8TfzKndwu
	 2mWuBY/mRJE0b0aEVhpfnLRyDDlDBAj8myedyL9+089i5GTLmrEflFhjPMQhOUv3EbGvf
	 EKyPVWXuNvzi3MBwSXsIfMkBNt02n41P9iHiy/HL6/jkI4vfpFP5batkjihibiCoXv77O
	 4vTvxgjWTJSSGPyyOn+8pr7EtxWhDoIx9d8NZVOrOshhrFcD6o2sm05UvRq3TTKAo4pgp
	 OBWbeHzgFFi2vLiax0gAABLuXt9JjpYwm/dpXRDXGYvr4ui1/LgbOaF0s0p/FqxCsbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=oKm0b3Nb;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=C0NATNtu;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=LHS6+9+C;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="04oPn/5g";
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A5F606A320;
	Wed, 21 Oct 2026 06:29:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31A5F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=oKm0b3Nb;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=C0NATNtu;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=LHS6+9+C;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=04oPn/5g
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 284A421E3C;
	Wed, 21 Oct 2026 06:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792564183; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6xSciQaDxf0QTUEgEMRd7J5MDPBVIhr/8xJSewisc+o=;
	b=oKm0b3NbJIuak3bLu4GjTFsLdiF+wx2fbEn/0tqha+e7v4uYmNJi/dpcA0ey2wYCP97Wwk
	2dgHWzLRHK0iEJLN6+p30OuiBdlfQcpftGqgi06/pQvJv3VCp49rjGsI1ZkZbScp6mhRnl
	XLJVcqQuNKjTptuqwxrRxOCrs/KODHo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792564183;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6xSciQaDxf0QTUEgEMRd7J5MDPBVIhr/8xJSewisc+o=;
	b=C0NATNtuTk+SKlICRp1poOTkTCiEoTnh3KbBJ0MITD2rNq0oyRqJbsB5dELJUO+Ps8KTiV
	eVihpDzgW13wiyBA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792564182; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6xSciQaDxf0QTUEgEMRd7J5MDPBVIhr/8xJSewisc+o=;
	b=LHS6+9+C914l56r6SHM8/9QgItdubsBAGsXk+rGhkWN0ySZADTz2L3a6tZgoZ6hAJn0K04
	9JZlswT/Ei9Kvf0Mg2Gu4+u7x5Y/3sDatBPWMDsckoPe5yQOgL5iUYdofS4jc66tMekJae
	CnzfsJhWlBFHJMow3AAbZYvRDnS3mFg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792564182;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6xSciQaDxf0QTUEgEMRd7J5MDPBVIhr/8xJSewisc+o=;
	b=04oPn/5gHnozZPjBw/5CH80u/SSBHVDEc3b1PK1zGZ/XWv4iqZg99K4I7oRSRkeyh329yt
	z23rUSdpkGn3FoBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id ED0B0134A5;
	Wed, 21 Oct 2026 06:29:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id NJGpMNRb2GqzVAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 21 Oct 2026 06:29:40 +0000
Date: Wed, 21 Oct 2026 08:29:40 +0200
Message-ID: <87mrs7ftwr.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Ilpo =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	platform-driver-x86@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>,
	Junrui Luo <moonafterrain@outlook.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: ibm_rtl: Fix potential OOB read at signature search
In-Reply-To: <4d28c3ce-63f7-399e-9798-4f35e60c608b@linux.intel.com>
References: <20261020130301.351768-1-tiwai@suse.de>
	<818a69b8-785f-9eec-d93a-89c8833d94fc@linux.intel.com>
	<87y0bsfocc.wl-tiwai@suse.de>
	<4d28c3ce-63f7-399e-9798-4f35e60c608b@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[outlook.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[suse.de,vger.kernel.org,kernel.org,outlook.com];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spam-Flag: NO

On Tue, 20 Oct 2026 22:20:50 +0200,
Ilpo Järvinen wrote:
> 
> On Tue, 20 Oct 2026, Takashi Iwai wrote:
> 
> > On Tue, 20 Oct 2026 15:52:28 +0200,
> > Ilpo Järvinen wrote:
> > > 
> > > On Tue, 20 Oct 2026, Takashi Iwai wrote:
> > > 
> > > > The loop for signature search fetches 8 bytes at each check,
> > > 
> > > But that's not all it's going to access??
> > 
> > Oh indeed it access further.
> > 
> > > > while the
> > > > loop count is calculated in 4 bytes unit, which means that, at the
> > > > last entry, it fetches over the limit.
> > > > 
> > > > Correct the boundary condition to "ebda_size/sizeof(unsigned int)-1"
> > > 
> > > This seems even more obfuscated than this code already is!
> > 
> > Yeah, the driver code is really ugly, and I made a whip cream on the
> > top :)
> > 
> > > I think it should do this instead:
> > > 
> > > (ebda_size - sizeof(*rtl_table)) / sizeof(u32)
> > 
> > Hrm, this will result in the omit of the last loop entry?
> > 
> > I guess it'd be better understandable rather by directly adding the
> > offset in the loop instead of the counter.  Something like below.
> 
> The patch below looks fine sans one nit but could you please send it in 
> own thread so it gets captured by patchwork & sashiko & etc.

OK, will do.

(snip)
> > @@ -271,9 +271,9 @@ static int __init ibm_rtl_init(void) {
> >  		return -ENOMEM;
> >  
> >  	/* search for the _RTL_ signature at the start of the table */
> > -	for (i = 0 ; i < ebda_size/sizeof(unsigned int); i++) {
> > +	for (offset = 0 ; offset + sizeof(*rtl_table) <= ebda_size; offset += 4) {
> 
> Nit, remove the extra space before semicolon.

Will be corrected in the next submission.


thanks,

Takashi
