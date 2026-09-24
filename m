Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B731C4A4835;
	Thu, 24 Sep 2026 21:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790286048; cv=none; b=EincZp9QMEe3GMMr86IC9005/kK+a1Sgu8itWH+PdbTTBQ9CiuqGtXz/AYodr/1Dk8CKstbQR5yhbiNT0lQNM2/9cOf/jF6niiY8i8MQOrsEpvbh/jux/aIIB1iyMA69b6u5qg8TrZF5pO6CKvsDWuisHZEiUBT4PjIFGURWXF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790286048; c=relaxed/simple;
	bh=DW/CE+/4qoKr6/uFDQyBY4COZ2q1DL267pDd1nb4ij8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uDSuB+kydcOyWih0mjwmOOkU9m+8juO2xNDGHqEaFiSSJXO9gRnNPlJ2Idqh5hpNxZddaRoD5xIIhhAbKoVXrHtRMC9BWP8aujoK8UF/XigmDZFToGByrMkyiyNx1W0vKqAjIvxbq5amHKyqxtZwQXX2MkU5DcqkvrBC3F7vRVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F/hZ+6lT; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F/hZ+6lT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790286046; x=1821822046;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=DW/CE+/4qoKr6/uFDQyBY4COZ2q1DL267pDd1nb4ij8=;
  b=F/hZ+6lTIOsfBFbsmZDwLjnnagiIe2AbOJf5TsEQcPI6c0tvW3/m10Zu
   PGWR7ARAt6KeM2pplqzKMQ1RhNGXxnnNDonLzL15NUfvoR1LFQngjLInj
   UmElrTjRnBwUaRuTMDPrbzQ4d/+K6w0K5aLL5yT+DdV13JIRbrjgsLdY2
   Wr5wX3ygXdTsIZ52+YyJ0NAS8QWx9yeLF6pntbYIrfT+VnAz+y8jc8SYV
   kY9EhVj2GE5KfeLeYFBhWEFdCmesfaNVagA4wlgrBcvdzjw107n917uom
   weKnUm/pnpqa2+/4TYTr3h3M/fXSndTGOFkVmRs589iKPC8uq3BQc9zmh
   Q==;
X-CSE-ConnectionGUID: 9Juup015R3yjBg2EBk/Hkw==
X-CSE-MsgGUID: LNun8qzGSgK/lHU8FViSvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="93791741"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="93791741"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 14:40:44 -0700
X-CSE-ConnectionGUID: 1zeS7PRIT7m/Yebz3J576A==
X-CSE-MsgGUID: sRGNLYr2RpGXMuT8sQfw+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="277320460"
Received: from spandruv-desk.jf.intel.com ([10.54.55.20])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 14:40:44 -0700
Message-ID: <edcf0b3a043400ce40e1bd7841003f8319542407.camel@linux.intel.com>
Subject: Re: [PATCH 2/2] platform/x86/intel: power-domains: Handle failed
 init in tpmi_get_power_domain_mask()
From: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
To: Kristen Carlson Accardi <kristen.c.accardi@intel.com>, Hans de Goede
	 <hansg@kernel.org>, Ilpo =?ISO-8859-1?Q?J=E4rvinen?=
	 <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 24 Sep 2026 14:40:44 -0700
In-Reply-To: <20260924193625.1830526-3-kristen.c.accardi@intel.com>
References: <20260924193625.1830526-1-kristen.c.accardi@intel.com>
	 <20260924193625.1830526-3-kristen.c.accardi@intel.com>
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
> tpmi_init() returns early on CPU models that are not in tpmi_cpu_ids,
> before tpmi_power_domain_mask is allocated. When the driver is built
> in, the exported tpmi_get_power_domain_mask() remains callable after
> the failed init. It returns NULL then only because it indexes the
> NULL
> array at offset 0 for the zeroed per-CPU data. If cpuhp_setup_state()
> fails, the error path frees the array but leaves the pointer set, so
> the helper would return a pointer into freed memory.
>=20
> Nothing in the tree calls tpmi_get_power_domain_mask() today, so this
> is hardening rather than a fix for a reachable bug. Return NULL when
> the array was not allocated, and clear the pointer wherever it is
> freed, as the previous patch does for domain_die_map.
>=20
> Assisted-by: LLM
> Signed-off-by: Kristen Carlson Accardi <kristen.c.accardi@intel.com>

    Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>

> ---
> =C2=A0drivers/platform/x86/intel/tpmi_power_domains.c | 9 +++++++++
> =C2=A01 file changed, 9 insertions(+)
>=20
> diff --git a/drivers/platform/x86/intel/tpmi_power_domains.c
> b/drivers/platform/x86/intel/tpmi_power_domains.c
> index ea51fc56297d..d89b9894c42a 100644
> --- a/drivers/platform/x86/intel/tpmi_power_domains.c
> +++ b/drivers/platform/x86/intel/tpmi_power_domains.c
> @@ -139,6 +139,13 @@ cpumask_t *tpmi_get_power_domain_mask(int
> cpu_no)
> =C2=A0	cpumask_t *mask;
> =C2=A0	int index;
> =C2=A0
> +	/*
> +	 * When built in, this stays callable after tpmi_init()
> failed
> +	 * before allocating the array.
> +	 */
> +	if (!tpmi_power_domain_mask)
> +		return NULL;
> +
> =C2=A0	if (cpu_no >=3D num_possible_cpus())
> =C2=A0		return NULL;
> =C2=A0
> @@ -256,6 +263,7 @@ static int __init tpmi_init(void)
> =C2=A0
> =C2=A0free_domain_mask:
> =C2=A0	kfree(tpmi_power_domain_mask);
> +	tpmi_power_domain_mask =3D NULL;
> =C2=A0
> =C2=A0	return ret;
> =C2=A0}
> @@ -265,6 +273,7 @@ static void __exit tpmi_exit(void)
> =C2=A0{
> =C2=A0	cpuhp_remove_state(tpmi_hp_state);
> =C2=A0	kfree(tpmi_power_domain_mask);
> +	tpmi_power_domain_mask =3D NULL;
> =C2=A0	kfree(domain_die_map);
> =C2=A0	domain_die_map =3D NULL;
> =C2=A0}
