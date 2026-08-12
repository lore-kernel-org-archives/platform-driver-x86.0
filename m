Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05CA435AA1
	for <platform-driver-x86@vger.kernel.org>; Wed, 12 Aug 2026 11:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786533530; cv=none; b=KajTNTMaKRHJPF1fBmY1TH+z0x7HE6ayIs/sCgkQyImwQ6352Ii24eIErKThJWlPTSECaqEs/isq0sbPJ5cBtN+bAJ6+UvqEKU0NoiBhTZ+3ljsphaCsnRz+ghOkgnbxM8MCrWutCsYeacb/DJwiC7Tkcgkrz8l+54wnsyNv6bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786533530; c=relaxed/simple;
	bh=ATKvWl1DnIWOGmblRvXvDZPEp2qoEl7qqfbdLw7wl3E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e+4fOc5bAlxM24qV1DqUvGvFNZ5hWUYb/nPufCi5vVDlhwrql3Mq2x+ih4O/afgNfzmvQ2y1b4INlDfmRQUQhL6Z4L13mgXLe5Ow3xKps8tI6XZ325SLOd4zIYwUrguYDL5wTAMhyEavz9juAlutrMzL6E/yfcXiPWj7ect21kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UPoC98/8; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UPoC98/8"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47fe89fb333so436486f8f.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 12 Aug 2026 04:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786533525; x=1787138325; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GsPuPtlEtpcGKckM/9mBE7kyPjRyXeXRo57w8zpUvug=;
        b=UPoC98/8UNWIKkpjNwtvUiOxBBvc4dwZSjOxGo02t+ZvsUrufig+2dJGuYtqljphic
         LwpkDLlXJIZTnlPwuA7MnKUm/+ZCbZw7XcSwlkqCqEEeVZHp/o2LDXqtqTXAfd2eauYj
         IZw8UCvL0oF+Qa1rNY9DYvxqnuZXQIjocG2Bz2Rs3tfFKyGHMO4KQjwU7AZOxERacwHn
         zwB9D16yxn7sfDybvIgNZXPL5UWgafQfBJOJlgW0CiMxK9+8VChVO2sOkiv4AhP4DlUx
         0JEBThkNVcmkk6OpTawx0RQ/J19ccdm7tw6Sde/gHojH1BAnDTK+3A504aDg2Lmcm1ct
         D26Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786533525; x=1787138325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GsPuPtlEtpcGKckM/9mBE7kyPjRyXeXRo57w8zpUvug=;
        b=f4/kCgUdqT5KHY8NZde71HR+3UEa27WYYFpAdckv6dquvaPyrpKcnDzjROnG+zcRGa
         QLG8ZTX44P6ffxLWwz2ym5k593Z3UHXyKW0zE/IJH29T9WpJSsviY1o0XskPqTLldk27
         3NBvSauSh16rlbiYwORkghp0VjqoAxhiJ7USKoZc7C6yILSSKCRsYJbBWND5e9mHCeLF
         NSACEydXz9x+MjwHkHNgCGJq9DupK03aO6bYUQPoeZW1cWzckqFqEiGWQZUTmxy611Y0
         Vhc5o49BJ5gWbEy9AS3Zvur5eto4XWO70Bw51HAWfArcVqHSnXIyeO8L4O9quM3o39tr
         I9Tw==
X-Gm-Message-State: AOJu0YxdTQ4gH8vaCONlGa8FPtlG/M7PPGCu40AdIbeC+bjAuFTh4yRb
	/RfMa3jBYUfNWLEoEdPYZ+yRmV/It/skQfR+MesdvtxiVadI7yH9j0YFNyXiJtx/
