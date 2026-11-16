Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794873338;
	b=akrD/LfQSSe1JYqW7MYz0QYtY3i7yy16VEWgtPSaXZLGtDeqbIl4UH3kGGxwluLf+/rQ
	 8Me2Cr60VfOUW80ZvH7z5Q1kbezJEWaxnuS1rD24i6KLWqOI+D+dWr1WeN7omofkmu+e/
	 w7y3eBAbExeyyuuXaO6eve3Z7JXSwQiMMGlkUQL6NJ0cRE/nzboa99pycBeCNIHSrUuaa
	 vh13bk8U2T2mZppOl8DAfyeoP5X7/ci+94OyAnOVzR3fqt/byDHIePryQ1YZ/WmvdNYqy
	 lC1S2U6iAdClTYvCiWPlIDb6NbDM4PgC3b6DTjwPTGi6QO8okPMJcMtrt0zZYpMAvMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794873338;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8MPRw3LQfTqYHlcJl5tPwvhjuAVhHnRcl8N9cOa0d/M=;
	b=WguQik4Okxygaj/4BaZVyxQ6b5ucmb9CHqBJvIk3T3U76OHFXE72VW3FOhPirRlbgSrH
	 OK5WmQII8VbUBXzUECoFARjSAf/HvVM5Bl8kxiZGpQ1VcZ9CBPLLPZ2KemTdTBWpWATtO
	 XSQ321bVkYWZnicrTnl4YCz/R94lHr/4YAidR8lCZQ7fAyomba0rK5pc96o1t3rj7DirE
	 oHlfjv5DM7Dc3mvyghVO6xTT0Kfs06DBTD5cvmSz544BjAJ0MWPGTEbdqK9p0FOGqsFwo
	 P2xeHm9UHURSt99/Lt1z5n2fprZpeIENrns7z6Cl6n+hJWv/lMRxjy3tjRGyAhmkwow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Kw4UBy81;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 985E6606A31C
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Nov 2026 23:55:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 985E6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Kw4UBy81
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3704d30b84fso4835220eec.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 16 Nov 2026 15:55:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794873337; x=1795478137; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8MPRw3LQfTqYHlcJl5tPwvhjuAVhHnRcl8N9cOa0d/M=;
        b=Kw4UBy81ubsUqCKGJl2+xVHXl4sWhglklxqpGdY21dvgS7h76Ec9Z+yNJbc2ehOcWP
         e855W+8ke2ttWHWwce8LG/UMta9tnmV/qWVLop0CwQ5+m33IXNt77xSMl3DDiy3gA3qO
         kqbaU4ha2QuVnxo3oIAtx8TjY/ex4+BDCX+b9ZS3+dgTAAFfosM5+wmqX508FtRsj5yT
         AP3zmz68mhjxKPvAngj8xq5wtDPw7OIrlhm//TMaHuxxbpqXj2qpNPZ1R1FvkX6jkts3
         4yjL5UJnLfGVcKWpN9xy8kOaXZGCtqqKfzb7wQWQvxFaJpw0FVfe7Jmu/isNj5v8xlZj
         0bag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794873337; x=1795478137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8MPRw3LQfTqYHlcJl5tPwvhjuAVhHnRcl8N9cOa0d/M=;
        b=uy8jljGdoWf4aNNAyQV0/FmkiRP/ZbMFXMC9Y13StjI0RyXSE9HN1Z15AmqzRXUI2b
         VV3RbD/pk+5siid1+kgbCPRe+xGSB4ozqNDGfjkFIA8e+I1SlY3nK+ir6wgO4LtUWcBY
         /VkQxlXgqIP0vkBmZjTTUBQIgnTcjbBKEvd0Gs3QsLueyuz8Uoh9LVSOQn1gySyAoEIV
         fgOMAdJCw2IX62MyN+XymqF1jz8Zp/hIiyv2ND3gy+gffoZdCtE3pDcyqKmCo3kY9lAB
         qtekm5Dr8wb0gGZS35eRegFdGfQmiTvKzmNVW4I19dy5eFwA+ARzhHkdSFoDFwbE+RQG
         AHWQ==
