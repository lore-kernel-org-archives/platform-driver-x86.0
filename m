Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C96483F7AB8
	for <platform-driver-x86@vger.kernel.org>; Fri,  7 Aug 2026 14:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786113652; cv=none; b=PmTmeh60v3GdW3N6tlzIrthcObuvGxiHDoOKJFIpQfAuTwr5Q0MJGaK4PrVTsEa6a5kLrAwssYstSRC65ixQYYPMpwg3NBP+oOdCsRSXT0OKQe6QdtRyMPGD4NzPa4r8/ksa7bRrU57Ewbb5joxW60x+F04KB472VIrJ1GA5ZAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786113652; c=relaxed/simple;
	bh=oI0oe6VrTB67fmNgGEWtYeo5Q1VrP79oiuVCB75VHIc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d/y1EaNnyJqC0vXnaVHmw7omuPO2arMhBUfp0iqyDdVCrTzn29QuJtcJs1Q71gyyNf+Slncy4xLB0rFDG0MJv4C+GoJCvOKX0MNXVxWz0O5FKtPxPkcPuVGFChwjTJ9FYzHc3y8tM1fKvt0bSONux3DCmntLhEtrzkRp9Gzgdf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X7mJkZjd; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X7mJkZjd"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38ea87caafeso2969334a91.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 07 Aug 2026 07:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786113645; x=1786718445; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LShjbJeEqOu9xhr0m6OP6Zlw5WppQjCW7XffJzXc/YM=;
        b=X7mJkZjdQFpfgvNH6bIAxBKFmj4utiRNfINNGRbt3eXpVJeNaN7BhS/CmoVPHD0/qF
         tE6+tRnqN+LA70+t7H/Cq2rFq5dBYENBmJykcFj2sy7jdNAagx3GZ81XS3l+3KFG0ioq
         AFbCJ8y57lYhf7/f5BUFmLlRLmJofZIq3e2MjxmjGjh4uOHv2rmbZqgjB1eXUwiYmal8
         iI1VhK0Kzqh/TLoJqowoRSgyj4cpajxso1+r+1sXdoBpJt8qvH5eS5s9JVkHm4vRefD6
         vY1NJ+A3IOkQShFvzEFzeOrkeEp//QT0KZIWb7ch2AlwpTwvDWdB1RFlhyfJxl92rCx6
         uZHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786113645; x=1786718445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LShjbJeEqOu9xhr0m6OP6Zlw5WppQjCW7XffJzXc/YM=;
        b=LjRu98Vkw1lUXJl9lJb6tnFMP9cX71pZVvA4V2wwMnV9KmWj/GneFyCjvRlx0uUwN3
         Q0hf8eGEGBG6VNdHpwRvu7p7/xapWFGCFABJOIyWHpOKi9WJVA4MAd6tNyoJ3i1Qh4GZ
         /Uflw/3ILTGaDVJE5kCldGvmRyKejQXoabO8/K7X33y6XIvnEtJN276i6vRZaeTv97JS
         esC5dPuaHAgkHNBC8pfxo97lKvhTAeNw8IcZxUsiePsHj06LmbNofNcc+khHuhpcSVTk
         dcMo06aBv7nL7ilOZz5VfIAdp4JoJ3cPPIphxhDsFyLzRLxQBTAvp300mWgXhgm4YFcl
         2THw==
X-Gm-Message-State: AOJu0Yzk99bwh1K9YADPT8F9gAK/TKU0M585oaRWbF+kUNH6ooW9YRO9
	k6e6kZC959N+Kk7rNqDZjm+nfcd1Vxf6g8Yc7vJOqDDqME1iDHDj0y9f
