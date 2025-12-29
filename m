Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11CEC26FD97;
	Mon, 29 Dec 2025 10:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767003889; cv=none; b=lbE0wEYWyfmRlu2iBb1dFr0j9B836347VMqOSN5bTqpeBm/+XnlnmlN5ROFYX+QcB4GMi/d0QTRHQO2ufgJYARgip6oydDuV5PzAwcGw7sJtzRJWe0OuciC/JzGW7nUvNWH2rVkPk0qqPAkZAQGi/K3eigPdgXbldiyGwVRFH5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767003889; c=relaxed/simple;
	bh=BmVGkfm5QELZHH0mxmOXvErPjLwmlnyDGICgLi5+FO0=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=qzvJhe8E2eVail6Hk61D7NqKm5RGZVw+ET/vdoGVRbJetZ9soCqEZ/CD0YqTWzbzRDC2mPZUaMWh1/s8L7mEByhy5ZdKnv5xIFVeMxDN4Kq9hH57xw8CakqOJ+uQsVv60JJhkvGwx3KzFK6yQGTNw1yQxngR9/WTOJkTi95+fjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mQzC8ntR; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mQzC8ntR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767003886; x=1798539886;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=BmVGkfm5QELZHH0mxmOXvErPjLwmlnyDGICgLi5+FO0=;
  b=mQzC8ntRLPc/8vBoFejqofBrpURkTpjNHExfE5TFyi8hcemIW4gF00KV
   n4G2fyP6sstH8r7uzWsuFO8bUHA0f6vfCCrODvPDkEGbzygGn/OzH8SAo
   xpROIPNTnp0w7NnxBmfK+QSzLX3+81tbhwHW02q88iVuKIRN3ryCWGxaW
   xkuYrzMia0rQ2W4w5WgbC67923CXeGECeiyO/6zLOJI7ukuBeUFId9jhk
   evX6JuotvxhP2OVotI5YLHAdYVCd61/RX1xhgVvm1ioaOZyT8QEGyVinu
   O/D3Q7raBMAfiDbUvsHtdlxJjqrxijCYgdFfsYeWvE6xmKLev2PssSqB3
   w==;
X-CSE-ConnectionGUID: mXnX4a4ERsaJr8zrD6+XYg==
X-CSE-MsgGUID: kerznMIsS6+upi8hSC4xvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11655"; a="80066618"
X-IronPort-AV: E=Sophos;i="6.21,185,1763452800"; 
   d="scan'208";a="80066618"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 02:24:45 -0800
X-CSE-ConnectionGUID: 37s26er0T1+R691CeRcG8A==
X-CSE-MsgGUID: M7nu0kUESkWTQk3I41z5YQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,185,1763452800"; 
   d="scan'208";a="200018384"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.30])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 02:24:42 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 29 Dec 2025 12:24:39 +0200 (EET)
To: Denis Benato <denis.benato@linux.dev>
cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, 
    Hans de Goede <hansg@kernel.org>, "Luke D . Jones" <luke@ljones.dev>, 
    Mateusz Schyboll <dragonn@op.pl>, Denis Benato <benato.denis96@gmail.com>
Subject: Re: [PATCH 3/3] platform/x86: asus-armoury: add keyboard control
 firmware attributes
In-Reply-To: <20251225143007.2684239-4-denis.benato@linux.dev>
Message-ID: <8d082896-116a-878d-e5dc-5df07feca377@linux.intel.com>
References: <20251225143007.2684239-1-denis.benato@linux.dev> <20251225143007.2684239-4-denis.benato@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 25 Dec 2025, Denis Benato wrote:

