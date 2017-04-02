From: Jonathan Woithe <jwoithe@just42.net>
Subject: Re: [PATCH 6/8] platform/x86: fujitsu-laptop: use a sparse keymap
 for hotkey event generation
Date: Sun, 2 Apr 2017 18:31:30 +0930
Message-ID: <20170402090129.GB31771@marvin.atrad.com.au>
References: <20170320093224.18541-1-kernel@kempniu.pl>
 <20170320093224.18541-7-kernel@kempniu.pl>
 <20170331112202.GA995@ozzy.nask.waw.pl>
 <20170401200023.GB5000@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from server.atrad.com.au ([150.101.241.2]:60230 "EHLO
        server.atrad.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750876AbdDBJC0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 2 Apr 2017 05:02:26 -0400
Content-Disposition: inline
In-Reply-To: <20170401200023.GB5000@fury>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Micha?? K??pie?? <kernel@kempniu.pl>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, Apr 01, 2017 at 01:00:23PM -0700, Darren Hart wrote:
> On Fri, Mar 31, 2017 at 01:22:02PM +0200, Micha?? K??pie?? wrote:
> > > @@ -1098,14 +1075,8 @@ static void acpi_fujitsu_laptop_notify(struct acpi_device *device, u32 event)
> > >  	 * handled in software; its state is queried using FUNC_FLAGS
> > >  	 */
> > >  	if ((fujitsu_laptop->flags_supported & BIT(26)) &&
> > > -	    (call_fext_func(FUNC_FLAGS, 0x1, 0x0, 0x0) & BIT(26))) {
> > > -		keycode = KEY_TOUCHPAD_TOGGLE;
> > > -		input_report_key(input, keycode, 1);
> > > -		input_sync(input);
> > > -		input_report_key(input, keycode, 0);
> > > -		input_sync(input);
> > > -	}
> > > -
> > > +	    (call_fext_func(FLAG_RFKILL, 0x1, 0x0, 0x0) & BIT(26)))
> > > +		sparse_keymap_report_event(input, BIT(26), 1, true);
> > 
> > I have only just now noticed that a typo crept in here, causing a bug.
> > The original call to call_fext_func() passed FUNC_FLAGS as the first
> > argument while the added one uses FLAG_RFKILL instead.  This is wrong as
> > call_fext_func() arguments should be left intact by this patch.
> > 
> > Darren, could you please amend this in testing?  The call_fext_func()
> > call added by the above patch chunk should pass FUNC_FLAGS as the first
> > argument, not FLAG_RFKILL.
> > 
> > Thanks and sorry for the trouble.
> 
> Gah, I didn't catch that either :(

And I missed it too. :-(  Thanks for catching this Michael.  The reason it
never showed up in my testing is that my Fujitsu hardware doesn't have the
feature which exercises this code branch.

> I've updated this patch with:
> 
> diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
> index 52d6d21..f66da4b 100644

Thanks Darren.

Regards
  jonathan
