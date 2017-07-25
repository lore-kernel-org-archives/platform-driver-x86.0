From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 2/2] platform/x86: alienware-wmi: fix format string
 overflow warning
Date: Tue, 25 Jul 2017 09:23:36 +0200
Message-ID: <CAK8P3a3nHzpeRfKa3Ac9+qxEm1EdSUaUqAr_0G9+-NXZs4d34Q@mail.gmail.com>
References: <20170720160114.3261176-1-arnd@arndb.de> <20170720160114.3261176-2-arnd@arndb.de>
 <CAHp75VcEaqoESA_JPtV28E4emE5JTzd4t2SVLxYcn=spFzhBmA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-oi0-f68.google.com ([209.85.218.68]:36799 "EHLO
        mail-oi0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750746AbdGYHXh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 25 Jul 2017 03:23:37 -0400
In-Reply-To: <CAHp75VcEaqoESA_JPtV28E4emE5JTzd4t2SVLxYcn=spFzhBmA@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, gregkh <gregkh@linuxfoundation.org>

On Mon, Jul 24, 2017 at 11:22 AM, Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Thu, Jul 20, 2017 at 7:00 PM, Arnd Bergmann <arnd@arndb.de> wrote:
>> gcc points out a possible format string overflow for a large value of 'zone':
>>
>> drivers/platform/x86/alienware-wmi.c: In function 'alienware_wmi_init':
>> drivers/platform/x86/alienware-wmi.c:461:24: error: '%02X' directive writing between 2 and 8 bytes into a region of size 6 [-Werror=format-overflow=]
>>    sprintf(buffer, "zone%02X", i);
>>                         ^~~~
>> drivers/platform/x86/alienware-wmi.c:461:19: note: directive argument in the range [0, 2147483646]
>>    sprintf(buffer, "zone%02X", i);
>>                    ^~~~~~~~~~
>> drivers/platform/x86/alienware-wmi.c:461:3: note: 'sprintf' output between 7 and 13 bytes into a destination of size 10
>>
>> This replaces the 'int' variable with an 'u8' to make sure
>> it always fits, renaming the variable to 'zone' for clarity.
>>
>> Unfortunately, gcc-7.1.1 still warns about it with that change, which
>> seems to be unintended by the gcc developers. I have opened a bug
>> against gcc with a reduced test case. As a workaround, I also
>> change the format string to use "%02hhX", which shuts up the
>> warning in that version.
>>
>
> Thanks, pushed to testing with slight change (+ empty lines after u8
> zone; where it's applicable).
> I'm not going to move this to fixes queue since it looks to me not
> critical at all. Drop me a message if you think otherwise.

Sounds good, thanks! This instance is harmless, and the warning is now
globally disabled in stable kernels (and in mainline). I plan to send a patch
to re-enable the warning in mainline once all the other instances are
addressed.  I don't think that Greg will backport that patch, but if he does,
then he may need some additional 30 patches besides this one.

          Arnd
