Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B334231717F;
	Wed, 22 Apr 2026 16:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776874643; cv=none; b=DtQDjMgbK+MmpkAvz1yS02mSM4opoyf+f2G7ub0JmYNDSkEY/NJ/BkmCJA0I6E7K97+NslmRQbOEZSrlsgrsJULFgrSTIoYOGzJNeoWY0yn3kaChV/gu/569RO88A7C/u/wrFPAbrrVDGlZugQtnGTB4YV7qzoKG9sdjT9Lkb1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776874643; c=relaxed/simple;
	bh=/LQIFMF9HQ0eexfo+GChSIyHFe3HUIpOs/MwKFAydwQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hJ0TUf+vz7BTwhDyk0Ttsa9GdWpCZAIFjRFOYY27KzfaPTDQxGN+cH0xz1MJVrqSnqYz3hPRzYe/BWQJe/nd3Hc+D0pVW9DpDVPDvYf+Z+GnK+Een0BK3ejUdJpQanfEp7duu0jY6Uco1pzEssSxUVk3aJIquYpgbvDaA1jqC9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nOHRZ5SO; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nOHRZ5SO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776874641; x=1808410641;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=/LQIFMF9HQ0eexfo+GChSIyHFe3HUIpOs/MwKFAydwQ=;
  b=nOHRZ5SO3oWJKX7OriLnLUQV9SVyl/Zk5XYChV4BE2+KkEJ1j1IktUIU
   yu2qEcX9XUdrySt7I2N+Gesyn1gB7E+Zyvc5FonosEF/64K1cWFqab7dT
   a0aRG3l314zCtqJjBbmcN9S01S4ZODzrpnDPPKuY+eebBwf/cZOTIDtmF
   dZu5wzxcadsMveCXr9gVhmlzqq8KKyOkC+vO5W/M/hG+oFLgKD984HETe
   8tdVUXEnirYImob8RZQSQaqlvmEEIfc6fiYs1Dnxu2tQBSBxSI2/2CHlU
   YpImZEDZ+spJMsxsHJHyFZQWIRH/yhQTnY+Zci8d9iUcPvlgZnWWGV+Vr
   g==;
X-CSE-ConnectionGUID: ajF0WLpsRYagXPaH0X5ekg==
X-CSE-MsgGUID: zS/oJMPfTRK2ulQKEAovdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="88529846"
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; 
   d="scan'208";a="88529846"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 09:17:20 -0700
X-CSE-ConnectionGUID: 8vGVsw0RQa+t7/rJaPsOyg==
X-CSE-MsgGUID: ppxpvPD9QGCaHvfRueNAxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; 
   d="scan'208";a="227813224"
Received: from spandruv-desk2.jf.intel.com ([10.88.27.176])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 09:17:19 -0700
Message-ID: <b0f831a9f9c59563b16de702b4e4c37c2279b45c.camel@linux.intel.com>
Subject: Re: [PATCH v3 2/2] platform/x86/intel-uncore-freq: Expose instance
 ID in the sysfs
From: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
To: Maciej Wieczor-Retman <m.wieczorretman@pm.me>,
 skhan@linuxfoundation.org, 	ilpo.jarvinen@linux.intel.com,
 hansg@kernel.org, corbet@lwn.net
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	linux-doc@vger.kernel.org, Maciej Wieczor-Retman
	 <maciej.wieczor-retman@intel.com>
Date: Wed, 22 Apr 2026 09:17:19 -0700
In-Reply-To: <b9ae8d5f1ab86bcdb1a8636fa48865a9e49e2e21.1775665057.git.m.wieczorretman@pm.me>
References: <cover.1775665057.git.m.wieczorretman@pm.me>
	 <b9ae8d5f1ab86bcdb1a8636fa48865a9e49e2e21.1775665057.git.m.wieczorretman@pm.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2026-04-08 at 16:27 +0000, Maciej Wieczor-Retman wrote:
> From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
>=20
> Insufficient data is exported to allow direct access to TPMI
> registers
> through MMIO. On non-partitioned systems domain_id can be used both
> for
> mapping CPUs to their compute die IDs and for mapping die indices to
> their MMIO memory blocks presented to userspace via TPMI debugfs.
> However on partitioned systems the debugfs association doesn't work
> anymore. This is due to how TPMI partitioning influences domain_id
> calculation. The previous association is lost on partitioned systems
> in
> order to keep using domain_id for mapping CPUs to compute dies.
>=20
> Expose the instance ID in sysfs that's unique in the scope of one
> TPMI
> partition (and hence one TPMI device). It's a physical index into
> mapped
> MMIO blocks and can be used by userspace to figure out how to
> directly
> access TPMI registers.
>=20
> Signed-off-by: Maciej Wieczor-Retman
> <maciej.wieczor-retman@intel.com>
Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>

