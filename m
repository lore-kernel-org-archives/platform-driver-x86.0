Received: from www74.your-server.de (www74.your-server.de [213.133.104.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0297437B023;
	Sun, 27 Sep 2026 10:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.133.104.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790506094; cv=none; b=msUmuy4luDEA8D5wAfFxpGnmeuKzsxNEbWVoWbR4gzOlXHW0vUk+8xPjYSEDrtzxs+rNegwLhOP86F1gcglthuhoZNloajqrIFsrzMhq1689PXNB5/HYh06CapzjlMpgvZITVumoblnHzKzsdmFbL0LAr8YEnEA6t2XZWuKOkD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790506094; c=relaxed/simple;
	bh=Evrj91Ila7nbOEZz0P1+2Xn8xlvJDkcBwc9YnN3YQKs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=isJd9jB+QoPpHaldT4hANT9y7hadWh0I7pz7ZNEWlFZfFZ7cxGmDptuFeLIfpzjYhrLwy5SREhC8NCtV0xBJvew7rpByLTLuFv4qZgVzFM/j1hoUXYS9ncj3aZHkcH0R24n+nI4mCpH0KC+o3VdZ+pgV62zFr6P/tIAs7TC2Bn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=computerix.info; spf=pass smtp.mailfrom=computerix.info; dkim=pass (2048-bit key) header.d=computerix.info header.i=@computerix.info header.b=liZ/7u+o; arc=none smtp.client-ip=213.133.104.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=computerix.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=computerix.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=computerix.info header.i=@computerix.info header.b="liZ/7u+o"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=computerix.info; s=default2306; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=2hLMhIa9Ec6Vw4Jhx7X/w2tr6xVso53xpW73x5V3yys=; b=liZ/7u+o6G0jCj3jbLqaU4EmdU
	mtfVCZVOyo0ZnhLieLJKiU2nYmA7bcdEtMAB/ekjs6M5Bl9Bl9AZc3RuZGw8wQwG4ivA4sr+9WpTv
	y2MWmzoDVvSTSwAX0X+222Bt8DyTiXnszIZyrpvCGzDhSVZD/Eoqw6TpP1JtcalGbVgMKaFH8b7DY
	XBIO4AQJov3cxsuKxAsPFJv9aNoDjPY6chUwwWDrpQNSp4A8F77+Z5oW3KAvt8aRCpusGiBODSOn7
	w9suK2MSOkeTMTZXewDrzQU7WQhAlqU+Lfdt+bPwrbQll/280eO1wUuIi2f7TWBFLZAtgBVyGI3yT
	/yj3vyCw==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www74.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <klaus.kusche@computerix.info>)
	id 1xAmQF-000AVj-2R;
	Sun, 27 Sep 2026 12:47:55 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy05.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <klaus.kusche@computerix.info>)
	id 1xAmQE-000Nj2-0p;
	Sun, 27 Sep 2026 12:47:55 +0200
Message-ID: <c3e26de1-85de-4b44-8498-9878e95f4d5c@computerix.info>
Date: Sun, 27 Sep 2026 12:47:54 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Cache-aware scheduling does not work well with amd big/little
 cores
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
 <e2c87de0-31f7-4ed0-b80e-7f9aa7d0e511@computerix.info>
 <c69168ffeeb1d6ea4399b1a9ed6da7b24ac69bb8.camel@linux.intel.com>
Content-Language: en-US
From: Klaus Kusche <klaus.kusche@computerix.info>
In-Reply-To: <c69168ffeeb1d6ea4399b1a9ed6da7b24ac69bb8.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28136/Sun Sep 27 08:26:12 2026)


Hello,

this one looks good.
It does not show any core assignment anomalies 
in the core bar graph (i.e. no processes are staying 
on little cores when big cores are idle),
and at least for the two compile jobs I tested,
it gives timings which are 

* better w.r.t. elapsed wallclock time
(sometimes slightly, sometimes significantly)
than all other versions and patches I tried so far
with cache-aware scheduling on

* and at least as good as the unpatched kernel
with cache-aware scheduling turned off
(so one does not loose anything by turning it on).

As expected, the uv build profits more than the kernel built,
because besides all-cores-loaded and single-core-loaded phases,
it spends significant time with about half as many busy processes
as cores, and in these phases, placement makes a difference.

Klaus Kusche

