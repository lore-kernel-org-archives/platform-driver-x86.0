Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5384F052B
	for <platform-driver-x86@vger.kernel.org>; Mon, 28 Sep 2026 19:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790625167; cv=none; b=UFKCutfTa8KQRQvhpt2GDV0bKaRGUwRYPGRusdR5PJNDFDz7fibnYAD8d6OnwywBc6V9P4btZSc2aFXdz/anRzuHAN0PtGzEdpj1fG8+UlS3jTK8TRRSl3BxZ2q7RQrXG9U1RNpJFlXeMB2pHrOowgJagbfWJ58Fh0UcCmxJpXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790625167; c=relaxed/simple;
	bh=FTFVY4LJSlBMUY/FEld8hN6bCc4348a28Oei6Yt4Qoo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mQVLwX1hu7GeECJjyZhVEv+HfU/rZBeyO/Df53DP97mIWUPFZN2VgKQKl9HKiAt+fC3/0uRQtAKCt/GoytziK6Z4xTtxap10xDSUz78g09QqarYaobOoV/6pnb04x2piA9/XvDzgMeDAq4wcQ+5Izz0/5uNlnkHMebtio+DhZTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MlQ72UZW; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MlQ72UZW"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48877905b89so393652f8f.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 28 Sep 2026 12:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790625161; x=1791229961; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9nE0ky2uir3ZbtbsE6y1/dKsaMUepowe2tawAEc50Fw=;
        b=MlQ72UZW1MkenJ1oowCz/3d8Ifkq7Ai7xvZA0t3F06BrpWi0Vq7iDRvlQ0w5u7KIG2
         NwbDxbDM/bYCBoUWpyqqIo/R1033gK8/iBNSdeqlGtx31Ol2d86SFewM0AT13U1nvfiq
         53S3CYynmdcXuWaDrbkFWZBLvu4cU+BYE7anK2coyFGcgHtFXwJomvMXTwGF5TAeVNwj
         iIr0dbNG3T9TnVesyDFrXVWVbd57EDI5/CXlnL7e3OyZgRkAPnfp08yanj8HyauSnuyw
         hoQK1aYpth8pTYVf3TQf7Wy7YyBzqmU64PrIKTu+O3thqWfkvayRuSOX3l49R2nnb7xy
         cYlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790625161; x=1791229961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9nE0ky2uir3ZbtbsE6y1/dKsaMUepowe2tawAEc50Fw=;
        b=NE5QIGJKRG4ek1Gr3ZQ/+2kU2lbeaGMDd4YRNzLQEM0uX72Q+DCObwvISjJfJUrsQJ
         42fmCpAGzItLknsm0j+eZswMWnXuWT9QdHe4JbHRKMx5PwuB98djnz8UPvb0r8Xt6Ai+
         p5Km+EabJD+NJOQATQJ4Z99X9Tp6t8gd+CCOmJ6a315pwA2nOHre/K2pdItwSnjxhG58
         VTbG+pzwyNkSi+xk7uoN0Ttw3QeRs5j4BmwSz4UnmrDRX8UsgCWkJ6pso9efaYVqP/0Q
         OoMng2wevRDRxgTKqOKQpa84vwDvl1gew8xwuYaMX2d4Ov9Zf4W4T4ybJU4jOJh4Fzj8
         ieXQ==
X-Forwarded-Encrypted: i=1; AKwUvBxo6aju72JIPHorClZLz9srHXPiqT1lBEuPlWLqncsMYDA0mUKgCMXQ4MfWdX302bX0zvcFWWNZCDNzUqrc3FU9EPyq@vger.kernel.org
X-Gm-Message-State: AFuF++lzTS3E8zppiteZc09CCeYGqrlAAebwiLPyyqiNu0MbLq3dkyJw
	aHH8HjBmbYFZ/ac5yrC1e3zywWBcHB1yd0V1VQTtac4utb8HeI0hwUdl
X-Gm-Gg: AYBFou3vuiDWk7eE7B+bPD7X5Y2QCvusR6Xn8nhrtzeTfE6js+OjkuMJAwBsZT2WetY
	nl4rnDlVZNtAuNw/WHUnZ3+fIhVaNy0gm2Rhk4omeBq/Hk3e83KUaLmR6LGKz1e9rKKusEbeLiN
	7dSTHHZUPGAaaF8mlShb2/NcOgWrGlSm7oSZ+a5SsBdn+OotTLGXnA63JWJ6pEnUUrX8OLi5Jci
	GcHHJ+LTVnl5s4I1tmmBOyUwZgsyXe1c4g+1FRYKrIS4HlatTW9iS68ZIFtODwwoJ1OhCGjog2X
	zLJQ7G/EnN4XzfhsoRVSzaiO9GiPalqjXwLuyQettRj6PbBbt82ACVhpxMM5t10jFKBCGSndZf6
	H8v/mTKgc8NX5FFqlKeLNuR+e7PgU8eQDDUbJ0psqJw27ygXbvL1ekfjjeAQR4GHOqUGmxPEW7K
	i2lVJYwAMCGyqKdlTrPC+l1nsiQc5v6TJCMidwaEzigIXKtvW9JYExD+5TrQU0xfwHylw7fLuCc
	wT9hcTbd8kJfEaOPqjD
