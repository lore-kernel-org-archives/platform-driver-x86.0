Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E03B158875
	for <platform-driver-x86@vger.kernel.org>; Fri, 31 Jan 2025 09:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738317166; cv=none; b=MsIs5PxorFJGAyWi/g2b9maPYaSjulSyh5P1sFj6e8wn/1XPbI5x3fFZms4yAN5JjlhdEUNY681gUek6fYG8U6Hv3LOmeUv1qhnoSykJKu0QvA0Fn4qkXaqQyFbWQzLeNZbFIrtwueHokVh+1Fri+u4oZl9Ij76runa0TBzFHXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738317166; c=relaxed/simple;
	bh=iZN/uswKdIpQVaSgAbG9dpVC3AlstYdzzDOqnhB3bCM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XDsskwMXvXVWdjQZj743fQgkMlv5hKnIu/nYiKkBZ7gpJ6lFdTyVcNXbGDR1HoPeXEp4FMPpXF1aaJQ1RczK2n6+MqZusR6aiuXA54b1IFL9uiZ6N6rzFNZe1leUAxQf1uwcGzXwVJqNsaH7dBbl5aKMhv0wuMjBueU5ePF7dWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4AF5121173;
	Fri, 31 Jan 2025 09:52:43 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0D5E8133A6;
	Fri, 31 Jan 2025 09:52:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wArtAWudnGcvJAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Fri, 31 Jan 2025 09:52:43 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: ilpo.jarvinen@linux.intel.com,
	hdegoede@redhat.com
Cc: platform-driver-x86@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: [PATCH 2/2] platform/x86: thinkpad-acpi: Do not include <linux/fb.h>
Date: Fri, 31 Jan 2025 10:51:10 +0100
Message-ID: <20250131095235.125533-3-tzimmermann@suse.de>
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
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: 4AF5121173
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 

Nothing in this source file requires <linux/fb.h>. Remove the include
statement.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
---
 drivers/platform/x86/thinkpad_acpi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 2cfb2ac3f465a..b078bbcbc29c8 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -39,7 +39,6 @@
 #include <linux/bitops.h>
 #include <linux/delay.h>
 #include <linux/dmi.h>
-#include <linux/fb.h>
 #include <linux/freezer.h>
 #include <linux/hwmon.h>
 #include <linux/hwmon-sysfs.h>
-- 
2.48.1

