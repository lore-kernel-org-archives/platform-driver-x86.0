Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F373115AF;
	Mon, 31 Aug 2026 11:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788176648; cv=none; b=Yrmj4cppcir9x7iMD4TvAsVf/Aa7MaO2lyqeIFM8hnJQqM1Sd4qsFtY+qdDZ3Cy1VhO0yofmSbA1Ieb7gTozYQltdFP8X3Ffz80IUsZPPw0Js/OcfGv0CPnc2XOGCn4xyPQd2Uxvzv1Io1UEtlpoXySLXS7SNkH8oeDE/7awv0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788176648; c=relaxed/simple;
	bh=bBlMeojJuqGzLYSgmcVeE+CDvHG6OHCDGr3A3WpxBs4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s5ITW+iqY8mr6pj9J6Oq65kJ8/qiYuaqPsi+TO/hQ9OD9x2yjNaoo494gvm15tx5+XKO8ZUvg6n0C2ZQviVUtIhw9kSJ5CtoUimdjOOCzbNlp6loHa+7b4BX48j13C70SIRL5+55BAJ/S9/JMfZUjw+H6ukcJs8sgiYRT0BQVEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZNO3Cmu5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=EexUdg3q; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qZo4PXYC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=WMKrJopq; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZNO3Cmu5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="EexUdg3q";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qZo4PXYC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WMKrJopq"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B38E31FB3C;
	Mon, 31 Aug 2026 11:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788176640; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=sKUz1RcRmIY8nC4tiEVUTstSXZ30OhbvFxIOCZ1dnoA=;
	b=ZNO3Cmu5miO7QHxGQOznNMhw7Yx0PJfO+Cj6PkY7LBdzsDMyB3KjPXBworgux7G8pJXX4j
	0jULNOxwC7apW9+s4C+4Us066GabKfKZU/GAoMpyJsQR26JUqJx66rr3Nyi10AIyK7mGte
	ANylm1BZGhRCAhIqfhoOnJW8X19HTGo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788176640;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=sKUz1RcRmIY8nC4tiEVUTstSXZ30OhbvFxIOCZ1dnoA=;
	b=EexUdg3qU76e3OpFRdXwZtMbATI9ci8q+kZWb/7140gjeZNsUWcaoLU/2o1XojVRPn8PJI
	ScPNt/Xo+FKyY0DA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=qZo4PXYC;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=WMKrJopq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788176636; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=sKUz1RcRmIY8nC4tiEVUTstSXZ30OhbvFxIOCZ1dnoA=;
	b=qZo4PXYCMwcDbMmCiiguheUH9di288HfVJKboCZYYVx9t47RyQT3oP6mU+OUQElifw3smb
	rZ7KKjXvKSao6A05V83XMfHBFQ1zlZ5pK1+WDODoVZEzHZqZihUdxDWhnDxvyN52S/s/Nw
	Fm5pjLiFNFUrbZ0bh1wRfj1FL/cvlEg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788176636;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=sKUz1RcRmIY8nC4tiEVUTstSXZ30OhbvFxIOCZ1dnoA=;
	b=WMKrJopqt61VTulPivSuNN8Qk/7dB16e4emlEn3wr76LDHMO47HKoCFScmfwT5lI8lNNL9
	W3APQt1/7M23zkDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0ACCA13515;
	Mon, 31 Aug 2026 11:43:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 45R0OvtolWrSWAAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Mon, 31 Aug 2026 11:43:55 +0000
From: Pedro Falcato <pfalcato@suse.de>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Sanket Goswami <Sanket.Goswami@amd.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pedro Falcato <pfalcato@suse.de>,
	Oleksandr Natalenko <oleksandr@natalenko.name>
Subject: [PATCH] platform/x86/amd/pmf: fix build on !CONFIG_AMD_PMF_DEBUG
Date: Mon, 31 Aug 2026 12:43:46 +0100
Message-ID: <20260831114346.2041361-1-pfalcato@suse.de>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: B38E31FB3C
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_SEVEN(0.00)[8];
	SUBJECT_HAS_EXCLAIM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:email,suse.de:mid];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.01

amd_pmf_get_ta_custom_bios_inputs() is used by non-debug features.

Fix the build on !CONFIG_AMD_PMF_DEBUG by moving
amd_pmf_get_ta_custom_bios_inputs() outside the ifdef CONFIG_AMD_PMF_DEBUG.

Fixes: 5bda82c797c9 ("platform/x86/amd/pmf: Implement util layer ioctl handler")
Reported-by: Oleksandr Natalenko <oleksandr@natalenko.name>
Link: https://lore.kernel.org/all/fS7s9V_xTaedaqEAaxwKnQ@natalenko.name/
Signed-off-by: Pedro Falcato <pfalcato@suse.de>
---
 drivers/platform/x86/amd/pmf/spc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
index 94355b435a66..592ba4de4c7f 100644
--- a/drivers/platform/x86/amd/pmf/spc.c
+++ b/drivers/platform/x86/amd/pmf/spc.c
@@ -17,7 +17,6 @@
 #include <linux/units.h>
 #include "pmf.h"
 
-#ifdef CONFIG_AMD_PMF_DEBUG
 u32 amd_pmf_get_ta_custom_bios_inputs(struct ta_pmf_enact_table *in, int index)
 {
 	switch (index) {
@@ -31,6 +30,7 @@ u32 amd_pmf_get_ta_custom_bios_inputs(struct ta_pmf_enact_table *in, int index)
 }
 EXPORT_SYMBOL(amd_pmf_get_ta_custom_bios_inputs);
 
+#ifdef CONFIG_AMD_PMF_DEBUG
 void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
 {
 	int i;
-- 
2.55.0

