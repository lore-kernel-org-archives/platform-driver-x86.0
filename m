From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 6/8] platform/x86: fujitsu-laptop: use a sparse keymap
 for hotkey event generation
Date: Sat, 1 Apr 2017 13:00:23 -0700
Message-ID: <20170401200023.GB5000@fury>
References: <20170320093224.18541-1-kernel@kempniu.pl>
 <20170320093224.18541-7-kernel@kempniu.pl>
 <20170331112202.GA995@ozzy.nask.waw.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170331112202.GA995@ozzy.nask.waw.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Jonathan Woithe <jwoithe@just42.net>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Mar 31, 2017 at 01:22:02PM +0200, Michał Kępień wrote:
> > @@ -1098,14 +1075,8 @@ static void acpi_fujitsu_laptop_notify(struct acpi_device *device, u32 event)
> >  	 * handled in software; its state is queried using FUNC_FLAGS
> >  	 */
> >  	if ((fujitsu_laptop->flags_supported & BIT(26)) &&
> > -	    (call_fext_func(FUNC_FLAGS, 0x1, 0x0, 0x0) & BIT(26))) {
> > -		keycode = KEY_TOUCHPAD_TOGGLE;
> > -		input_report_key(input, keycode, 1);
> > -		input_sync(input);
> > -		input_report_key(input, keycode, 0);
> > -		input_sync(input);
> > -	}
> > -
> > +	    (call_fext_func(FLAG_RFKILL, 0x1, 0x0, 0x0) & BIT(26)))
> > +		sparse_keymap_report_event(input, BIT(26), 1, true);
> 
> I have only just now noticed that a typo crept in here, causing a bug.
> The original call to call_fext_func() passed FUNC_FLAGS as the first
> argument while the added one uses FLAG_RFKILL instead.  This is wrong as
> call_fext_func() arguments should be left intact by this patch.
> 
> Darren, could you please amend this in testing?  The call_fext_func()
> call added by the above patch chunk should pass FUNC_FLAGS as the first
> argument, not FLAG_RFKILL.
> 
> Thanks and sorry for the trouble.

Gah, I didn't catch that either :(

I've updated this patch with:

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index 52d6d21..f66da4b 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -1074,7 +1074,7 @@ static void acpi_fujitsu_laptop_notify(struct acpi_device *device, u32 event)
         * handled in software; its state is queried using FUNC_FLAGS
         */
        if ((fujitsu_laptop->flags_supported & BIT(26)) &&
-           (call_fext_func(FLAG_RFKILL, 0x1, 0x0, 0x0) & BIT(26)))
+           (call_fext_func(FUNC_FLAGS, 0x1, 0x0, 0x0) & BIT(26)))
                sparse_keymap_report_event(input, BIT(26), 1, true);
 }

in pdx86/testing, I'll push to for-next today, just as soon as CI confirms no
issues.

Thank you for catching it,

-- 
Darren Hart
VMware Open Source Technology Center