X-Gm-Gg: AR+sD13e2OwwqGQ7rpVnNVh9ViAHJcjAanCHdJyJQxQamqfUzkh4kNVeg7fbxyQqe9C
	r+rimObmmaNdS1CcGE1MBTI7NeB4vBN2NQlgG4e3HqYBI4989efdJ4sVfYbAezCyR7nQEB13Wre
	nmHGd8yMxmbuGfhAiWYTYExNYNdbWffBEDvWyRfzwE8Lp+dFNvqi7lkhQU+uDAU7ga9ydnKwFUp
	qSBIDNPsBL/3g7qI/N6U7sMQDuUc2wDtu5LABcaaYsz6pCwcvOqRZgdzGsexSGgv9eBETMQVeOp
	gHSvPA+X8EMys6LVJZlvWLpVEwoVZijqf3vOeVwGltzzPQs2vv9+k8Qzs4JSqSMBeuMQQh3cwi7
	dUv4Doqj+JtoHuQ/ysV6Fstdt3TaR4FJGEqRMLGH2xLJIs6hGbvTE8KuEDToP6/1W2KpACVnDKd
	WHkvHngYN2J5NGfeoi/3pqhO7ovG5L45WQjvmL4UJgLAC+GEL8hw8eUCZHNgc+pQcj00YDBTX50
	zZAPxn0gngWO8YYCcIdM6r6/b1JlA4Mqf3Ll5H/5w==
X-Received: by 2002:a05:6000:2a89:b0:47f:e729:c588 with SMTP id ffacd0b85a97d-481528d77cbmr4832014f8f.14.1786533524857;
        Wed, 12 Aug 2026 04:18:44 -0700 (PDT)
Received: from fedora ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48150d702c9sm6670072f8f.34.2026.08.12.04.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 04:18:44 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: jorge.lopez2@hp.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux@weissschuh.net,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>
Subject: [PATCH v2 4/9] platform/x86: hp-bioscfg: fix 16-byte heap overflow for empty auth token
Date: Wed, 12 Aug 2026 16:18:24 +0500
Message-ID: <20260812111829.172273-5-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260812111829.172273-1-meatuni001@gmail.com>
References: <20260812111829.172273-1-meatuni001@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hp_calculate_security_buffer() special-cases an empty authentication
string and returns a fixed 4 bytes (sizeof(u16) * 2). But
hp_populate_security_buffer() does not special-case that same input:
for any authentication string that does not start with BEAM_PREFIX,
including the empty string, it always builds "UTF_PREFIX +
authentication" and converts the result to UTF-16, writing a 2-byte
length header plus 2 bytes per character of "<utf-16/>" (9 characters),
20 bytes total, regardless of how long "authentication" itself is.

The caller, hp_set_attribute(), sizes its kmalloc() buffer using
hp_calculate_security_buffer()'s return value, so for an empty
authentication token it allocates 4 bytes for the security area but
hp_populate_security_buffer() then writes 20 bytes into it, a 16-byte
heap buffer overflow.

The authentication token used here is the current admin/setup
password, which is an empty string by default until one is
configured. Any write to a writable BIOS attribute while no admin
password has been set reaches this path.

Fix by removing the special-case short return for an empty string in
hp_calculate_security_buffer() and letting the normal formula run,
which already accounts for the UTF_PREFIX correctly for the non-empty
case; for an empty string this naturally yields the same 20 bytes
that hp_populate_security_buffer() writes.

Fixes: b2715aa2e135 ("platform/x86: hp-bioscfg: spmobj-attributes")
Cc: stable@vger.kernel.org
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
 drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c
index 4d94e48c1a4c..2d4a3720f80c 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c
@@ -48,7 +48,7 @@ size_t hp_calculate_security_buffer(const char *authentication)
 
 	authlen = strlen(authentication);
 	if (!authlen)
-		return sizeof(u16) * 2;
+		return sizeof(u16) + strlen(UTF_PREFIX) * sizeof(u16);
 
 	size = sizeof(u16) + authlen * sizeof(u16);
 	if (!strstarts(authentication, BEAM_PREFIX))
-- 
2.55.0

