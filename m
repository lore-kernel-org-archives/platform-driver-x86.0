From: Jason Gerecke <killertofu@gmail.com>
Subject: Re: [PATCH][V2] intel-hid: add a DMI quirk to support Wacom
 MobileStudio Pro
Date: Mon, 11 Dec 2017 14:13:40 -0800
Message-ID: <CANRwn3SpSfwpJk7OitXv6aLK4ES=AbHkmj7iyQsUP_dbZqbJTA@mail.gmail.com>
References: <1512618023-30209-1-git-send-email-alex.hung@canonical.com> <20171209000423.GD14187@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ua0-f194.google.com ([209.85.217.194]:41440 "EHLO
        mail-ua0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750929AbdLKWNl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 11 Dec 2017 17:13:41 -0500
Received: by mail-ua0-f194.google.com with SMTP id q13so13056438uaq.8
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Dec 2017 14:13:41 -0800 (PST)
In-Reply-To: <20171209000423.GD14187@fury>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Alex Hung <alex.hung@canonical.com>, andy@infradead.org, platform-driver-x86@vger.kernel.org, Jason Gerecke <jason.gerecke@wacom.com>

On Fri, Dec 8, 2017 at 4:04 PM, Darren Hart <dvhart@infradead.org> wrote:
> On Thu, Dec 07, 2017 at 11:40:23AM +0800, Alex Hung wrote:
>> HEBC method reports capabilities of 5 button array but Wacom
>> MobileStudio Pro does not have this control method. A DMI quirk
>> was created to enable 5 button array for this system.
>
> Jason, have you been able to verify this patch with testing?
>

I tested the attachment at [1], which produces an identical copy of
intel-hid.c as applying this patch to the
platform-drivers-x86/review-dvhart branch of
git://git.infradead.org/users/dvhart/linux-platform-drivers-x86.git.

Assuming that's the correct code, feel free to attach the following:
Tested-by: Jason Gerecke <jason.gerecke@wacom.com>

[1]: https://bugzilla.kernel.org/attachment.cgi?id=3D261033

Jason
---
Now instead of four in the eights place /
you=E2=80=99ve got three, =E2=80=98Cause you added one  /
(That is to say, eight) to the two,     /
But you can=E2=80=99t take seven from three,    /
So you look at the sixty-fours....

>> [V2] Update DMI strings from shipping systems
>
> Please place patch versioning detail below the --- in the future
>
>> Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=3D197991
>>
>> Reported-by: Jason Gerecke <jason.gerecke@wacom.com>
>> Signed-off-by: Alex Hung <alex.hung@canonical.com>
>> ---
>
> here (see submitting patches docs for details)
>
>
> --
> Darren Hart
> VMware Open Source Technology Center
