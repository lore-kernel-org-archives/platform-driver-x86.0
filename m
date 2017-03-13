From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] eeepc-laptop: Skip unknown key messages 0x50 0x51
Date: Mon, 13 Mar 2017 18:04:42 +0200
Message-ID: <CAHp75VeuhiRvmxhy886N746KvXQq9ye8CG70DQ7UyU8=0PW1tg@mail.gmail.com>
References: <20170210174837.1078-1-pespin.shar@gmail.com> <CAHp75VfnbO_9gCfYJYCvnE-w=hkYORi+7pL5NpQCVf3UxTYZNw@mail.gmail.com>
 <CAEGpDuaw3uJoxbyOuTWyBodM-JgMd2hSqZUgg_wbyJa+9sJOjw@mail.gmail.com>
 <CAEGpDuZyFrN0CHy-E+FTwgSLfUKbA65ghenmq_fVK2qw1KDiPg@mail.gmail.com>
 <CAHp75Vem5Rxa+Ms5zop2zCHqExQfv9WPufQ6jPdCBpQQh0AN=w@mail.gmail.com>
 <20170223083631.GE18639@dtor-ws> <CAEGpDub7-ou3YJAOxxK-vj9RYNMp5ER752XMFVLdB8zWWisV8Q@mail.gmail.com>
 <20170307192701.GG13740@dtor-ws>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f194.google.com ([209.85.216.194]:34805 "EHLO
        mail-qt0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752132AbdCMQEo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 13 Mar 2017 12:04:44 -0400
In-Reply-To: <20170307192701.GG13740@dtor-ws>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Pau Espin Pedrol <pespin.shar@gmail.com>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Corentin Chary <corentin.chary@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, "dvhart@infradead.org" <dvhart@infradead.org>

On Tue, Mar 7, 2017 at 9:27 PM, Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
> On Fri, Feb 24, 2017 at 02:01:30PM +0100, Pau Espin Pedrol wrote:
>> >> Dmitry, do we have special events for AC (un)plug? What is the best
>> >> approach in your opinion?
>> >
>> > Not route them through input as they not input events would be the best.
>> >
>> Is my patch good enough for this or would you recommend doing it another way?
>

> From input POV your patch makes sense.

Could you give your tag?

>
>>
>> > I'd look into hooking up power_supply class.
>> >
>> Whys is this necessay? All the related information required is already
>> present in my system.
>> I already have two power_supply instances:
>> * /sys/class/power_supply/AC0/ (provided by module "ac"), contains
>> property "online" which is correctly updated to 1 when AC is plugged
>> and 0 when AC is unplugged.
>> * /sys/class/power_supply/BAT0/ (provided by module "battery"),
>> contains property "status" which is correctly updated to "Charging"
>> when AC is plugged and "Discharging" when AC is unplugged.
>
> If everything is already working then it is not necessary. I was
> trying to say that if it does not quite work, then you shoudl look into
> integrating it better with power supply subsystem, instead of trying to
> shoehorn it into input.

-- 
With Best Regards,
Andy Shevchenko
