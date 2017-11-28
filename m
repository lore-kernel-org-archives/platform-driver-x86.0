From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: Intel "5-button array" support on MobileStudio Pro
Date: Tue, 28 Nov 2017 21:27:46 +0200
Message-ID: <CAHp75Vca-6mkNMOPzU4Chbo8qAT-CV6dnqzQBbEVfw=6_-_MGw@mail.gmail.com>
References: <5F052604-4CFE-44AA-9E41-2DB516D150A8@gmail.com>
 <72A46090-7434-4895-945F-25D7BD20DB40@gmail.com> <CAJ=jquZVX43Od-z3OkFEuO+8sWZ=L9e_vawsGAgNWXnk3-fLHw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f176.google.com ([209.85.216.176]:40297 "EHLO
        mail-qt0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932106AbdK1T1r (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 28 Nov 2017 14:27:47 -0500
Received: by mail-qt0-f176.google.com with SMTP id u42so1315897qte.7
        for <platform-driver-x86@vger.kernel.org>; Tue, 28 Nov 2017 11:27:47 -0800 (PST)
In-Reply-To: <CAJ=jquZVX43Od-z3OkFEuO+8sWZ=L9e_vawsGAgNWXnk3-fLHw@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Alex Hung <alex.hung@canonical.com>
Cc: Jason Gerecke <killertofu@gmail.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, Michal Kepien <kernel@kempniu.pl>

On Mon, Nov 27, 2017 at 3:42 PM, Alex Hung <alex.hung@canonical.com> wrote:
> On Sun, Nov 26, 2017 at 2:28 AM, Jason Gerecke <killertofu@gmail.com> wro=
te:
>> On November 25, 2017 10:23:33 AM PST, Jason Gerecke <killertofu@gmail.co=
m> wrote:
>>>I've just filed a bug [1] about a device which appears to use the
>>>"5-button array" that the patch [2] added support for earlier this
>>>year. It seems that on this particular device (a Wacom MobileStudio
>>>Pro), there is no "HEBC" entry in the ACPI table. Because of this, the
>>>kernel does not load support for the "5-button array" that this device
>>>seems to use.
>
> HEBC seems to be the control method that can report 5 button array;
> however, I think we can use either one of the below to workaround
> this:
>
> 1. Add a kernel parameter and a quirk (ex. DMI strings). The downside
> is the quirk can grow if more systems do not include HEBC
>
> 2. Check both HEBC & BTNL (ex. the method that enables 5 button
> array). Either one enables 5 button array and this fixes current
> problems.
>
> While 2 is preferable, nothing stops future BIOS skips BTNL in the future=
...
>
> Any comments? I will create a patch for testing in a few days.

Looking for a tables with HEBC and this one I only can tell that I
would assume that tables w/o HEBC can guess HEBC returns value for
supporting 5-button array.
Though to be on the safe side I would rather vote for DMI based quirk

>
>>>Please let me know what additional information would be helpful to
>>>provide. I am able to test kernel patches.
>>>
>>>[1]: https://bugzilla.kernel.org/show_bug.cgi?id=3D197991
>>>
>>>[2]: https://patchwork.kernel.org/patch/9571353/

>>>Now instead of four in the eights place /
>>>you=E2=80=99ve got three, =E2=80=98Cause you added one  /
>>>(That is to say, eight) to the two,     /
>>>But you can=E2=80=99t take seven from three,    /
>>>So you look at the sixty-fours....


--=20
With Best Regards,
Andy Shevchenko
