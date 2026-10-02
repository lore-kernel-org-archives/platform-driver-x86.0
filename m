Received: from mail-wr2-f29.google.com (mail-wr2-f29.google.com [74.125.225.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 115E4361974
	for <platform-driver-x86@vger.kernel.org>; Fri,  2 Oct 2026 19:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790968526; cv=none; b=dKn22jsWvEdjOLCuqDPO+3Dg0gSOFvmr/e1h39K0bAS/kHxFDivFCd46YHdRZ+iZQAN2I3Tt16EPslXbeaT1WjZ3B+4P504yxJutI3EYhjA3V5I1qIPH+0eIFnEAqk1EXzOB5jYD2rqiCPGIXX+fNoX4iFDgDFZ33vgV/fThZK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790968526; c=relaxed/simple;
	bh=0v6EsoR5T+lucdH/eGhXBeOr7Ze3sxH1Mqvmwg12+vs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=egmkr1y6X+ioCvpSMDXA6O8JlQZnZMxcAJyJn0xKJobHUi/TZYCxHOjbREagsZOEUV+Mactyhzqk2RY1PzYLE7gVkR04VaZRRvjDoj9irqPgygBUXY2UBUuv+3sKeYfaWDs5v6CNTqfPRtIiAUgOMCF6QBxQ9vBuaLyGbbYut/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F73AVCVu; arc=none smtp.client-ip=74.125.225.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F73AVCVu"
Received: by mail-wr2-f29.google.com with SMTP id ffacd0b85a97d-48aef5d66c1so105331f8f.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 02 Oct 2026 12:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790968523; x=1791573323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Z3J1wTRaL7AOg2V1HNOvyAPEeXuGFQq5prc0aUbI2M=;
        b=F73AVCVu+7ekD5xjlNRVXCf/At7gGzEk2sS8qEW27lgLP+Lepaf4HMCowjrl31qP15
         pPLDpPn2uaEt9l7MzvjsbfThWNQYq8FX9BUUffTeL3544vNN6hv8QP29Tmb8eAMWrjXi
         Ozd40c7GpMdsujsUeACMXZunzO24m1+au59VeY/ZcjSqv/5hy9FDMfy7+nHHMrFhHK7I
         yk7TpXtJxsH963KGgZEfLa5JUUDLu89WhBLGD2Of8ytq9zAL3oPFSA7drpqQ4edm9c42
         g4J8H/CuAlBt/Cd4x0upT8qrQdrGsFpABAaMeXtogh9FuMNBtTs+qWU4zdCUBbBmEsB5
         U4Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790968523; x=1791573323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1Z3J1wTRaL7AOg2V1HNOvyAPEeXuGFQq5prc0aUbI2M=;
        b=wI9KNnvm6eRcKh0vUdTpHy49wwunRUvaXl661UNtagwMDWUl9pkjGfqvagD0hby+KN
         a7Y3Z/pVgBEx+laLsb3ypPo05bPYYFAn/n+LJmmPfiuVsFDW99Wjk6cu4RWfQR/0jkcQ
         NZG/9laqxBgRvTM5Zz2jl4LGUIAbEev9BtzHci9chU5mPhdHClzNKxv2xtH/LIL1RSvW
         4Clr9wnNlG0xvGbYon3oGnN5O365BeIsUjRs7PCEG/eKhnvHnnp+1ZAcEQ1SbcyyjAcr
         5oGXVHrs00oWQNqt1ccnL3U1q3FNQW0gkshEE/ppsGkRapQscuwJ2YSKstn+cbRG1sGw
         zcNA==
X-Forwarded-Encrypted: i=1; AKwUvBxXifrN2Bp+vNmQzpXUi6Hk2Dj1flWxAE1WrkrEZ+sznw/n7OXnG9ToIgs8HtUIn5PVlbFVGlWa5yV+QR/QRPJRgg+o@vger.kernel.org
X-Gm-Message-State: AFuF++mSjDQ4iX2QXCV4Tc5FDp9X0yhbYLtUzRNS6E+I259QfSCX9k4y
	aCE/LRxKPb1PDiYhoyot6k+Tq6iZTMt7EZmsScSo6P8GY7ifEMk6dwFd
X-Gm-Gg: AYBFou0ecCvpQPzsLXFbWieKssAwliY1GIH8J1boE21l8uTnufyU7xJvBghq7uDO0ed
	EJOdmcj6XySVul5WVDOYuSFYNkB3RS251DE4U2W16q0Dw3vfbVNkxVfzvzczL6/2KO3jj5ihCrI
	Djl4BAkSclFUVRjjSVoduY6LT55cgT4ETFWtreaVqpluWHZWniQ2dzbljaR9V0CuNBmKjFj+NLe
	mt1VbOciNyouKmxzDpoVMLlgs4xGA3xxT1teV5AhMQUVKOsYKnRvWB7w1PbUTAr6ISCxyBA0MPu
	ptp0KVv+8B0Cn+ZMxC5oVStmG+8ofzjztKE504wO0unxAOKWGFbCkD2i2SViF7MK89b6ZB+k9Fp
	he873g7/xxnQ7XGmquOXtUaPyKrb7Cm3eyHF0vUkeWHBmbEHcHjXwJloKHwMz5FadJLKDs3/RrC
	KL11AgkfcbhQtOzyFTjsZK2gXZERK3B8EZATjPgNVD8uAahkVIt4lSl6Tp8JLo1Gaqklex99Qfm
	dORpRHTSkPG+QA4MYIjX0wYlx66tgZexLYKTBEAwUhEHhRh/Ka1
X-Received: by 2002:a05:600c:3b01:b0:49f:dd9f:6038 with SMTP id 5b1f17b1804b1-4a027573634mr54711305e9.25.1790968523131;
        Fri, 02 Oct 2026 12:15:23 -0700 (PDT)
Received: from fedora ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0e1afbc44sm81151145e9.4.2026.10.02.12.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 12:15:22 -0700 (PDT)
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
Subject: [PATCH v4 9/9] platform/x86: hp-bioscfg: fix oops on short integer attribute buffer
Date: Sat,  3 Oct 2026 00:14:34 +0500
Message-ID: <20261002191434.58529-10-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261002191434.58529-1-meatuni001@gmail.com>
References: <20261002191434.58529-1-meatuni001@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hp_populate_integer_elements_from_buffer() ignores the return value of
hp_get_string_from_buffer(). When fewer than 2 bytes are left in the
buffer, dst_size is 0, kcalloc() returns ZERO_SIZE_PTR and
hp_get_string_from_buffer() fails without writing to it, so
kstrtoint() faults on address 0x10.

Return the error instead.

Compile tested only.

Fixes: 6f2c06d5a467 ("platform/x86: hp-bioscfg: int-attributes")
Cc: stable@vger.kernel.org
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
Changes in v4:
 - New patch

 drivers/platform/x86/hp/hp-bioscfg/int-attributes.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/int-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/int-attributes.c
index a27907066..14317b7fd 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/int-attributes.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/int-attributes.c
@@ -331,7 +331,12 @@ static int hp_populate_integer_elements_from_buffer(u8 *buffer_ptr, u32 *buffer_
 	// VALUE:
 	integer_data->current_value = 0;
 
-	hp_get_string_from_buffer(&buffer_ptr, buffer_size, dst, dst_size);
+	ret = hp_get_string_from_buffer(&buffer_ptr, buffer_size, dst, dst_size);
+	if (ret < 0) {
+		kfree(dst);
+		return ret;
+	}
+
 	ret = kstrtoint(dst, 10, &integer_data->current_value);
 	if (ret)
 		pr_warn("Unable to convert string to integer: %s\n", dst);
-- 
2.43.0