> Implement keyboard status attributes in asus-armoury after
> deprecating those attribute(s) in asus-wmi to avoid losing
> the ability to control LEDs status.
> 
> Signed-off-by: Denis Benato <benato.denis96@gmail.com>
> ---
>  drivers/platform/x86/asus-armoury.c        | 258 +++++++++++++++++++++
>  include/linux/platform_data/x86/asus-wmi.h |  15 ++
>  2 files changed, 273 insertions(+)
> 
> diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
> index 9c1a9ad42bc4..a37713854691 100644
> --- a/drivers/platform/x86/asus-armoury.c
> +++ b/drivers/platform/x86/asus-armoury.c
> @@ -76,10 +76,22 @@ struct rog_tunables {
>  	u32 nv_tgp;
>  };
>  
> +struct asus_armoury_kbd_status {
> +	bool boot;
> +	bool awake;
> +	bool sleep;
> +	bool shutdown;
> +};
> +
>  struct asus_armoury_priv {
>  	struct device *fw_attr_dev;
>  	struct kset *fw_attr_kset;
>  
> +	struct mutex keyboard_mutex;
> +
> +	/* Current TUF keyboard RGB state tracking */
> +	struct asus_armoury_kbd_status *kbd_state;
> +
>  	/*
>  	 * Mutex to protect eGPU activation/deactivation
>  	 * sequences and dGPU connection status:
> @@ -97,6 +109,7 @@ struct asus_armoury_priv {
>  
>  static struct asus_armoury_priv asus_armoury = {
>  	.egpu_mutex = __MUTEX_INITIALIZER(asus_armoury.egpu_mutex),
> +	.keyboard_mutex = __MUTEX_INITIALIZER(asus_armoury.keyboard_mutex),
>  };
>  
>  struct fw_attrs_group {
> @@ -433,6 +446,169 @@ static ssize_t mini_led_mode_possible_values_show(struct kobject *kobj,
>  }
>  ASUS_ATTR_GROUP_ENUM(mini_led_mode, "mini_led_mode", "Set the mini-LED backlight mode");
>  
> +/* Keyboard power management **************************************************/
> +
> +static int armoury_kbd_state(struct kobj_attribute *attr,
> +			     const struct asus_armoury_kbd_status *status)
> +{
> +	u32 kbd_state = 0xBD | BIT(2) << 8;
> +
> +	if (status->boot)
> +		kbd_state |= BIT(1) << 16;
> +	if (status->awake)
> +		kbd_state |= BIT(3) << 16;
> +	if (status->sleep)
> +		kbd_state |= BIT(5) << 16;
> +	if (status->shutdown)
> +		kbd_state |= BIT(7) << 16;

Add the fields with define + GENMASK()

Name the bits within the fields with defines.

Use FIELD_PREP() here instead of open-coding the shifting.

Hmm (returning to add text after reading all the way to the bottom of 
the patch), you seem to already have defines for these but are using 
literals here??

> +
> +	return armoury_set_devstate(attr, kbd_state, NULL,
> +				    ASUS_WMI_DEVID_TUF_RGB_STATE);
> +}
> +
> +enum asus_armoury_kbd_state_field {
> +	ASUS_ARMOURY_KBD_STATE_BOOT,
> +	ASUS_ARMOURY_KBD_STATE_AWAKE,
> +	ASUS_ARMOURY_KBD_STATE_SLEEP,
> +	ASUS_ARMOURY_KBD_STATE_SHUTDOWN,
> +};
> +
> +static ssize_t armoury_kbd_state_write(struct kobject *kobj, struct kobj_attribute *attr,
> +				       const char *buf, size_t count,
> +				       enum asus_armoury_kbd_state_field field)
> +{
> +	ssize_t err;
> +	bool enable;
> +	struct asus_armoury_kbd_status kbd_status;
> +
> +	err = kstrtobool(buf, &enable);
> +	if (err)
> +		return err;
> +
> +	scoped_guard(mutex, &asus_armoury.keyboard_mutex) {
> +		memcpy(&kbd_status, asus_armoury.kbd_state, sizeof(kbd_status));
> +
> +		switch (field) {
> +		case ASUS_ARMOURY_KBD_STATE_BOOT:
> +			kbd_status.boot = enable;
> +			break;
> +		case ASUS_ARMOURY_KBD_STATE_AWAKE:
> +			kbd_status.awake = enable;
> +			break;
> +		case ASUS_ARMOURY_KBD_STATE_SLEEP:
> +			kbd_status.sleep = enable;
> +			break;
> +		case ASUS_ARMOURY_KBD_STATE_SHUTDOWN:
> +			kbd_status.shutdown = enable;
> +			break;
> +		default:
> +			return -EINVAL;
> +		}
> +
> +		err = armoury_kbd_state(attr, &kbd_status);
> +		if (err)
> +			return err;
> +
> +		memcpy(asus_armoury.kbd_state, &kbd_status, sizeof(kbd_status));
> +	}
> +
> +	sysfs_notify(kobj, NULL, attr->attr.name);
> +
> +	return count;
> +}
> +
> +static ssize_t armoury_kbd_state_read(struct kobject *kobj, struct kobj_attribute *attr,
> +				      char *buf, enum asus_armoury_kbd_state_field field)
> +{
> +	bool *field_ptr, field_enabled;
> +
> +	switch (field) {
> +	case ASUS_ARMOURY_KBD_STATE_AWAKE:
> +		field_ptr = &asus_armoury.kbd_state->awake;
> +		break;
> +	case ASUS_ARMOURY_KBD_STATE_SLEEP:
> +		field_ptr = &asus_armoury.kbd_state->sleep;
> +		break;
> +	case ASUS_ARMOURY_KBD_STATE_BOOT:
> +		field_ptr = &asus_armoury.kbd_state->boot;
> +		break;
> +	case ASUS_ARMOURY_KBD_STATE_SHUTDOWN:
> +		field_ptr = &asus_armoury.kbd_state->shutdown;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	scoped_guard(mutex, &asus_armoury.keyboard_mutex)
> +		field_enabled = *field_ptr;
> +
> +	return sysfs_emit(buf, field_enabled ? "1\n" : "0\n");
> +}
> +
> +static ssize_t kbd_leds_sleep_current_value_store(struct kobject *kobj,
> +						  struct kobj_attribute *attr,
> +						  const char *buf, size_t count)
> +{
> +	return armoury_kbd_state_write(kobj, attr, buf, count, ASUS_ARMOURY_KBD_STATE_SLEEP);
> +}
> +
> +static ssize_t kbd_leds_sleep_current_value_show(struct kobject *kobj,
> +						 struct kobj_attribute *attr, char *buf)
> +{
> +	return armoury_kbd_state_read(kobj, attr, buf, ASUS_ARMOURY_KBD_STATE_SLEEP);
> +}
> +
> +ASUS_ATTR_GROUP_BOOL(kbd_leds_sleep, "kbd_leds_sleep",
> +		     "Keyboard backlight while system is sleeping");
> +
> +static ssize_t kbd_leds_boot_current_value_store(struct kobject *kobj,
> +						 struct kobj_attribute *attr,
> +						 const char *buf, size_t count)
> +{
> +	return armoury_kbd_state_write(kobj, attr, buf, count, ASUS_ARMOURY_KBD_STATE_BOOT);
> +}
> +
> +static ssize_t kbd_leds_boot_current_value_show(struct kobject *kobj,
> +						struct kobj_attribute *attr, char *buf)
> +{
> +	return armoury_kbd_state_read(kobj, attr, buf, ASUS_ARMOURY_KBD_STATE_BOOT);
> +}
> +
> +ASUS_ATTR_GROUP_BOOL(kbd_leds_boot, "kbd_leds_boot",
> +		     "Keyboard backlight while system is booting");
> +
> +static ssize_t kbd_leds_awake_current_value_store(struct kobject *kobj,
> +						  struct kobj_attribute *attr,
> +						  const char *buf, size_t count)
> +{
> +	return armoury_kbd_state_write(kobj, attr, buf, count, ASUS_ARMOURY_KBD_STATE_AWAKE);
> +}
> +
> +static ssize_t kbd_leds_awake_current_value_show(struct kobject *kobj,
> +						 struct kobj_attribute *attr, char *buf)
> +{
> +	return armoury_kbd_state_read(kobj, attr, buf, ASUS_ARMOURY_KBD_STATE_AWAKE);
> +}
> +
> +ASUS_ATTR_GROUP_BOOL(kbd_leds_awake, "kbd_leds_awake",
> +		     "Keyboard backlight while system is awake");
> +
> +static ssize_t kbd_leds_shutdown_current_value_store(struct kobject *kobj,
> +						     struct kobj_attribute *attr,
> +						     const char *buf, size_t count)
> +{
> +	return armoury_kbd_state_write(kobj, attr, buf, count, ASUS_ARMOURY_KBD_STATE_SHUTDOWN);
> +}
> +
> +static ssize_t kbd_leds_shutdown_current_value_show(struct kobject *kobj,
> +						    struct kobj_attribute *attr, char *buf)
> +{
> +	return armoury_kbd_state_read(kobj, attr, buf, ASUS_ARMOURY_KBD_STATE_SHUTDOWN);
> +}
> +
> +ASUS_ATTR_GROUP_BOOL(kbd_leds_shutdown, "kbd_leds_shutdown",
> +		     "Keyboard backlight while system is shutdown");
> +
>  static ssize_t gpu_mux_mode_current_value_store(struct kobject *kobj,
>  						struct kobj_attribute *attr,
>  						const char *buf, size_t count)
> @@ -867,6 +1043,35 @@ static bool has_valid_limit(const char *name, const struct power_limits *limits)
>  	return limit_value > 0;
>  }
>  
> +static struct asus_armoury_kbd_status *asus_init_kbd_state(void)
> +{
> +	int err;
> +	u32 kbd_status;
> +	struct asus_armoury_kbd_status *kbd_state __free(kfree) = NULL;
> +
> +	err = armoury_get_devstate(NULL, &kbd_status, ASUS_WMI_DEVID_TUF_RGB_STATE);
> +	if (err) {
> +		pr_err("ACPI does not support keyboard power control: %d\n", err);
> +		return ERR_PTR(-ENODEV);
> +	}
> +
> +	pr_info("Detected keyboard backlight support\n");
> +
> +	kbd_state = kzalloc(sizeof(*kbd_state), GFP_KERNEL);
> +	if (!kbd_state)
> +		return ERR_PTR(-ENODEV);
> +
> +	/*
> +	 * By default leds are off for all states (to spare power)
> +	 * except for when laptop is awake, where leds color and
> +	 * brightness are controllable by userspace.
> +	 */
> +	memset(kbd_state, 0, sizeof(*kbd_state));

Didn't you just alloc this with kzalloc()???

> +	kbd_state->awake = true;
> +
> +	return no_free_ptr(kbd_state);
> +}
> +
>  static int asus_fw_attr_add(void)
>  {
>  	const struct rog_tunables *const ac_rog_tunables =
> @@ -926,6 +1131,51 @@ static int asus_fw_attr_add(void)
>  		}
>  	}
>  
> +	asus_armoury.kbd_state = NULL;
> +	if (armoury_has_devstate(ASUS_WMI_DEVID_TUF_RGB_STATE)) {
> +		asus_armoury.kbd_state = asus_init_kbd_state();
> +		if (IS_ERR(asus_armoury.kbd_state)) {
> +			err = PTR_ERR(asus_armoury.kbd_state);
> +			pr_err("Failed to get keyboard status: %d\n", err);
> +			goto err_remove_kbd_state;
> +		}
> +
> +		err = sysfs_create_group(&asus_armoury.fw_attr_kset->kobj, &kbd_leds_sleep_attr_group);
> +		if (err) {
> +			pr_err("Failed to create sysfs-group for keyboard backlight sleep state: %d\n", err);
> +			goto err_remove_kbd_state;
> +		}
> +
> +		err = sysfs_create_group(&asus_armoury.fw_attr_kset->kobj, &kbd_leds_boot_attr_group);
> +		if (err) {
> +			pr_err("Failed to create sysfs-group for keyboard backlight boot state: %d\n", err);
> +			goto err_remove_kbd_state;
> +		}
> +
> +		err = sysfs_create_group(&asus_armoury.fw_attr_kset->kobj, &kbd_leds_awake_attr_group);
> +		if (err) {
> +			pr_err("Failed to create sysfs-group for keyboard backlight awake state: %d\n", err);
> +			goto err_remove_kbd_state;
> +		}
> +
> +		err = sysfs_create_group(&asus_armoury.fw_attr_kset->kobj, &kbd_leds_shutdown_attr_group);
> +		if (err) {
> +			pr_err("Failed to create sysfs-group for keyboard backlight shutdown state: %d\n", err);
> +			goto err_remove_kbd_state;
> +		}
> +
> +		/*
> +		 * The attribute is write-only and for the state to be coherent
> +		 * a default state has to written: userspace is expected to
> +		 * modify it based on user preference.
> +		 */
> +		err = armoury_kbd_state(&attr_kbd_leds_awake_current_value, asus_armoury.kbd_state);
> +		if (err) {
> +			pr_err("Failed to initialize keyboard backlight states: %d\n", err);
> +			goto err_remove_kbd_state;
> +		}
> +	}
> +
>  	for (i = 0; i < ARRAY_SIZE(armoury_attr_groups); i++) {
>  		if (!armoury_has_devstate(armoury_attr_groups[i].wmi_devid))
>  			continue;
> @@ -965,6 +1215,14 @@ static int asus_fw_attr_add(void)
>  	}
>  	if (asus_armoury.gpu_mux_dev_id)
>  		sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &gpu_mux_mode_attr_group);
> +err_remove_kbd_state:
> +	kfree(asus_armoury.kbd_state);
> +	if (asus_armoury.kbd_state) {

This looks like a logic bug, as IS_ERR() implies != 0.

> +		sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &kbd_leds_sleep_attr_group);
> +		sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &kbd_leds_boot_attr_group);
> +		sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &kbd_leds_awake_attr_group);
> +		sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &kbd_leds_shutdown_attr_group);

