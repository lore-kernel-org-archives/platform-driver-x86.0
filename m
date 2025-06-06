Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA96126C17
	for <platform-driver-x86@vger.kernel.org>; Fri,  6 Jun 2025 23:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749252064; cv=none; b=WlNDnDh9jO/5HOEkeM8k43b7zYqb0UH1JCLdoPD0e5pPC7m0WypsqWCuLCO6n/HBZ0t8lJAhHAFpcGIDa+2PwSkCdG0+WFB0Rw80CPgp1M5DyNEcanYhEa/i7GInMGXQWrapx0gwF6PDsKjPUpZOjnYwasGHys97IJYvJFwcc1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749252064; c=relaxed/simple;
	bh=wJ1SOAfr/oKBgDB1BsNJSPGPeQDUNjVrHCkfV5GmfXs=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JOs8msbGz8ipFrS0MbK5xWCN157YMzQ1tB9uE6kGhFR7+x/EhIslpe7N24Rcu5zpOn7ZBn5CiSbZDKihqTjvW2KdvIReoe/T0HKwKuhb0uu/lNuEdwx4zGKOHIAU/6sULU0rBAId9LjXp0J2fnWgEPIDgTDN4vb6Qcr0UVbO8+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dx4Tv5/E; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dx4Tv5/E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749252062; x=1780788062;
  h=message-id:subject:from:reply-to:to:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=wJ1SOAfr/oKBgDB1BsNJSPGPeQDUNjVrHCkfV5GmfXs=;
  b=Dx4Tv5/ECs1Caffne3p4pyG2g7z2xMcPe5uyi4eKPF9kj0g0ewp5e+yB
   NjmlYjZKs8NSssHQ0aLlbYIidfWx88BY0G9Dj/He2nP58e4Gdc+BWmfI6
   P+Kr8wGIxeDqr5iXa6Obm7eYT4/kLxiev5m7UOO68EifB7ibucnf6EIqx
   0GezY4DrjeIUowNPfC3YaYLuB3Z7vYbWoZ+aTkLILIFuTAZDGwj0Y9RIh
   7nJVqYR+XMCdyS918q3xu9dTBGFgL/rLrwtCpPlvHmLgb1gzTksUc3sOe
   g0c8jeTe1oZ13ZJxBRIiARbgh40b+vGYJ70l/efX0IAyzmAGOnEPTn1Jj
   w==;
X-CSE-ConnectionGUID: hPS6RH/qTpSx5TiB/cyFNA==
X-CSE-MsgGUID: Y+B7Q1aAQtOA/dHji7f2vw==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="62809729"
X-IronPort-AV: E=Sophos;i="6.16,216,1744095600"; 
   d="scan'208";a="62809729"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2025 16:21:02 -0700
X-CSE-ConnectionGUID: bBbdxQdgRvyU6SyI+OO0Lw==
X-CSE-MsgGUID: K9qEkYpCRIGELHBcBu0AGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,216,1744095600"; 
   d="scan'208";a="145877701"
Received: from aschofie-mobl2.amr.corp.intel.com ([10.124.222.251])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2025 16:21:01 -0700
Message-ID: <18774d865c6517c7ce3a9f2492d0d10d5dd7a26a.camel@linux.intel.com>
Subject: Re: [PATCH v3 11/11] platform/x86/intel/pmt: support BMG crashlog
From: "David E. Box" <david.e.box@linux.intel.com>
Reply-To: david.e.box@linux.intel.com
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>, 
 platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org, 
 hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
 lucas.demarchi@intel.com,  rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, airlied@gmail.com,  simona@ffwll.ch
Date: Fri, 06 Jun 2025 16:21:00 -0700
In-Reply-To: <20250605184444.515556-12-michael.j.ruhl@intel.com>
References: <20250605184444.515556-1-michael.j.ruhl@intel.com>
	 <20250605184444.515556-12-michael.j.ruhl@intel.com>
