Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40FA269818
	for <platform-driver-x86@vger.kernel.org>; Tue,  3 Jun 2025 07:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748934397; cv=none; b=rDRMZqgBaVVC6g3fDtAvzbB/cFF5YAKsnfvIDqtl6Jrov94hIQb7oXWhbRTmGi4lbuCB1MyRHYbRjH6dIiqGxJDtgjnrO4g0M9OLoV08dG9Ebq7sgbOLWWjYIOb1TbNXUOOkHED4MoRh+BfWQxyumrXocsdRFC5FDll7dgXqC2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748934397; c=relaxed/simple;
	bh=Y6GuFidFDMmhyv/HYPMGWREtqBNJLrzZhxqgabJY+DQ=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=L61EETYwWM5BJLXeANzcO+KwcMxMhuKxC8c12P5E7u/qLCuFgQ+0jzrjvN9q1l6LPX7xNfiUqQaq48902DumZUywURiOIqZRY9EYWU70nGAr5rhZnlPf1UTpOE/HltCiH919AK6zWSJ+WIpQm0sJNk1o7gB4e1cG7wq+4TWAJKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NQInuCmY; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NQInuCmY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748934394; x=1780470394;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Y6GuFidFDMmhyv/HYPMGWREtqBNJLrzZhxqgabJY+DQ=;
  b=NQInuCmYbCSvsRaZfztKuMvXpxXIi2gEF/AZvw2KqmF4GxPorX9vNnMo
   KMI+wvGnMhAsaRd9OlpQejz6wJNf9w4XaO1lBvX74uogtLBhubJFp/+Fe
   1tE3bNZvplhEXS+8LZPt1vcyr4h+b1Ewlv+0ud6coRmoOBKcXU4iNOYAi
   5TQkpajGeMdUvfdOoY8h00+35ee8lY9fmXe0pakTVGlbGFhC9Gy6BklYH
   NGxgvCb/EXjRJJHVmRz42yTqccvJdc8GNUHLS8RujSxfYzBPvBZFd84T6
   5VkzvQoxBLXL6OLLw55TxMijZl9Uq27jns9Rm1yuJ0zV10q7Bg/HBLlx0
   g==;
X-CSE-ConnectionGUID: hDOIQzaWSuGD9V+7JyMdXA==
X-CSE-MsgGUID: LTgy5c05RuW8Ng5pdFssIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="68391984"
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; 
   d="scan'208";a="68391984"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2025 00:06:34 -0700
X-CSE-ConnectionGUID: KeWnZAu5SZWUCy506TvOyA==
X-CSE-MsgGUID: ynVrb7x6Q86j/j5QqcOFVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; 
   d="scan'208";a="149544891"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.141])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2025 00:06:31 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 3 Jun 2025 10:06:28 +0300 (EEST)
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, 
    "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, 
    Hans de Goede <hdegoede@redhat.com>, 
    "De Marchi, Lucas" <lucas.demarchi@intel.com>, 
    "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: RE: [PATCH 07/10] platform/x86/intel/pmt: use a version struct
In-Reply-To: <IA1PR11MB6418CDAF5CAD4C94FE0ED952C162A@IA1PR11MB6418.namprd11.prod.outlook.com>
Message-ID: <c2cf634b-f45d-e433-f070-96109d908f33@linux.intel.com>
References: <20250530203356.190234-1-michael.j.ruhl@intel.com> <20250530203356.190234-7-michael.j.ruhl@intel.com> <9bc973a8-f72f-7d17-a0b0-7f30ca939408@linux.intel.com> <IA1PR11MB6418CDAF5CAD4C94FE0ED952C162A@IA1PR11MB6418.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-360687203-1748934388=:937"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-360687203-1748934388=:937
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 2 Jun 2025, Ruhl, Michael J wrote:

> >-----Original Message-----
> >From: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> >Sent: Saturday, May 31, 2025 1:46 AM
> >To: Ruhl, Michael J <michael.j.ruhl@intel.com>
> >Cc: platform-driver-x86@vger.kernel.org; intel-xe@lists.freedesktop.org;=
 Hans
