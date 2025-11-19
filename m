Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167BE346FA4;
	Wed, 19 Nov 2025 10:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763548739; cv=none; b=uo2sWxToyzdLH+e0VzIEBn+oU+FEOVIEQTUKkBCcBxlHiUF0vod1O6qeyX6D7M9BlqLZNosgqC/+NXoghieX+i5n0Bpr50jL0yomRDK2VEcyyrPoxoolk0Sh169dyWvGRsBKZ5GFVOjs44dwnzuZRJg43Y9ruPtj7vVJWZNwd78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763548739; c=relaxed/simple;
	bh=0RhvFd+zRNc/rXZ4YeZPNgBoDkHRYlDmuRsepA5UXL8=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=b3f0k1wSXXc7LSZBo5Ne5SeKq7GBl5BPB/hpJ4Rrbc5NvKbHjSt+vtJgv9NSJCm17sZcviMHEmAeM29h5DIg6ppA+sSA73uo+EyGB7NvyKuPFxpAAUn8wfxPSpPwCbBD05JP+FiiJG190hmxq7OIUa66M/G3V07TqYYnZoRT8Hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QNWBzlv1; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QNWBzlv1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763548738; x=1795084738;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=0RhvFd+zRNc/rXZ4YeZPNgBoDkHRYlDmuRsepA5UXL8=;
  b=QNWBzlv1hEQGQDhHkcFXpQnQZ+YWXM1zV0TCBL9hmFu9uUBTGvDhayo7
   TuGDDfue7mSXOioDIVtpRl+3CvfCg9L1lMXP0D8bFeTyqTOdOpEPqsTMH
   Eucru7AONIzzSY72NjFL8hm0fojqc9al3X01zcuddhfSdzUOwpgDo8PKJ
   QZD6JnEBWYHO1y//yKQXda7HjRT31VDqSllwwjOK/+z8M1+aLRmz/tH3e
   vw+ZaZgLaxwSmaWTuj9z1lMUhOqVVGH7OH7Wybo092f5qOp9nja8xqPUx
   IskNxqXN7OADUOgPnWCJH8mVsR8wjelkKTKBx5xxSjxSILQgj4ZfEl91u
   g==;
X-CSE-ConnectionGUID: vumdRNE6R8SNmAlaYFULBQ==
X-CSE-MsgGUID: HbjQo4jORiey/c59pxjkHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="88238675"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="88238675"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 02:38:57 -0800
X-CSE-ConnectionGUID: eNZmq1SqRZevuYwO8PvJfQ==
X-CSE-MsgGUID: I6IagunqSVO0uxG+TQZ8Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="196151872"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.220])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 02:38:54 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 19 Nov 2025 12:38:49 +0200 (EET)
To: Marco Crivellari <marco.crivellari@suse.com>
cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, 
    Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
    Frederic Weisbecker <frederic@kernel.org>, 
    Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
    Michal Hocko <mhocko@suse.com>, Maximilian Luz <luzmaximilian@gmail.com>, 
    Hans de Goede <hansg@kernel.org>
Subject: Re: [PATCH] platform/surface: acpi-notify: add WQ_PERCPU to
 alloc_workqueue users
In-Reply-To: <CAAofZF7GhnQ6nQyvLSbTPOv-k4Y=nM9BvoRNRJOA53bbWLo70g@mail.gmail.com>
Message-ID: <bc69382e-c409-11f8-a278-d93d0f68ab1b@linux.intel.com>
References: <20251107143837.247085-1-marco.crivellari@suse.com> <88c0ecd8-0d61-f4bc-ae13-cce971b9c69c@linux.intel.com> <CAAofZF52hxs_UbA+WkaugNceotzPMisziBj0+AKoL+X0pNrQbg@mail.gmail.com> <1db6c690-ca7b-5b68-c2f6-0d8b79c31880@linux.intel.com>
 <CAAofZF7GhnQ6nQyvLSbTPOv-k4Y=nM9BvoRNRJOA53bbWLo70g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-1225671626-1763548374=:970"
Content-ID: <23dfe394-c2a0-fdfa-cec1-03e0baa55893@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1225671626-1763548374=:970
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <e267fb8e-83fd-634d-abdf-5d764bca7f6e@linux.intel.com>

On Wed, 19 Nov 2025, Marco Crivellari wrote:

> On Tue, Nov 18, 2025 at 3:43=E2=80=AFPM Ilpo J=C3=A4rvinen
> <ilpo.jarvinen@linux.intel.com> wrote:
> > [...]
> > > What do you think, is it better in this way?
> >
> > Still quite non-specific to this particular change.
> >
> > > "
> > > This continues the effort to refactor workqueue APIs, which began wit=
h
> > > the introduction of new workqueues and a new alloc_workqueue flag in:
> > >
> > > commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_=
wq")
> > > commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")
> > >
> >
> > The refactoring is going to alter the default behavior of ...
> > [*].
> >
> > > For more details see the Link tag below.
> >
> >
> >
> > > This change adds a new WQ_PERCPU flag to explicitly request
> >
> > This change doesn't add a new flag, "explicitly request" part is correc=
t
> > though but as written things are mixed up.
> >
> > I'd just replace this paragraph and the next with something much simple=
r
> > and more to the point:
> >
> > "In order to keep alloc_workqueue() behavior identical, explicitly requ=
est
> > WQ_PERCPU."
> >
> > > alloc_workqueue() to be per-cpu when WQ_UNBOUND has not been specifie=
d.
> > >
> > > With the introduction of the WQ_PERCPU flag (equivalent to !WQ_UNBOUN=
D),
> > > any alloc_workqueue() caller that doesn=E2=80=99t explicitly specify =
WQ_UNBOUND
> > > must now use WQ_PERCPU.
> >
> > This belongs earlier to description of the refactoring (to [*]).
> >
> > > Once migration is complete, WQ_UNBOUND can be removed and unbound wil=
l
> > > become the implicit default.
> >
> > This is irrelevant detail about refactoring since WQ_PERCPU is used her=
e.
>=20
> Thanks for the suggestions, I think it should be ok now:
>=20
> This continues the effort to refactor workqueue APIs, which began with
> the introduction of new workqueues and a new alloc_workqueue flag in:
>=20
> commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
> commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")
=20


> The refactoring is going to alter the default behavior of
> alloc_workqueue() to be per-cpu when WQ_UNBOUND has not been specified.

This looks still wrong! In 930c2ea566af ("workqueue: Add new WQ_PERCPU=20
flag") you write: "WQ_UNBOUND can be removed and unbound will become the=20
implicit default".

So after refactoring, WQ_UNBOUND cannot be specified as it has been
removed AND the default behavior is "unbound", not "per-cpu", right?

So it should be other way around, e.g.:

The refactoring is going to alter the behavior of alloc_workqueue() to be
unbound by default.


> With the introduction of the WQ_PERCPU flag (equivalent to !WQ_UNBOUND),
> any alloc_workqueue() caller that doesn=E2=80=99t explicitly specify WQ_U=
NBOUND
> must now use WQ_PERCPU.
> For more details see the Link tag below.

Please reflow the paragraphs normally (no mid-paragraph short lines).

>=20
> In order to keep alloc_workqueue() behavior identical, explicitly request
> WQ_PERCPU.
>=20
>=20
> If it sounds good I will send the v2.


--=20
 i.
--8323328-1225671626-1763548374=:970--
