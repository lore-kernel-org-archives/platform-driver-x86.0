Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C65529B764;
	Mon, 15 Dec 2025 19:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765826505; cv=none; b=OSc3+bZ+ccpy7nsrZ8yTdKUJcM+xbBpu61g0Ts8ooXllO7AUWFh59HbUqcc0WhSBTDLCxMtJyxuZ+Rik8Si4T7twLucFtfie/ZDXvxk5OrEaIpVPSFa47YzaxgVOmVDWvzWN8XyrcFfW6rq7YPwN0gUa6MrAntpLgwxRcUWThjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765826505; c=relaxed/simple;
	bh=mTpaqdjoeA9FDQigSIsAHMx2T4OqbGuAvTZEQlW+eyY=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=KNA2ae3QHxmoGwfbAlnz9aZ5TGnHcfZDRrvlxW35Mft3Ou4yg/yWCvY/jKG9j7iMDiYAuwoq/825zUMmSIocwaQqCsYiZfJJ5qrTriHpmfZDCDkgY6ZbkyjtF4WgjNZDBp8tyOjZIi4vgaBWEoAtqrTc+mWO9IjcoiUkvAeDnmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VQeYTXSC; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VQeYTXSC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765826504; x=1797362504;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=mTpaqdjoeA9FDQigSIsAHMx2T4OqbGuAvTZEQlW+eyY=;
  b=VQeYTXSC/M8oBVoVxcHxRoK4HQyr0uh7vV7WxTUDGUTw7/oDL8ovcNA5
   bbmFWYQ4lXArtZf7++40i4oKGGS1GOLtBLg8WwAiN+iQxg2fYS7o7ROjr
   vrN3teosA8Nrs8z//A/dfvI47NQM2eBEwfUPySGxViWEYvwOeWcylCx53
   ooFUZZcNXdedFGQqwPWf2R2p1W6RkpYNsmAaaggcJf+pYhHkSZqpOBJ0Z
   vFYvLYRUUrBImDmivpNdiSsXORyQPKr1FfFd3yzRkC0JrwvegXUDxPk9E
   adS+rpZJRDyhok9pGzPpVk1MoIdBSKNt1tj/SVFLUEH6GmKMJp1kDXngW
   A==;
X-CSE-ConnectionGUID: c/eZvhvSRzu9BtbO+m183w==
X-CSE-MsgGUID: 0rSJv6KsTzCFLmBrFqEWFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="71593423"
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="71593423"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 11:21:43 -0800
X-CSE-ConnectionGUID: JSPXY6/7RNKHqETsO0PXtA==
X-CSE-MsgGUID: zt/RfNk5TwK01Vnzle+VDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="202300499"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.115])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 11:21:41 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 15 Dec 2025 21:21:38 +0200 (EET)
To: Randy Dunlap <rdunlap@infradead.org>
cc: LKML <linux-kernel@vger.kernel.org>, 
    "David E. Box" <david.e.box@linux.intel.com>, 
    Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH] platform/x86/intel/vsec: correct kernel-doc comments
In-Reply-To: <c6198da4-c596-4ed7-b4a4-f43046cca34c@infradead.org>
Message-ID: <0a353eb3-094c-5c34-89e8-20e0678c1f94@linux.intel.com>
References: <20251214201959.2195863-1-rdunlap@infradead.org> <cac479ad-e258-fb20-8005-3155e4a7f901@linux.intel.com> <c6198da4-c596-4ed7-b4a4-f43046cca34c@infradead.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1723967693-1765826498=:1225"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1723967693-1765826498=:1225
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 15 Dec 2025, Randy Dunlap wrote:

> Hi Ilpo,
>=20
> On 12/15/25 6:10 AM, Ilpo J=C3=A4rvinen wrote:
> > On Sun, 14 Dec 2025, Randy Dunlap wrote:
> >=20
> >> Fix kernel-doc warnings in intel_vsec.h to eliminate all kernel-doc
> >> warnings:
> >>
> >> Warning: include/linux/intel_vsec.h:92 struct member 'read_telem' not
> >>  described in 'pmt_callbacks'
> >> Warning: include/linux/intel_vsec.h:146 expecting prototype for struct
> >>  intel_sec_device.  Prototype was for struct intel_vsec_device instead
> >> Warning: include/linux/intel_vsec.h:146 struct member 'priv_data_size'
> >>  not described in 'intel_vsec_device'
> >>
> >> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> >> ---
> >> Cc: David E. Box <david.e.box@linux.intel.com>
> >> Cc: Hans de Goede <hansg@kernel.org>
> >> Cc: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> >> Cc: platform-driver-x86@vger.kernel.org
> >> ---
> >>  include/linux/intel_vsec.h |    7 ++++---
> >>  1 file changed, 4 insertions(+), 3 deletions(-)
> >>
> >> --- linux-next-20251201.orig/include/linux/intel_vsec.h
> >> +++ linux-next-20251201/include/linux/intel_vsec.h
> >> @@ -80,8 +80,8 @@ enum intel_vsec_quirks {
> >> =20
> >>  /**
> >>   * struct pmt_callbacks - Callback infrastructure for PMT devices
> >> - * ->read_telem() when specified, called by client driver to access P=
MT data (instead
> >> - * of direct copy).
> >> + * @read_telem: when specified, called by client driver to access PMT
> >> + * data (instead of direct copy).
> >>   * @pdev:  PCI device reference for the callback's use
> >>   * @guid:  ID of data to acccss
> >>   * @data:  buffer for the data to be copied
> >=20
> > Is it correct for kerneldoc to have the rest as @pdev, @guid, etc.,
> > they are parameters to the callback, not members of this struct?
>=20
> No, it's not correct. We get away with it in several kernel source files
> because scripts/kernel-doc doesn't check/notice that.
>=20
> Would you prefer to have them there but without the leading '@' sign?
> Or completely delete those lines?
> IMO they are useful/informative, so I would rather not delete them.

Can we use some * * formatting trick to them as well as remove the @. I'm=
=20
not sure how kernel doc deals with formatting * * within the parameters=20
paragraph but if it works like in return formatting, I guess that would=20
seem like the most useful approach.

If it doesn't work, then just remove @, I think.

--=20
 i.

> >> @@ -120,7 +120,7 @@ struct intel_vsec_platform_info {
> >>  };
> >> =20
> >>  /**
> >> - * struct intel_sec_device - Auxbus specific device information
> >> + * struct intel_vsec_device - Auxbus specific device information
> >>   * @auxdev:        auxbus device struct for auxbus access
> >>   * @pcidev:        pci device associated with the device
> >>   * @resource:      any resources shared by the parent
> >> @@ -128,6 +128,7 @@ struct intel_vsec_platform_info {
> >>   * @num_resources: number of resources
> >>   * @id:            xarray id
> >>   * @priv_data:     any private data needed
> >> + * @priv_data_size: size of private data area
> >>   * @quirks:        specified quirks
> >>   * @base_addr:     base address of entries (if specified)
> >>   * @cap_id:        the enumerated id of the vsec feature
> >>
> >=20
>=20
> thanks.
>=20
--8323328-1723967693-1765826498=:1225--
