Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4009149659;
	Mon, 15 Dec 2025 20:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765830262; cv=none; b=B1hPr90xw3ev/kJtv9zUpOQgaGmfRM2u/oa2hW5dk99ylCEs+fOh+hYUcvz4/KwGEt+qTKnp5m2UkX9oWW4VYR+7+5N6kjdR+4d9H94z+BUSqKz89arpBPlUe8ZcPKJV7B1dyvmf+4PHP/q6RTFGQJ0Erh4ROJO44rfRkCFC99o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765830262; c=relaxed/simple;
	bh=FNmRZFnWA5n3f+Uwy8v6wiC/MBZR/8QM2k+5uzX9tAA=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=rscCXwb3jJXoAIgdT56hyI5exskgqcvrM9Fpz5QofxHSTPAXVXQOiAEU1Imbc/RUnMxf49dSmN2eDpBgJbMsSl61PAkum/AQKfKuETJk2a2bTxK42Pd75aZ7pCkn8lTKK0tDALTQ8/OFLn4SW8NiIqeaYv21TlM2YkofrsL9FTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TjRDtQN6; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TjRDtQN6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765830260; x=1797366260;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=FNmRZFnWA5n3f+Uwy8v6wiC/MBZR/8QM2k+5uzX9tAA=;
  b=TjRDtQN6/Jt/fFLnLht9JxPPx2AUniDWlDaP9Fx/fSuoGcqpB2g5PKKT
   0O8JqJtZ6gYVrraG8buP8DPG1opIibW06aHuuUeR3TojZaUCpd2GwrQbu
   p4yEEGn4cLB7Z4m89jPNDcOGOiImmNpiOc4ctVQ7+j43WObPoTrOI1Q3F
   fnZoxlFf8tbBAi6K+dIJ3iUk9BAbq0Xmel/7ixcvKfBKchNguqhzco88Q
   9l7J37o/Cjorqo1GCsiHT5vuN+MUPRPGsuTfeGnmPyg4o8WO5nU3c9E6A
   iWwwcZquWlF8NfeWEf2yfguES0T66rg96DZ9NmIGp6Fp3hfPohKCCruBX
   A==;
X-CSE-ConnectionGUID: iE5a9ckDQB+2jH30A7oEKg==
X-CSE-MsgGUID: YHaULAltSZiKhtALD/MU8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="66731834"
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="66731834"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 12:24:19 -0800
X-CSE-ConnectionGUID: sYPFoeX+Ql2iKBtO7a1wiw==
X-CSE-MsgGUID: JQ1GbqqMQIOYnbqkcRccQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="197093045"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.115])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 12:24:17 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 15 Dec 2025 22:24:13 +0200 (EET)
To: Randy Dunlap <rdunlap@infradead.org>
cc: LKML <linux-kernel@vger.kernel.org>, 
    "David E. Box" <david.e.box@linux.intel.com>, 
    Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH] platform/x86/intel/vsec: correct kernel-doc comments
