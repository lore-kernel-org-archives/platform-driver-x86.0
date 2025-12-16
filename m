Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A996832B985
	for <platform-driver-x86@vger.kernel.org>; Tue, 16 Dec 2025 10:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765881201; cv=none; b=gtl6l3O87HcBCtLKaseRgZlPRUYhXqJk2qMTAd+R/0em3OIgsZQr7baDwWSuO892ei81STQkhZQUfZ8bZUPBpcrzHZAISakhC7lNBVNQILrZbmZCAQPvxK5rwXeio4A/YR2xIBmWpVyaofLKKpYiLsi/qeGZ/iBoiYwgjgof6RA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765881201; c=relaxed/simple;
	bh=ZOLqpxRuVG0GFzhE0dkr/O31Jqujs2rr/6frZSVJqmM=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=kMRNIZfl9rVNs4pf2SzgPuRWJbHGEE7WFvuxwbTOuGvmUnzx4lzlNsVgTCa6/Jr9noE24HfzlruAvelH5vopZ1HIDmskbq4tmGS3e5fdDlzsY7ZD/MwHLQMgfwE+VjcbCIntW/PKzlUtmIP8gBVDiOLtG0tgRS0JWh16bk/UJ5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DZ5ijKIV; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DZ5ijKIV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765881199; x=1797417199;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=ZOLqpxRuVG0GFzhE0dkr/O31Jqujs2rr/6frZSVJqmM=;
  b=DZ5ijKIV/REsh5Y92IS+M+Uu+y3+bBFYEAJ0+3GQ5eVPC8PoTe17IzlY
   yBRYXxn+1lkzfOaSL126oUE/LCJOMEfBxp8Rr9F6hoWFHtUQlMuuRL64Q
   vKjqpOPeNgcKmP1ZeAMp7CnF+a9G4Z1Rs1QMnv6HRgSWPnldBraOJMoWD
   36Aa1JcvpZ6eZNi1ltlx3sa8aXeFRcHYe2+pu4QAz63vZiAdQ9o8OGdYw
   B/BQzHQLbjhJkenLidTiC8hU1KneUB/JV4G1IyJSmk9MoBdP11aAypUQ/
   HwCpZsXB2DMkxsJhaOxNGLM4mY/vq3AgEZhcy0w7GhnxgZbtHfLD45xR/
   Q==;
X-CSE-ConnectionGUID: j5GF7wuHS4mljQem/hT9AQ==
X-CSE-MsgGUID: z7RY3BAPSSSZJp0wLbJ45w==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="79250539"
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="79250539"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 02:33:19 -0800
X-CSE-ConnectionGUID: GhI5ZkMpQc+MoHxJGj0cRA==
X-CSE-MsgGUID: IBvaWdBiS7+TXJWR6emRlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="197259377"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.4])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 02:33:17 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 16 Dec 2025 12:33:14 +0200 (EET)
To: Krishna Chomal <krishna.chomal108@gmail.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH] platform/x86: hp-wmi: fix platform profile values for
 Omen 16-wf1xxx
In-Reply-To: <aUEty81BD-FaT0Mj@archlinux>
Message-ID: <aa37c522-205d-e359-b176-e9036b55b265@linux.intel.com>
References: <20251213185107.179130-1-krishna.chomal108@gmail.com> <6ae912bf-ceb9-b8cf-5e9b-831c91135a59@linux.intel.com> <aUEty81BD-FaT0Mj@archlinux>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-863286319-1765881194=:1169"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-863286319-1765881194=:1169
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 16 Dec 2025, Krishna Chomal wrote:
> On Mon, Dec 15, 2025 at 04:25:17PM +0200, Ilpo J=C3=A4rvinen wrote:
> > Thank you for the patch but it looks this approach to add mappings usin=
g
> > if()s to handle variations should be replaced with something better.
>=20
> Thank you for the feedback. I agree that stacking if/else statements for
> board variations is not a scalable idea.
>=20
> For V2, I plan to refactor this driver to use DMI system ID table's
> driver_data field to handle the profile mapping (at least for
> victus_s_thermal_profile_boards in this patch).
>=20
> The implementation will introduce a `struct thermal_profile_params` to
> hold the specific thermal values (Performance/Balanced/Low-Power). Then
> I can convert victus_s_thermal_profile_boards from a simple string
> array to a `struct dmi_system_id[]` array, where each entry maps a DMI
> Board Name to its specific thermal_profile_params via driver_data.
>=20
> Then platform_profile_victus_s_set_ec can simply retrieve the correct
> parameters via dmi_first_match(), removing the need for nested if()s.
>
> I feel this restructuring makes the code much cleaner and makes the
> thermal profile choice for new boards explicit. Does this plan look like
> the right direction for V2?

Yes, something along those lines.

There's also one similar attempt pending in the patchwork, so this=20
hopefully can solve that case as well:

https://patchwork.kernel.org/project/platform-driver-x86/patch/202507312135=
29.27378-1-noahpro@gmail.com/=20

Thanks for taking up this task. :-)

--=20
 i.

--8323328-863286319-1765881194=:1169--