> ---
> Changelog v3:
> - Change sprintf -> sysfs_emit in show_instance_id().
> - Change part of patch message 'MMIO memory blocks mapped' -> 'MMIO
> =C2=A0 memory blocks presented to userspace...'
> - Change assigning function to static inline.
>=20
> Changelog v2:
> - Redo the patch message.
> - Redo the function comment that assigns instance_id.
> - Modify the documentation.
>=20
> =C2=A0.../pm/intel_uncore_frequency_scaling.rst=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 7 +++++++
> =C2=A0.../uncore-frequency/uncore-frequency-common.c=C2=A0=C2=A0=C2=A0 | =
10 ++++++++++
> =C2=A0.../uncore-frequency/uncore-frequency-common.h=C2=A0=C2=A0=C2=A0 |=
=C2=A0 6 +++++-
> =C2=A0.../uncore-frequency/uncore-frequency-tpmi.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 15
> ++++++++++++++-
> =C2=A04 files changed, 36 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/admin-
> guide/pm/intel_uncore_frequency_scaling.rst b/Documentation/admin-
> guide/pm/intel_uncore_frequency_scaling.rst
> index d367ba4d744a..b43ad4d5e333 100644
> --- a/Documentation/admin-guide/pm/intel_uncore_frequency_scaling.rst
> +++ b/Documentation/admin-guide/pm/intel_uncore_frequency_scaling.rst
> @@ -88,8 +88,15 @@ and "fabric_cluster_id" in the directory.
> =C2=A0
> =C2=A0Attributes in each directory:
> =C2=A0
> +``instance_id``
> +	This attribute is used to get die indices in userspace
> mapped MMIO
> +	blocks. Indices are local to a single TPMI partition. Needed
> for direct
> +	TPMI register access.
> +
> =C2=A0``domain_id``
> =C2=A0	This attribute is used to get the power domain id of this
> instance.
> +	Indices are unique in all TPMI partitions on a given CPU
> package. Can be
> +	used to map compute dies to corresponding CPUs.
> =C2=A0
> =C2=A0``die_id``
> =C2=A0	This attribute is used to get the Linux die id of this
> instance.
> diff --git a/drivers/platform/x86/intel/uncore-frequency/uncore-
> frequency-common.c b/drivers/platform/x86/intel/uncore-
> frequency/uncore-frequency-common.c
> index 25ab511ed8d2..3b554418a7a3 100644
> --- a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-
> common.c
> +++ b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-
> common.c
> @@ -29,6 +29,13 @@ static ssize_t show_domain_id(struct kobject
> *kobj, struct kobj_attribute *attr,
> =C2=A0	return sysfs_emit(buf, "%u\n", data->domain_id);
> =C2=A0}
> =C2=A0
> +static ssize_t show_instance_id(struct kobject *kobj, struct
> kobj_attribute *attr, char *buf)
> +{
> +	struct uncore_data *data =3D container_of(attr, struct
> uncore_data, instance_id_kobj_attr);
> +
> +	return sysfs_emit(buf, "%u\n", data->instance_id);
> +}
> +
> =C2=A0static ssize_t show_fabric_cluster_id(struct kobject *kobj, struct
> kobj_attribute *attr, char *buf)
> =C2=A0{
> =C2=A0	struct uncore_data *data =3D container_of(attr, struct
> uncore_data, fabric_cluster_id_kobj_attr);
> @@ -200,6 +207,9 @@ static int create_attr_group(struct uncore_data
> *data, char *name)
> =C2=A0	if (data->domain_id !=3D UNCORE_DOMAIN_ID_INVALID) {
> =C2=A0		init_attribute_root_ro(domain_id);
> =C2=A0		data->uncore_attrs[index++] =3D &data-
> >domain_id_kobj_attr.attr;
> +		init_attribute_root_ro(instance_id);
> +		data->uncore_attrs[index++] =3D &data-
> >instance_id_kobj_attr.attr;
> +
> =C2=A0		init_attribute_root_ro(fabric_cluster_id);
> =C2=A0		data->uncore_attrs[index++] =3D &data-
> >fabric_cluster_id_kobj_attr.attr;
> =C2=A0		init_attribute_root_ro(package_id);
> diff --git a/drivers/platform/x86/intel/uncore-frequency/uncore-
> frequency-common.h b/drivers/platform/x86/intel/uncore-
> frequency/uncore-frequency-common.h
> index 0d5fd91ee0aa..e319448dc1a4 100644
> --- a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-
> common.h
> +++ b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-
> common.h
> @@ -36,6 +36,7 @@
> =C2=A0 * @domain_id:		Power domain id for this instance
> =C2=A0 * @cluster_id:		cluster id in a domain
> =C2=A0 * @seqnum_id:		Unique sequential id to append to directory
> name
> + * @instance_id:	Die indices or feature instances for a
> single TPMI device
> =C2=A0 * @name:		Sysfs entry name for this instance
> =C2=A0 * @agent_type_mask:	Bit mask of all hardware agents for this
> domain
> =C2=A0 * @uncore_attr_group:	Attribute group storage
> @@ -56,6 +57,7 @@
> =C2=A0 * @elc_floor_freq_khz_kobj_attr: Storage for kobject attribute
> elc_floor_freq_khz
> =C2=A0 * @agent_types_kobj_attr: Storage for kobject attribute agent_type
> =C2=A0 * @die_id_kobj_attr:	Attribute storage for die_id information
> + * @instance_id_kobj_attr: Attribute storage for instance_id value
> =C2=A0 * @uncore_attrs:	Attribute storage for group creation
> =C2=A0 *
> =C2=A0 * This structure is used to encapsulate all data related to uncore
> sysfs
> @@ -72,6 +74,7 @@ struct uncore_data {
> =C2=A0	int domain_id;
> =C2=A0	int cluster_id;
> =C2=A0	int seqnum_id;
> +	int instance_id;
> =C2=A0	char name[32];
> =C2=A0	u16=C2=A0 agent_type_mask;
> =C2=A0
> @@ -90,7 +93,8 @@ struct uncore_data {
> =C2=A0	struct kobj_attribute elc_floor_freq_khz_kobj_attr;
> =C2=A0	struct kobj_attribute agent_types_kobj_attr;
> =C2=A0	struct kobj_attribute die_id_kobj_attr;
> -	struct attribute *uncore_attrs[15];
> +	struct kobj_attribute instance_id_kobj_attr;
> +	struct attribute *uncore_attrs[16];
> =C2=A0};
> =C2=A0
> =C2=A0#define UNCORE_DOMAIN_ID_INVALID	-1
> diff --git a/drivers/platform/x86/intel/uncore-frequency/uncore-
> frequency-tpmi.c b/drivers/platform/x86/intel/uncore-
> frequency/uncore-frequency-tpmi.c
> index 1237d9570886..32d03bee09a0 100644
> --- a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-
> tpmi.c
> +++ b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-
> tpmi.c
> @@ -385,7 +385,19 @@ static u8 io_die_index_next;
> =C2=A0/* Lock to protect io_die_start, io_die_index_next */
> =C2=A0static DEFINE_MUTEX(domain_lock);
> =C2=A0
> -static void set_domain_id(int id,=C2=A0 int num_resources,
> +static inline void set_instance_id(int id, struct
> tpmi_uncore_cluster_info *cluster_info)
> +{
> +	/*
> +	 * On non-partitioned systems domain_id can be used for
> mapping both
> +	 * CPUs to compute die IDs and physical die indexes to MMIO
> mapped
> +	 * memory. However on partitioned systems domain_id loses
> the second
> +	 * association. Therefore instance_id should be used for
> that instead,
> +	 * while domain_id should still be used to match CPUs to
> compute dies.
> +	 */
> +	cluster_info->uncore_data.instance_id =3D id;
> +}
> +
> +static void set_domain_id(int id, int num_resources,
> =C2=A0			=C2=A0 struct oobmsm_plat_info *plat_info,
> =C2=A0			=C2=A0 struct tpmi_uncore_cluster_info
> *cluster_info)
> =C2=A0{
> @@ -686,6 +698,7 @@ static int uncore_probe(struct auxiliary_device
> *auxdev, const struct auxiliary_
> =C2=A0			set_cdie_id(i, cluster_info, plat_info);
> =C2=A0
> =C2=A0			set_domain_id(i, num_resources, plat_info,
> cluster_info);
> +			set_instance_id(i, cluster_info);
> =C2=A0
> =C2=A0			cluster_info->uncore_root =3D tpmi_uncore;
> =C2=A0
