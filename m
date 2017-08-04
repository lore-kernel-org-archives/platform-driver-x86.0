From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v1] platform/x86: wmi: Switch to use new generic UUID API
Date: Fri, 4 Aug 2017 18:27:19 +0300
Message-ID: <CAHp75VcFB1BDNUG729mi5BkhcR_aBX4MzvoyzdRx=LaAg9=EHQ@mail.gmail.com>
References: <20170802132834.8223-1-andriy.shevchenko@linux.intel.com> <CALCETrU1vJXGUXhbwNkW1qi9c73tgxT0vWN7eO=ee21BrvNq0Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f172.google.com ([209.85.216.172]:34769 "EHLO
        mail-qt0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752132AbdHDP1U (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 4 Aug 2017 11:27:20 -0400
In-Reply-To: <CALCETrU1vJXGUXhbwNkW1qi9c73tgxT0vWN7eO=ee21BrvNq0Q@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Lutomirski <luto@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Aug 4, 2017 at 6:01 PM, Andy Lutomirski <luto@kernel.org> wrote:
>> On Aug 2, 2017, at 9:28 AM, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
>>
>> There are new types and helpers that are supposed to be used in new code.
>>
>> As a preparation to get rid of legacy types and API functions do
>> the conversion here.
>>
>> While here, update Copyright to reflect this change along with previous
>> one for the topic.

>> struct guid_block {
>> -    char guid[16];
>> +    guid_t guid;
>
> NAK.  guid_block is a firmware interface, so opaque kernel types don't
> belong in it.

I f we leave this, what do you think about everything else?

-- 
With Best Regards,
Andy Shevchenko
