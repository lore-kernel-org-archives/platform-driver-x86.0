From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: intel-vbtn: reduce unnecessary messages for
 normal users
Date: Mon, 24 Jul 2017 12:19:25 +0300
Message-ID: <CAHp75VfCht3djwme6HzrSNzkQ4vCYEwbB_kBM6fYL8L-KBu5Og@mail.gmail.com>
References: <1500609408-30745-1-git-send-email-alex.hung@canonical.com> <20170721231620.GB7888@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-oi0-f65.google.com ([209.85.218.65]:36775 "EHLO
        mail-oi0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751403AbdGXJT1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 24 Jul 2017 05:19:27 -0400
Received: by mail-oi0-f65.google.com with SMTP id m65so5578284oik.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 24 Jul 2017 02:19:27 -0700 (PDT)
In-Reply-To: <20170721231620.GB7888@fury>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Alex Hung <alex.hung@canonical.com>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>

On Sat, Jul 22, 2017 at 2:16 AM, Darren Hart <dvhart@infradead.org> wrote:
> On Thu, Jul 20, 2017 at 08:56:48PM -0700, Alex Hung wrote:
>> Unsupported events is only useful for developers and does not meaningful
>> for users. Using dev_dbg makes more sense and reduces noise in kernel
>> messages.

>> -     dev_info(&device->dev, "unknown event index 0x%x\n", event);
>> +     dev_dbg(&device->dev, "unknown event index 0x%x\n", event);
>
> info is the most common log level for these events in the platform
> driver x86 subsystem per 'git grep -i "unknown event"'.
>
> My take on this is that we want these to be reported by users, rather
> than rely on developers to find them all - especially as the developers
> only see a fraction of the affected hardware.
>
> Are you finding these to be causing a problem / or producing really
> excessive log messages?
>
> Andy, what are your thoughts?

My opinion is slightly closer to Rafael's one.

I think this is a debugging context.

If we really care about reporting them we might go HID way, i.e. using
dev_printk(KERN_DEBUG ) with module parameter debug.

As developer I'm against that.
As a regular user I do not need to recompile a kernel, in case there
is no dynamic debug support, and it allows me to enable debug
messages.

P.S. To see how important message above is, do we have any statistics
how many bug reports / email we got wrt the issue and how many had
been addressed?

-- 
With Best Regards,
Andy Shevchenko
