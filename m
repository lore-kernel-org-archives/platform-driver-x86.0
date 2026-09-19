Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1599627466A
	for <platform-driver-x86@vger.kernel.org>; Sat, 19 Sep 2026 06:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789797658; cv=none; b=EyexMhUQNTd5TIzhHLw2w+sSYTLOzrna2wiUjD4pe0eATIOsVbrTbPBH9Qm2caJgCEYewtkzV7cdxZ9iyqyB6+d7Dl9tEB4zKFdiq1D9hATbpCpjXYeqQWnXKEsL+X01/rFLic6dZkQ296QQuHcYmL7yT/onUtjzSySdYsyOar8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789797658; c=relaxed/simple;
	bh=Jy5TaLrwRqkwt1UO+ssRNusHMelPmB+dJLFY0YgEd2w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u2lxTcKxTyZwv+syGr/vFQyhkFjQMW0Ige2gdgQmr3+eYBJErUq3mWX/a6Nuv/8S+sfHL4C33bUwrKE+A3hCD+erkzr9aIqES4f8oYgRq5Rh3U3K7XpqqLAOVaWKfbjBdY9SAq7uCMiRBML4ZrEmzYoj8DeclLCJQFgWKnGTWao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R1xGSEwq; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R1xGSEwq"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48434392b02so1081846f8f.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 18 Sep 2026 23:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789797655; x=1790402455; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pMviqo4XEkPwNRzdFDIqATmDkxn/o8ifOVjJBWoYCzQ=;
        b=R1xGSEwq2VEZ8A9e+m6LrHHkVkkR0ZsdGuZZ/jOQNKibDBXBKT1rKQhXfBJuTgHp3R
         IyWmj9+fsRzTaoMjeLY1Sfpjjsz7hztfvgGPjHiIBvPD9IuMRiiZchgWz6xp/vEspDZN
         B/+JGvJYBPiFsxhVqPNZLJwRHHVAe1ZiItrRGCQIBPC/bPOZm8/ctaSYrtKa0COk9fPQ
         3lJN7i6KFuDnmQYWhWXiRGwxcBgg48Suh2kLK6t5PZZVi1qrRptQXNueRJ1KyHFGTScJ
         Bt7Klo5Jq8Bnf/mATPeGQzutF6OIuWox/oI8YWzKyylKtYUHnKwyiCyCgHPd5O41txyL
         MZrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789797655; x=1790402455;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pMviqo4XEkPwNRzdFDIqATmDkxn/o8ifOVjJBWoYCzQ=;
        b=eYbicPMB4h9iftgoxOXr2Jx3Xq0JVaUr8AbrNpOpZxie1kI9ZwYkYxLuiYF5JhxQyj
         ic6f4q9i+fTUbd0sHISFOd7T4r6xTE+NIRnGR3j14rU/EsLRKOROOmimG6C8wiWk6W5F
         9V5bojTwjk3rxILw7EiWnXNhcSCg7lRBpHbm9xTsp5FKOWto4Th1poDjjAH+7VgZ2Zqs
         jEeiWEERJybov4bbfnp67tEqUfFWCdAE6kcpFY+e2bR4pk8dyclnzUzIbptJhGAKdewe
         mL4g5lTCUd2HflyvG+8P1UiORxpwiW+x7oZvEHdC+MXTGBnhDPe1SG0+3vYKn64UTTUf
         aV8Q==
X-Forwarded-Encrypted: i=1; AKwUvBxG3r4Sov24UvNhXOTJybhEc+hI+xt7AwWbEFh6MoA4l7DVrqOYJRu6OJugkJc0cJHeD2yCFE5PmVGZQ2ZtJbjaG/CK@vger.kernel.org
X-Gm-Message-State: AFuF++l0bTn4qc0imx3n9jCjxOS3cbrtxPT8+xzmbUA+KWfEGmWm0Q4x
	qAFv5CwKFDGofjr8ikmYKk3qCiDL/5DmElJg4AWZK/NyWJHeJ3YewJn9
