Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17ECC194A68
	for <platform-driver-x86@vger.kernel.org>; Wed, 14 Aug 2024 11:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723633226; cv=none; b=hsoUcSpRf6vYCexaiszjQ9mQBWN5R8w+3drKODNk+9SePnStDBi8vkcSZ4z82HoTu9XUcVZzvIdFeHfIOrAHAJhAjnvajQxzEg54Dvv8r+Ey6O0yOWY+oxqwxea85qaRign6v3aX70YzOa1hloE7z1phdwbQSTP4qmQqd1/VXIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723633226; c=relaxed/simple;
	bh=k+Ee5bj5j76fNvze3US0tr0RhSdvg0C2sAr9JbiI4eE=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=rWViJMuTG/OKRrNhprwYf866PCWrUToYqk6QDeIxR4/06+3rVexi4J6VH5zlCiEJ4P14IDAfoMZNY80SyeMG/kWYtt0h2XLW0XXenPxf6GJcJzmI1g3ISBMlpKCJzkPq2F4nmnRM3EXwiQHgn5K05vv8Z4V5kSmf0NmQTChh8Ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mGXzs+eB; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mGXzs+eB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723633225; x=1755169225;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=k+Ee5bj5j76fNvze3US0tr0RhSdvg0C2sAr9JbiI4eE=;
  b=mGXzs+eBdNwHdSXMfcpFo36Sey+ykj5zwkENfLPBTEYP9guZocuXbMEt
   /d0m2xnLiqZr0eC341t8egdr3EY9xPulAMZFmts/Xj07nCxerQelT8Qes
   sAJelxwJUZho1xfki9l0+L6Q8nzXiT5NklazPWQvPtC4qL3yCDfFDBhFR
   vcqqGCBAS71iQUcMzLmvkpvCvev6/bSHMWUmZTqUwHTaEj/HlQdbESj3X
   Dx1keuAVMzetgBMMt+miQ0JXFJPJh2+prBVMWAPHXlTRc9NZ4BbWm2h4b
   wFZ1k+KwQJozhd0L+0kgO84WucPj2EiwEWlRZEIf1M8Uhmzo2UuD1fPjd
   w==;
X-CSE-ConnectionGUID: vkMkidD0TN++L530ZdIKYw==
X-CSE-MsgGUID: ZVk9TBF6TrOpZzqNFogjdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="21700134"
X-IronPort-AV: E=Sophos;i="6.09,145,1716274800"; 
   d="scan'208";a="21700134"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2024 04:00:24 -0700
X-CSE-ConnectionGUID: tvV+YeUpRQiRKEVVzinpcw==
X-CSE-MsgGUID: yguIu0LwQsWy4HuEn63rCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,145,1716274800"; 
   d="scan'208";a="63825653"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.245.61])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2024 04:00:22 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 14 Aug 2024 14:00:17 +0300 (EEST)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, 
    Patil.Reddy@amd.com
Subject: Re: [PATCH v3 2/2] platform/x86/amd/pmf: Update SMU metrics table
 for 1AH family series
In-Reply-To: <20240813133540.367384-2-Shyam-sundar.S-k@amd.com>
Message-ID: <005740e9-3a9a-6df7-8ed7-96452d541169@linux.intel.com>
References: <20240813133540.367384-1-Shyam-sundar.S-k@amd.com> <20240813133540.367384-2-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-77615446-1723633217=:1018"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-77615446-1723633217=:1018
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 13 Aug 2024, Shyam Sundar S K wrote:

