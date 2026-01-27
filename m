Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E825345743;
	Tue, 27 Jan 2026 11:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769514420; cv=none; b=f3P6LbHPB34uLKsA38RN4INAGQS0qTT2bTUIA3KhCk0OxGUfMGFP1N5T2wvGCm8hywGBRulWfOMXE8aiVs5/K/fYAv2VSLOD++eoBQofyLKFZg8bQjNuTqpiPR19p2g7thpiwYKDtbUfdx0qYgUvT0kQiB4Nzvflx4wCwKmrUpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769514420; c=relaxed/simple;
	bh=Kk8a9FSr9F/qQGlMehCmUulagEZX/jAtBNaQNoWW9FA=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=KzJIJDe9rvFIIPs3HD00GkgOPKxZt+EyjAj41lAFqm6GvaLCjyInLCfZmpD3P93F/mzmxFU+OonUPzenQgz9m54mcssP6CCUl5zAt2VZxq72PZD/yqitqbROL2AWpekT8uO6bXH8jEZkmD8wwj3828QLJXz5XvWWDC6yse3M9qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bJkpA0VB; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bJkpA0VB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769514419; x=1801050419;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Kk8a9FSr9F/qQGlMehCmUulagEZX/jAtBNaQNoWW9FA=;
  b=bJkpA0VBkfB7gTEjYi8LE2PDRXy0pVVLwBmUmj2/llACnUTdvU8QDJUF
   nZWlzjWeojBnaL0gRK3ZwjqRw4cIPZmgbxC15ylN+PnO9XMiQfxyhj/Ph
   zqDdiZVNEIucGEx+/Ge+mwlhwot8HmsdR9J1y41uTX6YxU+qeLUQ+/+tv
   i37Kd3uT9FHb+xpBBZj7P/+HbdvLJVbwmVNmIv2SmoCI/qhzmlIiYs0O8
   4sCRiOl1m2jAgKIZbF6w7Vl4P1FdsJ8OQtsrypwtgZ7IbAlKiOoe86KMl
   3GO8kwBjHevl2aayTyFX0Ty7pFZf+qTq9+nxqNn/HV1dEsToVFEZed7I1
   w==;
X-CSE-ConnectionGUID: wmsMPW9GQ4acVTgW9gNO4g==
X-CSE-MsgGUID: 5vfyFF1sSKOLYy/fGSzSCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="81814172"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="81814172"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 03:46:58 -0800
X-CSE-ConnectionGUID: 91wVuJPvTzOOj3KaB+Kf9w==
X-CSE-MsgGUID: tyueqwKnQKu20ZRQDgBrAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="207081415"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.67])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 03:46:53 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 27 Jan 2026 13:46:49 +0200 (EET)
To: Mario Limonciello <mario.limonciello@amd.com>
cc: ogabbay@kernel.org, maciej.falkowski@linux.intel.com, 
    Hans de Goede <hansg@kernel.org>, Jeff Hugo <jeff.hugo@oss.qualcomm.com>, 
    Lizhi Hou <lizhi.hou@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
    dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>, 
    max.zhen@amd.com, sonal.santan@amd.com, 
    platform-driver-x86@vger.kernel.org, VinitKumar.Shukla@amd.com, 
    Patil Rajesh Reddy <Patil.Reddy@amd.com>
Subject: Re: [PATCH V4] platform/x86/amd/pmf: Introduce new interface to
 export NPU metrics
In-Reply-To: <6467de90-7a03-4e15-a549-bc882b29d579@amd.com>
Message-ID: <ce45da68-9ef1-9391-95ee-8bcb614b0b51@linux.intel.com>
References: <20260115173448.403826-1-lizhi.hou@amd.com> <176892084537.15580.12089679537024504744.b4-ty@linux.intel.com> <6467de90-7a03-4e15-a549-bc882b29d579@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1908535892-1769514409=:1055"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1908535892-1769514409=:1055
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 26 Jan 2026, Mario Limonciello wrote:

>=20
>=20
> On 1/20/2026 8:54 AM, Ilpo J=C3=A4rvinen wrote:
> > On Thu, 15 Jan 2026 09:34:48 -0800, Lizhi Hou wrote:
> >=20
> > > The PMF driver retrieves NPU metrics data from the PMFW. Introduce a =
new
> > > interface to make NPU metrics accessible to other drivers like AMDXDN=
A
> > > driver, which can access and utilize this information as needed.
> > >=20
> > >=20
> >=20
> >=20
> > Thank you for your contribution, it has been applied to my local
> > review-ilpo-next branch. Note it will show up in the public
> > platform-drivers-x86/review-ilpo-next branch only once I've pushed my
> > local branch there, which might take a while.
> >=20
> > The list of commits applied:
> > [1/1] platform/x86/amd/pmf: Introduce new interface to export NPU metri=
cs
> >        commit: 15e19bd95be5c79f2f98b727edda002ba86f8d03
> >=20
> > --
> >   i.
> >=20
>=20
> Lizhi,
>=20
> One clarification.  What about the XDNA driver side of this change, are y=
ou
> still going to do it this cycle?
>=20
> If so; this either needs an immutable branch from Ilpo or that side of th=
e
> change needs to go through pdx86 as well.

Hi Mario,

I was told to me by Lizhi the xdna side patch not going to pursued in=20
this cycle [1] so I went with that and changing that now is not realistic=
=20
because of merges I've performed to for-next (I could have easily done=20
IB for the change back when applying the patch which would have been the=20
default but given that mention, I didn't bother).

[1] https://lore.kernel.org/all/93210832-aa75-7639-c9d2-99ec802d88e4@amd.co=
m/

--=20
 i.

--8323328-1908535892-1769514409=:1055--
