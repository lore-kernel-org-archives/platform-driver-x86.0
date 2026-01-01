Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B9422F01;
	Thu,  1 Jan 2026 11:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767266627; cv=none; b=OP8qEhlLPfsuEqjy9ljl/fAKqq0XSS+roat2mBLJvczzsW4AI7DZ5SeXAKeL4qQ+QdrKeTIN5+P5pUOx8d7QCHk3OpzEV6xtqnNqFEOsdoKlRGC/vZ/UQZYPKVCGadzhr5OmqhgcJOE105pqoqEDYNlrI/wXg9H4nFTd3Bh9fa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767266627; c=relaxed/simple;
	bh=J8KPfEIBQP4yf//pEeUjEoUkva/3TrWMJ5omxDuxMaU=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ftB7c5hLK0gsugTDQw//+ITHfHxyK5SrgoJ/MSPbWG/w/5xHcAJ0AzPSiYZ5mcjC93KYTcdykh7whGDN9uX8AqL8kB5X2+74KFGIxJuXT6OJBf473U7c86PAGOFyhLOfc4zSofqanBP+/pitvpqu0lnq5h3n0ED11Uo6NVWu5Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yz/2lBcJ; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yz/2lBcJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767266625; x=1798802625;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=J8KPfEIBQP4yf//pEeUjEoUkva/3TrWMJ5omxDuxMaU=;
  b=Yz/2lBcJnygmyZvqZs5xyFmXWWh3bRMJL+nRjHjg1ukIKGJqlfSZHOTK
   hvxFqyK0OlPeVXw8A4QZgBmZ0utkO9eUAQt+3Qg6rkMS7fS277tjqsFAH
   pCN8EBbEM3+ixDQUr8wVgx63SyVl+8vRXAZ+dL9A3FQZfkmBC+PagtbFO
   A7k6DCipvyNGS7yyfHCPEGQ+bkV4eeVLsS3ZFMYNx5IRkWY0cYxxPO9rS
   VYtEQRmDPFIFbgGuWOnc5ieR0R/0NK9HARHvSymsbDKRzmgsaLUJJ1KKV
   mLHDD+YsBgi4YGVCb3gFcdeNP4JuINlKWMN+944U8MxwHGrB18Bt8629o
   w==;
X-CSE-ConnectionGUID: SjFXrk5ST2eREGww2ynWpQ==
X-CSE-MsgGUID: ZlSD4J0jTlmqFH6n2W7Qjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="67813576"
X-IronPort-AV: E=Sophos;i="6.21,194,1763452800"; 
   d="scan'208";a="67813576"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jan 2026 03:23:43 -0800
X-CSE-ConnectionGUID: yTlqNxpyT/+1OPfEKX1VjA==
X-CSE-MsgGUID: 8EsLg4euRPKnUuKzsD42UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,194,1763452800"; 
   d="scan'208";a="206140395"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.230])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jan 2026 03:23:40 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 1 Jan 2026 13:23:36 +0200 (EET)
To: Denis Benato <denis.benato@linux.dev>
cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, 
    Hans de Goede <hansg@kernel.org>, "Luke D . Jones" <luke@ljones.dev>, 
    Mateusz Schyboll <dragonn@op.pl>, 
    =?ISO-8859-2?Q?Merthan_Karaka=BA?= <m3rthn.k@gmail.com>, 
    Denis Benato <benato.denis96@gmail.com>
Subject: Re: [PATCH v3 3/3] platform/x86: asus-armoury: add keyboard control
 firmware attributes
In-Reply-To: <20251230140525.42017-4-denis.benato@linux.dev>
Message-ID: <b8e7c1d5-354c-5ebb-93f0-c4b8fcc23d43@linux.intel.com>
References: <20251230140525.42017-1-denis.benato@linux.dev> <20251230140525.42017-4-denis.benato@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-138076391-1767266616=:1003"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-138076391-1767266616=:1003
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 30 Dec 2025, Denis Benato wrote:

