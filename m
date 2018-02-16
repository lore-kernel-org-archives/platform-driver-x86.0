From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v1] platform/x86: wmi: Replace kmalloc + sprintf() with kasprintf()
Date: Fri, 16 Feb 2018 21:30:03 +0200
Message-ID: <CAHp75VcjpZy75_t6z-9nN8hP=g0qb-skjOU4QtkUZxL7YRFUHQ@mail.gmail.com>
References: <20180216154024.389-1-andriy.shevchenko@linux.intel.com> <829ccf8330b7418a976205665e0ab4bd@AcuMS.aculab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <829ccf8330b7418a976205665e0ab4bd@AcuMS.aculab.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Laight <David.Laight@aculab.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Darren Hart <dvhart@infradead.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Feb 16, 2018 at 5:55 PM, David Laight <David.Laight@aculab.com> wrote:

>> kasprintf() does the job of two: kmalloc() and sprintf().
>> Replace two calls with one.
> ...
>> -             buf = kmalloc(strlen(wdriver->driver.name) + 5, GFP_KERNEL);
>> +             buf = kasprintf(GFP_KERNEL, "wmi/%s", wdriver->driver.name);
> ...
>
> Except that kasprintf() has no idea how long a buffer is needed.

Hmm...

> It might even do the printf twice just to get the length.

It does exactly that. So what?

-- 
With Best Regards,
Andy Shevchenko
