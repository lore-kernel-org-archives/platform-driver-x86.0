Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795780799;
	b=VkX5xJ8rMKCr0daSdKURBHg6WY/3aPX/VlK/rW4rWM7j2woEnjJX7uqkiKGW0chLOrTc
	 YufittWqSIm1SdcyPokfK3+m6GvB71phd9TJSRmVbw1oMmsoX99WP62ufltPosFDgmVnA
	 tAhs2BoObZebakUv3znhUJtZWKqhxF8ghiy4gH72CV11L/O83ohMEAoJ0bpOVDxM9+qaH
	 6NEEaoTw1y9gphV22btLSaeyaKaAL/N4BkeRUrQ181VvXmTeyPwPGI6CwpqHXOSPpk3q+
	 Xp35XEbQ4QWfPBJSklJf5FftbqvvGf1UyR46QI2EfoegNvWA8fZ6OUgnGLQ1Ahg9sbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795780799;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Subject:
	 From:To:Cc:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=wlDl5cJRF79lUP9FTjADUwSUf57erYSrU3NdfsejBiI=;
	b=5SLvzZrUplN6zQXkQ53RTV7aBTewN5RmxxGlMdijILQ5pkQ+fEip0iUvhV2K7wQ/jJuF
	 qippdDWxqX2GQCho8ZkXlBeD3Y3mlL4Czyn8jGlEArqmS0FXum96Z/7BRGeDab+hu08aJ
	 E310BeJXb5wBWIy2yq66nCosWrgU4zHrtqhbLT0uTGF+SYbbI2V5Q4YgwODLZOgxffauW
	 Sl4UgcH7OoskcPWVbgaQn12SKZv+2vEkqDebObLADsh3NfSYsUjPHjtdGiUL6QNOp55nA
	 uXb127b4og9VcPpEPYUiyplZt/HWXYdMjRBq9/UdCFAK/oDdYNhEjeLYRAmgR1G25dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=blzi4JBL;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07FE4606A31F;
	Fri, 27 Nov 2026 11:59:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07FE4606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=blzi4JBL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795780799; x=1827316799;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=1LpZNcFZ5HoKUeo9dWQkeA7wSeG+Z9St0e3lxDCAnpY=;
  b=blzi4JBLaOpWSfgNJAC+iebk1ygDdQ6siUmqo8YO3iDlgqwsmgfr++pm
   qxp5sl2X7K0HawS5epYk3JPMwxcpeEh2fpJ7S98ehHWqnVp23H+bxcvkX
   XiSBDp54nwnSi3F4xBKX+v3oD6rKe+bqBk96elKCO0sAKLKNy8+vLI4jE
   GjW+/qyz8riRCMonhyjtp9CRVbYMcK39fHlGsAuz00tr7ANVhy8ylLpgi
   MQwef6+5sd9XcA1FOWyrmzKM0R81jxmxcyzpJ/4fbttqxSdrzX/6L411N
   SXzb0stEHAOy86/ilSpXywqxU/B90XsjPQ2vHQ6RkBHBk75UQ+giK59aK
   g==;
X-CSE-ConnectionGUID: fYJdaEBvSsiCpp9hY20FBA==
X-CSE-MsgGUID: WJ/yCJneQgCws+lhSxv/Mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4782127"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4782127"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 03:59:58 -0800
X-CSE-ConnectionGUID: CtQUIXK5Qg2bvl7wt+fZQA==
X-CSE-MsgGUID: Sn1UWcE2S+OfTVzJsdvlCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="12806047"
Received: from spandruv-mobl5.amr.corp.intel.com (HELO [10.124.221.51]) ([10.124.221.51])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 03:59:58 -0800
Message-ID: <bac20576fb7d82c59fe9d33719b8a339ed4da84b.camel@linux.intel.com>
Subject: Re: [PATCH] platform/x86/intel/tpmi/plr: Fix CPU selection on
 partitioned systems
