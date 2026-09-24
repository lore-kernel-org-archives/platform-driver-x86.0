Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DFD63C1985;
	Thu, 24 Sep 2026 21:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790285996; cv=none; b=TL+LxpWUzbg2crIgu9xXdWPesq7dYGkVvUXBrlkGgLqTCikmCxCN9wNkYZ+YoOjctHQSlBLBdiu4Av0pyMhXJQhvKVtvFao1y+FD2dYSGCpM7HPfcg7jt5oPGrcexVruY99SDkv3lAiE9NSUhX0YlIQNPg95Z9HKOYRJ889UBDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790285996; c=relaxed/simple;
	bh=6zdCffLvP6l5b2gM3OWv2UAqdeUut3sp9XOz7+bUXaA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iar1Sbz94/geFcKkFg5YLfC+eZ5Vj+p0y1DDecC8kzZvjGpebI9uoK+wG4ShuL8qWNhv6ky/3EEclrFzBfN1YA99DssA93uiP/SnJbdIXuykTZsh3I+dmGWFtMSujuBXNX4G7XGykPHErhSU03ueov2S9Qa/A+94SFf7Pvz05Jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HGuaPSUo; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HGuaPSUo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790285994; x=1821821994;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=6zdCffLvP6l5b2gM3OWv2UAqdeUut3sp9XOz7+bUXaA=;
  b=HGuaPSUoUpRjjL7trhEeVQ7pIW+I61PBa9Qg6CbgIByhXRMIy8pa9+1N
   27vsFWuYlPFgi6HqWyne5Lh21Ls+jqy67DQWcBWEaa02ZYXsZbvmd5qml
   5VGCs78U2l0IVXZCVrwh6I74vk42/E1MFLS1RyOYz0k+TaUunCeUowB6b
   9d75MI8nZYlucess/mf9XAT2xLhcnUvkvPYKXBMNKtDi/RI/Rv1+M4GQh
   WKlTrtO6ugijgsN3FPOhqz2q4CllLcXB1C3EJUvIuWbRR0Wq7ILgs6+tv
   23zqFRQ+6j8sqyxysR5JZivQVXpol89+7ze3I+8ed9MIgWuPct4XLGO78
   g==;
X-CSE-ConnectionGUID: 7a1q9zO3Q/et2mOghAxNnA==
X-CSE-MsgGUID: VSKV8M0IQPOfmW4LmMHgbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="93961574"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="93961574"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 14:39:53 -0700
X-CSE-ConnectionGUID: OmF7bD9BR9GRlSrsBvuKKg==
X-CSE-MsgGUID: Y7X+UIauSwKBM4YFYarlzA==
X-ExtLoop1: 1
Received: from spandruv-desk.jf.intel.com ([10.54.55.20])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 14:39:53 -0700
Message-ID: <9e3c9e829991004b2a01b6b3bf90d1123862260f.camel@linux.intel.com>
Subject: Re: [PATCH 1/2] platform/x86/intel: power-domains: Handle failed
 init in tpmi_get_linux_die_id()
From: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
To: Kristen Carlson Accardi <kristen.c.accardi@intel.com>, Hans de Goede
	 <hansg@kernel.org>, Ilpo =?ISO-8859-1?Q?J=E4rvinen?=
	 <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 24 Sep 2026 14:39:53 -0700
In-Reply-To: <20260924193625.1830526-2-kristen.c.accardi@intel.com>
References: <20260924193625.1830526-1-kristen.c.accardi@intel.com>
	 <20260924193625.1830526-2-kristen.c.accardi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2026-09-24 at 12:36 -0700, Kristen Carlson Accardi wrote:
> tpmi_init() returns early with -ENODEV on CPU models that are not in
> tpmi_cpu_ids, before domain_die_map is allocated. When the driver is
> built in, tpmi_get_linux_die_id() remains callable after the failed
> init and dereferences the NULL domain_die_map.
>=20
> This is reachable from user space: uncore-frequency-tpmi calls
> tpmi_get_linux_die_id() from the show function of the world-readable
> die_id sysfs attribute. The attribute is created on multi-die
> packages
> for clusters with the core agent type, so reading it on such a CPU
> that is missing from tpmi_cpu_ids oopses.
>=20
> Likewise, if cpuhp_setup_state() fails, the error path frees
> domain_die_map but leaves the pointer set, so a later call would read
> freed memory.
>=20
> Return -ENODEV when the map was not allocated, and clear the pointer
> wherever it is freed.
>=20
> tpmi_get_linux_cpu_number(), tpmi_get_punit_core_number() and
> tpmi_get_power_domain_id() read only the static per-CPU data and hash
> table, so they are safe after a failed init.
> tpmi_get_power_domain_mask()
> has the same problem as this helper but no callers, so it is handled
> separately.
>=20
> Fixes: e37be5d85c60 ("platform/x86/intel: power-domains: Add
> interface to get Linux die ID")
> Assisted-by: LLM
> Signed-off-by: Kristen Carlson Accardi <kristen.c.accardi@intel.com>

    Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>

> ---
> =C2=A0drivers/platform/x86/intel/tpmi_power_domains.c | 9 +++++++++
> =C2=A01 file changed, 9 insertions(+)
>=20
> diff --git a/drivers/platform/x86/intel/tpmi_power_domains.c
> b/drivers/platform/x86/intel/tpmi_power_domains.c
> index 833052dc34d2..ea51fc56297d 100644
> --- a/drivers/platform/x86/intel/tpmi_power_domains.c
> +++ b/drivers/platform/x86/intel/tpmi_power_domains.c
> @@ -156,6 +156,13 @@ EXPORT_SYMBOL_NS_GPL(tpmi_get_power_domain_mask,
> "INTEL_TPMI_POWER_DOMAIN");
> =C2=A0
> =C2=A0int tpmi_get_linux_die_id(int pkg_id, int domain_id)
> =C2=A0{
> +	/*
> +	 * When built in, this stays callable after tpmi_init()
> failed
> +	 * before allocating the map.
> +	 */
> +	if (!domain_die_map)
> +		return -ENODEV;
> +
> =C2=A0	if (pkg_id >=3D topology_max_packages() || domain_id >=3D
> MAX_POWER_DOMAINS)
> =C2=A0		return -EINVAL;
> =C2=A0
> @@ -245,6 +252,7 @@ static int __init tpmi_init(void)
> =C2=A0
> =C2=A0free_domain_map:
> =C2=A0	kfree(domain_die_map);
> +	domain_die_map =3D NULL;
> =C2=A0
> =C2=A0free_domain_mask:
> =C2=A0	kfree(tpmi_power_domain_mask);
> @@ -258,6 +266,7 @@ static void __exit tpmi_exit(void)
> =C2=A0	cpuhp_remove_state(tpmi_hp_state);
> =C2=A0	kfree(tpmi_power_domain_mask);
> =C2=A0	kfree(domain_die_map);
> +	domain_die_map =3D NULL;
> =C2=A0}
> =C2=A0module_exit(tpmi_exit)
> =C2=A0
