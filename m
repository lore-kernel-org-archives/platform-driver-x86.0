From: Alex Hung <alex.hung@canonical.com>
Subject: Re: [PATCH][V2] intel-hid: support 5 array button
Date: Wed, 8 Feb 2017 17:05:13 +0800
Message-ID: <CAJ=jqub_vr_rZZE53Vgzm-OaUXkvGexCjWKEqRenTgb34UNZLg@mail.gmail.com>
References: <1485415981-20487-1-git-send-email-alex.hung@canonical.com>
 <20170204011439.GD38511@f23x64.localdomain> <20170204012605.GA43075@f23x64.localdomain>
 <20170204160653.GA27398@pali> <20170208072146.GA1199@ozzy.nask.waw.pl> <20170208081757.GA22830@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f181.google.com ([209.85.220.181]:36197 "EHLO
        mail-qk0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752061AbdBHJGb (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 8 Feb 2017 04:06:31 -0500
Received: by mail-qk0-f181.google.com with SMTP id 11so115565932qkl.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 08 Feb 2017 01:05:14 -0800 (PST)
In-Reply-To: <20170208081757.GA22830@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>
Cc: =?UTF-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>, Darren Hart <dvhart@infradead.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>

On Wed, Feb 8, 2017 at 4:17 PM, Pali Roh=C3=A1r <pali.rohar@gmail.com> wrot=
e:
> On Wednesday 08 February 2017 08:21:46 Micha=C5=82 K=C4=99pie=C5=84 wrote=
:
>> > Hi!
>> >
>> > On Saturday 04 February 2017 02:26:05 Darren Hart wrote:
>> > > Apologies, this time with Pali's correct email address (aliases fail=
).
>> > >
>> > ...
>> > > >
>> > > > Pali, would you care to offer a review or some testing to verify n=
o unexpected
>> > > > conflicts with the other dell drivers?
>> >
>> > I do not have Dell machine which uses intel-hid.ko so I cannot test th=
is
>> > patch. And obviously as it is not loaded it cannot break machines whic=
h
>> > do not use intel-hid.ko.
>> >
>> > > > > +/* 5 button array notification value. */
>> > > > > +static const struct key_entry intel_array_keymap[] =3D {
>> > > > > +     { KE_KEY,    0xC2, { KEY_LEFTMETA} },                /* Pr=
ess */
>> > > > > +     { KE_IGNORE, 0xC3, { KEY_LEFTMETA} },                /* Re=
lease */
>> > > > > +     { KE_KEY,    0xC4, { KEY_VOLUMEUP} },                /* Pr=
ess */
>> > > > > +     { KE_IGNORE, 0xC5, { KEY_VOLUMEUP} },                /* Re=
lease */
>> > > > > +     { KE_KEY,    0xC6, { KEY_VOLUMEDOWN} },              /* Pr=
ess */
>> > > > > +     { KE_IGNORE, 0xC7, { KEY_VOLUMEDOWN} },              /* Re=
lease */
>> > > > > +     { KE_SW,     0xC8, { .sw =3D {SW_ROTATE_LOCK, 1} } },   /*=
 Press */
>> > > > > +     { KE_SW,     0xC9, { .sw =3D {SW_ROTATE_LOCK, 0} } },   /*=
 Release */
>> > > > > +     { KE_KEY,    0xCE, { KEY_POWER} },                   /* Pr=
ess */
>> > > > > +     { KE_IGNORE, 0xCF, { KEY_POWER} },                   /* Re=
lease */
>> > > > > +     { KE_END },
>> > > > > +};
>> >
>> > This looks suspicious. Why are all release events ignored?
>>
>> I also do not have a Dell machine that makes use of this driver, but my
>> understanding is that calling sparse_keymap_report_event() with
>> autorelease set to true makes release events irrelevant and simplifies
>> implementation.  Though each release event still needs a KE_IGNORE entry
>> in the keymap so that superfluous KEY_UNKNOWN events are suppressed.

Thanks Micha=C5=82, this was indeed my intention.

>
> Right, but that means if ACPI/WMI/firmware provides correct information
> when key was pressed and when released we should use it. It allow
> userspace e.g. measure how long was key pressed or similar thing...

Pali,

The systems I tested generate a press event followed by a release
event immediately, so the results will be the same for them.

However, future ACPI implementation may not be the same and I will fix
this in a following patch. Thanks for pointing this out.

>
> --
> Pali Roh=C3=A1r
> pali.rohar@gmail.com



--=20
Cheers,
Alex Hung
