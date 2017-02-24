From: Pau Espin Pedrol <pespin.shar@gmail.com>
Subject: Re: [PATCH] eeepc-laptop: Skip unknown key messages 0x50 0x51
Date: Fri, 24 Feb 2017 14:01:30 +0100
Message-ID: <CAEGpDub7-ou3YJAOxxK-vj9RYNMp5ER752XMFVLdB8zWWisV8Q@mail.gmail.com>
References: <20170210174837.1078-1-pespin.shar@gmail.com> <CAHp75VfnbO_9gCfYJYCvnE-w=hkYORi+7pL5NpQCVf3UxTYZNw@mail.gmail.com>
 <CAEGpDuaw3uJoxbyOuTWyBodM-JgMd2hSqZUgg_wbyJa+9sJOjw@mail.gmail.com>
 <CAEGpDuZyFrN0CHy-E+FTwgSLfUKbA65ghenmq_fVK2qw1KDiPg@mail.gmail.com>
 <CAHp75Vem5Rxa+Ms5zop2zCHqExQfv9WPufQ6jPdCBpQQh0AN=w@mail.gmail.com> <20170223083631.GE18639@dtor-ws>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:34051 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751187AbdBXNCp (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 24 Feb 2017 08:02:45 -0500
In-Reply-To: <20170223083631.GE18639@dtor-ws>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Corentin Chary <corentin.chary@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, "dvhart@infradead.org" <dvhart@infradead.org>

>> Dmitry, do we have special events for AC (un)plug? What is the best
>> approach in your opinion?
>
> Not route them through input as they not input events would be the best.
>
Is my patch good enough for this or would you recommend doing it another way?

> I'd look into hooking up power_supply class.
>
Whys is this necessay? All the related information required is already
present in my system.
I already have two power_supply instances:
* /sys/class/power_supply/AC0/ (provided by module "ac"), contains
property "online" which is correctly updated to 1 when AC is plugged
and 0 when AC is unplugged.
* /sys/class/power_supply/BAT0/ (provided by module "battery"),
contains property "status" which is correctly updated to "Charging"
when AC is plugged and "Discharging" when AC is unplugged.