> The SMU metrics table has been revised for the 1AH family series.
> Introduce a new metrics table structure to retrieve comprehensive metrics
> information from the PMFW. This information will be utilized by the PMF
> driver to adjust system thermals.
>=20
> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
> v3:
>  - Address remarks from Ilpo on the helper for C0 residency calculation
>=20
> v2:
>  - Align comments
>  - add helper for max and avg calculation of C0 residency
>=20
>  drivers/platform/x86/amd/pmf/core.c | 14 +++++++-
>  drivers/platform/x86/amd/pmf/pmf.h  | 49 ++++++++++++++++++++++++++
>  drivers/platform/x86/amd/pmf/spc.c  | 53 ++++++++++++++++++++---------
>  3 files changed, 99 insertions(+), 17 deletions(-)
>=20
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/a=
md/pmf/core.c
> index 88314b0277a3..0ba9045224d9 100644
> --- a/drivers/platform/x86/amd/pmf/core.c
> +++ b/drivers/platform/x86/amd/pmf/core.c
> @@ -255,7 +255,19 @@ int amd_pmf_set_dram_addr(struct amd_pmf_dev *dev, b=
ool alloc_buffer)
> =20
>  =09/* Get Metrics Table Address */
>  =09if (alloc_buffer) {
> -=09=09dev->buf =3D kzalloc(sizeof(dev->m_table), GFP_KERNEL);
> +=09=09switch (dev->cpu_id) {
> +=09=09case AMD_CPU_ID_PS:
> +=09=09case AMD_CPU_ID_RMB:
> +=09=09=09dev->mtable_size =3D sizeof(dev->m_table);
> +=09=09=09break;
> +=09=09case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
> +=09=09=09dev->mtable_size =3D sizeof(dev->m_table_v2);
> +=09=09=09break;
> +=09=09default:
> +=09=09=09dev_err(dev->dev, "Invalid cpu id: 0x%x", dev->cpu_id);

CPU

> +=09=09}
> +
> +=09=09dev->buf =3D kzalloc(dev->mtable_size, GFP_KERNEL);
>  =09=09if (!dev->buf)
>  =09=09=09return -ENOMEM;
>  =09}
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/am=
d/pmf/pmf.h
> index 9fc26f672f12..8ce8816da9c1 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -198,6 +198,53 @@ struct apmf_fan_idx {
>  =09u32 fan_ctl_idx;
>  } __packed;
> =20
> +struct smu_pmf_metrics_v2 {
> +=09u16 core_frequency[16];=09=09/* MHz */
> +=09u16 core_power[16];=09=09/* mW */
> +=09u16 core_temp[16];=09=09/* centi-C */
> +=09u16 gfx_temp;=09=09=09/* centi-C */
> +=09u16 soc_temp;=09=09=09/* centi-C */
> +=09u16 stapm_opn_limit;=09=09/* mW */
> +=09u16 stapm_cur_limit;=09=09/* mW */
> +=09u16 infra_cpu_maxfreq;=09=09/* MHz */
> +=09u16 infra_gfx_maxfreq;=09=09/* MHz */
> +=09u16 skin_temp;=09=09=09/* centi-C */
> +=09u16 gfxclk_freq;=09=09/* MHz */
> +=09u16 fclk_freq;=09=09=09/* MHz */
> +=09u16 gfx_activity;=09=09/* GFX busy % [0-100] */
> +=09u16 socclk_freq;=09=09/* MHz */
> +=09u16 vclk_freq;=09=09=09/* MHz */
> +=09u16 vcn_activity;=09=09/* VCN busy % [0-100] */
> +=09u16 vpeclk_freq;=09=09/* MHz */
> +=09u16 ipuclk_freq;=09=09/* MHz */
> +=09u16 ipu_busy[8];=09=09/* NPU busy % [0-100] */
> +=09u16 dram_reads;=09=09=09/* MB/sec */
> +=09u16 dram_writes;=09=09/* MB/sec */
> +=09u16 core_c0residency[16];=09/* C0 residency % [0-100] */
> +=09u16 ipu_power;=09=09=09/* mW */
> +=09u32 apu_power;=09=09=09/* mW */
> +=09u32 gfx_power;=09=09=09/* mW */
> +=09u32 dgpu_power;=09=09=09/* mW */
> +=09u32 socket_power;=09=09/* mW */
> +=09u32 all_core_power;=09=09/* mW */
> +=09u32 filter_alpha_value;=09=09/* time constant [us] */
> +=09u32 metrics_counter;
> +=09u16 memclk_freq;=09=09/* MHz */
> +=09u16 mpipuclk_freq;=09=09/* MHz */
> +=09u16 ipu_reads;=09=09=09/* MB/sec */
> +=09u16 ipu_writes;=09=09=09/* MB/sec */
> +=09u32 throttle_residency_prochot;
> +=09u32 throttle_residency_spl;
> +=09u32 throttle_residency_fppt;
> +=09u32 throttle_residency_sppt;
> +=09u32 throttle_residency_thm_core;
> +=09u32 throttle_residency_thm_gfx;
> +=09u32 throttle_residency_thm_soc;
> +=09u16 psys;
> +=09u16 spare1;
> +=09u32 spare[6];
> +} __packed;
> +
>  struct smu_pmf_metrics {
>  =09u16 gfxclk_freq; /* in MHz */
>  =09u16 socclk_freq; /* in MHz */
> @@ -295,6 +342,7 @@ struct amd_pmf_dev {
>  =09int hb_interval; /* SBIOS heartbeat interval */
>  =09struct delayed_work heart_beat;
>  =09struct smu_pmf_metrics m_table;
> +=09struct smu_pmf_metrics_v2 m_table_v2;
>  =09struct delayed_work work_buffer;
>  =09ktime_t start_time;
>  =09int socket_power_history[AVG_SAMPLE_SIZE];
> @@ -319,6 +367,7 @@ struct amd_pmf_dev {
>  =09bool smart_pc_enabled;
>  =09u16 pmf_if_version;
>  =09struct input_dev *pmf_idev;
> +=09size_t mtable_size;
>  };
> =20
>  struct apmf_sps_prop_granular_v2 {
> diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/am=
d/pmf/spc.c
> index 3c153fb1425e..74a5e325b6c3 100644
> --- a/drivers/platform/x86/amd/pmf/spc.c
> +++ b/drivers/platform/x86/amd/pmf/spc.c
> @@ -53,30 +53,51 @@ void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, =
struct ta_pmf_enact_table *
>  void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact=
_table *in) {}
>  #endif
> =20
> -static void amd_pmf_get_smu_info(struct amd_pmf_dev *dev, struct ta_pmf_=
enact_table *in)
> +static void amd_pmf_get_c0_residency(u16 *core_residency, u16 size, stru=
ct ta_pmf_enact_table *in)
>  {
>  =09u16 max, avg =3D 0;
>  =09int i;
> =20
> -=09memset(dev->buf, 0, sizeof(dev->m_table));
> -=09amd_pmf_send_cmd(dev, SET_TRANSFER_TABLE, 0, 7, NULL);
> -=09memcpy(&dev->m_table, dev->buf, sizeof(dev->m_table));
> -
> -=09in->ev_info.socket_power =3D dev->m_table.apu_power + dev->m_table.dg=
pu_power;
> -=09in->ev_info.skin_temperature =3D dev->m_table.skin_temp;
> -
>  =09/* Get the avg and max C0 residency of all the cores */
> -=09max =3D dev->m_table.avg_core_c0residency[0];
> -=09for (i =3D 0; i < ARRAY_SIZE(dev->m_table.avg_core_c0residency); i++)=
 {
> -=09=09avg +=3D dev->m_table.avg_core_c0residency[i];
> -=09=09if (dev->m_table.avg_core_c0residency[i] > max)
> -=09=09=09max =3D dev->m_table.avg_core_c0residency[i];
> +=09max =3D *core_residency;
> +=09for (i =3D 0; i < size; i++) {
> +=09=09avg +=3D core_residency[i];

IIRC, we already talked earlier about the possibility of overflow when=20
summing n u16 into one u16 and you said it was not possible. I hope that=20
hasn't changed with v2?

> +=09=09if (core_residency[i] > max)
> +=09=09=09max =3D core_residency[i];
>  =09}
> -
> -=09avg =3D DIV_ROUND_CLOSEST(avg, ARRAY_SIZE(dev->m_table.avg_core_c0res=
idency));
> +=09avg =3D DIV_ROUND_CLOSEST(avg, size);
>  =09in->ev_info.avg_c0residency =3D avg;
>  =09in->ev_info.max_c0residency =3D max;
> -=09in->ev_info.gfx_busy =3D dev->m_table.avg_gfx_activity;
> +}
> +
> +static void amd_pmf_get_smu_info(struct amd_pmf_dev *dev, struct ta_pmf_=
enact_table *in)
> +{
> +=09u16 size;
> +
> +=09/* Get the updated metrics table data */
> +=09memset(dev->buf, 0, dev->mtable_size);
> +=09amd_pmf_send_cmd(dev, SET_TRANSFER_TABLE, 0, 7, NULL);
> +
> +=09switch (dev->cpu_id) {
> +=09case AMD_CPU_ID_PS:
> +=09=09memcpy(&dev->m_table, dev->buf, dev->mtable_size);
> +=09=09in->ev_info.socket_power =3D dev->m_table.apu_power + dev->m_table=
=2Edgpu_power;
> +=09=09in->ev_info.skin_temperature =3D dev->m_table.skin_temp;
> +=09=09in->ev_info.gfx_busy =3D dev->m_table.avg_gfx_activity;
> +=09=09size =3D ARRAY_SIZE(dev->m_table.avg_core_c0residency);
> +=09=09amd_pmf_get_c0_residency(dev->m_table.avg_core_c0residency, size, =
in);
> +=09=09break;
> +=09case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
> +=09=09memcpy(&dev->m_table_v2, dev->buf, dev->mtable_size);
> +=09=09in->ev_info.socket_power =3D dev->m_table_v2.apu_power + dev->m_ta=
ble_v2.dgpu_power;
> +=09=09in->ev_info.skin_temperature =3D dev->m_table_v2.skin_temp;
> +=09=09in->ev_info.gfx_busy =3D dev->m_table_v2.gfx_activity;
> +=09=09size =3D ARRAY_SIZE(dev->m_table_v2.core_c0residency);
> +=09=09amd_pmf_get_c0_residency(dev->m_table_v2.core_c0residency, size, i=
n);

Thanks, looks much cleaner now!

I don't think there's any reason for size to be u16 though (I'd have=20
expected the size parameter type to be either size_t or unsigned int).

I also don't find the extra local variable for size very useful but it's=20
up to you if you want to do that in two steps or directly within the call=
=20
(it's quite normal pattern to pass the "ptr, ARRAY_SIZE(ptr)" pair to a=20
function).

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>


> +=09=09break;
> +=09default:
> +=09=09dev_err(dev->dev, "Unsupported cpuid: 0x%x", dev->cpu_id);
> +=09}
>  }
> =20
>  static const char * const pmf_battery_supply_name[] =3D {
>=20

--=20
 i.

--8323328-77615446-1723633217=:1018--
