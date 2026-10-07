Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163CC20D4FC
	for <platform-driver-x86@vger.kernel.org>; Wed,  7 Oct 2026 13:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791380906; cv=none; b=ur56cdKs1c+imZ/PUpPMAdWsz9dkSxgM7/bLNRpn3U5HDnLFWYhhKG0DegKuHMJH8oH40Y8A4p5SQotwygcjTZcb+eJAO25HgN1yUZ8ps45HUrCWCIHg8g8MjD2aIqxPvjwndtJ2wdqC81s3Arakhw01Ta+wzFdxtQAZcbXuMe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791380906; c=relaxed/simple;
	bh=LjVT1ay3Tgd9ZYbrIEoj5C1N6ZGO6OvBXSJKNu6JNPU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Euabz2sO4Lmx/kmg3D6drIZRX3Eztl66StwBnhEjDJfAkoUA9H8rQR6vQx/x/lTEUKpphz9HQaMJL8twQ0Fvo+xNRJwms/pf7xYq+uUnKAlmh/1EV/QFN9vflbRqT1TV2m2WjuaSxmoBUTecZhH4dZ0qYr64abQ4Z7Kc6lzxTEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cm7mvnpb; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cm7mvnpb"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-33c2520ad38so4274810eec.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 07 Oct 2026 06:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791380891; x=1791985691; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eovt0Snp+Z6dxP/0IRndMV4emrYSnHNEPmUQJF/Jnbg=;
        b=cm7mvnpbr9EYSIM7OuxGhHog5H8G2Ypmv5OOvV8KzGCSIa0cBr2rDd8OFv7+X+0NmI
         oos84FxF3MlSywrgq4+TrSYL9Z4D2RJuhXCbj1QgvcT1IFu4TMotNsb5JtdCn8i0OTqc
         y0wL0Yx2V4r+Y7ABh1Niu4bK8lTFtf313jDvEVCngVVAMR1zc4xJDg9yGUBxfAt3r8G8
         xKyMtfV2M1U9AwMhNEy3jQy4fysh4V+1PLbR079okepKpPi3rgyQVNDiHm0zNQ0+B6jy
         DcxXIjOlpoOrijGacwZbvMg13mo+eml/VytF8QBiiMmn1Mvpx+xb2qIWqEP12M2r8qBp
         LWOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791380891; x=1791985691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eovt0Snp+Z6dxP/0IRndMV4emrYSnHNEPmUQJF/Jnbg=;
        b=F9ZuBI+/pVww9bsRxempuGpEpuVx5brzJ1ztzrO6Ey9Hu2HKpg9QC/p0sKoOMPO7Sn
         mEfhJBdmbUGspOdzvcYMT65aL6CA4GGJ4Vl6Ci0vlLU4jBn1s0l2dG+JsVzszjtE3zpH
         H/+rDGNh6Kr5c1vA0iFlSi7xhGStZ66r00Lzx9j1ZzbyNczPLmhOL8+bEnGLiV47v14l
         /iNbqBvtLKmNjQkKShzA4SxrxCuN+lStMlbNX7FCxvta0mLOqeBlJQuc+0+nhpGR0i7u
         BKy5WTaBPM8yWxUK9i5ROypIwBycAWBs13DT3N/+PEAg6NxujRebioLiZAjkP6jEdEap
         91nA==
X-Forwarded-Encrypted: i=1; AKwUvBzXKKpROEqjv0qqq0a7ZqyB4kA9KavZLjA1ZYqwd9fU/bXx3ULl1z0M1++byzQwiye8Bf1jSQJIRiE9VCt2h4yMYd2g@vger.kernel.org
X-Gm-Message-State: AFq9FYJB/GyHWHdCqAtrCveSA0y6ePICyEc4+YD16y7T0HREPYAg5L5B
	iuhPAQA0HWmKOrRnsznKKfTuirYfTaOITQKM4mL1DFFnfiiiRo9JZsJM
X-Gm-Gg: AYBFou1DTddOYQPY2gjkWuRFWYdKOx0T9EsiN8TAzwm58kmx6P8cyR1lGvIOfx5MgKJ
	F5YiANrQwdU4JcQUwVq7mDji4RPKkkclx3YiLsQ6y0o4cQvax/+59WQihFA20q++qF0zSgvUCal
	GyCuTEgHmwK0V2jmfq8TQkakz2QXr/gpX2zN46DVHr4BGxI0UBXBxnX5YVdrJj8hk23tEkIlfyg
	q/AWJpcqzHjsDRnbkTy8Z5yVf5zuD+VIWOKDJHEpqGx4I9sDAzqkRL+Br4juQfagQ1XNWxXK1hR
	VR3FiQjVpCI+OFTm51SizkGVK/auUcXmuZmkU5khhg7ThQ0UgGK2wdlVQSzOxNFIxqlL0vEFp5Y
	NkESQZEAW+HVZTiO1V6rXVjwNXcwp5bDsgiOr2FqioGuvTMSr/f+Gj0jfUDh76yA7gq25AfLfsS
	oXTgg+UEJMl7V0IcWTKzRfUxT4KNNhlr9iTTRRoVcK1rt7Tj0gxwfTrX4+f/d9XJd6ccdl9CUBl
	4rmexpjWlrV7Jzud1nK8anLWZewBP3B1J2EtZD+jh7dNtc=
X-Received: by 2002:a05:7301:129b:b0:34c:45da:9b5 with SMTP id 5a478bee46e88-3515dd9a4a7mr2745149eec.20.1791380890725;
        Wed, 07 Oct 2026 06:48:10 -0700 (PDT)
Received: from fedora ([2a02:6ea0:c803:3091::12])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515aeb5c2esm7304472eec.10.2026.10.07.06.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 06:48:10 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: Jorge Lopez <jorge.lopez2@hp.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v5 8/9] platform/x86: hp-bioscfg: NUL-terminate the SPM auth token
Date: Wed,  7 Oct 2026 18:47:10 +0500
Message-ID: <20261007134711.473857-9-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261007134711.473857-1-meatuni001@gmail.com>
References: <20261007134711.473857-1-meatuni001@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

auth_token_store() copies the token with kmemdup(), which does not NUL
terminate it, but hp_calculate_security_buffer() and
hp_populate_security_buffer() use it as a C string and read past the
allocation.

A lone newline (echo > auth_token) is worse: kmemdup() of 0 bytes
returns ZERO_SIZE_PTR, which passes the NULL checks, so a later
attribute write passes it to strlen().

A userspace replica of the two helpers under ASan reports a heap
buffer overflow in hp_calculate_security_buffer() for the unterminated
token and a fault at address 0x10 for the lone newline, and is clean
with this change.

The token is a string, so copy it with kstrndup(), which always NUL
terminates and allocates at least one byte.

Fixes: b2715aa2e135 ("platform/x86: hp-bioscfg: spmobj-attributes")
Cc: stable@vger.kernel.org
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
Changes in v5:
 drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c
index 25477ecf8822..598bf3e1260e 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c
@@ -317,7 +317,7 @@ static ssize_t auth_token_store(struct kobject *kobj,
 		length--;
 
 	/* allocate space and copy current auth token */
-	bioscfg_drv.spm_data.auth_token = kmemdup(buf, length, GFP_KERNEL);
+	bioscfg_drv.spm_data.auth_token = kstrndup(buf, length, GFP_KERNEL);
 	if (!bioscfg_drv.spm_data.auth_token) {
 		ret = -ENOMEM;
 		goto exit_token;
-- 
2.55.0

