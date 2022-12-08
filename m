Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56CF6C4332F
	for <platform-driver-x86@archiver.kernel.org>; Thu,  8 Dec 2022 10:55:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229781AbiLHKzI (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 8 Dec 2022 05:55:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229816AbiLHKyk (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 8 Dec 2022 05:54:40 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1D8D5BD55
        for <platform-driver-x86@vger.kernel.org>; Thu,  8 Dec 2022 02:46:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1670496402;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=WJniLawt8jbDwOjRoX+ouOMbgkHh/IAUmwppHXOgvg8=;
        b=c1VsqR5moYUsHGIZrSBcNtxUkW3C0lJNLxXVvRqYMt4xYBctO0/ninxCUUTpu3zlB+EuO7
        deDSbWdJZvYlmTd9RsyxPL6oQ1hrh+ScTejlkAnV/HKI0MuKEzXsw5YKfmZwj96gO7q0LM
        BwedNPoQ7FIxetaqdLvdyPNPOxOdIhk=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-302-Mh65zY5fMyukx7Ktw0iZZQ-1; Thu, 08 Dec 2022 05:46:41 -0500
X-MC-Unique: Mh65zY5fMyukx7Ktw0iZZQ-1
Received: by mail-ej1-f71.google.com with SMTP id sb2-20020a1709076d8200b007bdea97e799so832851ejc.22
        for <platform-driver-x86@vger.kernel.org>; Thu, 08 Dec 2022 02:46:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WJniLawt8jbDwOjRoX+ouOMbgkHh/IAUmwppHXOgvg8=;
        b=lQAGmdKOZzzfgHPcAEhp12uMNHxjlheQHskDRyfvNVXsqY3zgZk7fosGpktTxGL4W7
         /pJWoj17FO3Z3gWQAEMpGANVd4Fdx0r1NTnYrsWAnYQiH8zZ58/PCdidXtPre0ILLyN/
         +QB8VM8MTrkKmIY+x7TcKpnNGaPr5n/uD8UEX9ApIfuvx5LoCW2cx8H+qtWuxHGuLw3l
         Tte83REEJjMEIXugUBDnnc8/r9Cp3g+FZi2ghwxhIikICdGulnccVAgAEH6KThinlDJN
         jsBz3dD8beVCfAy8bBDt4SDCrQabS9Qe5UFOp1UNHiqxMkvpXTc5BLViyafroX/URQW4
         RAeQ==
X-Gm-Message-State: ANoB5pmrcVNaRywHDUhlfLkEkn/YCivK8FkW4IqE+hTatVvfMpw/LMCU
        Oe8WMyKd3LOyMSkDYGeXw0B+PBSKLwBWxop0fkrRXiOe6UiLPlJsHsOjcC9ucek6CHpZn8tjTEW
        NAWtp5XJDQrm+BiLcWU2xJzLkYy/vyWPmyg==
X-Received: by 2002:a17:906:c1d0:b0:7b4:64d3:e6f4 with SMTP id bw16-20020a170906c1d000b007b464d3e6f4mr31696055ejb.594.1670496400497;
        Thu, 08 Dec 2022 02:46:40 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7aauXaaZBf6bSW0TLzYtPnY0vzYhyBEznsHqGrZ0XOPPRGv72C8wiohDbp09gCEGY2I/6n1g==
X-Received: by 2002:a17:906:c1d0:b0:7b4:64d3:e6f4 with SMTP id bw16-20020a170906c1d000b007b464d3e6f4mr31696049ejb.594.1670496400292;
        Thu, 08 Dec 2022 02:46:40 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id kx24-20020a170907775800b007c127e1511dsm1078172ejc.220.2022.12.08.02.46.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Dec 2022 02:46:39 -0800 (PST)
Message-ID: <d527316d-fec8-a212-b0be-f9184b9b416d@redhat.com>
Date:   Thu, 8 Dec 2022 11:46:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] platform/x86: wireless-hotkey: use ACPI HID as phys
To:     Alex Hung <alex.hung@amd.com>, markgross@kernel.org,
        platform-driver-x86@vger.kernel.org
Cc:     Alex Hung <alexhung@gmail.com>
References: <20221127004617.722553-1-alex.hung@amd.com>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221127004617.722553-1-alex.hung@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/27/22 01:46, Alex Hung wrote:
> From: Alex Hung <alexhung@gmail.com>
> 
> Removed the hardcoded "hpq6001" as phys but uses ACPI HID instead.
> 
> Signed-off-by: Alex Hung <alexhung@gmail.com>

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
>  drivers/platform/x86/wireless-hotkey.c | 60 +++++++++++++++++---------
>  1 file changed, 40 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/platform/x86/wireless-hotkey.c b/drivers/platform/x86/wireless-hotkey.c
> index 11c60a273446..eb48ca060bad 100644
> --- a/drivers/platform/x86/wireless-hotkey.c
> +++ b/drivers/platform/x86/wireless-hotkey.c
> @@ -20,7 +20,10 @@ MODULE_ALIAS("acpi*:HPQ6001:*");
>  MODULE_ALIAS("acpi*:WSTADEF:*");
>  MODULE_ALIAS("acpi*:AMDI0051:*");
>  
> -static struct input_dev *wl_input_dev;
> +struct wl_button {
> +	struct input_dev *input_dev;
> +	char phys[32];
> +};
>  
>  static const struct acpi_device_id wl_ids[] = {
>  	{"HPQ6001", 0},
> @@ -29,63 +32,80 @@ static const struct acpi_device_id wl_ids[] = {
>  	{"", 0},
>  };
>  
> -static int wireless_input_setup(void)
> +static int wireless_input_setup(struct acpi_device *device)
>  {
> +	struct wl_button *button = acpi_driver_data(device);
>  	int err;
>  
> -	wl_input_dev = input_allocate_device();
> -	if (!wl_input_dev)
> +	button->input_dev = input_allocate_device();
> +	if (!button->input_dev)
>  		return -ENOMEM;
>  
> -	wl_input_dev->name = "Wireless hotkeys";
> -	wl_input_dev->phys = "hpq6001/input0";
> -	wl_input_dev->id.bustype = BUS_HOST;
> -	wl_input_dev->evbit[0] = BIT(EV_KEY);
> -	set_bit(KEY_RFKILL, wl_input_dev->keybit);
> +	snprintf(button->phys, sizeof(button->phys), "%s/input0", acpi_device_hid(device));
> +
> +	button->input_dev->name = "Wireless hotkeys";
> +	button->input_dev->phys = button->phys;
> +	button->input_dev->id.bustype = BUS_HOST;
> +	button->input_dev->evbit[0] = BIT(EV_KEY);
> +	set_bit(KEY_RFKILL, button->input_dev->keybit);
>  
> -	err = input_register_device(wl_input_dev);
> +	err = input_register_device(button->input_dev);
>  	if (err)
>  		goto err_free_dev;
>  
>  	return 0;
>  
>  err_free_dev:
> -	input_free_device(wl_input_dev);
> +	input_free_device(button->input_dev);
>  	return err;
>  }
>  
> -static void wireless_input_destroy(void)
> +static void wireless_input_destroy(struct acpi_device *device)
>  {
> -	input_unregister_device(wl_input_dev);
> +	struct wl_button *button = acpi_driver_data(device);
> +
> +	input_unregister_device(button->input_dev);
> +	kfree(button);
>  }
>  
>  static void wl_notify(struct acpi_device *acpi_dev, u32 event)
>  {
> +	struct wl_button *button = acpi_driver_data(acpi_dev);
> +
>  	if (event != 0x80) {
>  		pr_info("Received unknown event (0x%x)\n", event);
>  		return;
>  	}
>  
> -	input_report_key(wl_input_dev, KEY_RFKILL, 1);
> -	input_sync(wl_input_dev);
> -	input_report_key(wl_input_dev, KEY_RFKILL, 0);
> -	input_sync(wl_input_dev);
> +	input_report_key(button->input_dev, KEY_RFKILL, 1);
> +	input_sync(button->input_dev);
> +	input_report_key(button->input_dev, KEY_RFKILL, 0);
> +	input_sync(button->input_dev);
>  }
>  
>  static int wl_add(struct acpi_device *device)
>  {
> +	struct wl_button *button;
>  	int err;
>  
> -	err = wireless_input_setup();
> -	if (err)
> +	button = kzalloc(sizeof(struct wl_button), GFP_KERNEL);
> +	if (!button)
> +		return -ENOMEM;
> +
> +	device->driver_data = button;
> +
> +	err = wireless_input_setup(device);
> +	if (err) {
>  		pr_err("Failed to setup wireless hotkeys\n");
> +		kfree(button);
> +	}
>  
>  	return err;
>  }
>  
>  static int wl_remove(struct acpi_device *device)
>  {
> -	wireless_input_destroy();
> +	wireless_input_destroy(device);
>  	return 0;
>  }
>  

