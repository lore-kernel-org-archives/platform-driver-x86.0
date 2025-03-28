Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA86D171092
	for <platform-driver-x86@vger.kernel.org>; Fri, 28 Mar 2025 14:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743171092; cv=none; b=W5le9WhWpmP/gwIc0Vqoj+x0wKUoV2Ajlh2LqA23NeNwActGeNtWJ4DJ40wUY8GH5f5klh8EAkLsZtekF0PwCAM+U0XjCV5JXpPp+mELe2mA2AC3IFgXBAAZud0iqWfA2Dqod38WsBzv4ND+J3Knh09AMErUdYESlP2xaSYJqEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743171092; c=relaxed/simple;
	bh=tr8K/DxNYuqhSUg6cW60ReftO71yGJBTjDp+0awHHas=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=RJNWLo0eI5JhvVES9iOzgcVly1Sr+t3C+ZtgNn9qwmOPXV6iKU4ZRAEicPlJW/sP4dEZvye00un93WN4l3Gc9aJ1rnly5F9+hR+2yp1ULPndbbOjZUqw+bA1rtlESHeQhQSGE2e3Zz9GEp3SEj1tNTd5e6fw5Z/AJk6EVij+cBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V/TruPog; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V/TruPog"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743171091; x=1774707091;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=tr8K/DxNYuqhSUg6cW60ReftO71yGJBTjDp+0awHHas=;
  b=V/TruPogEc0VTB1qkUFEm1MNV9KaU5bxbI5u5u/Ms0wvQtfNMW/d1SLW
   XJfAZ+x5A3icF+I5sXSYevgx4+LDhpYoYXFmvriZBuWio4+ecoMVn3A2F
   0RtVzeBjntUsO9MFsXgKRNiqtOHhnK0X1loMajdUBL3PRiOkVC5QSBy+k
   NoVtg8SgiKpDttlVPllCmP2ngHrn91znO+mWYaiBIbcxvDPPFdVH2GfG3
   VhZ9TLgZRaRtJSIL26+6IxoLHYmA5fjg69grxiroYyl3WWjxQtwEpGTp9
   a0jIL3gg1MRQA9wMseS4Uq02k20XxN4yepwu4+8wan1GYM0EGOzx+s9pc
   Q==;
X-CSE-ConnectionGUID: mQKglvJpTZKZaAoOjyB1+w==
X-CSE-MsgGUID: wTQUxcWdQvWMxht5mAnZPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="67004594"
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; 
   d="scan'208";a="67004594"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 07:11:22 -0700
X-CSE-ConnectionGUID: jdt0+MIeQnaFtzp3EdlNBg==
X-CSE-MsgGUID: RltHa4+qQsi+0+Zb2b9YjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; 
   d="scan'208";a="156387849"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.43])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 07:11:20 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 28 Mar 2025 16:11:16 +0200 (EET)
To: =?ISO-8859-2?Q?Micha=B3_Kope=E6?= <michal.kopec@3mdeb.com>
cc: Hans de Goede <hdegoede@redhat.com>, tomasz.pakula.oficjalny@gmail.com, 
    platform-driver-x86@vger.kernel.org, piotr.krol@3mdeb.com, 
    maciej.pijanowski@3mdeb.com
Subject: Re: [PATCH v3 0/1] platform/x86: Introduce dasharo-acpi platform
 driver
In-Reply-To: <20250328140344.1304995-1-michal.kopec@3mdeb.com>
Message-ID: <f19dc543-e088-dd6e-d294-246a46ef5530@linux.intel.com>
References: <20250328140344.1304995-1-michal.kopec@3mdeb.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1724648670-1743171076=:932"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1724648670-1743171076=:932
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Fri, 28 Mar 2025, Micha=C5=82 Kope=C4=87 wrote:

> Introduce a driver for devices running Dasharo firmware. The driver
> supports thermal monitoring using a new ACPI interface in Dasharo. The
> initial version supports monitoring fan speeds, fan PWM duty cycles and
> system temperatures as well as determining which specific interfaces are
> implemented by firmware.
>=20
> It has been tested on a NovaCustom laptop running pre-release Dasharo
> firmware, which implements fan and thermal monitoring for the CPU and
> the discrete GPU, if present.
>=20
> Changes in v2:
> - Remove redundant copyright information
> - Turn dasharo_fill_* functions into single dasharo_fill_feature_caps
>   function
> - Code style fixes
> - Turn large if / else blocks into switch / case
> - Fix possible positive return values in hwmon read handler
> - Change while loops to for loops
> - Add local variable for data->sensors[data->sensors_count] in
>   dasharo_fill_feature_caps
> - Replace snprintf with scnprintf per Ilpo's review
> - Keep the "ok" path silent
>=20
> Changes in V3:
> - Simplify dasharo_read_value_by_cap_idx arguments and rename to
>   dasharo_read_channel

Hi,

This doesn't address my comments to v2 which I sent today. Please give it=
=20
a bit more time for people to review a version before sending a new one
as we're on different time zones etc. so latency is expected. And try to=20
double check you've addressed all the comments before sending a new=20
version.

This is not a sprint you have to finish in a week, you have plenty of time=
=20
in this kernel cycle that has just started. :-)

> Micha=C5=82 Kope=C4=87 (1):
>   platform/x86: Introduce dasharo-acpi platform driver
>=20
>  drivers/platform/x86/Kconfig        |  10 +
>  drivers/platform/x86/Makefile       |   3 +
>  drivers/platform/x86/dasharo-acpi.c | 375 ++++++++++++++++++++++++++++
>  3 files changed, 388 insertions(+)
>  create mode 100644 drivers/platform/x86/dasharo-acpi.c
>=20
>=20

--=20
 i.

--8323328-1724648670-1743171076=:932--