From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To: "Zhang, Rui" <rui.zhang@intel.com>, "hansg@kernel.org"
 <hansg@kernel.org>,  "ilpo.jarvinen@linux.intel.com"	
 <ilpo.jarvinen@linux.intel.com>, "qinyuntan@linux.alibaba.com"	
 <qinyuntan@linux.alibaba.com>
Cc: "xlpang@linux.alibaba.com" <xlpang@linux.alibaba.com>, 
 "tero.kristo@linux.intel.com"
	 <tero.kristo@linux.intel.com>, "platform-driver-x86@vger.kernel.org"
	 <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	 <linux-kernel@vger.kernel.org>
Date: Fri, 27 Nov 2026 03:59:56 -0800
In-Reply-To: <7bd156a0ccc8ce5c24d26b1a4583bd7086f41942.camel@intel.com>
References: <20261125092244.3641945-1-qinyuntan@linux.alibaba.com>
	 <7bd156a0ccc8ce5c24d26b1a4583bd7086f41942.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-3.fc44) 
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Fri, 2026-11-27 at 05:00 +0000, Zhang, Rui wrote:
> On Wed, 2026-11-25 at 17:22 +0800, Qinyun Tan wrote:
> > When a package has multiple TPMI partitions, PLR can report the
> > same
> > CPUs in more than one partition. For example, on a single-package
> > system with 72 logical CPUs and two TPMI partitions, both
> > partitions
> > list CPUs 0-35 in their PLR status files. CPUs 36-71 are missing.
> >=20
> > Each partition numbers its PLR resources from zero. The driver
> > compares
> > that index with the CPU's power domain ID from MSR_PM_LOGICAL_ID,
> > which
> > is unique within the package. As a result, both partitions select
> > the
> > same CPUs. A mailbox read or clear on the second partition then
> > uses
> > a
> > module ID taken from a CPU in the first partition.
> >=20
> > Use the partition's cdie_mask to map each PLR resource to its
> > package
> > power domain. For compatibility with older platforms, keep using
> > the
> > resource index for partition 0 when no mask is available. Skip per-
> > CPU
> > mailbox accesses if the resource has no valid CPU mapping.
> >=20
> > Fixes: 9e9397a41b7b ("platform/x86/intel/tpmi/plr: Add support for
> > the plr mailbox")
> > Signed-off-by: Qinyun Tan <qinyuntan@linux.alibaba.com>
>=20
> I have reproduced this issue and verified that this patch can fix it.
>=20
> Tested-by: Zhang Rui <rui.zhang@intel.com>
>=20
> but one minor comment below,
> > =C2=A0
> > +static int plr_power_domain_id(const struct oobmsm_plat_info
> > *plat_info, int index)
> > +{
> > +	u16 mask =3D plat_info->cdie_mask;
>=20
> This cdie_mask is a bitmask, its Nth bit means hardware cpu die N,
> which IMO equals the punit/power domain id N.
>=20
> > +	int id =3D index;
> > +
> > +	/* Resource indices are relative to the partition's first
> > compute die. */
> > +	if (mask)
> > +		id +=3D __ffs(mask);
>=20
> here we want to get the power domain id for PLR domain 0/1 because we
> use that for cpu to plr/power_domain mapping.
> The above code generated correct results for the platform being
> tested,
> but with the assumption that the cdie_mask cannot be sparse.
>=20
> how about something like
> 	id =3D fns(mask, index);

With recent update in spec cdie_mask can't be sparse.

Thanks,
Srinivas


>=20
> thanks,
> rui
>=20
>=20
> > +	else if (plat_info->partition)
> > +		return -ENODEV;
> > +
> > +	if (id >=3D MAX_POWER_DOMAINS || (mask && !(mask &
> > BIT(id))))
> > +		return -ENODEV;
> > +
> > +	return id;
> > +}
> > +
> > =C2=A0
