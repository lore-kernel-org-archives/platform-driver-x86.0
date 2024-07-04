Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD71131736
	for <platform-driver-x86@vger.kernel.org>; Thu,  4 Jul 2024 21:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720128309; cv=none; b=ExXrgi9reJJbL1ST4iY56PhTEtcY8J11CKXULDwmB+80MRUTanOX8ewYS4O9NcxH+aJA/mmJM9y3R+tJYU5Cms1c3x8c/dJGfCw6U/vIpLvbyn/BMHyXWCKrpxCbqyfRbwKnL989n0xCJxDgGH6bjyDTsg5gCCcKFtGk2f6vgh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720128309; c=relaxed/simple;
	bh=JJ6z64g19/5eqXdPQm2cOTN0EpRVV36UKpj5ZwKFE+s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sHYdcrMKeaJqic5q3HuqLQM9T6y35psRVGP2U59LxTZFlYnaAYR8XSLMAApNpm9wUsnxce0iC2MN5JX6tms/ofllMBhhXkXrA30UmkkatDCK2S7DgRCMT9KvbPFNh+87HoKAY8b8qkPFFtBv3unBIVLaGn7VJmvfarF2YfF5o10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=CsIgwhg8; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="CsIgwhg8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1720128298; x=1720733098; i=w_armin@gmx.de;
	bh=5ffWdXbc/DDORBYllKh3gaLTI8GGa2WWaj4Fa9MLDbI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=CsIgwhg8ZWrReZ/J3PtqelJUCkQlg5OBiZPNSuW5O6f4K4APx1xS88F1wo4HCNow
	 cmsiOgQrTgS89OlkIHggbORIuBUnf28M/VPA/Z8nXxUzF66hhwstA1rIn+I8+LrGT
	 NXGunZd7R51HY5t1BIiGjSyR4aK/HN2tFmQe6oOvAw8yaZwiG/eWi/hdw9qp1QFxz
	 T3x38p16pfFC/6OOUOUCkCw+d2nty6f2luk0KdXpbJq6QPkdzFKT52jvs4cyrsmuD
	 x0+7qQ4rUT8HiKzJd3l9oI1Gj/wheS1EnicoATtUI0Ii9UUfK2bg+5HVNsAZ0UqU1
	 Bu9+SimRQ/Wu4E22hQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [141.30.226.129] ([141.30.226.129]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N8GQs-1sLJ3y2kLo-00tm9D; Thu, 04
 Jul 2024 23:24:58 +0200
Message-ID: <0490c5ff-2c26-4de7-a3d5-0e19fdff79ee@gmx.de>
Date: Thu, 4 Jul 2024 23:24:57 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv8] platform/x86: hp-wmi: Fix platform profile option
 switch bug on Omen and Victus laptops
To: Alexis Belmonte <alexbelm48@gmail.com>, ilpo.jarvinen@linux.intel.com,
 hdegoede@redhat.com
Cc: platform-driver-x86@vger.kernel.org
References: <ZoLy85rtVTAVZnPI@alexis-pc>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <ZoLy85rtVTAVZnPI@alexis-pc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:aPvAoaaDyrRsJf/vo8xViKWYf6KvlaQFk3CEE/1J+mnoSirdHxM
 FrOqGJF7A+MPch3DLNQ94x8d20hWc0JhgXUerhZIPlrM/hiy/wLQotEB9XJ9xPRr1icDiNw
 jc72x+OYpTwRh9v32fr6D7qWkdiNrYVKM1T+PBO6hdQpjr30qv5Sir1X7puupCfraMVmqlt
 YTFTgOCm+CmteexzT3tnw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:loC71110F2g=;HRgNNMJPNmcMMFaZjbocWxlILD2
 89kQZQz8fADMAQxNQOS2K3OhRy+fAc/esVpjmmFWi8svb1Kx8L0DFQwhUTnvrCF5cqw6swuP6
 q+x4DH9VhZ0Dda7df3W+YpQgBtU8rWyVpsyTk/Q6bIwoIbXgsOjFXoQvJ7nUqp/a7RPqeGFUJ
 5NS/HVrS86mAdHbX31vxod/X95OQT74Tx2qVMJmkBUphwJconwx0HfTgLwQGdv6/1Y9cySest
 x5W5mNwkquhLTAMtkKaufCYMnbdn4X/h0W54d/y6Chpmmu6YRY3/xSgGA4Fa5WqH3U/HsOaeL
 Qd/i49bAQWomesIjSuCYSjiU32GNfI1DOlfCIqA93+AUnq4vVdgJ4ZmNib0QDS3K2Ju1XQpFK
 tYgvk3bfJwoOAxt9o7zovOxO0kMKeRxVXSV35rkQXW2GokfFvhG9rZg2dqlBX5Uyt9AkXY82n
 Rkn9r68SZkabkdQz5Rp2SarMWpIwKlggsqSiXCyYy+HVzZC3JdO7lqw0YceTw3YK0xKyXY0wg
 fVpUF0GemoKjYgi65m97fDKxwV0wuNqrHAP+DxOuMxRdYHIslT7Fb269d/Dhl8VuNu6JB6Mc4
 IRW0kq7obiXNGgsj/5XkEj5Ns2rv8nLGkQdFusLorQ726s8H4s+hy1pYTbPJ0NfpUk76sPsRX
 wDnKh8z7T1SixH4gJ2LaFsb0kYKXKeG2cmJPYNyb3xWpWbeIxGTFopITjMTlk7/21Ahh0A8Lg
 kqWF6oq/hOj5/6lxQfc6IWwOGkUx3S5BsjeazmNYDDMnqMtdic42tj1dm/HxHL9E7ztStPGKl
 JnnRjFt8hBakZ9xDjmceGb9f/OqJidOnyn5Nx+quGyVRc=

