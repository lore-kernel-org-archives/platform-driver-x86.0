Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6643A9631;
	Wed,  9 Sep 2026 19:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788983478; cv=none; b=I9SjBTqxIW5D15iRPPruf913Qb6tCO/q5fCs1huVZkCIZMSBVoKVDJ+UlqwiqjljROwP4e1D8rJ9t+evmmCNtE1H0p6PwWtgdG+aiwevhu/HsZVCRN2lMtmCo0/uJx27B1jq0N6r1DZ5nMrAV5GAHEKNjoWLs4kkmOvJgPqyh0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788983478; c=relaxed/simple;
	bh=homQbmQn24qg7TyHHN5rO9iXdotv3LdhEqkmaUqjw4o=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JKSy9dndCpXjVusGJg1Lh8RfE61zOI7+ZzqcOtRxguB48ciL9f3o1797wYLt+/UPYlBPeKz7kXgB/mtJJ9E/jTs0A+t8xDKC4XJmFreKSZgw5OWNcJOa1/e+8slMp8AKv5BRmPzfrxi02hkDXV5iiw/biWDn/bZ0gwxlVbo73R0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y4/HwloV; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y4/HwloV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788983475; x=1820519475;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=homQbmQn24qg7TyHHN5rO9iXdotv3LdhEqkmaUqjw4o=;
  b=Y4/HwloV1+sGEmxMy607QXR2Pr5jeP5EgwheNTkO+aiAWeKmuLvH3W1U
   CNl7DQCWCvEdhPyHdmGE6Pe57LBZjd3Nx9v2H1q8VlnxcRBbNbQ9qu1ip
   eBLPY9zPCw22PcsIQ5lSNgQrFzvLOn0WW1+CldMbM6sCmmsVLzDHq6i87
   i0FEMcx6AmjmoZGAD9pGz1geZ6+uwc1xwSko887dAFymBz1ZuBqaH0JJ8
   rlKHib1zrVwxc0ZpTN8TzwuDhISe4s2md2y69nvCZSg8qgVzFIgJTkKsZ
   9TikHh/Zp0+lwoyQd0ZiYQhefg9t7dI/sDSNZNGeUWtvalN97J+c28bv2
   A==;
X-CSE-ConnectionGUID: EbhKuanCQkGthDdGaYz5eQ==
X-CSE-MsgGUID: z7BPzJpvQxaezQVapydMMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="91939684"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="91939684"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 12:51:15 -0700
X-CSE-ConnectionGUID: zStJ0qbPTlmxnywbbM278g==
X-CSE-MsgGUID: y/KmtlouShC2ofCk+6Xr9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="275552052"
Received: from unknown (HELO [10.241.243.185]) ([10.241.243.185])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 12:51:16 -0700
Message-ID: <4da55124e32dd0587a3516c8f5ed512bffbbb42e.camel@linux.intel.com>
Subject: Re: Cache-aware scheduling does not work well with amd big/little
 cores
From: Tim Chen <tim.c.chen@linux.intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>, Klaus Kusche
	 <klaus.kusche@computerix.info>, "Chen, Yu C" <yu.c.chen@intel.com>
Cc: "Badole, Vishal" <Vishal.Badole@amd.com>, Peter Zijlstra
	 <peterz@infradead.org>, linux-kernel@vger.kernel.org, "maintainer:X86
 ARCHITECTURE (32-BIT AND 64-BIT)"
	 <x86@kernel.org>, platform-driver-x86@vger.kernel.org, K Prateek Nayak
	 <KPrateek.Nayak@amd.com>, ricardo.neri@intel.com