Is it fine to make these calls if one of the sysfs_create_group() failed?

> +	}

Why you do this in this order? In general, the teardown order should be a 
reverse of the order on the init side.

>  err_remove_mini_led_group:
>  	if (asus_armoury.mini_led_dev_id)
>  		sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &mini_led_mode_attr_group);
> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
> index 419491d4abca..6667b3b474c2 100644
> --- a/include/linux/platform_data/x86/asus-wmi.h
> +++ b/include/linux/platform_data/x86/asus-wmi.h
> @@ -153,6 +153,21 @@
>  /* TUF laptop RGB power/state */
>  #define ASUS_WMI_DEVID_TUF_RGB_STATE	0x00100057
>  
> +/*
> + * Flags for TUF RGB state to be used with
> + * ASUS_WMI_DEVID_TUF_RGB_STATE:
> + * 0xBD | BIT(1) << 8 | flags

Would this be more logical ordering:

* flags | BIT(1) << 8 | 0xBD

?

(With the current ordering, I assumed BD is the most highest bits due to 
the way we write numbers).

> + *
> + * where 0xBD is required for the method call
> + * to not be discarded, BIT(2)<<8 specified

Spaces around <<

Name 0xBD, BIT(1) << 8 and BIT(2) << 8 with defines.

> + * this is a command and flags is a combination
> + * of one or more of the following flags.

Why is this using so short lines?

> + */
> +#define ASUS_WMI_DEVID_TUF_RGB_STATE_BOOT (BIT(1) << 16u)

Add flags field define & use FIELD_PREP() as already mentioned with the 
relevant code.

And please use these in the code too. :-)

> +#define ASUS_WMI_DEVID_TUF_RGB_STATE_AWAKE (BIT(3) << 16u)
> +#define ASUS_WMI_DEVID_TUF_RGB_STATE_SLEEP (BIT(5) << 16u)
> +#define ASUS_WMI_DEVID_TUF_RGB_STATE_SHUTDOWN (BIT(7) << 16u)
> +
>  /* Bootup sound control */
>  #define ASUS_WMI_DEVID_BOOT_SOUND	0x00130022
>  
> 

-- 
 i.

