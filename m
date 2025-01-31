Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3CE322B
	for <platform-driver-x86@vger.kernel.org>; Fri, 31 Jan 2025 09:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738317166; cv=none; b=KYgPXwC9AcsSihk37MVwGMg3FGMFKUaEZh/adPomzM1a8ojACoboqbddsK0YRx1NrwkIU4zpcYZdHJFxveyLmdK5PK+RpSo56JXW7SnIV19zb8fhZuHaJva3PrOk8ahfQ58AajU3vF0kOSOv40zNuw/zFpYpRsiiAa/Jf4OeGHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738317166; c=relaxed/simple;
	bh=UlnGNcA/ONNC5yHvHqSD1t4FSAL0roigYVgZmpioyNc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Wm8Uyf7b06hY1pUu09G0SNzNGSEaDOX/1FcbYq4SHtUQU59AAWSrvdgvjaQ57+3asfMlkPrdarS0Bl0+m0tJi36ydxmrsGcQkzV7GfG5xS0ewDAjGH1YCcRuuZrja/Qrldaqeb1r4BMBbEHJve+fokYsFx7k4YZMEvXu/2sopJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=emN7r/pr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LmrxSqyS; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=emN7r/pr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LmrxSqyS; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="emN7r/pr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LmrxSqyS";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="emN7r/pr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LmrxSqyS"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C7A9421170;
	Fri, 31 Jan 2025 09:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1738317162; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=YA7M1u1R4eRwKCe+85VmP2tfcRTFxWySy4DgwiPy2PM=;
	b=emN7r/prlDl3oG4FD5NBdFW8Ub7c/7KkkdAchYmzDc7JWZQdiXzfKfKvEFhMA/ZryeYm06
	dk7FCc4N/F+p6mBDOEXLx3Befa1sykzQb32Dbg2nH/YtIEPvXOhqWv+WxU5nhBWgNN5uTD
	HLaYSMNpIhoLtkzxlfnINfG7V8W+rsk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1738317162;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=YA7M1u1R4eRwKCe+85VmP2tfcRTFxWySy4DgwiPy2PM=;
	b=LmrxSqyST7Ply2KpysAcpxrz83E3uGDPic1Fkp3mThL+jXQ2o5ToE3ucRnga+UjibU1ldZ
	dtTC5UfgN6rxwXBA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1738317162; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=YA7M1u1R4eRwKCe+85VmP2tfcRTFxWySy4DgwiPy2PM=;
	b=emN7r/prlDl3oG4FD5NBdFW8Ub7c/7KkkdAchYmzDc7JWZQdiXzfKfKvEFhMA/ZryeYm06
	dk7FCc4N/F+p6mBDOEXLx3Befa1sykzQb32Dbg2nH/YtIEPvXOhqWv+WxU5nhBWgNN5uTD
	HLaYSMNpIhoLtkzxlfnINfG7V8W+rsk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1738317162;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=YA7M1u1R4eRwKCe+85VmP2tfcRTFxWySy4DgwiPy2PM=;
	b=LmrxSqyST7Ply2KpysAcpxrz83E3uGDPic1Fkp3mThL+jXQ2o5ToE3ucRnga+UjibU1ldZ
	dtTC5UfgN6rxwXBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 91F2F133A6;
	Fri, 31 Jan 2025 09:52:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Z1/HIWqdnGcvJAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Fri, 31 Jan 2025 09:52:42 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: ilpo.jarvinen@linux.intel.com,
	hdegoede@redhat.com
Cc: platform-driver-x86@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/2] platform/x86: Do not include <linux/fb.h>
Date: Fri, 31 Jan 2025 10:51:08 +0100
Message-ID: <20250131095235.125533-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

These two drivers include <linux/fb.h>, presumably for backlight
support. It's no longer need, so remove the include statement.

Thomas Zimmermann (2):
  platform/x86: compal-laptop: Do not include <linux/fb.h>
  platform/x86: thinkpad-acpi: Do not include <linux/fb.h>

 drivers/platform/x86/compal-laptop.c | 1 -
 drivers/platform/x86/thinkpad_acpi.c | 1 -
 2 files changed, 2 deletions(-)

-- 
2.48.1

