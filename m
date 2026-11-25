Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795628963;
	b=Wknq321N10+efd70pJin5lWKLUB94MQrWemufImumS1ohIZ+cR7oMmz6DkP0RDad9pPU
	 9fVXYy+RpoMJuMKjxiP1Q8qs+LMZLc/hr0gCq7Ujdx+u5x0mv0NwERlT+DVEL5AW7YOPn
	 MdrXmAv1sXmepdhHH/0LdhASgxp5hi5OI5govjJ09Z+YVTHMfhTwUWMYd0zpEuNf3HrU7
	 K/O9oX3ZRrxugG4lkF4Sj9BKT6BFED0LU/gVSJARsCPtE503+btxuq0sIpvk4cTm2h1UP
	 aBUd2yyK5pQoZOim1XNq4/TMQ1Cyo4LggyzeO7qdnY/46LlByOrG9vQzI6NV6hqTphQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795628963;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Subject:
	 From:To:Cc:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=VSrdhCV78Kqq7+HZq7TSgeUaWdvzaWenMwAyVDxuYJw=;
	b=doxQkBWcKK4KxxnMIJSQosiBARD1bPGlsY6fh/56lZARkvQw8jBtM/8Cig5Ql5PDiTkA
	 Eg1XmojBVaQy/skvD2XmC0YMYAmJdiNWjAxedUBcqwHfBDdojfDnBIsrv+mdSpUyTt5Pi
	 brTv3Xl5UEuFR7jQBlb+1j4YgqTjL8/CSVwN3iymssxQC/Ve1ExnC9e5rXdt1EPmoz5VH
	 g3/DyLgBYApAeghaf6ww2/cLlt7L88AXO4xKPMKmHohuUOOCYNH4GEke3m3W8JTl7X0OF
	 wun9o5gePlpg1QjIgn/PoGz+bFzvivIr9PfWJ50q6rBcdbHVnHlSkmqo+cfAuLcTKtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gmXpwMT8;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86EE6606A33A;
	Wed, 25 Nov 2026 17:49:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86EE6606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gmXpwMT8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795628963; x=1827164963;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=K9Pyi1PyzMu36Fq+bvuCkDzpoXpuwUc9Lc0EQ63cwbw=;
  b=gmXpwMT8bRxhVuotVeXxCvje86+KLhwQ7FFRogXLeXOYqPgKhEnyJnoe
   4aw2ypdFqpo3FB4NEi54ZNaL/52aqgqIIfLctEUFImISeBeGJDGqLL/Tb
   4fMa/nskbY6kAyJzKI5qVEvBdTCBB5TkGIunGzyL1YBj1q0GCnCJMsKTN
   Wd99G4Q1F6ogtqgsNUKxFvVnbFc4G1KkoXr3j/MdXmPeKNwb4BzThNDv+
   mRfhIRYQyHCXOl2Fu4sv3Zx/R2e8d7RZULg/7jLf3pMJfxMe19vKJu/eY
   zci9Smu0l5j0SR8maRgALnRHPCX6RidX9P5xrFoMFXmIgdxWX3LSket05
   A==;
X-CSE-ConnectionGUID: xsLR8qKdSgKl2TQAEopMaw==
X-CSE-MsgGUID: +0QAVA2ISMOuEv8v/HVUow==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4409236"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4409236"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 09:49:22 -0800
X-CSE-ConnectionGUID: ENU4monsQTWyfOq7WMbOiw==
X-CSE-MsgGUID: TM64G7RVQ96QHve/gDrDyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="11911000"
Received: from spandruv-mobl5.amr.corp.intel.com (HELO [10.124.220.229]) ([10.124.220.229])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 09:49:21 -0800
Message-ID: <39da5f7295537024b97eeca6b567720c117ee002.camel@linux.intel.com>
Subject: Re: [PATCH] platform/x86/intel/tpmi/plr: Fix CPU selection on
 partitioned systems
From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To: Qinyun Tan <qinyuntan@linux.alibaba.com>, Ilpo
 =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, Hans de Goede
 <hansg@kernel.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	xlpang@linux.alibaba.com
