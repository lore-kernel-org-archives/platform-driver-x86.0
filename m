Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501388;
	b=O42fNqdGgkLWZsUNN1VAzDGlLrZ1amqxKaDJLDmZUhAbwTKsNdnL5Ir2aqR9/PvHwTCl
	 8xKnErRXH3gGw5BDHzFT2x/7p2Kj+zEe9yZqEa1DyQahn4mAAywyiILnv7wwGAcULpx9f
	 INcit0vLPefSdEUiodQi2vWDgIdvlB17b2jPiUB1cxeTsAfPpHyCYQmLuVJuqi2tAQO+n
	 EGkgMQBkMc3yW4qaIa5pOkZ7bpTwOf2q1NYUODFq0MBuWj2Z9ajz4n2nGqTKyh41QHg4I
	 ieDqNC0v8hXgRRjY8JSAhCz+usd2QyKOc0cw+X8QfLaT/4dhNTWSFhRscB5K9RgwUlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501388;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-Rspamd-Action:
	 X-Spam-Score:X-Spam-Flag:X-Spamd-Result:X-Spam-Level:
	 X-Rspamd-Queue-Id:X-Rspamd-Server;
	bh=wF/nYhHmVeA4CBwrh5Re1qQm3brtqVbdsdS+KXwbiLs=;
	b=v4pMSiEepebYpmYj+DtG8fEhi0y8r4i2vsas46NtRmVjaiNZtEZKPu+PGENPyNxV5yDT
	 xR4mD4m/VwDkKt1U6nEDXKtul7S18oR8eJQq8yuboJ41ouUKQMpTZxHi0VGmDExMCjtGY
	 nA0J6ZGXMB9/G6/cRA5qYB2P6ppzIDOvIhxgQV6K5j55PKLhUN/6mtWrsHOYY2xDXm646
	 lUlbsHdAwPGwumbNhdC45Oq9pNXRgqsyUZ1l4e34mHO1Q5UcLvKl2OmLGJO/6Q8N1z0OA
	 ua1euAgZ/4qe4sKnf5ahKuDhIhVCJXV+s1/MzJE1zi5639sWtsjiQsmiRtylGbG2CWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=BDHCh+zy;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=nyQzGS1g;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=GvtJ4SMq;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=eJgosbGX;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98776606A326;
	Tue, 20 Oct 2026 13:03:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98776606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=BDHCh+zy;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=nyQzGS1g;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=GvtJ4SMq;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=eJgosbGX
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D76301F7BA;
	Tue, 20 Oct 2026 13:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792501384; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=wF/nYhHmVeA4CBwrh5Re1qQm3brtqVbdsdS+KXwbiLs=;
	b=BDHCh+zy4XkOB8w4cb8G6FwhPGvAX8pYizYk7wQtr7fUVp5V3zkyCQkgo+c7tzWKLznzy3
	3sjvxAmoGtUIj2AdxaF8AZDDBqAEwQ58w3J/rUqPXsalG9j2AUhKvTJAL6Ve1NjrU6ttJP
	w+tHU5ZduZ8CM/vFzdYR3mcdGefV+XQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792501384;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=wF/nYhHmVeA4CBwrh5Re1qQm3brtqVbdsdS+KXwbiLs=;
	b=nyQzGS1g/mF8TBTpTLHRwwHYOUdgUDgeo2DWpgA/C1Z10VyxpYHHynEM8chbBJdxwJxtCq
	4OdzYvQUjW2/xeBg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=GvtJ4SMq;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=eJgosbGX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792501383; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=wF/nYhHmVeA4CBwrh5Re1qQm3brtqVbdsdS+KXwbiLs=;
	b=GvtJ4SMqwn6rLkONyjg8Vru0GW3c+auSejC96Ov38A21aIwnmpUa2h54kaHsLbKDBXCbzO
	tBSn7QFU7p+GqbnMHBMI9RycRF1rzfLtbvQAYG/O8AGyuM/TfhJ0V9aXWQ2WFeCGcGUT5m
	pzt/L5UZ0k2XWoTkKRY8IKm05q+IMbY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792501383;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=wF/nYhHmVeA4CBwrh5Re1qQm3brtqVbdsdS+KXwbiLs=;
	b=eJgosbGX1Mi0RLWyKAYQJReGt/6b9Soc2Ggus/GSeuQh59UlIOjX/RXPpI05isBmpAhNow
	YCzLkWAro6/m+ZBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 89EC4136CC;
	Tue, 20 Oct 2026 13:03:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id FFybGIdm12oaYwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 20 Oct 2026 13:03:03 +0000
From: Takashi Iwai <tiwai@suse.de>
To: platform-driver-x86@vger.kernel.org
Cc: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Junrui Luo <moonafterrain@outlook.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: ibm_rtl: Fix potential OOB read at signature search
Date: Tue, 20 Oct 2026 15:02:26 +0200
Message-ID: <20261020130301.351768-1-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,outlook.com,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[outlook.com]
X-Spam-Level: 
X-Rspamd-Queue-Id: D76301F7BA
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org

The loop for signature search fetches 8 bytes at each check, while the
loop count is calculated in 4 bytes unit, which means that, at the
last entry, it fetches over the limit.

Correct the boundary condition to "ebda_size/sizeof(unsigned int)-1"
for avoiding the potential OOB access.

Fixes: 15dd100349b8 ("platform/x86: ibm_rtl: fix EBDA signature search pointer arithmetic")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 drivers/platform/x86/ibm_rtl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/ibm_rtl.c b/drivers/platform/x86/ibm_rtl.c
index 139956168cf9..6d6998049d8c 100644
--- a/drivers/platform/x86/ibm_rtl.c
+++ b/drivers/platform/x86/ibm_rtl.c
@@ -271,7 +271,7 @@ static int __init ibm_rtl_init(void) {
 		return -ENOMEM;
 
 	/* search for the _RTL_ signature at the start of the table */
-	for (i = 0 ; i < ebda_size/sizeof(unsigned int); i++) {
+	for (i = 0 ; i < ebda_size/sizeof(unsigned int) - 1; i++) {
 		struct ibm_rtl_table __iomem * tmp;
 		tmp = (struct ibm_rtl_table __iomem *) (ebda_map + i*sizeof(unsigned int));
 		if ((readq(&tmp->signature) & RTL_MASK) == RTL_SIGNATURE) {
-- 
2.55.0