X-Gm-Gg: AYBFou1v62OyXrsnCzUgfRDaToiaNOIPkuV50hbNCb1oGFBqGbJbpsJTGcEiijBSWMV
	Ys5W7AySowTYuXn/jSHO9K9DkzokWHwM1Kncg1tPJ7hkdG05umcTGvok/NJjhd3Ec/GFxuUC+Ys
	N9UD00An7EMxD8zdjnz8KWkACgmNpDQ3y3DYUnAgIsqc827AzO/cYjMV24MuEn0TB+oFB22UG+D
	M+DdNxkCrFaODuKYOWQyjzH3ieZsTGQh13Au4SF86z7PdCvIyOUZO2oh0ZzlES7EztYQM4adyC0
	rFC0d30wXB2yzCgMWg+fps3GdyRz5MkaOYMsxuSWu+uBwJpDy9Ki66lt7Gfnz0FhHtnJGj1vHZu
	JxvKCOPFbkPXt1hq90BFoQGoSehQrjpF2dgbNlwqvag7yapalDykQZmkQkpsBBsqtZ0JPJwFWsr
	RvYuyc3+wr28bwQakrqtkXSb+/nbH5Gcq3UkZ32e9al2iZPIiIQVHuHNsROKxG1uAgj9T0XALB2
	RBvLqyaMLkmsHMMkIkKOmTU8qkpqqQ8wMp3fNb+sy4SI6FbZmE=
X-Received: by 2002:a05:6000:2010:b0:487:27f9:82b with SMTP id ffacd0b85a97d-48727f90b71mr525893f8f.32.1789797655106;
        Fri, 18 Sep 2026 23:00:55 -0700 (PDT)
Received: from fedora ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4872456301dsm4891022f8f.18.2026.09.18.23.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 23:00:54 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: Jorge Lopez <jorge.lopez2@hp.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>,
	Josh Snyder <josh@code406.com>
Subject: [PATCH v4] platform/x86: hp-bioscfg: fix 16-byte heap overflow for empty auth token
Date: Sat, 19 Sep 2026 11:00:37 +0500
Message-ID: <20260919060037.84602-1-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <9d60ef62-a53c-bb13-ff6a-0a195cf2f6f3@linux.intel.com>
References: <9d60ef62-a53c-bb13-ff6a-0a195cf2f6f3@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
hp_populate_security_buffer() then writes 20 bytes into it, causing a
16-byte heap buffer overflow.

The authentication token used here is the current admin/setup
password, which is an empty string by default until one is
configured. Any write to a writable BIOS attribute while no admin
password has been set reaches this path.

Fix by removing the special-case early return for an empty string in
hp_calculate_security_buffer(). The generic calculation that follows
already accounts for the UTF_PREFIX correctly, which naturally yields
the same 20 bytes that hp_populate_security_buffer() writes for an empty
string, avoiding duplicate logic for special cases.

Fixes: b2715aa2e135 ("platform/x86: hp-bioscfg: spmobj-attributes")
Reported-by: Josh Snyder <josh@code406.com>
Closes: https://lore.kernel.org/platform-driver-x86/20260402-hp-bioscfg-overflow-v1-1-6985f8c9e67c@code406.com/
Cc: stable@vger.kernel.org
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
Changes in v4:
  - Straight re-generation against current mainline: v3 was written
    against a tree state that had a duplicate "authlen = strlen(...)"
    assignment (one copy meant to be removed, one meant to survive),
    which current mainline does not have. That mismatch is why Ilpo
    needed "special trickery" to apply v3, and why the manually-applied
    result ended up with no authlen assignment at all (reported by
    kernel test robot). The v3 diff itself was fine, as Ilpo confirmed
    ("authlen is not uninitialized, so only the early return should be
    dropped"); this is that same one change, regenerated from scratch
    against the actual current tree so it applies cleanly without manual
    intervention.

Changes in v3:
  - Remove the special-case return entirely instead of adjusting its
    formula, avoiding code duplication as suggested by Ilpo Järvinen.
  - Credit Josh Snyder who previously noted this approach.

Changes in v2:
  - None for this patch; resubmitted as part of the v2 series.

Link: https://lore.kernel.org/r/20260803143037.93105-1-meatuni001@gmail.com [v1]
Link: https://lore.kernel.org/r/20260812111829.172273-1-meatuni001@gmail.com [v2]
Link: https://lore.kernel.org/r/20260818191120.38556-2-meatuni001@gmail.com [v3]
---
 drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c
index 4d94e48..abf8ce2 100644
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
-- 
2.43.0

