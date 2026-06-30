Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4F342315B;
	Tue, 30 Jun 2026 14:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782829112; cv=none; b=rfQ5CtuL/N35m3nb5eflvdUs1EJOqcPpwFqrckyyMNRH+JdDBQRRTp6/dlEoHEsLOqb8gZ+1THu/zbu/QWBJybpnaavSe1kaABmVEnUNuxw7S/0KZfXWRxYMbStB6Qf6EpNvgO154X2lZ8p/MF5UD7DJdcBvw/oUSWCryPwoBqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782829112; c=relaxed/simple;
	bh=rC+zJfwwlwN/v5yn89fXgM2gDNVZerPLvelMiuOFku4=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=VsNqc2g3CzdfpYADRUFA9Q3JJW47ILO2rIizj2xN+JqGiVZ6xx2YLDcjB7+Gs3Q73y6ZOthHxx5azCl9VMu7MILIyQ2O10/e0S2Ywe6Zmt3c55zLrKW2VtVGtFMrhssfzyLI42bnBbFpVgJFY8X3BRQzHmFbgKmTjJRHe+JnK94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SVRxbErg; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SVRxbErg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782829110; x=1814365110;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=rC+zJfwwlwN/v5yn89fXgM2gDNVZerPLvelMiuOFku4=;
  b=SVRxbErg/hvGYGWfxhM4Fov6onZ3rScGVjCCk4OihOAjyZxZ8onI9Z1G
   3ii1ZqNQvPHVBb0WLd80IdggMYlCQzRiUoHombOS4lwlCDBekZ8gviau1
   1XiLNXW4dQSvdTzgaivoFQaWkUHmVr8BRJxz5N4CE16V5iJhylMHiIN59
   dHHJQKs8Xj3UiLlEdg2ccmKNKFe2HXntBbbGr7Vqkh6LIHNY1LvPz0Ltf
   RHqVU4Ne1Tt1qMCFUrIYQ9elqqg32enQsxtad/usN5mvyK6m7tEYb4RoB
   cY2EiKAGdAFVJYTm2OYlrOf8pWtyET024zhbnP8NJQK1T4f68bLvdUnFD
   A==;
X-CSE-ConnectionGUID: sFXx7YUJTHyUqTDboBaCtw==
X-CSE-MsgGUID: 2hrUOiLJRd2LKVKdJ1fTnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="106335170"
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; 
   d="scan'208";a="106335170"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 07:18:25 -0700
X-CSE-ConnectionGUID: WZ1AMNOSQbaseK2aW7sT/Q==
X-CSE-MsgGUID: x+2t747xTWSPJTymSKa+hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; 
   d="scan'208";a="250578900"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.230])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 07:18:22 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 30 Jun 2026 17:18:14 +0300 (EEST)
To: Marco Scardovi <scardracs@disroot.org>
cc: corentin.chary@gmail.com, denis.benato@linux.dev, 
    Hans de Goede <hansg@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
    luke@ljones.dev, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2] platform/x86: asus-armoury: add support for G614PR
In-Reply-To: <w5lQn2_tRS-_d31lk_IeWw@disroot.org>
Message-ID: <886fad99-08de-3c74-bf07-a65777191d08@linux.intel.com>
References: <BGkkBwKuSFuGPnRJO3Lg1g@disroot.org> <e7d71740-8e69-0433-aa49-d5023bd59a98@linux.intel.com> <w5lQn2_tRS-_d31lk_IeWw@disroot.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-811330811-1782829094=:1167"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-811330811-1782829094=:1167
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 29 Jun 2026, Marco Scardovi wrote:

> Hi Ilpo,
>=20
> In data luned=C3=AC 29 giugno 2026 13:04:51 Ora legale dell=E2=80=99Europ=
a centrale, Ilpo J=C3=A4rvinen ha scritto:
> > On Sat, 27 Jun 2026, Marco Scardovi wrote:
> >=20
> > > you around? I'd need this to be fixed to set the correct values.
> >=20
> > I'm not sure what the context here is, whether you're just asking for t=
he=20
> > patch to be applied (which is entirely unnecessary, as long as the patc=
h=20
> > appears in the patchwork's queue, I've not lost it), or if you're sayin=
g=20
> > there's a problem in v2 patch?
> >
> There was a problem with the v1 patch, where I wrote 4 values wrongly,
> so I posted the v2 with the correct values.

Hi,

I did take v1 patch and it has in the meantime been merged into Linus'=20
tree, making the original change immutable.

Thus, please post a delta patch with a justification instead. Use a Fixes=
=20
tag pointing to the original commit.

For simple patches, placing the patch changelog (patch history) in that=20
patch itself under --- line e.g. as bullet points is more effective and=20
easy to spot that from the coverletter.

Preferrably post new versions as own thread because sometimes tools may=20
get confused when more than one version appears within the same thread.

> > Usually, the merge window is quiet time anyway when it comes to applyin=
g=20
> > patches so don't expect much to happen for them until clearly after rc1=
=20
> > (=3D not right after rc1 has been published, because the piled up patch=
=20
> > queue will take some time to drain and there are other things to do aro=
und=20
> > that timeframe as well).
> >=20
> I see, sorry for bothering. I'm new to the kernel patching workflow and
> still learning how it works.

It's no problem, no need to be sorry at all, we value also patches from=20
newcomers. I just wrote this to explain how the kernel development cycle=20
works.=20

Some subsystems accept no new submissions during merge window, in pdx86=20
we've no such rule but things are still quieter also here (I usually won't=
=20
apply anything than very very critical fixes during that 2 weeks window of=
=20
time, it's "normal").

--=20
 i.

--8323328-811330811-1782829094=:1167--
