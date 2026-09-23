Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D203262FD0;
	Wed, 23 Sep 2026 23:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790207283; cv=none; b=iTeKFP2jc6ALWnVo8ljKJ+7zcWMH7WiI4tIMFO6whl9I2qqo6UxrwNpDm8tzlLijhYu7dHb5xO+ujAA+nUVK0Pu7L8+KpxMFny9m88ZR7hqTlL+56pqUzgphZ5GsyduxVhDbVp8QUUY2Yu9bwzy72rfPVATkif+mNNnUioMH4gY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790207283; c=relaxed/simple;
	bh=1onDSHP0vVSRs6NrMNhFpftgs7GtwucogdW+kIdz93U=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jllZFbrOWSZ9MJUsFj4eGz73w9rcmCzIF84n1fRt+j7eMkJAq1NdfrHyb1rhHlZwtO08suDj+EEFJXYWZghDfDCHsn1R70+Rtp3rA7zLKZUqMHjoyuMj5bcNnDl0xN+kqN8fD5UlkTd0N3KQyUFV0J4au/MdCElO4H/LUtOK64A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SjvMuZrG; arc=none smtp.client-ip=192.198.163.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SjvMuZrG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790207282; x=1821743282;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=1onDSHP0vVSRs6NrMNhFpftgs7GtwucogdW+kIdz93U=;
  b=SjvMuZrGh18vJARe4AuRlt/+C1RvWJFDctJ258y0/4JfcO1NrmkuHOKK
   1ohKKyqTjl/i2+0xMaOfPVGjCDXKbuh2ZCkP4Auy38iURB13grtRztU0i
   XNp4nrLJwv0tdeOYtPUo2Vu2ZdBgcEYT4363WZH7O0EgeE9ApEE2IhSr1
   mpU1B6k+evnwp5AF93OL5gVlZI3vLfV8ygVTXaZ10RLjp+Kz5LBDVe1w7
   KLFPgDFMof7bwW12OtpXkfTMJfgF1mzadzVgiOe7lS7jwk/SjYKl9ejS8
   Ct2jiKTTMth1Oss6Tk8VOBaTp5Rg8VUkqXsAg8pRsgecbJnPlNDMSoy73
   g==;
X-CSE-ConnectionGUID: et5FPTLWTmKwBLHymloEgw==
X-CSE-MsgGUID: lkaE19jxSnWZfZujKZnw5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="1470384"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="1470384"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 16:48:01 -0700
X-CSE-ConnectionGUID: zqabdcnYQRCvp1/BPFdCaA==
X-CSE-MsgGUID: OoWwUf6lSLq+gjoBz2+2dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="274012370"
Received: from schen9-mobl4.amr.corp.intel.com (HELO [10.125.110.121]) ([10.125.110.121])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 16:47:59 -0700
Message-ID: <7b83cf0cd1704b552978af88d7de9c57970c23a1.camel@linux.intel.com>
Subject: Re: Cache-aware scheduling does not work well with amd big/little
 cores
From: Tim Chen <tim.c.chen@linux.intel.com>
To: Klaus Kusche <klaus.kusche@computerix.info>, Chen Yu
 <yu.c.chen@intel.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>, "Badole, Vishal"	
 <Vishal.Badole@amd.com>, Peter Zijlstra <peterz@infradead.org>, 
	linux-kernel@vger.kernel.org, "maintainer:X86 ARCHITECTURE (32-BIT AND
 64-BIT)" <x86@kernel.org>, platform-driver-x86@vger.kernel.org, K Prateek
 Nayak	 <KPrateek.Nayak@amd.com>, ricardo.neri@intel.com
Date: Wed, 23 Sep 2026 16:47:58 -0700
In-Reply-To: <8aea0f25-0317-42ac-b59f-1a008c6eb106@computerix.info>
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.1 (3.58.1-1.fc43) 
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2026-09-16 at 16:52 +0200, Klaus Kusche wrote:
> I don't know what your last patch does (does it dynamically disable=20
> cache aware scheduling on big/little CPU's?),
> but it makes my two build tests running at almost the same speed
> on a kernel with cache aware scheduling
> compared to a kernel without cache aware scheduling,=20
> which means it is rougly 2 % faster=20
> than earlier cache aware scheduling kernels.
>=20
> Just by looking at the core bar graph,
> I also didn't see any obviously misplaced processes.