On 25/09/2026 21:19, Tim Chen wrote:
> On Fri, 2026-09-25 at 10:59 +0200, Klaus Kusche wrote:
>> On 24/09/2026 01:47, Tim Chen wrote:
>>> Hi Klaus,
>>>
>>> I wonder if you can try this alternate patch to Chen Yu's.
>>> This patch does not require turning off cache aware scheduling
>>> entirely as in the previous patch when using the asym packing
>>> mechanism to prioritize big core.
>>
>> Hello,
>>
>> 1.) This patch applies with quite some fuzz to 7.2.7 (for example, 
>> the context of the -10847,6+10849,10 hunk is obviously different), 
>> and the resulting fair.c fails to compile:
>> call to undeclared function 'sched_use_asym_prio'
>> conflicting types for 'sched_use_asym_prio'
>> (sched_use_asym_prio is called before being declared)
>> use of undeclared identifier 'env'
> 
> 
> Thanks a lot for applying the patch and reporting back so quickly.
> 
> You are right, and the fuzz is the cause of the build failure. I
> generated the original patch on top of Peter's sched/urgent tree,
> where fair.c is laid out differently
> from 7.2.7. The interface to can_migrate_llc() has been
> modified to use "env" in Peter's tree.
> 
> I rebased the change onto v7.2.7 for you to test. It now applies cleanly with
> git am and builds. Two things differ on v7.2.7, so this is a real
> backport rather than the same diff:
> 
>   - can_migrate_llc_task() takes (src_cpu, dst_cpu, p) here instead of
>     an lb_env, so I pass the sched_domain in explicitly and update its
>     one caller.
>   - llc_balance() has no SD_ASYM_CPUCAPACITY misfit early-out on v7.2.7,
>     so the new asym check is placed after the SD_SHARE_LLC check.
> 
> You can either test with the previous patch on sched/urgent
> (https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/log/?h=sched/urgent)
> or use the backported patch attached to the end of the mail.
> 
>>
>> 2.) As far as I know, "inline" does not look ahead in C.
>> So I think the call to sched_asym you added in hunk -10847,6+10849,10
>> will result in a real call, not in inline code
>> (at least without optimization), because the code of sched_asym
>> is not yet known at the position of that call.
> 
> 
> Good point to raise, but that part is not the problem. Whether the call
> is inlined is only an optimization and should not affect whether the code
> compiles: a static inline function that is forward-declared and defined
> later in the same file is valid C. I checked my disassembled code
> and find that sched_asym() in indeed inlined.
> 
> There are other function in fair.c already with similar declaration
> for cfs_rq_max_slice(), account_mm_sched(), and others.
> 
> Could you give it a try on your system?
> 
> Thanks again for testing on your hardware.
> 
> Tim
> 
> ---
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
> 
> [ Backport to v7.2.7: can_migrate_llc_task() takes (src_cpu, dst_cpu, p)
>   here rather than lb_env, so pass the sched_domain in explicitly. Drop
>   context from task_misfits_asym_cpu() and the SD_ASYM_CPUCAPACITY
>   misfit check in llc_balance(), which are not present in v7.2.7. ]
> 
> ---
>  kernel/sched/fair.c | 26 +++++++++++++++++++++-----
>  1 file changed, 21 insertions(+), 5 deletions(-)
> 
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index bb8a5f358ee19..2dae60ad09276 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -10575,11 +10575,14 @@ static enum llc_mig can_migrate_llc(int src_cpu, int dst_cpu,
>  	return mig_llc;
>  }
>  
> +static inline bool sched_asym(struct sched_domain *sd, int dst_cpu, int src_cpu);
> +
>  /*
>   * Check if task p can migrate from source LLC to
>   * destination LLC in terms of cache aware load balance.
>   */
> -static enum llc_mig can_migrate_llc_task(int src_cpu, int dst_cpu,
> +static enum llc_mig can_migrate_llc_task(struct sched_domain *sd,
> +					 int src_cpu, int dst_cpu,
>  					 struct task_struct *p)
>  {
>  	struct mm_struct *mm;
> @@ -10594,6 +10597,10 @@ static enum llc_mig can_migrate_llc_task(int src_cpu, int dst_cpu,
>  	if (cpu < 0 || cpus_share_cache(src_cpu, dst_cpu))
>  		return mig_unrestricted;
>  
> +	/* Prioritize asym packing over cache awareness */
> +	if (sched_asym(sd, dst_cpu, src_cpu))
> +		return mig_unrestricted;
> +
>  	/* skip cache aware load balance for too many threads */
>  	if (invalid_llc_nr(mm, p, dst_cpu) ||
>  	    exceed_llc_capacity(mm, dst_cpu)) {
> @@ -10689,7 +10696,7 @@ static bool migrate_degrades_llc(struct task_struct *p, struct lb_env *env)
>  	    READ_ONCE(p->preferred_llc) != llc_id(env->dst_cpu))
>  		return true;
>  
> -	if (can_migrate_llc_task(env->src_cpu,
> +	if (can_migrate_llc_task(env->sd, env->src_cpu,
>  				 env->dst_cpu, p) != mig_forbid)
>  		return false;
>  
> @@ -11753,6 +11760,15 @@ static inline bool llc_balance(struct lb_env *env, struct sg_lb_stats *sgs,
>  	if (env->sd->flags & SD_SHARE_LLC)
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
> @@ -13140,12 +13156,12 @@ static int need_active_balance(struct lb_env *env)
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

