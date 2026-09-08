Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7295505F3;
	Tue,  8 Sep 2026 21:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788904487; cv=none; b=T9btJdIFasWWALXBxzBwoOAz+u5RlJZhW8yj28GWIQg9USnlPqrxShgKoFL+45kV70YYW2IE/SuP5GXI2Lm4KdXuWg+G0EaNYM4bFT7ExQ1XGFwC8wWIHmI7dMA6vH9CYhfT4qb9UqwDpEKVwfu4MpfogoM0o6hZcGackWoLhdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788904487; c=relaxed/simple;
	bh=46D7DTped0o7Lg5mF3tCFCJ+EluhhFx6QATB5hfpgZ0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=T/pxjDYRlYFgPkAek9eKVbinRNJGia9amJlG1iyNE7fRtb6CMSdbCE7cCTUfpxEgFpj1VFhcG6nTnByTjZ8f5Nv5L9wEjv1FidsrovzO8ShQlMttf2rQKj11Tq+g0hDR2vvCOxpF0iYBDnLbGEflGhF9kvGxgNB08D1MjLhwcqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n4j2EOYS; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n4j2EOYS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788904485; x=1820440485;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=46D7DTped0o7Lg5mF3tCFCJ+EluhhFx6QATB5hfpgZ0=;
  b=n4j2EOYSkv8so6bJI60RNw1u0wzV5Y8kfdhdQhWz1u6hXyr5Pameq+3X
   HD1hWFCDbckYfWRMSeEY2ZJIfifelBKqYJWbZ/0R1yGXw/XtzNSeI2v1t
   fVjwEb/R1cIRaCBhJRCXP7KBhcgzJu/qeG/LIRFLSV2iLVnl2J5E1YJ7C
   ef2I9Natw/sW+mi1RF6oin4+ZeunfrLabNQeHT1ezOdohzYYfFoknm+pQ
   gFOnq7D0s9C8SwJUGOplTI6jtlbVqDlQbnmXePVpAfNHtsqcoLbkz8HdT
   ROAA3lOfbgSeFYalloZZY0CokmqrCl5gR6GDUS9hinYrPI9mjrOx81227
   A==;
X-CSE-ConnectionGUID: KiKFFUncQymNIpUAJyx1xw==
X-CSE-MsgGUID: 8RsVIup2SACD9AWpiBQxPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89361945"
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; 
   d="scan'208";a="89361945"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 14:54:44 -0700
X-CSE-ConnectionGUID: +4Z1+9LCR8mmUnyAn3HkAQ==
X-CSE-MsgGUID: D25G1V3rQTOEJItnhnbDuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; 
   d="scan'208";a="274658137"
Received: from unknown (HELO [10.241.243.185]) ([10.241.243.185])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 14:54:44 -0700
Message-ID: <3cb5cbdb227bee0b822f1550e10659faadd77a3d.camel@linux.intel.com>
Subject: Re: Cache-aware scheduling does not work well with amd big/little
 cores
From: Tim Chen <tim.c.chen@linux.intel.com>
To: Klaus Kusche <klaus.kusche@computerix.info>, "Chen, Yu C"
	 <yu.c.chen@intel.com>, Mario Limonciello <mario.limonciello@amd.com>
Cc: "Badole, Vishal" <Vishal.Badole@amd.com>, Peter Zijlstra
	 <peterz@infradead.org>, linux-kernel@vger.kernel.org, "maintainer:X86
 ARCHITECTURE (32-BIT AND 64-BIT)"
	 <x86@kernel.org>, platform-driver-x86@vger.kernel.org, K Prateek Nayak
	 <KPrateek.Nayak@amd.com>, ricardo.neri@intel.com
