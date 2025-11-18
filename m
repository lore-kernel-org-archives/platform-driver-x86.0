Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F253F30F809;
	Tue, 18 Nov 2025 09:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763457376; cv=none; b=Ec6WZrBnDEzi7jFQxEHv6I5jQ4BKUZzft7Nps1c8mGUuslZf4tl6D0t7p7dEeFOLQJTIUwSuM5e6Gv+s/EI0fWVD0vCI6Y/7fg6AxR1kK4s8oGACivIq/r1qWkpqb0xyalKkIcpKeVu920IRwYEVwz20gfHPWOKiE/TNfk1UkE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763457376; c=relaxed/simple;
	bh=zulppOaYGRolVWk500Rehm0KKuvb2KYVScnJGTW7tXc=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=dOqn/413wlusd+JDc3ASfggcv2PSsqN1Gfc87jGqZzVtZKF7p0mKbLjohrG+WGPbFnL2tqR7/vmVhgIgN8DiCGe+2L7X5FyOmfDoLzITysnplxoaqqm7aB2AuTbwPVQSiPowGB9DTekinpynKnFVBOIfqUH8lCmbRrLuCeWvBBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FjhPiCg7; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FjhPiCg7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763457373; x=1794993373;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=zulppOaYGRolVWk500Rehm0KKuvb2KYVScnJGTW7tXc=;
  b=FjhPiCg7BQuljexdG1A6n/7z2Q68/YNjAVolWfZ/50jTOTqgIQYwG9PT
   l25xBqsZzoew9Vt5yVfBLSGBC5gPCXrO4n6FfJefgF5+0oEdcXwuElSac
   IerZicp+FBA66o8hSNTSSORalRaucxraeMYQ6le/GnhZaZYwvVqLAY/JK
   0RZ25sSybjqp1RKdbtRIHKy74ZCUf4y7EsKVQrvsNW320ulMLAqQDxVYu
   UDdu0iE8JrJARigzikhzKZzkzyxFi2csmlYcjC6WedOs2F4Ws8bMm87bf
   AeYteYxX7jjH+gnDwNQufNPcuRtymxC7HkxI9R+Jq7M03qAsOaNqGjrpJ
   Q==;
X-CSE-ConnectionGUID: mFg9TQr3QFe7UsYZmWVmFQ==
X-CSE-MsgGUID: ox6/wZWRTaqOSfSC9bCQyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="75796090"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="75796090"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 01:16:12 -0800
X-CSE-ConnectionGUID: XRcD175+RIGRT28r9zJMXg==
X-CSE-MsgGUID: 5+L8kGSpSGax+MTSSUZ3bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="195169306"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.74])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 01:16:07 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 18 Nov 2025 11:16:04 +0200 (EET)
To: Denis Benato <benato.denis96@gmail.com>
cc: Denis Benato <denis.benato@linux.dev>, LKML <linux-kernel@vger.kernel.org>, 
    platform-driver-x86@vger.kernel.org, Hans de Goede <hansg@kernel.org>, 
    "Limonciello, Mario" <mario.limonciello@amd.com>, 
    "Luke D . Jones" <luke@ljones.dev>, Alok Tiwari <alok.a.tiwari@oracle.com>, 
    Derek John Clark <derekjohn.clark@gmail.com>, 
    Mateusz Schyboll <dragonn@op.pl>, porfet828@gmail.com
Subject: Re: [PATCH] platform/x86: asus-armoury: make CPU cores interface
 readonly
In-Reply-To: <6cc986bc-2f0d-43e5-99d7-0cbfd9150005@gmail.com>
Message-ID: <e1ce4d86-d741-e5fa-9ff3-ddbe3abc4f48@linux.intel.com>
References: <20251118005748.538726-1-denis.benato@linux.dev> <6cc986bc-2f0d-43e5-99d7-0cbfd9150005@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-28700229-1763457039=:1205"
Content-ID: <a83ba5f1-1c73-3ea2-4a80-87451f7b22dd@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-28700229-1763457039=:1205
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <b5de2cfd-74f1-42c3-c4ef-2aac450db7ee@linux.intel.com>

On Tue, 18 Nov 2025, Denis Benato wrote:

