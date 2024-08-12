Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92D213BC02
	for <platform-driver-x86@vger.kernel.org>; Mon, 12 Aug 2024 09:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723454564; cv=none; b=DSZXJLxHfgYdvYUG5Mkh1E3VS/xuZL+H6Nw8wM/TfFf3Y1erEwu/vXfVbtLvhR25ohyIc3aAsEMGgvbWJaBu85LNUTqA4nvhxuv9S0s1zjC6CdckJARs9zM+JPLpX5Xxx0OX67eNs9o210sZbxNKkyWSfCXlRGQtGct05KUlpMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723454564; c=relaxed/simple;
	bh=5kOWTQs9LkDBQ3UAPdkHffzhhqcHmgIW+dmYbpmZagI=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=D7vVzqLByS+8c0TnHoMChuNEv9zgfIIDOe7m9v/jo2WvmH+DPFUW5HadBeJowXfO7ASU9splplpVLYFCX0pIm9FRiLaokNOfGfwYb6n/s0LjvZbbYmqyqNgdmMs+O/hNHMZr8gDn9h0AKA+JSlnJBBJ/oPtU9buIHiXEud+Abok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AzNrEKxv; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AzNrEKxv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723454563; x=1754990563;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=5kOWTQs9LkDBQ3UAPdkHffzhhqcHmgIW+dmYbpmZagI=;
  b=AzNrEKxvYfqyjh/ZFlmxSF2OQuOtxTS07+D6QE6GqL3Lv/ksyuxIiwTR
   bq3nccWd3XbLHN+eR8yxtCpdQxwvTLsUxrhUPi+DkB3a1R1SKMA715vv5
   p34cQNC4FfN+iIo5FO3o71AhQRem+i2en46RpfCrhrmhLNW1VUGOJtH7A
   6smWIc/1O0dWTEvuu5DLncg/tcADA0CtSz3fdSGkwgShocS3VsnnGsNeM
   kaEJFt6DM9uObmO6CalqSVfO3MxrOZoWMSp28GwY2s6L0/kxZil3lsdJs
   uNnPKtchN2i1FhCQd9kUurx1sgZ+ruRAhBnIxBMt5mHbEkuTSRrqj1F3X
   Q==;
X-CSE-ConnectionGUID: CxC1YYNpTEWvhAa7118aTQ==
X-CSE-MsgGUID: YHo6q9hnQ++++z2J738zhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11161"; a="21404587"
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; 
   d="scan'208";a="21404587"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2024 02:22:43 -0700
X-CSE-ConnectionGUID: ZtqKSWqJRLG5RHbdsyb1vg==
X-CSE-MsgGUID: 0q04ll+zSQ+JtOOp6NxV1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; 
   d="scan'208";a="58915208"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.244.25])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2024 02:22:39 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 12 Aug 2024 12:22:36 +0300 (EEST)
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>, 
    Hans de Goede <hdegoede@redhat.com>
cc: "david.e.box@linux.intel.com" <david.e.box@linux.intel.com>, 
    "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, 
    "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, 
    "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, 
    "Brost, Matthew" <matthew.brost@intel.com>, 
    "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
Subject: RE: [PATCH v9 5/6] platform/x86/intel/pmt: Add support for PMT base
 adjust
In-Reply-To: <IA1PR11MB64188E3342EB3C26BC30EDD5C1BA2@IA1PR11MB6418.namprd11.prod.outlook.com>
Message-ID: <ed0c857f-9224-4495-bd24-4ad9bc0e7aee@linux.intel.com>
References: <20240725122346.4063913-1-michael.j.ruhl@intel.com>  <20240725122346.4063913-6-michael.j.ruhl@intel.com>  <e70a44a24b1404a000e302a444a41c286538f3f9.camel@linux.intel.com>  <ZrUyH6vZpShdacjx@intel.com> <fe23eb2ef30e4a867668a221f3f02dbe9d322edc.camel@linux.intel.com>
 <IA1PR11MB64188E3342EB3C26BC30EDD5C1BA2@IA1PR11MB6418.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-1485091447-1723454000=:1039"
Content-ID: <19b16c69-62a7-f94f-b37e-cf45a213db60@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1485091447-1723454000=:1039
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <372539f3-34b3-e16c-1959-42a940a20859@linux.intel.com>

On Fri, 9 Aug 2024, Ruhl, Michael J wrote:

> > -----Original Message-----
> > From: David E. Box <david.e.box@linux.intel.com>
> > Sent: Thursday, August 8, 2024 8:57 PM
> > To: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> > Cc: Ruhl, Michael J <michael.j.ruhl@intel.com>; intel-xe@lists.freedesk=
top.org;
> > platform-driver-x86@vger.kernel.org; ilpo.jarvinen@linux.intel.com; Bro=
st,
> > Matthew <matthew.brost@intel.com>; andriy.shevchenko@linux.intel.com
> > Subject: Re: [PATCH v9 5/6] platform/x86/intel/pmt: Add support for PMT
> > base adjust
> >=20
> > On Thu, 2024-08-08 at 17:01 -0400, Rodrigo Vivi wrote:
> > > On Thu, Aug 08, 2024 at 12:49:58PM -0700, David E. Box wrote:
> > > > Hi Mike
> > > >
> > > > On Thu, 2024-07-25 at 08:23 -0400, Michael J. Ruhl wrote:
> > > > > DVSEC offsets are based on the endpoint BAR.=A0 If an endpoint is
> > > > > not available allow the offset information to be adjusted by the
> > > > > parent driver.
> > > >
> > > > I know I wrote the original version of these patches but I no longe=
r
> > > > like this solution. The s32 is too small for a 64 bit address and
> > > > calculating the offset just to add it back in the PMT driver is
> > > > unnecessary.
> > >
> > > yeap, 64bit sounds better indeed.
> > >
> > > > Instead, I sent you
> > > > replacement patches for 5 and 6 that allow passing the telemetry
> > > > region address directly to the PMT driver.
> > >
> > > Was these replacements sent straight to PMT list or to Mike so he can
> > > adjust the series?
> > >
> > > I'm wondering if we should merge this through our drm-xe-next or
> > > through PMT channels. Thoughts?
> > >
> > > In any case, ack from my side to get the xe patches merged together
> > > through PMT.
> > >
> > > But if someone prefer to get this merged through drm-xe-next, then we
> > > need to act fast and get this ready with the final patches and acked
> > > by you PMT maintainers, in the next 2 weeks because our window under
> > > drm closes much earlier.
> > >
> > > Around 6.11-rc5 is when we close the drm window towards 6.12 and we
> > > are almost within 6.11-rc3.
> > >
> > > Thoughts?
> >=20
> > For me Patches 1-4 are good to go for BMG support. Patches 5 and 6 add =
DG2
> > support but need some work. They should wait.
>=20
>=20
> David, Ilpo,
>=20
> The DG2 patches are a nice to have.
>=20
> Please take patch 1 - 4.
>=20
> I will revisit 5 and 6 (with David's suggested changes) in the future.

Hans is the one handling pdx86 for-next patches in this cycle (we as the=20
pdx86 maintainers alternate it on every other kernel release). Please=20
remember to add him into receipient list when you send the next version
with my comments on 4th patch addressed (always include all relevant=20
maintainers when sending patches).

--=20
 i.
--8323328-1485091447-1723454000=:1039--