> >de Goede <hdegoede@redhat.com>; De Marchi, Lucas
> ><lucas.demarchi@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>
> >Subject: Re: [PATCH 07/10] platform/x86/intel/pmt: use a version struct
> >
> >On Fri, 30 May 2025, Michael J. Ruhl wrote:
> >
> >> In preparation for supporting multiple crashlog versions, use
> >> a struct to keep bit offset info for the status and control
> >> bits.
> >>
> >> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> >> ---
> >>  drivers/platform/x86/intel/pmt/crashlog.c | 177 ++++++++++++++-------=
-
> >>  1 file changed, 113 insertions(+), 64 deletions(-)
> >>
> >> diff --git a/drivers/platform/x86/intel/pmt/crashlog.c
> >b/drivers/platform/x86/intel/pmt/crashlog.c
> >> index 09cd0a1346f3..e6eea8809a56 100644
> >> --- a/drivers/platform/x86/intel/pmt/crashlog.c
> >> +++ b/drivers/platform/x86/intel/pmt/crashlog.c
> >> @@ -22,21 +22,6 @@
> >>  /* Crashlog discovery header types */
> >>  #define CRASH_TYPE_OOBMSM=091
> >>
> >> -/* Control Flags */
> >> -#define CRASHLOG_FLAG_DISABLE=09=09BIT(28)
> >> -
> >> -/*
> >> - * Bits 29 and 30 control the state of bit 31.
> >> - *
> >> - * Bit 29 will clear bit 31, if set, allowing a new crashlog to be ca=
ptured.
> >> - * Bit 30 will immediately trigger a crashlog to be generated, settin=
g bit 31.
> >> - * Bit 31 is the read-only status with a 1 indicating log is complete=
=2E
> >> - */
> >> -#define CRASHLOG_FLAG_TRIGGER_CLEAR=09BIT(29)
> >> -#define CRASHLOG_FLAG_TRIGGER_EXECUTE=09BIT(30)
> >> -#define CRASHLOG_FLAG_TRIGGER_COMPLETE=09BIT(31)
> >> -#define CRASHLOG_FLAG_TRIGGER_MASK=09GENMASK(31, 28)
> >> -
> >>  /* Crashlog Discovery Header */
> >>  #define CONTROL_OFFSET=09=090x0
> >>  #define GUID_OFFSET=09=090x4
> >> @@ -48,10 +33,63 @@
> >>  /* size is in bytes */
> >>  #define GET_SIZE(v)=09=09((v) * sizeof(u32))
> >>
> >> +/*
> >> + * Type 1 Version 0
> >> + * status and control registers are combined.
> >> + *
> >> + * Bits 29 and 30 control the state of bit 31.
> >> + * Bit 29 will clear bit 31, if set, allowing a new crashlog to be ca=
ptured.
> >> + * Bit 30 will immediately trigger a crashlog to be generated, settin=
g bit 31.
> >> + * Bit 31 is the read-only status with a 1 indicating log is complete=
=2E
> >> + */
> >> +#define TYPE1_VER0_STATUS_OFFSET=090x00
> >> +#define TYPE1_VER0_CONTROL_OFFSET=090x00
> >> +
> >> +#define TYPE1_VER0_DISABLE=09=09BIT(28)
> >> +#define TYPE1_VER0_CLEAR=09=09BIT(29)
> >> +#define TYPE1_VER0_EXECUTE=09=09BIT(30)
> >> +#define TYPE1_VER0_COMPLETE=09=09BIT(31)
> >> +#define TYPE1_VER0_TRIGGER_MASK=09=09GENMASK(31, 28)
> >> +
> >> +/* After offset, order alphabetically, not bit ordered */
> >> +struct crashlog_status {
> >> +=09u32 offset;
> >> +=09u32 clear;
> >> +=09u32 complete;
> >> +=09u32 disable;
> >> +};
> >> +
> >> +struct crashlog_control {
> >> +=09u32 offset;
> >> +=09u32 trigger_mask;
> >> +=09u32 clear;
> >> +=09u32 disable;
> >> +=09u32 manual;
> >> +};
> >> +
> >> +struct crashlog_info {
> >> +=09struct crashlog_status status;
> >> +=09struct crashlog_control control;
> >> +};
> >> +
> >> +const struct crashlog_info crashlog_type1_ver0 =3D {
> >> +=09.status.offset =3D CONTROL_OFFSET,
> >> +=09.status.clear =3D TYPE1_VER0_CLEAR,
> >> +=09.status.complete =3D TYPE1_VER0_COMPLETE,
> >> +=09.status.disable =3D TYPE1_VER0_DISABLE,
> >> +
> >> +=09.control.offset =3D CONTROL_OFFSET,
> >> +=09.control.trigger_mask =3D TYPE1_VER0_TRIGGER_MASK,
> >> +=09.control.clear =3D TYPE1_VER0_CLEAR,
> >> +=09.control.disable =3D TYPE1_VER0_DISABLE,
> >> +=09.control.manual =3D TYPE1_VER0_EXECUTE,
> >> +};
> >> +
> >>  struct crashlog_entry {
> >>  =09/* entry must be first member of struct */
> >>  =09struct intel_pmt_entry=09=09entry;
> >>  =09struct mutex=09=09=09control_mutex;
> >> +=09const struct crashlog_info=09*info;
> >>  };
> >>
> >>  struct pmt_crashlog_priv {
> >> @@ -60,24 +98,10 @@ struct pmt_crashlog_priv {
> >>  };
> >>
> >>  /*
> >> - * I/O
> >> + * This is the generic access to a PMT struct. So the use of
> >> + * struct crashlog_entry
> >> + * doesn't "make sense" here.
> >>   */
> >> -static bool pmt_crashlog_complete(struct intel_pmt_entry *entry)
> >> -{
> >> -=09u32 control =3D readl(entry->disc_table + CONTROL_OFFSET);
> >> -
> >> -=09/* return current value of the crashlog complete flag */
> >> -=09return !!(control & CRASHLOG_FLAG_TRIGGER_COMPLETE);
> >> -}
> >> -
> >> -static bool pmt_crashlog_disabled(struct intel_pmt_entry *entry)
> >> -{
> >> -=09u32 control =3D readl(entry->disc_table + CONTROL_OFFSET);
> >> -
> >> -=09/* return current value of the crashlog disabled flag */
> >> -=09return !!(control & CRASHLOG_FLAG_DISABLE);
> >> -}
> >> -
> >>  static bool pmt_crashlog_supported(struct intel_pmt_entry *entry)
> >>  {
> >>  =09u32 discovery_header =3D readl(entry->disc_table + CONTROL_OFFSET)=
;
> >> @@ -93,40 +117,64 @@ static bool pmt_crashlog_supported(struct
> >intel_pmt_entry *entry)
> >>  =09return crash_type =3D=3D CRASH_TYPE_OOBMSM && version =3D=3D 0;
> >>  }
> >>
> >> +/*
> >> + * I/O
> >> + */
> >> +static bool pmt_crashlog_complete(struct intel_pmt_entry *entry,
> >> +=09=09=09=09  const struct crashlog_status *status)
> >
> >I didn't fine comb this change but IMO it would be better to pass just
> >crashlog_info here, the same applies to the other functions too taking
> >just one of the substructs.
>=20
> The issue I ran into was that the info and entry are separate members... =
 So I would pass crashlog_entry
> and then do this:
>=20
>=20
> static bool pmt_crashlog_complete(struct crashlog_entry *crashlog)=20
> {
> =09struct intel_pmt_entry *entry =3D &crashlog->entry;
> =09struct crashlog_status *status =3D &crashlog->info->status;
> =09int reg =3D readl(entry->disc_table + status->offset;
>=20
> =09return !!(reg & status->complete);
> }
>=20
> If that is preferred, I will update.

This look okay to me.

--=20
 i.

> >Overall, this change looks definitely better than the earlier version
> >that was based on those if () constructs. Good work! :-)
>=20
> I agree.  This is a lot cleaner than the previous attempt.  Thanks for th=
e hints! =F0=9F=98=8A
>=20
> M
>=20
> >> +{
> >> +=09u32 reg =3D readl(entry->disc_table + status->offset);
> >> +
> >> +=09/* return current value of the crashlog complete flag */
> >> +=09return !!(reg & status->complete);
> >> +}
> >> +
> >> +static bool pmt_crashlog_disabled(struct intel_pmt_entry *entry,
> >> +=09=09=09=09  const struct crashlog_status *status)
> >> +{
> >> +=09u32 reg =3D readl(entry->disc_table + status->offset);
> >> +
> >> +=09/* return current value of the crashlog disabled flag */
> >> +=09return !!(reg & status->disable);
> >> +}
> >> +
> >>  static void pmt_crashlog_set_disable(struct intel_pmt_entry *entry,
> >> +=09=09=09=09     const struct crashlog_control *control,
> >>  =09=09=09=09     bool disable)
> >>  {
> >> -=09u32 control =3D readl(entry->disc_table + CONTROL_OFFSET);
> >> +=09u32 reg =3D readl(entry->disc_table + control->offset);
> >>
> >>  =09/* clear trigger bits so we are only modifying disable flag */
> >> -=09control &=3D ~CRASHLOG_FLAG_TRIGGER_MASK;
> >> +=09reg &=3D ~control->trigger_mask;
> >>
> >>  =09if (disable)
> >> -=09=09control |=3D CRASHLOG_FLAG_DISABLE;
> >> +=09=09reg |=3D control->disable;
> >>  =09else
> >> -=09=09control &=3D ~CRASHLOG_FLAG_DISABLE;
> >> +=09=09reg &=3D ~control->disable;
> >>
> >> -=09writel(control, entry->disc_table + CONTROL_OFFSET);
> >> +=09writel(reg, entry->disc_table + control->offset);
> >>  }
> >>
> >> -static void pmt_crashlog_set_clear(struct intel_pmt_entry *entry)
> >> +static void pmt_crashlog_set_clear(struct intel_pmt_entry *entry,
> >> +=09=09=09=09   const struct crashlog_control *control)
> >>  {
> >> -=09u32 control =3D readl(entry->disc_table + CONTROL_OFFSET);
> >> +=09u32 reg =3D readl(entry->disc_table + control->offset);
> >>
> >> -=09control &=3D ~CRASHLOG_FLAG_TRIGGER_MASK;
> >> -=09control |=3D CRASHLOG_FLAG_TRIGGER_CLEAR;
> >> +=09reg &=3D ~control->trigger_mask;
> >> +=09reg |=3D control->clear;
> >>
> >> -=09writel(control, entry->disc_table + CONTROL_OFFSET);
> >> +=09writel(reg, entry->disc_table + control->offset);
> >>  }
> >>
> >> -static void pmt_crashlog_set_execute(struct intel_pmt_entry *entry)
> >> +static void pmt_crashlog_set_execute(struct intel_pmt_entry *entry,
> >> +=09=09=09=09     const struct crashlog_control *control)
> >>  {
> >> -=09u32 control =3D readl(entry->disc_table + CONTROL_OFFSET);
> >> +=09u32 reg =3D readl(entry->disc_table + control->offset);
> >>
> >> -=09control &=3D ~CRASHLOG_FLAG_TRIGGER_MASK;
> >> -=09control |=3D CRASHLOG_FLAG_TRIGGER_EXECUTE;
> >> +=09reg &=3D ~control->trigger_mask;
> >> +=09reg |=3D control->manual;
> >>
> >> -=09writel(control, entry->disc_table + CONTROL_OFFSET);
> >> +=09writel(reg, entry->disc_table + control->offset);
> >>  }
> >>
> >>  /*
> >> @@ -135,8 +183,8 @@ static void pmt_crashlog_set_execute(struct
> >intel_pmt_entry *entry)
> >>  static ssize_t
> >>  enable_show(struct device *dev, struct device_attribute *attr, char *=
buf)
> >>  {
> >> -=09struct intel_pmt_entry *entry =3D dev_get_drvdata(dev);
> >> -=09int enabled =3D !pmt_crashlog_disabled(entry);
> >> +=09struct crashlog_entry *crashlog =3D dev_get_drvdata(dev);
> >> +=09int enabled =3D !pmt_crashlog_disabled(&crashlog->entry, &crashlog=
-
> >>info->status);
> >>
> >>  =09return sprintf(buf, "%d\n", enabled);
> >>  }
> >> @@ -145,19 +193,19 @@ static ssize_t
> >>  enable_store(struct device *dev, struct device_attribute *attr,
> >>  =09     const char *buf, size_t count)
> >>  {
> >> -=09struct crashlog_entry *entry;
> >> +=09struct crashlog_entry *crashlog;
> >>  =09bool enabled;
> >>  =09int result;
> >>
> >> -=09entry =3D dev_get_drvdata(dev);
> >> +=09crashlog =3D dev_get_drvdata(dev);
> >>
> >>  =09result =3D kstrtobool(buf, &enabled);
> >>  =09if (result)
> >>  =09=09return result;
> >>
> >> -=09guard(mutex)(&entry->control_mutex);
> >> +=09guard(mutex)(&crashlog->control_mutex);
> >>
> >> -=09pmt_crashlog_set_disable(&entry->entry, !enabled);
> >> +=09pmt_crashlog_set_disable(&crashlog->entry, &crashlog->info->contro=
l,
> >!enabled);
> >>
> >>  =09return count;
> >>  }
> >> @@ -166,11 +214,11 @@ static DEVICE_ATTR_RW(enable);
> >>  static ssize_t
> >>  trigger_show(struct device *dev, struct device_attribute *attr, char =
*buf)
> >>  {
> >> -=09struct intel_pmt_entry *entry;
> >> +=09struct crashlog_entry *crashlog;
> >>  =09int trigger;
> >>
> >> -=09entry =3D dev_get_drvdata(dev);
> >> -=09trigger =3D pmt_crashlog_complete(entry);
> >> +=09crashlog =3D dev_get_drvdata(dev);
> >> +=09trigger =3D pmt_crashlog_complete(&crashlog->entry, &crashlog->inf=
o-
> >>status);
> >>
> >>  =09return sprintf(buf, "%d\n", trigger);
> >>  }
> >> @@ -179,32 +227,32 @@ static ssize_t
> >>  trigger_store(struct device *dev, struct device_attribute *attr,
> >>  =09      const char *buf, size_t count)
> >>  {
> >> -=09struct crashlog_entry *entry;
> >> +=09struct crashlog_entry *crashlog;
> >>  =09bool trigger;
> >>  =09int result;
> >>
> >> -=09entry =3D dev_get_drvdata(dev);
> >> +=09crashlog =3D dev_get_drvdata(dev);
> >>
> >>  =09result =3D kstrtobool(buf, &trigger);
> >>  =09if (result)
> >>  =09=09return result;
> >>
> >> -=09guard(mutex)(&entry->control_mutex);
> >> +=09guard(mutex)(&crashlog->control_mutex);
> >>
> >>  =09if (!trigger) {
> >> -=09=09pmt_crashlog_set_clear(&entry->entry);
> >> +=09=09pmt_crashlog_set_clear(&crashlog->entry, &crashlog->info-
> >>control);
> >>  =09=09return count;
> >>  =09}
> >>
> >>  =09/* we cannot trigger a new crash if one is still pending */
> >> -=09if (pmt_crashlog_complete(&entry->entry))
> >> +=09if (pmt_crashlog_complete(&crashlog->entry, &crashlog->info-
> >>status))
> >>  =09=09return -EEXIST;
> >>
> >>  =09/* if device is currently disabled, return busy */
> >> -=09if (pmt_crashlog_disabled(&entry->entry))
> >> +=09if (pmt_crashlog_disabled(&crashlog->entry, &crashlog->info->statu=
s))
> >>  =09=09return -EBUSY;
> >>
> >> -=09pmt_crashlog_set_execute(&entry->entry);
> >> +=09pmt_crashlog_set_execute(&crashlog->entry, &crashlog->info-
> >>control);
> >>
> >>  =09return count;
> >>  }
> >> @@ -230,9 +278,10 @@ static int pmt_crashlog_header_decode(struct
> >intel_pmt_entry *entry,
> >>  =09if (!pmt_crashlog_supported(entry))
> >>  =09=09return 1;
> >>
> >> -=09/* initialize control mutex */
> >> +=09/* initialize the crashlog struct */
> >>  =09crashlog =3D container_of(entry, struct crashlog_entry, entry);
> >>  =09mutex_init(&crashlog->control_mutex);
> >> +=09crashlog->info =3D &crashlog_type1_ver0;
> >>
> >>  =09header->access_type =3D GET_ACCESS(readl(disc_table));
> >>  =09header->guid =3D readl(disc_table + GUID_OFFSET);
> >>
> >
> >--
> > i.
>=20
>=20
--8323328-360687203-1748934388=:937--
