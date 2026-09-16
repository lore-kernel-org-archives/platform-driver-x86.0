Received: from www74.your-server.de (www74.your-server.de [213.133.104.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39EC83314C4;
	Wed, 16 Sep 2026 14:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.133.104.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789570341; cv=none; b=I3iVPF76z30YTVQlIQs05zx13MwT/eE/3qeMTw3km7gfLkkZJwuHmGmPkzishAOVvVH78V4j/s95u9wUX7Lg00ilHVSsdritY5vyQIHaujsXZXoA7LwjeciqkmpyBM3C+MWHX3763lgrU1HQ4kKirOmGVWEKE/+Q92PNBA3J0GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789570341; c=relaxed/simple;
	bh=NZY8BGAYBujV1kGtAu+Vgp2T/dmQQay0i+dMJYhC2hU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=qRJ5MLeeZ0b4+QLPN6W0bzIosgt1KqFdD7I0nFJA/ddy4Tv1HzQPPTcPp4+maMFoyMeEGZZ+4FZP7CJH3RLzlfBRPrhm0v7RDAZK//KmKByCZxMjOPUEzJ855ZewMYYLhM2r2+Hke8LHJLjMKd0W9sexqNx26QpSc/hDoSmngxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=computerix.info; spf=pass smtp.mailfrom=computerix.info; dkim=pass (2048-bit key) header.d=computerix.info header.i=@computerix.info header.b=TkKnm/Yo; arc=none smtp.client-ip=213.133.104.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=computerix.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=computerix.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=computerix.info header.i=@computerix.info header.b="TkKnm/Yo"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=computerix.info; s=default2306; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=65hqr398vlYODQNmv197yx06vKiiDFfduuEOdjcz9Cc=; b=TkKnm/YoGOL6ARTf42mJsU899O
	yLj4Ve6u9lcfYLkhu4qexb7C44tUFs9pQzJtleg7bF7roTFoDxMtvKyeMFYmUcIIBDkZW3o0jIq4B
	7IrD5DhLIB346+vjPpcap5YWL95tIDAesD2T4vqJgmWp8wmc7QR8OuMwIkBx+iBdWq8pAO3cuG17p
	9D42Z2teaEO5yR3Kv/BmfnPmn+rlTgQXT35Z9Q8I7a2eYAvG5DGvwoybUZ3cA+FNTHOTlCuHwZOyb
	2F/Vt/V//qz9z3FOGosKCGXAEi7wj9/NejcmB2y41JKOo61Wlh4DEe/9qtjmQLeXeuY5ajQvnGdAt
	PB0YsX/w==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www74.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <klaus.kusche@computerix.info>)
	id 1x6qzS-0003hQ-2E;
	Wed, 16 Sep 2026 16:52:02 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy05.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <klaus.kusche@computerix.info>)
	id 1x6qzQ-00087I-2L;
	Wed, 16 Sep 2026 16:52:01 +0200
Message-ID: <8aea0f25-0317-42ac-b59f-1a008c6eb106@computerix.info>
Date: Wed, 16 Sep 2026 16:52:00 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Klaus Kusche <klaus.kusche@computerix.info>
Subject: Re: Cache-aware scheduling does not work well with amd big/little
 cores
To: Chen Yu <yu.c.chen@intel.com>
Cc: Tim Chen <tim.c.chen@linux.intel.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
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
Content-Language: en-US
In-Reply-To: <aqfy8PjSUOYI-_Ju@chenyu-dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28125/Wed Sep 16 08:24:23 2026)


I don't know what your last patch does (does it dynamically disable 
cache aware scheduling on big/little CPU's?),
but it makes my two build tests running at almost the same speed
on a kernel with cache aware scheduling
compared to a kernel without cache aware scheduling, 
which means it is rougly 2 % faster 
than earlier cache aware scheduling kernels.

Just by looking at the core bar graph,
I also didn't see any obviously misplaced processes.

Klaus Kusche

