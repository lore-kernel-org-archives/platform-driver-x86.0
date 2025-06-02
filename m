Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61EB188907
	for <platform-driver-x86@vger.kernel.org>; Mon,  2 Jun 2025 15:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748878661; cv=none; b=cK4iiQB0gFcluZrzMHYiSU3fTGMTbA4V3nMjZGesUqutRa/T+4YrCgBz4+Iepki+PpRSjz6icUjxvf2kWYNo15poP3BYTN6dVP8IdANUM/wrAHP15oo+viTSGm7UpYTQknbrGLps1ed+8RL6yoxBA+kb7gvERAYrByEGxjlkjUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748878661; c=relaxed/simple;
	bh=fGoKhDAtlZL2/gLFEmcXSfejzK/qXLcruYOJUDjXxQ0=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=bmsE2hkMDlujcR2ibicDeKcJPRf9f6+QU6yekF4R3QEZl3o0SxdgVIx9bQV/njnUlIXwF6I1AIupkiRMQb+/pjV+7M3BetX5eoJbEi2B/l1ZBlEUW3yXG4cHvYccWDvF4YQnyPTfClohte66aO9HYCztkaReJq6GjzUMczV9i+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z8pnP35M; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z8pnP35M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748878660; x=1780414660;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=fGoKhDAtlZL2/gLFEmcXSfejzK/qXLcruYOJUDjXxQ0=;
  b=Z8pnP35M5uHRADN/+TiYfDeB7FXbywjoCuXRioZzIKC+28emeCXmo2e/
   ig1yzu26gWVWqpSR9cxCbG4eLs2JQzHWEI0nj7mIAjohV0CBbG+NyoOJj
   l6uK7Vepcty5OIieoxBhCfhDQhgOfHLyu1kzEzHq7KtF5irNo8ilRIzGd
   QYfPWTyJJN58xf2vR3SCWmYgKcJ+lxGS7IRXCUCcfNkUF4VxOquSkFdR6
   UeVvPmFqmGj2LaWqXCEJJrBPqLnhzOB5jBLludZn6Th1xCE2meM4CYkMk
   vaSVKPg+UZh7gInkmxeDyii15PtTq9CMT9kCPB/RRAyU4Vxgpt51y/1gF
   g==;
X-CSE-ConnectionGUID: NIuOrxy0TiOZab1aHgCSXQ==
X-CSE-MsgGUID: W1CT3zuTQEezaPjla8lE9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="73423248"
X-IronPort-AV: E=Sophos;i="6.16,203,1744095600"; 
   d="scan'208";a="73423248"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2025 08:37:40 -0700
X-CSE-ConnectionGUID: 5W0HEdT6R5KzaUK7FxLeFg==
X-CSE-MsgGUID: VskOy7KYTvG/+QaK5yzThQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,203,1744095600"; 
   d="scan'208";a="181740523"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.134])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2025 08:37:36 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 2 Jun 2025 18:37:33 +0300 (EEST)
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, 
    "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, 
    Hans de Goede <hdegoede@redhat.com>, 
    "De Marchi, Lucas" <lucas.demarchi@intel.com>, 
    "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: RE: [PATCH 03/10] platform/x86/intel/pmt: use guard(mutex)
In-Reply-To: <IA1PR11MB64187A2A2AD7E977C579745CC162A@IA1PR11MB6418.namprd11.prod.outlook.com>
Message-ID: <267e6423-9a3d-1c84-4feb-72ffb22c72fb@linux.intel.com>
References: <20250530203356.190234-1-michael.j.ruhl@intel.com> <20250530203356.190234-3-michael.j.ruhl@intel.com> <e56d6195-6f70-d788-225a-a6438dfda10d@linux.intel.com> <IA1PR11MB64187A2A2AD7E977C579745CC162A@IA1PR11MB6418.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1382814347-1748878653=:1043"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1382814347-1748878653=:1043
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 2 Jun 2025, Ruhl, Michael J wrote:

> >-----Original Message-----
> >From: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>
> >Sent: Saturday, May 31, 2025 1:24 AM
> >To: Ruhl, Michael J <michael.j.ruhl@intel.com>
> >Cc: platform-driver-x86@vger.kernel.org; intel-xe@lists.freedesktop.org;=
 Hans
