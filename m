From: Andy Lutomirski <luto@amacapital.net>
Subject: Re: [PATCH v2] dell-wmi: Improve unknown hotkey handling
Date: Mon, 30 Nov 2015 10:33:00 -0800
Message-ID: <CALCETrUONjBRCV8v0nAAxTbVPNioHbO3reYb9GTYnN7wbz=EvQ@mail.gmail.com>
References: <a19a018252f8352a5d22934c98fba2954e9b1c6c.1448069061.git.luto@kernel.org>
 <20151123194710.GJ24147@pali> <20151130182738.GA30553@malice.jf.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ob0-f175.google.com ([209.85.214.175]:34857 "EHLO
	mail-ob0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754913AbbK3SdV convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 30 Nov 2015 13:33:21 -0500
Received: by obbnk6 with SMTP id nk6so134283463obb.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 30 Nov 2015 10:33:20 -0800 (PST)
In-Reply-To: <20151130182738.GA30553@malice.jf.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, Andy Lutomirski <luto@kernel.org>, platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>

On Mon, Nov 30, 2015 at 10:27 AM, Darren Hart <dvhart@infradead.org> wr=
ote:
> On Mon, Nov 23, 2015 at 08:47:10PM +0100, Pali Roh=C3=A1r wrote:
>> On Friday 20 November 2015 17:27:00 Andy Lutomirski wrote:
>> > +           if (keycode =3D=3D KEY_RESERVED) {
>> > +                   pr_info("firmware scancode %d maps to unrecogn=
ized keycode %d\n",
>> > +                           bios_entry->scancode, bios_entry->keyc=
ode);
>> > +                   continue;
>> > +           }
>>
>> Please use "0x%x" instead "%d" for those scan and key codes. Other p=
arts
>> in driver use "0x%x" so that new info message could be more confused=
 if
>> it has decimal codes...
>>
>> With that fix, you can add my:
>> Reviewed-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>
>
> Andy, will you be resending with this change?

Sure.

--Andy