On 14/09/2026 15:13, Chen Yu wrote:
> On Mon, Sep 14, 2026 at 12:27:53PM +0200, Klaus Kusche wrote:
>>
>> I did some very quick tests.
>>
>> 1.) /sys/kernel/sched/debug/domains/* does not exist on my system,
>> not even with debug_fs on.
>>
>> /sys/kernel/debug/x86/sched_itmt_enabled is "Y",
>> /sys/kernel/debug/x86/sched_core_priority looks good
>> (big cores have values almost twice as high as small cores)
>>
>> 2.) The situation with 7.2.5 which seems to include 
>> https://lore.kernel.org/lkml/20260825174112.2580942-1-tim.c.chen@linux.intel.com/
>> is almost unchanged: Without cache aware scheduling, 
>> my build jobs run faster (wallclock time):
>> Just 6:16 compared to 6:19 for my kernel build with full LTO,
>> but 4:50 compared to 5:20 (???) for my python uv build
>> (the python uv build seems to be a very interesting test case?)
>>
>> However, with cache sched enabled, in spite of the longer 
>> wallclock time, cpu seconds are sometimes a little bit lower.
>>
>> 3.) https://lore.kernel.org/lkml/20260810033742.1688718-1-yu.c.chen@intel.com/
> 
> This patch inhibits ASYM_PACKING and favors Cache-Aware-Scheduling,
> which is the opposite of what your platform expects.
> 
>> seems to make things much worse:
>> Kernel builds had the LTO step and the CC compressed step
>> placed on little cores for significant amounts of time,
>> resulting in total build times above 8 minutes.
>> Same impression by watching the bar graph for individual cores
>> for the uv build.
>>
> 
> After a second thought, I wonder if we should disable Cache-Aware
> Scheduling if ASYM_PACKING is enabled, because the latter would
> prefer a higher priority CPU rather than just choosing a random
> L3 to aggregate the threads. Would the following patch work
> for you? (just compile tested, as I do not have a multi-LLC hybrid
> AMD platform for testing) Thanks.
> 
> diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
> index 0248227d983a..07bc8a302574 100644
> --- a/kernel/sched/topology.c
> +++ b/kernel/sched/topology.c
> @@ -684,6 +684,7 @@ DEFINE_PER_CPU(struct sched_domain __rcu *, sd_asym_cpucapacity);
>  
>  DEFINE_STATIC_KEY_FALSE(sched_asym_cpucapacity);
>  DEFINE_STATIC_KEY_FALSE(sched_cluster_active);
> +DEFINE_STATIC_KEY_FALSE(sched_asym_packing_active);
>  
>  static void update_top_cache_domain(int cpu)
>  {
> @@ -957,6 +958,11 @@ static void _sched_cache_active_set(void)
>  		return;
>  	}
>  
> +	if (static_branch_unlikely(&sched_asym_packing_active)) {
> +		static_branch_disable_cpuslocked(&sched_cache_active);
> +		return;
> +	}
> +
>  	/*
>  	 * user wants it or not ?
>  	 * TBD: read before writing the static key.
> @@ -3085,6 +3091,7 @@ build_sched_domains(const struct cpumask *cpu_map, struct sched_domain_attr *att
>  	int i, ret = -ENOMEM;
>  	bool has_asym = false;
>  	bool has_cluster = false;
> +	bool has_asym_packing = false;
>  
>  	if (WARN_ON(cpumask_empty(cpu_map)))
>  		goto error;
> @@ -3204,6 +3211,9 @@ build_sched_domains(const struct cpumask *cpu_map, struct sched_domain_attr *att
>  
>  		if (lowest_flag_domain(i, SD_CLUSTER))
>  			has_cluster = true;
> +
> +		if (highest_flag_domain(i, SD_ASYM_PACKING))
> +			has_asym_packing = true;
>  	}
>  	rcu_read_unlock();
>  
> @@ -3213,6 +3223,9 @@ build_sched_domains(const struct cpumask *cpu_map, struct sched_domain_attr *att
>  	if (has_cluster)
>  		static_branch_inc_cpuslocked(&sched_cluster_active);
>  
> +	if (has_asym_packing)
> +		static_branch_inc_cpuslocked(&sched_asym_packing_active);
> +
>  	if (rq && sched_debug_verbose)
>  		pr_info("root domain span: %*pbl\n", cpumask_pr_args(cpu_map));
>  
> @@ -3318,6 +3331,9 @@ static void detach_destroy_domains(const struct cpumask *cpu_map)
>  	if (static_branch_unlikely(&sched_cluster_active))
>  		static_branch_dec_cpuslocked(&sched_cluster_active);
>  
> +	if (rcu_access_pointer(per_cpu(sd_asym_packing, cpu)))
> +		static_branch_dec_cpuslocked(&sched_asym_packing_active);
> +
>  	rcu_read_lock();
>  	for_each_cpu(i, cpu_map)
>  		cpu_attach_domain(NULL, &def_root_domain, i);