> Implement keyboard status firmware attributes in asus-armoury after
> deprecating those attribute(s) in asus-wmi to avoid losing the ability
> to control LEDs status.
>=20
> Signed-off-by: Denis Benato <denis.benato@linux.dev>
> Tested-by: Merthan Karaka=C5=9F <m3rthn.k@gmail.com>
> ---
>  drivers/platform/x86/asus-armoury.c        | 252 +++++++++++++++++++++
>  include/linux/platform_data/x86/asus-wmi.h |  17 ++
>  2 files changed, 269 insertions(+)
>=20
> diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/a=
sus-armoury.c
> index 9c1a9ad42bc4..5bd1abfa2d73 100644
> --- a/drivers/platform/x86/asus-armoury.c
> +++ b/drivers/platform/x86/asus-armoury.c
> @@ -76,10 +76,22 @@ struct rog_tunables {
>  =09u32 nv_tgp;
>  };
> =20
> +struct asus_armoury_kbd_status {
> +=09bool boot;
> +=09bool awake;
> +=09bool sleep;
> +=09bool shutdown;
> +};
> +
>  struct asus_armoury_priv {
>  =09struct device *fw_attr_dev;
>  =09struct kset *fw_attr_kset;
> =20
> +=09struct mutex keyboard_mutex;
> +
> +=09/* Current TUF keyboard RGB state tracking */
> +=09struct asus_armoury_kbd_status *kbd_state;
> +
>  =09/*
>  =09 * Mutex to protect eGPU activation/deactivation
>  =09 * sequences and dGPU connection status:
> @@ -97,6 +109,7 @@ struct asus_armoury_priv {
> =20
>  static struct asus_armoury_priv asus_armoury =3D {
>  =09.egpu_mutex =3D __MUTEX_INITIALIZER(asus_armoury.egpu_mutex),
> +=09.keyboard_mutex =3D __MUTEX_INITIALIZER(asus_armoury.keyboard_mutex),
>  };
> =20
>  struct fw_attrs_group {
> @@ -433,6 +446,163 @@ static ssize_t mini_led_mode_possible_values_show(s=
truct kobject *kobj,
>  }
>  ASUS_ATTR_GROUP_ENUM(mini_led_mode, "mini_led_mode", "Set the mini-LED b=
acklight mode");
> =20
> +/* Keyboard power management *******************************************=
*******/
> +
> +static int armoury_kbd_state(struct kobj_attribute *attr,
> +=09=09=09     const struct asus_armoury_kbd_status *status)
> +{
> +=09const u32 kbd_state =3D ASUS_WMI_DEVID_TUF_RGB_STATE_EN | ASUS_WMI_DE=
VID_TUF_RGB_STATE_CMD |

I suggest you remove const and add semicolon after this.

=2E.. And then do these FIELD_PREP()s as "normal code" as it moves them lef=
t=20
a bit, it's the real content here anyway:

> +=09=09=09      FIELD_PREP(ASUS_WMI_DEVID_TUF_RGB_STATE_MASK_BOOT, status=
->boot ? 1 : 0) |
> +=09=09=09      FIELD_PREP(ASUS_WMI_DEVID_TUF_RGB_STATE_MASK_AWAKE, statu=
s->awake ? 1 : 0) |
> +=09=09=09      FIELD_PREP(ASUS_WMI_DEVID_TUF_RGB_STATE_MASK_SLEEP, statu=
s->sleep ? 1 : 0) |
> +=09=09=09      FIELD_PREP(ASUS_WMI_DEVID_TUF_RGB_STATE_MASK_SHUTDOWN, st=
atus->shutdown ? 1 : 0);
> +
> +=09return armoury_set_devstate(attr, kbd_state, NULL, ASUS_WMI_DEVID_TUF=
_RGB_STATE);
> +}
> +
> +enum asus_armoury_kbd_state_field {
> +=09ASUS_ARMOURY_KBD_STATE_BOOT,
> +=09ASUS_ARMOURY_KBD_STATE_AWAKE,
> +=09ASUS_ARMOURY_KBD_STATE_SLEEP,
> +=09ASUS_ARMOURY_KBD_STATE_SHUTDOWN,
> +};
> +
> +static ssize_t armoury_kbd_state_write(struct kobject *kobj, struct kobj=
_attribute *attr,
> +=09=09=09=09       const char *buf, size_t count,
> +=09=09=09=09       enum asus_armoury_kbd_state_field field)
> +{
> +=09ssize_t err;
> +=09bool enable;
> +=09struct asus_armoury_kbd_status kbd_status;

Reverse xmas-tree order.

> +
> +=09err =3D kstrtobool(buf, &enable);
> +=09if (err)
> +=09=09return err;
> +
> +=09scoped_guard(mutex, &asus_armoury.keyboard_mutex) {
> +=09=09memcpy(&kbd_status, asus_armoury.kbd_state, sizeof(kbd_status));
> +
> +=09=09switch (field) {
> +=09=09case ASUS_ARMOURY_KBD_STATE_BOOT:
> +=09=09=09kbd_status.boot =3D enable;
> +=09=09=09break;
> +=09=09case ASUS_ARMOURY_KBD_STATE_AWAKE:
> +=09=09=09kbd_status.awake =3D enable;
> +=09=09=09break;
> +=09=09case ASUS_ARMOURY_KBD_STATE_SLEEP:
> +=09=09=09kbd_status.sleep =3D enable;
> +=09=09=09break;
> +=09=09case ASUS_ARMOURY_KBD_STATE_SHUTDOWN:
> +=09=09=09kbd_status.shutdown =3D enable;
> +=09=09=09break;
> +=09=09default:
> +=09=09=09return -EINVAL;
> +=09=09}
> +
> +=09=09err =3D armoury_kbd_state(attr, &kbd_status);
> +=09=09if (err)
> +=09=09=09return err;
> +
> +=09=09memcpy(asus_armoury.kbd_state, &kbd_status, sizeof(kbd_status));
> +=09}
> +
> +=09sysfs_notify(kobj, NULL, attr->attr.name);
> +
> +=09return count;
> +}
> +
> +static ssize_t armoury_kbd_state_read(struct kobject *kobj, struct kobj_=
attribute *attr,
> +=09=09=09=09      char *buf, enum asus_armoury_kbd_state_field field)
> +{
> +=09bool *field_ptr, field_enabled;
> +
> +=09switch (field) {
> +=09case ASUS_ARMOURY_KBD_STATE_AWAKE:
> +=09=09field_ptr =3D &asus_armoury.kbd_state->awake;
> +=09=09break;
> +=09case ASUS_ARMOURY_KBD_STATE_SLEEP:
> +=09=09field_ptr =3D &asus_armoury.kbd_state->sleep;
> +=09=09break;
> +=09case ASUS_ARMOURY_KBD_STATE_BOOT:
> +=09=09field_ptr =3D &asus_armoury.kbd_state->boot;
> +=09=09break;
> +=09case ASUS_ARMOURY_KBD_STATE_SHUTDOWN:
> +=09=09field_ptr =3D &asus_armoury.kbd_state->shutdown;
> +=09=09break;
> +=09default:
> +=09=09return -EINVAL;
> +=09}
> +
> +=09scoped_guard(mutex, &asus_armoury.keyboard_mutex)
> +=09=09field_enabled =3D *field_ptr;
> +
> +=09return sysfs_emit(buf, field_enabled ? "1\n" : "0\n");
> +}
> +
> +static ssize_t kbd_leds_sleep_current_value_store(struct kobject *kobj,
> +=09=09=09=09=09=09  struct kobj_attribute *attr,
> +=09=09=09=09=09=09  const char *buf, size_t count)
> +{
> +=09return armoury_kbd_state_write(kobj, attr, buf, count, ASUS_ARMOURY_K=
BD_STATE_SLEEP);
> +}
> +
> +static ssize_t kbd_leds_sleep_current_value_show(struct kobject *kobj,
> +=09=09=09=09=09=09 struct kobj_attribute *attr, char *buf)
> +{
> +=09return armoury_kbd_state_read(kobj, attr, buf, ASUS_ARMOURY_KBD_STATE=
_SLEEP);
> +}
> +
> +ASUS_ATTR_GROUP_BOOL(kbd_leds_sleep, "kbd_leds_sleep",
> +=09=09     "Keyboard backlight while system is sleeping");
> +
> +static ssize_t kbd_leds_boot_current_value_store(struct kobject *kobj,
> +=09=09=09=09=09=09 struct kobj_attribute *attr,
> +=09=09=09=09=09=09 const char *buf, size_t count)
> +{
> +=09return armoury_kbd_state_write(kobj, attr, buf, count, ASUS_ARMOURY_K=
BD_STATE_BOOT);
> +}
> +
> +static ssize_t kbd_leds_boot_current_value_show(struct kobject *kobj,
> +=09=09=09=09=09=09struct kobj_attribute *attr, char *buf)
> +{
> +=09return armoury_kbd_state_read(kobj, attr, buf, ASUS_ARMOURY_KBD_STATE=
_BOOT);
> +}
> +
> +ASUS_ATTR_GROUP_BOOL(kbd_leds_boot, "kbd_leds_boot",
> +=09=09     "Keyboard backlight while system is booting");
> +
> +static ssize_t kbd_leds_awake_current_value_store(struct kobject *kobj,
> +=09=09=09=09=09=09  struct kobj_attribute *attr,
> +=09=09=09=09=09=09  const char *buf, size_t count)
> +{
> +=09return armoury_kbd_state_write(kobj, attr, buf, count, ASUS_ARMOURY_K=
BD_STATE_AWAKE);
> +}
> +
> +static ssize_t kbd_leds_awake_current_value_show(struct kobject *kobj,
> +=09=09=09=09=09=09 struct kobj_attribute *attr, char *buf)
> +{
> +=09return armoury_kbd_state_read(kobj, attr, buf, ASUS_ARMOURY_KBD_STATE=
_AWAKE);
> +}
> +
> +ASUS_ATTR_GROUP_BOOL(kbd_leds_awake, "kbd_leds_awake",
> +=09=09     "Keyboard backlight while system is awake");
> +
> +static ssize_t kbd_leds_shutdown_current_value_store(struct kobject *kob=
j,
> +=09=09=09=09=09=09     struct kobj_attribute *attr,
> +=09=09=09=09=09=09     const char *buf, size_t count)
> +{
> +=09return armoury_kbd_state_write(kobj, attr, buf, count, ASUS_ARMOURY_K=
BD_STATE_SHUTDOWN);
> +}
> +
> +static ssize_t kbd_leds_shutdown_current_value_show(struct kobject *kobj=
,
> +=09=09=09=09=09=09    struct kobj_attribute *attr, char *buf)
> +{
> +=09return armoury_kbd_state_read(kobj, attr, buf, ASUS_ARMOURY_KBD_STATE=
_SHUTDOWN);
> +}
> +
> +ASUS_ATTR_GROUP_BOOL(kbd_leds_shutdown, "kbd_leds_shutdown",
> +=09=09     "Keyboard backlight while system is shutdown");
> +
>  static ssize_t gpu_mux_mode_current_value_store(struct kobject *kobj,
>  =09=09=09=09=09=09struct kobj_attribute *attr,
>  =09=09=09=09=09=09const char *buf, size_t count)
> @@ -867,6 +1037,32 @@ static bool has_valid_limit(const char *name, const=
 struct power_limits *limits)
>  =09return limit_value > 0;
>  }
> =20
> +static struct asus_armoury_kbd_status *asus_init_kbd_state(void)
> +{
> +=09int err;
> +=09u32 kbd_status;

Reverse xmas-tree order.

> +
> +=09err =3D armoury_get_devstate(NULL, &kbd_status, ASUS_WMI_DEVID_TUF_RG=
B_STATE);
> +=09if (err) {
> +=09=09pr_debug("ACPI does not support keyboard power control: %d\n", err=
);
> +=09=09return ERR_PTR(-ENODEV);
> +=09}
> +
> +=09struct asus_armoury_kbd_status *kbd_state __free(kfree) =3D
> +=09=09kzalloc(sizeof(*kbd_state), GFP_KERNEL);
> +=09if (!kbd_state)
> +=09=09return ERR_PTR(-ENODEV);
> +
> +=09/*
> +=09 * By default leds are off for all states (to spare power)
> +=09 * except for when laptop is awake, where leds color and
> +=09 * brightness are controllable by userspace.
> +=09 */
> +=09kbd_state->awake =3D true;
> +
> +=09return_ptr(kbd_state);
> +}
> +
>  static int asus_fw_attr_add(void)
>  {
>  =09const struct rog_tunables *const ac_rog_tunables =3D
> @@ -955,8 +1151,64 @@ static int asus_fw_attr_add(void)
>  =09=09}
>  =09}
> =20
> +=09asus_armoury.kbd_state =3D NULL;
> +=09if (armoury_has_devstate(ASUS_WMI_DEVID_TUF_RGB_STATE)) {
> +=09=09asus_armoury.kbd_state =3D asus_init_kbd_state();
> +=09=09if (IS_ERR(asus_armoury.kbd_state)) {
> +=09=09=09asus_armoury.kbd_state =3D NULL;
> +=09=09=09err =3D PTR_ERR(asus_armoury.kbd_state);
> +=09=09=09pr_err("Failed to get keyboard status: %d\n", err);
> +=09=09=09goto err_remove_groups;
> +=09=09}
> +
> +=09=09err =3D sysfs_create_group(&asus_armoury.fw_attr_kset->kobj, &kbd_=
leds_sleep_attr_group);
> +=09=09if (err) {
> +=09=09=09pr_err("Failed to create sysfs-group for keyboard backlight sle=
ep state: %d\n", err);
> +=09=09=09goto err_kbd_state;
> +=09=09}
> +
> +=09=09err =3D sysfs_create_group(&asus_armoury.fw_attr_kset->kobj, &kbd_=
leds_boot_attr_group);
> +=09=09if (err) {
> +=09=09=09pr_err("Failed to create sysfs-group for keyboard backlight boo=
t state: %d\n", err);
> +=09=09=09goto err_remove_kbd_sleep_attr;
> +=09=09}
> +
> +=09=09err =3D sysfs_create_group(&asus_armoury.fw_attr_kset->kobj, &kbd_=
leds_awake_attr_group);
> +=09=09if (err) {
> +=09=09=09pr_err("Failed to create sysfs-group for keyboard backlight awa=
ke state: %d\n", err);
> +=09=09=09goto err_remove_kbd_boot_attr;
> +=09=09}
> +
> +=09=09err =3D sysfs_create_group(&asus_armoury.fw_attr_kset->kobj, &kbd_=
leds_shutdown_attr_group);
> +=09=09if (err) {
> +=09=09=09pr_err("Failed to create sysfs-group for keyboard backlight shu=
tdown state: %d\n", err);
> +=09=09=09goto err_remove_kbd_awake_attr;
> +=09=09}
> +
> +=09=09/*
> +=09=09 * The attribute is write-only and for the state to be coherent
> +=09=09 * a default state has to written: userspace is expected to
> +=09=09 * modify it based on user preference.
> +=09=09 */
> +=09=09err =3D armoury_kbd_state(&attr_kbd_leds_awake_current_value, asus=
_armoury.kbd_state);
> +=09=09if (err) {
> +=09=09=09pr_err("Failed to initialize keyboard backlight states: %d\n", =
err);
> +=09=09=09goto err_remove_kbd_shutdown_attr;
> +=09=09}
> +=09}
> +
>  =09return 0;
> =20
> +err_remove_kbd_shutdown_attr:
> +=09sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &kbd_leds_shutdo=
wn_attr_group);
> +err_remove_kbd_awake_attr:
> +=09sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &kbd_leds_awake_=
attr_group);
> +err_remove_kbd_boot_attr:
> +=09sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &kbd_leds_boot_a=
ttr_group);
> +err_remove_kbd_sleep_attr:
> +=09sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &kbd_leds_sleep_=
attr_group);
> +err_kbd_state:
> +=09kfree(asus_armoury.kbd_state);
>  err_remove_groups:
>  =09while (i--) {
>  =09=09if (armoury_has_devstate(armoury_attr_groups[i].wmi_devid))
> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/p=
latform_data/x86/asus-wmi.h
> index 419491d4abca..1373d5056ed0 100644
> --- a/include/linux/platform_data/x86/asus-wmi.h
> +++ b/include/linux/platform_data/x86/asus-wmi.h
> @@ -153,6 +153,23 @@
>  /* TUF laptop RGB power/state */
>  #define ASUS_WMI_DEVID_TUF_RGB_STATE=090x00100057
> =20
> +#define ASUS_WMI_DEVID_TUF_RGB_STATE_EN 0xBD
> +
> +#define ASUS_WMI_DEVID_TUF_RGB_STATE_CMD (BIT(2) << 8)

That shift by 8 should go inside BIT() so it's BIT(10).

> +/*
> + * Flags for TUF RGB state to be used with ASUS_WMI_DEVID_TUF_RGB_STATE:
> + * flags | ASUS_WMI_DEVID_TUF_RGB_STATE_CMD | ASUS_WMI_DEVID_TUF_RGB_STA=
TE_EN
> + *
> + * where ASUS_WMI_DEVID_TUF_RGB_STATE_EN is required for the method call
> + * to not be discarded, ASUS_WMI_DEVID_TUF_RGB_STATE_EN specifies this i=
s
> + * a command and flags is a combination of one or more of the following =
flags.
> + */
> +#define ASUS_WMI_DEVID_TUF_RGB_STATE_MASK_BOOT=09=09GENMASK(17, 17)
> +#define ASUS_WMI_DEVID_TUF_RGB_STATE_MASK_AWAKE=09=09GENMASK(19, 19)
> +#define ASUS_WMI_DEVID_TUF_RGB_STATE_MASK_SLEEP=09=09GENMASK(21, 21)
> +#define ASUS_WMI_DEVID_TUF_RGB_STATE_MASK_SHUTDOWN=09GENMASK(23, 23)

"MASK" can be removed the name as these are really single bits (and it's=20
often pretty unnecessary anyway making only lines longer).

And GENMASK(x,  x) can use BIT(x). You also have to add an include to use=
=20
either.

--=20
 i.

--8323328-138076391-1767266616=:1003--