Organization: David E. Box
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2025-06-05 at 14:44 -0400, Michael J. Ruhl wrote:
> The Battlemage GPU has the type 1 version 2 crashlog feature.
>=20
> Update the crashlog driver to support this crashlog version.
>=20
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
> =C2=A0drivers/platform/x86/intel/pmt/crashlog.c | 283 +++++++++++++++++++=
+--
> =C2=A01 file changed, 264 insertions(+), 19 deletions(-)
>=20
> diff --git a/drivers/platform/x86/intel/pmt/crashlog.c
> b/drivers/platform/x86/intel/pmt/crashlog.c
> index fe6563721886..0fb60036a9bb 100644
> --- a/drivers/platform/x86/intel/pmt/crashlog.c
> +++ b/drivers/platform/x86/intel/pmt/crashlog.c
> @@ -51,20 +51,53 @@
> =C2=A0#define TYPE1_VER0_COMPLETE		BIT(31)
> =C2=A0#define TYPE1_VER0_TRIGGER_MASK		GENMASK(31, 28)
> =C2=A0
> +/*
> + * Type 1 Version 2
> + * status and control are two different registers
> + */
> +#define TYPE1_VER2_STATUS_OFFSET	0x00
> +#define TYPE1_VER2_CONTROL_OFFSET	0x14
> +
> +/* status register */
> +#define TYPE1_VER2_CLEAR_SUPPORT	BIT(20)
> +#define TYPE1_VER2_REARMED		BIT(25)
> +#define TYPE1_VER2_ERROR		BIT(26)
> +#define TYPE1_VER2_CONSUMED		BIT(27)
> +#define TYPE1_VER2_DISABLED		BIT(28)
> +#define TYPE1_VER2_CLEARED		BIT(29)
> +#define TYPE1_VER2_IN_PROGRESS		BIT(30)
> +#define TYPE1_VER2_COMPLETE		BIT(31)
> +
> +/* control register */
> +#define TYPE1_VER2_CONSUME		BIT(25)
> +#define TYPE1_VER2_REARM		BIT(28)
> +#define TYPE1_VER2_EXECUTE		BIT(29)
> +#define TYPE1_VER2_CLEAR		BIT(30)
> +#define TYPE1_VER2_DISABLE		BIT(31)
> +#define TYPE1_VER2_TRIGGER_MASK		(TYPE1_VER2_CONSUME |
> TYPE1_VER2_EXECUTE | \
> +					 TYPE1_VER2_CLEAR |
> TYPE1_VER2_DISABLE)
> +
> =C2=A0/* After offset, order alphabetically, not bit ordered */
> =C2=A0struct crashlog_status {
> =C2=A0	u32 offset;
> -	u32 clear;
> +	u32 clear_supported;
> +	u32 cleared;
> =C2=A0	u32 complete;
> -	u32 disable;
> +	u32 consumed;
> +	u32 disabled;
> +	u32 error;
> +	u32 in_progress;
> +	u32 rearmed;
> =C2=A0};

Since this struct was just introduced, better to use the intended names in =
the
original patch to avoid unnecessary churn.

