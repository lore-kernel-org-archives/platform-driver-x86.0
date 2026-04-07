Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3CD347BBD;
	Tue,  7 Apr 2026 18:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775584988; cv=none; b=M57ie74Jmgchke2+J5ZsgmPsQzsTszvNRHv434Yx54U07DdTHjxR/87eNQPtP8nzWvV6gyl/yGnIcz9dmnQv9ToGSXa8n5gAvQCFUW7Qirn/vqayVxWPwbicpNvm0/f1yp8ig1m4rGgpri5+NPPNGnzwsmmhLnVSawUN68Y360A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775584988; c=relaxed/simple;
	bh=5It6cQDmkN9kHM+kCUUcGmQJYjDE4GifMyM2hHwscUs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iMLyDFrcBFMXPF9HoqTVoy+KOU6o+RGkHqnDoNUMDDAYhArBWmZU7TKYBqiGofp5JTK+T1/c1QJWbzWq88ZoVo6vncR5gjn3M0u82SXstbHgEwsHMCPIh8/3l2hZUiqVoMl26QZniRwHalch+lyMwCBcn47PkPzpj9hfQMrRb7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F/94NRlm; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F/94NRlm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775584987; x=1807120987;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=5It6cQDmkN9kHM+kCUUcGmQJYjDE4GifMyM2hHwscUs=;
  b=F/94NRlmDXdaHSnc/7yLrrAtqsriA6x0wo9pvHRTZp1zAT1TiYs9tl2w
   tr986oZAj4wfRXq9v89GQW4qO4+LNw+fsshU4UMTOVtszlRD/G/DeFHrQ
   9oeoI7oYMAz9DEVTPFzUbDVCprOqZJSCVxGuezYOd41LcDo8LUT5Kyrcg
   FsFv37SRZVELolIFnRYMjgW1lrpEX/sE8++GgOaSWHG1pHgPkznQKAxuE
   dU6VkqOJpKdwv1wV6qx8hEPOzwHOGckOEDN78BUVgu3cSdIAesR6HT4tU
   4CikbsRa9+P7HhFFm3BevEdZ7/A8Jw9j0fZ0YAqg01IAXQuzqAqAXPmCe
   g==;
X-CSE-ConnectionGUID: tL97zpr0Qgy948v1lKlUaA==
X-CSE-MsgGUID: s0joBiqLSbaiGnywBS9KAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="76275671"
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; 
   d="scan'208";a="76275671"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 11:03:07 -0700
X-CSE-ConnectionGUID: ay/s5OJkQyWAYO+ZbNr7vg==
X-CSE-MsgGUID: 7wul7hSYRRyGoKDAFrcksA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; 
   d="scan'208";a="233205606"
Received: from spandruv-desk2.jf.intel.com ([10.88.27.176])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 11:03:08 -0700
Message-ID: <c40b5b4b63fbc9b757892aa5927f5c46655b94d5.camel@linux.intel.com>
Subject: Re: [PATCH v2 2/2] platform/x86/intel-uncore-freq: Expose instance
 ID in the sysfs
From: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
To: Maciej Wieczor-Retman <m.wieczorretman@pm.me>, hansg@kernel.org, 
	ilpo.jarvinen@linux.intel.com
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	dedekind1@gmail.com, artem.bityutskiy@linux.intel.com, Maciej
 Wieczor-Retman	 <maciej.wieczor-retman@intel.com>
Date: Tue, 07 Apr 2026 11:03:06 -0700
In-Reply-To: <191ea429fcf60aa6612b89dc9357c6d452c50be4.1775159775.git.m.wieczorretman@pm.me>
References: <cover.1775159775.git.m.wieczorretman@pm.me>
	 <191ea429fcf60aa6612b89dc9357c6d452c50be4.1775159775.git.m.wieczorretman@pm.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2026-04-02 at 19:59 +0000, Maciej Wieczor-Retman wrote:
> From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
>=20
> Insufficient data is exported to allow direct access to TPMI
> registers
> through MMIO. On non-partitioned systems domain_id can be used both
> for
> mapping CPUs to their compute die IDs and for mapping die indices to
> their MMIO memory blocks mapped
>  into userspace.

not mapped. But presented to user space via TPMI debugfs.

>  However on partitioned
> systems it can't be used for mapping MMIO blocks anymore.
Again not mapping.=20

>  This is due to
> how TPMI partitioning influences domain_id calculation. The previous
> association is lost on partitioned systems in order to keep using
> domain_id for mapping CPUs to compute dies.
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
> ---
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
> index 25ab511ed8d2..7141544ee94b 100644
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
> +	return sprintf(buf, "%u\n", data->instance_id);
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
> index 1237d9570886..1676a2049aad 100644
> --- a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-
> tpmi.c
> +++ b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-
> tpmi.c
> @@ -385,7 +385,19 @@ static u8 io_die_index_next;
> =C2=A0/* Lock to protect io_die_start, io_die_index_next */
> =C2=A0static DEFINE_MUTEX(domain_lock);
> =C2=A0
> -static void set_domain_id(int id,=C2=A0 int num_resources,
> +static void set_instance_id(int id, struct tpmi_uncore_cluster_info
> *cluster_info)
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

Do you need a function for single line assignment? Why not just assign
in the uncore_probe().

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
