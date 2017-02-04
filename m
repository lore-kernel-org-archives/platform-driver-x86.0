From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 0/8] asus-wmi: Get rid of quirk_no_rfkill{,_wapf4}
Date: Sat, 4 Feb 2017 17:05:45 +0200
Message-ID: <CAHp75VeKmHNQi4VNdgw6m0mXdr79dLkzjRGN2+ge2mcKA9Zq9Q@mail.gmail.com>
References: <20170126153013.12753-1-jprvita@endlessm.com> <CAHp75Vc=EiKAhbOaXuqymYSDbT-SNUFCJYoimKNnpf0MB-240A@mail.gmail.com>
 <CA+A7VXXgHVzSBZTeEhO2r75S-Te0UQ29voNiPkYE030Ji=WdzA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f196.google.com ([209.85.216.196]:34269 "EHLO
        mail-qt0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750851AbdBDPFr (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 4 Feb 2017 10:05:47 -0500
In-Reply-To: <CA+A7VXXgHVzSBZTeEhO2r75S-Te0UQ29voNiPkYE030Ji=WdzA@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@gmail.com>
Cc: Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux@endlessm.com, =?UTF-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@endlessm.com>

On Wed, Feb 1, 2017 at 2:21 PM, Jo=C3=A3o Paulo Rechi Vita <jprvita@gmail.c=
om> wrote:
> On 27 January 2017 at 10:37, Andy Shevchenko <andy.shevchenko@gmail.com> =
wrote:
>> On Thu, Jan 26, 2017 at 5:30 PM, Jo=C3=A3o Paulo Rechi Vita
>> <jprvita@gmail.com> wrote:

>>>   Revert "asus-wmi: Add quirk_no_rfkill_wapf4 for the Asus X456UA"
>>>   Revert "asus-wmi: Add quirk_no_rfkill_wapf4 for the Asus X456UF"
>>>   Revert "asus-wmi: Add quirk_no_rfkill for the Asus Z550MA"
>>>   Revert "asus-wmi: Add quirk_no_rfkill for the Asus U303LB"
>>>   Revert "asus-wmi: Add quirk_no_rfkill for the Asus N552VW"
>>>   Revert "asus-wmi: Create quirk for airplane_mode LED"
>>
>> Don't do this.
>> Each of them will break the working case -> means regression on user exp=
erience.
>>
>
> They are being substituted by a generic fix implemented by the
> following two  commits, so the user experience will not change at all
> after the whole series get merged.
>
>>>   asus-wireless: Export ids list
>>>   asus-wmi: Don't register rfkill if ASHS and user bit are present
>>>
>
> Or your point is that these two should come before the reverts? I
> thought patchsets were looked at as an unit from the user experience /
> functionally perspective. Can you please advise on what is the correct
> approach here?

You prepare entire new infrastructure and then you have two options:
1. Remove old stuff and apply new use in one patch
2. Replace old calls by new ones in one patch, and remove not used
anymore old stuff in the other patch.

Choose whatever suits better.

--=20
With Best Regards,
Andy Shevchenko
