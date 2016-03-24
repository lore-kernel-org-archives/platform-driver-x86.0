From: Jonathan Woithe <jwoithe@just42.net>
Subject: Re: [PATCH] fujitsu-laptop: Support radio LED
Date: Thu, 24 Mar 2016 22:05:14 +1030
Message-ID: <20160324113513.GA5129@marvin.atrad.com.au>
References: <1458127687-25366-1-git-send-email-kernel@kempniu.pl>
 <20160318120418.GA29889@marvin.atrad.com.au>
 <20160322133051.GA3379@eudyptula.hq.kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160322133051.GA3379@eudyptula.hq.kempniu.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Micha?? K??pie?? <kernel@kempniu.pl>
Cc: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

This is a quick reply with preliminary information.  I'll follow up in the
next few days with further details.

On Tue, Mar 22, 2016 at 02:30:51PM +0100, Micha?? K??pie?? wrote:
> > > As for detecting whether the LED is present on a given machine, I had to
> > > resort to educated guesswork.  I assumed this LED is present on all
> > > devices which have a radio toggle button instead of a slider.  My
> > > Lifebook E744 holds 0x01010001 in BTNI.  By comparing the bits and
> > > buttons with those of a Lifebook E8420 (BTNI=0x000F0101, has a slider),
> > > I put my money on bit 24 as the indicator of the radio toggle button
> > > being present.
> > 
> > The other question is how consistent the bit layout is across all devices
> > which might make use of this driver.  The set of potential devices spans
> > nearly 10 years, and in many ways it would be surprising if the bit
> > definitions were kept the same over that time.  Testing would be the only
> > way to get a feeling for that.
> 
> My thoughts exactly.
> 
> > If you could let me know how you went about
> > acquiring the values on your machine I could try the exact same steps on the
> > S7020 to see what we get.
> 
> The BTNI value is printed to the kernel log buffer by
> acpi_fujitsu_hotkey_add(), so all it takes to retrieve it is:
> 
>     dmesg | grep BTNI

Here's what's reported by the S7020:

  fujitsu_laptop: BTNI: [0xf0001]

The S7020 doesn't have any LEDs.  It also has a physical slider to enable RF
and an "RF enabled" indicator in the LCD panel.  The LCD indicator is under
hardware control; software cannot influence it.

Clearly bit 24 is *not* set on the S7020.  Using this bit as a test for the
button's presence therefore should not cause trouble for the S7020 and
probably other similar models from that time.  Obviously we don't have
access to every single model, but the apparent consistency back to the S7020
is encouraging.

> > > While it's not essential, it would be nice to initialize soft rfkill
> > > state of all radio transmitters to the value of RFSW upon boot.
> > 
> > I think this would only be necessary for those machines with the RF button
> > in place of the hard slider switch, right?
> 
> Yes.  On the E8420 I tested, moving the slider switch to "off" position
> caused the Bluetooth device to be removed from the system altogether
> while iwlwifi reacted by hard-blocking phy0.

I haven't noticed anything that dramatic on the S7020, but anything's
possible.

Regards
  jonathan