X-Received: by 2002:a05:600c:8b38:b0:4a0:b6e:b844 with SMTP id 5b1f17b1804b1-4a00b6ebc3fmr26077875e9.1.1790625160463;
        Mon, 28 Sep 2026 12:52:40 -0700 (PDT)
Received: from lima-kdev.local ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00c130538sm22768995e9.4.2026.09.28.12.52.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 12:52:40 -0700 (PDT)
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: tim.c.chen@linux.intel.com,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>
Cc: KPrateek.Nayak@amd.com,
	Vishal.Badole@amd.com,
	klaus.kusche@computerix.info,
	linux-kernel@vger.kernel.org,
	mario.limonciello@amd.com,
	mingo@redhat.com,
	peterz@infradead.org,
	platform-driver-x86@vger.kernel.org,
	ricardo.neri@intel.com,
	stable@vger.kernel.org,
	x86@kernel.org,
	yu.c.chen@intel.com,
	llvm@lists.linux.dev
Subject: Re: [PATCH] sched/cache: Honor asym packing over cache aware scheduling on hybrid system
Date: Mon, 28 Sep 2026 22:52:31 +0300
Message-ID: <20260928195232.61319-1-kayracizmeci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <221f8b0345328c4b26b65daff4d3eec56a32b06d.1790617047.git.tim.c.chen@linux.intel.com>
References: <221f8b0345328c4b26b65daff4d3eec56a32b06d.1790617047.git.tim.c.chen@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Helloooo Tim,

> A regression was reported on an AMD Ryzen AI HX 370 running a cache
> intensive Clang full-LTO link. The little cores run at a much lower
> frequency (3.3 GHz vs 5.1 GHz) and have only half of the L3 cache
> (8 MB vs 16 MB), so pinning such a task to the little-core LLC hurts
> twice, and full-LTO builds slow down dramatically compared to
> pre-cache-aware-scheduling kernels.

> Asym packing and cache aware scheduling express conflicting placement
> strategy. Asym packing wants a task to run on the highest priority CPU,
> whereas cache aware scheduling wants to co-locate the tasks of a process
> on one LLC regardless of the priority of CPUs in that LLC.

> When asym packing tries to migrate task to an empty
> core that has higher priority than source cpu, let asym packing win.
> Moving tasks to a higher performing idle core will buy more
> performance than cache co-location.


> +static inline bool sched_asym(struct sched_domain *sd, int dst_cpu, int src_cpu);
> +
>  /*
>   * Check if task p can migrate from source LLC to
>   * destination LLC in terms of cache aware load balance.
> @@ -10847,6 +10849,10 @@ static enum llc_mig can_migrate_llc_task(struct lb_env *env,
>  	if (cpu < 0 || cpus_share_cache(src_cpu, dst_cpu))
>  		return mig_unrestricted;
>  
> +	/* Prioritize asym packing over cache awareness */
> +	if (sched_asym(env->sd, dst_cpu, src_cpu))
> +		return mig_unrestricted;
> +
>  	/* skip cache aware load balance for too many threads */
>  	if (invalid_llc_nr(grp, p, dst_cpu) ||
>  	    exceed_llc_capacity(grp, dst_cpu)) {
> @@ -12043,6 +12049,15 @@ static inline bool llc_balance(struct lb_env *env, struct sg_lb_stats *sgs,
>  	    sgs->group_misfit_task_load)
>  		return false;
>  
> +	/*
> +	 * On asym packing domains, if the destination CPU
> +	 * has higher priority than all CPUs in the source group,
> +	 * prioritize asym packing.
> +	 */
> +	if ((env->sd->flags & SD_ASYM_PACKING) &&
> +	    sgs->group_asym_packing)
> +		return false;
> +
>  	/*
>  	 * Skip cache aware tagging if nr_balanced_failed is sufficiently high.
>  	 * Threshold of cache_nice_tries is set to 1 higher than nr_balance_failed
> @@ -13458,12 +13473,12 @@ static int need_active_balance(struct lb_env *env)
>  {
>  	struct sched_domain *sd = env->sd;
>  
> -	if (alb_break_llc(env))
> -		return 0;
> -
>  	if (asym_active_balance(env))
>  		return 1;
>  
> +	if (alb_break_llc(env))
> +		return 0;
> +
>  	if (imbalanced_active_balance(env))
>  		return 1;
 
Hope I could test this. But I don't really have hardware for it :-(.

Regardless tho.

Let's say when entering can_migrate_llc_task(), dst_cpu is CPU0, while src_cpu is CPU1.
And CPU0 has a bigger asym_prio than CPU1. No SMT. When entering can_migrate_llc_task() and sched_asym()
from there sched_use_asym_prio() returns true without checking if the core is fully idle or not.
And sched_asym_prefer() comes back true too, so sched_asym() returns true and, we just returned mig_unrestricted.

I could be missing something, If I'm not tho is that on purpose? If it is, the last paragraph needs to change
since it says that "asym packing tries to migrate task to an empty core" and after that "higher performing idle core"

Thanks,
Kayra

