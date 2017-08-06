From: Andy Lutomirski <luto@kernel.org>
Subject: Re: [PATCH v1] platform/x86: wmi: Switch to use new generic UUID API
Date: Sun, 6 Aug 2017 08:43:46 -0700
Message-ID: <CALCETrVUctPyYNjkLL3uZUdxFko9=tpMchpV09VpWEhbjMT16g@mail.gmail.com>
References: <20170802132834.8223-1-andriy.shevchenko@linux.intel.com>
 <CALCETrU1vJXGUXhbwNkW1qi9c73tgxT0vWN7eO=ee21BrvNq0Q@mail.gmail.com> <CAHp75VcFB1BDNUG729mi5BkhcR_aBX4MzvoyzdRx=LaAg9=EHQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VcFB1BDNUG729mi5BkhcR_aBX4MzvoyzdRx=LaAg9=EHQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Andy Lutomirski <luto@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Aug 4, 2017 at 8:27 AM, Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Fri, Aug 4, 2017 at 6:01 PM, Andy Lutomirski <luto@kernel.org> wrote:
>>> On Aug 2, 2017, at 9:28 AM, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
>>>
>>> There are new types and helpers that are supposed to be used in new code.
>>>
>>> As a preparation to get rid of legacy types and API functions do
>>> the conversion here.
>>>
>>> While here, update Copyright to reflect this change along with previous
>>> one for the topic.
>
>>> struct guid_block {
>>> -    char guid[16];
>>> +    guid_t guid;
>>
>> NAK.  guid_block is a firmware interface, so opaque kernel types don't
>> belong in it.
>
> I f we leave this, what do you think about everything else?

Assuming it works, it's fine with me.  I'd be happy to test.

Keep in mind that this beast is a *little-endian* GUID abomination,
and I don't see generic conversion helpers.  Something might need to
be added.

--Andy