X-Gm-Message-State: APuU4Z/8CfvmXDcqeoSSyThPWy8gqHYH1dD2YdF8XfeUyZ1U4F65QC1F
	eW3CjkVGdCV/HH8p5QgD5T/4k6biBrsKP7PI1Kc4s/N51ZyXfNf7PjIR
X-Gm-Gg: AZFdTZctfRg6mpGwKGW5kei77WNv/G5D0uYAM312rDDaqdn2WPX1lOnpZEQJ7BEvrwB
	nVgD7sovQ7REhN+gq+6NgbBc3x+KP7rguUsA/NBYIIBbAUVAXlec33iP86Klo/vQXOypt7JSkHB
	a2lG5WA7ZkOYxdPd95snSo44JcZm68Jyn6AuFhmvtQs0LSwW1/GOBDu7CzJFMdwchEioTa+Ow0u
	5mt8GngMWtsoLG2r2ElmNm6AYKNE6c28KjDpYlnzwzOJmkvO9EUgh4UhC0e3AFcJE6KdjpWllci
	BA1b1L328nirYlTrOu7JTWyb+qw6t28gUdW0GUEItJKsoSStd1fNwU7y9XLPhZLJMQkUixQHgdp
	PfsLY/8qx/7s1hauwVvgvVmTjZ0RGN0VUt9hyPzXsEBxsCazFeXn83ZfhjPCdCz+M0PWtarH9nu
	D25UzIbu5tSQYdVLYfWekxX+wTZC17UVeCB2/HuXpUPjf0TDznJREDeP+A98PQTzvNZYi4MaS1J
	sG3jr/NN6oB6lI/wZUwYYxmvP/UhxPCTfc1E3BLITjWwhfPGP8F2ujDrImnUyL6IbtayxBVMgNe
	zqdSRfCTjsJcd2Oqs+DPdm4nlw7PbZr8yl5lHQGDEOw0XqJn5H4euE9qGk7c5VQI8ZEgx01Ioei
	3SC8Dq0KI2jLLxK5N5tXxbVEaSMKvlZZ3PEotrvYYZmJyUJfnSsQviugBbA3V1ZnNIzobD4shJF
	DsuA==
X-Received: by 2002:a05:7300:de01:b0:36c:a154:db1d with SMTP id 5a478bee46e88-37963373955mr10765940eec.4.1794873336691;
        Mon, 16 Nov 2026 15:55:36 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3797f98b9b2sm35426939eec.6.2026.11.16.15.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:55:36 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Edward O'Callaghan" <quasisec@google.com>,
	"Darren Hart (VMware)" <dvhart@infradead.org>,
	Mario Limonciello <mario.limonciello@dell.com>
Cc: platform-driver-x86@vger.kernel.org,
	Dell.Client.Kernel@dell.com
Subject: [PATCH 16/16] platform/x86: dell-smbios: Drop smbios_mutex from module exit
Date: Mon, 16 Nov 2026 15:55:00 -0800
Message-ID: <07b320e42b0936eaaf72b6aaf8c22514b6ab1969.1794871007.git.rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1794871007.git.rosenp@gmail.com>
References: <cover.1794871007.git.rosenp@gmail.com>
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

smbios_mutex protects the list of dispatcher backends. By the time
dell_smbios_exit() tears down the token sysfs group and frees the
tokens, both backends are unregistered and no module that uses
dell-smbios is loaded, so there is nothing to protect.

No functional change.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/platform/x86/dell/dell-smbios-base.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-smbios-base.c b/drivers/platform/x86/dell/dell-smbios-base.c
index 8c70e173866a..0cd8725573cc 100644
--- a/drivers/platform/x86/dell/dell-smbios-base.c
+++ b/drivers/platform/x86/dell/dell-smbios-base.c
@@ -682,7 +682,6 @@ static void __exit dell_smbios_exit(void)
 {
 	exit_dell_smbios_wmi();
 	exit_dell_smbios_smm();
-	mutex_lock(&smbios_mutex);
 	if (platform_device) {
 		if (da_tokens)
 			free_group(platform_device);
@@ -690,7 +689,6 @@ static void __exit dell_smbios_exit(void)
 		platform_driver_unregister(&platform_driver);
 	}
 	kfree(da_tokens);
-	mutex_unlock(&smbios_mutex);
 }
 
 module_init(dell_smbios_init);
-- 
2.56.1

