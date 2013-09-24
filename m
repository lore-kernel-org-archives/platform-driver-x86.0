From: Jonathan Woithe <jwoithe@just42.net>
Subject: Re: Wireless key on Fujitsu E753 not working since
 a57f7f9175b8ccbc9df83ac13860488913115de4
Date: Tue, 24 Sep 2013 09:41:49 +0930
Message-ID: <20130924001149.GH12939@marvin.atrad.com.au>
References: <CAO_aot5FJb1v6-CztDeuAPS7=-byULP-tMzF_DZhw6aG4A+vVw@mail.gmail.com>
 <CAO_aot4Ye=YwSvi6P2Nn=3r4N8OY03mPxXLj+mTd_ziRxb5LXA@mail.gmail.com>
 <20130812144212.GA20923@marvin.atrad.com.au>
 <CAO_aot5117jj+sGCR2UXt2_kqH-j5VxcdQbuTrGMRewDVwPbiQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from server.atrad.com.au ([150.101.241.2]:42445 "EHLO
	server.atrad.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752566Ab3IXAMB (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 23 Sep 2013 20:12:01 -0400
Content-Disposition: inline
In-Reply-To: <CAO_aot5117jj+sGCR2UXt2_kqH-j5VxcdQbuTrGMRewDVwPbiQ@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jan Hinnerk Stosch <janhinnerk.stosch@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, jwoithe@just42.net

On Tue, Aug 13, 2013 at 10:27:53AM +0200, Jan Hinnerk Stosch wrote:
> 2013/8/12 Jonathan Woithe <jwoithe@just42.net>:
> >> 2013/6/28 Jan Hinnerk Stosch <janhinnerk.stosch@gmail.com>:
> >> > since commit "a57f7f9175b8ccbc9df83ac13860488913115de4" (bisected) the
> >> > wireless key on my Fujitsu E753 is not working any more. If I boot up
> >> > with parameter "acpi_osi="!Windows 2012"" it works, though.
> >> > I filed an ACPI-bug
> >> > (https://bugzilla.kernel.org/show_bug.cgi?id=60161), but was told
> >> > (https://bugzilla.kernel.org/show_bug.cgi?id=60161#c5) that this is
> >> > caused by the fujitsu_laptop driver. So I report it here. Should I
> >> > file a bug anywhere or is it enough to write it to the list?
> >
> > Does this "wireless key" do what you expect if the fujitsu_laptop module is
> > not loaded?
> >
> > I know nothing about the E753.  Is the "wireless key" a dedicated key on the
> > keyboard, a separate switch, or something entirely different?  It sounds
> > like it's just an enable switch.
> 
> No, the key also does not work without fujitsu_laptop module.

Ok, thanks for confirming.

> The key is one of two special keys - one for ECO mode (which I have
> not tested or used at all) and the wireless key which switches of all
> wireless functions (WLAN and bluetooth). They are not part of the
> "main" keyboard. According to the output of "rfkill list" it works
> indeed as a hardware switch (Hard blocked: yes/no).

I see.  On some Fujitsu laptops the RF kill switch is strictly a hardware
thing - it does not require any software assistance at all.  This is the
case on the unit I have (S7020).  However, there were some models which did
need software assistance, and this was added to the fujitsu-laptop driver by
someone with such a machine.

I've had a look at the commit you referenced, and all it seems to do is add
a new _OSI string to ACPI.  I am not overly familiar with how the APCI side
of thing works.  It seems odd that adding this string to the kernel should
make fujitsu-laptop (or any other driver) behave differently.  Does the
presence of this new string somehow cause the FUNC_RFKILL ACPI method
(called via call_fext_func()) to behave differently?

If someone could explain what the new _OSI string could be doing (or point
to documentation) I could try to work out what might be happening.  I am a
little restricted in what I can do though because I don't have fujitsu
hardware that supports the software RF kill switch.

My best guess is that the new OSI string activates an alternative ACPI
interface which does not include the custom Fujitsu RF kill interface, or
which implements a different non-standard RF kill interface which
fujitsu-laptop doesn't know about.  However, I don't have a great grasp of
the underlying ACPI functionality and would be very happy to be corrected on
this point by those more knowledgeable than I in this area.

Regards
  jonathan