Am 01.07.24 um 20:18 schrieb Alexis Belmonte:

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
> This patch thus introduces a new dependency to the POWER_SUPPLY subsyste=
m
> for this module.
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
> V6 -> V7: - Drop EC platform profile readback after set
>            - Lock the active_platform_profile mutex unconditionally
>            - Drop the usage of ACPI_FAILURE in favor of a simpler error =
check
>              when registering/unregistering the ACPI notifier
>            - Initialize active_platform_profile in thermal_profile_setup
> V7 -> V8: - Pass profile as a value instead of a pointer for
>              platform_profile_omen_set & platform_profile_victus_set as =
these
>              functions no longer alter the parameter
>            - Initialize active_platform_profile during
>              thermal_profile_setup by reading the current platform profi=
le from
>              the embedded controller
>            - Drop vestigial active_platform_profile initialization code
>            - Add module dependency (select) to POWER_SUPPLY in Kconfig
>            - Simplify thermal profile getter check in omen_powersource_e=
vent
>            - Substitute omen_thermal_profile_get/omen_thermal_profile_se=
t
>              with platform_profile_omen_get_ec/platform_profile_omen_set=
_ec and
>              platform_profile_victus_get_ec/platform_profile_victus_set_=
ec to
>              simplify thermal_profile_setup
> ---
>   drivers/platform/x86/hp/Kconfig  |   1 +
>   drivers/platform/x86/hp/hp-wmi.c | 207 ++++++++++++++++++++++++++++---
>   2 files changed, 191 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/platform/x86/hp/Kconfig b/drivers/platform/x86/hp/K=
config
> index 7fef4f12e498..d776761cd5fd 100644
> --- a/drivers/platform/x86/hp/Kconfig
> +++ b/drivers/platform/x86/hp/Kconfig
> @@ -40,6 +40,7 @@ config HP_WMI
>   	depends on ACPI_WMI
>   	depends on INPUT
>   	depends on RFKILL || RFKILL =3D n
> +	select POWER_SUPPLY
>   	select INPUT_SPARSEKMAP
>   	select ACPI_PLATFORM_PROFILE
>   	select HWMON
> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/=
hp-wmi.c
> index 5fa553023842..9210cbe0351d 100644
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
> +static int platform_profile_omen_set_ec(enum platform_profile_option pr=
ofile)
>   {
>   	int err, tp, tp_version;
>   	enum hp_thermal_profile_omen_flags flags =3D 0;
> @@ -1300,6 +1333,25 @@ static int platform_profile_omen_set(struct platf=
orm_profile_handler *pprof,
>   	return 0;
>   }
>
> +static int platform_profile_omen_set(struct platform_profile_handler *p=
prof,
> +				     enum platform_profile_option profile)
> +{
> +	int err;
> +
> +	mutex_lock(&active_platform_profile_lock);
> +
> +	err =3D platform_profile_omen_set_ec(profile);
> +	if (err < 0) {
> +		mutex_unlock(&active_platform_profile_lock);
> +		return err;
> +	}
> +
> +	active_platform_profile =3D profile;
> +	mutex_unlock(&active_platform_profile_lock);
> +
> +	return 0;
> +}
> +
>   static int thermal_profile_get(void)
>   {
>   	return hp_wmi_read_int(HPWMI_THERMAL_PROFILE_QUERY);
> @@ -1381,8 +1433,7 @@ static bool is_victus_thermal_profile(void)
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
> @@ -1407,8 +1458,14 @@ static int platform_profile_victus_get(struct pla=
tform_profile_handler *pprof,
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
profile)
>   {
>   	int err, tp;
>
> @@ -1433,21 +1490,128 @@ static int platform_profile_victus_set(struct p=
latform_profile_handler *pprof,
>   	return 0;
>   }
>
> +static int platform_profile_victus_set(struct platform_profile_handler =
*pprof,
> +				       enum platform_profile_option profile)
> +{
> +	int err;
> +
> +	mutex_lock(&active_platform_profile_lock);
> +
> +	err =3D platform_profile_victus_set_ec(profile);
> +	if (err < 0) {
> +		mutex_unlock(&active_platform_profile_lock);
> +		return err;
> +	}
> +
> +	active_platform_profile =3D profile;
> +	mutex_unlock(&active_platform_profile_lock);
> +
> +	return 0;
> +}
> +
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
> +	mutex_lock(&active_platform_profile_lock);
> +
> +	/*
> +	 * This handler can only be called on Omen and Victus models, so
> +	 * there's no need to call is_victus_thermal_profile() here.
> +	 */
> +	if (is_omen_thermal_profile())
> +		err =3D platform_profile_omen_get_ec(&actual_profile);
> +	else
> +		err =3D platform_profile_victus_get_ec(&actual_profile);
> +
> +	if (err < 0) {
> +		pr_warn("Failed to read current platform profile (%d)\n", err);

Missing mutex_unlock(&active_platform_profile_lock) here.

Otherwise, the patch locks good to me. So with that being fixed:

Reviewed-by: Armin Wolf <W_Armin@gmx.de>

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
> +	if (is_omen_thermal_profile())
> +		err =3D platform_profile_omen_set_ec(active_platform_profile);
> +	else
> +		err =3D platform_profile_victus_set_ec(active_platform_profile);
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
> +
> +	platform_power_source_nb.notifier_call =3D omen_powersource_event;
> +	err =3D register_acpi_notifier(&platform_power_source_nb);
> +
> +	if (err < 0) {
> +		pr_warn("Failed to install ACPI power source notify handler\n");
> +		return err;
> +	}
> +
> +	return 0;
> +}
> +
> +static void omen_unregister_powersource_event_handler(void)
> +{
> +	int err;
> +
> +	err =3D unregister_acpi_notifier(&platform_power_source_nb);
> +
> +	if (err < 0)
> +		pr_err("Failed to remove ACPI power source notify handler\n");
> +}
> +
>   static int thermal_profile_setup(void)
>   {
>   	int err, tp;
>
>   	if (is_omen_thermal_profile()) {
> -		tp =3D omen_thermal_profile_get();
> -		if (tp < 0)
> -			return tp;
> +		err =3D platform_profile_omen_get_ec(&active_platform_profile);
> +		if (err < 0)
> +			return err;
>
>   		/*
>   		 * call thermal profile write command to ensure that the
>   		 * firmware correctly sets the OEM variables
>   		 */
> -
> -		err =3D omen_thermal_profile_set(tp);
> +		err =3D platform_profile_omen_set_ec(active_platform_profile);
>   		if (err < 0)
>   			return err;
>
> @@ -1456,15 +1620,15 @@ static int thermal_profile_setup(void)
>
>   		set_bit(PLATFORM_PROFILE_COOL, platform_profile_handler.choices);
>   	} else if (is_victus_thermal_profile()) {
> -		tp =3D omen_thermal_profile_get();
> -		if (tp < 0)
> -			return tp;
> +		err =3D platform_profile_victus_get_ec(&active_platform_profile);
> +		if (err < 0)
> +			return err;
>
>   		/*
>   		 * call thermal profile write command to ensure that the
>   		 * firmware correctly sets the OEM variables
>   		 */
> -		err =3D omen_thermal_profile_set(tp);
> +		err =3D platform_profile_victus_set_ec(active_platform_profile);
>   		if (err < 0)
>   			return err;
>
> @@ -1758,6 +1922,12 @@ static int __init hp_wmi_init(void)
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
> @@ -1772,6 +1942,9 @@ module_init(hp_wmi_init);
>
>   static void __exit hp_wmi_exit(void)
>   {
> +	if (is_omen_thermal_profile() || is_victus_thermal_profile())
> +		omen_unregister_powersource_event_handler();
> +
>   	if (wmi_has_guid(HPWMI_EVENT_GUID))
>   		hp_wmi_input_destroy();
>
