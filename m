Received: from www74.your-server.de (www74.your-server.de [213.133.104.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6CA3440A2F;
	Fri, 25 Sep 2026 09:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.133.104.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790328006; cv=none; b=YzzG02XU31ICdB0c9PHmaaXezgWYaV2ApFL5b0hXFZ7rhceTjWyO3Fegxzz3BRWbOOyyC1lTxKz1B/BBlOwyIqVg2u9DjVpK5R8f5oABlU4IDLb4L+3ZRGGgGaWNCpc4g7brAfCYLXLpNDXH0tBL5B3zaysw4HvtN73fgfvaZf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790328006; c=relaxed/simple;
	bh=Jb+tfZXfhjkMwyb675IEbLXf0k99xcg6s0tFPleHucI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=avOHbIS806+/1i0XMBtmAJ+ANqP+qm8x/7Cp4DvKFsinvoYofJye9eKEXh3cPL8ekpdbR9ykPRpcPFike6ZlyibbBN0ha02MgsstbWUlnUFauLAFjyaBsfZmY9nK+esVNw0nuqtnAlmgCnjn0V+gAMGR3yFHoMNjX/4F6me1qKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=computerix.info; spf=pass smtp.mailfrom=computerix.info; dkim=pass (2048-bit key) header.d=computerix.info header.i=@computerix.info header.b=qLoCmbPP; arc=none smtp.client-ip=213.133.104.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=computerix.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=computerix.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=computerix.info header.i=@computerix.info header.b="qLoCmbPP"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=computerix.info; s=default2306; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=Bgprr1PiioxZNQVAP0PuKrbMqXUqXN3dvlodRiThu3E=; b=qLoCmbPP9mgsFLAaloUys4BEC0
	lnWEw8fJ+wy6cmVOOCksBiXO6upeZPv3jErPJAQhv8sX5Jps3g/++NqweZYLLfSnfa945uP8fS5ni
	lhUhm5JCXqaBW+m1fvX83kq3Oqnj7oHWAGgmdB+Bxo7Y7amM2XSsWxh0JU/RnT/HgEcCykgjkL3kk
	R8Zq2sfX5nlRb9/3rQU18HJRuEvhOvXRc1u9sA3bmrnZeOwmT5pna+9WH/LHr2NmCQyvF+54DrF9r
	iH5ZXnN80IexR2VPKNieTdmScwfXAPIDa0VzE8xN6ajKpPUN1QT7U2ELc4e8vxyR6LDZV5QPessCx
	w3tTACBQ==;
Received: from sslproxy08.your-server.de ([78.47.166.52])
	by www74.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <klaus.kusche@computerix.info>)
	id 1xA1ls-000IU8-0X;
	Fri, 25 Sep 2026 10:59:08 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy08.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <klaus.kusche@computerix.info>)
	id 1xA1lK-000MgO-0U;
	Fri, 25 Sep 2026 10:59:07 +0200
Message-ID: <e2c87de0-31f7-4ed0-b80e-7f9aa7d0e511@computerix.info>
Date: Fri, 25 Sep 2026 10:59:06 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Cache-aware scheduling does not work well with amd big/little
 cores
Content-Language: en-US
To: Tim Chen <tim.c.chen@linux.intel.com>, Chen Yu <yu.c.chen@intel.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 "Badole, Vishal" <Vishal.Badole@amd.com>,
 Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
 "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
 platform-driver-x86@vger.kernel.org, K Prateek Nayak
 <KPrateek.Nayak@amd.com>, ricardo.neri@intel.com
References: <b475039b-defe-46e7-ab85-46e3196da667@intel.com>
 <369d0bbb-db7a-4f86-bee2-332d5295c452@computerix.info>
 <406a5c407bbe60cafc24f715e089f5552a0791f9.camel@linux.intel.com>
 <14630984-9287-4454-b52f-3a1e526e1fdf@computerix.info>
 <3cb5cbdb227bee0b822f1550e10659faadd77a3d.camel@linux.intel.com>
 <e17ef3af-c1cd-4360-ba4b-9900ccc36ef6@computerix.info>
 <76dba935-1052-4fa9-a70c-16cecdfd12c8@amd.com>
 <4da55124e32dd0587a3516c8f5ed512bffbbb42e.camel@linux.intel.com>
 <2fe2c681-b748-41fa-8b56-1169c86cefbc@intel.com>
 <6b173ff1-6fde-401d-a4a8-6fa8bbe3287c@computerix.info>
 <aqfy8PjSUOYI-_Ju@chenyu-dev>
 <8aea0f25-0317-42ac-b59f-1a008c6eb106@computerix.info>
 <7b83cf0cd1704b552978af88d7de9c57970c23a1.camel@linux.intel.com>
From: Klaus Kusche <klaus.kusche@computerix.info>
In-Reply-To: <7b83cf0cd1704b552978af88d7de9c57970c23a1.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28134/Fri Sep 25 08:25:58 2026)

On 24/09/2026 01:47, Tim Chen wrote:
> Hi Klaus,
> 
> I wonder if you can try this alternate patch to Chen Yu's.
> This patch does not require turning off cache aware scheduling
> entirely as in the previous patch when using the asym packing
> mechanism to prioritize big core.

Hello,

1.) This patch applies with quite some fuzz to 7.2.7 (for example, 
the context of the -10847,6+10849,10 hunk is obviously different), 
and the resulting fair.c fails to compile:
call to undeclared function 'sched_use_asym_prio'
conflicting types for 'sched_use_asym_prio'
(sched_use_asym_prio is called before being declared)
use of undeclared identifier 'env'

2.) As far as I know, "inline" does not look ahead in C.
So I think the call to sched_asym you added in hunk -10847,6+10849,10
will result in a real call, not in inline code
(at least without optimization), because the code of sched_asym
is not yet known at the position of that call.

-- 
Klaus Kusche

> From 7bad1c19317e08d398fa36d66940867110bdd037 Mon Sep 17 00:00:00 2001
> From: Tim Chen <tim.c.chen@linux.intel.com>
> Date: Wed, 23 Sep 2026 14:28:40 -0700
> Subject: [PATCH] sched/cache: Honor asym packing over cache aware scheduling
>  on hybrid system
> 
> A regression was reported on an AMD Ryzen AI HX 370 running a cache
> intensive Clang full-LTO link. The little cores run at a much lower
> frequency (3.3 GHz vs 5.1 GHz) and have only half of the L3 cache
> (8 MB vs 16 MB), so pinning such a task to the little-core LLC hurts
> twice, and full-LTO builds slow down dramatically compared to
> pre-cache-aware-scheduling kernels.
> 
> Asym packing and cache aware scheduling express conflicting placement
> strategy. Asym packing wants a task to run on the highest priority
> CPU, whereas CAS wants to co-locate the tasks of a process on one LLC
> regardless of the priority of CPUs in that LLC. When asym packing
> is turned on, it is trying to migrate task to an empty core that has
> higher priority than source cpu, let asym packing win.
> 
> Reported-by: Klaus Kusche <klaus.kusche@computerix.info>
> Closes: https://lore.kernel.org/lkml/2180ea5a-eb28-4152-8d4d-cd00b0c24b2e@computerix.info/
> Signed-off-by: Tim Chen <tim.c.chen@linux.intel.com>
> ---
>  kernel/sched/fair.c | 21 ++++++++++++++++++---
>  1 file changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index f265de8721db..89eed4fbc4e2 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -10823,6 +10823,8 @@ static inline bool task_misfits_asym_cpu(struct lb_env *env, struct task_struct
>  	return false;
>  }
>  
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
>  

