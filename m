Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B163A2E25;
	Fri, 25 Sep 2026 19:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790363964; cv=none; b=atGvIX5rhzQIWFYVhe1Xi6QWIpjERhaCO4K/wb2/a2jq7+GV8Q8r9yLKC9I2cCZiFVW0tDtTkzHYXvULOZ/v9geCt88HD8ZwRxjLIl9kU9hLAFg/20uE4AprZ9E33wiSgwoN/oVpugFnYMstK7A6SbQlckRv6M+MXZwg62odi80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790363964; c=relaxed/simple;
	bh=Nrl2jbgDd2Fjl4JX6Onf3vZNqukynYrCQh5NqmfMLe4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Xw8YIjOt1cgHpY6OTy57Q1urpIdQqbuyH1rBeEQjXZQF5tOX9Bt+8COfQcxQJr8YYbIpMqPvM6AGq2mIwLksJVQykJCxHmoucV3SaEODJlaWl4Iy6tZaFaTSzCGsJtx08vchLlSGq1fFeyHbvyinUODrH+xkKS4qwKJM9pqphXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZB0h+NHx; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZB0h+NHx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790363962; x=1821899962;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=Nrl2jbgDd2Fjl4JX6Onf3vZNqukynYrCQh5NqmfMLe4=;
  b=ZB0h+NHx9qdX3d+n1hbjCF5CeMnL/4AP50CuNr0vVsv1DYyPjQcfHLRn
   d6rVJICpvhhIpTxbM4Yakev83MHGlRWzRHiDaOmj9pnioI68KxtrTrZmH
   Qt5IwItvA5QxBlLDiMKxp2cHbMcs82e89l1pw++stICTihZqfrAVBGww9
   goitlaTmA9nif/qZCW7e8r/IIPty+W5ewK+/Cl24z3HhRfXHTMgRsjF90
   C4l2lxpB82cFE2D75dTd4MjuH7mgok2OUFlfDrTIiME3qY0od/eBHHKao
   x5d3dP/ycFTuR6TDaPSd8/OZHkwR/czFcekw8SWTrXlFwZkYhf53BLAS0
   g==;
X-CSE-ConnectionGUID: R9oJRN4MRfKzMS95qjyREg==
X-CSE-MsgGUID: o5kyCUSTSAWFmoZkT/KuiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="94972758"
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="94972758"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 12:19:21 -0700
X-CSE-ConnectionGUID: 2yUkCVCmTum+ZlwkjmhonQ==
X-CSE-MsgGUID: Hk8Hdq/vQaKyCpj7ASxW3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="274570595"
Received: from schen9-mobl4.amr.corp.intel.com (HELO [10.125.110.255]) ([10.125.110.255])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 12:19:21 -0700
Message-ID: <c69168ffeeb1d6ea4399b1a9ed6da7b24ac69bb8.camel@linux.intel.com>
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
Date: Fri, 25 Sep 2026 12:19:19 -0700
In-Reply-To: <e2c87de0-31f7-4ed0-b80e-7f9aa7d0e511@computerix.info>
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.1 (3.58.1-1.fc43) 
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2026-09-25 at 10:59 +0200, Klaus Kusche wrote:
> On 24/09/2026 01:47, Tim Chen wrote:
> > Hi Klaus,
> >=20
> > I wonder if you can try this alternate patch to Chen Yu's.
> > This patch does not require turning off cache aware scheduling
> > entirely as in the previous patch when using the asym packing
> > mechanism to prioritize big core.
>=20
> Hello,
>=20
> 1.) This patch applies with quite some fuzz to 7.2.7 (for example,=20
> the context of the -10847,6+10849,10 hunk is obviously different),=20
> and the resulting fair.c fails to compile:
> call to undeclared function 'sched_use_asym_prio'
> conflicting types for 'sched_use_asym_prio'
> (sched_use_asym_prio is called before being declared)
> use of undeclared identifier 'env'


Thanks a lot for applying the patch and reporting back so quickly.

You are right, and the fuzz is the cause of the build failure. I
generated the original patch on top of Peter's sched/urgent tree,
where fair.c is laid out differently
from 7.2.7. The interface to can_migrate_llc() has been
modified to use "env" in Peter's tree.

