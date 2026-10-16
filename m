Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 806C6145B3F
	for <platform-driver-x86@vger.kernel.org>; Fri, 16 Oct 2026 02:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792119250; cv=none; b=ia21i9a5Bi61xSBrEhJI7ERu1Akh7vwQuDdonPt67nWdnNfxUFkwnwdQN0Q1MwBae3ZxFOjRAQcPh/JAgVUJ1W/g/eQHPN4pNxHNtYHPnQs+Vh71EQ5T7TaNnnM+G27uGeM52/UX5KrnxNai9+W/VaPNrJQeDkceHjXKOKwr4lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792119250; c=relaxed/simple;
	bh=Ht/sdt0Xg3nIv22FnH9XXQfkg9UkhWoR7tnim7fk8CU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=K6baTNSt7h4ASC/r+huxdHk5wVR2w3evLBu6tezW/D+YdVGemASApwv5N5Y0W2WlVyysPQaaBZEP+PGe2e5ony2PBaZrK7bbzdDEF1IeEr5sRAUz/1DoIa2b17HqpzpF914jimLDgQIZLDJ3TyvcPfqA6f7YFElGXA31Th/hsv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XqX/ySFp; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XqX/ySFp"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso3307390f8f.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 15 Oct 2026 19:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792119248; x=1792724048; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XMUiVCJk6662ECKbtVsXltYgL8clVA2PMrxyPMJzO04=;
        b=XqX/ySFpTzRSBTt1mV4sD6PLe1aalmffvIhZyzQ853fZjU6SYGYvA7Ef/JTpP0ljwx
         7Q2odnqBhpNffRuyVyr2Sl9QQDTjpJKhL9187KYQs/I8t2aYyRqDBo88f/Q4aN33Kpqg
         J8fnfNoG/P6bs+7qHBBEjrLmR4B79YhVb+FUXZqe7yCDhonM4o39teFEreE6gRGn7QBu
         MSnoGWvaN0kq/NjKgVZZAaj/kdfCqTeeAN/zksfM/kl07C3UIBXcNfM27VUnPtOK/yR1
         aJ2PhB7kNGcPJjiwbvMYMoCH3gUALs085/JSH8CwYMhXFqmUSE8kDN3xe/dQBqGPgcTE
         xrkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792119248; x=1792724048;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XMUiVCJk6662ECKbtVsXltYgL8clVA2PMrxyPMJzO04=;
        b=oo+owuUYT4Qw/5yt+VKQsg1kPDfD8V7TIYMH7j3NLB57ukIqPZAu0LQifo5d3Q6yoZ
         sP6oi7rmiyeyBja58lumHeySf72eQEicf/Tgy8GfwlRq8i+N6mzN4liNjHoQ6Z8NGhVc
         4JffCk0sdQTa+VljuXj6ogEH0wvbZOv805HwXCE0w8lCx5rv17D85JDYunZXIUYPxadt
         szcIAmBomdKNGxDZP/dK00KmCUyayvAMvvsWQeptH94/ccamBInpXGUacptjlamr88yA
         8OK3e25ljbMNVZ7Y1dl0HWry3gdidAa+gcGThoQYSOOmw51JaFtO9vdsaWqg1eAZZjfQ
         D2YA==
X-Forwarded-Encrypted: i=1; AKwUvBxZVhoVM0JaDGa2G6QebR3vuy+jONaz8Y+nddbNdLQcGe32SEtDNO4rqTXT3flnyrqXz3QAm0Y5M/0Oh5fgYi87m4vz@vger.kernel.org
X-Gm-Message-State: AFq9FYJUpy27SBdasXJZNvD9XsZ0/lkqAlRwEMLTxphRPbIe+A3+Mvas
	4/oHDU7ieukpY9/echME7V36ylqET0iLG9qCpIMAUK9Rs2RpUlCBBo/X
X-Gm-Gg: AYBFou3EQ7iQb34N/DrNgxMAd1yWNweCiEE+XKxngDm5q9I9HT5sXXkFIxz+vS/PIXB
	H3A6vD8M/bjrQqEeNuxsuU1EHq1WK/8g08s7BcgQL+HXmx/RJh92guPNACeAivitkPWRWIy4t6m
	MnxMIk+LCZe0fYGdF0/7A4eAzO+hruqJx0Al1tekUbjPJ2yjqqyT7Elk+w/7TPOTBAzKTjruG5W
	Fp5mYZE3N8ZD8KMihaH51qeBJFHPC66qA30S1AqwtJ6w/MkF5HbDUbwp0Yf3KQ7ev435kOTtzwJ
	GVk4w3B0Jc/Yb13XZWN+dAew5lzGldpt6hzn0GWGZZYEXtevpsxFWVynFFRoQtLFc7onfIdJJqw
	JmccFkjro4i4sGEhuVSR45n2+Ir3ovajyRL+w98WYFnjG6uv9BlabFrgRtLLFyHq3g1NC8/+03l
	o0hnLappvXNtl2kuX2r1g4kNIv3AehBItafzbtb3n7Go3DOgAXBVHDmvSO/Lp1EcYp7DWPM6yGP
	/HfXFIoVXK1IgnA2dpTm4br+ygxJJ5K7P1FPdlkuzqioGpDyx4UNZu5mXTolII=
X-Received: by 2002:a05:6000:299c:10b0:48a:fb3e:d93c with SMTP id ffacd0b85a97d-48dba784b80mr29887033f8f.5.1792119247573;
        Thu, 15 Oct 2026 19:54:07 -0700 (PDT)
Received: from fedora ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd50aafbsm1954775f8f.52.2026.10.15.19.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 19:54:06 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: Jorge Lopez <jorge.lopez2@hp.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>
Subject: [PATCH v6] platform/x86: hp-bioscfg: fix heap OOB in hp_enforce_single_line_input()
Date: Fri, 16 Oct 2026 07:53:52 +0500
Message-ID: <20261016025352.230535-1-meatuni001@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The input is copied with kstrdup(), which stops at the first NUL, but
the full write size is passed to hp_enforce_single_line_input(). With
an embedded NUL the helper reads, and can write one byte, past the
copy. Return -EINVAL if the input contains a NUL.
 
Tested on HP EliteBook 840 G2 (Fedora 44, Linux 7.2.8): writing "A\0"
followed by 4093 bytes of "B" to current_password 100 times returns
-EINVAL every time, without reading into the heap.
 
Fixes: a34fc329b189 ("platform/x86: hp-bioscfg: bioscfg")
Cc: stable@vger.kernel.org
Suggested-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
Changes in v6:
 - Return -EINVAL on embedded NUL instead of limiting the scan (Ilpo)
 
v5: https://lore.kernel.org/all/20261007134711.473857-1-meatuni001@gmail.com/
 
 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
index 876fc35d035b..e306bd8b1e72 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
@@ -162,6 +162,10 @@ int hp_enforce_single_line_input(char *buf, size_t count)
 {
 	char *p;
 
+	/* buf is a string, so a NUL before count is invalid input */
+	if (strnlen(buf, count) < count)
+		return -EINVAL;
+
 	p = memchr(buf, '\n', count);
 
 	if (p == buf + count - 1)

base-commit: 8667bd30fd033295b3038ce374c551d1059538ba
-- 
2.56.0

