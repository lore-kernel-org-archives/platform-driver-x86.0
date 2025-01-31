Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710A41A3BD7
	for <platform-driver-x86@vger.kernel.org>; Fri, 31 Jan 2025 09:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738317172; cv=none; b=tt/wHvCh8y5dNB7LF+oF0udcCJ/qT0f2DUbwvQ4T7zunN1N1s8K49dZx7p5rDsq4931bUuc4eo02qjZBBqnZqyJvYCZ07fW8wJz134KzmikmZVlTAkRIB6FwVyVKM0q7A3BYTDGZD8Zw8rI9iWj5tuV1GwII3p93UNdx33fwYU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738317172; c=relaxed/simple;
	bh=hVQPADV4Ofycy2J0mQA9taSlh0ZXCF/YfCTEus0w+Cw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mX1QjH8Tv6vSI4BnCx3BGHYnWEedrym2AhQBFwgWWaA9Gt3uLcv1s/tEzX1tTcKpxYp4EOHYQwyeWCV8IT/Y1cu5tNeAHn/Tc6Mx1LgbKmL0ivMfBEUMghyeN5Rj2M+d+n9LWEkBdLEOERoD+CduvRg39drgHCKoz1bPe/otfpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wiYI3NBd; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=S+xNdr0S; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wiYI3NBd; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=S+xNdr0S; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wiYI3NBd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="S+xNdr0S";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wiYI3NBd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="S+xNdr0S"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 079D81F38D;
	Fri, 31 Jan 2025 09:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1738317163; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iDolVywQqxFcdon3dkfu/RVd//hsiduCuIML+Cb7zfo=;
	b=wiYI3NBdITId8GE/A3fP8+lfaytL2pzzMMPsguBW85td3bfP0ZTnlNOEVfYXG05EZheo3Y
	BFh0KCc4zbFI5clsaC/lg3nfl7ta0vBRnLnfozOdSSwISSJyLrlSth87qwnxNH7qBwp6hL
	SXRW56K+tWGI/D9Ur9xN1xeWkw/0Nac=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1738317163;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iDolVywQqxFcdon3dkfu/RVd//hsiduCuIML+Cb7zfo=;
	b=S+xNdr0SJIyh/TUJkhcg+IUvU7EPbMgGVtOjhX+UCXV6ABAk8DKKDE/G6NjdaU/4Ft1Bv6
	UHFUYYT8nROTNBAg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1738317163; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iDolVywQqxFcdon3dkfu/RVd//hsiduCuIML+Cb7zfo=;
	b=wiYI3NBdITId8GE/A3fP8+lfaytL2pzzMMPsguBW85td3bfP0ZTnlNOEVfYXG05EZheo3Y
	BFh0KCc4zbFI5clsaC/lg3nfl7ta0vBRnLnfozOdSSwISSJyLrlSth87qwnxNH7qBwp6hL
	SXRW56K+tWGI/D9Ur9xN1xeWkw/0Nac=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1738317163;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iDolVywQqxFcdon3dkfu/RVd//hsiduCuIML+Cb7zfo=;
	b=S+xNdr0SJIyh/TUJkhcg+IUvU7EPbMgGVtOjhX+UCXV6ABAk8DKKDE/G6NjdaU/4Ft1Bv6
	UHFUYYT8nROTNBAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C9A29139B1;
	Fri, 31 Jan 2025 09:52:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id aOLpL2qdnGcvJAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Fri, 31 Jan 2025 09:52:42 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: ilpo.jarvinen@linux.intel.com,
	hdegoede@redhat.com
Cc: platform-driver-x86@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Cezary Jackiewicz <cezary.jackiewicz@gmail.com>
Subject: [PATCH 1/2] platform/x86: compal-laptop: Do not include <linux/fb.h>
Date: Fri, 31 Jan 2025 10:51:09 +0100
Message-ID: <20250131095235.125533-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250131095235.125533-1-tzimmermann@suse.de>
References: <20250131095235.125533-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-5.30 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	ARC_NA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,suse.de,gmail.com];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Score: -5.30
X-Spam-Flag: NO

Nothing in this source file requires <linux/fb.h>. Remove the include
statement.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Cezary Jackiewicz <cezary.jackiewicz@gmail.com>
---
 drivers/platform/x86/compal-laptop.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/platform/x86/compal-laptop.c b/drivers/platform/x86/compal-laptop.c
index 58754bc5b5b17..abbebd4bfb151 100644
--- a/drivers/platform/x86/compal-laptop.c
+++ b/drivers/platform/x86/compal-laptop.c
@@ -69,7 +69,6 @@
 #include <linux/hwmon-sysfs.h>
 #include <linux/power_supply.h>
 #include <linux/sysfs.h>
-#include <linux/fb.h>
 #include <acpi/video.h>
 
 /* ======= */
-- 
2.48.1

