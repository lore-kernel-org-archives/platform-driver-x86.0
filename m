From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH RFT] platform/x86: intel-vbtn: Switch to use devm_input_allocate_device
Date: Sat, 3 Dec 2016 16:05:45 +0200
Message-ID: <CAHp75VePA77J4zh33Mg4zKZqUMgehWs1seAyE-n1w=-dSE7SNg@mail.gmail.com>
References: <1474362084-2670-1-git-send-email-axel.lin@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-oi0-f66.google.com ([209.85.218.66]:36234 "EHLO
        mail-oi0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751987AbcLCOUq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 3 Dec 2016 09:20:46 -0500
Received: by mail-oi0-f66.google.com with SMTP id u15so31082319oie.3
        for <platform-driver-x86@vger.kernel.org>; Sat, 03 Dec 2016 06:20:45 -0800 (PST)
In-Reply-To: <1474362084-2670-1-git-send-email-axel.lin@ingics.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Axel Lin <axel.lin@ingics.com>
Cc: Darren Hart <dvhart@infradead.org>, AceLan Kao <acelan.kao@canonical.com>, platform-driver-x86@vger.kernel.org

On Tue, Sep 20, 2016 at 12:01 PM, Axel Lin <axel.lin@ingics.com> wrote:
> Use devm_input_allocate_device to simplify the error handling code.
> This conversion also makes input_register_device() to be called after
> acpi_remove_notify_handler. This avoid a small window that it's possible
> to call notify_handler after unregister input device.
>
> Signed-off-by: Axel Lin <axel.lin@ingics.com>

Looks good to me.
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> ---
>  drivers/platform/x86/intel-vbtn.c | 33 +++++----------------------------
>  1 file changed, 5 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/platform/x86/intel-vbtn.c b/drivers/platform/x86/intel-vbtn.c
> index f04a394..bd7230a 100644
> --- a/drivers/platform/x86/intel-vbtn.c
> +++ b/drivers/platform/x86/intel-vbtn.c
> @@ -49,34 +49,19 @@ static int intel_vbtn_input_setup(struct platform_device *device)
>         struct intel_vbtn_priv *priv = dev_get_drvdata(&device->dev);
>         int ret;
>
> -       priv->input_dev = input_allocate_device();
> +       priv->input_dev = devm_input_allocate_device(&device->dev);
>         if (!priv->input_dev)
>                 return -ENOMEM;
>
>         ret = sparse_keymap_setup(priv->input_dev, intel_vbtn_keymap, NULL);
>         if (ret)
> -               goto err_free_device;
> +               return ret;
>
>         priv->input_dev->dev.parent = &device->dev;
>         priv->input_dev->name = "Intel Virtual Button driver";
>         priv->input_dev->id.bustype = BUS_HOST;
>
> -       ret = input_register_device(priv->input_dev);
> -       if (ret)
> -               goto err_free_device;
> -
> -       return 0;
> -
> -err_free_device:
> -       input_free_device(priv->input_dev);
> -       return ret;
> -}
> -
> -static void intel_vbtn_input_destroy(struct platform_device *device)
> -{
> -       struct intel_vbtn_priv *priv = dev_get_drvdata(&device->dev);
> -
> -       input_unregister_device(priv->input_dev);
> +       return input_register_device(priv->input_dev);
>  }
>
>  static void notify_handler(acpi_handle handle, u32 event, void *context)
> @@ -117,24 +102,16 @@ static int intel_vbtn_probe(struct platform_device *device)
>                                              ACPI_DEVICE_NOTIFY,
>                                              notify_handler,
>                                              device);
> -       if (ACPI_FAILURE(status)) {
> -               err = -EBUSY;
> -               goto err_remove_input;
> -       }
> +       if (ACPI_FAILURE(status))
> +               return -EBUSY;
>
>         return 0;
> -
> -err_remove_input:
> -       intel_vbtn_input_destroy(device);
> -
> -       return err;
>  }
>
>  static int intel_vbtn_remove(struct platform_device *device)
>  {
>         acpi_handle handle = ACPI_HANDLE(&device->dev);
>
> -       intel_vbtn_input_destroy(device);
>         acpi_remove_notify_handler(handle, ACPI_DEVICE_NOTIFY, notify_handler);
>
>         /*
> --
> 2.7.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe platform-driver-x86" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
With Best Regards,
Andy Shevchenko
