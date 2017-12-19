From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH] platform/x86: dell-wmi: Add an event created by Dell
 Latitude 5495
Date: Tue, 19 Dec 2017 10:06:21 +0100
Message-ID: <20171219090621.exjiw22dinyxlrpi@pali>
References: <1513654714-32175-1-git-send-email-sylee@canonical.com>
 <20171219083455.zekue2qqrf46rps6@pali>
 <CAApEhgh1XfzeoWL6JQN-oOn9yGvJWB74jdfFKtL==UEyhNQs7Q@mail.gmail.com>
 <20171219084107.37exqvmslrogfdvh@pali>
 <CAApEhggQ+UcritOcpyD-CjBf=kNap_uxryPJ0_8J3XYr6CtU8Q@mail.gmail.com>
 <20171219090013.dfm3zhx6ugiooq3k@pali>
 <CAApEhgiSq-mK2P0ar=-PYW2WU6A1y8DzEeFtN30oWjj7hd+zMg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:33108 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935661AbdLSJGZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 19 Dec 2017 04:06:25 -0500
Received: by mail-wm0-f66.google.com with SMTP id g130so10447861wme.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 19 Dec 2017 01:06:24 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <CAApEhgiSq-mK2P0ar=-PYW2WU6A1y8DzEeFtN30oWjj7hd+zMg@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "Shih-Yuan Lee (FourDollars)" <sylee@canonical.com>
Cc: platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>

On Tuesday 19 December 2017 17:02:52 Shih-Yuan Lee (FourDollars) wrote:
> On Tue, Dec 19, 2017 at 5:00 PM, Pali Rohár <pali.rohar@gmail.com> wrote:
> > On Tuesday 19 December 2017 16:45:44 Shih-Yuan Lee (FourDollars) wrote:
> >> On Tue, Dec 19, 2017 at 4:41 PM, Pali Rohár <pali.rohar@gmail.com> wrote:
> >> > On Tuesday 19 December 2017 16:38:32 Shih-Yuan Lee (FourDollars) wrote:
> >> >> On Tue, Dec 19, 2017 at 4:34 PM, Pali Rohár <pali.rohar@gmail.com> wrote:
> >> >>
> >> >> > On Tuesday 19 December 2017 11:38:34 Shih-Yuan Lee (FourDollars) wrote:
> >> >> > > The Dell Latitude 5495 has the mic mute key.
> >> >> > >
> >> >> > > Signed-off-by: Shih-Yuan Lee (FourDollars) <sylee@canonical.com>
> >> >> > > ---
> >> >> > >  drivers/platform/x86/dell-wmi.c | 3 +++
> >> >> > >  1 file changed, 3 insertions(+)
> >> >> > >
> >> >> > > diff --git a/drivers/platform/x86/dell-wmi.c
> >> >> > b/drivers/platform/x86/dell-wmi.c
> >> >> > > index fb25b20..d40f803 100644
> >> >> > > --- a/drivers/platform/x86/dell-wmi.c
> >> >> > > +++ b/drivers/platform/x86/dell-wmi.c
> >> >> > > @@ -261,6 +261,9 @@ static const u16 bios_to_linux_keycode[256] = {
> >> >> > >   * override them.
> >> >> > >   */
> >> >> > >  static const struct key_entry dell_wmi_keymap_type_0010[] = {
> >> >> > > +     /* Mic mute */
> >> >> > > +     { KE_KEY, 0x150, { KEY_F20 } },
> >> >> >
> >> >> > Hi! Are you sure that this key code needs to be in 0010 table? Because
> >> >> > primary this table is constructed from DMI information. See
> >> >> > array bios_to_linux_keycode[].
> >> >> >
> >> >> Because I saw "dell_wmi: Unknown key with type 0x0010 and code 0x0150
> >> >> pressed" in dmesg when pressing the mic mute key.
> >> >
> >> > And do you see following message?
> >> > "firmware scancode 0x%x maps to unrecognized keycode 0x%x\n"
> >> No, do I put some specific kernel parameter to see it?
> >
> > It is print in same way as above Unknown key with type ...
> OK, I saw "dell_wmi: Unknown key with type 0x0010 and code 0x0150 pressed".
> There is no "firmware scancode 0x%x maps to unrecognized keycode 0x%x\n" at all.

Ok, then adding additional entry is needed.

-- 
Pali Rohár
pali.rohar@gmail.com