> =C2=A0
> =C2=A0struct crashlog_control {
> =C2=A0	u32 offset;
> =C2=A0	u32 trigger_mask;
> =C2=A0	u32 clear;
> +	u32 consume;
> =C2=A0	u32 disable;
> =C2=A0	u32 manual;
> +	u32 rearm;
> =C2=A0};
> =C2=A0
> =C2=A0struct crashlog_info {
> @@ -74,9 +107,9 @@ struct crashlog_info {
> =C2=A0
> =C2=A0const struct crashlog_info crashlog_type1_ver0 =3D {
> =C2=A0	.status.offset =3D TYPE1_VER0_STATUS_OFFSET,
> -	.status.clear =3D TYPE1_VER0_CLEAR,
> +	.status.cleared =3D TYPE1_VER0_CLEAR,
> =C2=A0	.status.complete =3D TYPE1_VER0_COMPLETE,
> -	.status.disable =3D TYPE1_VER0_DISABLE,
> +	.status.disabled =3D TYPE1_VER0_DISABLE,
> =C2=A0
> =C2=A0	.control.offset =3D TYPE1_VER0_CONTROL_OFFSET,
> =C2=A0	.control.trigger_mask =3D TYPE1_VER0_TRIGGER_MASK,
> @@ -85,6 +118,26 @@ const struct crashlog_info crashlog_type1_ver0 =3D {
> =C2=A0	.control.manual =3D TYPE1_VER0_EXECUTE,
> =C2=A0};
> =C2=A0
> +const struct crashlog_info crashlog_type1_ver2 =3D {
> +	.status.offset =3D TYPE1_VER2_STATUS_OFFSET,
> +	.status.clear_supported =3D TYPE1_VER2_CLEAR_SUPPORT,
> +	.status.cleared =3D TYPE1_VER2_CLEARED,
> +	.status.complete =3D TYPE1_VER2_COMPLETE,
> +	.status.consumed =3D TYPE1_VER2_CONSUMED,
> +	.status.disabled =3D TYPE1_VER2_DISABLED,
> +	.status.error =3D TYPE1_VER2_ERROR,
> +	.status.in_progress =3D TYPE1_VER2_IN_PROGRESS,
> +	.status.rearmed =3D TYPE1_VER2_REARMED,
> +
> +	.control.offset =3D TYPE1_VER2_CONTROL_OFFSET,
> +	.control.trigger_mask =3D TYPE1_VER2_TRIGGER_MASK,
> +	.control.clear =3D TYPE1_VER2_CLEAR,
> +	.control.consume =3D TYPE1_VER2_CONSUME,
> +	.control.disable =3D TYPE1_VER2_DISABLE,
> +	.control.manual =3D TYPE1_VER2_EXECUTE,
> +	.control.rearm =3D TYPE1_VER2_REARM,
> +};
> +
> =C2=A0struct crashlog_entry {
> =C2=A0	/* entry must be first member of struct */
> =C2=A0	struct intel_pmt_entry		entry;
> @@ -99,30 +152,35 @@ struct pmt_crashlog_priv {
> =C2=A0
> =C2=A0/*
> =C2=A0 * This is the generic access to a PMT struct. So the use of
> - * struct crashlog_entry
> - * doesn't "make sense" here.
> + *=C2=A0=C2=A0 struct crashlog_entry
> + * doesn't "make sense" here, i.e. use:
> + *=C2=A0=C2=A0 struct intel_pmt_entry
> =C2=A0 */

I don't think this comment is needed. Still, this could have been done in t=
he
patch that added it.

> -static bool pmt_crashlog_supported(struct intel_pmt_entry *entry)
> +static bool pmt_crashlog_supported(struct intel_pmt_entry *entry, u32
> *crash_type, u32 *version)
> =C2=A0{
> =C2=A0	u32 discovery_header =3D readl(entry->disc_table + CONTROL_OFFSET)=
;
> -	u32 crash_type, version;
> =C2=A0
> -	crash_type =3D GET_TYPE(discovery_header);
> -	version =3D GET_VERSION(discovery_header);
> +	*crash_type =3D GET_TYPE(discovery_header);
> +	*version =3D GET_VERSION(discovery_header);
> =C2=A0
> =C2=A0	/*
> -	 * Currently we only recognize OOBMSM version 0 devices.
> -	 * We can ignore all other crashlog devices in the system.
> +	 * Currently we only recognize OOBMSM (type 1) and version 0 or 2
> +	 * devices.
> +	 *
> +	 * Ignore all other crashlog devices in the system.
> =C2=A0	 */
> -	return crash_type =3D=3D CRASH_TYPE_OOBMSM && version =3D=3D 0;
> +	if (*crash_type =3D=3D CRASH_TYPE_OOBMSM && (*version =3D=3D 0 || *vers=
ion =3D=3D
> 2))
> +		return true;
> +
> +	return false;
> =C2=A0}
> =C2=A0
> =C2=A0/*
> =C2=A0 * I/O
> =C2=A0 */
> =C2=A0
> -#define SET=C2=A0=C2=A0=C2=A0=C2=A0 true
> -#define CLEAR=C2=A0=C2=A0 false
> +#define SET	true
> +#define CLEAR	false

Ditto

> =C2=A0
> =C2=A0static void read_modify_write(struct crashlog_entry *crashlog, u32 =
bit, bool
> set)
> =C2=A0{
> @@ -157,7 +215,7 @@ static bool pmt_crashlog_complete(struct crashlog_ent=
ry
> *crashlog)
> =C2=A0static bool pmt_crashlog_disabled(struct crashlog_entry *crashlog)
> =C2=A0{
> =C2=A0	/* return current value of the crashlog disabled flag */
> -	return read_check(crashlog, crashlog->info->status.disable);
> +	return read_check(crashlog, crashlog->info->status.disabled);
> =C2=A0}
> =C2=A0
> =C2=A0static void pmt_crashlog_set_disable(struct crashlog_entry *crashlo=
g, bool
> disable)
> @@ -175,9 +233,119 @@ static void pmt_crashlog_set_execute(struct
> crashlog_entry *crashlog)
> =C2=A0	read_modify_write(crashlog, crashlog->info->control.manual, SET);
> =C2=A0}
> =C2=A0
> +/* version 2 support */
> +static bool pmt_crashlog_cleared(struct crashlog_entry *crashlog)
> +{
> +	/* return current value of the crashlog cleared flag */
> +	return read_check(crashlog, crashlog->info->status.cleared);
> +}
> +
> +static bool pmt_crashlog_consumed(struct crashlog_entry *crashlog)
> +{
> +	/* return current value of the crashlog consumedflag */
> +	return read_check(crashlog, crashlog->info->status.consumed);
> +}
> +
> +static void pmt_crashlog_set_consumed(struct crashlog_entry *crashlog)
> +{
> +	read_modify_write(crashlog, crashlog->info->control.consume, SET);
> +}
> +
> +static bool pmt_crashlog_error(struct crashlog_entry *crashlog)
> +{
> +	/* return current value of the crashlog error flag */
> +	return read_check(crashlog, crashlog->info->status.error);
> +}
> +
> +static bool pmt_crashlog_rearm(struct crashlog_entry *crashlog)
> +{
> +	/* return current value of the crashlog reamed flag */
> +	return read_check(crashlog, crashlog->info->status.rearmed);
> +}
> +
> +static void pmt_crashlog_set_rearm(struct crashlog_entry *crashlog)
> +{
> +	read_modify_write(crashlog, crashlog->info->control.rearm, SET);
> +}
> +
> =C2=A0/*
> =C2=A0 * sysfs
> =C2=A0 */
> +static ssize_t
> +clear_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	struct crashlog_entry *crashlog =3D dev_get_drvdata(dev);
> +	bool cleared =3D pmt_crashlog_cleared(crashlog);
> +
> +	return sysfs_emit(buf, "%d\n", cleared);
> +}
> +
> +static ssize_t
> +clear_store(struct device *dev, struct device_attribute *attr,
> +	=C2=A0=C2=A0=C2=A0 const char *buf, size_t count)
> +{
> +	struct crashlog_entry *crashlog;
> +	bool clear;
> +	int result;
> +
> +	crashlog =3D dev_get_drvdata(dev);
> +
> +	result =3D kstrtobool(buf, &clear);
> +	if (result)
> +		return result;
> +
> +	/* set bit only */
> +	if (!clear)
> +		return -EINVAL;
> +
> +	guard(mutex)(&crashlog->control_mutex);
> +
> +	pmt_crashlog_set_clear(crashlog);
> +
> +	return count;
> +}
> +static DEVICE_ATTR_RW(clear);
> +
> +static ssize_t
> +consumed_show(struct device *dev, struct device_attribute *attr, char *b=
uf)
> +{
> +	struct crashlog_entry *crashlog =3D dev_get_drvdata(dev);
> +	bool consumed =3D pmt_crashlog_consumed(crashlog);
> +
> +	return sysfs_emit(buf, "%d\n", consumed);
> +}
> +
> +static ssize_t consumed_store(struct device *dev, struct device_attribut=
e
> *attr,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const char *buf, size_t count)
> +{
> +	struct crashlog_entry *crashlog;
> +	bool consumed;
> +	int result;
> +
> +	crashlog =3D dev_get_drvdata(dev);
> +
> +	result =3D kstrtobool(buf, &consumed);
> +	if (result)
> +		return result;
> +
> +	/* set bit only */
> +	if (!consumed)
> +		return -EINVAL;
> +
> +	guard(mutex)(&crashlog->control_mutex);
> +
> +	if (pmt_crashlog_disabled(crashlog))
> +		return -EBUSY;
> +
> +	if (!pmt_crashlog_complete(crashlog))
> +		return -EEXIST;
> +
> +	pmt_crashlog_set_consumed(crashlog);
> +
> +	return count;
> +}
> +static DEVICE_ATTR_RW(consumed);
> +
> =C2=A0static ssize_t
> =C2=A0enable_show(struct device *dev, struct device_attribute *attr, char=
 *buf)
> =C2=A0{
> @@ -209,6 +377,50 @@ enable_store(struct device *dev, struct device_attri=
bute
> *attr,
> =C2=A0}
> =C2=A0static DEVICE_ATTR_RW(enable);
> =C2=A0
> +static ssize_t
> +error_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	struct crashlog_entry *crashlog =3D dev_get_drvdata(dev);
> +	bool error =3D pmt_crashlog_error(crashlog);
> +
> +	return sysfs_emit(buf, "%d\n", error);
> +}
> +static DEVICE_ATTR_RO(error);
> +
> +static ssize_t
> +rearm_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	struct crashlog_entry *crashlog =3D dev_get_drvdata(dev);
> +	int rearmed =3D pmt_crashlog_rearm(crashlog);
> +
> +	return sysfs_emit(buf, "%d\n", rearmed);
> +}
> +
> +static ssize_t rearm_store(struct device *dev, struct device_attribute *=
attr,
> +			=C2=A0=C2=A0 const char *buf, size_t count)
> +{
> +	struct crashlog_entry *crashlog;
> +	bool rearm;
> +	int result;
> +
> +	crashlog =3D dev_get_drvdata(dev);
> +
> +	result =3D kstrtobool(buf, &rearm);
> +	if (result)
> +		return result;
> +
> +	/* set only */
> +	if (!rearm)
> +		return -EINVAL;
> +
> +	guard(mutex)(&crashlog->control_mutex);
> +
> +	pmt_crashlog_set_rearm(crashlog);
> +
> +	return count;
> +}
> +static DEVICE_ATTR_RW(rearm);
> +
> =C2=A0static ssize_t
> =C2=A0trigger_show(struct device *dev, struct device_attribute *attr, cha=
r *buf)
> =C2=A0{
> @@ -263,24 +475,57 @@ static struct attribute *pmt_crashlog_attrs[] =3D {
> =C2=A0	NULL
> =C2=A0};
>=20

For what follows ...

> =C2=A0
> +static struct attribute *pmt_crashlog_ver2_attrs[] =3D {
> +	&dev_attr_clear.attr,
> +	&dev_attr_consumed.attr,
> +	&dev_attr_enable.attr,
> +	&dev_attr_error.attr,
> +	&dev_attr_rearm.attr,
> +	&dev_attr_trigger.attr,
> +	NULL
> +};
> +
> =C2=A0static const struct attribute_group pmt_crashlog_group =3D {
> =C2=A0	.attrs	=3D pmt_crashlog_attrs,
> =C2=A0};
> =C2=A0
> +static const struct attribute_group pmt_crashlog_ver2_group =3D {
> +	.attrs =3D pmt_crashlog_ver2_attrs,
> +};

... I would have the group and attributes both reflect type and version in =
the
name. Update pmt_crashlog_group as well.

David

> +
> +static const struct crashlog_info *select_crashlog_info(u32 type, u32
> version)
> +{
> +	if (version =3D=3D 0)
> +		return &crashlog_type1_ver0;
> +
> +	return &crashlog_type1_ver2;
> +}
> +
> +static const struct attribute_group *select_sysfs_grp(u32 type, u32 vers=
ion)
> +{
> +	if (version =3D=3D 0)
> +		return &pmt_crashlog_group;
> +
> +	return &pmt_crashlog_ver2_group;
> +}
> +
> =C2=A0static int pmt_crashlog_header_decode(struct intel_pmt_entry *entry=
,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct device *dev)
> =C2=A0{
> =C2=A0	void __iomem *disc_table =3D entry->disc_table;
> =C2=A0	struct intel_pmt_header *header =3D &entry->header;
> =C2=A0	struct crashlog_entry *crashlog;
> +	u32 version;
> +	u32 type;
> =C2=A0
> -	if (!pmt_crashlog_supported(entry))
> +	if (!pmt_crashlog_supported(entry, &type, &version))
> =C2=A0		return 1;
> =C2=A0
> =C2=A0	/* initialize the crashlog struct */
> =C2=A0	crashlog =3D container_of(entry, struct crashlog_entry, entry);
> =C2=A0	mutex_init(&crashlog->control_mutex);
> -	crashlog->info =3D &crashlog_type1_ver0;
> +
> +	crashlog->info =3D select_crashlog_info(type, version);
> =C2=A0
> =C2=A0	header->access_type =3D GET_ACCESS(readl(disc_table));
> =C2=A0	header->guid =3D readl(disc_table + GUID_OFFSET);
> @@ -289,7 +534,7 @@ static int pmt_crashlog_header_decode(struct
> intel_pmt_entry *entry,
> =C2=A0	/* Size is measured in DWORDS, but accessor returns bytes */
> =C2=A0	header->size =3D GET_SIZE(readl(disc_table + SIZE_OFFSET));
> =C2=A0
> -	entry->attr_grp =3D &pmt_crashlog_group;
> +	entry->attr_grp =3D select_sysfs_grp(type, version);
> =C2=A0
> =C2=A0	return 0;
> =C2=A0}

