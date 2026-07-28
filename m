Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1AF42AFB3;
	Tue, 28 Jul 2026 11:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785238807; cv=none; b=kLg8ZZoukztGri8UHMbNdeW2Z0/oVEzZD63MHYmTpOh4EFTkiqLh7/KXcK6o4qWBv0JnZS4KexJIT7BqAGE4qdOL1c9rLiup4SIADxgao9TZBIlJFKa6fJWB5E/LIlzYMX1QotP1xYWYGTm3/d0YiNLj0IANZrkcJVwB8WM3dJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785238807; c=relaxed/simple;
	bh=Y/CPBBFiaNGqgM4Cg6GBFvQs6LS/KRgBg2qDdkZixZA=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=n+1aAVnI9a+kXjXIomxxpWugRv/UJmufqX7P/GWYkUgwht2Tpxci4I7ZJwCkLeIBPuzDQly6OyFrRQ/+lDMfVUsfRDU9Oo+tWmwmkTTah3dsplYUlYxEnerS3KjxdNQsz/eS3P2mr6szeY5snKFEiDcA1flihf58q7dCM7y1B/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dojl3kVL; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dojl3kVL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785238806; x=1816774806;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Y/CPBBFiaNGqgM4Cg6GBFvQs6LS/KRgBg2qDdkZixZA=;
  b=dojl3kVL3KGAZ0vmECAWj/2SS7E3nOzKKP8HnMeVuFGCeTLd+I31Q19Y
   yOja+gU+XzbcfZ87E/rOe2U9pZn0DxBkouIA/gZX1+Wse/G6LpBJSKSll
   7O7P875JDwRk3TkVeABNzr5f+M+4wLAS5dqBzZ/LuU2J5Bd/KoRyIt7dI
   WOnhe4i8vueJ9jl6X64HHoLz6uBnu5WCH7SrPnURnnQwU2etBMI1xG+fQ
   YNSQUH6wov5i3TQzVZLnybFuBp2OfzmAyuYLmg9UWrJ4OYnqJJKrEJvGo
   UUIup/qNAeTVDbc17huHful4QoZ1MKykGx+GDdWgogM18xYeKCpPnSuyk
   A==;
X-CSE-ConnectionGUID: P68Zk3btRo+YLSjskGjLXw==
X-CSE-MsgGUID: G7cezLQzSdG+gFfJ6qeUyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="89640602"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="89640602"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 04:39:59 -0700
X-CSE-ConnectionGUID: alKLpivNRJ2igVrVxVRv3g==
X-CSE-MsgGUID: YO8FTimqT/6v2aTDzR8Ehg==
X-ExtLoop1: 1
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.129])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 04:39:57 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 28 Jul 2026 14:39:51 +0300 (EEST)
To: Thorsten Leemhuis <regressions@leemhuis.info>
cc: Hans de Goede <hansg@kernel.org>, 
    "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, 
    Linux kernel regressions list <regressions@lists.linux.dev>, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: Policy: "routed through for-next, ... unless introduced in the
 most recent cycle"
In-Reply-To: <56f2c589-2133-417d-9bbd-2c0b11b83c87@leemhuis.info>
Message-ID: <28ffe1e4-bbbd-3945-bb8f-f372d825d0ec@linux.intel.com>
References: <56f2c589-2133-417d-9bbd-2c0b11b83c87@leemhuis.info>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 28 Jul 2026, Thorsten Leemhuis wrote:

> Hi Ilpo! I stumbled about a few messages of yours where you apply a
> commit for later mainlining were you wrote this:
> 
> > FYI [if applicable to your patch], as per Linus' policy change, also
> > fixes are mostly routed through for-next unless the fix is for a
> > commit introduced in the most recent cycle or is clearly a regression
> > fix.
> 
> Could you point me to the source of "per Linus' policy change"? I really
> wonder if I missed something, as from what I know Linus wants fixes for
> regressions in all recent released merged quickly (e.g. in the current
> cycle), unless very dangerous or so. My knowledge is among others based
> on this statement from Linus:
> https://lore.kernel.org/all/CAHk-=wis_qQy4oDNynNKi5b7Qhosmxtoj1jxo5wmB6SRUwQUBQ@mail.gmail.com/
> 
> To quote:
> 
> """
> And yes, I do consider "regression in an earlier release" to be a
> regression that needs fixing.
> 
> There's obviously a time limit: if that "regression in an earlier
> release" was a year or more ago, and just took forever for people to
> notice, and it had semantic changes that now mean that fixing the
> regression could cause a _new_ regression, then that can cause me to
> go "Oh, now the new semantics are what we have to live with".
> 
> But something like this, where the regression was in the previous
> release and it's just a clear fix with no semantic subtlety, I
> consider to be just a regular regression that should be expedited -
> partly to make it into stable, and partly to avoid having to put the
> fix into _another_ stable kernel..
> """
> 
> Is there something newer that invalidates this?

Hi Thorsten,

What I'm referring to is this policy change:

https://lore.kernel.org/lkml/CAHk-=wjt1NiKOdyAMz_DT7NmZ++SizPOhRSi492ukdTnpDzHQw@mail.gmail.com/


Perhaps it's just misunderstanding of my wording. My note says "unless". 
So to qualify for fixes as per the new policy the fix has to be either 
a) for something recently introduced (merged in this cycle) or b) a 
proved/tested regression fix to "any" version (not some theoretical 
regression somebody found with a tool or AI or reading the code; "any" is 
somewhat subjective when it comes to very old regressions).

The point of my note in that thank you email is not to set any policy but 
to just explain why less patches are these days merged through fixes 
branch. In pdx86 domain this largely relates to certain kind of patches:

- .probe rollback path fixes (a platform driver probe can certainly fail, 
but does it in practice?)
- .remove fixes (well yeah, removing a platform driver is technically 
possible, but why to do that?)
- new HW additions which previously went through fixes branch

Those issues tend to be quite old so they are not very critical and all 
these can easily wait a few weeks more.

I did differentiate based on criticality and complexity of a "fix" towards 
the end of cycle even before Linus sent that note but now I'm just making 
things easier to me and push most stuff through for-next (which leaves me 
less conflicts to deal with as well). That being said, Rafael Wysocki 
happened to add ACPI NULL checks to platform drivers (force match corner 
case) in that very -rc linked above, so perhaps I'm in part of the reason 
why Linus got tired of seeing so many "fixes". :-)


The way I read your email is that your main concern is that according to 
the new policy, only very recent regressions should be addressed through 
fixes, but that's not what my note (nor Linus, AFAICT) is saying.

I hope the link and explanation helped.

-- 
 i.

