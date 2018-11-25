From: Eric Wong <e@80x24.org>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: add adaptive_kbd_modes
 parameter
Date: Sun, 25 Nov 2018 14:44:41 +0000
Message-ID: <20181125144441.xpwuov2i7lab3agh@dcvr>
References: <20181115073429.z44czywrf7f65ndb@dcvr>
 <20181124232327.t3awc6dnjqdtvzwu@dcvr>
 <87in0l31b9.fsf@miraculix.mork.no>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <87in0l31b9.fsf@miraculix.mork.no>
Sender: linux-kernel-owner@vger.kernel.org
To: =?utf-8?B?QmrDuHJu?= Mork <bjorn@mork.no>
Cc: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Shuduo Sang <shuduo.sang@canonical.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, linux-kernel@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Bjørn Mork <bjorn@mork.no> wrote:
> Eric Wong <e@80x24.org> writes:
> > Eric Wong <e@80x24.org> wrote:
> >> The above setting with this change and the following keymap
> >> preserves my sanity on the atrocious adaptive keyboard on
> >> the 2nd-gen X1 Carbon:
> >
> > Any comments on this patch?  The Esc and F-keys on the keyboard
> > are still numb and I'll be getting rid of the laptop in a few
> > days; but maybe my patch can still be useful to others...
> 
> I've read through and I like it, FWIW.  A brilliant idea. I don't have
> the hardare to test the patch, though....

Thanks for checking it out.

> But I do wonder if you aren't missing an empty mask protection
> somewhere?  If I read this right, then there is nothing preventing you
> from writing 0 here:
> 
> > +static ssize_t adaptive_kbd_modes_store(struct device *dev,
> > +			struct device_attribute *attr,
> > +			const char *buf, size_t count)
> > +{
> > +	unsigned long t;
> > +
> > +	if (parse_strtoul(buf, (1 << LAYFLAT_MODE) - 1, &t))
> > +		return -EINVAL;
> > +
> > +	adaptive_kbd_modes = (unsigned int)t;
> > +	return count;
> > +}

Right, 0 is allowed; and it will lock the current mode into
place...

> And then I believe you have a busy loop here:
> 
> > @@ -3815,20 +3838,20 @@ static int adaptive_keyboard_set_mode(int new_mode)
> >  
> >  static int adaptive_keyboard_get_next_mode(int mode)
> >  {
> > -	size_t i;
> > -	size_t max_mode = ARRAY_SIZE(adaptive_keyboard_modes) - 1;
> > -
> > -	for (i = 0; i <= max_mode; i++) {
> > -		if (adaptive_keyboard_modes[i] == mode)
> > -			break;
> > -	}
> > +	int max_mode = fls(adaptive_kbd_modes);
> > +	int new_mode = mode >= max_mode ? HOME_MODE : mode + 1;
> >  
> > -	if (i >= max_mode)
> > -		i = 0;
> > -	else
> > -		i++;
> > +	/* make sure the new mode is allowed by the user */
> > +	while (!(adaptive_kbd_modes & (1 << new_mode))) {
> > +		new_mode++;
> > +		if (new_mode > max_mode)
> > +			new_mode = HOME_MODE;
> >  
> > -	return adaptive_keyboard_modes[i];
> > +		/* maybe the user disabled all other modes: */
> > +		if (new_mode == mode)
> > +			return mode;
> > +	}
> > +	return new_mode;
> >  }

Not a busy loop, since new_mode will reset at HOME_MODE (0)
and then it'll hit "new_mode == mode" and remain locked in
to the current mode.

> Or am I reading this wrong?

It seems that way.  My initial iteration of this patch did
have a busy loop, but I fixed it before publishing :)

Thanks again for the review.
