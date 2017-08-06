From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] RFC: platform/x86: wmi: Fix check for method instance number
Date: Sun, 6 Aug 2017 19:10:12 +0300
Message-ID: <CAHp75VdAhHNZvnE-T9rYbCihsDiiEKog57iVLORPS-t+hz0gCA@mail.gmail.com>
References: <1495886134-8276-1-git-send-email-pali.rohar@gmail.com>
 <1588258750.25982542.1499283035221.JavaMail.zimbra@redhat.com>
 <201707052224.20656@pali> <201708061735.31002@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f173.google.com ([209.85.220.173]:33778 "EHLO
        mail-qk0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751300AbdHFQKO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 6 Aug 2017 12:10:14 -0400
In-Reply-To: <201708061735.31002@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, David Airlie <airlied@redhat.com>, Chun-Yi Lee <jlee@suse.com>, Corentin Chary <corentin.chary@gmail.com>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, Oleksij Rempel <linux@rempel-privat.de>, =?UTF-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@gmail.com>, Andy Lutomirski <luto@kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Sun, Aug 6, 2017 at 6:35 PM, Pali Roh=C3=A1r <pali.rohar@gmail.com> wrot=
e:
> On Wednesday 05 July 2017 22:24:20 Pali Roh=C3=A1r wrote:
>> On Wednesday 05 July 2017 21:30:35 David Airlie wrote:

>> > > On Saturday 17 June 2017 18:47:54 Pali Roh=C3=A1r wrote:
>> > > > > So problematic drivers which use instance=3D1 without any
>> > > > > comments
>> > > > > are:
>> > > > >   acer-wmi
>> > > > >   asus-wmi
>> > > > >   mxm-wmi


> Hi! For mxm-wmi I found this document:
> https://lekensteyn.nl/files/docs/mxm-2.1-software-spec.pdf
>
> On page numbered 26 (resp. in PDF page 31) is information about WMI
> GUID {F6CB5C3C-9CAE-4EBD-B577-931EA32A2CC0} interface and there is
> written that instance count =3D 1.
>
> // Methods GUID {F6CB5C3C-9CAE-4ebd-B577-931EA32A2CC0}
> 0x3C, 0x5C, 0xCB, 0xF6, 0xAE, 0x9C, 0xbd, 0x4e, 0xB5, 0x77, 0x93,
> 0x1E, 0xA3, 0x2A, 0x2C, 0xC0,
> 0x4D, 0x58,    // Object ID =E2=80=9CMX=E2=80=9D =3D method =E2=80=9CWMMX=
=E2=80=9D
> 1,             // Instance Count
> 0x02,          // Flags (WMIACPI_REGFLAG_METHOD)
>
> And ACPI method for handling this WMI call does not check Arg0 and Arg1
> at all.
>
> So... Andy, Darren, any objections for following patch which changes
> instance number from one to zero?

No objections from me! Just put enough explanation into commit message.

--=20
With Best Regards,
Andy Shevchenko
