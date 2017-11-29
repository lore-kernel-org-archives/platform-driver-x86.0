From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: Intel "5-button array" support on MobileStudio Pro
Date: Wed, 29 Nov 2017 22:07:16 +0200
Message-ID: <CAHp75Vef9cr9Jwh9YH0WXzj7zfaLyqY+yTR4fG6OcO4c_ho99w@mail.gmail.com>
References: <5F052604-4CFE-44AA-9E41-2DB516D150A8@gmail.com>
 <72A46090-7434-4895-945F-25D7BD20DB40@gmail.com> <CAJ=jquZVX43Od-z3OkFEuO+8sWZ=L9e_vawsGAgNWXnk3-fLHw@mail.gmail.com>
 <CAHp75Vca-6mkNMOPzU4Chbo8qAT-CV6dnqzQBbEVfw=6_-_MGw@mail.gmail.com> <9f49f9caa7f543448828716efb10f57b@ausx13mpc120.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f175.google.com ([209.85.216.175]:35009 "EHLO
        mail-qt0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752177AbdK2UHS (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 29 Nov 2017 15:07:18 -0500
Received: by mail-qt0-f175.google.com with SMTP id u10so5983846qtg.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 29 Nov 2017 12:07:17 -0800 (PST)
In-Reply-To: <9f49f9caa7f543448828716efb10f57b@ausx13mpc120.AMER.DELL.COM>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario Limonciello <Mario.Limonciello@dell.com>
Cc: Alex Hung <alex.hung@canonical.com>, Jason Gerecke <killertofu@gmail.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, =?UTF-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>

On Tue, Nov 28, 2017 at 9:50 PM,  <Mario.Limonciello@dell.com> wrote:

>> > Any comments? I will create a patch for testing in a few days.
>>
>> Looking for a tables with HEBC and this one I only can tell that I
>> would assume that tables w/o HEBC can guess HEBC returns value for
>> supporting 5-button array.
>> Though to be on the safe side I would rather vote for DMI based quirk
>
> Andy,
>
> Could you provide any insight how this possibly works on Windows?

I have no clue. I just read tables where HEBC is present (most
probably it's from reference BIOS).
It returns NVS stored 32-bit variable. Which is written by BIOS.

In the table in question we have no differences in BTN*() methods WRT
BID value (have no idea what's that).
I assume in case of HEBC() they would probably return a constant no matter what.

> I would expect that corner cases like this should completely fall over
> on Windows since it's an Intel driver and not customized per
> OEM or anything.

I might try to ask around, though I have no idea who did that driver.

> Maybe would it be possible for the folks at Intel
> who worked on the Windows driver to share information about anything
> different they're doing with regards to something like a possibly missing
> HEBC?

I don't know whom to ask. I might try, it would take time (sometimes
days, sometimes weeks).

-- 
With Best Regards,
Andy Shevchenko
