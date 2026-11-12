Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794527345;
	b=4rArF63MX3ylCp22ZlKM+RM5+qqlTJYV5RSNNuWeXWPSIhVtomsnW5wIuCvxzdHIvvjn
	 4mqOEbXuNfKDW+WUQ37cyDy9sJYjvlbAiMmLlup/AMzBDEGi9UsPM//IgdXWOzZJ1fS+c
	 9VX+myP7ul4HRduJVlocfZWkfNLYasdvOOzuoiNB1BDpjwFSDbtZOOT2EYOXc2XHaa3Qm
	 NlEnyJClqDKHVVuCLs+hjEJn5b2r1WoTo8Fn+P66rvSE/uw6Gh7BWRjyBCIJKCmXmvYku
	 ZM2msQ/19wyVwiQDuSpFdIbFIIZBOkUFDvw/CyTk3lDinJVLi69l7qdvL0o8aFG2q/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794527345;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Subject:
	 From:To:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=4xzM9Zt7j0c9mK4mUvNSiVbNr5O72xR/ekydC98O41w=;
	b=XfwrOYYD4cN1/m7uQlykqntHuWWw0Z+f4qkn7JxmVINe9uAcozgVYNN/wTHLTo84HvDy
	 +hqeTy49j1GSQ6nYDzI7hPeP+upJgFAAqqokaQPtu9VjpJ/Z4px3gzUIlsZ8vmLoeNZzF
	 MCrgOi7NXmiW5HVAm9VceSz+V7wq7sX22SrWacnmfAlRuJ4xBxrYru0KzBeyX1xB3dFyU
	 KElHg3KjvKPxl00YRuRiMpbJrjlXCZi4/dUNMAuUrINB3kRy1rXgZtu4rQtnONhoBi+RV
	 OPXKvWb+kI8kDOVyyHZ91x6qbWr2Mbq1OZY/9TUjREb3sC22bq/fZ3asvhufotM6n8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lbBu1TFZ;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA919606A321
	for <platform-driver-x86@vger.kernel.org>; Thu, 12 Nov 2026 23:49:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA919606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lbBu1TFZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794527345; x=1826063345;
  h=message-id:subject:from:to:date:in-reply-to:references:
   content-transfer-encoding:mime-version;
  bh=VEMvyxxj6LN6nwGukyVqiEO0WYqZE27WAIgqUdESwUQ=;
  b=lbBu1TFZo4NUhfEnDJ0EGgGWA/W1imhOwSPo8ZPiLVcLpkZuotjNdrfM
   Nlr1gdHUSWP1nlES2DWDre8uzcbNAReCbgwV10fnVa/RDO/oCln9GwLxV
   62xFpLCTIIT/gwGTFnNsuenht3CxACAGOypTArVLl12V6+1wv0ysmajmL
   cBc1L58Zfz3YLiMPTZgfl5epK/uEqiDkneFu7k/G/TbGrz2Hg7a0lr5jG
   798O/SUjnq0VrQ3hyB5q00DqbiieXpVfr6wEHOOomUm1BxfiFOEjugDTe
   z2n/S+R6BJfKrMf3KvgydujJ6Cd8b1WV7nMKU7rsQ/heYWf2/XtqBCz2l
   w==;
X-CSE-ConnectionGUID: wKlT4M+PSfaVzywz33lkzQ==
X-CSE-MsgGUID: aNiGLed3S3SSnnAwDhpvpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3247770"
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="3247770"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 15:49:04 -0800
X-CSE-ConnectionGUID: q/hDH8QAQC2zu8hjfcUb0g==
X-CSE-MsgGUID: MC+HNcX9R8u+BlYK+/fYFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="8613598"
Received: from spandruv-desk2.jf.intel.com ([10.24.80.14])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 15:49:04 -0800
Message-ID: <1c795c8a8c1d7e2633ba6ca6efb5d94568b4dd34.camel@linux.intel.com>
Subject: Re: [PATCH] platform/x86: TPMI: clean up CPU mappings on offline
From: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
To: lirongqing <lirongqing@baidu.com>, Hans de Goede <hansg@kernel.org>, 
 Ilpo =?ISO-8859-1?Q?J=E4rvinen?=	 <ilpo.jarvinen@linux.intel.com>, Kristen
 Carlson Accardi	 <kristen.c.accardi@intel.com>, Tero Kristo
 <tero.kristo@linux.intel.com>,  Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, platform-driver-x86@vger.kernel.org
Date: Thu, 12 Nov 2026 15:49:03 -0800
In-Reply-To: <20261104032724.1824-1-lirongqing@baidu.com>
References: <20261104032724.1824-1-lirongqing@baidu.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Wed, 2026-11-04 at 11:27 +0800, lirongqing wrote:
> From: Li RongQing <lirongqing@baidu.com>
>=20
> The TPMI power domain driver adds each online CPU to a hash table and
> its power domain mask, but does not remove either entry when the CPU
> goes offline. Bringing a CPU back online can therefore insert the
> same
> hlist node again and leave stale CPU mask state.
>=20
> Register an offline callback that removes the hash entry and clears
> the
> CPU from its power domain mask.
>=20
> Fixes: 17ca2780458c ("platform/x86/intel: TPMI domain id and CPU
> mapping")
> Signed-off-by: Li RongQing <lirongqing@baidu.com>

We have no case currently to get offlined CPU's data. So will add when
we need.

As a convention we capitalize the first letter after "TPMI:" in this
driver, so consider changing that.

Otherwise

Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>

> ---
> =C2=A0drivers/platform/x86/intel/tpmi_power_domains.c | 19
> ++++++++++++++++++-
> =C2=A01 file changed, 18 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/platform/x86/intel/tpmi_power_domains.c
> b/drivers/platform/x86/intel/tpmi_power_domains.c
> index d89b989..c3fd1bd 100644
> --- a/drivers/platform/x86/intel/tpmi_power_domains.c
> +++ b/drivers/platform/x86/intel/tpmi_power_domains.c
> @@ -220,6 +220,23 @@ static int tpmi_cpu_online(unsigned int cpu)
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> +static int tpmi_cpu_offline(unsigned int cpu)
> +{
> +	struct tpmi_cpu_info *info =3D &per_cpu(tpmi_cpu_info, cpu);
> +	int index;
> +
> +	if (hlist_unhashed(&info->hnode) ||
> !tpmi_domain_is_valid(info))
> +		return 0;
> +
> +	index =3D info->pkg_id * MAX_POWER_DOMAINS + info-
> >punit_domain_id;
> +
> +	guard(mutex)(&tpmi_lock);
> +	cpumask_clear_cpu(cpu, &tpmi_power_domain_mask[index]);
> +	hash_del(&info->hnode);
> +
> +	return 0;
> +}
> +
> =C2=A0static int __init tpmi_init(void)
> =C2=A0{
> =C2=A0	const struct x86_cpu_id *id;
> @@ -249,7 +266,7 @@ static int __init tpmi_init(void)
> =C2=A0
> =C2=A0	ret =3D cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
> =C2=A0				"platform/x86/tpmi_power_domains:onl
> ine",
> -				tpmi_cpu_online, NULL);
> +				tpmi_cpu_online, tpmi_cpu_offline);
> =C2=A0	if (ret < 0)
> =C2=A0		goto free_domain_map;
> =C2=A0
