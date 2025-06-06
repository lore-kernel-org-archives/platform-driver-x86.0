Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D51A125DF
	for <platform-driver-x86@vger.kernel.org>; Fri,  6 Jun 2025 22:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749250655; cv=none; b=bv+FsywIFCQsHhuXi16VlRxwm2lKzMg4z73QW508Lc/BnT5eL9znLzCVeTJm5Vbi3F7T6h7j7rW/0wHxO7HsB3sicE/dLFFoJ0ILsnpxNGOK4g44OTjK8N5UWE8hCMO51ax4mUmC3Oer/to3VKyCgF2x438u8xf8pVkE6I90/4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749250655; c=relaxed/simple;
	bh=CXcKtDQ000DjvUzUhB8ZwQ2pNyjzWOG/PzNtQgmFFK0=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JIML0WP/ThmFJG6j9/l+yp4QFsPUlCJPl7zsvlOB4XGGnLwng9OjVFC4U/7m/vy+cxhk+Y+3Z5vDGhR51+85i6uzcyYNF3lu14RNN60l5VynmHGd/chGZP/fB8Dx2d1PL3fJs+JJp6PbyoWQzp0JelTBgfD/J2ClPFuNn4EPP3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OiLnrb3T; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OiLnrb3T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749250653; x=1780786653;
  h=message-id:subject:from:reply-to:to:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=CXcKtDQ000DjvUzUhB8ZwQ2pNyjzWOG/PzNtQgmFFK0=;
  b=OiLnrb3Tm8Io75aHT7T413xbzVNEmGhryAzjDN/bgAt4FpzwofAnWf1X
   gjKRlRUM4HDpR20dCwHFadK8XvQQ6vYMpyjUqhr4URbMQQIVBO/LsOOBf
   9eQ94VX48e65UEtkjQ5l+6btC22OrlW2P+JvauwfVvpwftCQ1w+gAPf/H
   Qw6Ss6qkqY8ERjDmeYfcxa0ycuyisNTQAhrFivcOFlTkHp6y67fU9HxzS
   U/+Ul2sd4oLxJ3vT7L7BKKOxk+hGCTXArxCEa31d0r9hlKF7ADpSXduUz
   CAzAIj1hbxcIYKk0aRjRYtOWqkj4LV/EeFVDWiuHujfmT902NiO/MW6bf
   A==;
X-CSE-ConnectionGUID: FWGM58JGSBqZjUr+wLOKKg==
X-CSE-MsgGUID: ZfzvJXr+Q1WrEnvZIdeU3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="50521270"
X-IronPort-AV: E=Sophos;i="6.16,216,1744095600"; 
   d="scan'208";a="50521270"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2025 15:57:32 -0700
X-CSE-ConnectionGUID: YGVbpHvMSgKYrfKT+sNhDw==
X-CSE-MsgGUID: q/GcpbM9T1OzZRCb7CCPVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,216,1744095600"; 
   d="scan'208";a="183141542"
Received: from aschofie-mobl2.amr.corp.intel.com ([10.124.222.251])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2025 15:57:31 -0700
Message-ID: <1c0519789a8089c680c256f35174e0ada916e573.camel@linux.intel.com>
Subject: Re: [PATCH v3 10/11] platform/x86/intel/pmt: use a version struct
From: "David E. Box" <david.e.box@linux.intel.com>
Reply-To: david.e.box@linux.intel.com
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>, 
 platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org, 
 hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
 lucas.demarchi@intel.com,  rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, airlied@gmail.com,  simona@ffwll.ch