X-Gm-Gg: AR+sD13voI4rq4GwOiL8jxZESzxhN3xEYC1e2l4BOvp7Ep+EEkZlVnHmMYB1WDQ9+zT
	mxx/c1JbHqP1S2hEatA2IJtM64Qj8KM4yDfkCUo77F+VCR/zUmAP1SBkK30z96eKepydzZatg3L
	+W1FoGAPWXqYcEaBYOTITTnJ4NqqPVlyCeRS1IsG61r7QTSrKs1HT/TJ/VIz2vX8m7Le5ad/mkU
	Ph50RtctYLkey4FdOr0nqKkSXzZUzPDD5zdjNAJqiMa/jiRfvPq/QLod0piAxqcGwn+Aums6HQe
	I+9TTdAkkRVq9JobKjVshtyV7rFk6O/4o3wCHHduLyESnLupqZRUGazWnv66ZHH+1oq4rjP+TNB
	/MoEKPVgvYlhzikEsFJVhkGObOpXhBsOVr6uvzH239+OmEzPufRb+uszZeMA5hBLZ/3n+11LsCp
	2s4TspHjpUpyeLIb/ms8jleQkl0z7jwv/vbovzSPMP36XSlrmKpCsyylwTkAdkeKZkRzD06Foy6
	cPMDgD8k28qnHWZP6z9IQLC9gYdzXnaN37Vqru27EDgqyHDX9EeyA==
X-Received: by 2002:a17:90b:2e42:b0:382:1a6f:ba3b with SMTP id 98e67ed59e1d1-3909d7d2f85mr11461420a91.5.1786113644715;
        Fri, 07 Aug 2026 07:40:44 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3925ff24b91sm2917026a91.9.2026.08.07.07.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 07:40:44 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH 2/2] platform/x86: ISST: Validate level in perf mask ioctls
Date: Fri,  7 Aug 2026 23:40:03 +0900
Message-ID: <20260807144003.3498972-3-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260807144003.3498972-1-sammiee5311@gmail.com>
References: <20260807144003.3498972-1-sammiee5311@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

isst_if_get_perf_level_mask() and isst_if_get_base_freq_mask() use the
user-provided level as an index into perf_levels[] via
_read_pp_level_info() and _read_bf_level_info(), but neither helper
validates it first.

The adjacent level-info helpers reject levels above max_level before
reading the same per-level register block. Add the same bounds checks to
the mask helpers, and reject disabled SST-PP levels in
isst_if_get_perf_level_mask() to match isst_if_get_perf_level_info().

This prevents out-of-bounds reads from the per-level offset table on
invalid ioctl input.

Fixes: ea009e4769fa3 ("platform/x86: ISST: Add SST-PP support via TPMI")
Fixes: 06a61df83209 ("platform/x86: ISST: Add SST-BF support via TPMI")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-5
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 .../platform/x86/intel/speed_select_if/isst_tpmi_core.c  | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c b/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
index b2965baeaa36..f1b6109521c5 100644
--- a/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
+++ b/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
@@ -1263,6 +1263,12 @@ static int isst_if_get_perf_level_mask(void __user *argp)
 	if (!power_domain_info)
 		return -EINVAL;
 
+	if (cpumask.level > power_domain_info->max_level)
+		return -EINVAL;
+
+	if (!(power_domain_info->pp_header.level_en_mask & BIT(cpumask.level)))
+		return -EINVAL;
+
 	_read_pp_level_info("mask", mask, cpumask.level, SST_PP_INFO_2_OFFSET,
 			    SST_PP_RSLVD_CORE_MASK_START, SST_PP_RSLVD_CORE_MASK_WIDTH,
 			    SST_MUL_FACTOR_NONE)
@@ -1344,6 +1350,9 @@ static int isst_if_get_base_freq_mask(void __user *argp)
 	if (!power_domain_info)
 		return -EINVAL;
 
+	if (cpumask.level > power_domain_info->max_level)
+		return -EINVAL;
+
 	_read_bf_level_info("BF-cpumask", mask, cpumask.level, SST_BF_INFO_1_OFFSET,
 			    P1_HI_CORE_MASK_START, P1_HI_CORE_MASK_WIDTH,
 			    SST_MUL_FACTOR_NONE)
-- 
2.43.0

