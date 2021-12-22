Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8AD1C433EF
	for <platform-driver-x86@archiver.kernel.org>; Wed, 22 Dec 2021 23:27:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235575AbhLVX1B (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 22 Dec 2021 18:27:01 -0500
Received: from mga04.intel.com ([192.55.52.120]:58290 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230006AbhLVX1A (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 22 Dec 2021 18:27:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640215620; x=1671751620;
  h=message-id:subject:from:reply-to:to:cc:date:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bB8znHsTjCVe4GJqzQyTh+jC/b+POrhRB22P9Vzw70g=;
  b=akncUFlJeYI+5Ml2ffvBWLQqqbFX94RRVS5TcHQoXkswQR/+lzoqBso/
   BJcqu1W3Fr+Baq0erbhYJOtd6X9+lTej9I3fy6N3CxgowK+3ybf+pF3KL
   8AatJK8jzR5QSGQ9WFG9i0z1xXY+qFLBhPSDe1aJbAV3tSr5yUJJEcuBQ
   y3hLFNYEw/x5oLUcScL/oleDt3ZtmQECn9EdPGUL70AqVdqIhQU5zJtp/
   qRzeEYSLdhIBq7UTarrffdKwDPfNuJySzl9qwkeaue/cakSTZqyJhgYUs
   wIMg1WMgRZlrQe64vv1v65nwAQd6ZeMaTaUcsNiP803egcjuhc2MXKnQK
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10206"; a="239476660"
X-IronPort-AV: E=Sophos;i="5.88,227,1635231600"; 
   d="scan'208";a="239476660"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2021 15:26:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,227,1635231600"; 
   d="scan'208";a="756542923"
Received: from linux.intel.com ([10.54.29.200])
  by fmsmga006.fm.intel.com with ESMTP; 22 Dec 2021 15:26:58 -0800
Received: from debox1-desk1.jf.intel.com (debox1-desk1.jf.intel.com [10.54.75.53])
        by linux.intel.com (Postfix) with ESMTP id 361E25807C5;
        Wed, 22 Dec 2021 15:26:58 -0800 (PST)
Message-ID: <91a8399e9009654e6d014baab41829adf6e3c885.camel@linux.intel.com>
Subject: Re: [PATCH] platform/x86: system76_acpi: Guard System76 EC specific
 functionality
From:   "David E. Box" <david.e.box@linux.intel.com>
Reply-To: david.e.box@linux.intel.com
To:     Tim Crawford <tcrawford@system76.com>,
        platform-driver-x86@vger.kernel.org
Cc:     productdev@system76.com
Date:   Wed, 22 Dec 2021 15:26:58 -0800
In-Reply-To: <20211222185154.4560-1-tcrawford@system76.com>
References: <20211222185154.4560-1-tcrawford@system76.com>
Organization: David E. Box
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On Wed, 2021-12-22 at 11:51 -0700, Tim Crawford wrote:
> Certain functionality or its implementation in System76 EC firmware may
> be different to the proprietary ODM EC firmware. Introduce a new bool,
> `has_open_ec`, to guard our specific logic. Detect the use of this by
> looking for a custom ACPI method name used in System76 firmware.
> 
> Signed-off-by: Tim Crawford <tcrawford@system76.com>
> ---
>  drivers/platform/x86/system76_acpi.c | 58 ++++++++++++++--------------
>  1 file changed, 30 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/platform/x86/system76_acpi.c b/drivers/platform/x86/system76_acpi.c
> index 8b292ee95a14..7299ad08c838 100644
> --- a/drivers/platform/x86/system76_acpi.c
> +++ b/drivers/platform/x86/system76_acpi.c
> @@ -35,6 +35,7 @@ struct system76_data {
>         union acpi_object *nfan;
>         union acpi_object *ntmp;
>         struct input_dev *input;
> +       bool has_open_ec;
>  };
>  
>  static const struct acpi_device_id device_ids[] = {
> @@ -279,20 +280,12 @@ static struct acpi_battery_hook system76_battery_hook = {
>  
>  static void system76_battery_init(void)
>  {
> -       acpi_handle handle;
> -
> -       handle = ec_get_handle();
> -       if (handle && acpi_has_method(handle, "GBCT"))
> -               battery_hook_register(&system76_battery_hook);
> +       battery_hook_register(&system76_battery_hook);
>  }
>  
>  static void system76_battery_exit(void)
>  {
> -       acpi_handle handle;
> -
> -       handle = ec_get_handle();
> -       if (handle && acpi_has_method(handle, "GBCT"))
> -               battery_hook_unregister(&system76_battery_hook);
> +       battery_hook_unregister(&system76_battery_hook);
>  }
>  
>  // Get the airplane mode LED brightness
> @@ -673,6 +666,10 @@ static int system76_add(struct acpi_device *acpi_dev)
>         acpi_dev->driver_data = data;
>         data->acpi_dev = acpi_dev;
>  
> +       // Some models do not run open EC firmware. Check for an ACPI method
> +       // that only exists on open EC to guard functionality specific to it.
> +       data->has_open_ec = acpi_has_method(acpi_device_handle(data->acpi_dev), "NFAN");
> +
>         err = system76_get(data, "INIT");
>         if (err)
>                 return err;
> @@ -718,27 +715,31 @@ static int system76_add(struct acpi_device *acpi_dev)
>         if (err)
>                 goto error;
>  
> -       err = system76_get_object(data, "NFAN", &data->nfan);
> -       if (err)
> -               goto error;
> +       if (data->has_open_ec) {
> +               err = system76_get_object(data, "NFAN", &data->nfan);
> +               if (err)
> +                       goto error;
>  
> -       err = system76_get_object(data, "NTMP", &data->ntmp);
> -       if (err)
> -               goto error;
> +               err = system76_get_object(data, "NTMP", &data->ntmp);
> +               if (err)
> +                       goto error;
>  
> -       data->therm = devm_hwmon_device_register_with_info(&acpi_dev->dev,
> -               "system76_acpi", data, &thermal_chip_info, NULL);
> -       err = PTR_ERR_OR_ZERO(data->therm);
> -       if (err)
> -               goto error;
> +               data->therm = devm_hwmon_device_register_with_info(&acpi_dev->dev,
> +                       "system76_acpi", data, &thermal_chip_info, NULL);
> +               err = PTR_ERR_OR_ZERO(data->therm);
> +               if (err)
> +                       goto error;
>  
> -       system76_battery_init();
> +               system76_battery_init();
> +       }
>  
>         return 0;
>  
>  error:
> -       kfree(data->ntmp);
> -       kfree(data->nfan);
> +       if (data->has_open_ec) {
> +               kfree(data->ntmp);
> +               kfree(data->nfan);
> +       }

It appears that calling system76_battery_(init/exit) depends on has_open_ec. If so would it make
sense to just move the code to those functions (get_objects in init and kfrees in exit)? But I can't
tell if there are other calls.

David

>         return err;
>  }
>  
> @@ -749,14 +750,15 @@ static int system76_remove(struct acpi_device *acpi_dev)
>  
>         data = acpi_driver_data(acpi_dev);
>  
> -       system76_battery_exit();
> +       if (data->has_open_ec) {
> +               system76_battery_exit();
> +               kfree(data->nfan);
> +               kfree(data->ntmp);
> +       }
>  
>         devm_led_classdev_unregister(&acpi_dev->dev, &data->ap_led);
>         devm_led_classdev_unregister(&acpi_dev->dev, &data->kb_led);
>  
> -       kfree(data->nfan);
> -       kfree(data->ntmp);
> -
>         system76_get(data, "FINI");
>  
>         return 0;


