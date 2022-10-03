Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FD30C433FE
	for <platform-driver-x86@archiver.kernel.org>; Mon,  3 Oct 2022 11:52:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229611AbiJCLwC (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 3 Oct 2022 07:52:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbiJCLwB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 3 Oct 2022 07:52:01 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D03A233A0E
        for <platform-driver-x86@vger.kernel.org>; Mon,  3 Oct 2022 04:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1664797919;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qMXO5rxoE1keEzdNr2Yi0hbMNwwpip5QiD/cR5C9Hlg=;
        b=LH4aysGwqp6LrdnHENYLy7cyNPOSvYwbJuuloftmeNZaD35rB3pXT9p9cO4GpxGU7JReHb
        J9bI9OqIXG3PSPf4wRUyOuQPas+bAd/JYjP3sPrm5/33WS8bgj+CN8q5zuH35ZiOnmyJxt
        e/u7qHCfx6aPMnR1uY/BrQZwj0C0jBE=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-34-vkAQ9jvhPump5cXdeMWQNg-1; Mon, 03 Oct 2022 07:51:58 -0400
X-MC-Unique: vkAQ9jvhPump5cXdeMWQNg-1
Received: by mail-ed1-f72.google.com with SMTP id dz21-20020a0564021d5500b0045217702048so8528774edb.5
        for <platform-driver-x86@vger.kernel.org>; Mon, 03 Oct 2022 04:51:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=qMXO5rxoE1keEzdNr2Yi0hbMNwwpip5QiD/cR5C9Hlg=;
        b=Unk2ArZRjKTn3WTWokLEHruUqLXOzvCko9hCdK+R43uPXbiyplnniTG/HcJGvJQ3iQ
         7ER+XSFL8kSWzfBFEreqtd4L+Ny1XWqgEJahViQ10u3ZGGzhszT6YJWesEVnNiLK6zkc
         zjDIlIncAxW71JG3iOzE/cyouyacR0w4XPBHFvOgorbdzlNuth8hpIB0raIe/H1QrFsj
         6jvE6YoMSCy7VK6SU8E5V2Nhy3QiPCWUWzofrPBveVwsjkkfjwGSq59Ll4AzSo2PHg80
         A6WKIZ4I2NCIHmFEAVAxRzHmSwkmb9oYYOZZwkYN8wFahu5TxCj5NwTtzZto7pWOedrK
         0HBA==
X-Gm-Message-State: ACrzQf0nSpZ3v0EN4hvendJN6ooY3Gw901mLGqH57wnE7rP2ROZVpOXq
        iu+IeNUtXd/4wLmf/eoBS7yAnn8AJ86NmgaXoohtkuCEY/LyagmdTt3LB+748vXtkYYhpivQVQX
        jfSlHFaRzPzft5arahkH4FvOodhMndw9BnA==
X-Received: by 2002:a17:906:4792:b0:782:c426:621 with SMTP id cw18-20020a170906479200b00782c4260621mr14982992ejc.478.1664797916319;
        Mon, 03 Oct 2022 04:51:56 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6URNn51tSYz9XhJQxIUlm50pNQFxzy7z6i3nWbFENXU5G3RZPdN52AznWai8lKWDYeuwl0iQ==
X-Received: by 2002:a17:906:4792:b0:782:c426:621 with SMTP id cw18-20020a170906479200b00782c4260621mr14982980ejc.478.1664797916047;
        Mon, 03 Oct 2022 04:51:56 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id d2-20020a50f682000000b0044e01e2533asm7375572edn.43.2022.10.03.04.51.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Oct 2022 04:51:55 -0700 (PDT)
Message-ID: <3c273674-197f-4a67-b83c-07c8dfd08718@redhat.com>
Date:   Mon, 3 Oct 2022 13:51:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v1] platform/x86: use PLATFORM_DEVID_NONE instead of -1
Content-Language: en-US
To:     =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>,
        platform-driver-x86@vger.kernel.org,
        Mark Gross <markgross@kernel.org>
References: <20220930104857.2796923-1-pobrn@protonmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220930104857.2796923-1-pobrn@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/30/22 12:59, Barnabás Pőcze wrote:
> Use the `PLATFORM_DEVID_NONE` constant instead of
> hard-coding -1 when creating a platform device.
> 
> No functional changes are intended.
> 
> Signed-off-by: Barnabás Pőcze <pobrn@protonmail.com>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans


