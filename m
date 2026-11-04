Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793806215;
	b=s4t2tzJ9n3vfNIKBpRvdNnwM3XhhXWUUO7WJpvAdTvnxW5pv9xJCghhHTn+KYcSlAu+3
	 DB6cRsglSRicf3sdOyPjZCKP5C3eUzPVaYk/hPpridA1zeFwImrfX7y0Pe/32djqfIO8S
	 0GxeXQO05+YxMxk/+pDRMz9wzNmhG9h/crotWiz0CwsFsDWTd8tvnGFanxEwu6ZW2giRB
	 tTE6qVvStZUpVeiFQsCRIlDJ2U2hZ/9LQaM9cLUJ2vP1kVcZroNM77kSFkaMasRN7vUbC
	 v7FQsKEk6AuUUPtKWoS2qr9KkAze75AsKZ3AAaX9tSCt8QlEKcK/gRn9TURu/bZ5nTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793806215;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Subject:
	 From:To:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=krYZ+JzY9Cun58B3RRfhryI+PAFXChZMaMyRabanV2E=;
	b=gBpFTH9eYYwP9DDTTj3kNGGYu+1ZOnIPk2+Zudgmi7H+SGcELJz06wQybvdWfKGyFvj1
	 4yMd3jAjsRRVdJAllblj7+lhBRE9cExr3lSUaLBI8BxjwMPQdLiiMsW53F/VuSehdsKwH
	 DXFLzO9uOAsfCGlq1d5ABo85CelHMgudpCi5xQZPRuMt+jmvbNEYzWS7U0RjqD7U3weP0
	 0P/7hYIqNp85LYYQBBlWf20SC5wLbd4Q5sEBmdwx9T86OjjtQsct7AOMu7kdUPKhU54MZ
	 2ELE2EPiI4/rAukGIiKLIIM0winCJFmulxWFRZO8kJbVBqHmYYIrwhSXSAZE5u2CAeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dJNFi9b4;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A77E3606A32F
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Nov 2026 15:30:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A77E3606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dJNFi9b4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793806215; x=1825342215;
  h=message-id:subject:from:to:date:in-reply-to:references:
   content-transfer-encoding:mime-version;
  bh=+54vo1mfwNW6L90qqCjqSfrk9+5EICZTc8uNM2j4KoY=;
  b=dJNFi9b4w4kFvLJIPu3tN2XgM0aXtReA4clWfB0KtPCnwMIlVUD+poGE
   trlCwrrhm0Jqc0MX4Vlk2ijUFIDuRDFMi5KqxKEnE5VpBlQxJEX9+EtW7
   hsJfG651e/mKrM1bgc3qcAKICwUTnOM80E9VSN2GDpmiF3XQ2HoK/hBPR
   KHRRc3MRbPJE17og9UAB1VHo2hKPMF3hhckU2cM8OT/+79dW40abCoN69
   W//Q13V1oUddp8X5kS0yJYkYy3F0w7pUz8mrYZsa7h96patv4qpzhy7Iv
   SLgTZrU6X8j7qD99YdjZrh7BqUSnSRv7dCTwLyUzP+6Buzvd9LiA4HciB
   A==;
X-CSE-ConnectionGUID: ONEZlu6YR6KE7u/K33Z/sg==
X-CSE-MsgGUID: xOB4j56BShekpeGnNq8n4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2578326"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2578326"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 07:30:15 -0800
X-CSE-ConnectionGUID: 652OiN9IS6KuuUpRT586Eg==
X-CSE-MsgGUID: yqBdJ5wbT6O2twRVUiqTcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="6878996"
Received: from spandruv-mobl5.amr.corp.intel.com (HELO [10.124.223.198]) ([10.124.223.198])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 07:30:14 -0800
Message-ID: <245eea039c692d03736fcf2ca2448a271fa135ce.camel@linux.intel.com>
Subject: Re: [PATCH] platform/x86: TPMI: clean up CPU mappings on offline
From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To: lirongqing <lirongqing@baidu.com>, Hans de Goede <hansg@kernel.org>, 
 Ilpo =?ISO-8859-1?Q?J=E4rvinen?=	 <ilpo.jarvinen@linux.intel.com>, Kristen
 Carlson Accardi	 <kristen.c.accardi@intel.com>, Tero Kristo
 <tero.kristo@linux.intel.com>,  Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, platform-driver-x86@vger.kernel.org
Date: Wed, 04 Nov 2026 07:30:13 -0800
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

Hi RonQing,

Thanks for the patch.

TPMI feature doesn't depend on CPU online/offline and can update MMIO
while CPU is offline.

Instead of adding a offline callback, can we just do the below if the
cost of search is not high?

diff --git a/drivers/platform/x86/intel/tpmi_power_domains.c
b/drivers/platform/x86/intel/tpmi_power_domains.c
index d89b9894c42a..dadd5fc5719f 100644
--- a/drivers/platform/x86/intel/tpmi_power_domains.c
+++ b/drivers/platform/x86/intel/tpmi_power_domains.c
@@ -201,6 +201,8 @@ static int tpmi_get_logical_id(unsigned int cpu,
struct tpmi_cpu_info *info)
 static int tpmi_cpu_online(unsigned int cpu)
 {
        struct tpmi_cpu_info *info =3D &per_cpu(tpmi_cpu_info, cpu);
+       struct tpmi_cpu_info *entry;
+       bool found =3D false;
        int ret, index;
=20
        /* Don't fail CPU online for some bad mapping of CPUs */
@@ -212,7 +214,14 @@ static int tpmi_cpu_online(unsigned int cpu)
=20
        guard(mutex)(&tpmi_lock);
        cpumask_set_cpu(cpu, &tpmi_power_domain_mask[index]);
-       hash_add(tpmi_cpu_hash, &info->hnode, info->punit_core_id);
+       hash_for_each_possible(tpmi_cpu_hash, entry, hnode, info-
>punit_core_id) {
+               if (entry =3D=3D info) {
+                       found =3D true;
+                       break;
+               }
+       }
+       if (!found)
+               hash_add(tpmi_cpu_hash, &info->hnode, info-
>punit_core_id);
=20
        domain_die_map[info->pkg_id * MAX_POWER_DOMAINS + info-
>punit_domain_id] =3D
                        topology_die_id(cpu);
Thanks,
Srinivas

> Fixes: 17ca2780458c ("platform/x86/intel: TPMI domain id and CPU
> mapping")
> Signed-off-by: Li RongQing <lirongqing@baidu.com>
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
