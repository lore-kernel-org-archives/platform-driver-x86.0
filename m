Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1FE74D112
	for <platform-driver-x86@vger.kernel.org>; Sun, 19 May 2024 16:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716137338; cv=none; b=kzmF85ARjcQjZma1hrqvdHRMkWonDs1t/7PJETau3U8hpdl+lNXZGVYP5rM2kgfBwNKp6B4S4nDfSpD7ROPNDk7BCHHSlcywXyjcCR0PUXdRuAF8cUc8a7KfFQM8R9R/PJHfc4lf+mSyR2cqOX30hotvZSQ/RDJ2a62HbnhUETQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716137338; c=relaxed/simple;
	bh=p/8Z5e/1YJIhrP3ujiZcOyG+V72DMEpAG+rrP6iom40=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V2aFaJ92G0P2J4R9qgg4JqUvHrnh/HvxMWAelDhpDWMP7pY3i5RanEfvNp7w8U8V4Wol+6nL8jkcpjj45ZFaRIyc//J223BfMa4CDh8593/dE3WcqzKBTROwevCbycuAdQnt2iZgNFFJICho7+OGV6VsLVC7NrB0/3WUX2RcGjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=UsJ9K3/v; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="UsJ9K3/v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1716137327; x=1716742127; i=w_armin@gmx.de;
	bh=ycDjTgF3z6qWgU93wKTH4HVxR28Mk7ni4cN8cEm23I0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=UsJ9K3/vJ+1NZJs6QZHD/ScaN2BvbVufiKNsymzhywdXYP2uMGiCigFC5aKHx2E5
	 ZTHUmVpLu8IaRVm9vFN5eP0qJNwKCQhOJN/+aAUyld1wdHa6Bi0RzvV7jEW+SXcaz
	 PoJJUWeXgQv6IiRqlJVDPu2VIQIrn9lwas4OUm7Cw5XSVga2F64+npJ1mZCwPEzvC
	 Lm3KuE6rrZ7dFE/vkiB+oD6SYXMhOHT6I06EGAdMNE9dljaoOArXeNLiqHLuWXSkd
	 8P9XD+hV98CgsHZBEZ6wEq4AJ3HvKzhb3eosCAo96sldZtEdH1EzfJD38b5IMuFTn
	 EbR1tgLKSYkMudrd6Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [141.30.226.129] ([141.30.226.129]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M26rD-1s6nlm04fB-002WPI; Sun, 19
 May 2024 18:48:47 +0200
Message-ID: <f096e4a8-4368-4cb2-9787-2903775e5879@gmx.de>
Date: Sun, 19 May 2024 18:48:45 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: hp-wmi: Fix platform profile option switch
 bug on Omen and Victus laptops
To: Alexis Belmonte <alexbelm48@gmail.com>, ilpo.jarvinen@linux.intel.com,
 hdegoede@redhat.com
Cc: platform-driver-x86@vger.kernel.org
References: <ZkokSy2hKU8xysQJ@alexis-pc>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <ZkokSy2hKU8xysQJ@alexis-pc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:xt/0D1GTyRs4+Lqd6jfCCheNVDo88+6DbuFbEyWvCgsm6x/9qK3
 pNFDmZf825PReyKSsPmAxumX3Js/px9dJviRnm/uF11TErQsGnLkd6Vl++so2uEInA9nyh2
 PpExK2iDUYXsKqTCTcBv1HIBI2kzk5AHJRMNp+w7GRJYC05QUms8t+b6h/JoCYn6jc6RgzP
 xJhGyb88KliuzJqaJr+zQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:q1whUEUVSUg=;avTEfGaJXYBxtGuNA5x7Lgif5WV
 durA/cnFIdPTqW6T1JixSh0iRff1rO/BnBOuhBB1dQwCO19mt1FqewzNNXoLgr+H+8NdSzpJf
 CNj8mJHc9gjNlw8BRHii84P8Uuz0020G+5JCnGs2GBabKJDhBCHrImR5FTqab/N27rmHBmoTW
 Bp80PS+LEzhUDQ+ADdsZuWUpjBOXcm/8Wz/6fLmB2INY52ceICX8XftqR5qFE4NLccB4IyAYy
 s9RyHvhRNML8/uTpaKZ4Cn/xKycesqhRqkTO6qS+MGvCIZjU4+Vez1LJIeFz+Jpeq0QJnAQN2
 3IeYSEOnf/nFupM82kAUhpp9UyIcdl1MkcgdCv+QT0meN6GSWFYN38Fp9kj7IU2fUpFcGpsNT
 s2VQABq+0yFt/zremCgQ3Jdjhc1oldrkFm1F5AQvdv7R6apxo7O0VC93Pd2z0oGcrqDdydJmw
 NseQwKRoj7Gan88INYDgpb3B+I5WdEIBmP0DMtWL8XStRcKU9xnu0MjpXmHzQ+yeh0guzL4yv
 Kgv3cJggi8AYeTXP0SqdfyX+ryyixld171YnKK9/VgRo7IP8gxXW7sq/zFdAtkI6AuvX6kNkM
 0rmUMm8DJjI+pGqKfcyJUnPT3AyONDoqj8vx9ZFS9VX5C5Cf9UWUXM+ddh7els6K404HvRrgV
 lwLqb/YFcKiQ/+cvWDP8hAnD78fhjIiEgQOwEjhy0dmxVyEL6x4t48QgeSDyAH0P0VnasJiC/
 TBycp/NNebpGfjmM4GsbB0L34GuYZ5oya7bDY8y1tnW87/vdPhrVuJN4s02Khqk8lCgN/Boiu
 RuOgYHAdwJKViha2H5WWzDOTgHLB+OLVgLYVQBuJGJoVA=

Am 19.05.24 um 18:09 schrieb Alexis Belmonte:

> Fix a platform profile option switch/getter bug on some Omen and Victus =
laptops
> dismissing userspace choice when selecting performance mode in inadequat=
e
> conditions (e.g. by being disconnected from the AC power plug) by
>
>     -  hooking an ACPI notify handler which listens to the \\_SB.ADP1
>        node that propagates battery status events

Hi,

i think registering an this ACPI notify handler will override the original
ACPI notify handler used by the ac.c driver.

Please use register_acpi_notifier()/unregister_acpi_notifier() to receive =
events
from the power supply. You can use the function amdgpu_acpi_event() as an =
example
for reacting to AC status changes.

Also, can you send me the output of "acpidump" on a affected device?

Thanks,
Armin Wolf

>
>     -  keeping an intermediate active_platform_profile variable that is
>        set when userspace changes the platform profile setting
>
>     -  restoring the selected platform profile kept in
>        active_platform_profile when AC power is plugged back into the
>        laptop (handled through omen_powersource_notify_handler)
>
> This ensures that the driver follows the principles defined in the Platf=
orm
> Profile Selection page of the Kernel documentation on those kind of
> laptops; which is to not "(...) let userspace know about any sub-optimal
> conditions which are impeding reaching the requested performance level".
>
> Since the Omen and Victus laptops share the same embedded controller
> system, the fix is applicable to both categories of laptops.
>
> Signed-off-by: Alexis Belmonte <alexbelm48@gmail.com>
> ---
>   drivers/platform/x86/hp/hp-wmi.c | 162 ++++++++++++++++++++++++++++++-
>   1 file changed, 158 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/=
hp-wmi.c
> index 630519c08617..2b3b9851e898 100644
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
> @@ -83,6 +84,13 @@ static const char * const victus_thermal_profile_boar=
ds[] =3D {
>   	"8A25"
>   };
>
> +static const char HPWMI_ACPOWER_NODE[] =3D "\\_SB.ADP1";
> +
> +enum hp_wmi_powersource_flags {
> +	HPWMI_POWERSOURCE_AC_OFFLINE	=3D 0x02,
> +	HPWMI_POWERSOURCE_AC_ONLINE	=3D 0x0b
> +};
> +
>   enum hp_wmi_radio {
>   	HPWMI_WIFI	=3D 0x0,
>   	HPWMI_BLUETOOTH	=3D 0x1,
> @@ -263,6 +271,7 @@ static struct input_dev *hp_wmi_input_dev;
>   static struct input_dev *camera_shutter_input_dev;
>   static struct platform_device *hp_wmi_platform_dev;
>   static struct platform_profile_handler platform_profile_handler;
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
> @@ -1430,9 +1465,113 @@ static int platform_profile_victus_set(struct pl=
atform_profile_handler *pprof,
>   	if (err < 0)
>   		return err;
>
> +	active_platform_profile =3D profile;
> +
>   	return 0;
>   }
>
> +
> +static void omen_powersource_notify_handler(acpi_handle handle, u32 eve=
nt,
> +					    void *context)
> +{
> +	enum platform_profile_option *active_profile =3D context;
> +	enum platform_profile_option actual_profile;
> +	u8 state;
> +	int err;
> +
> +	if (event !=3D 0x80)
> +		return;
> +
> +	pr_debug("Received power source device event\n");
> +
> +	err =3D ec_read(HP_OMEN_EC_POWER_STATUS, &state);
> +	if (err < 0) {
> +		pr_warn("Failed to read power source state (%d)\n", err);
> +		return;
> +	}
> +
> +	if (is_omen_thermal_profile())
> +		err =3D platform_profile_omen_get_ec(&actual_profile);
> +	else if (is_victus_thermal_profile())
> +		err =3D platform_profile_victus_get_ec(&actual_profile);
> +
> +	if (err < 0) {
> +		pr_warn("Failed to read current platform profile (%d)\n", err);
> +		return;
> +	}
> +
> +	if (!(state & HPWMI_POWERSOURCE_AC_ONLINE) ||
> +	    *active_profile =3D=3D PLATFORM_PROFILE_PERFORMANCE)
> +		return;
> +
> +	err =3D platform_profile_handler.profile_set(&platform_profile_handler=
,
> +						   active_platform_profile);
> +	if (err < 0)
> +		pr_warn("Failed to restore platform profile (%d)\n", err);
> +}
> +
> +static void omen_register_powersource_notify_handler(void)
> +{
> +	int err;
> +	acpi_status status;
> +	acpi_handle handle;
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
> +	status =3D acpi_get_handle(NULL, HPWMI_ACPOWER_NODE, &handle);
> +
> +	/*
> +	 * It's preferrable to use pr_debug() here, as most machines allow to
> +	 * set the performance power profile anyway, even if the AC adapter is
> +	 * not plugged in.
> +	 *
> +	 * However, some Omen/Victus configurations may not allow to set the
> +	 * performance power profile in such conditions. In the event that thi=
s
> +	 * fails, we'll ask the bug reporter to load the module with dyndbg=3D=
+p.
> +	 */
> +	if (ACPI_FAILURE(status)) {
> +		pr_debug("Cannot find ACPI handle for '%s', won't be able to restore =
the power profile\n",
> +			 HPWMI_ACPOWER_NODE);
> +		return;
> +	}
> +
> +	status =3D acpi_install_notify_handler(handle,
> +					     ACPI_DEVICE_NOTIFY,
> +					     omen_powersource_notify_handler,
> +					     &active_platform_profile);
> +
> +	if (ACPI_FAILURE(status))
> +		pr_warn("Failed to install ACPI notify handler for '%s'\n",
> +			HPWMI_ACPOWER_NODE);
> +}
> +
> +static void hp_wmi_unregister_powersource_notify_handler(void)
> +{
> +	acpi_status status;
> +	acpi_handle handle;
> +
> +	status =3D acpi_get_handle(NULL, HPWMI_ACPOWER_NODE, &handle);
> +
> +	if (ACPI_FAILURE(status))
> +		return;
> +
> +	status =3D acpi_remove_notify_handler(handle,
> +					    ACPI_DEVICE_NOTIFY,
> +					    omen_powersource_notify_handler);
> +
> +	if (ACPI_FAILURE(status))
> +		pr_err("Failed to remove ACPI notify handler for '%s'\n",
> +		       HPWMI_ACPOWER_NODE);
> +}
>   static int thermal_profile_setup(void)
>   {
>   	int err, tp;
> @@ -1534,6 +1673,15 @@ static int __init hp_wmi_bios_setup(struct platfo=
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
> @@ -1758,6 +1906,9 @@ static int __init hp_wmi_init(void)
>   			goto err_unregister_device;
>   	}
>
> +	if (is_omen_thermal_profile() || is_victus_thermal_profile())
> +		omen_register_powersource_notify_handler();
> +
>   	return 0;
>
>   err_unregister_device:
> @@ -1772,6 +1923,9 @@ module_init(hp_wmi_init);
>
>   static void __exit hp_wmi_exit(void)
>   {
> +	if (is_omen_thermal_profile() || is_victus_thermal_profile())
> +		hp_wmi_unregister_powersource_notify_handler();
> +
>   	if (wmi_has_guid(HPWMI_EVENT_GUID))
>   		hp_wmi_input_destroy();
>
