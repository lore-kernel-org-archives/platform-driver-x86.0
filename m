Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A821115EFB4
	for <platform-driver-x86@vger.kernel.org>; Mon,  1 Jul 2024 13:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719842208; cv=none; b=OG2/2qO5KJUfEYW5NI7DHciiZswqG/M/wK8VPLgLvC2JKk6CPd/VazSku4y9xVo0ibhVVooTNNRd3E5f/jeBP3R2G96LoM1Cq+FCD6K58EGlYbmYZkosJRq8NL2+IuPPyCss72uCTe1b/7ikgqNZvPBOZG9WZ0kyugJLLBDUc6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719842208; c=relaxed/simple;
	bh=KrOYCqB6So2KMiCv//XHFyiv+Ijg9/glQmibE6mDhuI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VLmdh08TiNVNeR+Z+uK3leHyDR8+xjX7RjQGnR6CgokDoZBjnUlULcWGjoYG/e+IxA0SODYBb/hH1nZtqzWog/7j/UV5is8rrP/1KME2A/pbEmFCr1lnF68BnjptpMlNw80pJNBP/APli/g5ZovuAcHBkhN4grUBYJqdzPkajgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=FnQUdeSC; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="FnQUdeSC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1719842197; x=1720446997; i=w_armin@gmx.de;
	bh=Uiii+gPZUtLNzEjSnxBukwjtQSGNNel79hjN7T25FrY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=FnQUdeSCMP+bHBEfVAYgZ7c4UQ4uRhNipheOc9gexQhDHbvmQHtuJR6pvgk75eiH
	 EoWgLKN5Gi8fk1OAAx/sLV5RbbCpPir1urwZA3PsGaBiMAwec8SPzHUliem5Bahxe
	 rPuHQX0td0bX/G2PNLLvfM3xnbeHIiw6dgeVP0dsanYQzH3tyjrpz4uUNqp41kiw8
	 vRIE8xkl0hdQgOw1mL+SXamFa6pSO62KAHH/vrRARIJ3OfLH87VKSGMD8x3z0BlkZ
	 tcnj/pGB40tFdqP64IZjPIuZU4DuHa9fG4qcgLLaP7okmipauQ8BnK1vslXzP+C45
	 ywSwfokiTWAcS+XphA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [141.30.226.129] ([141.30.226.129]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MGQnP-1sf0Vk3C8r-00GSIF; Mon, 01
 Jul 2024 15:56:37 +0200
Message-ID: <b881450d-7651-4adc-83aa-936668cc05ae@gmx.de>
Date: Mon, 1 Jul 2024 15:56:37 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv6] platform/x86: hp-wmi: Fix platform profile option
 switch bug on Omen and Victus laptops
To: Alexis Belmonte <alexbelm48@gmail.com>, ilpo.jarvinen@linux.intel.com,
 hdegoede@redhat.com
