Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793067060;
	b=DHvU6ZyZXEiZWSyFZBBycD5SLJlqqck2k4/2V1QH3cvjYAaDVCi7Nc89e5Q8hGAy7snK
	 K2NRwQ6bHt2Y8OUYmXHNOBJGazPnSBTmiaNpU4rRZuxJHgbVUmEWlO4Na0vXxYIS0x7V7
	 gPXDmCquRc7Hh9sPeCyZPDzebEMkApJ+/+5ngOJuUFAHRlXZ2uXdr2xKrfczccVr1qVB4
	 ccSgOkVF4Xs0S9eUecjj2lSinuKbthC1UIE2E4YJ1pxnejpujvvTOsgOWCW2jLvorF07D
	 wzYL6LrOSVwDsqQLNfAMN/f2yDvyindd6OmoKgkhUs4sLc+NMvXLRvGyk8Fk3bwDIfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793067060;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=GxBA4J5RiUUMvNo6tl6YNVwy0jvR1eX7L3/i8ZVGdD8=;
	b=5U5rHDj3TZdGKH0/SpvF5haRjT/geSi43YGFikEgbM1+WZ0OtxS1OXLNP2+pPFkGXVlS
	 Gd4Uf1A+YBSRGd2HJMRFKlIJZ1gXmGq+5OI8cg6D4TKmejXGHXLfEWE/cezTJxqTxY7fS
	 G40+1vC9OUQz8UqOnIDwVB1cyiN/nFS7vgRyzzpjybGElb62DOlgwaNVidrFdx0zzlq0S
	 0wEmFdh7TCCguAMtkEd82IeLHl10MHM9VqUsCchh/hdRRQjQ99T3PqhNmQoqoJyin0hwu
	 ctSLN/p7zpqldic5WTyqvvcPJmb3Ww5bYKzmmhVD+4/IwTGr90OCZscwfLnYA/357cA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sIejQ8qz;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EDE6606A31D
	for <platform-driver-x86@vger.kernel.org>; Tue, 27 Oct 2026 02:10:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EDE6606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sIejQ8qz
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-369f33df08eso4229830eec.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 26 Oct 2026 19:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793067059; x=1793671859; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GxBA4J5RiUUMvNo6tl6YNVwy0jvR1eX7L3/i8ZVGdD8=;
        b=sIejQ8qz4jeYBukvPiHcU5OiqfVAGRR1Y5iW3mSFDPbGf7Qc7I6Xy0KucnZ62HZMvi
         +j7LliwyQmb0kvrDCP30zY7umd3dRzJzAxn3pYjDv0NuYVRHIaSyvRbzKCCX8M7ehACU
         EEzFYh9CMSaDro/XzTC6/34PnYqVaAvUvZLxNVMS4UZGrnpLNroVBwzbFqFa+1cvm8h2
         0ngaFsGwrqVJiVaWaDKyEiAknhfZFC5Txp4V5JMu7FhC7li9vdC2fFG2O3NKu2cOZquw
         o33SbzM9auEEZkF62upKr7BTly+nDkRfS80siVlToI7TkaSCVztpNra2jNvlXcuMjrq1
         QU9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793067059; x=1793671859;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GxBA4J5RiUUMvNo6tl6YNVwy0jvR1eX7L3/i8ZVGdD8=;
        b=F3hIZWf1eWml+3V4yQYMV5U1LXbyI2S7x9xtWDWM/pJ9KG24GSrOXoZgCPJpqJRwrv
         57oDRPRpCbWicplhk7eClH2X506i9ZeBctmjPeRNqOHdktxTgd9zC7QJujALRa3Q1csI
         anJSKTzmOxSMP2WNYzMPTgojQSfXBB6vMsdvI9TIiBTefQB0qsTs2J7brddu9avqlgmA
         T9HAXquZ+1mcepn0TydzdMj3RKRLCEPG72m/yMhxEuwJpV7DPDDqoEhqW9s5IYQpgu2D
         jKBqur+kPhGPm5ejjui01D5ZIMWct7B1rjeSdm1kXFmucqzw5XW542DOmyTYJvsLjXc7
         KjyQ==
