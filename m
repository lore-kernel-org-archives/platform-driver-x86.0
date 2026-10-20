Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792505862;
	b=C27bhNutg18aapS+m3T/gZUgslMomFx1Umn+1MluZI0BqMsiZdlyiTITvAOChGDPzgNP
	 2quaAHjRc1z5n3N1RIeNU9+RhNQq9EK8Noe23X0o4RUbsZ5otuiuuLRHoSMGAMTnmB7I0
	 Q1zu8BBDV3ewMCurSO6xA+voWwYvdtw/3dsAs1j7E5nvyB4Sp6FIP9J602uo3GbXE8Qqh
	 Le3yFTQ75WRqBDwOIQQW68Lkd5IzXUFVmbozClrgBcyPZ8dMkghw63r4kF68pskydGMks
	 42mJ2TvKpozB2Zq4n7SArC8BgZE5SrYzi/tInz6w2PVUg1ZR9HHm9AryowWnYXlymQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792505862;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Rspamd-Server:X-Rspamd-Queue-Id:
	 X-Rspamd-Action:X-Spam-Level:X-Spamd-Result:X-Spam-Flag:X-Spam-Score;
	bh=XFlV1RmalC8K0NLEBS3Iy9voYg9q0vdr+81kkTOaZ8I=;
	b=aofeUY604nNYLHSinkqrMVuiri+fYEFel0AmxG0XXIYlVd9FX7nTWX21+YxucQ5w7mlX
	 ZQh1iqQmkM/QTVhZohIXc3dhYl2qdxNUGSOaIRiUMiJFJxqSCKHkiSXZ9xCzTHGmG5IJ3
	 bTiNStVwt96BNZ/C1ONasfFfyWQKvSak0OO4vs9Xr6tjM/wCCv31V0GGGTGsxQDeObCli
	 nvnM2d9qqVLcjsJ4UR96TdECocAspGZLLJW+JlIqNgM9xfFPVMV9+hgLMMvimeSWlo7Qd
	 kPLmP5HchjTbWzYUI4OQQTmf/rWMqDxOstcBwKKL/jvJQLwBQgCspmaDb+s5k2hcSrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=xiF1YwJx;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="/2I8z5qm";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Czn8TwrX;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=VEzo3nLX;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A951D606AA29;
	Tue, 20 Oct 2026 14:17:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A951D606AA29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=xiF1YwJx;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=/2I8z5qm;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Czn8TwrX;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=VEzo3nLX
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D843F1F7BF;
	Tue, 20 Oct 2026 14:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792505860; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XFlV1RmalC8K0NLEBS3Iy9voYg9q0vdr+81kkTOaZ8I=;
	b=xiF1YwJxWKh633YXu8vOeyRtiinwHWTHugDXKac28Vdp9e/gPA4VQ/oa91IbZXXtZE6Ayv
	a5H5qtP/k+mXgjvdETjYWF4DMhELJrLbsaljg70Zaz7UGR22xcC2RNOjBeuAwYtMXuB1Xw
	0v8UkZJC+s0Mor6Us5g/IChplR3PElM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792505860;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XFlV1RmalC8K0NLEBS3Iy9voYg9q0vdr+81kkTOaZ8I=;
	b=/2I8z5qmjd9TFQ/6WzOsuGg6fAjd51S35p3jqv/UX276JBu1ENeP+6X088fLpTl1SAElcr
	4TZ4miqOtbDxdmCA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Czn8TwrX;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=VEzo3nLX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792505859; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XFlV1RmalC8K0NLEBS3Iy9voYg9q0vdr+81kkTOaZ8I=;
	b=Czn8TwrXSbSol1nlB3SJbgF+SvQGzRFpU62+56Z8bWV2utp8+rFOoQqrTcpMKPrZPA2xDv
	pmE7eixs58RG8Mrlkm8bsMIXoWB+MNalCyux+bDIH6SkVJTEtjoB2h132Bd6tCINfJXmt4
	OZr58v90FZZf47X1vJRFmeOHTNIO3U0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792505859;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XFlV1RmalC8K0NLEBS3Iy9voYg9q0vdr+81kkTOaZ8I=;
	b=VEzo3nLXsCuf0u2bZFH3B2JUfYbyHORN/4U8i1SAAHmA1fRj8dOAWPn9z1+5ktTkzQW2zI
	wSetL9XmTJBmZBBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8C961136C6;
	Tue, 20 Oct 2026 14:17:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id VKrBFgN412p8MgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 20 Oct 2026 14:17:39 +0000
