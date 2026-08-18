Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C6A46D540;
	Tue, 18 Aug 2026 13:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787059181; cv=none; b=We+/uG/7dod5830uJbajCHVbH3uySqwGg45mfDWmXKF0vJekink0osHdtDq6bAgyShsOAbOH2ffr2RhnP0d/43t1osfYZg5h8jKo0wxAJP6Eq3KUvCbYjJtxue7fYWrfWnIQr5oMVc2R3hxqKfme7/sF9kWA0Z77PST+XOLXdc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787059181; c=relaxed/simple;
	bh=1+Exl2XzAQLnAmavtEB6DTy6Xoz6OvFtmQbTlWX1e/w=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=asYJAcJHI786ddll7h8V0SelhRjiZOyoUTDjR8b8zgib3J97O1WUQU8vKKHOY5Qff8WzEfHTFO1X8wVqJ7JBb7JqwATwjVmnAxTcjYkD7cHDBxhV//RjBaZKiwNinXbT61Bhsppv5UMYJq61PHld7wCsUboDz6DNllQQCx/Sl2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sak7NFsW; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sak7NFsW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787059180; x=1818595180;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=1+Exl2XzAQLnAmavtEB6DTy6Xoz6OvFtmQbTlWX1e/w=;
  b=Sak7NFsWrmssvyVRoD9acFavFdhlienUAyeD8t6tKlM+7wcoSCsEI7tJ
   P1An+5lDf1xWW7pZ8ik50sbej7X9TnTvmhS7uhHamuABdQc7RpTG/hkdL
   Fgvitua801j+nauJG+xvBZdlRQvxOqsCWvMfYb465Yakf/K7+XLv+Hstm
   hnVDBVDBUmOSQD7erh6+7XjeUp/FttnOUGPtCwDBI/gtoM/0c8V9fqBV4
   1B5TqGpvIKkiYV74U89c/mUqeXMR6nsvoV0XIrNoY9t/6csUyFcj8N/zU
   DSDKmD3TBBmbuFBDHxthN5PS3D/jW5OfRxdTougHumK1vSW4dM5gtbs0N
   w==;
X-CSE-ConnectionGUID: Zd0qsmkYTQquVe92wKvW9w==
X-CSE-MsgGUID: Jg6Unr27Qgeg81z7yJm14g==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="87467139"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="87467139"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 06:19:39 -0700
X-CSE-ConnectionGUID: 7mls0YVtTeOTllOwRN9Piw==
X-CSE-MsgGUID: azmllD98RTqH4wy8lRWuAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="261477396"
Received: from gabaabhi-mobl2.amr.corp.intel.com (HELO [10.125.111.201]) ([10.125.111.201])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 06:19:39 -0700
Message-ID: <85ece7bce84287b4d08cf546cbf7a58991a3e747.camel@linux.intel.com>
Subject: Re: [PATCH] platform/x86: ISST: Avoid model check for recent servers
From: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
To: Ilpo =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org,
 LKML	 <linux-kernel@vger.kernel.org>
Date: Tue, 18 Aug 2026 06:19:38 -0700
In-Reply-To: <9cbea11b-ef1c-cda5-8fdd-e9cff29612ff@linux.intel.com>
References: <20260729180512.2048114-1-srinivas.pandruvada@linux.intel.com>
	 <9cbea11b-ef1c-cda5-8fdd-e9cff29612ff@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2026-08-18 at 16:03 +0300, Ilpo J=C3=A4rvinen wrote:
> On Wed, 29 Jul 2026, Srinivas Pandruvada wrote:
>=20
> > To enable SST functions, a CPU model entry is required. This causes
> > unnecessary delays in deploying new servers on older kernels.
> >=20
> > To avoid this, if no CPU model match is found, allow the SST common
> > driver to load, when all of the following conditions are met:
> >=20
> > - Not running as a guest
> > - The platform is identified as a server via ACPI PM profile
> > - The CPU belongs to Intel family 0x19
>=20
> Hi,
>=20
> Sashiko notes this shouldn't be hex (and is contradicting with the
> code=20
> that uses decimal)?=20

Hi,


Yes, this should be 19 not 0x19. Code is correct. I will send an
update.

Thanks,
Srinivas