> ---
> Since this is a trivial change, I did not CC
> the driver maintainers separately. I can send
> a new version if that is deemed necessary.
> 
>  drivers/platform/x86/acer-wmi.c           | 2 +-
>  drivers/platform/x86/acerhdf.c            | 2 +-
>  drivers/platform/x86/amd/hsmp.c           | 2 +-
>  drivers/platform/x86/amilo-rfkill.c       | 3 ++-
>  drivers/platform/x86/asus-laptop.c        | 2 +-
>  drivers/platform/x86/compal-laptop.c      | 2 +-
>  drivers/platform/x86/dell/alienware-wmi.c | 2 +-
>  drivers/platform/x86/dell/dcdbas.c        | 2 +-
>  drivers/platform/x86/dell/dell-laptop.c   | 2 +-
>  drivers/platform/x86/dell/dell_rbu.c      | 2 +-
>  drivers/platform/x86/eeepc-laptop.c       | 2 +-
>  drivers/platform/x86/fujitsu-laptop.c     | 2 +-
>  drivers/platform/x86/hdaps.c              | 2 +-
>  drivers/platform/x86/hp-wmi.c             | 2 +-
>  drivers/platform/x86/huawei-wmi.c         | 2 +-
>  drivers/platform/x86/intel/oaktrail.c     | 2 +-
>  drivers/platform/x86/mlx-platform.c       | 2 +-
>  drivers/platform/x86/msi-laptop.c         | 2 +-
>  drivers/platform/x86/panasonic-laptop.c   | 2 +-
>  drivers/platform/x86/samsung-laptop.c     | 2 +-
>  drivers/platform/x86/sony-laptop.c        | 2 +-
>  drivers/platform/x86/tc1100-wmi.c         | 2 +-
>  drivers/platform/x86/thinkpad_acpi.c      | 4 ++--
>  drivers/platform/x86/topstar-laptop.c     | 2 +-
>  drivers/platform/x86/winmate-fm07-keys.c  | 2 +-
>  25 files changed, 27 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
> index 9610742fe6aa..18224f9a5bc0 100644
> --- a/drivers/platform/x86/acer-wmi.c
> +++ b/drivers/platform/x86/acer-wmi.c
> @@ -2463,7 +2463,7 @@ static int __init acer_wmi_init(void)
>  		goto error_platform_register;
>  	}
> 
> -	acer_platform_device = platform_device_alloc("acer-wmi", -1);
> +	acer_platform_device = platform_device_alloc("acer-wmi", PLATFORM_DEVID_NONE);
>  	if (!acer_platform_device) {
>  		err = -ENOMEM;
>  		goto error_device_alloc;
> diff --git a/drivers/platform/x86/acerhdf.c b/drivers/platform/x86/acerhdf.c
> index 3463629f8764..d2c0fc38c201 100644
> --- a/drivers/platform/x86/acerhdf.c
> +++ b/drivers/platform/x86/acerhdf.c
> @@ -676,7 +676,7 @@ static int __init acerhdf_register_platform(void)
>  	if (err)
>  		return err;
> 
> -	acerhdf_dev = platform_device_alloc("acerhdf", -1);
> +	acerhdf_dev = platform_device_alloc("acerhdf", PLATFORM_DEVID_NONE);
>  	if (!acerhdf_dev) {
>  		err = -ENOMEM;
>  		goto err_device_alloc;
> diff --git a/drivers/platform/x86/amd/hsmp.c b/drivers/platform/x86/amd/hsmp.c
> index a0c54b838c11..521c6a229362 100644
> --- a/drivers/platform/x86/amd/hsmp.c
> +++ b/drivers/platform/x86/amd/hsmp.c
> @@ -392,7 +392,7 @@ static int __init hsmp_plt_init(void)
>  	if (ret)
>  		return ret;
> 
> -	amd_hsmp_platdev = platform_device_alloc(DRIVER_NAME, -1);
> +	amd_hsmp_platdev = platform_device_alloc(DRIVER_NAME, PLATFORM_DEVID_NONE);
>  	if (!amd_hsmp_platdev) {
>  		ret = -ENOMEM;
>  		goto drv_unregister;
> diff --git a/drivers/platform/x86/amilo-rfkill.c b/drivers/platform/x86/amilo-rfkill.c
> index 493e169c8f61..3e313c4d538d 100644
> --- a/drivers/platform/x86/amilo-rfkill.c
> +++ b/drivers/platform/x86/amilo-rfkill.c
> @@ -150,7 +150,8 @@ static int __init amilo_rfkill_init(void)
>  	if (rc)
>  		return rc;
> 
> -	amilo_rfkill_pdev = platform_device_register_simple(KBUILD_MODNAME, -1,
> +	amilo_rfkill_pdev = platform_device_register_simple(KBUILD_MODNAME,
> +							    PLATFORM_DEVID_NONE,
>  							    NULL, 0);
>  	if (IS_ERR(amilo_rfkill_pdev)) {
>  		rc = PTR_ERR(amilo_rfkill_pdev);
> diff --git a/drivers/platform/x86/asus-laptop.c b/drivers/platform/x86/asus-laptop.c
> index 4d2d32bfbe2a..47b2f8bb6fb5 100644
> --- a/drivers/platform/x86/asus-laptop.c
> +++ b/drivers/platform/x86/asus-laptop.c
> @@ -1633,7 +1633,7 @@ static int asus_platform_init(struct asus_laptop *asus)
>  {
>  	int result;
> 
> -	asus->platform_device = platform_device_alloc(ASUS_LAPTOP_FILE, -1);
> +	asus->platform_device = platform_device_alloc(ASUS_LAPTOP_FILE, PLATFORM_DEVID_NONE);
>  	if (!asus->platform_device)
>  		return -ENOMEM;
>  	platform_set_drvdata(asus->platform_device, asus);
> diff --git a/drivers/platform/x86/compal-laptop.c b/drivers/platform/x86/compal-laptop.c
> index 72e1523edd31..e10d2f64dfad 100644
> --- a/drivers/platform/x86/compal-laptop.c
> +++ b/drivers/platform/x86/compal-laptop.c
> @@ -1060,7 +1060,7 @@ static int __init compal_init(void)
>  	if (ret)
>  		goto err_backlight;
> 
> -	compal_device = platform_device_alloc(DRIVER_NAME, -1);
> +	compal_device = platform_device_alloc(DRIVER_NAME, PLATFORM_DEVID_NONE);
>  	if (!compal_device) {
>  		ret = -ENOMEM;
>  		goto err_platform_driver;
> diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platform/x86/dell/alienware-wmi.c
> index f21248255529..a34e07ef2c79 100644
> --- a/drivers/platform/x86/dell/alienware-wmi.c
> +++ b/drivers/platform/x86/dell/alienware-wmi.c
> @@ -791,7 +791,7 @@ static int __init alienware_wmi_init(void)
>  	ret = platform_driver_register(&platform_driver);
>  	if (ret)
>  		goto fail_platform_driver;
> -	platform_device = platform_device_alloc("alienware-wmi", -1);
> +	platform_device = platform_device_alloc("alienware-wmi", PLATFORM_DEVID_NONE);
>  	if (!platform_device) {
>  		ret = -ENOMEM;
>  		goto fail_platform_device1;
> diff --git a/drivers/platform/x86/dell/dcdbas.c b/drivers/platform/x86/dell/dcdbas.c
> index 42beafbc54b2..0ecb7b164750 100644
> --- a/drivers/platform/x86/dell/dcdbas.c
> +++ b/drivers/platform/x86/dell/dcdbas.c
> @@ -716,7 +716,7 @@ static struct platform_driver dcdbas_driver = {
> 
>  static const struct platform_device_info dcdbas_dev_info __initconst = {
>  	.name		= DRIVER_NAME,
> -	.id		= -1,
> +	.id		= PLATFORM_DEVID_NONE,
>  	.dma_mask	= DMA_BIT_MASK(32),
>  };
> 
> diff --git a/drivers/platform/x86/dell/dell-laptop.c b/drivers/platform/x86/dell/dell-laptop.c
> index 1321687d923e..e92c3ad06d69 100644
> --- a/drivers/platform/x86/dell/dell-laptop.c
> +++ b/drivers/platform/x86/dell/dell-laptop.c
> @@ -2193,7 +2193,7 @@ static int __init dell_init(void)
>  	ret = platform_driver_register(&platform_driver);
>  	if (ret)
>  		goto fail_platform_driver;
> -	platform_device = platform_device_alloc("dell-laptop", -1);
> +	platform_device = platform_device_alloc("dell-laptop", PLATFORM_DEVID_NONE);
>  	if (!platform_device) {
>  		ret = -ENOMEM;
>  		goto fail_platform_device1;
> diff --git a/drivers/platform/x86/dell/dell_rbu.c b/drivers/platform/x86/dell/dell_rbu.c
> index e9f4b30dcafa..9f51e0fcab04 100644
> --- a/drivers/platform/x86/dell/dell_rbu.c
> +++ b/drivers/platform/x86/dell/dell_rbu.c
> @@ -645,7 +645,7 @@ static int __init dcdrbu_init(void)
>  	spin_lock_init(&rbu_data.lock);
> 
>  	init_packet_head();
> -	rbu_device = platform_device_register_simple("dell_rbu", -1, NULL, 0);
> +	rbu_device = platform_device_register_simple("dell_rbu", PLATFORM_DEVID_NONE, NULL, 0);
>  	if (IS_ERR(rbu_device)) {
>  		pr_err("platform_device_register_simple failed\n");
>  		return PTR_ERR(rbu_device);
> diff --git a/drivers/platform/x86/eeepc-laptop.c b/drivers/platform/x86/eeepc-laptop.c
> index ba08c9235f76..a388a28b6f2a 100644
> --- a/drivers/platform/x86/eeepc-laptop.c
> +++ b/drivers/platform/x86/eeepc-laptop.c
> @@ -444,7 +444,7 @@ static int eeepc_platform_init(struct eeepc_laptop *eeepc)
>  {
>  	int result;
> 
> -	eeepc->platform_device = platform_device_alloc(EEEPC_LAPTOP_FILE, -1);
> +	eeepc->platform_device = platform_device_alloc(EEEPC_LAPTOP_FILE, PLATFORM_DEVID_NONE);
>  	if (!eeepc->platform_device)
>  		return -ENOMEM;
>  	platform_set_drvdata(eeepc->platform_device, eeepc);
> diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
> index 80929380ec7e..b543d117b12c 100644
> --- a/drivers/platform/x86/fujitsu-laptop.c
> +++ b/drivers/platform/x86/fujitsu-laptop.c
> @@ -543,7 +543,7 @@ static int fujitsu_laptop_platform_add(struct acpi_device *device)
>  	struct fujitsu_laptop *priv = acpi_driver_data(device);
>  	int ret;
> 
> -	priv->pf_device = platform_device_alloc("fujitsu-laptop", -1);
> +	priv->pf_device = platform_device_alloc("fujitsu-laptop", PLATFORM_DEVID_NONE);
>  	if (!priv->pf_device)
>  		return -ENOMEM;
> 
> diff --git a/drivers/platform/x86/hdaps.c b/drivers/platform/x86/hdaps.c
> index 9996485f5295..f11f726d2062 100644
> --- a/drivers/platform/x86/hdaps.c
> +++ b/drivers/platform/x86/hdaps.c
> @@ -547,7 +547,7 @@ static int __init hdaps_init(void)
>  	if (ret)
>  		goto out_region;
> 
> -	pdev = platform_device_register_simple("hdaps", -1, NULL, 0);
> +	pdev = platform_device_register_simple("hdaps", PLATFORM_DEVID_NONE, NULL, 0);
>  	if (IS_ERR(pdev)) {
>  		ret = PTR_ERR(pdev);
>  		goto out_driver;
> diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
> index da0d25c67e57..627a6d0eaf83 100644
> --- a/drivers/platform/x86/hp-wmi.c
> +++ b/drivers/platform/x86/hp-wmi.c
> @@ -1519,7 +1519,7 @@ static int __init hp_wmi_init(void)
> 
>  	if (bios_capable) {
>  		hp_wmi_platform_dev =
> -			platform_device_register_simple("hp-wmi", -1, NULL, 0);
> +			platform_device_register_simple("hp-wmi", PLATFORM_DEVID_NONE, NULL, 0);
>  		if (IS_ERR(hp_wmi_platform_dev)) {
>  			err = PTR_ERR(hp_wmi_platform_dev);
>  			goto err_destroy_input;
> diff --git a/drivers/platform/x86/huawei-wmi.c b/drivers/platform/x86/huawei-wmi.c
> index eac3e6b4ea11..5873c2663a65 100644
> --- a/drivers/platform/x86/huawei-wmi.c
> +++ b/drivers/platform/x86/huawei-wmi.c
> @@ -871,7 +871,7 @@ static __init int huawei_wmi_init(void)
>  	if (err)
>  		goto pdrv_err;
> 
> -	pdev = platform_device_register_simple("huawei-wmi", -1, NULL, 0);
> +	pdev = platform_device_register_simple("huawei-wmi", PLATFORM_DEVID_NONE, NULL, 0);
>  	if (IS_ERR(pdev)) {
>  		err = PTR_ERR(pdev);
>  		goto pdev_err;
> diff --git a/drivers/platform/x86/intel/oaktrail.c b/drivers/platform/x86/intel/oaktrail.c
> index 1a09a75bd16d..7c5c623630c1 100644
> --- a/drivers/platform/x86/intel/oaktrail.c
> +++ b/drivers/platform/x86/intel/oaktrail.c
> @@ -317,7 +317,7 @@ static int __init oaktrail_init(void)
>  		goto err_driver_reg;
>  	}
> 
> -	oaktrail_device = platform_device_alloc(DRIVER_NAME, -1);
> +	oaktrail_device = platform_device_alloc(DRIVER_NAME, PLATFORM_DEVID_NONE);
>  	if (!oaktrail_device) {
>  		pr_warn("Unable to allocate platform device\n");
>  		ret = -ENOMEM;
> diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
> index 5e072a0666f4..2fac05a17a5c 100644
> --- a/drivers/platform/x86/mlx-platform.c
> +++ b/drivers/platform/x86/mlx-platform.c
> @@ -5181,7 +5181,7 @@ static int __init mlxplat_init(void)
>  	if (!dmi_check_system(mlxplat_dmi_table))
>  		return -ENODEV;
> 
> -	mlxplat_dev = platform_device_register_simple(MLX_PLAT_DEVICE_NAME, -1,
> +	mlxplat_dev = platform_device_register_simple(MLX_PLAT_DEVICE_NAME, PLATFORM_DEVID_NONE,
>  					mlxplat_lpc_resources,
>  					ARRAY_SIZE(mlxplat_lpc_resources));
> 
> diff --git a/drivers/platform/x86/msi-laptop.c b/drivers/platform/x86/msi-laptop.c
> index 2f850396e9a7..6b18ec543ac3 100644
> --- a/drivers/platform/x86/msi-laptop.c
> +++ b/drivers/platform/x86/msi-laptop.c
> @@ -1066,7 +1066,7 @@ static int __init msi_init(void)
> 
>  	/* Register platform stuff */
> 
> -	msipf_device = platform_device_alloc("msi-laptop-pf", -1);
> +	msipf_device = platform_device_alloc("msi-laptop-pf", PLATFORM_DEVID_NONE);
>  	if (!msipf_device) {
>  		ret = -ENOMEM;
>  		goto fail_platform_driver;
> diff --git a/drivers/platform/x86/panasonic-laptop.c b/drivers/platform/x86/panasonic-laptop.c
> index d9a095d2c0eb..ad3083f9946d 100644
> --- a/drivers/platform/x86/panasonic-laptop.c
> +++ b/drivers/platform/x86/panasonic-laptop.c
> @@ -1034,7 +1034,7 @@ static int acpi_pcc_hotkey_add(struct acpi_device *device)
>  	/* optical drive initialization */
>  	if (ACPI_SUCCESS(check_optd_present())) {
>  		pcc->platform = platform_device_register_simple("panasonic",
> -			-1, NULL, 0);
> +			PLATFORM_DEVID_NONE, NULL, 0);
>  		if (IS_ERR(pcc->platform)) {
>  			result = PTR_ERR(pcc->platform);
>  			goto out_backlight;
> diff --git a/drivers/platform/x86/samsung-laptop.c b/drivers/platform/x86/samsung-laptop.c
> index cc30cf08f32d..b4aa8ba35d2d 100644
> --- a/drivers/platform/x86/samsung-laptop.c
> +++ b/drivers/platform/x86/samsung-laptop.c
> @@ -1474,7 +1474,7 @@ static int __init samsung_platform_init(struct samsung_laptop *samsung)
>  {
>  	struct platform_device *pdev;
> 
> -	pdev = platform_device_register_simple("samsung", -1, NULL, 0);
> +	pdev = platform_device_register_simple("samsung", PLATFORM_DEVID_NONE, NULL, 0);
>  	if (IS_ERR(pdev))
>  		return PTR_ERR(pdev);
> 
> diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
> index 07ef05f727a2..765fcaba4d12 100644
> --- a/drivers/platform/x86/sony-laptop.c
> +++ b/drivers/platform/x86/sony-laptop.c
> @@ -584,7 +584,7 @@ static int sony_pf_add(void)
>  	if (ret)
>  		goto out;
> 
> -	sony_pf_device = platform_device_alloc("sony-laptop", -1);
> +	sony_pf_device = platform_device_alloc("sony-laptop", PLATFORM_DEVID_NONE);
>  	if (!sony_pf_device) {
>  		ret = -ENOMEM;
>  		goto out_platform_registered;
> diff --git a/drivers/platform/x86/tc1100-wmi.c b/drivers/platform/x86/tc1100-wmi.c
> index 9072eb302618..ded26213c420 100644
> --- a/drivers/platform/x86/tc1100-wmi.c
> +++ b/drivers/platform/x86/tc1100-wmi.c
> @@ -233,7 +233,7 @@ static int __init tc1100_init(void)
>  	if (!wmi_has_guid(GUID))
>  		return -ENODEV;
> 
> -	tc1100_device = platform_device_alloc("tc1100-wmi", -1);
> +	tc1100_device = platform_device_alloc("tc1100-wmi", PLATFORM_DEVID_NONE);
>  	if (!tc1100_device)
>  		return -ENOMEM;
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 8fbe21ebcc52..6a823b850a77 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -11715,7 +11715,7 @@ static int __init thinkpad_acpi_module_init(void)
>  		tp_features.quirks = dmi_id->driver_data;
> 
>  	/* Device initialization */
> -	tpacpi_pdev = platform_device_register_simple(TPACPI_DRVR_NAME, -1,
> +	tpacpi_pdev = platform_device_register_simple(TPACPI_DRVR_NAME, PLATFORM_DEVID_NONE,
>  							NULL, 0);
>  	if (IS_ERR(tpacpi_pdev)) {
>  		ret = PTR_ERR(tpacpi_pdev);
> @@ -11726,7 +11726,7 @@ static int __init thinkpad_acpi_module_init(void)
>  	}
>  	tpacpi_sensors_pdev = platform_device_register_simple(
>  						TPACPI_HWMON_DRVR_NAME,
> -						-1, NULL, 0);
> +						PLATFORM_DEVID_NONE, NULL, 0);
>  	if (IS_ERR(tpacpi_sensors_pdev)) {
>  		ret = PTR_ERR(tpacpi_sensors_pdev);
>  		tpacpi_sensors_pdev = NULL;
> diff --git a/drivers/platform/x86/topstar-laptop.c b/drivers/platform/x86/topstar-laptop.c
> index f7761d98c0fd..6d18fbf8762b 100644
> --- a/drivers/platform/x86/topstar-laptop.c
> +++ b/drivers/platform/x86/topstar-laptop.c
> @@ -192,7 +192,7 @@ static int topstar_platform_init(struct topstar_laptop *topstar)
>  {
>  	int err;
> 
> -	topstar->platform = platform_device_alloc(TOPSTAR_LAPTOP_CLASS, -1);
> +	topstar->platform = platform_device_alloc(TOPSTAR_LAPTOP_CLASS, PLATFORM_DEVID_NONE);
>  	if (!topstar->platform)
>  		return -ENOMEM;
> 
> diff --git a/drivers/platform/x86/winmate-fm07-keys.c b/drivers/platform/x86/winmate-fm07-keys.c
> index 2c90c5c7eca2..465ffad81a65 100644
> --- a/drivers/platform/x86/winmate-fm07-keys.c
> +++ b/drivers/platform/x86/winmate-fm07-keys.c
> @@ -161,7 +161,7 @@ static int __init fm07keys_init(void)
>  		return ret;
>  	}
> 
> -	dev = platform_device_register_simple(DRV_NAME, -1, NULL, 0);
> +	dev = platform_device_register_simple(DRV_NAME, PLATFORM_DEVID_NONE, NULL, 0);
>  	if (IS_ERR(dev)) {
>  		ret = PTR_ERR(dev);
>  		pr_err("fm07keys: failed to allocate device, err = %d\n", ret);
> --
> 2.37.3
> 
> 