X-Gm-Message-State: AFq9FYIOT6n/zyuf5By1W4j6bFyzfotuOcB8WsChNdQL6+brZFBUAtOW
	6wtZ+e3Ub0RjqHHprDtUb0+GGja2PEvV5xrMU/jAWvuEvtTjSTn1RS6saLegdz3W
X-Gm-Gg: AYBFou0rtLVY2ku1sLiDehGbb+b2PYnF4FVZWXOewlBqDKW3cCpNnnwhntuKvMuH2+q
	2L9SBM1zJz9DNbbo2Dx3HrjgQn6m8H5o0MykTLjTat+gVoYaF6Ll1Z4U0+agrz9wo5w588e4DmL
	pmT9qfXxXbCfTYHqa+SzrMbPkerQJ7xzmvBhQb7gdpmfQE8BiV2r/amzqojewvNZyZqHAxfVkYO
	HzsutAQ3NT8LHGOUkx3eytVlHx5H0jCg7Ewu1LS52Lhw5xmjpcMa7r2/10NN8nkAv8A9IpmqsT2
	tIfw1vqoCbHw5lX6Zi0qlfNKYdsMT/SscG7a8p/Qq4ITThqN3gtA/fbjlGvkAypeI8FNbJff/A5
	lRZ2uQLHQ+D/kWsP/MFmMAYzcdlXTAk5uS9lrK6Fnzs1XnyDoiosKK+pggn03uuTwnQdQ1C3+jl
	N0cwq1kkNJLFoaKUrV/r8uazQYYAzb17tlBP7Xygujq62ipshGsqBmBmPG+kSj8zq5hHVSyC+xO
	oAwZ2UqpxZePqXjBZk9BL301zIQdzqOeZ+p+wnsVkWBG01xqN8G87rP8lwKSmxDGoMzq7xh5Hqk
	mdnXhSc3AWM=
X-Received: by 2002:a05:7301:5158:b0:369:fe81:a575 with SMTP id 5a478bee46e88-369fe81aa97mr7798024eec.35.1793067059062;
        Mon, 26 Oct 2026 19:10:59 -0700 (PDT)
Received: from localhost ([112.204.100.142])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-369e8daa3a8sm36120822eec.16.2026.10.26.19.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 19:10:58 -0700 (PDT)
From: Alex Yeo <alexyeo362@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: alexyeo362@gmail.com,
	Kenneth Chan <kenneth.t.chan@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: panasonic-laptop: add pr_fmt
Date: Tue, 27 Oct 2026 10:09:53 +0800
Message-ID: <20261027020954.92205-1-alexyeo362@gmail.com>
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

Kernel messages originating from panasonic-laptop on dmesg do not
specify its origin.

ex:
[  +6.009811] Unknown hotkey event: 0x0030
[  +0.229942] Unknown hotkey event: 0x0031

Add pr_fmt so that messages from this module now show up as:

[  +0.209860] panasonic_laptop: Unknown hotkey event: 0x0031
[  +0.160149] panasonic_laptop: Unknown hotkey event: 0x0030

Signed-off-by: Alex Yeo <alexyeo362@gmail.com>
---
 drivers/platform/x86/panasonic-laptop.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/x86/panasonic-laptop.c b/drivers/platform/x86/panasonic-laptop.c
index 19d194ff37ca..080e306f796c 100644
--- a/drivers/platform/x86/panasonic-laptop.c
+++ b/drivers/platform/x86/panasonic-laptop.c
@@ -119,6 +119,8 @@
  *		- v0.1  start from toshiba_acpi driver written by John Belmonte
  */
 
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
 #include <linux/acpi.h>
 #include <linux/backlight.h>
 #include <linux/bits.h>
-- 
2.55.0

