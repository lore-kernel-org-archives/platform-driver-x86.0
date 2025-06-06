Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F581E231D
	for <platform-driver-x86@vger.kernel.org>; Fri,  6 Jun 2025 21:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749244383; cv=none; b=TS8/k2n5FR4Te/0JXgqwBBT/5axPBXqIDxD3hir7kDOGXE5l1ADq/fxPl7/MM6HH/wK1hIEHdrAXBhoq7jbtS9O1HKSUNjHsj75YhpXzZsGr/ZOZYpVIP2/jneQ3mLenKSaCWNw47kmEFTDEuu6ZNjjbO6AWRjCgye1oVmghwC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749244383; c=relaxed/simple;
	bh=BZfG/JiTPMDLTP+ThgiXGMgS/UzyBkDfeH+1C4LQM/A=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Z3T5wVHzuVpkdQ0ZMAoPKYgixQNsXlII/Y5XQBhJ6oUZI8696/1oFzMSmNofR4supYjkP2/3/9ErqgmGiMOq94XmrUicJcdZ8pcILZvxlLvHr44dOGJ/YxbhNoxcdW+cfcf4ithgb0reAkFW70bHINZSn7mqNKPDfJTf5Cu67Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RcZHVyV8; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RcZHVyV8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749244382; x=1780780382;
  h=message-id:subject:from:reply-to:to:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=BZfG/JiTPMDLTP+ThgiXGMgS/UzyBkDfeH+1C4LQM/A=;
  b=RcZHVyV8Z/2sjrzV4BC7fyneFPhIuORiUa7FDmmbEHAsAJvX/fC7Dx1b
   YavqyMOH8KlEBmx33yoL2Vhj87E9ML4z8aSmpSc/W6hQ4cKnDpioiecif
   ok4IcDWyTZfNmg/lcrsc1KfTFZbs0zsodtnthR7jSV9bxHqUBHe/DCtkx
   0e1l0IVWdZZlPJzekOxFSdfj37XY7V9/k4FWzvpxTucyul5wfeAJRYBXJ
   AKL8HO85Tdq+2z+kL004VpuVC+eXD8gNZk0sElVInbM6Sn2vMflyyTane
   L8PgeOLQ1WEtbdBB8BHt62j4/7OGztqpaXu/P0+gUe6hALtdk6JD9KlFD
   A==;
X-CSE-ConnectionGUID: UAmTkui7TCmgGVuqDcHj8w==
X-CSE-MsgGUID: kRfmyCwoSySoGS3WaT4dug==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="61670272"
X-IronPort-AV: E=Sophos;i="6.16,216,1744095600"; 
   d="scan'208";a="61670272"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2025 14:13:02 -0700
X-CSE-ConnectionGUID: 5NTXCKjkRsWzSmAvsiprVQ==
X-CSE-MsgGUID: CO0sCSa0TLqB/K6yoo3E4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,216,1744095600"; 
   d="scan'208";a="150764814"
Received: from aschofie-mobl2.amr.corp.intel.com ([10.124.222.251])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2025 14:12:57 -0700
Message-ID: <de8a20f75094e0bc62d9459afbe7689cc6f1aab8.camel@linux.intel.com>
Subject: Re: [PATCH v3 03/11] drm/xe: Correct BMG VSEC header sizing
From: "David E. Box" <david.e.box@linux.intel.com>
Reply-To: david.e.box@linux.intel.com
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>, 
 platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org, 
 hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
 lucas.demarchi@intel.com,  rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, airlied@gmail.com,  simona@ffwll.ch
Date: Fri, 06 Jun 2025 14:12:56 -0700
In-Reply-To: <20250605184444.515556-4-michael.j.ruhl@intel.com>
References: <20250605184444.515556-1-michael.j.ruhl@intel.com>
	 <20250605184444.515556-4-michael.j.ruhl@intel.com>
Organization: David E. Box
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2025-06-05 at 14:44 -0400, Michael J. Ruhl wrote:
> The intel_vsec_header information for the crashlog feature is
> incorrect.
>=20
> Update the VSEC header with correct sizing and count.
>=20
> Since the crashlog entries are "merged" (num_entries =3D 2), the
> separate capabilities entries must be merged as well.
>=20
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>

Fixes tag?

David

> ---
> =C2=A0drivers/gpu/drm/xe/xe_vsec.c | 20 +++++---------------
> =C2=A01 file changed, 5 insertions(+), 15 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index 3e573b0b7ebd..67238fc57a4d 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c
> @@ -32,28 +32,18 @@ static struct intel_vsec_header bmg_telemetry =3D {
> =C2=A0	.offset =3D BMG_DISCOVERY_OFFSET,
> =C2=A0};
> =C2=A0
> -static struct intel_vsec_header bmg_punit_crashlog =3D {
> -	.length =3D 0x10,
> +static struct intel_vsec_header bmg_crashlog =3D {
> +	.length =3D 0x18,
> =C2=A0	.id =3D VSEC_ID_CRASHLOG,
> -	.num_entries =3D 1,
> -	.entry_size =3D 4,
> +	.num_entries =3D 2,
> +	.entry_size =3D 6,
> =C2=A0	.tbir =3D 0,
> =C2=A0	.offset =3D BMG_DISCOVERY_OFFSET + 0x60,
> =C2=A0};
> =C2=A0
> -static struct intel_vsec_header bmg_oobmsm_crashlog =3D {
> -	.length =3D 0x10,
> -	.id =3D VSEC_ID_CRASHLOG,
> -	.num_entries =3D 1,
> -	.entry_size =3D 4,
> -	.tbir =3D 0,
> -	.offset =3D BMG_DISCOVERY_OFFSET + 0x78,
> -};
> -
> =C2=A0static struct intel_vsec_header *bmg_capabilities[] =3D {
> =C2=A0	&bmg_telemetry,
> -	&bmg_punit_crashlog,
> -	&bmg_oobmsm_crashlog,
> +	&bmg_crashlog,
> =C2=A0	NULL
> =C2=A0};
> =C2=A0