Date: Fri, 06 Jun 2025 15:57:30 -0700
In-Reply-To: <20250605184444.515556-11-michael.j.ruhl@intel.com>
References: <20250605184444.515556-1-michael.j.ruhl@intel.com>
	 <20250605184444.515556-11-michael.j.ruhl@intel.com>
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
> In preparation for supporting multiple crashlog versions, use a struct
> to keep bit offset info for the status and control bits.
>=20
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
> =C2=A0drivers/platform/x86/intel/pmt/crashlog.c | 176 ++++++++++++++-----=
---
> =C2=A01 file changed, 112 insertions(+), 64 deletions(-)
>=20
> diff --git a/drivers/platform/x86/intel/pmt/crashlog.c
> b/drivers/platform/x86/intel/pmt/crashlog.c
> index 318d7a21f00e..fe6563721886 100644
> --- a/drivers/platform/x86/intel/pmt/crashlog.c
> +++ b/drivers/platform/x86/intel/pmt/crashlog.c
> @@ -22,21 +22,6 @@
> =C2=A0/* Crashlog discovery header types */
> =C2=A0#define CRASH_TYPE_OOBMSM	1
> =C2=A0
> -/* Control Flags */
> -#define CRASHLOG_FLAG_DISABLE		BIT(28)
> -
> -/*
> - * Bits 29 and 30 control the state of bit 31.
> - *
> - * Bit 29 will clear bit 31, if set, allowing a new crashlog to be captu=
red.
> - * Bit 30 will immediately trigger a crashlog to be generated, setting b=
it
> 31.
> - * Bit 31 is the read-only status with a 1 indicating log is complete.
> - */
> -#define CRASHLOG_FLAG_TRIGGER_CLEAR	BIT(29)
> -#define CRASHLOG_FLAG_TRIGGER_EXECUTE	BIT(30)
> -#define CRASHLOG_FLAG_TRIGGER_COMPLETE	BIT(31)
> -#define CRASHLOG_FLAG_TRIGGER_MASK	GENMASK(31, 28)
> -
> =C2=A0/* Crashlog Discovery Header */
> =C2=A0#define CONTROL_OFFSET		0x0
> =C2=A0#define GUID_OFFSET		0x4
> @@ -48,10 +33,63 @@
> =C2=A0/* size is in bytes */
> =C2=A0#define GET_SIZE(v)		((v) * sizeof(u32))
> =C2=A0
> +/*
> + * Type 1 Version 0
> + * status and control registers are combined.
> + *
> + * Bits 29 and 30 control the state of bit 31.
> + * Bit 29 will clear bit 31, if set, allowing a new crashlog to be captu=
red.
> + * Bit 30 will immediately trigger a crashlog to be generated, setting b=
it
> 31.
> + * Bit 31 is the read-only status with a 1 indicating log is complete.
> + */
> +#define TYPE1_VER0_STATUS_OFFSET	0x00
> +#define TYPE1_VER0_CONTROL_OFFSET	0x00
> +
> +#define TYPE1_VER0_DISABLE		BIT(28)
> +#define TYPE1_VER0_CLEAR		BIT(29)
> +#define TYPE1_VER0_EXECUTE		BIT(30)
> +#define TYPE1_VER0_COMPLETE		BIT(31)
> +#define TYPE1_VER0_TRIGGER_MASK		GENMASK(31, 28)
> +
> +/* After offset, order alphabetically, not bit ordered */
> +struct crashlog_status {
> +	u32 offset;
> +	u32 clear;
> +	u32 complete;
> +	u32 disable;
> +};
> +
> +struct crashlog_control {
> +	u32 offset;
> +	u32 trigger_mask;
> +	u32 clear;
> +	u32 disable;
> +	u32 manual;
> +};
> +
> +struct crashlog_info {
> +	struct crashlog_status status;
> +	struct crashlog_control control;
> +};
> +
> +const struct crashlog_info crashlog_type1_ver0 =3D {
> +	.status.offset =3D TYPE1_VER0_STATUS_OFFSET,
> +	.status.clear =3D TYPE1_VER0_CLEAR,
> +	.status.complete =3D TYPE1_VER0_COMPLETE,
> +	.status.disable =3D TYPE1_VER0_DISABLE,
> +
> +	.control.offset =3D TYPE1_VER0_CONTROL_OFFSET,
> +	.control.trigger_mask =3D TYPE1_VER0_TRIGGER_MASK,
> +	.control.clear =3D TYPE1_VER0_CLEAR,
> +	.control.disable =3D TYPE1_VER0_DISABLE,
> +	.control.manual =3D TYPE1_VER0_EXECUTE,
> +};
> +