Cc: platform-driver-x86@vger.kernel.org
References: <Zn8nv0bAS4nVsowI@alexis-pc>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <Zn8nv0bAS4nVsowI@alexis-pc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:6V012pAX6YC7rWoqElWTPpZuDkBhfA02NgL9cvuLF55rgZC8Hi4
 xKXic6KraBrCdjLqa6i+zr/71pXgMV+ZwgaDDQHzTDRDTkYCHV2ew2r7BVZd3ZWIsEs7u8Q
 Xl78gqpZVEp1bzR3qNAwtfZmQ3LAtOzZbQLMlMZrXM0vpKvlkj0et9yDeEnknDLoMbe968r
 tcbns0y4331o8Mi9RnzpA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Gwc9O0W/MKQ=;EKMlkVUABFMO3U6GuGQS3Uoaufe
 /rOspp8rl+KjQdYl+szwWGqJ+IltOIEcPWXm9LOp4wX/edec3UHlqmqOctQ5arcTNCLZ9ajY9
 iXqaiF9ghpFGJh+Z/irN82cG5nWj3fNS0kz6GXpY29RP1coWmw+k8FwE2DBjbTxcpV2P0jfnd
 BTa2HpuYTcbewHMOLdDX0mbSxaf/rzhoF/bcgz5RE43wXznnFUldr9DKddQGzhQDFjXZFqANi
 2ZT1kt4JL85klOSLbyqKz+AfzOfYeNcArpRBFCygGaEI/5MqofSzfFePzoo77vYCtREuAaQAQ
 OuhaB6FAEXzKQnwOBiZTyDwPvAmmIG7wGfklwLeTBge0d2xtOdYZAbflcjXyJ2kZVYpIfzrKT
 IAy2NC2P1pjH4+kxrNuOBOHaxX5mZdw13iEG5G2FsFC2EOXvO7AO0tu+Amjo8Ue3voJeREfsA
 KhB8FlQ5fusdlyciXTSLECUfQnbfnh9IqO8q5YNueulYjZAKs9/mT+lDeSzEcbEgYVAIFOO55
 ZH4LauveaqKdp3+JyISklVJXZHBqTTee8ieBFKg1nH2aEcynx3MI/GZms1nKXXtgw7M9PQqWe
 DRky59zxSbLQkgmivTzqUxBWOMb9dq3IltRjY0LnfW9/sCAY15T4bDljCcIG+rHrrzb0eamwf
 mjQEJdETM7I3yw7EaIiJ/NPyClv/B3gEdwA+P+CfVxdfNOQghpTvNjYq738EnTScw15DK7szA
 jF6X3YebMOtAe+lB9zyBl583rbNI5AV8rfVCRSHkboORh5+ZZm5Gf0WM9yAbh4gE7+4/H5tVU
 YlXiEDGq8NVSJOCtr0asW/rQYyq+xtA6Kx9nxQ7kYlruE=

Am 28.06.24 um 23:14 schrieb Alexis Belmonte:

> Fix a platform profile option switch/getter bug on some Omen and Victus
> laptops dismissing userspace choice when selecting performance mode in
> inadequate conditions (e.g. by being disconnected from the AC power plug=
)
> by
>
>     -  hooking an ACPI notify handler through the
>        omen_register_powersource_notifier_handler method that listens to=
 AC
>        power source changes (plugging in/out the AC power plug)
>
>     -  keeping an intermediate active_platform_profile variable that is
>        set when userspace changes the platform profile setting
>
>     -  restoring the selected platform profile kept in
>        active_platform_profile when AC power is plugged back into the
>        laptop, unless if the user decided to alter the platform profile
>        mid-way
>
> This ensures that the driver follows the principles defined in the
> Platform Profile Selection page of the Kernel documentation on those kin=
d
> of laptops; which is to not "(...) let userspace know about any
> sub-optimal conditions which are impeding reaching the requested
> performance level".
>
> Since the Omen and Victus laptops share the same embedded controller
> system, the fix is applicable to both categories of laptops.
>
> This patch also provides improvements to how the driver sets/gets the
> platform profile through the embedded controller, by introducing
> intermediary functions to leverage code from platform_profile_omen_set a=
nd
> callers.
>
> Signed-off-by: Alexis Belmonte <alexbelm48@gmail.com>
> ---
> V1 -> V2: - Use register_acpi_notifier and unregister_acpi_notifier inst=
ead of
>              hooking straight through ACPI node \\_SB.ADP1
> V2 -> V3: - Rely on power_supply_is_system_supplied() instead of an EC-s=
pecific
>              field to determine if the laptop is plugged in
>            - Refactor omen_powersource_notify_handler to omen_powersourc=
e_event
>            - Refactor omen_powersource_register_notifier_handler to
>              omen_register_powersource_event_handler
>            - Use a mutex to protect the active_platform_profile variable=
 from