>=20
> On 11/18/25 01:57, Denis Benato wrote:
> > The CPU cores interface is inconsistent between AMD and Intel systems,
> > leading to probe failure: solve the problem taking following steps:
> > - make the interface read-only (avoid the possibility of bricks)
> > - do not fail if the interface returns unexpected data
> > - show interface errors at either info or debug level
> I felt like compile-time disabling the write endpoint after reading the c=
omment
> from Mario while still keeping the core of everything that was said in an=
 attempt
> to make everyone happy and preparing for the future.
>=20
> I can also evaluate the option to introduce a table for allowed models
> where the min number of cores is hardcoded for model as it is for TDP
> tunings: that way allowed values will be tested by someone...
> Material for another day.
>=20
> On a side note checkpatch says:
> ```
> WARNING: Argument '_fsname' is not used in function-like macro
> #293: FILE: drivers/platform/x86/asus-armoury.h:210:
> +#define ASUS_ATTR_GROUP_CORES(_attrname, _fsname, _dispname)=A0 =A0 =A0 =
=A0 =A0 =A0\
> =A0 =A0 =A0 =A0 __ATTR_SHOW_FMT(scalar_increment, _attrname, "%d\n", 1);=
=A0 =A0 =A0 =A0 \
> =A0 =A0 =A0 =A0 __ATTR_SHOW_FMT(display_name, _attrname, "%s\n", _dispnam=
e);=A0 =A0 \
> =A0 =A0 =A0 =A0 static struct kobj_attribute attr_##_attrname##_current_v=
alue =3D \
> +=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0__ASUS_ATTR_CPU_CORES(_attrname, current_=
value);=A0 =A0 =A0 =A0 \
> =A0 =A0 =A0 =A0 static struct kobj_attribute attr_##_attrname##_default_v=
alue =3D \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 __ASUS_ATTR_RO(_attrname, default_value);=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> =A0 =A0 =A0 =A0 static struct kobj_attribute attr_##_attrname##_min_value=
 =3D=A0 =A0 =A0\
> ```
>=20
> but _fsname name is used just below in the same macro:
> checkpatch.pl bug?
> > Links:
> > https://lore.kernel.org/all/20251114185337.578959-1-denis.benato@linux.=
dev/
> > https://lore.kernel.org/all/20251115145158.1172210-1-denis.benato@linux=
=2Edev/
> >
> > Suggested-by: Luke D. Jones <luke@ljones.dev>
> > Signed-off-by: Denis Benato <denis.benato@linux.dev>
> > ---
> >  drivers/platform/x86/asus-armoury.c | 104 ++++++++++++++++++++++++----
> >  drivers/platform/x86/asus-armoury.h |  12 +++-
> >  2 files changed, 99 insertions(+), 17 deletions(-)
> >
> > diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86=
/asus-armoury.c
> > index 9f67218ecd14..abbbcd62d0eb 100644
> > --- a/drivers/platform/x86/asus-armoury.c
> > +++ b/drivers/platform/x86/asus-armoury.c
> > @@ -118,11 +118,14 @@ struct asus_armoury_priv {
> >  =09 */
> >  =09struct mutex egpu_mutex;
> > =20
> > +#if IS_REACHABLE(CONFIG_ASUS_ARMOURY_CPU_CORES_RW)
> >  =09/*
> >  =09 * Mutex to prevent big/little core count changes writing to same
> >  =09 * endpoint at the same time. Must lock during attr store.
> >  =09 */
> >  =09struct mutex cpu_core_mutex;
> > +#endif /* CONFIG_ASUS_ARMOURY_CPU_CORES_RW */
> > +
> >  =09struct cpu_cores *cpu_cores;
> >  =09bool cpu_cores_changeable;
> > =20
> > @@ -136,7 +139,9 @@ struct asus_armoury_priv {
> >  static struct asus_armoury_priv asus_armoury =3D {
> >  =09.egpu_mutex =3D __MUTEX_INITIALIZER(asus_armoury.egpu_mutex),
> > =20
> > +#if IS_REACHABLE(CONFIG_ASUS_ARMOURY_CPU_CORES_RW)
> >  =09.cpu_core_mutex =3D __MUTEX_INITIALIZER(asus_armoury.cpu_core_mutex=
),
> > +#endif /* CONFIG_ASUS_ARMOURY_CPU_CORES_RW */
> >  };
> > =20
> >  struct fw_attrs_group {
> > @@ -285,6 +290,12 @@ static int armoury_set_devstate(struct kobj_attrib=
ute *attr,
> >  =09=09=09return -EINVAL;
> >  =09=09}
> >  =09=09break;
> > +=09case ASUS_WMI_DEVID_CORES_MAX:
> > +=09=09/*
> > +=09=09 * CPU cores max is a read-only property on supported devices.
> > +=09=09 */
> > +=09=09pr_err("Refusing to write to readonly devstate of CPU cores inte=
rface\n");
> > +=09=09return -EINVAL;
> >  =09default:
> >  =09=09/* No known problems are known for this dev_id */
> >  =09=09break;
> > @@ -803,6 +814,7 @@ static struct cpu_cores *init_cpu_cores_ctrl(void)
> >  =09=09return ERR_PTR(-ENODEV);
> >  =09}
> > =20
> > +=09pr_debug("CPU cores control interface max cores read 0%x.\n", cores=
);
> >  =09cores_p->max_power_cores =3D FIELD_GET(ASUS_POWER_CORE_MASK, cores)=
;
> >  =09cores_p->max_perf_cores =3D FIELD_GET(ASUS_PERF_CORE_MASK, cores);
> > =20
> > @@ -812,16 +824,30 @@ static struct cpu_cores *init_cpu_cores_ctrl(void=
)
> >  =09=09return ERR_PTR(-EIO);
> >  =09}
> > =20
> > +=09pr_debug("CPU cores control interface active cores read 0%x.\n", co=
res);
> >  =09cores_p->cur_power_cores =3D FIELD_GET(ASUS_POWER_CORE_MASK, cores)=
;
> >  =09cores_p->cur_perf_cores =3D FIELD_GET(ASUS_PERF_CORE_MASK, cores);
> > =20
> >  =09cores_p->min_power_cores =3D CPU_POWR_CORE_COUNT_MIN;
> >  =09cores_p->min_perf_cores =3D CPU_PERF_CORE_COUNT_MIN;
> > =20
> > +=09if (cores_p->min_perf_cores > cores_p->max_perf_cores) {
> > +=09=09pr_info("Invalid CPU performance cores count detected: min: %u, =
max: %u, current: %u\n",
> > +=09=09       cores_p->min_perf_cores,
> > +=09=09       cores_p->max_perf_cores,
> > +=09=09       cores_p->cur_perf_cores
> > +=09=09);
> > +=09=09return ERR_PTR(-EINVAL);
> > +=09}
> > +
> >  =09if ((cores_p->min_perf_cores > cores_p->max_perf_cores) ||
> >  =09    (cores_p->min_power_cores > cores_p->max_power_cores)
> >  =09) {
> > -=09=09pr_err("Invalid CPU cores count detected: interface is not safe =
to be used.\n");
> > +=09=09pr_info("Invalid CPU efficiency cores count detected: min: %u, m=
ax: %u, current: %u\n",
> > +=09=09       cores_p->min_power_cores,
> > +=09=09       cores_p->max_power_cores,
> > +=09=09       cores_p->cur_power_cores
> > +=09=09);
> >  =09=09return ERR_PTR(-EINVAL);
> >  =09}
> > =20
> > @@ -836,6 +862,24 @@ static struct cpu_cores *init_cpu_cores_ctrl(void)
> >  =09return no_free_ptr(cores_p);
> >  }
> > =20
> > +/**
> > + * cores_value_show() - Get the core count for the specified core type=
=2E
> > + * @kobj: The kobject associated to caller.
> > + * @attr: The kobj_attribute associated to caller.
> > + * @buf: The buffer that will be used to sysfs_emit.
> > + * @core_type: The core type (performance or efficiency).
> > + * @core_value: min, max or current count for the specified cores type=
=2E
> > + *
> > + * Intended usage is from sysfs attribute reading a CPU core count.
> > + *
> > + * This function assumes asus_armoury.cpu_cores is already initialized=
,
> > + * therefore the compatibility of the interface has already been check=
ed.
> > + *
> > + * Returns:
> > + * * %-EINVAL=09- invalid core value type.
> > + * * %0=09=09- successful and buf is filled by sysfs_emit.
> > + * * %other=09- error from sysfs_emit.
> > + */
> >  static ssize_t cores_value_show(struct kobject *kobj, struct kobj_attr=
ibute *attr, char *buf,
> >  =09=09=09=09enum cpu_core_type core_type, enum cpu_core_value core_val=
ue)
> >  {
> > @@ -865,6 +909,7 @@ static ssize_t cores_value_show(struct kobject *kob=
j, struct kobj_attribute *att
> >  =09return sysfs_emit(buf, "%u\n", cpu_core_value);
> >  }
> > =20
> > +#if IS_REACHABLE(CONFIG_ASUS_ARMOURY_CPU_CORES_RW)
> >  static ssize_t cores_current_value_store(struct kobject *kobj, struct =
kobj_attribute *attr,
> >  =09=09=09=09=09 const char *buf, enum cpu_core_type core_type)
> >  {
> > @@ -919,6 +964,7 @@ static ssize_t cores_current_value_store(struct kob=
ject *kobj, struct kobj_attri
> > =20
> >  =09return 0;
> >  }
> > +#endif /* CONFIG_ASUS_ARMOURY_CPU_CORES_RW */
> > =20
> >  static ssize_t cores_performance_min_value_show(struct kobject *kobj,
> >  =09=09=09=09=09=09struct kobj_attribute *attr, char *buf)
> > @@ -944,6 +990,7 @@ static ssize_t cores_performance_current_value_show=
(struct kobject *kobj,
> >  =09return cores_value_show(kobj, attr, buf, CPU_CORE_PERF, CPU_CORE_CU=
RRENT);
> >  }
> > =20
> > +#if IS_REACHABLE(CONFIG_ASUS_ARMOURY_CPU_CORES_RW)
> >  static ssize_t cores_performance_current_value_store(struct kobject *k=
obj,
> >  =09=09=09=09=09=09     struct kobj_attribute *attr,
> >  =09=09=09=09=09=09     const char *buf, size_t count)
> > @@ -956,8 +1003,9 @@ static ssize_t cores_performance_current_value_sto=
re(struct kobject *kobj,
> > =20
> >  =09return count;
> >  }
> > -ASUS_ATTR_GROUP_CORES_RW(cores_performance, "cores_performance",
> > -=09=09=09 "Set the max available performance cores");
> > +#endif /* CONFIG_ASUS_ARMOURY_CPU_CORES_RW */
> > +ASUS_ATTR_GROUP_CORES(cores_performance, "cores_performance",
> > +=09=09=09 "Get available performance cores");
> > =20
> >  /* Define helper to access the current power mode tunable values */
> >  static inline struct rog_tunables *get_current_tunables(void)
> > @@ -992,6 +1040,7 @@ static ssize_t cores_efficiency_current_value_show=
(struct kobject *kobj,
> >  =09return cores_value_show(kobj, attr, buf, CPU_CORE_POWER, CPU_CORE_C=
URRENT);
> >  }
> > =20
> > +#if IS_REACHABLE(CONFIG_ASUS_ARMOURY_CPU_CORES_RW)
> >  static ssize_t cores_efficiency_current_value_store(struct kobject *ko=
bj,
> >  =09=09=09=09=09=09    struct kobj_attribute *attr, const char *buf,
> >  =09=09=09=09=09=09    size_t count)
> > @@ -1004,8 +1053,9 @@ static ssize_t cores_efficiency_current_value_sto=
re(struct kobject *kobj,
> > =20
> >  =09return count;
> >  }
> > -ASUS_ATTR_GROUP_CORES_RW(cores_efficiency, "cores_efficiency",
> > -=09=09    "Set the max available efficiency cores");
> > +#endif /* CONFIG_ASUS_ARMOURY_CPU_CORES_RW */
> > +ASUS_ATTR_GROUP_CORES(cores_efficiency, "cores_efficiency",
> > +=09=09    "Get available efficiency cores");
> > =20
> >  /* Simple attribute creation */
> >  ASUS_ATTR_GROUP_ENUM_INT_RO(charge_mode, "charge_mode", ASUS_WMI_DEVID=
_CHARGE_MODE, "0;1;2\n",
> > @@ -1048,8 +1098,6 @@ static const struct asus_attr_group armoury_attr_=
groups[] =3D {
> >  =09{ &egpu_enable_attr_group, ASUS_WMI_DEVID_EGPU },
> >  =09{ &dgpu_disable_attr_group, ASUS_WMI_DEVID_DGPU },
> >  =09{ &apu_mem_attr_group, ASUS_WMI_DEVID_APU_MEM },
> > -=09{ &cores_efficiency_attr_group, ASUS_WMI_DEVID_CORES_MAX },
> > -=09{ &cores_performance_attr_group, ASUS_WMI_DEVID_CORES_MAX },
> > =20
> >  =09{ &ppt_pl1_spl_attr_group, ASUS_WMI_DEVID_PPT_PL1_SPL },
> >  =09{ &ppt_pl2_sppt_attr_group, ASUS_WMI_DEVID_PPT_PL2_SPPT },
> > @@ -1191,6 +1239,22 @@ static int asus_fw_attr_add(void)
> >  =09=09}
> >  =09}
> > =20
> > +=09if (asus_armoury.cpu_cores !=3D NULL) {
> > +=09=09err =3D sysfs_create_group(&asus_armoury.fw_attr_kset->kobj,
> > +=09=09=09=09=09&cores_efficiency_attr_group);
> > +=09=09if (err) {
> > +=09=09=09pr_err("Failed to create sysfs-group for cpu efficiency cores=
: %d\n", err);
> > +=09=09=09goto err_remove_cores_efficiency_group;
> > +=09=09}
> > +
> > +=09=09err =3D sysfs_create_group(&asus_armoury.fw_attr_kset->kobj,
> > +=09=09=09=09=09&cores_performance_attr_group);
> > +=09=09if (err) {
> > +=09=09=09pr_err("Failed to create sysfs-group for cpu performance core=
s: %d\n", err);
> > +=09=09=09goto err_remove_cores_performance_group;
> > +=09=09}
> > +=09}
> > +
> >  =09for (i =3D 0; i < ARRAY_SIZE(armoury_attr_groups); i++) {
> >  =09=09if (!armoury_has_devstate(armoury_attr_groups[i].wmi_devid))
> >  =09=09=09continue;
> > @@ -1230,6 +1294,12 @@ static int asus_fw_attr_add(void)
> >  =09}
> >  =09if (asus_armoury.gpu_mux_dev_id)
> >  =09=09sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &gpu_mux_mo=
de_attr_group);
> > +err_remove_cores_performance_group:
> > +=09if (asus_armoury.cpu_cores !=3D NULL)
> > +=09=09sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &cores_perf=
ormance_attr_group);
> > +err_remove_cores_efficiency_group:
> > +=09if (asus_armoury.cpu_cores !=3D NULL)
> > +=09=09sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &cores_effi=
ciency_attr_group);
> >  err_remove_mini_led_group:
> >  =09if (asus_armoury.mini_led_dev_id)
> >  =09=09sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &mini_led_m=
ode_attr_group);
> > @@ -1375,7 +1445,6 @@ static int __init asus_fw_init(void)
> >  {
> >  =09char *wmi_uid;
> >  =09struct cpu_cores *cpu_cores_ctrl;
> > -=09int err;
> > =20
> >  =09wmi_uid =3D wmi_get_acpi_device_uid(ASUS_WMI_MGMT_GUID);
> >  =09if (!wmi_uid)
> > @@ -1389,16 +1458,14 @@ static int __init asus_fw_init(void)
> >  =09=09return -ENODEV;
> > =20
> >  =09asus_armoury.cpu_cores_changeable =3D false;
> > +=09asus_armoury.cpu_cores =3D NULL;
> >  =09if (armoury_has_devstate(ASUS_WMI_DEVID_CORES_MAX)) {
> >  =09=09cpu_cores_ctrl =3D init_cpu_cores_ctrl();
> > -=09=09if (IS_ERR(cpu_cores_ctrl)) {
> > -=09=09=09err =3D PTR_ERR(cpu_cores_ctrl);
> > -=09=09=09pr_err("Could not initialise CPU core control: %d\n", err);
> > -=09=09=09return err;
> > +=09=09if (!IS_ERR(cpu_cores_ctrl)) {
> > +=09=09=09pr_debug("CPU cores control available.\n");
> > +=09=09=09asus_armoury.cpu_cores =3D cpu_cores_ctrl;
> > +=09=09=09asus_armoury.cpu_cores_changeable =3D true;
> >  =09=09}
> > -
> > -=09=09asus_armoury.cpu_cores =3D cpu_cores_ctrl;
> > -=09=09asus_armoury.cpu_cores_changeable =3D true;
> >  =09}
> > =20
> >  =09init_rog_tunables();
> > @@ -1417,6 +1484,13 @@ static void __exit asus_fw_exit(void)
> >  =09=09=09=09=09   armoury_attr_groups[i].attr_group);
> >  =09}
> > =20
> > +=09if (asus_armoury.cpu_cores !=3D NULL) {
> > +=09=09sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj,
> > +=09=09=09=09   &cores_performance_attr_group);
> > +=09=09sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj,
> > +=09=09=09=09   &cores_efficiency_attr_group);
> > +=09}
> > +
> >  =09if (asus_armoury.gpu_mux_dev_id)
> >  =09=09sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &gpu_mux_mo=
de_attr_group);
> > =20
> > diff --git a/drivers/platform/x86/asus-armoury.h b/drivers/platform/x86=
/asus-armoury.h
> > index 2f05a2e0cab3..6b2bfe763d23 100644
> > --- a/drivers/platform/x86/asus-armoury.h
> > +++ b/drivers/platform/x86/asus-armoury.h
> > @@ -198,12 +198,20 @@ ssize_t armoury_attr_uint_show(struct kobject *ko=
bj, struct kobj_attribute *attr
> >  =09=09.name =3D _fsname, .attrs =3D _attrname##_attrs=09=09=09\
> >  =09}
> > =20
> > +#if IS_REACHABLE(CONFIG_ASUS_ARMOURY_CPU_CORES_RW)
> > +=09#define __ASUS_ATTR_CPU_CORES(_attrname, __attrval) \
> > +=09=09__ASUS_ATTR_RW(_attrname, __attrval)
> > +#else
> > +=09#define __ASUS_ATTR_CPU_CORES(_attrname, __attrval) \
> > +=09=09__ASUS_ATTR_RO(_attrname, __attrval)
> > +#endif /* CONFIG_ASUS_ARMOURY_CPU_CORES_RW */
> > +
> >  /* CPU core attributes need a little different in setup */
> > -#define ASUS_ATTR_GROUP_CORES_RW(_attrname, _fsname, _dispname)=09=09\
> > +#define ASUS_ATTR_GROUP_CORES(_attrname, _fsname, _dispname)=09=09\
> >  =09__ATTR_SHOW_FMT(scalar_increment, _attrname, "%d\n", 1);=09\
> >  =09__ATTR_SHOW_FMT(display_name, _attrname, "%s\n", _dispname);=09\
> >  =09static struct kobj_attribute attr_##_attrname##_current_value =3D=
=09\
> > -=09=09__ASUS_ATTR_RW(_attrname, current_value);=09=09\
> > +=09=09__ASUS_ATTR_CPU_CORES(_attrname, current_value);=09\
> >  =09static struct kobj_attribute attr_##_attrname##_default_value =3D \
> >  =09=09__ASUS_ATTR_RO(_attrname, default_value);=09=09\
> >  =09static struct kobj_attribute attr_##_attrname##_min_value =3D=09\
>=20

Hi Denis,

This cores thing has unfortunately turned into too much of a mess, a fixup=
=20
after fixup, disagreement of even what should be included and what not.

I'm really sorry for all the extra trouble these people are putting you=20
through as apparently even 17 versions of the main patch series weren't=20
enough to get them to stretch their fingers over the keyboard :-/.

I've now dropped the cores patch from the review-ilpo-next branch but=20
tried to keep the rest. Please check I didn't make any stupid mistakes=20
while resolving the resulting conflicts with the ppt/nv change, at least=20
the diff against the removal patch looked promising. If there's an issue,=
=20
please just provide a clean v18 of the main series without the cores patch=
=20
so I can replace.

If you want to send a clean version of the cores patch (separately), I can=
=20
consider it after giving enough time for people to comment.

--=20
 i.
--8323328-28700229-1763457039=:1205--
