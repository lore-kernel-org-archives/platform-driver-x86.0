From: Alex Hung <alex.hung@canonical.com>
Subject: Re: Intel "5-button array" support on MobileStudio Pro
Date: Mon, 27 Nov 2017 21:42:29 +0800
Message-ID: <CAJ=jquZVX43Od-z3OkFEuO+8sWZ=L9e_vawsGAgNWXnk3-fLHw@mail.gmail.com>
References: <5F052604-4CFE-44AA-9E41-2DB516D150A8@gmail.com> <72A46090-7434-4895-945F-25D7BD20DB40@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:59711 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751467AbdK0Nmc (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 27 Nov 2017 08:42:32 -0500
Received: from mail-qt0-f198.google.com ([209.85.216.198])
        by youngberry.canonical.com with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
        (Exim 4.76)
        (envelope-from <alex.hung@canonical.com>)
        id 1eJJg7-00039Y-Es
        for platform-driver-x86@vger.kernel.org; Mon, 27 Nov 2017 13:42:31 +0000
Received: by mail-qt0-f198.google.com with SMTP id j12so9257409qtc.20
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Nov 2017 05:42:31 -0800 (PST)
In-Reply-To: <72A46090-7434-4895-945F-25D7BD20DB40@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jason Gerecke <killertofu@gmail.com>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, Michal Kepien <kernel@kempniu.pl>

On Sun, Nov 26, 2017 at 2:28 AM, Jason Gerecke <killertofu@gmail.com> wrote:
> On November 25, 2017 10:23:33 AM PST, Jason Gerecke <killertofu@gmail.com> wrote:
>>I've just filed a bug [1] about a device which appears to use the
>>"5-button array" that the patch [2] added support for earlier this
>>year. It seems that on this particular device (a Wacom MobileStudio
>>Pro), there is no "HEBC" entry in the ACPI table. Because of this, the
>>kernel does not load support for the "5-button array" that this device
>>seems to use.

HEBC seems to be the control method that can report 5 button array;
however, I think we can use either one of the below to workaround
this:

1. Add a kernel parameter and a quirk (ex. DMI strings). The downside
is the quirk can grow if more systems do not include HEBC

2. Check both HEBC & BTNL (ex. the method that enables 5 button
array). Either one enables 5 button array and this fixes current
problems.

While 2 is preferable, nothing stops future BIOS skips BTNL in the future...

Any comments? I will create a patch for testing in a few days.

>>
>>Please let me know what additional information would be helpful to
>>provide. I am able to test kernel patches.
>>
>>[1]: https://bugzilla.kernel.org/show_bug.cgi?id=197991
>>
>>[2]: https://patchwork.kernel.org/patch/9571353/
>>
>>Jason
>>---
>>Now instead of four in the eights place /
>>you’ve got three, ‘Cause you added one  /
>>(That is to say, eight) to the two,     /
>>But you can’t take seven from three,    /
>>So you look at the sixty-fours....
>
> Apologies: Other recipients were not properly added on the first mail...



-- 
Cheers,
Alex Hung
