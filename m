Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67DE5433BB
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Sep 2024 13:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725456653; cv=none; b=gP+lUb+j3G8ttrxjLB0GGJ2zSqsiTkSpxJ7jiSfW/7a3Eq0CD00v2aR38WuVr2t0dJC/4ksOcR+EI/dIkRAleA85L3Qe2Xu+JCyWddUfTh1BfpyW1MHEw9EjjhTeEvWGFZjgnBxYZPKo+j06gRliJm8RYJVcTLp7nEXfse72Fw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725456653; c=relaxed/simple;
	bh=bsNjNERGJ+UWCW5P2uvUPXbneBLoNiLPdtpI/X1GlXQ=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=oV1tqQTEKfj6AWulRC8FmOFvm2zYG6IGuHKQVVPGWKyoX2TBJZLRtgGhFB0IIgboT2/B2Std8qSQpyI6yJOMBlY1KYj+4jBpUNx02ZdyJr8WwUNVk7ZdBfqs9xLQc7KFxmyq9XfKtRH0gOvPJ5u9SMZOykCFjob7t5q2YOsVTRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jm97zymw; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jm97zymw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725456653; x=1756992653;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=bsNjNERGJ+UWCW5P2uvUPXbneBLoNiLPdtpI/X1GlXQ=;
  b=Jm97zymw6getbvMh09O66h6VZAbNwSF5DrsJF3Ww40emdOjk7B0aCG53
   BhuRN4nw1QJGI+9+V9jiGvKsUTDZmU5Ys2GikGgQiJ1fD2Mex2tSwrFEd
   rwD9QQBHvuKL5ir6Ff62SOwbd+qd/mIYaXsb/sbA6Cwh3bEGkKwjjmn4i
   kKnUsrCT5dG8LxXKSKzj5uF3eWSe218ZT6w7bpUiF84OtaJLcbF6K4G2T
   Sc0hIZAzoUfg02rL/YyjA4a6JY79Zy3sd6j8vdMooNWlpIcp8PhkBsXMi
   A9Ry66a61jNi8XWfGP05X/neUkYvA1VciiFjHzaDiHhlCL1bcuOlYgaHi
   Q==;
X-CSE-ConnectionGUID: 7sfqwK4ASb2+10fcT6DKGQ==
X-CSE-MsgGUID: WRUTZYuAQk6J8TSdqUKJhg==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="46648604"
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; 
   d="scan'208";a="46648604"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 06:30:52 -0700
X-CSE-ConnectionGUID: kOODM/31R3Cs2/0w2wMqlQ==
X-CSE-MsgGUID: m/2njc+yRzKL8ZM/bxnGtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; 
   d="scan'208";a="69898242"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.245.156])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 06:30:49 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 4 Sep 2024 16:30:45 +0300 (EEST)
To: Suma Hegde <suma.hegde@amd.com>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
    Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Subject: Re: [v7 08/10] platform/x86/amd/hsmp: Create mutually exclusive ACPI
 and plat drivers
In-Reply-To: <20240903123830.2717196-8-suma.hegde@amd.com>
Message-ID: <4dc8bd2b-07ce-4d69-cd30-82c3872a7ab1@linux.intel.com>
References: <20240903123830.2717196-1-suma.hegde@amd.com> <20240903123830.2717196-8-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-568412504-1725456645=:1078"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-568412504-1725456645=:1078
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 3 Sep 2024, Suma Hegde wrote:

> Separate the probes for HSMP ACPI and platform device drivers.
>=20
> Provide a Kconfig option to choose between
> ACPI or the platform device based driver.
> The common code which is the core part of the HSMP driver
> maintained at hsmp.c is guarded by AMD_HSMP config and is selected by
> these two driver configs.
>=20
> Also add "|| COMPILE_TEST" clause in Kconfig to get build coverage
> for HSMP.
>=20
> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

This series looks ready as far as I can see.

Thanks for all the work you've done to improve it!

--
 i.
--8323328-568412504-1725456645=:1078--
