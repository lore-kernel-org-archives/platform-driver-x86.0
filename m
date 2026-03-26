Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61D4401A09;
	Thu, 26 Mar 2026 15:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774537996; cv=none; b=vFc7SAu1glrVqlQkRQVnXI1xDQDIHvJ5QqpqzVLasVYYuPAWIIWuJHm36zlVEVRtpYXOVcYhbQRgGlCQhjQWgX+4TLhgMgLL2bC1+lj9n0oB/8QW7HQnqZY8ubkoQiGNWf2o1/dRbA/Rz23atE0RGeiyfYbgOUKdS+3/To+8KF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774537996; c=relaxed/simple;
	bh=RBWJsUKVsznVIsB6l3vwJPm0i9W4Y4GkXQMLUEUEkvw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HIj1848fdw4ocbkwSMA+pOrGzrUl5AIENaB8PBYNGmPISVVWhXSCeS6pYmTpOxw4vLc+esmbvIxUzu6ExIi7FpUqqHwEcCP7socqSlDcjXMyKjfdVZgt15pkKFV4/0KocHHXsuGoMIi9I7GcCY2Tcg3qmTa3b3X7xogLjg/sFWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OSHky02e; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OSHky02e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774537993; x=1806073993;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=RBWJsUKVsznVIsB6l3vwJPm0i9W4Y4GkXQMLUEUEkvw=;
  b=OSHky02eTrZTlDz0kShdRlNGpqlk8O7ReesH5uMH0zS+3fA+iIRX/GZC
   gIv5LZoXRdyv+804M7c/NGUNmpE7IFSnOTm17wwsBvzKAQP17peLphoY8
   ihBPhuI32wAbxlxmkOpdoKwa/w+JrOY63FT4UCE8Rt90sdgr9jFzTfK/2
   ZtVn7/oYls18cN7X/MZoi31kTtp+DwXomKxNRfevuv4QCWUNRNclcxtZN
   AACguQZM2NBfip33Wb7Bnc9MHgjLTbXWsLTr2nqP0pG2NpNBqAWEV1jIx
   aCjBsqXOEMHhdVCiJ1Is/Vd03KNyMkNiiawEfe0ubIqQ8ewVPMNHm5sHg
   w==;
X-CSE-ConnectionGUID: g9mPfp8xQfiGvjb3Yn+2AA==
X-CSE-MsgGUID: rz8xKioaRwCUYxlU3sVtwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="75711227"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="75711227"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 08:13:12 -0700
X-CSE-ConnectionGUID: Om9IAiacRWaXHjnKnDgaBA==
X-CSE-MsgGUID: H5LBt1CKTK6hI6InBo4esQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="255530705"
Received: from spandruv-desk2.jf.intel.com ([10.88.27.176])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 08:13:13 -0700
Message-ID: <bd5753f7996f75ef68b4e4c766a0f397400a3933.camel@linux.intel.com>
Subject: Re: [PATCH] platform/x86/intel/tpmi: Use 32 bit aligned address for
 debugfs mem write
From: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
To: Ilpo =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org,
 LKML	 <linux-kernel@vger.kernel.org>
Date: Thu, 26 Mar 2026 08:13:12 -0700
In-Reply-To: <dc63e2ae-0773-8ee0-6b73-55eec4bbd673@linux.intel.com>
References: <20260325193048.3417349-1-srinivas.pandruvada@linux.intel.com>
	 <dc63e2ae-0773-8ee0-6b73-55eec4bbd673@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2026-03-26 at 12:28 +0200, Ilpo J=C3=A4rvinen wrote:
> On Wed, 25 Mar 2026, Srinivas Pandruvada wrote:
>=20
> > The memory write feature supports 32-bit writes to any TPMI offset.
> > However, future hardware generations may not allow writes to non-
> > 32-bit
> > aligned addresses due to hardware optimizations.
> >=20
> > Since all TPMI addresses are 64-bit aligned and correspond to 64-
> > bit
> > registers, enforce 32-bit alignment for write operations.
> >=20
> > Signed-off-by: Srinivas Pandruvada
> > <srinivas.pandruvada@linux.intel.com>
> > ---
> > =C2=A0drivers/platform/x86/intel/vsec_tpmi.c | 3 +++
> > =C2=A01 file changed, 3 insertions(+)
> >=20
> > diff --git a/drivers/platform/x86/intel/vsec_tpmi.c
> > b/drivers/platform/x86/intel/vsec_tpmi.c
> > index 98846e88d3d0..b70232d8ba58 100644
> > --- a/drivers/platform/x86/intel/vsec_tpmi.c
> > +++ b/drivers/platform/x86/intel/vsec_tpmi.c
> > @@ -479,6 +479,9 @@ static ssize_t mem_write(struct file *file,
> > const char __user *userbuf, size_t l
> > =C2=A0	addr =3D array[2];
> > =C2=A0	value =3D array[3];
> > =C2=A0
> > +	if (addr % sizeof(u32))
>=20
> Please use !IS_ALIGNED() instead (remember to check if you also need
> to=20
> add an include).

Good point.

Thanks,
Srinivas

>=20
> > +		return -EINVAL;
> > +
> > =C2=A0	if (punit >=3D pfs->pfs_header.num_entries) {
> > =C2=A0		ret =3D -EINVAL;
> > =C2=A0		goto exit_write;
> >=20