Date: Tue, 08 Sep 2026 14:54:43 -0700
In-Reply-To: <14630984-9287-4454-b52f-3a1e526e1fdf@computerix.info>
References: <2180ea5a-eb28-4152-8d4d-cd00b0c24b2e@computerix.info>
	 <8064e1d8-b51c-48e5-a312-8c31581991f5@amd.com>
	 <b475039b-defe-46e7-ab85-46e3196da667@intel.com>
	 <369d0bbb-db7a-4f86-bee2-332d5295c452@computerix.info>
	 <406a5c407bbe60cafc24f715e089f5552a0791f9.camel@linux.intel.com>
	 <14630984-9287-4454-b52f-3a1e526e1fdf@computerix.info>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.1 (3.58.1-1.fc43) 
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sat, 2026-09-05 at 17:40 +0200, Klaus Kusche wrote:
> Hello,
>=20
> On 31/08/2026 19:29, Tim Chen wrote:
> > On Mon, 2026-08-31 at 13:24 +0200, Klaus Kusche wrote:
> > > Hello,
> > >=20
> > > both patches in combination seem to have the desired effect.
> > >=20
> > > But I just look at a bar graph showing the current load
> > > of each core.=20
> > > The graph suggests that long-running CPU-intensive processes=20
> > > migrate to fast cores when fast cores become available.
> > > And I have the impression that LTO compilations
> > > finish significantly faster now.
> > >=20
> > > I don't have exact numbers or benchmarks.
> >=20
> > Thanks for testing the fix.
> >=20
> > If you just apply https://lore.kernel.org/lkml/20260825174112.2580942-1=
-tim.c.chen@linux.intel.com/,
> > with default aggr_tolerance, what numbers do you see?
> >=20
> > That will be helpful for further tuning.  Thanks.
> >=20
> > Tim=20
>=20
> I did some quick testing (no perfect benchmark environment,
> just checking runtime and CPU consumption with "time").
>=20
> I timed a kernel build (-j 24 and full lto, my own .config)
> and an application build (also with a lot of parallelism)
> with three different kernels:
>=20
> a) Cache aware scheduling completely configured off
>=20
> b) Cache aware scheduling turned on, but without patch
>=20
> c) Cache aware scheduling turned on, with patch
>=20
> Big/little scheduling was always on,=20
> Mario's patch was always applied
> (without it, results are significantly worse,

Sorry, I am a bit confused.  You mentioned later the result for (b)
and (c) are about the same with or without the patch
exposing debugfs (commit c1e7fe5e75ed11fa85368e5a186472afd3858f3a
Mario mentioned in another mail). =20
But here you say the result is much worse without Mario's patch.
Is Mario's patch the one above or some other patch?=20

> because I use kernels without debugfs,
> so big/little scheduling is off without the patch).
>=20
> Results:
>=20
> There is no significant difference between b) and c)=20
> (<=3D 1 % wallclock time)

Yes, I don't expect difference between (b) and (c).  My
understanding is the patch in question is to only
expose the default cache aware parameters via debugfs
but don't acutally change them.

> Sometimes b) is better, sometimes c) is better,
> I'd say the differences are below the accuracy of my tests.
>=20
> But a) was reproducibly better than b) and c)
> w.r.t. wallclock time: 2-2.6 %
> It was also very slightly better w.r.t. total kernel CPU seconds.
> The results w.r.t. total usermode CPU seconds varied too much.
> (I always ran the application build twice,
> and for all a), b) and c), the second run consumed
> significantly more usermode CPU seconds,
> but took a little less wallclock time - I don't know why).

Will have to look around to see if we have some similar CPUs
as HX-370.  My understanding is that the 4 big cores are in
one L3 and the 8 small cores are in another L3.

BTW, we have also found two issues with the active load balance
paths for CAS that need fixes.  You may want to add those patches
and see if they are helpful to improve things.

Active load balance fixes:
https://lore.kernel.org/lkml/20260903020656.3793626-1-wanglu.priv@gmail.com=
/
https://lore.kernel.org/lkml/2b0a35122ee615c6fa51076e5d79330e633755ac.camel=
@linux.intel.com/


Tim

>=20
> So in short, at least for the two build benchmarks I made,
> and with respect to the wallclock time they took, AMD Ryzen HX 370=20
> does slightly better completely *without* cache aware scheduling,
> but cache aware scheduling looses less than 3 %,
> both with and without the patch.
>=20
> The big difference I observed when 7.2 came out=20
> was perhaps due to the fact
> that the older version of Mario's patch I had
> did not apply correctly or did not work as expected with 7.2.
>=20
> Greetings