Date: Wed, 25 Nov 2026 09:49:19 -0800
In-Reply-To: <20261125092244.3641945-1-qinyuntan@linux.alibaba.com>
References: <20261125092244.3641945-1-qinyuntan@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-3.fc44) 
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Wed, 2026-11-25 at 17:22 +0800, Qinyun Tan wrote:
> When a package has multiple TPMI partitions, PLR can report the same
> CPUs in more than one partition. For example, on a single-package
> system with 72 logical CPUs and two TPMI partitions, both partitions
> list CPUs 0-35 in their PLR status files. CPUs 36-71 are missing.
>=20
> Each partition numbers its PLR resources from zero. The driver
> compares
> that index with the CPU's power domain ID from MSR_PM_LOGICAL_ID,
> which
> is unique within the package. As a result, both partitions select the
> same CPUs. A mailbox read or clear on the second partition then uses
> a
> module ID taken from a CPU in the first partition.
>=20
> Use the partition's cdie_mask to map each PLR resource to its package
> power domain. For compatibility with older platforms, keep using the
> resource index for partition 0 when no mask is available. Skip per-
> CPU
> mailbox accesses if the resource has no valid CPU mapping.
>=20
> Fixes: 9e9397a41b7b ("platform/x86/intel/tpmi/plr: Add support for
> the plr mailbox")
> Signed-off-by: Qinyun Tan <qinyuntan@linux.alibaba.com>

Hi Tan,

Thank you for submitting this change, similar change was in our queue
waiting to test.

You have moved definition of MAX_POWER_DOMAINS to header file, but this
there is no description of that in the commit description.
If you happen to post update, add that.


Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>



> ---
>=20
> Notes:
> =C2=A0=C2=A0=C2=A0 Tested on a single-package system with 72 logical CPUs=
 and two
> TPMI
> =C2=A0=C2=A0=C2=A0 partitions. The PLR status files now list the CPUs bel=
onging to
> each
> =C2=A0=C2=A0=C2=A0 partition.
>=20
> =C2=A0drivers/platform/x86/intel/plr_tpmi.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 31 ++++++++++++++++-
> --
> =C2=A0.../platform/x86/intel/tpmi_power_domains.c=C2=A0=C2=A0 |=C2=A0 2 -=
-
> =C2=A0.../platform/x86/intel/tpmi_power_domains.h=C2=A0=C2=A0 |=C2=A0 2 +=
+
> =C2=A03 files changed, 29 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/platform/x86/intel/plr_tpmi.c
> b/drivers/platform/x86/intel/plr_tpmi.c
> index 785c279b4540..33066f4763ef 100644
> --- a/drivers/platform/x86/intel/plr_tpmi.c
> +++ b/drivers/platform/x86/intel/plr_tpmi.c
> @@ -51,7 +51,7 @@ struct tpmi_plr_die {
> =C2=A0	void __iomem *base;
> =C2=A0	struct mutex lock; /* Protect access to PLR mailbox */
> =C2=A0	int package_id;
> -	int die_id;
> +	int power_domain_id;
> =C2=A0	struct tpmi_plr *plr;
> =C2=A0};
> =C2=A0
> @@ -201,10 +201,13 @@ static int plr_status_show(struct seq_file *s,
> void *unused)
> =C2=A0	seq_puts(s, "cpus");
> =C2=A0	plr_print_bits(s, val, 32);
> =C2=A0
> +	if (plr_die->power_domain_id < 0)
> +		return 0;
> +
> =C2=A0	guard(mutex)(&plr_die->lock);
> =C2=A0
> =C2=A0	for (int cpu =3D 0; cpu < nr_cpu_ids; cpu++) {
> -		if (plr_die->die_id !=3D
> tpmi_get_power_domain_id(cpu))
> +		if (plr_die->power_domain_id !=3D
> tpmi_get_power_domain_id(cpu))
> =C2=A0			continue;
> =C2=A0
> =C2=A0		if (plr_die->package_id !=3D
> topology_physical_package_id(cpu))
> @@ -241,10 +244,13 @@ static ssize_t plr_status_write(struct file
> *filp, const char __user *ubuf,
> =C2=A0
> =C2=A0	plr_write(0, plr_die, PLR_DIE_LEVEL);
> =C2=A0
> +	if (plr_die->power_domain_id < 0)
> +		return count;
> +
> =C2=A0	guard(mutex)(&plr_die->lock);
> =C2=A0
> =C2=A0	for (int cpu =3D 0; cpu < nr_cpu_ids; cpu++) {
> -		if (plr_die->die_id !=3D
> tpmi_get_power_domain_id(cpu))
> +		if (plr_die->power_domain_id !=3D
> tpmi_get_power_domain_id(cpu))
> =C2=A0			continue;
> =C2=A0
> =C2=A0		if (plr_die->package_id !=3D
> topology_physical_package_id(cpu))
> @@ -281,6 +287,23 @@ static void intel_plr_unregister_notifier(struct
> notifier_block *nb)
> =C2=A0	tpmi_unregister_notifier(nb);
> =C2=A0}
> =C2=A0
> +static int plr_power_domain_id(const struct oobmsm_plat_info
> *plat_info, int index)
> +{
> +	u16 mask =3D plat_info->cdie_mask;
> +	int id =3D index;
> +
> +	/* Resource indices are relative to the partition's first
> compute die. */
> +	if (mask)
> +		id +=3D __ffs(mask);
> +	else if (plat_info->partition)
> +		return -ENODEV;
> +
> +	if (id >=3D MAX_POWER_DOMAINS || (mask && !(mask & BIT(id))))
> +		return -ENODEV;
> +
> +	return id;
> +}
> +
> =C2=A0static int intel_plr_probe(struct auxiliary_device *auxdev, const
> struct auxiliary_device_id *id)
> =C2=A0{
> =C2=A0	struct oobmsm_plat_info *plat_info;
> @@ -340,7 +363,7 @@ static int intel_plr_probe(struct
> auxiliary_device *auxdev, const struct auxilia
> =C2=A0
> =C2=A0		plr->die_info[i].base =3D base;
> =C2=A0		plr->die_info[i].package_id =3D plat_info->package_id;
> -		plr->die_info[i].die_id =3D i;
> +		plr->die_info[i].power_domain_id =3D
> plr_power_domain_id(plat_info, i);
> =C2=A0		plr->die_info[i].plr =3D plr;
> =C2=A0		mutex_init(&plr->die_info[i].lock);
> =C2=A0
> diff --git a/drivers/platform/x86/intel/tpmi_power_domains.c
> b/drivers/platform/x86/intel/tpmi_power_domains.c
> index ebe052c3bbe4..f6a46b4571ec 100644
> --- a/drivers/platform/x86/intel/tpmi_power_domains.c
> +++ b/drivers/platform/x86/intel/tpmi_power_domains.c
> @@ -70,8 +70,6 @@ static DEFINE_PER_CPU(struct tpmi_cpu_info,
> tpmi_cpu_info);
> =C2=A0/* The dynamically assigned cpu hotplug state to free later */
> =C2=A0static enum cpuhp_state tpmi_hp_state __read_mostly;
> =C2=A0
> -#define MAX_POWER_DOMAINS	8
> -
> =C2=A0static cpumask_t *tpmi_power_domain_mask;
> =C2=A0
> =C2=A0static u16 *domain_die_map;
> diff --git a/drivers/platform/x86/intel/tpmi_power_domains.h
> b/drivers/platform/x86/intel/tpmi_power_domains.h
> index 2fd0dd7afbd2..43a80b526133 100644
> --- a/drivers/platform/x86/intel/tpmi_power_domains.h
> +++ b/drivers/platform/x86/intel/tpmi_power_domains.h
> @@ -10,6 +10,8 @@
> =C2=A0
> =C2=A0#include <linux/cpumask.h>
> =C2=A0
> +#define MAX_POWER_DOMAINS	8
> +
> =C2=A0int tpmi_get_linux_cpu_number(int package_id, int die_id, int
> punit_core_id);
> =C2=A0int tpmi_get_punit_core_number(int cpu_no);
> =C2=A0int tpmi_get_power_domain_id(int cpu_no);
>=20
> base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
