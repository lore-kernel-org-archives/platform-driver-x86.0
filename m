Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F1211F151C;
	Tue, 18 Nov 2025 14:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763477040; cv=none; b=pUEx9+RdCXYmiEDHG8N8UhtayA5BIFLO945AG61oeaJsnXpthcxcN2p55L4GIR7P1RmIdu4zbLNE579xyCmKNnnK6vPBBT6C1TqBRr3k42px8XFXcspMe3JkuQi0Utj/meI6l1l7fSLxomGZ2yybLrzUmSONgeThFzNHYjvUFhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763477040; c=relaxed/simple;
	bh=RiThrz8w6bDvWcfHrEOQJmpj/jC91d/Sn99gSt3NnIs=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=n1n+dlvW+Zg02RrmiWTYXV6CBog7R7hlMJj6h12uvqPwVcRtJdyqCN07UPjaCZ9+ym+0fwZNMF9GZm1BQFL9MiuKOsqBbYry21nPbDvHtlzOgvpnUboEeYxIEz2TELJA3zwH9Qq877eABexlCk3OZ4Fq2PJz90h8z7TgReRk6kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X/2q9jMy; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X/2q9jMy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763477038; x=1795013038;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=RiThrz8w6bDvWcfHrEOQJmpj/jC91d/Sn99gSt3NnIs=;
  b=X/2q9jMya49+wYvgddsKahRcansjCiZCQX13G0FqjxlxoZP1NeRq2S7R
   ki3ad6WM4lJOcVpk3iKYWc7zWs7OKvrsBQ5N0M/OwUZpxMz/MgA0O0d5y
   ESt3bAE0NVEmLpxT1zYhCTuyLExF5gUGAHUM/N3k6VeoFbJVbwIVR5VFF
   /hSCMSV140q8N3YMmsqh2lA6dkswCBS5xUwcHPMcKnw7OSW7rDUwulY0o
   pMdbDKHOpdoP1TNErf93juRUqEaRs56+w2ES6P1to6h93G1Lko8NXJhkR
   c1DZqSkp+76ZOzixKEprXHXsxRKFYPlIfP6LED6osXjp2AlgYcZsIdPAH
   g==;
X-CSE-ConnectionGUID: Msfu2/WJSnClQo6wDeTbag==
X-CSE-MsgGUID: rgcrlCsFS7eQiKSj9jkdrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="88149308"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="88149308"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 06:43:57 -0800
X-CSE-ConnectionGUID: qUTelZCySKushkc1NKaxSQ==
X-CSE-MsgGUID: UJI0rN6jSheJivVY/rvh2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="190807291"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.74])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 06:43:53 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 18 Nov 2025 16:43:50 +0200 (EET)
To: Marco Crivellari <marco.crivellari@suse.com>
cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, 
    Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
    Frederic Weisbecker <frederic@kernel.org>, 
    Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
    Michal Hocko <mhocko@suse.com>, Maximilian Luz <luzmaximilian@gmail.com>, 
    Hans de Goede <hansg@kernel.org>
Subject: Re: [PATCH] platform/surface: acpi-notify: add WQ_PERCPU to
 alloc_workqueue users
In-Reply-To: <CAAofZF52hxs_UbA+WkaugNceotzPMisziBj0+AKoL+X0pNrQbg@mail.gmail.com>
Message-ID: <1db6c690-ca7b-5b68-c2f6-0d8b79c31880@linux.intel.com>
References: <20251107143837.247085-1-marco.crivellari@suse.com> <88c0ecd8-0d61-f4bc-ae13-cce971b9c69c@linux.intel.com> <CAAofZF52hxs_UbA+WkaugNceotzPMisziBj0+AKoL+X0pNrQbg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-1381590036-1763476046=:1205"
Content-ID: <5c0647be-dc7d-64ea-9a1b-b02ae52b864e@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1381590036-1763476046=:1205
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <ee7c5b79-f61e-9176-78cb-8ada7d91f7d9@linux.intel.com>

On Tue, 18 Nov 2025, Marco Crivellari wrote:

> Hi,
>=20
> On Tue, Nov 18, 2025 at 12:30=E2=80=AFPM Ilpo J=C3=A4rvinen
> <ilpo.jarvinen@linux.intel.com> wrote:
> > [...]
> > Hi,
> >
> > There's lots of words in this but it's extremely confusingly written.
> >
> > On one hand, you're saying "most workloads benefit from unbound queues"
> > but then end up using percpu anyway in the actual diff!?!
>=20
> Yes, to keep the same behavior.
> There are subsystems who are asked to convert the workqueue to unbound.
> So in this case I will send the v2 with the change.
>=20
> > If this is to support refactoring efforts, start the
> > description/justification in the changelog with that, with only a conci=
se
> > explanation of the refactoring goal (you don't need to explain everythi=
ng
> > that is already in the changelogs of the commits you refer above).
>=20
> It makes sense.
>=20
> > And I'd expect explanation to the forementioned inconsistency, it might=
 be
> > because of the refactoring in steps. But if that's the case, you should
> > instead mention that either a) there will be a follow-up to migrate to
> > unbound where applicable (assuming it cannot be done now) or b) state
> > that this change is just to keep behavior the same and each case needs =
to
> > be evaluated once the refactoring is complete whether unbound could be
> > used or not.
>=20
> What do you think, is it better in this way?

Still quite non-specific to this particular change.

> "
> This continues the effort to refactor workqueue APIs, which began with
> the introduction of new workqueues and a new alloc_workqueue flag in:
>=20
> commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
> commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")
>=20

The refactoring is going to alter the default behavior of ...
[*].

> For more details see the Link tag below.



> This change adds a new WQ_PERCPU flag to explicitly request

This change doesn't add a new flag, "explicitly request" part is correct=20
though but as written things are mixed up.

I'd just replace this paragraph and the next with something much simpler=20
and more to the point:

"In order to keep alloc_workqueue() behavior identical, explicitly request=
=20
WQ_PERCPU."

> alloc_workqueue() to be per-cpu when WQ_UNBOUND has not been specified.
>
> With the introduction of the WQ_PERCPU flag (equivalent to !WQ_UNBOUND),
> any alloc_workqueue() caller that doesn=E2=80=99t explicitly specify WQ_U=
NBOUND
> must now use WQ_PERCPU.

This belongs earlier to description of the refactoring (to [*]).

> Once migration is complete, WQ_UNBOUND can be removed and unbound will
> become the implicit default.

This is irrelevant detail about refactoring since WQ_PERCPU is used here.

> Suggested-by: Tejun Heo <tj@kernel.org>
> Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
> Link: https://lore.kernel.org/all/20250221112003.1dSuoGyc@linutronix.de/
> "
>=20
> The Link is the original upstream discussion with all the details.
> I think adding more details here will be too much (and unrelated with the
> work itself).
>=20
> > Also, there's one copy-pasted typo "worqueue" in the other patches
> > relating to pdx86 (and likely all your other copy-pasted
> > descriptions to other subsystems than pdx86 ;-)).
>=20
> Uh, I completely missed that!
>=20
> Thanks!
>=20

--=20
 i.
--8323328-1381590036-1763476046=:1205--