Date: Wed, 09 Sep 2026 12:51:14 -0700
In-Reply-To: <76dba935-1052-4fa9-a70c-16cecdfd12c8@amd.com>
References: <2180ea5a-eb28-4152-8d4d-cd00b0c24b2e@computerix.info>
	 <8064e1d8-b51c-48e5-a312-8c31581991f5@amd.com>
	 <b475039b-defe-46e7-ab85-46e3196da667@intel.com>
	 <369d0bbb-db7a-4f86-bee2-332d5295c452@computerix.info>
	 <406a5c407bbe60cafc24f715e089f5552a0791f9.camel@linux.intel.com>
	 <14630984-9287-4454-b52f-3a1e526e1fdf@computerix.info>
	 <3cb5cbdb227bee0b822f1550e10659faadd77a3d.camel@linux.intel.com>
	 <e17ef3af-c1cd-4360-ba4b-9900ccc36ef6@computerix.info>
	 <76dba935-1052-4fa9-a70c-16cecdfd12c8@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.1 (3.58.1-1.fc43) 
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2026-09-09 at 08:19 -0500, Mario Limonciello wrote:
>=20
> On 9/9/26 03:59, Klaus Kusche wrote:
> >=20
> > Hello,
> >=20
> > On 08/09/2026 23:54, Tim Chen wrote:
> > > > I did some quick testing (no perfect benchmark environment,
> > > > just checking runtime and CPU consumption with "time").
> > > >=20
> > > > I timed a kernel build (-j 24 and full lto, my own .config)
> > > > and an application build (also with a lot of parallelism)
> > > > with three different kernels:
> > > >=20
> > > > a) Cache aware scheduling completely configured off
> > > >=20
> > > > b) Cache aware scheduling turned on, but without patch
> > > >=20
> > > > c) Cache aware scheduling turned on, with patch
> > > >=20
> > > > Big/little scheduling was always on,
> > > > Mario's patch was always applied
> > > > (without it, results are significantly worse,
> > >=20
> > > Sorry, I am a bit confused.  You mentioned later the result for (b)
> > > and (c) are about the same with or without the patch
> > > exposing debugfs (commit c1e7fe5e75ed11fa85368e5a186472afd3858f3a
> > > Mario mentioned in another mail).
> > > But here you say the result is much worse without Mario's patch.
> > > Is Mario's patch the one above or some other patch?
> >=20
> > The with/without patch in (b) and (c)
> > refers to the patch you sent on 31/08/2026
> > ( https://lore.kernel.org/lkml/20260825174112.2580942-1-tim.c.chen@linu=
x.intel.com/ ),
> > not to Mario's patch.
> >=20
>=20
> Just to clarify Mario's patch in this context refers to the fix to=20
> ITMT/debugfs fixes as Klaus doesn't nominally enable debugfs in Kconfig:
>=20
> eaece4849991d62fcd6f46637c55dcce00e25d70
>=20

Ricardo reminded me that AMD's hybrid CPU relies on SD_ASYM_PACKING instead
of SD_ASYM_CPUCAPACITY. So the patch I pointed to
(https://lore.kernel.org/lkml/20260825174112.2580942-1-tim.c.chen@linux.int=
el.com/)
only fixes the SD_ASYM_CPUCAPACITY case and would not have an effect on
your test system.

The fact that ITMT needs to be turned on to improve performance also point
in that direction.

There was a bug that Chen Yu fixes for ITMT compatability with cache aware =
scheduling.
It prevents a task from getting stuck in the wrong LLC in the ITMT case
(https://lore.kernel.org/lkml/20260810033742.1688718-1-yu.c.chen@intel.com/=
).
Klaus, Can you apply that with Mario's ITMT/debugfs patch to see if that
improves performance on your system?=20
=20
Tim

> > > > because I use kernels without debugfs,
> > > > so big/little scheduling is off without the patch).
> > > >=20
> > > > Results:
> > > >=20
> > > > There is no significant difference between b) and c)
> > > > (<=3D 1 % wallclock time)
> > >=20
> > > Yes, I don't expect difference between (b) and (c).  My
> > > understanding is the patch in question is to only
> > > expose the default cache aware parameters via debugfs
> > > but don't acutally change them.
> > >=20
> > > > Sometimes b) is better, sometimes c) is better,
> > > > I'd say the differences are below the accuracy of my tests.
> > > >=20
> > > > But a) was reproducibly better than b) and c)
> > > > w.r.t. wallclock time: 2-2.6 %
> > > > It was also very slightly better w.r.t. total kernel CPU seconds.
> > > > The results w.r.t. total usermode CPU seconds varied too much.
> > > > (I always ran the application build twice,
> > > > and for all a), b) and c), the second run consumed
> > > > significantly more usermode CPU seconds,
> > > > but took a little less wallclock time - I don't know why).
> > >=20
> > > Will have to look around to see if we have some similar CPUs
> > > as HX-370.  My understanding is that the 4 big cores are in
> > > one L3 and the 8 small cores are in another L3.
> >=20
> > Yes, as far as I know, it has 16 MB L3 cache for the 4 big cores
> > and 8 MB L3 cache for the 8 little cores.
> >=20
> > > BTW, we have also found two issues with the active load balance
> > > paths for CAS that need fixes.  You may want to add those patches
> > > and see if they are helpful to improve things.
> >=20
> > Most likely not within the next few days.
> > I'm still on holiday and quite busy:
> > Ars Electronica Festival in Linz.
> >=20
> > > Active load balance fixes:
> > > https://lore.kernel.org/lkml/20260903020656.3793626-1-wanglu.priv@gma=
il.com/
> > > https://lore.kernel.org/lkml/2b0a35122ee615c6fa51076e5d79330e633755ac=
.camel@linux.intel.com/
> >=20
>=20
