Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67746202630
	for <platform-driver-x86@vger.kernel.org>; Wed, 13 Nov 2024 18:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731523245; cv=none; b=oNJHAAbwYKCJu5wXyZT3FMz9DkP0em4T4aKDeoouUNya2XwA+wFZJVnw7Dp4QHu3q4Y+DEPk8WYXC7etCFEOQ4Ez6N6Fy/Eb+gFNrOzV0/WYu5fM2LpRegCvp0U9bCbkq+wc7yOzzTorlBYXTm9ouqbk/vMsrz3q2mIMLqhQWps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731523245; c=relaxed/simple;
	bh=/aLAoab8zZ/hwUS1A5+RAugz7lXWkG8v6QZ80f/cbqc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=l1VR/XAIkNJhrn+++Ip2G26wfEehOQQN/1x6xoJtR0uAxMFFYNkTIYCSp6Ie3qY58mYCgsT5bKCLiyXVU4uKoMGbTsWMiD2rQzMGXL+dNUdt6OWziFNmT8A+DYISCfTINc1VVLXob25OC5mjmSMUWJaSAgclZDkSk+1GBiQkIFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pc3abxcV; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pc3abxcV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731523243; x=1763059243;
  h=message-id:subject:from:reply-to:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=/aLAoab8zZ/hwUS1A5+RAugz7lXWkG8v6QZ80f/cbqc=;
  b=Pc3abxcVMPJtdUKiUubd/xKqMN9CCk3SHwmrqQWhzGWQs66lqDgHZ8UE
   g3ZOPT7AVIZJti15Ma3aWtdNC8u+3eoK7jdPopZ8mwcR5vx739k02Gj/I
   ExCi1HlTRWyIFLupruAadE5a/j/bh4vxZjUNGR+9JQgTCj526Ex3Z/0tv
   wlafboHMlCYOTXQN495ZWh212AFV2wBQBKtiIr0ot1MmbeufDzaXxR5kl
   Iy4RnH3BoOy8DjOxVI26dsiS+w/9jTk+1FNkDi6SUGujHOrhlYrQyi1PK
   JDderSXJO1E08UCYe5Qevw6n+TP47Wq4RI+1+op+DHGrIm9gAXnABDct8
   w==;
X-CSE-ConnectionGUID: UJRSGgERSAOlrOsRas7iJg==
X-CSE-MsgGUID: WYUvGJxaQ/GtFl0mKxkhsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31398020"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="31398020"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 10:40:43 -0800
X-CSE-ConnectionGUID: MKZGoaaqSn2tiGd7jRWfXA==
X-CSE-MsgGUID: 5bj9g0tmQJaImklWbHV9uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,151,1728975600"; 
   d="scan'208";a="125470038"
Received: from dnelso2-mobl.amr.corp.intel.com ([10.125.111.242])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 10:40:43 -0800
Message-ID: <7e22fc28bd8d81d42c75166b8792eaf0d856a413.camel@linux.intel.com>
Subject: Re: [PATCH v2 0/2] Support BMG PMT features for Xe
From: "David E. Box" <david.e.box@linux.intel.com>
Reply-To: david.e.box@linux.intel.com
To: Ilpo =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "Michael J. Ruhl" <michael.j.ruhl@intel.com>, 
 intel-xe@lists.freedesktop.org, platform-driver-x86@vger.kernel.org, Hans
 de Goede <hdegoede@redhat.com>, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com
Date: Wed, 13 Nov 2024 10:40:42 -0800
In-Reply-To: <23fe9eca-ebd3-4098-22ab-d21434026273@linux.intel.com>
References: <20241112163035.2282499-1-michael.j.ruhl@intel.com>
	 <ZzSBpq2IakMrvV6h@smile.fi.intel.com>
	 <23fe9eca-ebd3-4098-22ab-d21434026273@linux.intel.com>
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

On Wed, 2024-11-13 at 15:52 +0200, Ilpo J=C3=A4rvinen wrote:
> On Wed, 13 Nov 2024, Andy Shevchenko wrote:
>=20
> > On Tue, Nov 12, 2024 at 11:30:33AM -0500, Michael J. Ruhl wrote:
> > > Updates for PMT to support user offsets from the sysfs API.
> > >=20
> > > Addressed review comments for the Xe driver udpates.
> >=20
> > FWIW,
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> >=20
> > If you have wish and time, there are problems with the drivers of diffe=
rent
> > severities (from "fine as is" to "good to be fixed, but okay as is") I =
have
> > noticed so far:
> > - it uses s*printf() instead of sysfs_emit*()
> > - it most likely never tested the corner cases. e.g.,
> >=20
> > 	if (disc_res->start >=3D pci_resource_start(pci_dev, i) &&
> > 	=C2=A0=C2=A0=C2=A0 (disc_res->start <=3D pci_resource_end(pci_dev, i))=
) {
> >=20
> > =C2=A0 what is this supposed to mean? Probably someone wanted resource_=
contains()
> > or
> > =C2=A0 alike to be called here.

This is a corner case that occurs for devices that are non-compliant, in th=
is
case meaning devices that don't follow our PMT spec convention of specifyin=
g
which BAR an address belongs to. Without this information, we have to deduc=
e the
BAR manually to access other needed registers that are offset from the base=
 of
that BAR.

I can change this to use resource_contains().

> > - slightly above the above piece the for-loop
> >=20
> > 	for (i =3D 0; i < 6; i++)
> >=20
> > =C2=A0 which probably want to use PCI_STD_RESOURCE_END)
>=20
> While both work, in practice PCI_STD_NUM_BARS is way more common than=20
> PCI_STD_RESOURCE_END.
>=20

Will change this too. Thanks.

David
