From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v3] fujitsu-laptop: Support touchpad toggle hotkey on
 Skylake-based models
Date: Tue, 28 Jun 2016 10:50:36 -0700
Message-ID: <20160628175036.GF3837@f23x64.localdomain>
References: <20160628010609.GC26713@marvin.atrad.com.au>
 <1467098750-2742-1-git-send-email-kernel@kempniu.pl>
 <20160628111922.GA4256@marvin.atrad.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160628111922.GA4256@marvin.atrad.com.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Woithe <jwoithe@just42.net>
Cc: Micha?? K??pie?? <kernel@kempniu.pl>, Jan-Marek Glogowski <glogow@fbihome.de>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Jun 28, 2016 at 08:49:22PM +0930, Jonathan Woithe wrote:
> On Tue, Jun 28, 2016 at 09:25:50AM +0200, Micha?? K??pie?? wrote:
> > Haswell-based Fujitsu laptops (Lifebook E734/E744/E754) have a touchpad
> > toggle hotkey (Fn+F4) which is handled transparently to the operating
> > system: while an ACPI notification is sent to FUJ02B1 when Fn+F4 is
> > pressed, touchpad state is properly toggled without any explicit support
> > for this operation in fujitsu-laptop.
> > 
> > Skylake-based models (Lifebook E736/E746/E756) also have that hotkey,
> > but the touchpad is not toggled transparently to the operating system.
> > When Fn+F4 is pressed, an ACPI notification is sent to FUJ02E3.  A
> > subsequent call to S000 (FUNC_RFKILL) can be used to determine whether
> > the touchpad toggle hotkey was pressed so that an input event can be
> > sent to userspace.
> > 
> > Relevant ACPI code:
> > 
> >     Method (_L21, 0, NotSerialized)
> >     {
> >         ...
> >         If (AHKF)
> >         {
> >             Notify (\_SB.FEXT, 0x80)
> >         }
> >         ...
> >     }
> > 
> >     Method (S000, 3, Serialized)
> >     {
> >         Name (_T_0, Zero)
> >         Local0 = Zero
> >         While (One)
> >         {
> >             _T_0 = Arg0
> >             If (_T_0 == Zero)
> >             {
> >                 Local0 |= 0x04000000
> >                 Local0 |= 0x02000000
> >                 Local0 |= 0x00020000
> >                 Local0 |= 0x0200
> >                 Local0 |= 0x0100
> >                 Local0 |= 0x20
> >             }
> >             ElseIf (_T_0 == One)
> >             {
> >                 ...
> >                 If (AHKF & 0x08)
> >                 {
> >                 Local0 |= 0x04000000
> >                 AHKF ^= 0x08
> >                 }
> >                 ...
> >             } ...
> >             Break
> >         }
> >         Return (Local0)
> >     }
> > 
> > Pressing Fn+F4 raises GPE 0x21 and sets bit 3 in AHKF.  This in turn
> > results in bit 26 being set in the value returned by FUNC_RFKILL called
> > with 1 as its first argument.  On Skylake-based models, bit 26 is also
> > set in the value returned by FUNC_RFKILL called with 0 as its first
> > argument (this value is saved in fujitsu_hotkey->rfkill_supported upon
> > module initialization), which suggests that this bit is set on models
> > which do not handle touchpad toggling transparently to the operating
> > system.
> > 
> > Note that bit 3 is cleared in AHKF once FUNC_RFKILL is called with 1 as
> > its first argument, which requires fujitsu-laptop to handle this hotkey
> > in a different manner than the other, GIRB-based hotkeys: two input
> > events (press and release) are immediately sent once Fn+F4 is pressed.
> > 
> > Reported-and-tested-by: Jan-Marek Glogowski <glogow@fbihome.de>
> > Signed-off-by: Micha?? K??pie?? <kernel@kempniu.pl>
> 
> Thanks for the revision and your patience.
> 
> Acked-by: Jonathan Woithe <jwoithe@just42.net>

Queued to testing for 4.8, thanks.

-- 
Darren Hart
Intel Open Source Technology Center
