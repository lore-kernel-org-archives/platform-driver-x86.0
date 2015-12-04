From: Andy Lutomirski <luto@amacapital.net>
Subject: Re: [PATCH v2 3/3] dell-wmi: Improve unknown hotkey handling
Date: Fri, 4 Dec 2015 08:15:04 -0800
Message-ID: <CALCETrW51LBvqiho+rs63ng3Jihvssm_Ky=+e+acM4Vq7R-WiQ@mail.gmail.com>
References: <cover.1448931589.git.luto@kernel.org> <b409d60963f81611e398b492a73ffd998414cd68.1448931589.git.luto@kernel.org>
 <20151203233856.GC1800@malice.jf.intel.com> <20151204083923.GL10982@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ig0-f169.google.com ([209.85.213.169]:34291 "EHLO
	mail-ig0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753494AbbLDQPY convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 4 Dec 2015 11:15:24 -0500
Received: by igvg19 with SMTP id g19so39079934igv.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 04 Dec 2015 08:15:24 -0800 (PST)
In-Reply-To: <20151204083923.GL10982@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Lutomirski <luto@kernel.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Linux ACPI <linux-acpi@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Mario Limonciello <mario_limonciello@dell.com>

On Fri, Dec 4, 2015 at 12:39 AM, Pali Roh=C3=A1r <pali.rohar@gmail.com>=
 wrote:
> On Thursday 03 December 2015 15:38:56 Darren Hart wrote:
>> Pali, this appears to have the one change you asked for (0x%x instea=
d of %d).
>> I've added the Reviewed-by: Pali Roh=C3=A1r <pali.rohar@gmail.com> y=
ou provided
>> previously pending this change.
>
> Ok.
>
>> > +           /* Uninitialized entries are 0 aka KEY_RESERVED. */
>> > +           u16 keycode =3D (bios_entry->keycode <
>> > +                          ARRAY_SIZE(bios_to_linux_keycode)) ?
>> > +                   bios_to_linux_keycode[bios_entry->keycode] :
>> > +                   KEY_RESERVED;
>> > +           BUILD_BUG_ON(KEY_RESERVED !=3D 0);
>
> Anyway, Darren what do you think is that BUILD_BUG_ON check needed?
>

Sorry, my bad.  IIRC Darren made that change, I made the other change,
and then I resent and we lost this one.

Darren, want to fix it in your tree?  If not, I'll include the
BUILD_BUG_ON deletion in v3.

--Andy
