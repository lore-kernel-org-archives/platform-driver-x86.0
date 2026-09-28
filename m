Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFEBC4E36FF;
	Mon, 28 Sep 2026 17:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790616158; cv=none; b=c4bv1GvJSgao0SVo5tG4Bn5EdiBEALd15gVEFPJMYTveBxvf4tdl0yM+RUWMjOG+wRMcAMeCgF85ye912omrvw3C1m/1ArOMVsBhdN+TvKtsU+cdM5ef725vKIeVdKc4p5QJKekVl5i6cWDO4YuN/TXEBJ5i300IvtV7wfKC47k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790616158; c=relaxed/simple;
	bh=A5fPEYTyva1qa1CcS8vPQRNmGopYXG7G+HJVDpDWTXo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PgHLfDvmpiTi5OGQSE+vmh+K4pL0VGUiw9+lJj0zX45BAXMctVDucquG01tcdsJ2wfwF6U6soFoLh8HuGhxuFabHaXqgp/ZMJ0BmBNm+GalEqijFm/IzlmnFCXWI6gEs9ricb4XUG6lQSA3ACnfqh+5lEBVaaf0niX+BobeMJlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EflkfTof; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EflkfTof"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790616143; x=1822152143;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=A5fPEYTyva1qa1CcS8vPQRNmGopYXG7G+HJVDpDWTXo=;
  b=EflkfTofwMEJINRnrDAqWIUtfHoyv2vFvpevQegXYRSdBWLIn972Ky6z
   s9/tMOK/MM5rsi1zo2mGZB/o7xkURl6SkF09VDbjdKxOrzsyd0T5y1yMU
   UCxk8mEY7e6RcKMApBgwAfStlRjaK96RsK3twA+b05UZvPG3cNWL7zn1b
   U34ssFS9EQIavi2yRhcv8fXJELU1svUYrpjpCdz4KpC7QVrk1QEKKzCY8
   A3iv5Z4gzdlGdDejVQx/5NcMmb9lnRHClUMgPJRvJ2h1ByFXYB2u6elHX
   CGQ0eRfJTO3Z0f0KWUWW65PzFbu/zCg0CG17XTq3sYrPANugqaqmisV/F
   A==;
X-CSE-ConnectionGUID: AF0BHQCwTFui3UGn9qLekw==
X-CSE-MsgGUID: u9oRi0g4S7u211CUCL0jcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="93812361"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="93812361"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 10:22:20 -0700
X-CSE-ConnectionGUID: S/3A8+pYSMabJE62UZpwYA==
X-CSE-MsgGUID: poEqxYK2T+iIpz01g3ziGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="279831713"
Received: from schen9-mobl4.amr.corp.intel.com (HELO [10.125.111.82]) ([10.125.111.82])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 10:22:19 -0700
Message-ID: <2e64c909e48087b188b8220344ef6576bd273373.camel@linux.intel.com>
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
Date: Mon, 28 Sep 2026 10:22:02 -0700
In-Reply-To: <c3e26de1-85de-4b44-8498-9878e95f4d5c@computerix.info>
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
	 <c3e26de1-85de-4b44-8498-9878e95f4d5c@computerix.info>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.1 (3.58.1-1.fc43) 
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sun, 2026-09-27 at 12:47 +0200, Klaus Kusche wrote:
> Hello,
>=20
> this one looks good.
> It does not show any core assignment anomalies=20
> in the core bar graph (i.e. no processes are staying=20
> on little cores when big cores are idle),
> and at least for the two compile jobs I tested,
> it gives timings which are=20
>=20
> * better w.r.t. elapsed wallclock time
> (sometimes slightly, sometimes significantly)
> than all other versions and patches I tried so far
> with cache-aware scheduling on
>=20
> * and at least as good as the unpatched kernel
> with cache-aware scheduling turned off
> (so one does not loose anything by turning it on).

Thank you for testing and sharing the results so quickly.
I will send a cleaned up patch for sched/urgent branch shortly for
Peter.

Tim

>=20
> As expected, the uv build profits more than the kernel built,
> because besides all-cores-loaded and single-core-loaded phases,
> it spends significant time with about half as many busy processes
> as cores, and in these phases, placement makes a difference.
>=20
> Klaus Kusche
>=20
