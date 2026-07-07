Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769BE3F789C
	for <platform-driver-x86@vger.kernel.org>; Tue,  7 Jul 2026 11:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783424213; cv=none; b=Mq8lr7K9b5UjptQPhBriXElEYuUUdFvcjKYDR8nM3ecGIhRkMCkOR9KGDDnG00Mh11ZoTq7jGxH1SUBTZd9+Td4Au0eBY11IE9gYiQHYL9e/LaEY46Ia9HcJthRZFH1zULEL1cxe7eMxy7H0XzSpqVyDoOjpem3jd2dQ38hbFEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783424213; c=relaxed/simple;
	bh=wDExSE2bcKaGQerGvyXHljOjP5OzC8DdCyd5Skqqvl4=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=MdtpNfl+vet0V2Px2awt5pBzEYzy+gZkrMS5ZSrWeWN/cSPk8tCsPhoCrcH0Z4Q8qjFyISOQquZYO9a9365gzIWnY6BrMBtYXI7XOg9+EwscVTR61vrWLNDMsUi9PnE1c0Uvx4oVH0/4ia0rJa1n8FUQKcXOyBQP1+3hix+rEgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QwXvPoMy; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QwXvPoMy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783424211; x=1814960211;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=wDExSE2bcKaGQerGvyXHljOjP5OzC8DdCyd5Skqqvl4=;
  b=QwXvPoMyxosTLMPSienB8csCg4faWpuHVNcER9gdB/VEQ+hZDHEx+Qrp
   LsCVJDrFyOFOLdDQgKTt/ofU7Ijlfv/v6CxAMS3sExSAtzu0zNi8NJkG0
   VYggA4qji6XILKdmQzadB4zx5s9HrhIHjqiJhFiXAsAeu2uQNLhz0A0JW
   aEcEVrIr2+FVROi9T9QP4BXDLguvJ1Pq0WlvJ6p5kJz3Gew8ze0Bejda0
   Yzfm0mTbadifFwoqxxtUYLcLrzgMfT05XOw3NGOglLzZlb31stnOd2C8Z
   MmuoLOJph3cVn/JfhtH7a/GcBNctk+D+ctqA5ciqyfo9lSj68KXmEuhAu
   w==;
X-CSE-ConnectionGUID: VRaFCs51Q4q1oskB3mKMCg==
X-CSE-MsgGUID: gnyhd8NATYm922B+0F4pUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11839"; a="83940321"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="83940321"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 04:36:50 -0700
X-CSE-ConnectionGUID: O/zoStd+QHylPOs3OSOZYw==
X-CSE-MsgGUID: Hn2rgIkmQOq2zxzsOoGAGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="278344319"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.226])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 04:36:49 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 7 Jul 2026 14:36:46 +0300 (EEST)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hansg@kernel.org>, Sanket.Goswami@amd.com, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH] platform/x86: amd-pmc: Add IP block table for AMD 1Ah
 M80H SoC
In-Reply-To: <0d48eac8-fda9-4bb8-91d1-801cf6a2797d@amd.com>
Message-ID: <2b2d468e-ada8-c1c4-5919-f75af55614b7@linux.intel.com>
References: <20260707054048.69152-1-Shyam-sundar.S-k@amd.com> <c07417fd-ddd9-e171-de9b-75bdfc66c5b3@linux.intel.com> <0d48eac8-fda9-4bb8-91d1-801cf6a2797d@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-288616857-1783424206=:1152"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-288616857-1783424206=:1152
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 7 Jul 2026, Shyam Sundar S K wrote:
> On 7/7/2026 13:16, Ilpo J=C3=A4rvinen wrote:
> > On Tue, 7 Jul 2026, Shyam Sundar S K wrote:
> >=20
> >> AMD Family 1Ah, Model 80h has different IP subsystem layout compared t=
o
> >> previous AMD SoCs. The existing soc15_ip_blk[] does not match the late=
st
> >> firmware's DRAM export structure for S0i3 subsystem accounting.
> >=20
> > You say "the latest firmware" so what about the cases that have older F=
W?
>=20
> Good catch =E2=80=94 "latest firmware" was misleading..
>=20
> This isn't a FW-version thing, it's tied to the CPU/SoC, and in fact
> the original M80H commit(043af31c8d30) had this wrong.

Okay, I was actually expecting it might be the case.

One of our platform recently needed similar correction (and IIRC was=20
first submitted with similar explanation as your here :-)). After I=20
inquired about it that was because the FW got updated after the kernel=20
support for it was added but before the launch (which was the other=20
possible explanation I was expecting).

It's important to have this kind of details correct in changelog because=20
normal kernel devs don't have the same internal knowledge.

> Let me explain..
>=20
> PMFW (Power Management Firmware, formerly SMU) exports the power
> status of each IP block in the SoC =E2=80=94 the subsystem accounting. It
> writes this into DRAM, the PMC driver reads it back, and we expose it
> via debugfs, which is very useful for inspecting S0i3/s2idle residency
> and debugging s2idle failures.
>=20
> Each IP block is bit-mapped, and the set of blocks is specific to a
> SoC generation:
> soc15_ip_blk[]    - ~22 IP blocks
> soc15_ip_blk_v2[] - 25 IP blocks
> soc15_ip_blk_v3[] - 19 IP blocks
>=20
> As the SoC evolves, the set of blocks that factor into low-power
> transitions changes (some added, some dropped). For Family 1Ah / Model
> 80h, PMFW only accounts for the 19 blocks that physically exist in
> that SoC. So the layout is fixed per SoC =E2=80=94 there is no older M80H=
 FW
> that reports a different layout; PMFW on this part always uses this
> ordering.
>=20
> The problem is that commit 043af31c8d30 wired amd_1ah_m80_cpu_info to
> soc15_ip_blk (the oldest table), so M80H has been reporting incorrect
> subsystem accounting since it landed. This commit adds
> soc15_ip_blk_v3[] with the correct ordering and points M80H at it.
>=20
> Shall I respin v2 with this rationale in the commit message?
>=20
> and add?
>=20
> Fixes: 043af31c8d30 ("platform/x86/amd/pmc: Add PMC driver support for
> AMD 1Ah M80H SoC")
>
> (note that this is not in stable tree yet)

Yes, please add the Fixes tag and correct the changelog. My intention is=20
to route this through the fixes branch.

You may also want think if you can somehow ensure similar problem would=20
be caught during testing of a next arch patch (but I understand it may be=
=20
hard for a human to pick up anomalies out of all noise).

--=20
 i.

--8323328-288616857-1783424206=:1152--
