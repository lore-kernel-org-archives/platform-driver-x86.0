From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: keyboard backlight max_brightness bug on Dell Latitude E6410
Date: Sat, 14 Oct 2017 16:50:27 +0300
Message-ID: <CAHp75VdFLfWiy+wGDpJtoWCUZtLpXkpGi-s1HzRWOPnxh8foQQ@mail.gmail.com>
References: <20170914063515.669a95d04dbb6b53be537852cb8ecb8c.39d3e774b5.wbe@email22.secureserver.net>
 <20170914135420.GO32278@pali> <CABFtUbQXBE+n+HV0cgMv0wLXuRkMqyp4J=Hf4BiBj8Hxc9eUaw@mail.gmail.com>
 <20170914152538.GQ32278@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f193.google.com ([209.85.220.193]:57138 "EHLO
        mail-qk0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753026AbdJNNu2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 14 Oct 2017 09:50:28 -0400
In-Reply-To: <20170914152538.GQ32278@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>
Cc: Gabriele Mazzotta <gabriele.mzt@gmail.com>, Mario Limonciello <Mario_Limonciello@dell.com>, "Gabriel M. Elder" <gabriel@tekgnowsys.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Sep 14, 2017 at 6:25 PM, Pali Roh=C3=A1r <pali.rohar@gmail.com> wro=
te:
> On Thursday 14 September 2017 16:33:57 Gabriele Mazzotta wrote:
>> 2017-09-14 15:54 GMT+02:00 Pali Roh=C3=A1r <pali.rohar@gmail.com>:
>> > Adding Gabriele to thread, IIRC you have machine which uses
>> > "supported keyboard light brightness levels"
>> > Can you look at this bug, if your machine is affected by it too?
>>
>> My keyboard has two brightness levels + off. The value of
>> max_brightness is 2, as expected.
>
> Ah :-(
>
> So you have "Supported Keyboard light brightness levels :  2" and you
> can se value 0, 1 or 2.
>
> And Gabriel has "Supported Keyboard light brightness levels :  10" and
> can set only values 0..9. But not 10.
>
> Any idea how to solve this situation?
>
> CCing Mario from Dell. Can you recheck what is wrong here? Or why
> Dell Latitude E6410 behaves differently?

To be clear, am I waiting for new version?

In any case I mark it as Changes Requested in my patchwork queue.

Feel free to send a new version.

--=20
With Best Regards,
Andy Shevchenko
