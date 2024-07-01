Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1EC5126F1E
	for <platform-driver-x86@vger.kernel.org>; Mon,  1 Jul 2024 15:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719849427; cv=none; b=gd/SRN6V0IhjiMWBk5XKGRawH78e6aFKzE6NzzmAGUNPNhQ4Lb2jQ21sJVfPd357yQ4EoIwTPAWK0EcBVOF9CmMTUgrykR170QkbMRMHV7TXEbwCg/ZjFjrcC1cL+/gQImjfO1qYtQIpA+1KNXlgDFMt1lZzm2twvQbovgT3ML4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719849427; c=relaxed/simple;
	bh=LcZrGai9aKXfe/9ZYfArpeG9/zEW6fsPqQhtuHbTfCk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FKnfb4T4efDXOwCRUIMX1Ouw+QAsSVKF7Kv7ty6UIY/JM+Sjgi1LkmBt7raLZtiZWXZ0cAWjoY5nIKX0JAcJjLiGLOTthMpEyPovc6gmCOJScNZJvyI0hMXTsQISpArPf3LNoUy3PxPot35RkmcGKQPUPgKtMkOGN5470GGWNOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=Yep5Owv0; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="Yep5Owv0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1719849416; x=1720454216; i=w_armin@gmx.de;
	bh=TUUO4LmRvZSQ+esMg4jvVYCGb6LthdRkBY4AANfhajc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Yep5Owv0hU9pSwBLEzyf19ioTiVA5tw8pl2jUa7xZsAUDQbp8rJOz7fS43dJMpDW
	 3kUbH95EH++7frE1N7qtnpTGaxqOB0+3BmOGIc50WaYX4SqqxIajkADUd9yBCFugs
	 KPZAaDy7JbCApGf1aNPmp1y1m+FtGDnALrkvrfIRVC/DAxixJIJ2nH3QgTM5EDqB3
	 C13Mqq/AUOBI84LtkqgvWBINVa8NZKFf5rc99SqsSIy3fQ6sJIiuCtLQAHdTPjNmo
	 MT83ttvDWMNbwLnW5n0uMAckQXHKjmf1igddImMhvSuAdfw1I0qdHM+8zQcJLwQO5
	 FOHVQQL+IKWkPLHPzg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [141.30.226.129] ([141.30.226.129]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mkpap-1s0qgh1jfL-00dw6n; Mon, 01
 Jul 2024 17:56:56 +0200
Message-ID: <7f058c69-8a3c-479d-bebf-9878a5d64f06@gmx.de>
Date: Mon, 1 Jul 2024 17:56:55 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv7] platform/x86: hp-wmi: Fix platform profile option
 switch bug on Omen and Victus laptops
To: Alexis Belmonte <alexbelm48@gmail.com>, ilpo.jarvinen@linux.intel.com,
 hdegoede@redhat.com
Cc: platform-driver-x86@vger.kernel.org
References: <ZoLEnl9y99fff4xp@alexis-pc>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <ZoLEnl9y99fff4xp@alexis-pc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:2I8oosAPIyiKN97QYmTCFdniHv49+ml136eRqEkxj5FwIAphB8P
 tZJNXbr2YKnTsMEt82/8LsFte0oXRbRtOLZtYr1D9Jrw2n9EMIfVrbB70zWqM9tUITJmGZw
 09gKsanCu4Hszq1BGjxxtlLUQTxgH1u4Vi0LXxNxXlZalqmXHU34xQa8yvzma2Ebda//Z1O
 jIuLdUx0+wBlTeWQ7zh3g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:LKwESRgK92w=;pBfbHj8z2/+hS7Q0XQsQxAKt8RP
 mKceQGXRiN8zPxN3WsJC/+w4c/EI5ryKrckTKz82SSYxMgpbr6n37RHJvTSXN1oNO57ljwqxV
 aRR4HCyuqFiVVap5Rh7fS1W6uVdILzZqxp3DbDdeGBaQkutYDRSbC6KTfzHNFawnB9tRs50Be
 +Eiam7uwIvvJyqp18ntIAl7rb3fyv20zHoFS9VPWNueuaUPcAAfAjlvxx1MnjUlwH/PSbKcaQ
 YWljaEmR0/SpCsJ7qKHyi52GohMIMCPOiZZXLnCy1XJjOhG+jsgDiLB15OYHLgwpgMTtlk708
 HU1AUh+ci/syItoM6TEYwlrk79LJEq3HzIy5ayZB/ind8YlRdxcTmckoMTVDkNHrhTEwusBZd
 ccaXqbM7mfym72SaIvnzJ2L/uUAANtE8tanwuYwDu/b2o26W9m/g+wbM/wytSn39ToU/abaW7
 /cGBdBpMU2+x3/0eaqEJmGNWvrN2oZcCwLKp4FXFp6/GXwFbX/vL3As+/w6SmNmiK1r+qs8oP
 4JLVDZujQmo6ybk2sPxf/bP8HvoJ8n6Ia1wvylAGioD0drnz7uxRpfkZ9KbH2gdYHcRoxL3ec
 v+l2Qg6Xo4+HKWjHN+1xZZOg4SmxB8QcDPIRDYvDy6R2Lfzjb2IAx7eaWOnXcJ5BJ6PLEzZHI
 e4P+S4B4NaYQ4ANr+txuYIxzz9zu7a3gGsfgKA/0a5uHzVYsVAxifs96cuRhGHdytZ52LAfX0
 pGuAYbWE6qdynDHA0Xoqpvet4k1PD8n45pKNjkpzpTDMvRPBsfUDGqSKiTRnwjb6Op4B1QQnl
 0YiVVOLxQGgXVldp30kFZnRkLoZaccmhsGTzfJwcayH/Q=

