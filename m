From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] dell-laptop: Fix backlight detection
Date: Mon, 9 Jul 2018 14:57:41 -0700
Message-ID: <20180709215741.GC30247@fury>
References: <20180708170220.35f40818@anakin>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180708170220.35f40818@anakin>
Sender: linux-kernel-owner@vger.kernel.org
To: Damien =?iso-8859-1?Q?Th=E9bault?= <damien@dtbo.net>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, Andy Shevchenko <andy@infradead.org>, Mario Limonciello <mario.limonciello@dell.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Sun, Jul 08, 2018 at 05:02:20PM +0200, Damien Thébault wrote:
> Fix return code check for "max brightness" ACPI call.
> 
> The dell laptop ACPI video brightness control is not present on dell
> laptops anymore, but was present in older kernel versions.
> 
> The code that checks the return value is incorrect since the SMM
> refactoring.
> 
> The old code was:
>   if (buffer->output[0] == 0)
> 
> Which was changed to:
>   ret = dell_send_request(...)
>   if (ret)
> 
> However, dell_send_request() will return 0 if buffer->output[0] == 0,
> so we must change the check to:
>   if (ret == 0)
> 
> This issue was found on a Dell M4800 laptop, and the fix tested on it
> as well.
> 
> Fixes: 549b4930f057 ("dell-smbios: Introduce dispatcher for SMM calls")
> Signed-off-by: Damien Thébault <damien@dtbo.net>
> Tested-by: Damien Thébault <damien@dtbo.net>

Thanks for the analysis and fix Damien.

I was unable to apply the patch. Apparently due to your Content-Tranfer-Encoding
being set to "quoted-printable". This converts "=" characters to =3D.
Please work with your mail client and try sending the patch
to yourself and applying it. Once that works, please resend.

I suspect you may need to do one or both of the following:

- Disable preferences->compose->"wrap pasted text" (or whichever applies to how
  you get the patch into the compose window)

- Set Preferences->Mail Handling->Sending->Transfer Encoding to 8bit to avoid
  "quoted-printable".

Other claws users who send patches have Content-Transfer-Encoding set to 7bit

Thanks,

> ---
>  drivers/platform/x86/dell-laptop.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/dell-laptop.c
> b/drivers/platform/x86/dell-laptop.c index f1fa8612db40..06978c14c83b
> 100644 --- a/drivers/platform/x86/dell-laptop.c
> +++ b/drivers/platform/x86/dell-laptop.c
> @@ -2185,7 +2185,7 @@ static int __init dell_init(void)
>  		dell_fill_request(&buffer, token->location, 0, 0, 0);
>  		ret = dell_send_request(&buffer,
>  					CLASS_TOKEN_READ,
> SELECT_TOKEN_AC);
> -		if (ret)
> +		if (ret == 0)
>  			max_intensity = buffer.output[3];
>  	}
>  
> -- 
> 2.17.1
> 

-- 
Darren Hart
VMware Open Source Technology Center
