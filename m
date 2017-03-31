From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH 6/8] platform/x86: fujitsu-laptop: use a sparse keymap
 for hotkey event generation
Date: Fri, 31 Mar 2017 13:22:02 +0200
Message-ID: <20170331112202.GA995@ozzy.nask.waw.pl>
References: <20170320093224.18541-1-kernel@kempniu.pl>
 <20170320093224.18541-7-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170320093224.18541-7-kernel@kempniu.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: Jonathan Woithe <jwoithe@just42.net>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

> @@ -1098,14 +1075,8 @@ static void acpi_fujitsu_laptop_notify(struct acpi_device *device, u32 event)
>  	 * handled in software; its state is queried using FUNC_FLAGS
>  	 */
>  	if ((fujitsu_laptop->flags_supported & BIT(26)) &&
> -	    (call_fext_func(FUNC_FLAGS, 0x1, 0x0, 0x0) & BIT(26))) {
> -		keycode = KEY_TOUCHPAD_TOGGLE;
> -		input_report_key(input, keycode, 1);
> -		input_sync(input);
> -		input_report_key(input, keycode, 0);
> -		input_sync(input);
> -	}
> -
> +	    (call_fext_func(FLAG_RFKILL, 0x1, 0x0, 0x0) & BIT(26)))
> +		sparse_keymap_report_event(input, BIT(26), 1, true);

I have only just now noticed that a typo crept in here, causing a bug.
The original call to call_fext_func() passed FUNC_FLAGS as the first
argument while the added one uses FLAG_RFKILL instead.  This is wrong as
call_fext_func() arguments should be left intact by this patch.

Darren, could you please amend this in testing?  The call_fext_func()
call added by the above patch chunk should pass FUNC_FLAGS as the first
argument, not FLAG_RFKILL.

Thanks and sorry for the trouble.

-- 
Best regards,
Michał Kępień
