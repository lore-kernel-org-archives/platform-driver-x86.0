Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E372BEC3F
	for <platform-driver-x86@vger.kernel.org>; Thu,  2 Apr 2026 23:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775172776; cv=none; b=ROYHJROb3VSCAgVvOIZ6cfVp0JeuFwpUjhsPN63c6jRPaf8br6AJX+JdG2cXK6zleRzbF17y52UrQxQN8yBrt2soTU3sKIqx2biCSwFHSgxCvPpAioMMKfeuIgp7OJwuurCDvO6WtdWbPGb6G19h/1UdIFwuR0UHo8fPsHDwBDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775172776; c=relaxed/simple;
	bh=OL7sHabHUH+UldZW4qYicdqx1/x8Ffto+2T6W2FcUis=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Owow3IDVO3LIbq+TXX/oGPTZ+M51SUCsyOOcRAQlYXjD6l1zsKEJqeTrBIN8U0jylJsn1P4hvTy0N3fRwpyHkcolNo+2vJLsoUOtTnXHBt0s+cooeN5d+RSMxHPlw1wE12PoKTyPLIe09je3hpHsQs2ps6aJUh7GNBNOsFEGdXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=code406.com; spf=pass smtp.mailfrom=code406.com; dkim=pass (1024-bit key) header.d=code406.com header.i=@code406.com header.b=PjPOJUmI; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=code406.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=code406.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=code406.com header.i=@code406.com header.b="PjPOJUmI"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2bdcf5970cdso938281eec.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 02 Apr 2026 16:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=code406.com; s=google; t=1775172774; x=1775777574; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=14mjM17dnkk7bqpw6z54HeZWcbwObnKUUNrE+nPcJQc=;
        b=PjPOJUmIKdP0fSm/sLJZSC1EkfCWo/5oUQzBSHakhRjYYUMulLfkbigVTh7Qi9NfHH
         8YKI1h1wgPdjdYhhIg8+cMITUHL/hmaR9y0mbfJ+YPY35XerhfSp8JYZ2w4iegDdsL4A
         4QDIsvoZTaDY2u/vk/3rgvdUyn7vFnlrV8Smc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775172774; x=1775777574;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=14mjM17dnkk7bqpw6z54HeZWcbwObnKUUNrE+nPcJQc=;
        b=Y0mV9/FK0xyOQJGqPD3MfIqJMIZp1ZCl824iVKXA9AvOFDUD7e1J3Yokh49mAog+Qk
         EyI2v2z7nDbZrCAQU6GatNvkjegE9V2XtRoR4z/Kj633SBzqqcBTcD2Pc8EjucikUHqp
         KYU50DDkAl3UtBsyrpSgT/opNFqBPF3Ids4Uo0ceK0xF9W4rTTjTbdY1Y2GQWwv1QzHQ
         8DbQY0Y0CGsEJN+aGWq00jJ/iivebv5EreTNRW2zepfoUUhzsVYabEHrv0a6Qler1lVf
         ToI/oYkIZvBre+WbDxIvhGCVbnhNlFhXu4MxZH2NUdBbn9Qs4xNbzlaMcaB5Su9dWWgK
         3Yeg==
X-Gm-Message-State: AOJu0Ywu4GaS7jKm+IDSg9MjTJPWJtGqXpf6/ew8dgZjSGSgrvMReQ8U
	nT716ijbzGaPJDr3nAptoJVm+UwSZTtQ4oRKD+JwI4vmNGJwHx5vp4iJgost4x6Y5Q==
X-Gm-Gg: AeBDietZTEiovns5lQIBk5YYDIBovN8JiVGCTVkR0HeE3ynyyz6HbJb8Xe7yN3vPWFN
	NFjIUtLtKB8qK8w4xpI/lCF7+7CX1P8Pmu7tzH1f3UMRAscpE/GEHKtlIBcHluO9AM1W8CheNkB
	3h4/mvxB6SlSeh6VlqAR1FMVn85NpcFNpaYa2oh4E/XLKyX/1WrsTDpKM9yBdvrZoWuoXhfMIIN
	ucx9DIpj5Yt6ZmsasbtPmABM4NjZwgD2kwfmr4tD8x1f1W6hHaf153/vdYdlGQILvKVhLcJEfPI
	i+RnUsRrv7rKUGLjorqjM9/slz3OZZ0YanF9OwVtRMzD915T4oxPr7zK6djLGzfHhMlcBuKObNJ
	RkHiUzIEq9AzqDQ7+yDWHEYJJ8hY5GZRWxOpKvE9cq+CUbE5TEvUEaKAYi0/VbxqU7DZHYaKkDJ
	IYveX5c/8wU4QaCFb6jktb1hswmBwxmI3pnJW6LdokgjH6EYqgFWODyN9OG53MT+9RC+Qjhurdr
	lAksY2f0UyNcKpCL2KJ63m/Jehlb4y9+UPK1cNqEWyC
