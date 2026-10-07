Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B75BE4B95C2
	for <platform-driver-x86@vger.kernel.org>; Wed,  7 Oct 2026 13:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791380906; cv=none; b=qVFdK+sNkxj7VKaqyqrRyBxbTsF57aKAWSqVx5qnGW70QLvXuViDxDR+r01hs5JiGduQPhXRbs2ToR0PjbK3XiaqfoZ2g5vKCfxiVBEUdZNXRIKrgFUzPE1MyUjgo2C1bwmFOiVGxVk3PB3ypeLzLuEiyN0iaG8lU0mYCal54Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791380906; c=relaxed/simple;
	bh=MDiBfIjRAD/9liNRNIW9RrRIxbtM+EmI8HGLCuM5yLo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a0yFKzKkIiFm5gGm+KdqXovOVb1rrq43T5g+CuF5IAt3fzau/AZwTTXBzxGYIXdeI7o48U+/uKVbxVN6wKfZv+3zk8MA5ikgir7RM8fHWTKqObPhRXjNU+5GjaSNPI02j58V88/zaDu24e7uTI0NNPDb4mHsoInkfa5dGSd/4CE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GtQ73ozE; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GtQ73ozE"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3514b90bb89so2731607eec.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 07 Oct 2026 06:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791380895; x=1791985695; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZuCUOmx4tSjkz7kbuZkfJEsfg10SOd8hDd0kjVq88FI=;
        b=GtQ73ozEdwNN2qLErJB2zygpZIWls27dGyLIzlSZ8LL3+Fslahh8RzZhogtNqdQSzR
         FDpXfoOvlh7BMpwlyAHRYglsyvvZvqhRKUCEcG/gubgjJXZhEtm8EwrybGzlYqVCyNQ2
         kzNwWKCADAsL5dVnOwyyUbm4UbCTNwbg5DFmSq4YpLMSMyxwSeihYQd9aT0Iw3+bwWiQ
         0+yhklaPvXe8gp7sgJtMiL8CQB7dbCX9OnvV4fMj+9OadKTh/5rANogRglOA/wv4OUlP
         Qnjt+N0zc8yOfJNxUUJhd26SS63VAM1UDQjyEVmy7433Vl8s5+3ttn03RxW6IXcyGJS7
         vNMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791380895; x=1791985695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZuCUOmx4tSjkz7kbuZkfJEsfg10SOd8hDd0kjVq88FI=;
        b=OvI21sSH98rFRr4Ez/WM66qMWWPIjSkZ+4gB4Oi605NGSIBa2kRaJ6xJ8duuNHDZ+g
         ZzHp6CAfJBHZZLUVC09aMhDLBhUbnG3kBtkIk9NaiK4lYKZFBJuGTz1WpACp8Tw4sv7T
         zqFZzSAVfZRXFWI6jCm1q48iJeF3kLzQFUhFVrl3XhXGX7iEwC3YlquAjKvNjEgZ4UeR
         +rzks+GYYHPuYVyNfC4o1hzgchSXsdWa71idUPe+2U1M+THSYGHuOcPFIUGMJs3iXVGX
         JXyUeSG5N5ZCQwVFP8wG7iw6G34SCmxbIOGhHvO3GlnTDhUSbPddShF+6hPh7rKKolAS
         B97w==
X-Forwarded-Encrypted: i=1; AKwUvBxT2qKFMVpdNZR7dCSkYEJGLLpb5W2WgNtOFz1SeoXbAuvU9N97JDqrdSxuFkHNMWsVFsUqwy/rqMB1XqraUtty3k9a@vger.kernel.org
X-Gm-Message-State: AFq9FYJqQncdkeRtMP5eU8/W9N6cIjvwBc71gWh8zvfFfjoQIIdtoxw4
	Lgl+g0AHgzdVmZ10JpFPjQVOGS8RbzZfHD7hHkCmCQCs1J4mDmW3IU4u
X-Gm-Gg: AYBFou1Nklf6L7kcP7nlaxMzOCxe7ehqNtc85rtjVmFonbPmU6jH0ET+3ET23JJUthu
	ABbcv700cwTax2WzMxsvUigVPqjTBTAFbhn4nCgQWxr2ts2pkEFhzpikWQ/dscDOmpwAVhH3rRs
	KnyhCQh4URrJHA0mLH+V/RJY1bMPaZHvjIdjHqbGENmI3SNUJ1xh6cZX1WgEjn1QW+jhjKf/vkA
	qinL2bM6Hg0Fk7HbFCNsc8E2iEyoQvRHg2KY7HqAoM9D3WdxbccndIdeYhwwyWhF4bD/hAiUJZ9
	v6jjRviTsQoUjz7/P2oPnDJ/MpDurs0Plu9lfTyfoeEeoT9hChTtG6yl5Nv25XyPFZR9wr6skJd
	BDDXN9u6soZaevCIplGHGTy6+poxs/Rc7qKpfLf5pjITSfGJERFxDU58p5iMFnSxL2E9euND4eG
	6powIb+CM+Uf/EdL97EbRHOvgZXy0BVIQTwbz6ix1vwZWy1S+Az2WNRq+WYpJa23jc016oUsRP+
	9MWxypJU4SqywMieDWr7JnezGX4bnYEsP93
X-Received: by 2002:a05:7301:618e:10b0:33e:c164:b5d7 with SMTP id 5a478bee46e88-3515da27012mr2459342eec.3.1791380895299;
        Wed, 07 Oct 2026 06:48:15 -0700 (PDT)
Received: from fedora ([2a02:6ea0:c803:3091::12])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515aeb5c2esm7304472eec.10.2026.10.07.06.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 06:48:14 -0700 (PDT)
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
Subject: [PATCH v5 9/9] platform/x86: hp-bioscfg: fix oops on short integer attribute buffer
Date: Wed,  7 Oct 2026 18:47:11 +0500
Message-ID: <20261007134711.473857-10-meatuni001@gmail.com>
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
 drivers/platform/x86/hp/hp-bioscfg/int-attributes.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/int-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/int-attributes.c
index 5373af71549a..41287e08c7bb 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/int-attributes.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/int-attributes.c
@@ -329,7 +329,12 @@ static int hp_populate_integer_elements_from_buffer(u8 *buffer_ptr, u32 *buffer_
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
2.55.0

