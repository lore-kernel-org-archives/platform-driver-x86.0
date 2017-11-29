From: Alex Hung <alex.hung@canonical.com>
Subject: Re: Intel "5-button array" support on MobileStudio Pro
Date: Wed, 29 Nov 2017 23:06:38 +0800
Message-ID: <CAJ=jquY8Ff=P-MAMxPY2qWBwUyfz3xLaRftRw30t5tZQ5iyujA@mail.gmail.com>
References: <5F052604-4CFE-44AA-9E41-2DB516D150A8@gmail.com>
 <72A46090-7434-4895-945F-25D7BD20DB40@gmail.com> <CAJ=jquZVX43Od-z3OkFEuO+8sWZ=L9e_vawsGAgNWXnk3-fLHw@mail.gmail.com>
 <CAHp75Vca-6mkNMOPzU4Chbo8qAT-CV6dnqzQBbEVfw=6_-_MGw@mail.gmail.com> <9f49f9caa7f543448828716efb10f57b@ausx13mpc120.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:49195 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932879AbdK2PGo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 29 Nov 2017 10:06:44 -0500
Received: from mail-qk0-f200.google.com ([209.85.220.200])
        by youngberry.canonical.com with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
        (Exim 4.76)
        (envelope-from <alex.hung@canonical.com>)
        id 1eK3wh-0003N9-KM
        for platform-driver-x86@vger.kernel.org; Wed, 29 Nov 2017 15:06:43 +0000
Received: by mail-qk0-f200.google.com with SMTP id v193so2313551qka.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 29 Nov 2017 07:06:43 -0800 (PST)
In-Reply-To: <9f49f9caa7f543448828716efb10f57b@ausx13mpc120.AMER.DELL.COM>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario.Limonciello@dell.com
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Jason Gerecke <killertofu@gmail.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, =?UTF-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>

On Wed, Nov 29, 2017 at 3:50 AM,  <Mario.Limonciello@dell.com> wrote:
>> -----Original Message-----
>> From: platform-driver-x86-owner@vger.kernel.org [mailto:platform-driver-x86-
>> owner@vger.kernel.org] On Behalf Of Andy Shevchenko
>> Sent: Tuesday, November 28, 2017 1:28 PM
>> To: Alex Hung <alex.hung@canonical.com>
>> Cc: Jason Gerecke <killertofu@gmail.com>; platform-driver-x86@vger.kernel.org;
>> Michal Kepien <kernel@kempniu.pl>
>> Subject: Re: Intel "5-button array" support on MobileStudio Pro
>>
>> On Mon, Nov 27, 2017 at 3:42 PM, Alex Hung <alex.hung@canonical.com> wrote:
>> > On Sun, Nov 26, 2017 at 2:28 AM, Jason Gerecke <killertofu@gmail.com> wrote:
>> >> On November 25, 2017 10:23:33 AM PST, Jason Gerecke
>> <killertofu@gmail.com> wrote:
>> >>>I've just filed a bug [1] about a device which appears to use the
>> >>>"5-button array" that the patch [2] added support for earlier this
>> >>>year. It seems that on this particular device (a Wacom MobileStudio
>> >>>Pro), there is no "HEBC" entry in the ACPI table. Because of this, the
>> >>>kernel does not load support for the "5-button array" that this device
>> >>>seems to use.
>> >
>> > HEBC seems to be the control method that can report 5 button array;
>> > however, I think we can use either one of the below to workaround
>> > this:
>> >
>> > 1. Add a kernel parameter and a quirk (ex. DMI strings). The downside
>> > is the quirk can grow if more systems do not include HEBC
>> >
>> > 2. Check both HEBC & BTNL (ex. the method that enables 5 button
>> > array). Either one enables 5 button array and this fixes current
>> > problems.
>> >
>> > While 2 is preferable, nothing stops future BIOS skips BTNL in the future...
>> >
>> > Any comments? I will create a patch for testing in a few days.
>>
>> Looking for a tables with HEBC and this one I only can tell that I
>> would assume that tables w/o HEBC can guess HEBC returns value for
>> supporting 5-button array.
>> Though to be on the safe side I would rather vote for DMI based quirk

After thinking through again I think staying safe with DMI quirk may
be a good idea.

1. Only one system needs workaround now
2. Future systems may behave differently and we will have more test samples

Jason,
Please upload output of dmidecode to
https://bugzilla.kernel.org/show_bug.cgi?id=197991 and I can modify
intel-hid accordingly.

This may take couple days before I can find a system to test.

>
> Andy,
>
> Could you provide any insight how this possibly works on Windows?
> I would expect that corner cases like this should completely fall over
> on Windows since it's an Intel driver and not customized per
> OEM or anything.
>
> Maybe would it be possible for the folks at Intel
> who worked on the Windows driver to share information about anything
> different they're doing with regards to something like a possibly missing
> HEBC?  It would be good to do the same rather than bandage on a bunch
> of things tied to DMI quirks.  If it's not possible to obtain that information,
> then I would agree DMI quirks makes sense though.

If we can refer how it is done in Windows we can improve it but let's
try DMI quirk first.

>
> Thanks,
>
>>
>> >
>> >>>Please let me know what additional information would be helpful to
>> >>>provide. I am able to test kernel patches.
>> >>>
>> >>>[1]: https://bugzilla.kernel.org/show_bug.cgi?id=197991
>> >>>
>> >>>[2]: https://patchwork.kernel.org/patch/9571353/
>>
>> >>>Now instead of four in the eights place /
>> >>>you’ve got three, ‘Cause you added one  /
>> >>>(That is to say, eight) to the two,     /
>> >>>But you can’t take seven from three,    /
>> >>>So you look at the sixty-fours....
>>
>>
>> --
>> With Best Regards,
>> Andy Shevchenko



-- 
Cheers,
Alex Hung
