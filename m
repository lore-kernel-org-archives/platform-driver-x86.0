From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH] toshiba_acpi: FULL TOS1900 device support
Date: Fri, 10 Dec 2010 13:35:51 -0800
Message-ID: <20101210213551.GE1630@core.coreip.homeip.net>
References: <AANLkTimW5ro7EQBgoqMLSxnEsVrinL2S+USu207-Nbh=@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-gx0-f180.google.com ([209.85.161.180]:41238 "EHLO
	mail-gx0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752193Ab0LJVgB (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 10 Dec 2010 16:36:01 -0500
Content-Disposition: inline
In-Reply-To: <AANLkTimW5ro7EQBgoqMLSxnEsVrinL2S+USu207-Nbh=@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Azael Avalos <coproscefalo@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Matthew Garrett <mjg@redhat.com>

Hi Azael,

On Fri, Dec 10, 2010 at 02:13:18PM -0700, Azael Avalos wrote:
>  	error = input_register_device(toshiba_acpi.hotkey_dev);
>  	if (error) {
>  		printk(MY_INFO "Unable to register input device\n");
> -		goto err_remove_notify;
> +		 goto err_free_keymap;

Extra space in indentation.

>  	}
> 
>  	return 0;
> 
> - err_remove_notify:
> -	acpi_remove_notify_handler(toshiba_acpi.handle,
> -				   ACPI_DEVICE_NOTIFY, toshiba_acpi_notify);
> - err_free_keymap:
> -	sparse_keymap_free(toshiba_acpi.hotkey_dev);
> - err_free_dev:
> +err_free_keymap:
> +	if (toshiba_acpi.hci_type == 2)
> +		i8042_remove_filter(toshiba_i8042_filter);
> +err_free_dev:
>  	input_free_device(toshiba_acpi.hotkey_dev);
>  	toshiba_acpi.hotkey_dev = NULL;
>  	return error;

I do not actually see you calling sparse_keymap_free() in the error path
anymore.

Thanks.

-- 
Dmitry
