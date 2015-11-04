From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] toshiba_acpi: Initialize hotkey_event_type variable
Date: Tue, 3 Nov 2015 16:44:39 -0800
Message-ID: <20151104004439.GB4650@malice.jf.intel.com>
References: <CAGdLNWFzJpCJhmc_h-CCvez7Xnu2S3Ts607pKdb8_tHN29E08A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:42261 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754646AbbKDAol (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 3 Nov 2015 19:44:41 -0500
Content-Disposition: inline
In-Reply-To: <CAGdLNWFzJpCJhmc_h-CCvez7Xnu2S3Ts607pKdb8_tHN29E08A@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Azael Avalos <coproscefalo@gmail.com>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, stable@vger.kernel.org

On Sun, Nov 01, 2015 at 07:30:30PM -0700, Azael Avalos wrote:
> Commit 23f8f4326a15 ("toshiba_acpi: Fix hotkeys registration on some
> toshiba models") fixed an issue on some laptops regarding hotkeys
> registration, however, if failed to address the initialization of the
> hotkey_event_type variable, and thus, it can lead to potential
> unwanted effects as the variable is being checked.
> 
> This patch initializes such variable to avoid such unwanted effects.
> 
> Cc: <stable@vger.kernel.org> # 4.1+
> Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
> ---
> Darren,
> 
> Sorry for sending this patch this late, I had a really busy week :-(

It's a trivial patch, so I'm not concerned with the timing. Thanks for getting
it out!

Unfortunately, it doesn't apply and appears to be whitespace mangled. Checkpatch
complains and tabs appear to have been replaced with spaces. Please check your
send mail mechanism and resend - possibly using git-send-email or something like
mutt -H PATCHNAME. Try sending to yourself first and verifying you can apply it.

Thanks,

> 
>  drivers/platform/x86/toshiba_acpi.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/toshiba_acpi.c
> b/drivers/platform/x86/toshiba_acpi.c
> index beb709f..c013029 100644
> --- a/drivers/platform/x86/toshiba_acpi.c
> +++ b/drivers/platform/x86/toshiba_acpi.c
> @@ -2665,6 +2665,7 @@ static int toshiba_acpi_add(struct acpi_device *acpi_dev)
>   ret = toshiba_function_keys_get(dev, &dev->special_functions);
>   dev->kbd_function_keys_supported = !ret;
> 
> + dev->hotkey_event_type = 0;
>   if (toshiba_acpi_setup_keyboard(dev))
>   pr_info("Unable to activate hotkeys\n");
> 
> -- 
> 2.6.2
> 

-- 
Darren Hart
Intel Open Source Technology Center