Am 01.07.24 um 17:00 schrieb Alexis Belmonte:

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
> V6 -> V7: - Drop EC platform profile readback after set
>            - Lock the active_platform_profile mutex unconditionally
>            - Drop the usage of ACPI_FAILURE in favor of a simpler error =
check
>              when registering/unregistering the ACPI notifier
>            - Initialize active_platform_profile in thermal_profile_setup
> ---
>   drivers/platform/x86/hp/hp-wmi.c | 211 +++++++++++++++++++++++++++++--
>   1 file changed, 200 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/=
hp-wmi.c
> index 5fa553023842..6ffc9d7ad8c1 100644
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

Hi,

there is no reason anymore for profile to be a pointer, please fix this.

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
> +	err =3D platform_profile_omen_set_ec(&profile);
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
> @@ -1407,12 +1458,18 @@ static int platform_profile_victus_get(struct pl=
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

Same as above.

>   	case PLATFORM_PROFILE_PERFORMANCE:
>   		tp =3D HP_VICTUS_THERMAL_PROFILE_PERFORMANCE;
>   		break;
> @@ -1433,10 +1490,124 @@ static int platform_profile_victus_set(struct p=
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
> +	err =3D platform_profile_victus_set_ec(&profile);
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
> +	if (is_omen_thermal_profile()) {
> +		err =3D platform_profile_omen_get_ec(&actual_profile);
> +	} else if (is_victus_thermal_profile()) {
> +		err =3D platform_profile_victus_get_ec(&actual_profile);
> +	}

If neither is_omen_thermal_profile() nor is_victus_thermal_profile() is tr=
ue,
then err is uninitialized here.

Please return without an error if both conditions are not true.

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

Same problem as above, please set err to zero if both conditions are not t=
rue.

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
> +	if (is_omen_thermal_profile())
> +		err =3D platform_profile_omen_get_ec(&active_platform_profile);
> +	else if (is_victus_thermal_profile())
> +		err =3D platform_profile_victus_get_ec(&active_platform_profile);

I will say it again: active_platform_profile has to be initialized _before=
_ thermal_profile_setup()
calls platform_profile_register().

This is the wrong place to initialize active_platform_profile, its too lat=
e. Please drop this.

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
> +	if (is_omen_thermal_profile() || is_victus_thermal_profile())
> +		active_platform_profile =3D PLATFORM_PROFILE_BALANCED;

With "initializing active_platform_profile", i meant to actually read the =
current value from the EC.

I think you can replace the calls of omen_thermal_profile_get() inside the=
rmal_profile_setup()
with platform_profile_omen_get_ec()/platform_profile_victus_get_ec() and u=
se them to initialize
active_platform_profile.

> +
>   	if (is_omen_thermal_profile()) {
>   		tp =3D omen_thermal_profile_get();
>   		if (tp < 0)
> @@ -1534,6 +1705,15 @@ static int __init hp_wmi_bios_setup(struct platfo=
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

Again, this is too late, the platform profile is already registered. Pleas=
e drop.

> +	if (err < 0)
> +		return err;
> +
>   	return 0;
>   }
>
> @@ -1758,6 +1938,12 @@ static int __init hp_wmi_init(void)
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
> @@ -1772,6 +1958,9 @@ module_init(hp_wmi_init);
>
>   static void __exit hp_wmi_exit(void)
>   {
> +	if (is_omen_thermal_profile() || is_victus_thermal_profile())
> +		omen_unregister_powersource_event_handler();
> +
>   	if (wmi_has_guid(HPWMI_EVENT_GUID))
>   		hp_wmi_input_destroy();
>
