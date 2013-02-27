From: Benson Leung <bleung@chromium.org>
Subject: Re: [PATCH] Platform: x86: chromeos_laptop: make dmi_check_callback
 return 1
Date: Tue, 26 Feb 2013 20:17:56 -0800
Message-ID: <CANLzEksD+-PG6dyZXMNf-a12FOi+=G-SCMEm2tVna5LssJQ_0w@mail.gmail.com>
References: <1361933759.8798.1.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-oa0-f43.google.com ([209.85.219.43]:35421 "EHLO
	mail-oa0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758286Ab3B0ER5 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 26 Feb 2013 23:17:57 -0500
Received: by mail-oa0-f43.google.com with SMTP id l10so307755oag.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 26 Feb 2013 20:17:57 -0800 (PST)
In-Reply-To: <1361933759.8798.1.camel@phoenix>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Axel Lin <axel.lin@ingics.com>
Cc: Matthew Garrett <matthew.garrett@nebula.com>, Yufeng Shen <miletus@chromium.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>

Actually, the way that this table is set up currently, we rely on the
possibility of multiple matches, so it is necessary to go through the
whole thing.

Look carefully at the chromeos_laptop_dmi_table. You'll see that
boards like Link and Lumpy show up multiple times in the table to
instantiate different devices.

Returning 1 will simply stop on the first device it finds in the list.

Benson

On Tue, Feb 26, 2013 at 6:55 PM, Axel Lin <axel.lin@ingics.com> wrote:
> We only care about if there is any successful match from the dmi table
> or no match at all, we can make dmi_check_system return immediately if
> we have a successful match instead of iterate thorough the whole table.
>
> Signed-off-by: Axel Lin <axel.lin@ingics.com>
> ---
>  drivers/platform/x86/chromeos_laptop.c |   14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/platform/x86/chromeos_laptop.c b/drivers/platform/x86/chromeos_laptop.c
> index 93d6680..b6018d4 100644
> --- a/drivers/platform/x86/chromeos_laptop.c
> +++ b/drivers/platform/x86/chromeos_laptop.c
> @@ -207,7 +207,7 @@ static int __init setup_cyapa_smbus_tp(const struct dmi_system_id *id)
>  {
>         /* add cyapa touchpad on smbus */
>         tp = add_smbus_device("trackpad", &cyapa_device);
> -       return 0;
> +       return 1;
>  }
>
>  static int __init setup_atmel_224s_tp(const struct dmi_system_id *id)
> @@ -219,7 +219,7 @@ static int __init setup_atmel_224s_tp(const struct dmi_system_id *id)
>         /* add atmel mxt touchpad on VGA DDC GMBus */
>         tp = add_probed_i2c_device("trackpad", I2C_ADAPTER_VGADDC,
>                                    &atmel_224s_tp_device, addr_list);
> -       return 0;
> +       return 1;
>  }
>
>  static int __init setup_atmel_1664s_ts(const struct dmi_system_id *id)
> @@ -231,7 +231,7 @@ static int __init setup_atmel_1664s_ts(const struct dmi_system_id *id)
>         /* add atmel mxt touch device on PANEL GMBus */
>         ts = add_probed_i2c_device("touchscreen", I2C_ADAPTER_PANEL,
>                                    &atmel_1664s_device, addr_list);
> -       return 0;
> +       return 1;
>  }
>
>
> @@ -239,7 +239,7 @@ static int __init setup_isl29018_als(const struct dmi_system_id *id)
>  {
>         /* add isl29018 light sensor */
>         als = add_smbus_device("lightsensor", &isl_als_device);
> -       return 0;
> +       return 1;
>  }
>
>  static int __init setup_isl29023_als(const struct dmi_system_id *id)
> @@ -247,21 +247,21 @@ static int __init setup_isl29023_als(const struct dmi_system_id *id)
>         /* add isl29023 light sensor on Panel GMBus */
>         als = add_i2c_device("lightsensor", I2C_ADAPTER_PANEL,
>                              &isl_als_device);
> -       return 0;
> +       return 1;
>  }
>
>  static int __init setup_tsl2583_als(const struct dmi_system_id *id)
>  {
>         /* add tsl2583 light sensor on smbus */
>         als = add_smbus_device(NULL, &tsl2583_als_device);
> -       return 0;
> +       return 1;
>  }
>
>  static int __init setup_tsl2563_als(const struct dmi_system_id *id)
>  {
>         /* add tsl2563 light sensor on smbus */
>         als = add_smbus_device(NULL, &tsl2563_als_device);
> -       return 0;
> +       return 1;
>  }
>
>  static struct dmi_system_id __initdata chromeos_laptop_dmi_table[] = {
> --
> 1.7.9.5
>
>
>



--
Benson Leung
Software Engineer, Chrom* OS
bleung@chromium.org

On Tue, Feb 26, 2013 at 6:55 PM, Axel Lin <axel.lin@ingics.com> wrote:
> We only care about if there is any successful match from the dmi table
> or no match at all, we can make dmi_check_system return immediately if
> we have a successful match instead of iterate thorough the whole table.
>
> Signed-off-by: Axel Lin <axel.lin@ingics.com>
> ---
>  drivers/platform/x86/chromeos_laptop.c |   14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/platform/x86/chromeos_laptop.c b/drivers/platform/x86/chromeos_laptop.c
> index 93d6680..b6018d4 100644
> --- a/drivers/platform/x86/chromeos_laptop.c
> +++ b/drivers/platform/x86/chromeos_laptop.c
> @@ -207,7 +207,7 @@ static int __init setup_cyapa_smbus_tp(const struct dmi_system_id *id)
>  {
>         /* add cyapa touchpad on smbus */
>         tp = add_smbus_device("trackpad", &cyapa_device);
> -       return 0;
> +       return 1;
>  }
>
>  static int __init setup_atmel_224s_tp(const struct dmi_system_id *id)
> @@ -219,7 +219,7 @@ static int __init setup_atmel_224s_tp(const struct dmi_system_id *id)
>         /* add atmel mxt touchpad on VGA DDC GMBus */
>         tp = add_probed_i2c_device("trackpad", I2C_ADAPTER_VGADDC,
>                                    &atmel_224s_tp_device, addr_list);
> -       return 0;
> +       return 1;
>  }
>
>  static int __init setup_atmel_1664s_ts(const struct dmi_system_id *id)
> @@ -231,7 +231,7 @@ static int __init setup_atmel_1664s_ts(const struct dmi_system_id *id)
>         /* add atmel mxt touch device on PANEL GMBus */
>         ts = add_probed_i2c_device("touchscreen", I2C_ADAPTER_PANEL,
>                                    &atmel_1664s_device, addr_list);
> -       return 0;
> +       return 1;
>  }
>
>
> @@ -239,7 +239,7 @@ static int __init setup_isl29018_als(const struct dmi_system_id *id)
>  {
>         /* add isl29018 light sensor */
>         als = add_smbus_device("lightsensor", &isl_als_device);
> -       return 0;
> +       return 1;
>  }
>
>  static int __init setup_isl29023_als(const struct dmi_system_id *id)
> @@ -247,21 +247,21 @@ static int __init setup_isl29023_als(const struct dmi_system_id *id)
>         /* add isl29023 light sensor on Panel GMBus */
>         als = add_i2c_device("lightsensor", I2C_ADAPTER_PANEL,
>                              &isl_als_device);
> -       return 0;
> +       return 1;
>  }
>
>  static int __init setup_tsl2583_als(const struct dmi_system_id *id)
>  {
>         /* add tsl2583 light sensor on smbus */
>         als = add_smbus_device(NULL, &tsl2583_als_device);
> -       return 0;
> +       return 1;
>  }
>
>  static int __init setup_tsl2563_als(const struct dmi_system_id *id)
>  {
>         /* add tsl2563 light sensor on smbus */
>         als = add_smbus_device(NULL, &tsl2563_als_device);
> -       return 0;
> +       return 1;
>  }
>
>  static struct dmi_system_id __initdata chromeos_laptop_dmi_table[] = {
> --
> 1.7.9.5
>
>
>



--
Benson Leung
Software Engineer, Chrom* OS
bleung@chromium.org