static?

David

> =C2=A0struct crashlog_entry {
> =C2=A0	/* entry must be first member of struct */
> =C2=A0	struct intel_pmt_entry		entry;
> =C2=A0	struct mutex			control_mutex;
> +	const struct crashlog_info	*info;
> =C2=A0};
> =C2=A0
> =C2=A0struct pmt_crashlog_priv {
> @@ -59,74 +97,82 @@ struct pmt_crashlog_priv {
> =C2=A0	struct crashlog_entry	entry[];
> =C2=A0};
> =C2=A0
> +/*
> + * This is the generic access to a PMT struct. So the use of
> + * struct crashlog_entry
> + * doesn't "make sense" here.
> + */
> +static bool pmt_crashlog_supported(struct intel_pmt_entry *entry)
> +{
> +	u32 discovery_header =3D readl(entry->disc_table + CONTROL_OFFSET);
> +	u32 crash_type, version;
> +
> +	crash_type =3D GET_TYPE(discovery_header);
> +	version =3D GET_VERSION(discovery_header);
> +
> +	/*
> +	 * Currently we only recognize OOBMSM version 0 devices.
> +	 * We can ignore all other crashlog devices in the system.
> +	 */
> +	return crash_type =3D=3D CRASH_TYPE_OOBMSM && version =3D=3D 0;
> +}
> +
> =C2=A0/*
> =C2=A0 * I/O
> =C2=A0 */
> +
> =C2=A0#define SET=C2=A0=C2=A0=C2=A0=C2=A0 true
> =C2=A0#define CLEAR=C2=A0=C2=A0 false
> =C2=A0
> -static void read_modify_write(struct intel_pmt_entry *entry, u32 bit, bo=
ol
> set)
> +static void read_modify_write(struct crashlog_entry *crashlog, u32 bit, =
bool
> set)
> =C2=A0{
> -	u32 reg =3D readl(entry->disc_table + CONTROL_OFFSET);
> +	const struct crashlog_control *control =3D &crashlog->info->control;
> +	struct intel_pmt_entry *entry =3D &crashlog->entry;
> +	u32 reg =3D readl(entry->disc_table + control->offset);
> =C2=A0
> -	reg &=3D ~CRASHLOG_FLAG_TRIGGER_MASK;
> +	reg &=3D ~control->trigger_mask;
> =C2=A0
> =C2=A0	if (set)
> =C2=A0		reg |=3D bit;
> =C2=A0	else
> =C2=A0		reg &=3D bit;
> =C2=A0
> -	writel(reg, entry->disc_table + CONTROL_OFFSET);
> +	writel(reg, entry->disc_table + control->offset);
> =C2=A0}
> =C2=A0
> -static bool read_check(struct intel_pmt_entry *entry, u32 bit)
> +static bool read_check(struct crashlog_entry *crashlog, u32 bit)
> =C2=A0{
> -	u32 reg =3D readl(entry->disc_table + CONTROL_OFFSET);
> +	const struct crashlog_status *status =3D &crashlog->info->status;
> +	u32 reg =3D readl(crashlog->entry.disc_table + status->offset);
> =C2=A0
> =C2=A0	return !!(reg & bit);
> =C2=A0}
> =C2=A0
> -static bool pmt_crashlog_complete(struct intel_pmt_entry *entry)
> +static bool pmt_crashlog_complete(struct crashlog_entry *crashlog)
> =C2=A0{
> =C2=A0	/* return current value of the crashlog complete flag */
> -	return read_check(entry, CRASHLOG_FLAG_TRIGGER_COMPLETE);
> +	return read_check(crashlog, crashlog->info->status.complete);
> =C2=A0}
> =C2=A0
> -static bool pmt_crashlog_disabled(struct intel_pmt_entry *entry)
> +static bool pmt_crashlog_disabled(struct crashlog_entry *crashlog)
> =C2=A0{
> =C2=A0	/* return current value of the crashlog disabled flag */
> -	return read_check(entry, CRASHLOG_FLAG_DISABLE);
> -}
> -
> -static bool pmt_crashlog_supported(struct intel_pmt_entry *entry)
> -{
> -	u32 discovery_header =3D readl(entry->disc_table + CONTROL_OFFSET);
> -	u32 crash_type, version;
> -
> -	crash_type =3D GET_TYPE(discovery_header);
> -	version =3D GET_VERSION(discovery_header);
> -
> -	/*
> -	 * Currently we only recognize OOBMSM version 0 devices.
> -	 * We can ignore all other crashlog devices in the system.
> -	 */
> -	return crash_type =3D=3D CRASH_TYPE_OOBMSM && version =3D=3D 0;
> +	return read_check(crashlog, crashlog->info->status.disable);
> =C2=A0}
> =C2=A0
> -static void pmt_crashlog_set_disable(struct intel_pmt_entry *entry,
> -				=C2=A0=C2=A0=C2=A0=C2=A0 bool disable)
> +static void pmt_crashlog_set_disable(struct crashlog_entry *crashlog, bo=
ol
> disable)
> =C2=A0{
> -	read_modify_write(entry, CRASHLOG_FLAG_DISABLE, disable);
> +	read_modify_write(crashlog, crashlog->info->control.disable,
> disable);
> =C2=A0}
> =C2=A0
> -static void pmt_crashlog_set_clear(struct intel_pmt_entry *entry)
> +static void pmt_crashlog_set_clear(struct crashlog_entry *crashlog)
> =C2=A0{
> -	read_modify_write(entry, CRASHLOG_FLAG_TRIGGER_CLEAR, SET);
> +	read_modify_write(crashlog, crashlog->info->control.clear, SET);
> =C2=A0}
> =C2=A0
> -static void pmt_crashlog_set_execute(struct intel_pmt_entry *entry)
> +static void pmt_crashlog_set_execute(struct crashlog_entry *crashlog)
> =C2=A0{
> -	read_modify_write(entry, CRASHLOG_FLAG_TRIGGER_EXECUTE, SET);
> +	read_modify_write(crashlog, crashlog->info->control.manual, SET);
> =C2=A0}
> =C2=A0
> =C2=A0/*
> @@ -135,8 +181,8 @@ static void pmt_crashlog_set_execute(struct
> intel_pmt_entry *entry)
> =C2=A0static ssize_t
> =C2=A0enable_show(struct device *dev, struct device_attribute *attr, char=
 *buf)
> =C2=A0{
> -	struct intel_pmt_entry *entry =3D dev_get_drvdata(dev);
> -	bool enabled =3D !pmt_crashlog_disabled(entry);
> +	struct crashlog_entry *crashlog =3D dev_get_drvdata(dev);
> +	bool enabled =3D !pmt_crashlog_disabled(crashlog);
> =C2=A0
> =C2=A0	return sprintf(buf, "%d\n", enabled);
> =C2=A0}
> @@ -145,19 +191,19 @@ static ssize_t
> =C2=A0enable_store(struct device *dev, struct device_attribute *attr,
> =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0 const char *buf, size_t count)
> =C2=A0{
> -	struct crashlog_entry *entry;
> +	struct crashlog_entry *crashlog;
> =C2=A0	bool enabled;
> =C2=A0	int result;
> =C2=A0
> -	entry =3D dev_get_drvdata(dev);
> +	crashlog =3D dev_get_drvdata(dev);
> =C2=A0
> =C2=A0	result =3D kstrtobool(buf, &enabled);
> =C2=A0	if (result)
> =C2=A0		return result;
> =C2=A0
> -	guard(mutex)(&entry->control_mutex);
> +	guard(mutex)(&crashlog->control_mutex);
> =C2=A0
> -	pmt_crashlog_set_disable(&entry->entry, !enabled);
> +	pmt_crashlog_set_disable(crashlog, !enabled);
> =C2=A0
> =C2=A0	return count;
> =C2=A0}
> @@ -166,11 +212,11 @@ static DEVICE_ATTR_RW(enable);
> =C2=A0static ssize_t
> =C2=A0trigger_show(struct device *dev, struct device_attribute *attr, cha=
r *buf)
> =C2=A0{
> -	struct intel_pmt_entry *entry;
> +	struct crashlog_entry *crashlog;
> =C2=A0	bool trigger;
> =C2=A0
> -	entry =3D dev_get_drvdata(dev);
> -	trigger =3D pmt_crashlog_complete(entry);
> +	crashlog =3D dev_get_drvdata(dev);
> +	trigger =3D pmt_crashlog_complete(crashlog);
> =C2=A0
> =C2=A0	return sprintf(buf, "%d\n", trigger);
> =C2=A0}
> @@ -179,32 +225,33 @@ static ssize_t
> =C2=A0trigger_store(struct device *dev, struct device_attribute *attr,
> =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const char *buf, size_t count)
> =C2=A0{
> -	struct crashlog_entry *entry;
> +	struct crashlog_entry *crashlog;
> =C2=A0	bool trigger;
> =C2=A0	int result;
> =C2=A0
> -	entry =3D dev_get_drvdata(dev);
> +	crashlog =3D dev_get_drvdata(dev);
> =C2=A0
> =C2=A0	result =3D kstrtobool(buf, &trigger);
> =C2=A0	if (result)
> =C2=A0		return result;
> =C2=A0
> -	guard(mutex)(&entry->control_mutex);
> +	guard(mutex)(&crashlog->control_mutex);
> =C2=A0
> =C2=A0	/* if device is currently disabled, return busy */
> -	if (pmt_crashlog_disabled(&entry->entry))
> +	if (pmt_crashlog_disabled(crashlog))
> =C2=A0		return -EBUSY;
> =C2=A0
> =C2=A0	if (!trigger) {
> -		pmt_crashlog_set_clear(&entry->entry);
> +		pmt_crashlog_set_clear(crashlog);
> =C2=A0		return count;
> =C2=A0	}
> =C2=A0
> =C2=A0	/* we cannot trigger a new crash if one is still pending */
> -	if (pmt_crashlog_complete(&entry->entry))
> +	if (pmt_crashlog_complete(crashlog))
> =C2=A0		return -EEXIST;
> =C2=A0
> -	pmt_crashlog_set_execute(&entry->entry);
> +	pmt_crashlog_set_execute(crashlog);
> +
> =C2=A0
> =C2=A0	return count;
> =C2=A0}
> @@ -230,9 +277,10 @@ static int pmt_crashlog_header_decode(struct
> intel_pmt_entry *entry,
> =C2=A0	if (!pmt_crashlog_supported(entry))
> =C2=A0		return 1;
> =C2=A0
> -	/* initialize control mutex */
> +	/* initialize the crashlog struct */
> =C2=A0	crashlog =3D container_of(entry, struct crashlog_entry, entry);
> =C2=A0	mutex_init(&crashlog->control_mutex);
> +	crashlog->info =3D &crashlog_type1_ver0;
> =C2=A0
> =C2=A0	header->access_type =3D GET_ACCESS(readl(disc_table));
> =C2=A0	header->guid =3D readl(disc_table + GUID_OFFSET);

