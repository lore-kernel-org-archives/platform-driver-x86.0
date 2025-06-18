Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1D62E9EAC
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Jun 2025 12:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750249683; cv=none; b=rpu+v8wHH3VBrq19EAZ1jaA8zEwjj1dYXKAbYjYapOqAY5oJ4jS8YUf60TmGNIahA6qBkED9Kdvaqr9/NBl49lIfA4NFhTA73cfKWZf4VVN8lJuDfiLSpzkS2UbneCQyWagJMWf2+bkH3Q7fnJmmfowubnEYuLFEAM6QncLwl+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750249683; c=relaxed/simple;
	bh=O2ozBeMtgUzNlgGSf11PW0jhYWfdALT79w/DkiLnqwc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hSrf+qVZa3KDWKLI/7dnpuPJouWu03gmW0Ac6CZliokeCzRx+PqdyKphfkpsZbl6iPt4ZV51GEZO8asMEWnTk+HMpx2YKr1M9sl6xByI7zr7UN/KaYm+fq1rugP/NZHW8iEpIzpGhEDi6w1bzebgomg9iaSXix8NT0BpVD8utR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id CC8011F7C6;
	Wed, 18 Jun 2025 12:27:38 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 265ED13721;
	Wed, 18 Jun 2025 12:27:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qDMrCLqwUmg4UgAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Wed, 18 Jun 2025 12:27:38 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lee@kernel.org,
	danielt@kernel.org,
	jingoohan1@gmail.com,
	neil.armstrong@linaro.org,
	jessica.zhang@oss.qualcomm.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	fnkl.kernel@gmail.com,
	j@jannau.net,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	sven@kernel.org,
	alyssa@rosenzweig.io,
	neal@gompa.dev,
	deller@gmx.de,
	support.opensource@diasemi.com,
	duje.mihanovic@skole.hr
Cc: dri-devel@lists.freedesktop.org,
	asahi@lists.linux.dev,
	platform-driver-x86@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-fbdev@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 06/12] backlight: Include <linux/of.h>
Date: Wed, 18 Jun 2025 14:16:38 +0200
Message-ID: <20250618122436.379013-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618122436.379013-1-tzimmermann@suse.de>
References: <20250618122436.379013-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[];
	TAGGED_RCPT(0.00)[]
X-Rspamd-Queue-Id: CC8011F7C6
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -4.00

Include <linux/of.h> to avoid dependency on backlight header to
include it.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/backlight/backlight.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/video/backlight/backlight.c b/drivers/video/backlight/backlight.c
index 9dc93c5e480b..1e9b7e85d99a 100644
--- a/drivers/video/backlight/backlight.c
+++ b/drivers/video/backlight/backlight.c
@@ -16,6 +16,7 @@
 #include <linux/ctype.h>
 #include <linux/err.h>
 #include <linux/slab.h>
+#include <linux/of.h>
 
 #ifdef CONFIG_PMAC_BACKLIGHT
 #include <asm/backlight.h>
-- 
2.49.0

