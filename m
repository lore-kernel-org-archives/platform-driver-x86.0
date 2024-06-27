Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2551919A2AE
	for <platform-driver-x86@vger.kernel.org>; Thu, 27 Jun 2024 17:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719510938; cv=none; b=EKr5kAcdCMDJTFPpoj256QV7i8BAEDa2OO7KK4ob0uMJNyDP0Z9TWittbsfz0fyTGWAU/ag7C39iNQji4WtRtgj8e7OrIj6zgBK8mf31yAHwrH2+bFJUk6hl22fJysJJRO22Yc4ids5s3yEufsKtype82pIvYwkuQRtLJr9mPus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719510938; c=relaxed/simple;
	bh=+c964dHdUPcqYr1Cou3Ej2Na5JAsVMp0+6x6hI854IM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fD+CfuEKAoNrrjaJxzOWkAxot8dfI6FFULHe3AS8qcTk2rBy6jbc2+35si7fJzBbOceoLDMYMJxRp9Oyp9QtWWNQSmLoIWarheT/1Nu8C92HK01woml5sQWjMaowmJOpbh3BNq1aEKW3as7F47y917Iu6nuPGcgV71w11+bW0FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=KLgavone; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="KLgavone"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1719510927; x=1720115727; i=w_armin@gmx.de;
	bh=+pMOG3aJMG42K+ggInagmoZ9zxsfu/PxoGFXH8ITaKg=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=KLgavonenFaP1ouB3WSIEpoY5aDHH4iCqA/m3t8oAkkruBCMECjH6f7k4JeZD1Hn
	 nKWuE+lVwsaP0a1Z7y9RZZx7FWHg5VwrNKKHwjbafA9V9siJIJjtGgPJWbnwENJXs
	 vda/wpiPdOp2NmbAvT6mjpnEI0GBFuzN4V1MOR5Xu7J4cehYsjh2tY2yK0NFh2pd3
	 Yi9fwqYl7903deuHkvro78KVm4NLTK+LxFosRwFEQzufNOKPcfsvpsWdVZM07+DVp
	 AzoiRjmh7tyh57VthvbTC0OhwTGXS3xD8zS9g+ddwRKfSXwWTsZ9nW//nx6j+uWTm
	 I4r+2gAsvWDl1WnO2A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [141.30.226.129] ([141.30.226.129]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MJVDW-1s3Ad51KSu-00LbqG; Thu, 27
 Jun 2024 19:55:27 +0200
Message-ID: <13895ccd-1072-42e7-bc72-f74efaeace17@gmx.de>
Date: Thu, 27 Jun 2024 19:55:26 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv4] platform/x86: hp-wmi: Fix platform profile option
 switch bug on Omen and Victus laptops
To: Alexis Belmonte <alexbelm48@gmail.com>, ilpo.jarvinen@linux.intel.com,
 hdegoede@redhat.com
Cc: platform-driver-x86@vger.kernel.org
References: <ZnyQUCcVOCAfRypJ@alexis-pc>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <ZnyQUCcVOCAfRypJ@alexis-pc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:nJgPaw63ENPVB/nY1FnjNQ+/Gg7q17yNN6FD5uHRE5bK8wX/rUk
 x2JpaxkV2j6kU44tTYS1NGszHEUsIbnxGqLYh4Tm6m9h3KanaJS6URiiMLNvvcp7FwM0Yzz
 gDOklLoeMnU9HvP1fApYSf3HdFgKyz/KksCDeAZBSpzV8mTDPVDFH1EdurZMQBdwZsYHMQm
 oGJSCSLkyuJ+hqbUSjQqQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:XBbXJltLkYs=;m/M7BJBOPIMrleoSPYmhKdBndaS
 8XhDZd3YoPQ8i25M6HsJSuPT0oMRf+6+IhhCvHugWnYlHQiFNQgT57zsxHykKggzQBQE5jJpM
 RDYu1c7TNQrVrHDwy5bNh8DLGW8+V8Hot//jH/WPCHd/qE+pNQJqvogbBoAzCyvT5QpZtbNWa
 62gDSYfnFEmtpmLndLpnI4oyPF2Z83Ku4/PqQxuZt6qZkFCzxnX+doFoxiiKlBrxmcUpJOMXE
 RDTlsrGZj3dTuMgArPpV+IPDKS7u9fEWrx7G4tbMZ9ftsM+OTbxKs1W8aL9zJ/CvfU17cHG38
 R4z2XRzIrXnZlvWtdCgSdyEGO1BFH49wNQdZu8XITDUO4q8ms8bsdfKog7YLqITnrciFWq2y6
 GAnEcZf7cALBhIiMhMdODDEWl5Kml6ym4A5IsKWswiRpF8bnsQhJsiOVNbyPEQYRusQdcR6iu
 XwI3Az6MoZ7AK+3knWb4sBkrMfFLl32VBsOJVPEeurFjLKrIwc/hFyV2uKIKaGHbV94i+K1ut
 WDDb/FRQcnd17vsRfOevHhyT4lUDHLmnXypCYgA55SBlwsayDNHCgB4p42zfGO8cyjhr5oCNo
 TOIxQWQLxtbV4n8Z0lnJoxGBfhIB5pJnrFNV8ps3YHfDwBkmKUGCX6za9RRtdLSxoK/2BeN40
 BIJSqDgCIys5+4f1H9bJU4XYEBK+dYKsPDY7OeL/fB7EHHhJiA07QMGVVXRo3+LS/a9EamvBx
 80ydR0NTkQwLkmVUV+glLqk8LN1BjIotd6BAbCZrIwGbsQmP4MVm75KBveGoqS1+7xY7Ofwhi
 6bQkbz7SOVfJvcEBoL26oPk1xBRQlLB3dW660cNfH8d+Y=