>              being altered while the handler is executed
> V3 -> V4: - Remove the unnecessary enum declaration remains from the ini=
tial
>              implementation
> V4 -> V5: - Drop unnecessary modifications from the patch
>            - Call platform_profile_omen_get in platform_profile_victus_g=
et to
>              avoid code duplication
>            - Give-up module initialization if we fail to register the AC=
PI
>              notifier handler
>            - Fix code style issues reported by checkpatch.pl --strict
>            - Add intermediary/helper platform_profile_omen_set_ec and
>              platform_profile_victus_set_ec functions to leverage code f=
rom
>              platform_profile_omen_set and callers, thus simplifying
>              omen_powersource_event
>            - Fix dead-lock when restoring active_platform_profile when t=
he AC
>              power is plugged back into the laptop
> V5 -> V6: - Drop unnecessary modifications from the patch
> ---
>   drivers/platform/x86/hp/hp-wmi.c | 230 +++++++++++++++++++++++++++++--
>   1 file changed, 219 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/=
hp-wmi.c
> index 5fa553023842..a2d1884fedbc 100644
> --- a/drivers/platform/x86/hp/hp-wmi.c
> +++ b/drivers/platform/x86/hp/hp-wmi.c
> @@ -24,6 +24,7 @@
>   #include <linux/platform_profile.h>
>   #include <linux/hwmon.h>
>   #include <linux/acpi.h>
> +#include <linux/power_supply.h>
>   #include <linux/rfkill.h>
>   #include <linux/string.h>
>   #include <linux/dmi.h>
> @@ -42,6 +43,8 @@ MODULE_ALIAS("wmi:5FB7F034-2C63-45E9-BE91-3D44E2C707E4=
");
>   #define HP_OMEN_EC_THERMAL_PROFILE_TIMER_OFFSET 0x63
>   #define HP_OMEN_EC_THERMAL_PROFILE_OFFSET 0x95
>
> +#define ACPI_AC_CLASS "ac_adapter"
> +
>   #define zero_if_sup(tmp) (zero_insize_support?0:sizeof(tmp)) // use wh=
en zero insize is required
>
>   /* DMI board names of devices that should use the omen specific path f=
or
> @@ -259,10 +262,18 @@ static const struct key_entry hp_wmi_keymap[] =3D =
{
>   	{ KE_END, 0 }
>   };
>
> +/*
> + * Mutex for the active_platform_profile variable,
> + * see omen_powersource_event.
> + */
> +DEFINE_MUTEX(active_platform_profile_lock);
> +
>   static struct input_dev *hp_wmi_input_dev;
>   static struct input_dev *camera_shutter_input_dev;
>   static struct platform_device *hp_wmi_platform_dev;
>   static struct platform_profile_handler platform_profile_handler;
> +static struct notifier_block platform_power_source_nb;
> +static enum platform_profile_option active_platform_profile;
>   static bool platform_profile_support;
>   static bool zero_insize_support;
>
> @@ -1194,8 +1205,7 @@ static int __init hp_wmi_rfkill2_setup(struct plat=
form_device *device)
>   	return err;
>   }
>
> -static int platform_profile_omen_get(struct platform_profile_handler *p=
prof,
> -				     enum platform_profile_option *profile)
> +static int platform_profile_omen_get_ec(enum platform_profile_option *p=
rofile)
>   {
>   	int tp;
>
> @@ -1223,6 +1233,30 @@ static int platform_profile_omen_get(struct platf=
orm_profile_handler *pprof,
>   	return 0;
>   }
>
> +static int platform_profile_omen_get(struct platform_profile_handler *p=
prof,
> +				     enum platform_profile_option *profile)
> +{
> +	enum platform_profile_option selected_platform_profile;
> +
> +	/*
> +	 * We directly return the stored platform profile, as the embedded
> +	 * controller will not accept switching to the performance option when
> +	 * the conditions are not met (e.g. the laptop is not plugged in).
> +	 *
> +	 * If we directly return what the EC reports, the platform profile wil=
l
> +	 * immediately "switch back" to normal mode, which is against the
> +	 * expected behaviour from a userspace point of view, as described in
> +	 * the Platform Profile Section page of the kernel documentation.
> +	 *
> +	 * See also omen_powersource_event.
> +	 */
> +	mutex_lock(&active_platform_profile_lock);
> +	selected_platform_profile =3D active_platform_profile;
> +	mutex_unlock(&active_platform_profile_lock);
> +
> +	return selected_platform_profile;
> +}
> +
>   static bool has_omen_thermal_profile_ec_timer(void)
>   {
>   	const char *board_name =3D dmi_get_system_info(DMI_BOARD_NAME);
> @@ -1245,8 +1279,7 @@ inline int omen_thermal_profile_ec_timer_set(u8 va=
lue)
>   	return ec_write(HP_OMEN_EC_THERMAL_PROFILE_TIMER_OFFSET, value);
>   }
>
> -static int platform_profile_omen_set(struct platform_profile_handler *p=
prof,
> -				     enum platform_profile_option profile)
> +static int platform_profile_omen_set_ec(enum platform_profile_option *p=
rofile)
>   {
>   	int err, tp, tp_version;
>   	enum hp_thermal_profile_omen_flags flags =3D 0;
> @@ -1256,7 +1289,7 @@ static int platform_profile_omen_set(struct platfo=
rm_profile_handler *pprof,
>   	if (tp_version < 0 || tp_version > 1)
>   		return -EOPNOTSUPP;
>
> -	switch (profile) {
> +	switch (*profile) {
>   	case PLATFORM_PROFILE_PERFORMANCE:
>   		if (tp_version =3D=3D 0)
>   			tp =3D HP_OMEN_V0_THERMAL_PROFILE_PERFORMANCE;
> @@ -1288,7 +1321,7 @@ static int platform_profile_omen_set(struct platfo=
rm_profile_handler *pprof,
>   		if (err < 0)
>   			return err;
>
> -		if (profile =3D=3D PLATFORM_PROFILE_PERFORMANCE)
> +		if (*profile =3D=3D PLATFORM_PROFILE_PERFORMANCE)
>   			flags =3D HP_OMEN_EC_FLAGS_NOTIMER |
>   				HP_OMEN_EC_FLAGS_TURBO;
>
> @@ -1297,6 +1330,29 @@ static int platform_profile_omen_set(struct platf=
orm_profile_handler *pprof,
>   			return err;
>   	}
>
> +	/*
> +	 * Immediately read back the profile to let the callee know about the
> +	 * currently reported EC platform profile
> +	 */
> +	return platform_profile_omen_get_ec(profile);
> +}

Hi,

i think this will lead to problems since you said that the EC immediately =
switches back to a lower power mode
when not on AC power. Remember that platform_profile_omen_set() overwrites=
 the value of active_platform_profile
with the value of *profile, so this would cause the power supply event han=
dler to do nothing since the condition
active_platform_profile !=3D actual_profile will never be true.

Just drop this read-back feature please.

> +
> +static int platform_profile_omen_set(struct platform_profile_handler *p=
prof,
> +				     enum platform_profile_option profile)
> +{
> +	int err;
> +
> +	mutex_lock(&active_platform_profile_lock);
> +
> +	err =3D platform_profile_omen_set_ec(&profile);
> +	if (err < 0) {
> +		mutex_unlock(&active_platform_profile_lock);
> +		return err;
> +	}
> +
> +	active_platform_profile =3D profile;
> +	mutex_unlock(&active_platform_profile_lock);
> +
>   	return 0;
>   }
>
> @@ -1381,8 +1437,7 @@ static bool is_victus_thermal_profile(void)
>   			    board_name) >=3D 0;
>   }
>
> -static int platform_profile_victus_get(struct platform_profile_handler =
*pprof,
> -				     enum platform_profile_option *profile)
> +static int platform_profile_victus_get_ec(enum platform_profile_option =
*profile)
>   {
>   	int tp;
>
> @@ -1407,12 +1462,18 @@ static int platform_profile_victus_get(struct pl=
atform_profile_handler *pprof,
>   	return 0;
>   }
>
> -static int platform_profile_victus_set(struct platform_profile_handler =
*pprof,
> -				     enum platform_profile_option profile)
> +static int platform_profile_victus_get(struct platform_profile_handler =
*pprof,
> +				       enum platform_profile_option *profile)
> +{
> +	/* Same behaviour as platform_profile_omen_get */
> +	return platform_profile_omen_get(pprof, profile);
> +}
> +
> +static int platform_profile_victus_set_ec(enum platform_profile_option =
*profile)
>   {
>   	int err, tp;
>
> -	switch (profile) {
> +	switch (*profile) {
>   	case PLATFORM_PROFILE_PERFORMANCE:
>   		tp =3D HP_VICTUS_THERMAL_PROFILE_PERFORMANCE;
>   		break;
> @@ -1430,9 +1491,138 @@ static int platform_profile_victus_set(struct pl=
atform_profile_handler *pprof,
>   	if (err < 0)
>   		return err;
>
> +	/*
> +	 * Immediately read back the profile to let the callee know about the
> +	 * currently reported EC platform profile
> +	 */
> +	return platform_profile_victus_get_ec(profile);

Same as above

> +}
> +
> +static int platform_profile_victus_set(struct platform_profile_handler =
*pprof,
> +				       enum platform_profile_option profile)
> +{
> +	int err;
> +
> +	mutex_lock(&active_platform_profile_lock);
> +
> +	err =3D platform_profile_victus_set_ec(&profile);
> +	if (err < 0) {
> +		mutex_unlock(&active_platform_profile_lock);
> +		return err;
> +	}
> +
> +	active_platform_profile =3D profile;
> +	mutex_unlock(&active_platform_profile_lock);
> +
>   	return 0;
>   }
>
> +static int omen_powersource_event(struct notifier_block *nb,
> +				  unsigned long value,
> +				  void *data)
> +{
> +	struct acpi_bus_event *event_entry =3D data;
> +	enum platform_profile_option actual_profile;
> +	int err;
> +
> +	if (strcmp(event_entry->device_class, ACPI_AC_CLASS) !=3D 0)
> +		return NOTIFY_DONE;
> +
> +	pr_debug("Received power source device event\n");
> +
> +	/*
> +	 * We don't want the handler to overwrite the newly set platform
> +	 * profile if the user has changed it in the meantime (thanks Armin!)
> +	 */
> +	if (!mutex_trylock(&active_platform_profile_lock))
> +		return NOTIFY_DONE;

Please drop this and instead lock the mutex unconditionally.

> +
> +	if (is_omen_thermal_profile()) {
> +		err =3D platform_profile_omen_get_ec(&actual_profile);
> +	} else if (is_victus_thermal_profile()) {
> +		err =3D platform_profile_victus_get_ec(&actual_profile);
> +	}
> +
> +	if (err < 0) {
> +		pr_warn("Failed to read current platform profile (%d)\n", err);
> +
> +		/*
> +		 * Although we failed to get the current platform profile, we
> +		 * still want the other event consumers to process it.
> +		 */
> +		return NOTIFY_DONE;
> +	}
> +
> +	/*
> +	 * If we're back on AC and that the user-chosen power profile is
> +	 * different from what the EC reports, we restore the user-chosen
> +	 * one.
> +	 */
> +	if (power_supply_is_system_supplied() >=3D 0 ||
> +	    active_platform_profile !=3D actual_profile) {
> +		mutex_unlock(&active_platform_profile_lock);
> +
> +		pr_debug("EC reports same platform profile, no platform profile updat=
e required\n");
> +		return NOTIFY_DONE;
> +	}
> +
> +	if (is_omen_thermal_profile()) {
> +		err =3D platform_profile_omen_set_ec(&active_platform_profile);
> +	} else if (is_victus_thermal_profile()) {
> +		err =3D platform_profile_victus_set_ec(&active_platform_profile);
> +	}
> +
> +	if (err < 0) {
> +		mutex_unlock(&active_platform_profile_lock);
> +
> +		pr_warn("Failed to restore platform profile (%d)\n", err);
> +		return NOTIFY_DONE;
> +	}
> +
> +	mutex_unlock(&active_platform_profile_lock);
> +
> +	return NOTIFY_OK;
> +}
> +
> +static int omen_register_powersource_event_handler(void)
> +{
> +	int err;
> +	acpi_status status;
> +
> +	active_platform_profile =3D PLATFORM_PROFILE_BALANCED;
> +
> +	if (is_omen_thermal_profile())
> +		err =3D platform_profile_omen_get_ec(&active_platform_profile);
> +	else if (is_victus_thermal_profile())
> +		err =3D platform_profile_victus_get_ec(&active_platform_profile);
> +
> +	if (err) {
> +		pr_warn("Failed to retrieve active platform profile (%d)\n",
> +			err);
> +		active_platform_profile =3D PLATFORM_PROFILE_BALANCED;
> +
> +		return err;
> +	}

Please drop this, active_platform_profile should have been already initial=
ized when
registering the platform profile.

> +
> +	platform_power_source_nb.notifier_call =3D omen_powersource_event;
> +	status =3D register_acpi_notifier(&platform_power_source_nb);

register_acpi_notifier() returns a normal integer, please drop the usage o=
f ACPI_FAILURE()
and instead do something like this:

	err =3D register_acpi_notifier(&platform_power_source_nb);
	if (err < 0) {
		pr_warn("Failed to install ACPI power source notify handler\n");
		return err;
	}

> +
> +	if (ACPI_FAILURE(status))
> +		pr_warn("Failed to install ACPI power source notify handler\n");
> +
> +	return 0;
> +}
> +
> +static void omen_unregister_powersource_event_handler(void)
> +{
> +	acpi_status status;
> +
> +	status =3D unregister_acpi_notifier(&platform_power_source_nb);
> +
> +	if (ACPI_FAILURE(status))
> +		pr_err("Failed to remove ACPI power source notify handler\n");

Same as above.

> +}
> +
>   static int thermal_profile_setup(void)
>   {
>   	int err, tp;
> @@ -1534,6 +1724,15 @@ static int __init hp_wmi_bios_setup(struct platfo=
rm_device *device)
>
>   	thermal_profile_setup();
>
> +	/*
> +	 * Query the platform profile once to know which last power profile
> +	 * was set.
> +	 */
> +	err =3D platform_profile_handler.profile_get(&platform_profile_handler=
,
> +						   &active_platform_profile);
> +	if (err < 0)
> +		return err;

This needs to happen _before_ platform_profile_register() is called, since=
 at that point
the power profile can be changed by userspace already.

I think it would be best to initialize active_platform_profile inside ther=
mal_profile_setup().

> +
>   	return 0;
>   }
>
> @@ -1758,6 +1957,12 @@ static int __init hp_wmi_init(void)
>   			goto err_unregister_device;
>   	}
>
> +	if (is_omen_thermal_profile() || is_victus_thermal_profile()) {
> +		err =3D omen_register_powersource_event_handler();
> +		if (err)
> +			goto err_unregister_device;
> +	}
> +
>   	return 0;
>
>   err_unregister_device:
> @@ -1772,6 +1977,9 @@ module_init(hp_wmi_init);
>
>   static void __exit hp_wmi_exit(void)
>   {
> +	if (is_omen_thermal_profile() || is_victus_thermal_profile())
> +		omen_unregister_powersource_event_handler();
> +
>   	if (wmi_has_guid(HPWMI_EVENT_GUID))
>   		hp_wmi_input_destroy();
>
