Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792862821;
	b=gV0NZR+bIxEk9rKgS9eIpB/+NmgGh5lctCr03lHDZNZ7JiDYdbrh1uzuGtVdJ8PLmIsS
	 fxTGQRP3aJK39zocoDiVQN2QQxKC84782wx6c8jWIhJPPYdHFLjRM9hQzvYLbTvf9fTqu
	 Bs2t01LkU+vE3qL+ybRxKq6MdNJCxOOWhNxrbm92bCKmKgQMiP1CUOljcItXKJ0ajx13M
	 XNASLjAuRT9y3u8n/3FoUqnB61L3x4UFP5OswSlvzCLtqp98pGoL7m/FGB2M6SYD5q1I0
	 9x46Q/onsC86xr5nsqygsd0OV7nWtt8pibsBRyEn9HiUOFEv+y0kyG1mZKIyD0fUlVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792862821;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=kEYtLwxZwrV359NviA74b+mH4aeRVHvNjyPhEsl/qZ8=;
	b=D3uIgf2vY2IUigfjeNL54CplLiqBqYw7OqWRzvC4O3vTc4rxelOdWQO9aE1rvG9N1uA3
	 Lt+gCHZq57Bjh41891WzGHgFze0lpIHpjAFfzzsViY5ZEzcpE5fyr20zUfw3T57SZhLLP
	 w/96pnKb+9HMwudMFOcy37jMVLgre8UNA2gHcZzXWhmsd5vWi43S5BxRZYkCak2nTPjo5
	 08QnRolfS8TMd/uUMPJVGJfJmeEh04P0I5ekjFtDw6m7WUWuVsiB9ILB45GmXn4TaWWe8
	 bJwP6DZobDI+gSPnWnkpbOTYjPlCpWSu/oyzocoE71BkfBWLGIbhdOatnmDpTiCUvAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SLGzCCFX;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A79E606A31A
	for <platform-driver-x86@vger.kernel.org>; Sat, 24 Oct 2026 17:27:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A79E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SLGzCCFX
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4956869750eso11034835e9.2
        for <platform-driver-x86@vger.kernel.org>; Sat, 24 Oct 2026 10:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792862820; x=1793467620; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kEYtLwxZwrV359NviA74b+mH4aeRVHvNjyPhEsl/qZ8=;
        b=SLGzCCFXwEzIPp0HYrwFsmH1nScgGkoGYiTu2ZDnCmgW1A76aweYx34KZTSjMDJ677
         luC7x5od955083hP9Iiu49BX3y5ihxgWXuQO042HOd79UUdV0zmTm6YFyw6lqeJZvGhe
         BAjA0qfFBKYZqZiK96CR+v0g942HSiEKj5tpP1WNgRXIPcCuh20/VClnVLR7tZK1ANpR
         XQzFGeqmJoRUF8rvDYC+gBqzSqb11ErCI91seBMYrlEysiZh8MF5YxNKrt5V/5vH+Ud4
         FI7FrJhahEx1wQI/KW2P4x3JlDqTyhWv8a2vJROBw8ouoGWnNpg57LSWvTK6wDVMUiZj
         i1xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792862820; x=1793467620;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kEYtLwxZwrV359NviA74b+mH4aeRVHvNjyPhEsl/qZ8=;
        b=qxOiEq9+bFpoLEoPMcFlxFaDVE596noWzRWPgYrhDtiO8JWb+uqOdnEXohSFFwKvfP
         /hdcPZSooy5GstGVksa8yP4X/vRdJ675uNZhyrlgQLpJ7nMF4x3xJ2OsJXmesPf3V6B2
         k+uHzsXvIYiXErUtmdnUktRq7GAcIH199AIuA3D2VKyjC5bGnIjoQdcouQBb4cHZJVvW
         DVLOAMc4osQnpTIN9Tnw6ysLItIph4xJAdpfL+f4xHqW94vdN/HpiwoCleG6BAbmT0Fe
         ShmFe2vGZCljiPep49kElYx8+loTYJudwd+/vSrCV2WwChxGVWWlxJImqsuvadGSCLZz
         1fKg==
X-Forwarded-Encrypted: i=1; AKwUvBw80OGMKJ26ufdd61ImpC2M4LZplMvGjt5W6rh7+0whu9iypQhapikuhPNJoHUZD8sday6Gkj9n3tCpTEbW+4WywjuW@vger.kernel.org
X-Gm-Message-State: AFq9FYLBqqHuGQU5eW6KgPC4jLctNuxkAMpd1DjbYuSY/mmmxYlEuWr+
	u0TvMap9q6/BoYihSaZqlDbc8prLj9fC6s68E+TD0upeq6x/cBi9Ymbs
