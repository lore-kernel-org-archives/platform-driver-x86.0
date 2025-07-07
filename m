Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 474B3194C96
	for <platform-driver-x86@vger.kernel.org>; Mon,  7 Jul 2025 13:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751895269; cv=none; b=vBF0x7bCBNc6dL4J6JDwIviEZyhCPymBSq9fao6t9Pt6gqgzPIsaKUrVMV3w/yakGuviHZilar3Dd1f5b3z3+V28yPIAAUC5Bgs3aBEISEyO3g7FB4y7KK2p02xSbV+xT6Bz+xXdCC2TiNT7bvKse+rqlntgeBGLQS9M8VhuRnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751895269; c=relaxed/simple;
	bh=2h3Y9Q1TiKwVR++wI8VgjjAnuF52oJVNf6QQJL3KrMg=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=jL8+yyFALjZ+IRp2wIj18O8GvRBZc2nauy/0f3pgPS74Li3zyFd2duZY3BRvMeCQk23gyWZg6vUoiy4MKYWYiP5rGbqKN3FH7LrBlYdJUg1NwAjRzVYeLmegT/w/32jU94WKIhMuaFQPmDA/zW5mXxE9ys12o4zw5nl4iQlGLNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WbokvGGQ; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WbokvGGQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751895267; x=1783431267;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=2h3Y9Q1TiKwVR++wI8VgjjAnuF52oJVNf6QQJL3KrMg=;
  b=WbokvGGQfeA1jD4kPJOLa8frz6z73MSGfWPFsNgXQHCAyxd1eKZutHEC
   hgb+eFU+lOIcZ/a+AJ7SPRIIwZ69cHKyzTLso+gLHlsi3K9zPQlWP2Y/W
   uncnK/aUWVg9V7X3I+YOE0JaOZ2ZhPQyhDE9Pahlv3AKDkmXC0YSsIFcO
   BO7tnSUcXx8K0hfcMWfhWVBFg8Vl02TwayPwdrxLP7GDZ0lUR6sXk2Zzg
   SbOosBmLBpjHZxn+y93i09Hv2dEin4BgKeIDZ4Td547AYV8qQqiVjAFVR
   JRxrrUfqOEJdfPvq+aEZhZ9rNqy1O5qdBJ2wVON8QPtwzB12GZg00p53J
   Q==;
X-CSE-ConnectionGUID: w70XhG6aQFiyem1MBJeJ6g==
X-CSE-MsgGUID: 9HNyT2scQZu9qZHzXEBJMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="64707871"
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; 
   d="scan'208";a="64707871"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 06:34:26 -0700
X-CSE-ConnectionGUID: JKqdU0QgTQyRIOKdtlURpg==
X-CSE-MsgGUID: xsnBYqcfSjSt07S1zbfnbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; 
   d="scan'208";a="160871497"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.104])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 06:34:22 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 7 Jul 2025 16:34:19 +0300 (EEST)
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
cc: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org, 
    hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com, 
    lucas.demarchi@intel.com, rodrigo.vivi@intel.com, 
    thomas.hellstrom@linux.intel.com, airlied@gmail.com, simona@ffwll.ch, 
    david.e.box@linux.intel.com
Subject: Re: [PATCH v6 11/12] platform/x86/intel/pmt: use a version struct
In-Reply-To: <20250703211150.135320-12-michael.j.ruhl@intel.com>
Message-ID: <c9750800-90b5-8814-d669-8178db38b98d@linux.intel.com>
References: <20250703211150.135320-1-michael.j.ruhl@intel.com> <20250703211150.135320-12-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1594213885-1751895259=:941"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1594213885-1751895259=:941
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 3 Jul 2025, Michael J. Ruhl wrote:

