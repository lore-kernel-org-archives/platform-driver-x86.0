From: Benson Leung <bleung@chromium.org>
Subject: Re: make i2c_adapter_names static to avoid sparse warnings
Date: Tue, 29 Jan 2013 16:16:19 -0800
Message-ID: <CANLzEks3J2ATt73ZS6+JrT6a36AK+OmheoJYqruM0nkkDHwx5A@mail.gmail.com>
References: <20121227080739.GA20905@bee>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-oa0-f51.google.com ([209.85.219.51]:65044 "EHLO
	mail-oa0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751331Ab3A3AQU (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 29 Jan 2013 19:16:20 -0500
Received: by mail-oa0-f51.google.com with SMTP id n12so1106156oag.24
        for <platform-driver-x86@vger.kernel.org>; Tue, 29 Jan 2013 16:16:19 -0800 (PST)
In-Reply-To: <20121227080739.GA20905@bee>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Xiechanglong <changlongx.xie@intel.com>
Cc: Matthew Garrett <matthew.garrett@nebula.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, kbuild@01.org

 Reviewed-by: Benson Leung <bleung@chromium.org>

Thanks,
Benson

On Thu, Dec 27, 2012 at 12:07 AM, Xiechanglong <changlongx.xie@intel.com> wrote:
> Signed-off-by: Changlong Xie <changlongx.xie@intel.com>
> ---
> Index: linux/drivers/platform/x86/chromeos_laptop.c
> ===================================================================
> --- linux.orig/drivers/platform/x86/chromeos_laptop.c
> +++ linux/drivers/platform/x86/chromeos_laptop.c
> @@ -31,7 +31,7 @@
>  static struct i2c_client *als;
>  static struct i2c_client *tp;
>
> -const char *i2c_adapter_names[] = {
> +static const char *i2c_adapter_names[] = {
>         "SMBus I801 adapter",
>  };
>



-- 
Benson Leung
Software Engineer, Chrom* OS
bleung@chromium.org