Am 27.06.24 um 00:04 schrieb Alexis Belmonte:

> Fix a platform profile option switch/getter bug on some Omen and Victus =
laptops

Hi,

the preferred line length inside commit descriptions is 75 characters per =
line,
please add some line breaks where necessary.

> dismissing userspace choice when selecting performance mode in inadequat=
e
> conditions (e.g. by being disconnected from the AC power plug) by
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
>        laptop, unless if the user decided to alter the platform profile =
mid-way
>
> This ensures that the driver follows the principles defined in the Platf=
orm
> Profile Selection page of the Kernel documentation on those kind of lapt=
ops;
> which is to not "(...) let userspace know about any sub-optimal conditio=
ns
> which are impeding reaching the requested performance level".
>
> Since the Omen and Victus laptops share the same embedded controller sys=
tem,
> the fix is applicable to both categories of laptops.
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
> ---
>   drivers/platform/x86/hp/hp-wmi.c | 184 +++++++++++++++++++++++++++++--
>   1 file changed, 172 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/=
hp-wmi.c
> index 5fa553023842..2f57dfe6ab9c 100644
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
> @@ -261,8 +262,12 @@ static const struct key_entry hp_wmi_keymap[] =3D {
>
>   static struct input_dev *hp_wmi_input_dev;
>   static struct input_dev *camera_shutter_input_dev;
> +

This change is unnecessary, please drop it.

>   static struct platform_device *hp_wmi_platform_dev;
>   static struct platform_profile_handler platform_profile_handler;
> +static struct notifier_block platform_power_source_nb;
> +DEFINE_MUTEX(active_platform_profile_lock);

Checkpatch complains about a "DEFINE_MUTEX definition without comment", so=
 please add a short
comment explaining why this mutex exists.

Also please move the mutex definition away from the rest of the variable d=
efinitions.

> +static enum platform_profile_option active_platform_profile;
>   static bool platform_profile_support;
>   static bool zero_insize_support;
>
> @@ -1194,8 +1199,7 @@ static int __init hp_wmi_rfkill2_setup(struct plat=
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
> @@ -1223,6 +1227,30 @@ static int platform_profile_omen_get(struct platf=
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
> @@ -1248,7 +1276,7 @@ inline int omen_thermal_profile_ec_timer_set(u8 va=
lue)
>   static int platform_profile_omen_set(struct platform_profile_handler *=
pprof,
>   				     enum platform_profile_option profile)
>   {
> -	int err, tp, tp_version;
> +	int err =3D 0, tp, tp_version;

Please place the definition of "int err =3D 0" on its own line.

>   	enum hp_thermal_profile_omen_flags flags =3D 0;
>
>   	tp_version =3D omen_get_thermal_policy_version();
> @@ -1279,14 +1307,16 @@ static int platform_profile_omen_set(struct plat=
form_profile_handler *pprof,
>   		return -EOPNOTSUPP;
>   	}
>
> +	mutex_lock(&active_platform_profile_lock);
> +
>   	err =3D omen_thermal_profile_set(tp);
>   	if (err < 0)
> -		return err;
> +		goto unlock_and_return;
>
>   	if (has_omen_thermal_profile_ec_timer()) {
>   		err =3D omen_thermal_profile_ec_timer_set(0);
>   		if (err < 0)
> -			return err;
> +			goto unlock_and_return;
>
>   		if (profile =3D=3D PLATFORM_PROFILE_PERFORMANCE)
>   			flags =3D HP_OMEN_EC_FLAGS_NOTIMER |
> @@ -1294,10 +1324,15 @@ static int platform_profile_omen_set(struct plat=
form_profile_handler *pprof,
>
>   		err =3D omen_thermal_profile_ec_flags_set(flags);
>   		if (err < 0)
> -			return err;
> +			goto unlock_and_return;
>   	}
>
> -	return 0;
> +	active_platform_profile =3D profile;
> +
> +unlock_and_return:
> +	mutex_unlock(&active_platform_profile_lock);

Can you please rename this goto label to something like "out_unlock"?

> +
> +	return err;
>   }
>
>   static int thermal_profile_get(void)
> @@ -1381,8 +1416,8 @@ static bool is_victus_thermal_profile(void)
>   			    board_name) >=3D 0;
>   }
>
> -static int platform_profile_victus_get(struct platform_profile_handler =
*pprof,
> -				     enum platform_profile_option *profile)
> +static int platform_profile_victus_get_ec(
> +	enum platform_profile_option *profile)

Checkpatch complains that "Lines should not end with a '('", please fix.

>   {
>   	int tp;
>
> @@ -1407,10 +1442,27 @@ static int platform_profile_victus_get(struct pl=
atform_profile_handler *pprof,
>   	return 0;
>   }
>
> +static int platform_profile_victus_get(struct platform_profile_handler =
*pprof,
> +				       enum platform_profile_option *profile)
> +{
> +	enum platform_profile_option selected_platform_profile;
> +
> +	/*
> +	 * Same as for platform_profile_omen_get -- I still decided to keep
> +	 * it as a separate implementation if we need to add Victus-specific
> +	 * behaviour/logic in the future
> +	 */

Personally, i do not agree with this opinion, but its up to the driver mai=
ntainer to
decide here.

> +	mutex_lock(&active_platform_profile_lock);
> +	selected_platform_profile =3D active_platform_profile;
> +	mutex_unlock(&active_platform_profile_lock);
> +
> +	return selected_platform_profile;
> +}
> +
>   static int platform_profile_victus_set(struct platform_profile_handler=
 *pprof,
> -				     enum platform_profile_option profile)
> +				       enum platform_profile_option profile)
>   {
> -	int err, tp;
> +	int err =3D 0, tp;

Unnecessary change, please drop.

>
>   	switch (profile) {
>   	case PLATFORM_PROFILE_PERFORMANCE:
> @@ -1426,13 +1478,106 @@ static int platform_profile_victus_set(struct p=
latform_profile_handler *pprof,
>   		return -EOPNOTSUPP;
>   	}
>
> +	mutex_lock(&active_platform_profile_lock);
> +
>   	err =3D omen_thermal_profile_set(tp);
>   	if (err < 0)
> -		return err;
> +		goto unlock_and_return;
> +
> +	active_platform_profile =3D profile;
> +
> +unlock_and_return:
> +	mutex_unlock(&active_platform_profile_lock);

I think you can drop this goto label here and just unlock the mutex and re=
turn if an error occured.
This would also fix the issue of still returning 0 even when an error occu=
red.

>
>   	return 0;
>   }
>
> +static int omen_powersource_event(struct notifier_block *nb,
> +					   unsigned long value,
> +					   void *data)
> +{

Checkpatch: "Alignment should match open parenthesis".

> +	struct acpi_bus_event *event_entry =3D data;
> +	enum platform_profile_option selected_platform_profile;
> +	enum platform_profile_option actual_profile;
> +	int err;
> +
> +	if (strcmp(event_entry->device_class, "ac_adapter") !=3D 0)
> +		return NOTIFY_DONE;

Maybe use a macro here for "ac_adapter"?

> +
> +	pr_debug("Received power source device event\n");
> +
> +	if (is_omen_thermal_profile())
> +		err =3D platform_profile_omen_get_ec(&actual_profile);
> +	else if (is_victus_thermal_profile())
> +		err =3D platform_profile_victus_get_ec(&actual_profile);

Please use braces here for both if-statements and the else-statement.

> +
> +	if (err < 0) {
> +		pr_warn("Failed to read current platform profile (%d)\n", err);
> +		return NOTIFY_BAD;
> +	}

I do not think that returning NOTIFY_BAD is a good idea in this case, as t=
his would
stop any other event consumers from handling the event.

Maybe returning NOTIFY_DONE together with a comment would be better here?

> +
> +	/*
> +	 * We don't want the handler to overwrite the newly set platform
> +	 * profile if the user has changed it in the meantime (thanks Armin!)
> +	 */
> +	if (!mutex_trylock(&active_platform_profile_lock))
> +		return NOTIFY_DONE;

This construct might cause you to miss power source events when the event =
is received
right after omen_thermal_profile_set() was called but before the mutex has=
 been unlocked.

Please unconditionally take the mutex before calling platform_profile_omen=
/victus_get_ec()
and drop it _after_ updating the EC platform profile.

This means that you have to provide helper functions for profile_get()/pro=
file_set() which
do not take the mutex.

> +
> +	selected_platform_profile =3D active_platform_profile;
> +	mutex_unlock(&active_platform_profile_lock);
> +
> +	/*
> +	 * If we're back on AC and that the user-chosen power profile is
> +	 * different from what the EC reports, we restore the user-chosen
> +	 * one.
> +	 */
> +	if (power_supply_is_system_supplied() >=3D 0 ||
> +	    selected_platform_profile =3D=3D actual_profile)
> +		return NOTIFY_DONE;
> +
> +	err =3D platform_profile_handler.profile_set(&platform_profile_handler=
,
> +						   active_platform_profile);
> +	if (err < 0) {
> +		pr_warn("Failed to restore platform profile (%d)\n", err);
> +		return NOTIFY_BAD;

Same as the other NOTIFY_BAD.

> +	}
> +
> +	return NOTIFY_OK;
> +}
> +
> +static void omen_register_powersource_event_handler(void)
> +{
> +	int err;
> +	acpi_status status;
> +
> +	if (is_omen_thermal_profile())
> +		err =3D platform_profile_omen_get_ec(&active_platform_profile);
> +	else if (is_victus_thermal_profile())
> +		err =3D platform_profile_victus_get_ec(&active_platform_profile);
> +
> +	if (err < 0) {
> +		pr_warn("Failed to retrieve active platform profile (%d)\n",
> +			err);
> +		active_platform_profile =3D PLATFORM_PROFILE_BALANCED;
> +	}
> +
> +	platform_power_source_nb.notifier_call =3D omen_powersource_event;
> +	status =3D register_acpi_notifier(&platform_power_source_nb);
> +
> +	if (ACPI_FAILURE(status))
> +		pr_warn("Failed to install ACPI power source notify handler\n");
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
> +}
> +
>   static int thermal_profile_setup(void)
>   {
>   	int err, tp;
> @@ -1534,6 +1679,15 @@ static int __init hp_wmi_bios_setup(struct platfo=
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

You have to initialize active_platform_profile before calling thermal_prof=
ile_setup(), otherwise
a very timely user might change the platform profile without active_platfo=
rm_profile being set.

Also it would make sense to just drop the active_platform_profile initiali=
zation in
omen_register_powersource_event_handler() then.

> +	if (err < 0)
> +		return err;
> +
>   	return 0;
>   }
>
> @@ -1758,6 +1912,9 @@ static int __init hp_wmi_init(void)
>   			goto err_unregister_device;
>   	}
>
> +	if (is_omen_thermal_profile() || is_victus_thermal_profile())
> +		omen_register_powersource_event_handler();
> +
>   	return 0;
>
>   err_unregister_device:
> @@ -1772,6 +1929,9 @@ module_init(hp_wmi_init);
>
>   static void __exit hp_wmi_exit(void)
>   {
> +	if (is_omen_thermal_profile() || is_victus_thermal_profile())
> +		omen_unregister_powersource_event_handler();

You have to check if the event handler was registered successfully before
unregistering it.

Thanks,
Armin Wolf

> +
>   	if (wmi_has_guid(HPWMI_EVENT_GUID))
>   		hp_wmi_input_destroy();
>