In-Reply-To: <272b0029-66ce-40b3-8f87-a24eee06f844@infradead.org>
Message-ID: <a130efc0-c420-d492-ca17-c151d4d475d5@linux.intel.com>
References: <20251214201959.2195863-1-rdunlap@infradead.org> <cac479ad-e258-fb20-8005-3155e4a7f901@linux.intel.com> <c6198da4-c596-4ed7-b4a4-f43046cca34c@infradead.org> <0a353eb3-094c-5c34-89e8-20e0678c1f94@linux.intel.com>
 <272b0029-66ce-40b3-8f87-a24eee06f844@infradead.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-759121316-1765830253=:1225"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-759121316-1765830253=:1225
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 15 Dec 2025, Randy Dunlap wrote:
> On 12/15/25 11:21 AM, Ilpo J=C3=A4rvinen wrote:
> > On Mon, 15 Dec 2025, Randy Dunlap wrote:
> >=20
> >> Hi Ilpo,
> >>
> >> On 12/15/25 6:10 AM, Ilpo J=C3=A4rvinen wrote:
> >>> On Sun, 14 Dec 2025, Randy Dunlap wrote:
> >>>
> >>>> Fix kernel-doc warnings in intel_vsec.h to eliminate all kernel-doc
> >>>> warnings:
> >>>>
> >>>> Warning: include/linux/intel_vsec.h:92 struct member 'read_telem' no=
t
> >>>>  described in 'pmt_callbacks'
> >>>> Warning: include/linux/intel_vsec.h:146 expecting prototype for stru=
ct
> >>>>  intel_sec_device.  Prototype was for struct intel_vsec_device inste=
ad
> >>>> Warning: include/linux/intel_vsec.h:146 struct member 'priv_data_siz=
e'
> >>>>  not described in 'intel_vsec_device'
> >>>>
> >>>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> >>>> ---
> >>>> Cc: David E. Box <david.e.box@linux.intel.com>
> >>>> Cc: Hans de Goede <hansg@kernel.org>
> >>>> Cc: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> >>>> Cc: platform-driver-x86@vger.kernel.org
> >>>> ---
> >>>>  include/linux/intel_vsec.h |    7 ++++---
> >>>>  1 file changed, 4 insertions(+), 3 deletions(-)
> >>>>
> >>>> --- linux-next-20251201.orig/include/linux/intel_vsec.h
> >>>> +++ linux-next-20251201/include/linux/intel_vsec.h
> >>>> @@ -80,8 +80,8 @@ enum intel_vsec_quirks {
> >>>> =20
> >>>>  /**
> >>>>   * struct pmt_callbacks - Callback infrastructure for PMT devices
> >>>> - * ->read_telem() when specified, called by client driver to access=
 PMT data (instead
> >>>> - * of direct copy).
> >>>> + * @read_telem: when specified, called by client driver to access P=
MT
> >>>> + * data (instead of direct copy).
> >>>>   * @pdev:  PCI device reference for the callback's use
> >>>>   * @guid:  ID of data to acccss
> >>>>   * @data:  buffer for the data to be copied
> >>>
> >>> Is it correct for kerneldoc to have the rest as @pdev, @guid, etc.,
> >>> they are parameters to the callback, not members of this struct?
> >>
> >> No, it's not correct. We get away with it in several kernel source fil=
es
> >> because scripts/kernel-doc doesn't check/notice that.
> >>
> >> Would you prefer to have them there but without the leading '@' sign?
> >> Or completely delete those lines?
> >> IMO they are useful/informative, so I would rather not delete them.
> >=20
> > Can we use some * * formatting trick to them as well as remove the @. I=
'm=20
> > not sure how kernel doc deals with formatting * * within the parameters=
=20
> > paragraph but if it works like in return formatting, I guess that would=
=20
> > seem like the most useful approach.
> >=20
> > If it doesn't work, then just remove @, I think.
>=20
> [testing]
>=20
> The struct members are not formatted like Returns: formatting.

Thanks for testing. Lets go with example b, that looks most readable out=20
of the options.

> a. If I just drop the at-sign, the struct member descriptions all run
> together, no breaks between them. Not acceptable IMO.
>=20
> b. If I use "* *" before each struct member, the struct member
> descriptions still run together but there is a "*" separator
> character between them.
>=20
> c. If I end each struct member description with a '.' (just one
> leading '*'), the struct member descriptions run together but
> there is an ending '.' between them.
>=20
> d. If I use "* @member" for each struct member, kernel-doc seems
> to ignore those lines completely. No output is produced for those
> lines.
>=20
> So I think we are down to using "* *" for each struct member or
> using "* member: Description." so that there is a separator between
> each struct member description. Do you have a preference?
>=20
> Example for b:
>=20
>        read_telem  when  specified,  called by client driver to access PM=
T data
>                    (instead of direct copy).  * pdev:  PCI device referen=
ce for
>                    the callback's use * guid:  ID of data  to  acccss  * =
 data:
>                    buffer  for  the  data to be copied * off:   offset in=
to the
>                    requested buffer * count: size of buffer
>=20
> Example for c:
>=20
>        read_telem  when  specified,  called by client driver to access PM=
T data
>                    (instead of direct copy).  pdev:  PCI device  referenc=
e  for
>                    the  callback's  use.   guid:   ID of data to acccss. =
 data:
>                    Buffer for the data to be copied.  off:    Offset  int=
o  the
>                    requested buffer.  count: Size of buffer.
>=20
> Or we could just drop the patch if you don't care for any of these.
>=20
> thanks.
>=20

--=20
 i.

--8323328-759121316-1765830253=:1225--