I rebased the change onto v7.2.7 for you to test. It now applies cleanly wi=
th
git am and builds. Two things differ on v7.2.7, so this is a real
backport rather than the same diff:

  - can_migrate_llc_task() takes (src_cpu, dst_cpu, p) here instead of
    an lb_env, so I pass the sched_domain in explicitly and update its
    one caller.
  - llc_balance() has no SD_ASYM_CPUCAPACITY misfit early-out on v7.2.7,
    so the new asym check is placed after the SD_SHARE_LLC check.

You can either test with the previous patch on sched/urgent
(https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/log/?h=3D=
sched/urgent)
or use the backported patch attached to the end of the mail.

>=20
> 2.) As far as I know, "inline" does not look ahead in C.
> So I think the call to sched_asym you added in hunk -10847,6+10849,10
> will result in a real call, not in inline code
> (at least without optimization), because the code of sched_asym
> is not yet known at the position of that call.


Good point to raise, but that part is not the problem. Whether the call
is inlined is only an optimization and should not affect whether the code
compiles: a static inline function that is forward-declared and defined
later in the same file is valid C.=C2=A0I checked my disassembled code
and find that sched_asym() in indeed inlined.

There are other function in fair.c already with similar declaration
for cfs_rq_max_slice(), account_mm_sched(), and others.

Could you give it a try on your system?

Thanks again for testing on your hardware.

Tim

---
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

[ Backport to v7.2.7: can_migrate_llc_task() takes (src_cpu, dst_cpu, p)
  here rather than lb_env, so pass the sched_domain in explicitly. Drop
  context from task_misfits_asym_cpu() and the SD_ASYM_CPUCAPACITY
  misfit check in llc_balance(), which are not present in v7.2.7. ]

---
 kernel/sched/fair.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index bb8a5f358ee19..2dae60ad09276 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -10575,11 +10575,14 @@ static enum llc_mig can_migrate_llc(int src_cpu, =
int dst_cpu,
 	return mig_llc;
 }
=20
+static inline bool sched_asym(struct sched_domain *sd, int dst_cpu, int sr=
c_cpu);
+
 /*
  * Check if task p can migrate from source LLC to
  * destination LLC in terms of cache aware load balance.
  */
-static enum llc_mig can_migrate_llc_task(int src_cpu, int dst_cpu,
+static enum llc_mig can_migrate_llc_task(struct sched_domain *sd,
+					 int src_cpu, int dst_cpu,
 					 struct task_struct *p)
 {
 	struct mm_struct *mm;
@@ -10594,6 +10597,10 @@ static enum llc_mig can_migrate_llc_task(int src_c=
pu, int dst_cpu,
 	if (cpu < 0 || cpus_share_cache(src_cpu, dst_cpu))
 		return mig_unrestricted;
=20
+	/* Prioritize asym packing over cache awareness */
+	if (sched_asym(sd, dst_cpu, src_cpu))
+		return mig_unrestricted;
+
 	/* skip cache aware load balance for too many threads */
 	if (invalid_llc_nr(mm, p, dst_cpu) ||
 	    exceed_llc_capacity(mm, dst_cpu)) {
@@ -10689,7 +10696,7 @@ static bool migrate_degrades_llc(struct task_struct=
 *p, struct lb_env *env)
 	    READ_ONCE(p->preferred_llc) !=3D llc_id(env->dst_cpu))
 		return true;
=20
-	if (can_migrate_llc_task(env->src_cpu,
+	if (can_migrate_llc_task(env->sd, env->src_cpu,
 				 env->dst_cpu, p) !=3D mig_forbid)
 		return false;
=20
@@ -11753,6 +11760,15 @@ static inline bool llc_balance(struct lb_env *env,=
 struct sg_lb_stats *sgs,
 	if (env->sd->flags & SD_SHARE_LLC)
 		return false;
=20
+	/*
+	 * On asym packing domains, if the destination CPU
+	 * has higher priority than all CPUs in the source group,
+	 * prioritize asym packing.
+	 */
+	if ((env->sd->flags & SD_ASYM_PACKING) &&
+	    sgs->group_asym_packing)
+		return false;
+
 	/*
 	 * Skip cache aware tagging if nr_balanced_failed is sufficiently high.
 	 * Threshold of cache_nice_tries is set to 1 higher than nr_balance_faile=
d
@@ -13140,12 +13156,12 @@ static int need_active_balance(struct lb_env *env=
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

