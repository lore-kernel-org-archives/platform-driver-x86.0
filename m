Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B614239E81;
	Wed, 19 Nov 2025 11:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763550740; cv=none; b=tcTop+gbL/jMQB5YZHhCXIxGVEEP65bMdHxO9J1aS3SG/PB+nBH2tc6OaoS0u6K0hxAV4F97EiSX5DfGZowp51B50Go3gYyUQoo6csEEy0Ldhpw37OAdY1REqCSzjGpm0z0OM8puEI3gFjLGKK4wG7HnvCXLSHPTP1twCVpjMUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763550740; c=relaxed/simple;
	bh=1E1hRglUNgmqWfWrgvr1e/6PtUy0rshZ2yaBHkZoRsU=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=cnvqQeCGAO51FC/yMxT/W5NVRMtKg1bLlCMlQnQugqz+eQgqZ6QLmbYSrIjqhSjXV78txkbaqpCdf7YsKklpQQZvt16y83EHr7C6kV+xfTrZdzPPWswtQsQJ5mj0F99HuHHWqnrzKI0AyNI8v8ZVdhbV7yNvWuVl5mOldR51JaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KR9np/LY; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KR9np/LY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763550738; x=1795086738;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=1E1hRglUNgmqWfWrgvr1e/6PtUy0rshZ2yaBHkZoRsU=;
  b=KR9np/LYq1xpjCtsblKjQMDse6OXjFZa6HBgjpd6Zp7bZ9+Wwg82pGPg
   +NAVNTgYbn5cT6Lp+2abo8/532LD11Iyd9/5T3bXoqdsMGVceG2fFFxMm
   gR1yJgEl+Nwnh9/6rD0eegRXfm9sbETke0K+qgTZd8CsuyNAYU58YoVQc
   RMvBK0KnpljIuY/1WJ6z1Ct5JhRdjR4P4mXDtbUwuZPLgmE8kFXKY2X+f
   /6uYF20BiS2RFy6A5DlxIFMnCEgZ4jailkpO9CbyRo09E+vEdoI4h08xc
   TmUVg8YZC8oQ4nGTgtF+kHKlQfEJIYn1nu1I3sL7F7xEoIbeNIgR/vbRM
   Q==;
X-CSE-ConnectionGUID: IRt/clIaR4isLxKXTSVRKg==
X-CSE-MsgGUID: fYo6vrb3Su2E3nJDH92kTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="76693865"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="76693865"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 03:12:17 -0800
X-CSE-ConnectionGUID: o3AAG9N8Qjqu1DFuFRie0A==
X-CSE-MsgGUID: Lv7qXdZ1QHKdDejrjmCEfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="190824595"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.220])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 03:12:13 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 19 Nov 2025 13:12:09 +0200 (EET)
To: Marco Crivellari <marco.crivellari@suse.com>
cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, 
    Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
    Frederic Weisbecker <frederic@kernel.org>, 
    Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
    Michal Hocko <mhocko@suse.com>, Maximilian Luz <luzmaximilian@gmail.com>, 
    Hans de Goede <hansg@kernel.org>
Subject: Re: [PATCH] platform/surface: acpi-notify: add WQ_PERCPU to
 alloc_workqueue users
In-Reply-To: <CAAofZF7GwRKQcNAUK9=j4mqnz+HX_ONG9YKs4PLztbjvJxrxZg@mail.gmail.com>
Message-ID: <324dfca8-8f16-158c-8fb9-8efb52eff4ac@linux.intel.com>
References: <20251107143837.247085-1-marco.crivellari@suse.com> <88c0ecd8-0d61-f4bc-ae13-cce971b9c69c@linux.intel.com> <CAAofZF52hxs_UbA+WkaugNceotzPMisziBj0+AKoL+X0pNrQbg@mail.gmail.com> <1db6c690-ca7b-5b68-c2f6-0d8b79c31880@linux.intel.com>
 <CAAofZF7GhnQ6nQyvLSbTPOv-k4Y=nM9BvoRNRJOA53bbWLo70g@mail.gmail.com> <bc69382e-c409-11f8-a278-d93d0f68ab1b@linux.intel.com> <CAAofZF7GwRKQcNAUK9=j4mqnz+HX_ONG9YKs4PLztbjvJxrxZg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-936467615-1763549979=:970"
Content-ID: <0b00a2c2-6a12-6d80-7ca1-355c92f55052@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-936467615-1763549979=:970
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <3281b827-21a8-3562-6f59-ed9ea9d6bfb4@linux.intel.com>

On Wed, 19 Nov 2025, Marco Crivellari wrote:

> On Wed, Nov 19, 2025 at 11:38=E2=80=AFAM Ilpo J=C3=A4rvinen
> <ilpo.jarvinen@linux.intel.com> wrote:
> > [...]
> > So after refactoring, WQ_UNBOUND cannot be specified as it has been
> > removed AND the default behavior is "unbound", not "per-cpu", right?
> > So it should be other way around, e.g.:
> >
> > The refactoring is going to alter the behavior of alloc_workqueue() to =
be
> > unbound by default.
>=20
> Yes, it makes sense. I changed that part.
>=20
> This is the updated version:
>=20
> This continues the effort to refactor workqueue APIs, which began with
> the introduction of new workqueues and a new alloc_workqueue flag in:
>=20
> commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
> commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")
>=20
> The refactoring is going to alter the default behavior of
> alloc_workqueue() to be unbound by default.
>=20
> With the introduction of the WQ_PERCPU flag (equivalent to !WQ_UNBOUND),
> any alloc_workqueue() caller that doesn=E2=80=99t explicitly specify WQ_U=
NBOUND
> must now use WQ_PERCPU. For more details see the Link tag below.
>=20
> In order to keep alloc_workqueue() behavior identical, explicitly request
> WQ_PERCPU.

Fine with me, thanks.


For those system_wq changes you can follow a similar structure but alter=20
it to match what is changed in the other interface.

This seems already okay:

"Replace system_wq with system_percpu_wq, keeping the same behavior."

And again you can drop the old system_wq is kept for a while thing, it's=20
irrelevant to those changes as they're no longer using the system_wq.


(When sending the update, you can send all three drivers/platform/ changes=
=20
in a single series.)

--=20
 i.
--8323328-936467615-1763549979=:970--