> >de Goede <hdegoede@redhat.com>; De Marchi, Lucas
> ><lucas.demarchi@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>
> >Subject: Re: [PATCH 03/10] platform/x86/intel/pmt: use guard(mutex)
> >
> >On Fri, 30 May 2025, Michael J. Ruhl wrote:
> >
> >> Update the mutex paths to use the new guard() mechanism.
> >>
> >> With the removal of goto, do some minor cleanup of the current
> >> logic path.
> >>
> >> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> >> ---
> >>  drivers/platform/x86/intel/pmt/crashlog.c | 32 +++++++++++-----------=
-
> >>  1 file changed, 15 insertions(+), 17 deletions(-)
> >>
> >> diff --git a/drivers/platform/x86/intel/pmt/crashlog.c
> >b/drivers/platform/x86/intel/pmt/crashlog.c
> >> index d40c8e212733..c6d8a7a61d39 100644
> >> --- a/drivers/platform/x86/intel/pmt/crashlog.c
> >> +++ b/drivers/platform/x86/intel/pmt/crashlog.c
> >> @@ -155,9 +155,9 @@ enable_store(struct device *dev, struct
> >device_attribute *attr,
> >>  =09if (result)
> >>  =09=09return result;
> >>
> >> -=09mutex_lock(&entry->control_mutex);
> >> +=09guard(mutex)(&entry->control_mutex);
> >> +
> >>  =09pmt_crashlog_set_disable(&entry->entry, !enabled);
> >> -=09mutex_unlock(&entry->control_mutex);
> >>
> >>  =09return count;
> >>  }
> >> @@ -189,26 +189,24 @@ trigger_store(struct device *dev, struct
> >device_attribute *attr,
> >>  =09if (result)
> >>  =09=09return result;
> >>
> >> -=09mutex_lock(&entry->control_mutex);
> >> +=09guard(mutex)(&entry->control_mutex);
> >>
> >>  =09if (!trigger) {
> >>  =09=09pmt_crashlog_set_clear(&entry->entry);
> >> -=09} else if (pmt_crashlog_complete(&entry->entry)) {
> >> -=09=09/* we cannot trigger a new crash if one is still pending */
> >> -=09=09result =3D -EEXIST;
> >> -=09=09goto err;
> >> -=09} else if (pmt_crashlog_disabled(&entry->entry)) {
> >> -=09=09/* if device is currently disabled, return busy */
> >> -=09=09result =3D -EBUSY;
> >> -=09=09goto err;
> >> -=09} else {
> >> -=09=09pmt_crashlog_set_execute(&entry->entry);
> >> +=09=09return count;
> >>  =09}
> >>
> >> -=09result =3D count;
> >> -err:
> >> -=09mutex_unlock(&entry->control_mutex);
> >> -=09return result;
> >> +=09/* we cannot trigger a new crash if one is still pending */
> >> +=09if (pmt_crashlog_complete(&entry->entry))
> >> +=09=09return -EEXIST;
> >> +
> >> +=09/* if device is currently disabled, return busy */
> >> +=09if (pmt_crashlog_disabled(&entry->entry))
> >> +=09=09return -EBUSY;
> >> +
> >> +=09pmt_crashlog_set_execute(&entry->entry);
> >> +
> >> +=09return count;
> >>  }
> >>  static DEVICE_ATTR_RW(trigger);
> >
> >Thanks, the control flow is very straightforward after this change.
>=20
> Checking for the disable bit after checking for the complete doesn't real=
ly make sense to me,=20
> but I was concerned with "changing" the user experience...
>=20
> Is this something that can be "updated"? (i.e. swapping the complete and =
disabled checks),

TBH, I wouldn't worry over changing the precedence of returned error=20
codes so just go ahead with that change (but please make it in a=20
separate patch so it would be easy to revert in the very unlikely case=20
that somebody depends on the old behavior).

> >Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>
>=20
> Thanks!
>=20
> M
>=20
> >
> >
> >--
> > i.
>=20

--=20
 i.

--8323328-1382814347-1748878653=:1043--
