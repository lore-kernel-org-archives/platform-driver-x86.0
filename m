Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E32C2550BA;
	Tue,  6 Jan 2026 23:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767740861; cv=none; b=ZRUL5wXNgfRNTzNrRrW+lIusznK+9n44T6Qs2Xdjw9yzmz7qYkM/GvU/N+zFbSTk4No8ZHzDHbbYchMYPxnW3mRqpt6Par9p8KU3Dd9DpLpy5Sl29ypdh4miNDJkbcX3IC0AAgVRUlDzm7LKHe/RW/OFFsBl0/8HuQG4Nnk+vvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767740861; c=relaxed/simple;
	bh=UyeHVufkiVjjNQkMvjLFTMmtLKaR+PFj9kuGCkv1OMg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Tx7ASVlw8p4yr2god4m0EvPmjYmLQAMCgRX3zASaHc/lAgLz1QRKIZijzPIyaQDNFAeRPku1+VRsFzES1aVagPeJYiHwjp66A1eQBe48g+3mz0uNSNEZPPlDhrM5AhK/0rITRFKRplsWazOLz4XB8/3Q+lMM6qF5rWBf9kFYz4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HKiEDS3h; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HKiEDS3h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767740859; x=1799276859;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=UyeHVufkiVjjNQkMvjLFTMmtLKaR+PFj9kuGCkv1OMg=;
  b=HKiEDS3hBNWbuX9KvzebcH5o087dYuPHeXyx1vjyPRmKlTTcTBu+olM/
   uC42TDLI+XWXNnUgcZzR5VIWT/q5YK7BuF5nP8khI2GRHqLEN+VUGBH4C
   0LU4bfQ0glb5JHs6XAnb5cNKwF9QJts84gOgMUo4V8TWy5gxYdyOZBgnR
   tTsHFJXqN0z4N09lNOm0eoyQUdAY6NPjxCnmuyl15Ag5zlr2RTR7EpMAE
   xffdi9F/kdDe5k3RfBS7xDd293u24kvyXqMo0ndWSqvGS8XO2yAOtie/K
   FDva330eWa991Zr4CmKeeG+tNHvNYl+y1Rw4KVrBDxNMmf3BTfc3dKds7
   w==;
X-CSE-ConnectionGUID: fpGxQf2hRd6/1d/Wk3bLFw==
X-CSE-MsgGUID: pAA9ezfASriOSnuD3MhOBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="69272408"
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; 
   d="scan'208";a="69272408"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 15:07:38 -0800
X-CSE-ConnectionGUID: PxYJtohCTMO5bGO+BoO3XA==
X-CSE-MsgGUID: sPZqY5RwTVWgSjm6osufMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; 
   d="scan'208";a="201903688"
Received: from spandruv-mobl5.amr.corp.intel.com (HELO [10.247.173.62]) ([10.247.173.62])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 15:07:36 -0800
Message-ID: <8330384fc70c6ffdd7d1bd8626e322adf1e19080.camel@linux.intel.com>
Subject: Re: [PATCH] platform/x86: ISST: Check for admin capability for
 write commands
From: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
To: Ilpo =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org,
 LKML	 <linux-kernel@vger.kernel.org>
Date: Tue, 06 Jan 2026 15:07:32 -0800
In-Reply-To: <b402fa2b-0cc8-d39a-6f35-3680ff54407b@linux.intel.com>
References: <20251229183652.823308-1-srinivas.pandruvada@linux.intel.com>
	 <b402fa2b-0cc8-d39a-6f35-3680ff54407b@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2026-01-06 at 11:49 +0200, Ilpo J=C3=A4rvinen wrote:
> On Mon, 29 Dec 2025, Srinivas Pandruvada wrote:
>=20
> > In some SST deployments, administrators want to allow reading SST
> > capabilities for non-root users. This can be achieved by changing
> > file
> > permissions for "/dev/isst_interface", but they still want to
> > prevent
> > any changes to the SST configuration by non-root users.
> >=20
> > This capability was available before for non-TPMI SST. Extend the
> > same
> > capability for TPMI SST by adding a check for CAP_SYS_ADMIN for all
> > write commands.
> >=20
> > Signed-off-by: Srinivas Pandruvada
> > <srinivas.pandruvada@linux.intel.com>
> > ---
> > =C2=A0.../x86/intel/speed_select_if/isst_tpmi_core.c=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 11 ++++++-
> > ----
> > =C2=A01 file changed, 6 insertions(+), 5 deletions(-)
> >=20
> > diff --git
> > a/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
> > b/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
> > index 47026bb3e1af..a624e0b2991f 100644
> > --- a/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
> > +++ b/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
> > @@ -612,7 +612,7 @@ static long isst_if_core_power_state(void
> > __user *argp)
> > =C2=A0		return -EINVAL;
> > =C2=A0
> > =C2=A0	if (core_power.get_set) {
> > -		if (power_domain_info->write_blocked)
> > +		if (power_domain_info->write_blocked ||
> > !capable(CAP_SYS_ADMIN))
>=20
> Hi,
>=20
> This check doesn't exist in my tree, you seem to have mis-submitted
> this=20
> independently of the other series that adds the check.

Hi llpo,

This was part of the series, which was submitted as bug fix before.
[PATCH 0/2] platform/x86: ISST: Fix for write lock and suspend/resume

I should have added this as dependency.

Thanks,
Srinivas