> In preparation for supporting multiple crashlog versions, use a struct
> to keep bit offset info for the status and control bits.
>=20
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
>  drivers/platform/x86/intel/pmt/crashlog.c | 92 ++++++++++++++++-------
>  1 file changed, 66 insertions(+), 26 deletions(-)
>=20
> diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform=
/x86/intel/pmt/crashlog.c
> index 8cca520c5a1c..edc41144909c 100644
> --- a/drivers/platform/x86/intel/pmt/crashlog.c
> +++ b/drivers/platform/x86/intel/pmt/crashlog.c
> @@ -24,21 +24,6 @@
>  /* Crashlog discovery header types */
>  #define CRASH_TYPE_OOBMSM=091
> =20
> -/* Control Flags */
> -#define CRASHLOG_FLAG_DISABLE=09=09BIT(28)
> -
> -/*
> - * Bits 29 and 30 control the state of bit 31.
> - *
> - * Bit 29 will clear bit 31, if set, allowing a new crashlog to be captu=
red.
> - * Bit 30 will immediately trigger a crashlog to be generated, setting b=
it 31.
> - * Bit 31 is the read-only status with a 1 indicating log is complete.
> - */
> -#define CRASHLOG_FLAG_TRIGGER_CLEAR=09BIT(29)
> -#define CRASHLOG_FLAG_TRIGGER_EXECUTE=09BIT(30)
> -#define CRASHLOG_FLAG_TRIGGER_COMPLETE=09BIT(31)
> -#define CRASHLOG_FLAG_TRIGGER_MASK=09GENMASK(31, 28)
> -
>  /* Crashlog Discovery Header */
>  #define CONTROL_OFFSET=09=090x0
>  #define GUID_OFFSET=09=090x4
> @@ -50,10 +35,63 @@
>  /* size is in bytes */
>  #define GET_SIZE(v)=09=09((v) * sizeof(u32))
> =20
> +/*
> + * Type 1 Version 0
> + * status and control registers are combined.
> + *
> + * Bits 29 and 30 control the state of bit 31.
> + * Bit 29 will clear bit 31, if set, allowing a new crashlog to be captu=
red.
> + * Bit 30 will immediately trigger a crashlog to be generated, setting b=
it 31.
> + * Bit 31 is the read-only status with a 1 indicating log is complete.
> + */
> +#define TYPE1_VER0_STATUS_OFFSET=090x00
> +#define TYPE1_VER0_CONTROL_OFFSET=090x00
> +
> +#define TYPE1_VER0_DISABLE=09=09BIT(28)
> +#define TYPE1_VER0_CLEAR=09=09BIT(29)
> +#define TYPE1_VER0_EXECUTE=09=09BIT(30)
> +#define TYPE1_VER0_COMPLETE=09=09BIT(31)
> +#define TYPE1_VER0_TRIGGER_MASK=09=09GENMASK(31, 28)
> +
> +/* After offset, order alphabetically, not bit ordered */
> +struct crashlog_status {
> +=09u32 offset;
> +=09u32 cleared;
> +=09u32 complete;
> +=09u32 disabled;
> +};
> +
> +struct crashlog_control {
> +=09u32 offset;
> +=09u32 trigger_mask;
> +=09u32 clear;
> +=09u32 disable;
> +=09u32 manual;
> +};
> +
> +struct crashlog_info {
> +=09struct crashlog_status status;
> +=09struct crashlog_control control;
> +};
> +
> +static const struct crashlog_info crashlog_type1_ver0 =3D {
> +=09.status.offset =3D TYPE1_VER0_STATUS_OFFSET,
> +=09.status.cleared =3D TYPE1_VER0_CLEAR,
> +=09.status.complete =3D TYPE1_VER0_COMPLETE,
> +=09.status.disabled =3D TYPE1_VER0_DISABLE,
> +
> +=09.control.offset =3D TYPE1_VER0_CONTROL_OFFSET,
> +=09.control.trigger_mask =3D TYPE1_VER0_TRIGGER_MASK,
> +=09.control.clear =3D TYPE1_VER0_CLEAR,
> +=09.control.disable =3D TYPE1_VER0_DISABLE,
> +=09.control.manual =3D TYPE1_VER0_EXECUTE,
> +};
> +
>  struct crashlog_entry {
>  =09/* entry must be first member of struct */
>  =09struct intel_pmt_entry=09=09entry;
>  =09struct mutex=09=09=09control_mutex;
> +=09const struct crashlog_info=09*info;
>  };
> =20
>  struct pmt_crashlog_priv {
> @@ -70,24 +108,25 @@ struct pmt_crashlog_priv {
>  /* read/modify/write */
>  static void pmt_crashlog_rmw(struct crashlog_entry *crashlog, u32 bit, b=
ool set)
>  {
> +=09const struct crashlog_control *control =3D &crashlog->info->control;
>  =09struct intel_pmt_entry *entry =3D &crashlog->entry;
> -=09u32 reg =3D readl(entry->disc_table + CONTROL_OFFSET);
> +=09u32 reg =3D readl(entry->disc_table + control->offset);
> =20
> -=09reg &=3D ~CRASHLOG_FLAG_TRIGGER_MASK;
> +=09reg &=3D ~control->trigger_mask;
> =20
>  =09if (set)
>  =09=09reg |=3D bit;
>  =09else
>  =09=09reg &=3D ~bit;
> =20
> -=09writel(reg, entry->disc_table + CONTROL_OFFSET);
> +=09writel(reg, entry->disc_table + control->offset);
>  }
> =20
>  /* read/check */
>  static bool pmt_crashlog_rc(struct crashlog_entry *crashlog, u32 bit)
>  {
> -=09struct intel_pmt_entry *entry =3D &crashlog->entry;
> -=09u32 reg =3D readl(entry->disc_table + CONTROL_OFFSET);
> +=09const struct crashlog_status *status =3D &crashlog->info->status;
> +=09u32 reg =3D readl(crashlog->entry.disc_table + status->offset);
> =20
>  =09return !!(reg & bit);
>  }
> @@ -95,13 +134,13 @@ static bool pmt_crashlog_rc(struct crashlog_entry *c=
rashlog, u32 bit)
>  static bool pmt_crashlog_complete(struct crashlog_entry *crashlog)
>  {
>  =09/* return current value of the crashlog complete flag */
> -=09return pmt_crashlog_rc(crashlog, CRASHLOG_FLAG_TRIGGER_COMPLETE);
> +=09return pmt_crashlog_rc(crashlog, crashlog->info->status.complete);
>  }
> =20
>  static bool pmt_crashlog_disabled(struct crashlog_entry *crashlog)
>  {
>  =09/* return current value of the crashlog disabled flag */
> -=09return pmt_crashlog_rc(crashlog, CRASHLOG_FLAG_DISABLE);
> +=09return pmt_crashlog_rc(crashlog, crashlog->info->status.disabled);
>  }
> =20
>  static bool pmt_crashlog_supported(struct intel_pmt_entry *entry)
> @@ -121,17 +160,17 @@ static bool pmt_crashlog_supported(struct intel_pmt=
_entry *entry)
> =20
>  static void pmt_crashlog_set_disable(struct crashlog_entry *crashlog, bo=
ol disable)
>  {
> -=09pmt_crashlog_rmw(crashlog, CRASHLOG_FLAG_DISABLE, disable);
> +=09pmt_crashlog_rmw(crashlog, crashlog->info->control.disable, disable);
>  }
> =20
>  static void pmt_crashlog_set_clear(struct crashlog_entry *crashlog)
>  {
> -=09pmt_crashlog_rmw(crashlog, CRASHLOG_FLAG_TRIGGER_CLEAR, CRASHLOG_SET_=
BIT);
> +=09pmt_crashlog_rmw(crashlog, crashlog->info->control.clear, CRASHLOG_SE=
T_BIT);
>  }
> =20
>  static void pmt_crashlog_set_execute(struct crashlog_entry *crashlog)
>  {
> -=09pmt_crashlog_rmw(crashlog, CRASHLOG_FLAG_TRIGGER_EXECUTE, CRASHLOG_SE=
T_BIT);
> +=09pmt_crashlog_rmw(crashlog, crashlog->info->control.manual, CRASHLOG_S=
ET_BIT);
>  }
> =20
>  /*
> @@ -235,9 +274,10 @@ static int pmt_crashlog_header_decode(struct intel_p=
mt_entry *entry,
>  =09if (!pmt_crashlog_supported(entry))
>  =09=09return 1;
> =20
> -=09/* initialize control mutex */
> +=09/* initialize the crashlog struct */
>  =09crashlog =3D container_of(entry, struct crashlog_entry, entry);
>  =09mutex_init(&crashlog->control_mutex);
> +=09crashlog->info =3D &crashlog_type1_ver0;
> =20
>  =09header->access_type =3D GET_ACCESS(readl(disc_table));
>  =09header->guid =3D readl(disc_table + GUID_OFFSET);
>=20

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

--8323328-1594213885-1751895259=:941--
