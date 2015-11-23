From: Andy Lutomirski <luto@amacapital.net>
Subject: Re: [PATCH v2] dell-wmi: Improve unknown hotkey handling
Date: Mon, 23 Nov 2015 11:29:18 -0800
Message-ID: <CALCETrU2-F2EcdtwO8X63CW0umiuS+bqaDfWxDWJEVCg_D2OAg@mail.gmail.com>
References: <a19a018252f8352a5d22934c98fba2954e9b1c6c.1448069061.git.luto@kernel.org>
 <CALCETrW0A3rH-BAqTWUAOGhsERR+R5M4d9uCEcjNtJQZLW7zKA@mail.gmail.com>
 <20151123145643.GH24147@pali> <20151123184740.GR7413@malice.jf.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ob0-f182.google.com ([209.85.214.182]:32935 "EHLO
	mail-ob0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752773AbbKWT3i convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 23 Nov 2015 14:29:38 -0500
Received: by obbww6 with SMTP id ww6so110673576obb.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 23 Nov 2015 11:29:38 -0800 (PST)
In-Reply-To: <20151123184740.GR7413@malice.jf.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, Andy Lutomirski <luto@kernel.org>, platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>

On Mon, Nov 23, 2015 at 10:47 AM, Darren Hart <dvhart@infradead.org> wr=
ote:
> On Mon, Nov 23, 2015 at 03:56:43PM +0100, Pali Roh=C3=A1r wrote:
>> On Friday 20 November 2015 17:30:13 Andy Lutomirski wrote:
>> > On Fri, Nov 20, 2015 at 5:27 PM, Andy Lutomirski <luto@kernel.org>=
 wrote:
>> > > If DMI lists a hotkey that we don't recognize, log and ignore it
>> > > instead of trying to map it to keycode 0.  I haven't seen this h=
appen,
>> > > but it will help maintain the key map in the future and it will =
help
>> > > avoid sending bogus events.
>> > >
>> > > This also improves the message that we log when we get an unknow=
n key
>> > > event.
>> > >
>> > > Signed-off-by: Andy Lutomirski <luto@kernel.org>
>> > > ---
>> > >
>> > > Changes from v1:
>> > >  - Use KEY_RESERVED instead of zero and document why that's okay
>> > >  - Fix scancode vs keycode confusion in the log message (whoops!=
)
>> > >  - Switch from hardcoded 256 to ARRAY_SIZE
>> > >
>> > >  drivers/platform/x86/dell-wmi.c | 25 +++++++++++++++++++++----
>> > >  1 file changed, 21 insertions(+), 4 deletions(-)
>> > >
>> > > diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/=
x86/dell-wmi.c
>> > > index d2daf5417cd7..cb96ef03fa79 100644
>> > > --- a/drivers/platform/x86/dell-wmi.c
>> > > +++ b/drivers/platform/x86/dell-wmi.c
>> >
>> >
>> > > +               /* Uninitialized entries are 0 aka KEY_RESERVED.=
 */
>> > > +               BUILD_BUG_ON(KEY_RESERVED !=3D 0);
>> > > +               u16 keycode =3D (bios_entry->keycode <
>> > > +                              ARRAY_SIZE(bios_to_linux_keycode)=
) ?
>> > > +                       bios_to_linux_keycode[bios_entry->keycod=
e] :
>> > > +                       KEY_RESERVED;
>> >
>> > Oops.  BUILD_BUG_ON should be below u16 keycode =3D ... to avoid a
>> > warning.  Feel free to fix it up.  I can also send a v3.
>>
>> KEY_RESERVED is zero by definition and exported to user space. So th=
is
>> should not be redefined otherwise Linux ABI will be broken too.
>>
>> So I think BUILD_BUG_ON is not needed there.
>
> Queued to testing sans BUILD_BUG_ON. Pali, any further concerns? If n=
ot, please
> provide a reviewed-by.
>

Removing the BUILD_BUG_ON is fine with me.

--Andy
