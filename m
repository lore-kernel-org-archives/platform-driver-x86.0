Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611E433C19E;
	Wed, 19 Nov 2025 13:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763557545; cv=none; b=sPbiW0t8q6gaa/AGoefeAii4XcgK5Yh4daFCvkQqf8kEaLQHHOooxs50TZBKGa3xs3HK15UPnX6K494iDNdlxU4WBdJnmruz001ExxMQmeTWYGRb5PhPRQ5PKNqCRDjfKtDFS/XGD5z+YKAbUacVwHmVi7aBNI5Yuh/2ANnWRJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763557545; c=relaxed/simple;
	bh=cE4JVCEEMsZNWjkeyu4y5Y845pUg/S0CJQ44OshA/fM=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=MeMFohoQitXqC85htWk1p4v5ASbgIhjAL6jU/1KUmk++EtRF6tHhuyxNOFF/o1adARm8Al4P+Pm1Q8uL4OFX64inNwtBi0V1qXcS/FqDXl6gZdN7MTOGFwYLORRLyyGcVYdTHutIra+wMxw36mEN57UtOcB4M0RY4ZWK/eu6PNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jrXXQQ+9; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jrXXQQ+9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763557543; x=1795093543;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=cE4JVCEEMsZNWjkeyu4y5Y845pUg/S0CJQ44OshA/fM=;
  b=jrXXQQ+9cr+mKEHL3aXm7GkmUKwjPwPvA4lAOK9XxvLwGBKORA+iCByI
   p3OzPVdKL20NjRx3dcljmgfEIqmyu7jVJB1qz2O/xOJJPQk/1SHLNx9hS
   6UYGrkcjkQ+4eFGqkZjnKqF9nN0zqiUc+VHMsk/Pq3/x2bq0snRjPCblD
   hsiF4ckRzKNji3+rMVC5WGDvWJNaAyZE7emVDd1XXPGCBa1UO7rBN+LrL
   LIFHrgjHlwkoxuK4Zbhjou5Mm6TesHge0AWseklctegoSxlpdSIOSk8OJ
   FzxzB2bFlvrF3zDxkXyqrcxMNcMsP/h2xrVooShXgIj0VHt4nDsFAfKCq
   g==;
X-CSE-ConnectionGUID: WgHvqANBTl27A6ZWP8AbnQ==
X-CSE-MsgGUID: nlNCuJRAQ+qI5r6DaDQcng==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="64793143"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="64793143"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 05:05:42 -0800
X-CSE-ConnectionGUID: F0ZePefUTIqK8ylyKoEGRg==
X-CSE-MsgGUID: 4ksSddSyR+6/xSsqbi/Eiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="190852913"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.220])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 05:05:40 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 19 Nov 2025 15:05:37 +0200 (EET)
To: =?ISO-8859-15?Q?Basti=E1n_Almendras?= <bastian.almendras96@gmail.com>
cc: jlee@suse.com, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: platform/x86: acer-wmi: Enable SW_TABLET_MODE on Switch One 10
 (SW1-011)
In-Reply-To: <CABuR8muavDq+rkSfNU0zM+ZBgtmumxdq-haPkuyD5A=xK_pSxA@mail.gmail.com>
Message-ID: <ea6910ff-bcf9-7d38-b53f-6dc1f730c654@linux.intel.com>
References: <CABuR8muavDq+rkSfNU0zM+ZBgtmumxdq-haPkuyD5A=xK_pSxA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-962897927-1763557537=:970"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-962897927-1763557537=:970
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 19 Nov 2025, Basti=C3=A1n Almendras wrote:

> Hello, good morning. I'm trying to get my old tablet working properly on =
Debian, but
> I've had to add some fixes.
> Here's a commit I created to add the SW_tablet_mode functionality to this=
 tablet
> using acer-wmi.c.
> Add a DMI quirk for the SW1-011 setting force_caps to ACER_CAP_KBD_DOCK
> (these devices have no other acer-wmi based functionality).
>=20
> Thank you very much for taking the time to read this.
>=20
> Here's the diff:=C2=A0
>=20
> 704a705,713
> .callback =3D set_force_caps,
> .ident =3D "Acer Switch One SW1-011",
> .matches =3D {
> DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Acer"),
> DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Switch One SW1-011"),
> },
> .driver_data =3D (void *)ACER_CAP_KBD_DOCK,
> },
> {

Thanks but this email is not following our submission guidelines and is=20
not formatted right.

Please take a look at Documentation/process/submitting-patches.rst

It might also help if you browse through a few submission from ML=20
archives at lore.kernel.org to get a general idea how the submissions are=
=20
formatted as that documention, while explaning some things in detail,=20
doesn't give a overall example.

Also, if you use git format-patch command to create the patch, it produces=
=20
the expected formatting by default.

(You don't need to be worried over not getting everything right on the=20
next try, we're more than happy to guide you to towards the finish line=20
once the formatting is roughly what is normally expected from a patch.)

--=20
 i.

--8323328-962897927-1763557537=:970--
