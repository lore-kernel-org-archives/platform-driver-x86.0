Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3847365A04;
	Wed, 19 Nov 2025 14:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763563483; cv=none; b=gldcU4uHqf7SbBcKhMCKuDgz+ZIVSfaCoRBckIMcpb/o0Q9pKQ7OgfHgiHh6jPr/pSCemBoMkXGSWzR11628LaGFfUywHVGGF35LOGNPASPvXZiH5hqVzC+XhdP+mFPAyrP1aW4Wun/M/olGfwEpWD5mrHO837kG7zPOT/J0iiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763563483; c=relaxed/simple;
	bh=LVoIb5q79jgyX4Tjpihp5pchSq1Lr86YZ8fIQT2dIH4=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=rXqznIPMRm+SyiPDzS2a6KRmdnjO+Tbd7Zeyv06MKkZwqQooNXG12/lMSCOz4dTdd8WX+Kq4oM052uJoUphgEzZjvZYYGw602+J+Z9WB7n89v3xMRRZPLcWfxShHSz2f+ut0ItPf0FAm2k+dpBmNhMnFq/Ke8dmcsmQ21C4y6EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aFzbed11; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aFzbed11"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763563481; x=1795099481;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=LVoIb5q79jgyX4Tjpihp5pchSq1Lr86YZ8fIQT2dIH4=;
  b=aFzbed11fm8hsKS5noXDDUIDeTecx75kBNWCgwAms6OZbk9xUJyOkU/N
   ZoTTwKkuGLHOf3JIQv1AMCTsp2JYavCn4kzfJ3suKncJypVss3/uzXbI4
   sTuC4VyXihGF8sw5mQ6PElWXNXmqtYXuCZLItJ4K2T2l6zHzlO5R7TQFz
   FRU63RoCsrSCya4wBu5vS3nEmeLpTT1AwYEYND1pihnk6fR6wG9FbnILO
   eku0vOoo49x6BG+EtKrXonlqO3JmY189CE82ykVcg+QNmnYi243pIEMeL
   5nqxVMJK+VGEX8jn2WFUXFZlbYFN//3I6ieNctlHrRIBQytdYqUQ8T7Wi
   Q==;
X-CSE-ConnectionGUID: Fc0HwSi/RU6Mab2SC0mwxg==
X-CSE-MsgGUID: 4169Jy2dSYuvVibKsg/NkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="65307631"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="65307631"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 06:44:40 -0800
X-CSE-ConnectionGUID: kyR49g8IRf+zhJ3Hs50sOQ==
X-CSE-MsgGUID: 5hazvsF7Q3u/p7VfIPnxGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="195196404"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.42])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 06:44:37 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 19 Nov 2025 16:44:32 +0200 (EET)
To: Marco Crivellari <marco.crivellari@suse.com>
cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, 
    Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
    Frederic Weisbecker <frederic@kernel.org>, 
    Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
    Michal Hocko <mhocko@suse.com>, Maximilian Luz <luzmaximilian@gmail.com>, 
    Hans de Goede <hansg@kernel.org>
Subject: Re: [PATCH] platform/surface: acpi-notify: add WQ_PERCPU to
 alloc_workqueue users
In-Reply-To: <CAAofZF7AbQ12-3DzpN9Ai49VzOHa3VqyfZnXSpfVq7qijO1GRQ@mail.gmail.com>
Message-ID: <45ac7298-6053-b125-69b3-3ef198315fe8@linux.intel.com>
References: <20251107143837.247085-1-marco.crivellari@suse.com> <88c0ecd8-0d61-f4bc-ae13-cce971b9c69c@linux.intel.com> <CAAofZF52hxs_UbA+WkaugNceotzPMisziBj0+AKoL+X0pNrQbg@mail.gmail.com> <1db6c690-ca7b-5b68-c2f6-0d8b79c31880@linux.intel.com>
 <CAAofZF7GhnQ6nQyvLSbTPOv-k4Y=nM9BvoRNRJOA53bbWLo70g@mail.gmail.com> <bc69382e-c409-11f8-a278-d93d0f68ab1b@linux.intel.com> <CAAofZF7GwRKQcNAUK9=j4mqnz+HX_ONG9YKs4PLztbjvJxrxZg@mail.gmail.com> <324dfca8-8f16-158c-8fb9-8efb52eff4ac@linux.intel.com>
 <CAAofZF7AbQ12-3DzpN9Ai49VzOHa3VqyfZnXSpfVq7qijO1GRQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-319821690-1763563257=:970"
Content-ID: <8066360c-ee7b-b860-1419-b3c53e1d787d@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-319821690-1763563257=:970
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <0e10ae6d-f9b2-3e73-e973-acffac75c32c@linux.intel.com>

On Wed, 19 Nov 2025, Marco Crivellari wrote:

> Hi,
> On Wed, Nov 19, 2025 at 12:12=E2=80=AFPM Ilpo J=C3=A4rvinen
> <ilpo.jarvinen@linux.intel.com> wrote:
> >[...]
> >
> > For those system_wq changes you can follow a similar structure but alte=
r
> > it to match what is changed in the other interface.
> >
> > This seems already okay:
> >
> > "Replace system_wq with system_percpu_wq, keeping the same behavior."
>=20
> Sorry it's just to check with you before sending a useless series.
> Sounds good this, for the 2 system_percpu_wq commit logs?
> I don't think there is more to add here, because it is a wq rename.
>=20
>=20
> This patch continues the effort to refactor worqueue APIs, which has begu=
n

Please fix that typo.

> with the change introducing new workqueues and a new alloc_workqueue flag=
:
>=20
> commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
> commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")

You should still have here the paragraph which explains the default change=
=20
briefly, similar to what was with the WQ_PERCPU description. I suggest you=
=20
just edit the wording in the paragraph taken from WQ_PERCPU changelog we=20
agreed on at the places where functions and arguments are different.

> For more details see the Link tag below. Replace system_wq with
> system_percpu_wq, keeping the same behavior.
>=20
>=20
> Thanks!
>=20
>=20

--=20
 i.
--8323328-319821690-1763563257=:970--