Hi Klaus,

I wonder if you can try this alternate patch to Chen Yu's.
This patch does not require turning off cache aware scheduling
entirely as in the previous patch when using the asym packing
mechanism to prioritize big core.

Hopefully it will have a similar effect to restore performance
on your tests.

Thanks.

Tim

From 7bad1c19317e08d398fa36d66940867110bdd037 Mon Sep 17 00:00:00 2001
From: Tim Chen <tim.c.chen@linux.intel.com>
Date: Wed, 23 Sep 2026 14:28:40 -0700
Subject: [PATCH] sched/cache: Honor asym packing over cache aware schedulin=
g
 on hybrid system

A regression was reported on an AMD Ryzen AI HX 370 running a cache
intensive Clang full-LTO link. The little cores run at a much lower
frequency (3.3 GHz vs 5.1 GHz) and have only half of the L3 cache
(8 MB vs 16 MB), so pinning such a task to the little-core LLC hurts
twice, and full-LTO builds slow down dramatically compared to
pre-cache-aware-scheduling kernels.

Asym packing and cache aware scheduling express conflicting placement
strategy. Asym packing wants a task to run on the highest priority
CPU, whereas CAS wants to co-locate the tasks of a process on one LLC
regardless of the priority of CPUs in that LLC. When asym packing
is turned on, it is trying to migrate task to an empty core that has
higher priority than source cpu, let asym packing win.

Reported-by: Klaus Kusche <klaus.kusche@computerix.info>
Closes: https://lore.kernel.org/lkml/2180ea5a-eb28-4152-8d4d-cd00b0c24b2e@c=
omputerix.info/
Signed-off-by: Tim Chen <tim.c.chen@linux.intel.com>
---
 kernel/sched/fair.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index f265de8721db..89eed4fbc4e2 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -10823,6 +10823,8 @@ static inline bool task_misfits_asym_cpu(struct lb_=
env *env, struct task_struct
 	return false;
 }
=20
+static inline bool sched_asym(struct sched_domain *sd, int dst_cpu, int sr=
c_cpu);
+
 /*
  * Check if task p can migrate from source LLC to
  * destination LLC in terms of cache aware load balance.
@@ -10847,6 +10849,10 @@ static enum llc_mig can_migrate_llc_task(struct lb=
_env *env,
 	if (cpu < 0 || cpus_share_cache(src_cpu, dst_cpu))
 		return mig_unrestricted;
=20
+	/* Prioritize asym packing over cache awareness */
+	if (sched_asym(env->sd, dst_cpu, src_cpu))
+		return mig_unrestricted;
+
 	/* skip cache aware load balance for too many threads */
 	if (invalid_llc_nr(grp, p, dst_cpu) ||
 	    exceed_llc_capacity(grp, dst_cpu)) {
@@ -12043,6 +12049,15 @@ static inline bool llc_balance(struct lb_env *env,=
 struct sg_lb_stats *sgs,
 	    sgs->group_misfit_task_load)
 		return false;
=20
+	/*
+	 * On asym packing domains, if the destination CPU
+	 * has higher priority than all CPUs in the source group,
+	 * prioritize asym packing.
+	 */=20
+	if ((env->sd->flags & SD_ASYM_PACKING) &&
+	    sgs->group_asym_packing)
+		return false;
+
 	/*
 	 * Skip cache aware tagging if nr_balanced_failed is sufficiently high.
 	 * Threshold of cache_nice_tries is set to 1 higher than nr_balance_faile=
d
@@ -13458,12 +13473,12 @@ static int need_active_balance(struct lb_env *env=
)
 {
 	struct sched_domain *sd =3D env->sd;
=20
-	if (alb_break_llc(env))
-		return 0;
-
 	if (asym_active_balance(env))
 		return 1;
=20
+	if (alb_break_llc(env))
+		return 0;
+
 	if (imbalanced_active_balance(env))
 		return 1;
=20
--=20
2.32.0


