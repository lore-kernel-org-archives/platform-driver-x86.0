Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1363559DE;
	Tue, 18 Nov 2025 11:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763465405; cv=none; b=CKub62HDFc7vuNoQkdAmUb6h+9Wbu36ltIwlSi1wI79UXd3YUSPukptbav15IzfwjO6zw+8sfB2IwN+XJ86uvQbx0tToYoz8VsCW9nS+SL/vQVJjStjrWYEb37iWzcxuE/ktHvP2teeUK0VBpNJvh43oxqT2PSpUoY3mkpOb+F4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763465405; c=relaxed/simple;
	bh=NyOF/+dWKA8hBUugI0oeY+Qv5kMZwGfpQ9XVCXWl+iY=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=fnVfW9BRtn7X7ibxVusBU4BvT7SlW+kvWa0QONuqgHTAdkGJVaYytiJsLR4GDdWBHXvuc0jJ6sJZXgBH2x+PSP1giW7zut2lpu8TiH6HWb748rurqtCwCiCtUpJoAHSSFQELZoKym5dXpnbE0RpDuzBnKpp/lURNBzNOxY8FlOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IPy4OIR+; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IPy4OIR+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763465403; x=1795001403;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=NyOF/+dWKA8hBUugI0oeY+Qv5kMZwGfpQ9XVCXWl+iY=;
  b=IPy4OIR+BhU/VjWmoAq1c4lhw2qyOS88aYrGUty3aCRZhk0433KqTP3H
   Nr60qbxMmLFQkUbMg0dbOVD9Ae01I7dm0jqc6HmBUgrn3PNhjBsHA1BbT
   bB96G+6rfXGAEJcNhWOHzPCMtsA89JRKKOjF+8oxBq3fkWCObfXw+sYnP
   UrBUMES+G+Qh1i7NWoWQK9kY6J66o4hczPXMMSjFX+hosrl9OA0Y03Nt9
   Uo+/yfhIj/mA5JTpa7dw/rpMC2PCnoEPjSxjA8KNsjjZ9lTVlDX5QT/f7
   NrvFOl927DKoOmkdOs1AO2znVQqB4dMxo9SH5qanvaj+ggyXFL8FoyJmj
   g==;
X-CSE-ConnectionGUID: wnhXDGcTRgKzqWbJHVz2+w==
X-CSE-MsgGUID: ZzYX6r+wRia9rE1M2LJgTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="90959852"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="90959852"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 03:30:02 -0800
X-CSE-ConnectionGUID: ZBrwVAMHTFmLtv65LMb7Hw==
X-CSE-MsgGUID: 4Z/dpBCkQBaXu9NhsAWPhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="190968227"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.74])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 03:29:58 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 18 Nov 2025 13:29:54 +0200 (EET)
To: Marco Crivellari <marco.crivellari@suse.com>
cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, 
    Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
    Frederic Weisbecker <frederic@kernel.org>, 
    Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
    Michal Hocko <mhocko@suse.com>, Maximilian Luz <luzmaximilian@gmail.com>, 
    Hans de Goede <hansg@kernel.org>
Subject: Re: [PATCH] platform/surface: acpi-notify: add WQ_PERCPU to
 alloc_workqueue users
In-Reply-To: <20251107143837.247085-1-marco.crivellari@suse.com>
Message-ID: <88c0ecd8-0d61-f4bc-ae13-cce971b9c69c@linux.intel.com>
References: <20251107143837.247085-1-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-884412383-1763464160=:1205"
Content-ID: <d9a2c349-fe9e-9d86-5e8a-5e6beb532899@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-884412383-1763464160=:1205
Content-Type: text/plain; CHARSET=ISO-8859-7
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <66f482d7-ad48-73f1-8b52-4ea3042b59dd@linux.intel.com>

On Fri, 7 Nov 2025, Marco Crivellari wrote:

> Currently if a user enqueues a work item using schedule_delayed_work() th=
e
> used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
> WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
> schedule_work() that is using system_wq and queue_work(), that makes use
> again of WORK_CPU_UNBOUND.
> This lack of consistency cannot be addressed without refactoring the API.
>=20
> alloc_workqueue() treats all queues as per-CPU by default, while unbound
> workqueues must opt-in via WQ_UNBOUND.
>=20
> This default is suboptimal: most workloads benefit from unbound queues,
> allowing the scheduler to place worker threads where they=A2re needed and
> reducing noise when CPUs are isolated.
>=20
> This continues the effort to refactor workqueue APIs, which began with
> the introduction of new workqueues and a new alloc_workqueue flag in:
>=20
> commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
> commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")
>=20
> This change adds a new WQ_PERCPU flag to explicitly request
> alloc_workqueue() to be per-cpu when WQ_UNBOUND has not been specified.
>=20
> With the introduction of the WQ_PERCPU flag (equivalent to !WQ_UNBOUND),
> any alloc_workqueue() caller that doesn=A2t explicitly specify WQ_UNBOUND
> must now use WQ_PERCPU.
>=20
> Once migration is complete, WQ_UNBOUND can be removed and unbound will
> become the implicit default.

Hi,

There's lots of words in this but it's extremely confusingly written.

On one hand, you're saying "most workloads benefit from unbound queues"=20
but then end up using percpu anyway in the actual diff!?!

If this is to support refactoring efforts, start the=20
description/justification in the changelog with that, with only a concise=
=20
explanation of the refactoring goal (you don't need to explain everything=
=20
that is already in the changelogs of the commits you refer above).

And I'd expect explanation to the forementioned inconsistency, it might be=
=20
because of the refactoring in steps. But if that's the case, you should=20
instead mention that either a) there will be a follow-up to migrate to=20
unbound where applicable (assuming it cannot be done now) or b) state=20
that this change is just to keep behavior the same and each case needs to=
=20
be evaluated once the refactoring is complete whether unbound could be=20
used or not.

Also, there's one copy-pasted typo "worqueue" in the other patches
relating to pdx86 (and likely all your other copy-pasted
descriptions to other subsystems than pdx86 ;-)).

--=20
 i.

> Suggested-by: Tejun Heo <tj@kernel.org>
> Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
> ---
>  drivers/platform/surface/surface_acpi_notify.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/platform/surface/surface_acpi_notify.c b/drivers/pla=
tform/surface/surface_acpi_notify.c
> index 3b30cfe3466b..a9dcb0bbe90e 100644
> --- a/drivers/platform/surface/surface_acpi_notify.c
> +++ b/drivers/platform/surface/surface_acpi_notify.c
> @@ -862,7 +862,7 @@ static int __init san_init(void)
>  {
>  =09int ret;
> =20
> -=09san_wq =3D alloc_workqueue("san_wq", 0, 0);
> +=09san_wq =3D alloc_workqueue("san_wq", WQ_PERCPU, 0);
>  =09if (!san_wq)
>  =09=09return -ENOMEM;
>  =09ret =3D platform_driver_register(&surface_acpi_notify);
>=20
--8323328-884412383-1763464160=:1205--
