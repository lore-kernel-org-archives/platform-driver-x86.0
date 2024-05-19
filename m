Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F1D91C2E
	for <platform-driver-x86@vger.kernel.org>; Sun, 19 May 2024 20:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716149036; cv=none; b=ZIp/MxdohcffOSZR0DQhuNmvHe/nZFbwiFdUS7uwuoJZO9hdac7QJUZY9+LsjOLch3wLxJ6H0RnuMlHWKqaIrbDquLahJnpIuTDCjqS4fCJRYezh9N8c3FFyWaAnncnveBYRm+GNVunfPvbahVYgD1ObWk7VIXw+DNahAcg4Z2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716149036; c=relaxed/simple;
	bh=7tsHdpdFrhHO+rIo/oAfHiYAmrWrlZ1SnUW6zvAEh2I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qk2B1y2t2LG3QlrZKo29DzOuAOB7IE9St8mgFiz8hlKdjHZYGdAQMiwOIekTNGvu/dH2HkQp17RyS38XYelwp4bGc642bH/j4qDxK3NUgAGxQsxLYQ5ETu+gyShMahWnq2M4ayrcAXH3OuJEaHDAlH9GE1gWFin38AclCozMiZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=A9sHQ/p+; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="A9sHQ/p+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1716149024; x=1716753824; i=w_armin@gmx.de;
	bh=p3nHffF5B2sCagM6YD3jEy5ceHZwuaX5UBWhtoPWaC0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=A9sHQ/p+g8TC/aNI0BkIhDFVesWfvcAFeAR18OCgKW3Zv5juoQjE1liGakDaz/x6
	 lk/6H3gS4yYRsAspUxrzhIDAE2JNG/lkIiAjJUoWLjhq/A8AWcBNnp6bpd4ct9tq8
	 nIIDA0VuvG05KeBA63jaa0icIqQCWsy3sKL0oZY8UUT6+UnOfx+KWcBxaqtE87zF/
	 ZvkLxGA9qzIY530jWfwrsZdj/4Cp0XmdoZroqqK9zcI5A+5KFXzyVvtdLyVxep0RU
	 3YITeJCJ40Hal/4qHz2UCoIryT6YFgiBzDzLmQwLqS4TR5GszORXTXImrSBjqxR35
	 qtjqccD+RJJ0kYAWlg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [141.30.226.129] ([141.30.226.129]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MpDJX-1stxHD1Ktb-00qgvd; Sun, 19
 May 2024 22:03:44 +0200
Message-ID: <e4487aa2-299b-4e26-8d05-bdf31c8ea737@gmx.de>
Date: Sun, 19 May 2024 22:03:42 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform/x86: hp-wmi: Fix platform profile option
 switch bug on Omen and Victus laptops
To: Alexis Belmonte <alexbelm48@gmail.com>, ilpo.jarvinen@linux.intel.com,
 hdegoede@redhat.com
Cc: platform-driver-x86@vger.kernel.org
References: <ZkpEU0Nc3K-SpuYq@alexis-pc>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <ZkpEU0Nc3K-SpuYq@alexis-pc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:kDJyjmVOXCOOWRnny5IGEF+8x6MImOnOiFzDGLJuVvacj/CypwB
 BD0aa66Sv1Xsp2qbIlorzeeM059paj4fhioUDu74wVD/qwEXWftZpvA/FFkRI21U3sabd5K
 Kw9+JPazjt1EWXQ7a3Nw3ogrIxp4BD/d6NkGuw5XE7+C+d7ygh6IUwEUwuvhfwtVzHqmqz2
 tQtBngqjUntYVknm7hXPw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:gsSyexofRfA=;5VwNSaa7BxNb2KmajJoOHRuv/zb
 QsrMokoaoHHXWipSPYPKj5fqg5dREqUR5f7wUnPyksHOku7bYBQF91Gq/gaONuyzP2RsSCptH
 wdBW51VVKLskenI/+HJxXMHDjDiY+o5GuxQnybDHTKKucOkkkmbIzoPbh7E/w37F73jzIXimU
 XGiYo9+EpXGHKZBBS0xdYdmrZF+/A6nzaFzf9hzLzaXT6bQVSkszwEAs29YPsCeUgwF8orxPE
 pQtk58QrEVq9yM720iDKhuhn59Q/7qOv93QycNDFoE2z88qSVL4v+TNezU5sJ7tr13/6kKxKL
 FqWSM5FoRbNDLHgxTZcejy0OiYvh59pf3/0bI1Xy0C7WcpRT2Tfxf/FLck1d3ma65IHeVnl+D
 6xA417IPANT/ORfTtYcgjvdojQc4A4S1uZeg/fNOGVBmnz1KGTkxcA79xDL0YdqD0Q8nVEGEE
 LT7c1ld0Oxzg58wR+5r35Cb+5VDsIWe/zZA9QoEvmzZ9njwF9YDOtlzKJNmo8vLab58v7jDRH
 4XOszuHsn8uOivg6y39/c74pFYGxg8bO37H4UUKYngMfNOjU7FXE4gvbRmB0mc7ND3mp64LoS
 vtCgvS4rdEegsQ/Kb8+Y5MNp7LSpMoGWPBQZaX9Zk9AV4iHXmqyn7oOdn1a+uaz3o6FLkwZsx
 fQK8+LxlHTjY59YtD5r+0lYmfaVrH+AU152PB+cSR5a8Xc5QBCHKQ0lN7y1/Ar6/dXMEt9SbA
 v28XMFhrC0hsdVHhBPZqF52ZXuS00BqkaflqrOSYEq8Q+m9gRMKG4Oj2M9D14NCO2eooM+UTw
 0VTlPloWQyHWwyDONZ18ioQOiqXDgqaB6+jPHMyfCxBik=

Am 19.05.24 um 20:26 schrieb Alexis Belmonte:

> Fix a platform profile option switch/getter bug on some Omen and Victus
> laptops dismissing userspace choice when selecting performance mode in
> inadequate conditions (e.g. by being disconnected from the AC power plug=
)
> by
>
>     -  hooking an ACPI notify handler which listens to the \\_SB.ADP1
>        node that propagates battery status events
>
>     -  keeping an intermediate active_platform_profile variable that is
>        set when userspace changes the platform profile setting
>
>     -  restoring the selected platform profile kept in
>        active_platform_profile when AC power is plugged back into the
>        laptop (handled through omen_powersource_notify_handler)
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

Hi,

the commit description is outdated and the changelog for v2 is missing.

> Signed-off-by: Alexis Belmonte <alexbelm48@gmail.com>
> ---
>   drivers/platform/x86/hp/hp-wmi.c | 137 ++++++++++++++++++++++++++++++-
>   1 file changed, 133 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/=
hp-wmi.c
> index 630519c08617..50286128d08a 100644
> --- a/drivers/platform/x86/hp/hp-wmi.c
> +++ b/drivers/platform/x86/hp/hp-wmi.c
> @@ -38,6 +38,7 @@ MODULE_ALIAS("wmi:5FB7F034-2C63-45E9-BE91-3D44E2C707E4=
");
>   #define HPWMI_EVENT_GUID "95F24279-4D7B-4334-9387-ACCDC67EF61C"
>   #define HPWMI_BIOS_GUID "5FB7F034-2C63-45E9-BE91-3D44E2C707E4"
>
> +#define HP_OMEN_EC_POWER_STATUS 0x40
>   #define HP_OMEN_EC_THERMAL_PROFILE_FLAGS_OFFSET 0x62
>   #define HP_OMEN_EC_THERMAL_PROFILE_TIMER_OFFSET 0x63
>   #define HP_OMEN_EC_THERMAL_PROFILE_OFFSET 0x95
> @@ -83,6 +84,11 @@ static const char * const victus_thermal_profile_boar=
ds[] =3D {
>   	"8A25"
>   };
>
> +enum hp_wmi_powersource_flags {
> +	HPWMI_POWERSOURCE_AC_OFFLINE	=3D 0x02,
> +	HPWMI_POWERSOURCE_AC_ONLINE	=3D 0x0b
> +};
> +
>   enum hp_wmi_radio {
>   	HPWMI_WIFI	=3D 0x0,
>   	HPWMI_BLUETOOTH	=3D 0x1,
> @@ -261,8 +267,11 @@ static const struct key_entry hp_wmi_keymap[] =3D {
>
>   static struct input_dev *hp_wmi_input_dev;
>   static struct input_dev *camera_shutter_input_dev;
> +
>   static struct platform_device *hp_wmi_platform_dev;
>   static struct platform_profile_handler platform_profile_handler;
> +static struct notifier_block platform_power_source_nb;
> +static enum platform_profile_option active_platform_profile;
>   static bool platform_profile_support;
>   static bool zero_insize_support;
>
> @@ -1194,8 +1203,7 @@ static int __init hp_wmi_rfkill2_setup(struct plat=
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
> @@ -1223,6 +1231,24 @@ static int platform_profile_omen_get(struct platf=
orm_profile_handler *pprof,
>   	return 0;
>   }
>
> +static int platform_profile_omen_get(struct platform_profile_handler *p=
prof,
> +				     enum platform_profile_option *profile)
> +{
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
> +	 * See also omen_powersource_notify_handler.
> +	 */
> +	return active_platform_profile;
> +}
> +
>   static bool has_omen_thermal_profile_ec_timer(void)
>   {
>   	const char *board_name =3D dmi_get_system_info(DMI_BOARD_NAME);
> @@ -1297,6 +1323,8 @@ static int platform_profile_omen_set(struct platfo=
rm_profile_handler *pprof,
>   			return err;
>   	}
>
> +	active_platform_profile =3D profile;
> +
>   	return 0;
>   }
>
> @@ -1381,8 +1409,8 @@ static bool is_victus_thermal_profile(void)
>   			    board_name) >=3D 0;
>   }
>
> -static int platform_profile_victus_get(struct platform_profile_handler =
*pprof,
> -				     enum platform_profile_option *profile)
> +static int platform_profile_victus_get_ec(
> +	enum platform_profile_option *profile)
>   {
>   	int tp;
>
> @@ -1407,6 +1435,13 @@ static int platform_profile_victus_get(struct pla=
tform_profile_handler *pprof,
>   	return 0;
>   }
>
> +static int platform_profile_victus_get(struct platform_profile_handler =
*pprof,
> +				     enum platform_profile_option *profile)
> +{
> +	/* Same as for platform_profile_omen_get */
> +	return active_platform_profile;
> +}
> +
>   static int platform_profile_victus_set(struct platform_profile_handler=
 *pprof,
>   				     enum platform_profile_option profile)
>   {
> @@ -1430,9 +1465,88 @@ static int platform_profile_victus_set(struct pla=
tform_profile_handler *pprof,
>   	if (err < 0)
>   		return err;
>
> +	active_platform_profile =3D profile;
> +
>   	return 0;
>   }
>
> +static int omen_powersource_notify_handler(struct notifier_block *nb,
> +					   unsigned long value,
> +					   void *data)
> +{
> +	struct acpi_bus_event *event_entry =3D data;
> +	enum platform_profile_option actual_profile;
> +	u8 state;
> +	int err;
> +
> +	if (strcmp(event_entry->device_class, "ac_adapter") !=3D 0)
> +		return NOTIFY_DONE;
> +
> +	pr_debug("Received power source device event\n");
> +
> +	err =3D ec_read(HP_OMEN_EC_POWER_STATUS, &state);

Can you confirm that this will work on all HP Omen/Victus models? If not, =
when maybe
you should instead rely on power_supply_is_system_supplied().

> +	if (err < 0) {
> +		pr_warn("Failed to read power source state (%d)\n", err);
> +		return NOTIFY_BAD;
> +	}
> +
> +	if (is_omen_thermal_profile())
> +		err =3D platform_profile_omen_get_ec(&actual_profile);
> +	else if (is_victus_thermal_profile())
> +		err =3D platform_profile_victus_get_ec(&actual_profile);
> +
> +	if (err < 0) {
> +		pr_warn("Failed to read current platform profile (%d)\n", err);
> +		return NOTIFY_BAD;
> +	}
> +
> +	if (!(state & HPWMI_POWERSOURCE_AC_ONLINE) ||
> +	    active_platform_profile =3D=3D actual_profile)
> +		return NOTIFY_DONE;
> +
> +	err =3D platform_profile_handler.profile_set(&platform_profile_handler=
,
> +						   active_platform_profile);
> +	if (err < 0) {
> +		pr_warn("Failed to restore platform profile (%d)\n", err);
> +		return NOTIFY_BAD;
> +	}

I think you need to implement some type of locking here. Otherwise a user =
can change the selected platform
profile just after active_platform_profile has been read by omen_powersour=
ce_notify_handler(), which will
cause the notify handler to overwrite the newly selected profile.

> +
> +	return NOTIFY_OK;
> +}
> +
> +static void omen_register_powersource_notify_handler(void)
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
> +	platform_power_source_nb.notifier_call =3D omen_powersource_notify_han=
dler;
> +	status =3D register_acpi_notifier(&platform_power_source_nb);
> +
> +	if (ACPI_FAILURE(status))
> +		pr_warn("Failed to install ACPI power source notify handler\n");

Please update the function names.

Thanks,
Armin Wolf

> +}
> +
> +static void hp_wmi_unregister_powersource_notify_handler(void)
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
> @@ -1534,6 +1648,15 @@ static int __init hp_wmi_bios_setup(struct platfo=
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
> +
>   	return 0;
>   }
>
> @@ -1758,6 +1881,9 @@ static int __init hp_wmi_init(void)
>   			goto err_unregister_device;
>   	}
>
> +	if (is_omen_thermal_profile() || is_victus_thermal_profile())
> +		omen_register_powersource_notify_handler();
> +
>   	return 0;
>
>   err_unregister_device:
> @@ -1772,6 +1898,9 @@ module_init(hp_wmi_init);
>
>   static void __exit hp_wmi_exit(void)
>   {
> +	if (is_omen_thermal_profile() || is_victus_thermal_profile())
> +		hp_wmi_unregister_powersource_notify_handler();
> +
>   	if (wmi_has_guid(HPWMI_EVENT_GUID))
>   		hp_wmi_input_destroy();
>
