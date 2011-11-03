From: Mattia Dongili <malattia@linux.it>
Subject: Re: [PATCH] sony-laptop: Enable keyboard backlight by default
Date: Thu, 3 Nov 2011 10:57:17 +0900
Message-ID: <20111103015716.GA7421@kamineko.org>
References: <20111102183159.GD19809@zod.bos.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20111102183159.GD19809@zod.bos.redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Josh Boyer <jwboyer@redhat.com>
Cc: Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Nov 02, 2011 at 02:32:00PM -0400, Josh Boyer wrote:
> When the keyboard backlight support was originally added, the commit said
> to default it to on with a 10 second timeout.  That actually wasn't the
> case, as the default value is commented out for the kbd_backlight parameter.
> Because it is a static variable, it gets set to 0 by default without some
> other form of initialization.
> 
> However, it seems the function to set the value wasn't actually called
> immediately, so whatever state the keyboard was in initially would remain. 
> Then commit df410d522410e67660 was introduced during the 2.6.39 timeframe to
> immediately set whatever value was present (as well as attempt to
> restore/reset the state on module removal or resume).  That seems to have
> now forced the light off immediately when the module is loaded unless
> the option kbd_backlight=1 is specified.
> 
> Let's enable it by default again (for the first time).  This should solve
> https://bugzilla.redhat.com/show_bug.cgi?id=728478

I am trying to recollect the reason why I commented out that assignment
at some point... but it seems I can't, to the point that I have a commit
to my local tree that changes the value in the commented out code...
Thanks for spotting this.

> Signed-off-by: Josh Boyer <jwboyer@redhat.com>

Acked-by: Mattia Dongili <malattia@linux.it>

> ---
> 
> diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
> index c006dee..40c4705 100644
> --- a/drivers/platform/x86/sony-laptop.c
> +++ b/drivers/platform/x86/sony-laptop.c
> @@ -127,7 +127,7 @@ MODULE_PARM_DESC(minor,
>  		 "default is -1 (automatic)");
>  #endif
>  
> -static int kbd_backlight;	/* = 1 */
> +static int kbd_backlight = 1;
>  module_param(kbd_backlight, int, 0444);
>  MODULE_PARM_DESC(kbd_backlight,
>  		 "set this to 0 to disable keyboard backlight, "
-- 
mattia
:wq!