Date: Tue, 20 Oct 2026 16:17:39 +0200
Message-ID: <87y0bsfocc.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Ilpo =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	platform-driver-x86@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>,
	Junrui Luo <moonafterrain@outlook.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: ibm_rtl: Fix potential OOB read at signature search
In-Reply-To: <818a69b8-785f-9eec-d93a-89c8833d94fc@linux.intel.com>
References: <20261020130301.351768-1-tiwai@suse.de>
	<818a69b8-785f-9eec-d93a-89c8833d94fc@linux.intel.com>
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
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: D843F1F7BF
X-Rspamd-Action: no action
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[outlook.com];
	FREEMAIL_CC(0.00)[suse.de,vger.kernel.org,kernel.org,outlook.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Spam-Flag: NO
X-Spam-Score: -3.51

On Tue, 20 Oct 2026 15:52:28 +0200,
Ilpo Järvinen wrote:
> 
> On Tue, 20 Oct 2026, Takashi Iwai wrote:
> 
> > The loop for signature search fetches 8 bytes at each check,
> 
> But that's not all it's going to access??

Oh indeed it access further.

> > while the
> > loop count is calculated in 4 bytes unit, which means that, at the
> > last entry, it fetches over the limit.
> > 
> > Correct the boundary condition to "ebda_size/sizeof(unsigned int)-1"
> 
> This seems even more obfuscated than this code already is!

Yeah, the driver code is really ugly, and I made a whip cream on the
top :)

> I think it should do this instead:
> 
> (ebda_size - sizeof(*rtl_table)) / sizeof(u32)

Hrm, this will result in the omit of the last loop entry?

I guess it'd be better understandable rather by directly adding the
offset in the loop instead of the counter.  Something like below.

> Admittedly, it a logical change too but why you think only partial RTL 
> table is good enough just because signature can be checked? After the sig 
> check, it will read the struct beyond that.
> 
> ...And that other sizeof() should use u32 as well.
> 
> 
> Unrelated to this change and if you have this HW and can test changes, it 
> would be nice to also get rid of the debug parameter and use dynamic 
> debugging instead of RTL_DEBUG() for consistency.

No, I don't.  It was caught only through reviews at backporting to the
distro kernels.

> I also don't understand why it's mixing readq() and ioread*() for reading 
> from the same area.

I guess it's just an optimization for the signature check.
The driver needs significant code cleanup, in anyway...


thanks,

Takashi

-- 8< --
From: Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v2] platform/x86: ibm_rtl: Fix potential OOB read at signature
 search

The loop for signature search fetches 22 bytes of struct ibm_rtl_table
at each check, while the loop count is calculated in 4 bytes unit,
which means that, at the last entry, it fetches over the limit.

Rewrite the loop to use the byte offset and correct the boundary
condition check for avoiding the potential OOB access.

Fixes: 15dd100349b8 ("platform/x86: ibm_rtl: fix EBDA signature search pointer arithmetic")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 drivers/platform/x86/ibm_rtl.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/ibm_rtl.c b/drivers/platform/x86/ibm_rtl.c
index 139956168cf9..6f0a10e1d81e 100644
--- a/drivers/platform/x86/ibm_rtl.c
+++ b/drivers/platform/x86/ibm_rtl.c
@@ -234,9 +234,9 @@ static const struct dmi_system_id ibm_rtl_dmi_table[] __initconst = {
 };
 
 static int __init ibm_rtl_init(void) {
-	unsigned long ebda_addr, ebda_size;
+	unsigned long ebda_addr, ebda_size, offset;
 	unsigned int ebda_kb;
-	int ret = -ENODEV, i;
+	int ret = -ENODEV;
 
 	if (force)
 		pr_warn("module loaded by force\n");
@@ -271,9 +271,9 @@ static int __init ibm_rtl_init(void) {
 		return -ENOMEM;
 
 	/* search for the _RTL_ signature at the start of the table */
-	for (i = 0 ; i < ebda_size/sizeof(unsigned int); i++) {
+	for (offset = 0 ; offset + sizeof(*rtl_table) <= ebda_size; offset += 4) {
 		struct ibm_rtl_table __iomem * tmp;
-		tmp = (struct ibm_rtl_table __iomem *) (ebda_map + i*sizeof(unsigned int));
+		tmp = (struct ibm_rtl_table __iomem *) (ebda_map + offset);
 		if ((readq(&tmp->signature) & RTL_MASK) == RTL_SIGNATURE) {
 			phys_addr_t addr;
 			unsigned int plen;
-- 
2.55.0