X-Gm-Gg: AYBFou3a8YosMXrtX2fswOLI0HSvrtaODR8GN0SgYnoxWHCHM7h5HvE1GpPwrGcis7U
	jqh5F9IYbwYoBrZbItQ/M66zYS/4uR8U3665D0jUXEcn79zfqGZxH4OfMuYxHlSHoV6vFK392Bs
	O4sPcym8xFJmQdSSwxdbNolYFFSatZzmWTWDez9/N00snxo9KeWo3UqZY0skQNbox82IvTo0ONV
	18/bpVTWFrodsqH18WVWf1K4QTt137A/ytgFhU+6cbjV92mAnz6avmyfLHiGf/28+3zO8UHfp/U
	rsdhA93074S29sq6j9sIWkYpGiDr2EDlh/AahDpo8LoUgI7qUAW5oCbRDh9FJTctTkxpDtPLT0u
	Pl5/sThyM2jS5trLvWZRductFnF0gMLMojqoCXvUse/98viFK9pFBOkCG1tHsG7hf3EBmjXDH7N
	/Di/bvIs5hs8sQoEN9pAbnLzz6eqmv8E1B6LfJih1my180MNCb4gcIUxb/fC77oxd6aLLe9+f2i
	ElnOhECef6cJxIA9V1hAjhht7Ha9IROodVBQcKi7AEsEmyNNn0TZcH/thsmd9eyBSx6aXllugTl
	iyw+PUbtZkEJ+htzklEq3BGMJxftk7pE
X-Received: by 2002:a05:600c:c173:b0:4a2:191f:7cbd with SMTP id 5b1f17b1804b1-4a35ac8bbd5mr40436765e9.11.1792862819430;
        Sat, 24 Oct 2026 10:26:59 -0700 (PDT)
Received: from fedora ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359fc1207sm52573855e9.1.2026.10.24.10.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 10:26:59 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: jorge.lopez2@hp.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: andriy.shevchenko@linux.intel.com,
	linux@weissschuh.net,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	meatuni001@gmail.com
Subject: [PATCH v7] platform/x86: hp-bioscfg: fix heap OOB in hp_enforce_single_line_input()
Date: Sat, 24 Oct 2026 22:26:41 +0500
Message-ID: <20261024172641.19424-1-meatuni001@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The input is copied with kstrdup(), which stops at the first NUL, but
the full write size is passed to hp_enforce_single_line_input(). With
an embedded NUL the helper reads, and can write one byte, past the
copy. Use strnchrnul() so the scan stops at the first NUL, and return
-EINVAL for a NUL or newline before the last byte.

Tested on HP EliteBook 840 G2 (Fedora 44, Linux 7.2.8): writing "A\0"
followed by 4093 bytes of "B" to current_password 100 times returns
-EINVAL every time, without reading into the heap.

Fixes: a34fc329b189 ("platform/x86: hp-bioscfg: bioscfg")
Cc: stable@vger.kernel.org
Suggested-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
Changes in v7:
 - Use strnchrnul() instead of a separate NUL check (Andy)
 - Drop the trailing comments

Changes in v6:
 - Return -EINVAL on embedded NUL instead of limiting the scan (Ilpo)

Changes in v5:
 - Limit the scan to the string instead of copying the input past its
   first NUL (Ilpo)

v6: https://lore.kernel.org/all/20261016025352.230535-1-meatuni001@gmail.com/
v5: https://lore.kernel.org/all/20261007134711.473857-1-meatuni001@gmail.com/

 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
index 876fc35d035b..8873d91bc235 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
@@ -162,12 +162,12 @@ int hp_enforce_single_line_input(char *buf, size_t count)
 {
 	char *p;
 
-	p = memchr(buf, '\n', count);
+	p = strnchrnul(buf, count, '\n');
 
 	if (p == buf + count - 1)
-		*p = '\0'; /* strip trailing newline */
-	else if (p)
-		return -EINVAL;  /* enforce single line input */
+		*p = '\0';
+	else if (p < buf + count - 1)
+		return -EINVAL;
 
 	return 0;
 }

base-commit: 8667bd30fd033295b3038ce374c551d1059538ba
-- 
2.56.0