X-Received: by 2002:a05:7301:1288:b0:2be:ca4:e114 with SMTP id 5a478bee46e88-2cbfb1a769fmr458858eec.9.1775172774172;
        Thu, 02 Apr 2026 16:32:54 -0700 (PDT)
Received: from localhost ([2601:645:8a00:6e44:c6ab:7340:c926:8c92])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca7d00f5easm3445408eec.29.2026.04.02.16.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 16:32:53 -0700 (PDT)
From: Josh Snyder <josh@code406.com>
Date: Thu, 02 Apr 2026 16:32:49 -0700
Subject: [PATCH] platform/x86: hp-bioscfg: fix heap buffer overflow in
 security buffer
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-hp-bioscfg-overflow-v1-1-6985f8c9e67c@code406.com>
X-B4-Tracking: v=1; b=H4sIAKD8zmkC/yXMQQrCMBBG4auUWTsQo5HiVcSFSf60U6QpGa1C6
 d1N6/JbvLeQogiUrs1CBbOo5LHieGgo9I+xA0usJmvsxZyN5X5iL1lD6jjPKOmZPxxdGz3cCSE
 5quVUkOS7X2/3v/XtB4TXtqJ1/QEdWv7sdwAAAA==
X-Change-ID: 20260402-hp-bioscfg-overflow-d58dbe53ecf5
To: Jorge Lopez <jorge.lopez2@hp.com>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Josh Snyder <josh@code406.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775172772; l=2020;
 i=josh@code406.com; s=20260402; h=from:subject:message-id;
 bh=OL7sHabHUH+UldZW4qYicdqx1/x8Ffto+2T6W2FcUis=;
 b=yMpFx4LRuOJ8pzSZgNPonquxEv8HESKJ5qi/uvO+6GYygwZ/bqNTdb56pwY9hDemLdKlesh9W
 rgGEe4HHwTmCSPNLNEzC9C7OgCMpdVLoGvwXwlIYxW1CazKWMHtaC/w
X-Developer-Key: i=josh@code406.com; a=ed25519;
 pk=J60jemVD5rPt9HnGvw/AAQ6RPciMTW8aAgWykCCnCXg=

hp_calculate_security_buffer() returns sizeof(u16) * 2 (4 bytes) for
empty strings via an early return. However, hp_populate_security_buffer()
always prepends UTF_PREFIX ("<utf-16/>") to non-BEAM authentication
strings, including empty ones, before converting to UTF-16. This results
in 20 bytes being written into a 4-byte region of the heap buffer
allocated in hp_set_attribute().

The 16-byte overrun corrupts adjacent heap memory. In practice, the
firmware's own bounds checking rejects the undersized buffer before
acting on it (returning error 0x04), which masked the overflow.

Fix by removing the early return for empty strings. The calculation at
the end of the function already accounts for UTF_PREFIX correctly when
authlen is zero: sizeof(u16) + 0 + strlen("<utf-16/>") * sizeof(u16)
= 20 bytes, matching what hp_populate_security_buffer() writes. The
NULL check is preserved since hp_populate_security_buffer() would
dereference NULL via strstarts().

Fixes: b2715aa2e1352 ("platform/x86: hp-bioscfg: spmobj-attributes")
Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Josh Snyder <josh@code406.com>
---
 drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c
index 2b00a14792e92..93e0a077e4240 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c
@@ -47,9 +47,6 @@ size_t hp_calculate_security_buffer(const char *authentication)
 		return sizeof(u16) * 2;
 
 	authlen = strlen(authentication);
-	if (!authlen)
-		return sizeof(u16) * 2;
-
 	size = sizeof(u16) + authlen * sizeof(u16);
 	if (!strstarts(authentication, BEAM_PREFIX))
 		size += strlen(UTF_PREFIX) * sizeof(u16);

---
base-commit: cc13002a9f984d37906e9476f3e532a8cdd126f5
change-id: 20260402-hp-bioscfg-overflow-d58dbe53ecf5

Best regards,
--  
Josh

