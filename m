From: Jonathan Woithe <jwoithe@just42.net>
Subject: Re: [PATCH][RfC] Some buttons on the Fujitsu u7[25]7 laptops are not
 working
Date: Sun, 11 Feb 2018 14:57:34 +1030
Message-ID: <20180211042734.GD12203@marvin.atrad.com.au>
References: <69f33335-962b-f3be-da8e-2eeff1ae2a49@fbihome.de>
 <20180119234547.GB24590@marvin.atrad.com.au>
 <84b872ec-ba48-6423-cb7b-48f2c3ef30d2@fbihome.de>
 <e69cad3d-067b-5a22-0f4d-0c29691037c7@fbihome.de>
 <20180209113144.GC23589@marvin.atrad.com.au>
 <91505258-9421-29b5-fc3d-b5d641dfd9ee@fbihome.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from server.atrad.com.au ([150.101.241.2]:33210 "EHLO
        server.atrad.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752253AbeBKE1s (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 10 Feb 2018 23:27:48 -0500
Content-Disposition: inline
In-Reply-To: <91505258-9421-29b5-fc3d-b5d641dfd9ee@fbihome.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jan-Marek Glogowski <glogow@fbihome.de>
Cc: Micha?? K??pie?? <kernel@kempniu.pl>, platform-driver-x86@vger.kernel.org

On Fri, Feb 09, 2018 at 02:08:37PM +0100, Jan-Marek Glogowski wrote:
> Am 09.02.2018 um 12:31 schrieb Jonathan Woithe:
> >> And I realized we never use the value from BTNI, except when deciding to
> >> register the "fujitsu::kblamps" led, FWIW.
> > 
> > It's useful for that purpose.
>
> What I meant: the driver doesn't use the value returned by the function. 
> I was hoping to find a way to distinguish the "fake ECO button" key from a
> real ECO button, so I could send a release immediately after a press
> event, which is already a release event, just like with the normal
> function keys.

Right.  Michel has some ideas about how we might be able get around this in
the longer term.

> I have just two different series E and U, so if you have other HW with
> other buttons, we can eventually decode the value.  If the bit was the
> RFKILL button, then this doesn't help.  If it was the ECO button, we can
> check that.

I only have an S7020.  All its special function buttons are on Fn+Fx key
combinations and are therefore handled differently to the panel buttons. 
The S7020 does have five additional buttons (labelled 1-4, Enter) which can
be used for a boot PIN, with 1-4 (but not Enter) also seen by ACPI.  The
practical upshot is that while I can obviously test for regressions on old
hardware, I can't do any tests related to the function-specific buttons on
later models because the S7020 doesn't have any of those.  For example, on
the S7020 there is no "eco" button, and the RFKILL function is handled by a
physical switch.

This all means that the hardware I have will not provide any assistance in
the decoding of which you speak as far as I can tell.

> I still have two minor nuisances:
> 1. the "fake ECO button" key
> 2. the wrong /sys/devices/platform/fujitsu-laptop/radios state
> 
> fujitsu-laptop/radios is always "killed" for me, regardless of the rfkill
> state.  Have to check, if this is eventually connected to the BIOS / EFI
> settings, which disables the HW.

Ok.

Regards
  jonathan
