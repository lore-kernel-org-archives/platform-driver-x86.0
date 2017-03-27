From: Jonathan Woithe <jwoithe@just42.net>
Subject: Re: [PATCH 7/8] platform/x86: fujitsu-laptop: model-dependent sparse
 keymap overrides
Date: Mon, 27 Mar 2017 11:10:56 +1030
Message-ID: <20170327004055.GI334@marvin.atrad.com.au>
References: <20170320093224.18541-1-kernel@kempniu.pl>
 <20170320093224.18541-8-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170320093224.18541-8-kernel@kempniu.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Micha?? K??pie?? <kernel@kempniu.pl>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Mar 20, 2017 at 10:32:23AM +0100, Micha?? K??pie?? wrote:
> Some laptop models need to have different keycodes assigned to hotkey
> scancodes.  Change the sparse keymap upon a DMI match, before the hotkey
> input device is setup.
> 
> Instead of using three different callbacks in the DMI match table,
> simplify code by using the driver_data field of struct dmi_system_id to
> supply the requested keymap to a common callback.  Also merge keymaps
> for S6410 and S6420 as they are identical.
>
> [cut]
>
> diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
> index 8f1c9c204110..1487eb2396c6 100644
> --- a/drivers/platform/x86/fujitsu-laptop.c
> +++ b/drivers/platform/x86/fujitsu-laptop.c

> @@ -766,8 +711,62 @@ static const struct key_entry keymap_default[] = {
>  	{ KE_END, 0 }
>  };
>  
> +static const struct key_entry keymap_s6400[] = {
> +	{ KE_KEY, KEY1_CODE, { KEY_SCREENLOCK } },	/* "Lock" */
> +	{ KE_KEY, KEY2_CODE, { KEY_HELP } },		/* "Mobility Center */
> +	{ KE_KEY, KEY3_CODE, { KEY_PROG3 } },
> +	{ KE_KEY, KEY4_CODE, { KEY_PROG4 } },
> +	{ KE_END, 0 }
> +};

Since this keymap applies to both the S6410 and S6420, referencing S6400 in
its name might be slightly confusing in future.  Calling this "keymap_s64x0"
or (if it fits better with conventions used elsewhere) "keymap_s64X0" would
avoid the confusion.

Regards
  jonathan
