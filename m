Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA29B3538BF
	for <platform-driver-x86@vger.kernel.org>; Wed, 19 Nov 2025 12:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763556287; cv=none; b=HlVWuncicXGM+bzkHErqy+PO6FcGI5I6mvElFnackgFhUCSFlxxu5oA3gj8oP7ZjD1wNBqE3gpARniCsCOJhdbVTtMfxvcvZqkLGlytQucA+a3XzKN+TwpgI1tmWTewiV924JpL73i4ICLVk7EGADC7dLWaTzdF+8DaTEyUs80E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763556287; c=relaxed/simple;
	bh=CKXX4JPGOldpuGrwIvU2TLzXJEbxwLj7Btw3ZwiBxmI=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Ex5tIocvHyuCc9h/Hmm87il32XMdXjZvdOg+MKeKclZjJoQCQNHKMCS2eu7cs77haAfb53bMbk84rZ9jNq5eKfepk13JOMsXOd30iF0kJHs4BQES4uapThoIaSktNkjroklFJzgkhTpbTJfJF+DNhV9H1lvnCX9KxTQ98GnRHiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RWRU199+; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RWRU199+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763556284; x=1795092284;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=CKXX4JPGOldpuGrwIvU2TLzXJEbxwLj7Btw3ZwiBxmI=;
  b=RWRU199+K/gB5sm60Vu6IyGS6GDglI3iDIE69IZPqoM0e/lWcVXJx0RV
   8GurJDjzrLAX0ArzjaYhQjTXo371K+jfesSURwVRXFoOMUwdk8wHyG3D5
   fGZWCULXQ6VA3juG60+UhPUOqsp2Z2VavdaDFapByTF/wQSIUHm99mcIM
   oM2xO2bjZnsdOYibpW0007eeEnUT8W1+KL7dxGdLaRA5vaCxyExLk3B2J
   RuTTggvCF3IbAjHgiIm2rVVIKvXtvNbikX0S9TcYhaFUJ8s4zXPpKxWNk
   CyNI8HZkiJRwI9RLLzig58xPH5lgS4RTB2UWLV90VMcXsGI5//u6HyNi4
   A==;
X-CSE-ConnectionGUID: +tvAcLlHRXeKr17GLsfi/g==
X-CSE-MsgGUID: vssn7z8uRj+6QmUxQvCmFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="65535771"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="65535771"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 04:44:43 -0800
X-CSE-ConnectionGUID: YYr98hkFQlWbzjvKY+LmOA==
X-CSE-MsgGUID: KuEPuYRPSPKr45Xfg/rjqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="196179061"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.220])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 04:44:40 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 19 Nov 2025 14:44:37 +0200 (EET)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Mario Limonciello <mario.limonciello@amd.com>, 
    Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    Patil.Reddy@amd.com, lizhi.hou@amd.com, 
    VinitKumar Shukla <VinitKumar.Shukla@amd.com>
Subject: Re: [PATCH v2 5/5] accel/amdxdna: Provide real-time NPU power estimate
 via AMD PMF
In-Reply-To: <bb72ff10-b9e0-47a6-8985-a68efcf204ae@amd.com>
Message-ID: <d344b850-f68d-f9a5-f0dc-55af4b48b714@linux.intel.com>
References: <20251111063737.4156385-1-Shyam-sundar.S-k@amd.com> <20251111063737.4156385-6-Shyam-sundar.S-k@amd.com> <7034fae1-4096-4cdb-a46f-5e23e7accfa0@amd.com> <b8f2d8a0-3131-45cc-8c55-8fbf4ca06cfc@amd.com> <e6551b53-cb89-46e6-9c3c-545d14d79642@amd.com>
 <8349468a-79ac-dc1c-d484-b9c9dd340e1e@linux.intel.com> <09397827-4233-77d6-ab17-dfe0ae5f1cfe@linux.intel.com> <bb72ff10-b9e0-47a6-8985-a68efcf204ae@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-868360736-1763556277=:970"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-868360736-1763556277=:970
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 18 Nov 2025, Shyam Sundar S K wrote:
> On 11/18/2025 21:31, Ilpo J=C3=A4rvinen wrote:
> > On Tue, 18 Nov 2025, Ilpo J=C3=A4rvinen wrote:
> >=20
> >> On Fri, 14 Nov 2025, Mario Limonciello wrote:
> >>> On 11/13/2025 1:33 AM, Shyam Sundar S K wrote:
> >>>> On 11/12/2025 23:33, Mario Limonciello wrote:
> >>>>> On 11/11/25 12:37 AM, Shyam Sundar S K wrote:
> >>>>>> From: VinitKumar Shukla <VinitKumar.Shukla@amd.com>
> >>>>>>
> >>>>>> Add aie2_smu_get_power_estimate() to obtain NPU power readings fro=
m the
> >>>>>> AMD PMF driver. This xdna interface enables user space to reflect
> >>>>>> current
> >>>>>> workload power consumption in real time.
> >>>>>
> >>>>> But.. it doesn't.=C2=A0 It just adds a new function that could pote=
ntially
> >>>>> do this job.=C2=A0 The actual gluing it to userspace in some way to=
 use
> >>>>> this function will be another patch.
> >>>>
> >>>> For now, yes.. that's right. XDNA team will add more support on it
> >>>> that goes via the accel tree. But this patch is meant to have a
> >>>> minimal change on the xdna side so that there is a  consumer of the
> >>>> pmf symbol that is getting exported to the kernel.
> >>>>
> >>>> So, there is more support coming on the way. If you think, its worth
> >>>> to rephrase the commit?
> >>>
> >>> Yes; that other support isn't happening this kernel cycle.  So the co=
mmit
> >>> message should be accurate to what it's actually doing (laying ground=
 work).
> >>
> >> To me it looks this and patch 4 should be submitted with the actual us=
er=20
> >> instead of trying to justify things with far in the future changes. I'=
ve=20
> >> no problem with creating immutable branch if necessary when multiple t=
rees=20
> >> are involved.
> >=20
> > In case it wasn't obvious, I'm fine with taking patches 1-3 in earlier.
> >=20
>=20
> The context for this series is that the XDNA driver needs
> power-related information, which is only available from the PMF
> driver. We=E2=80=99re providing that information via an exported symbol.
> Patch 4 exports the data and patch 5 begins consuming it. The goal is
> to establish the channel through which power-related information can flow=
=2E

It doesn't consume anything, it just adds function without apparent=20
purpose (and this will remain so until the other work is submitted).

> Creating an immutable branch is a reasonable idea, but in this case
> all further PMF-side work stops after this patch. The subsequent
> activity is primarily on the XDNA side =E2=80=94 for example, passing the
> power data into the XRT environment via IOCTLs. If both trees had
> active development or large, simultaneous changes, an immutable branch
> would make sense, but given the current situation it doesn=E2=80=99t seem
> worth the added complexity.
>
> The XDNA changes are distributed and will be implemented gradually;
> they depend on this exported power information from PMF. So my
> proposal is for PMF to export the information now with minimal changes
> on the XDNA side, and land that upstream. The XDNA team can then build
> on top of the exported interface, and their changes can be submitted
> via the misc-drm tree.
>=20
> Ilpo, does this approach work for you?

Lets just wait with these two patches until have real consumer changes=20
ready to be submitted, these patches can appear at the head of such a=20
series.

--=20
 i.

--8323328-868360736-1763556277=:970--
