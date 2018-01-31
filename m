From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v1 1/2] platform/x86: intel-vbtn: Remove redundant inclusions
Date: Wed, 31 Jan 2018 20:59:20 +0200
Message-ID: <CAHp75VdFh06kL=4fpoKogyX6K08SyX1zkJOjzmVcGqUWFA+2Ew@mail.gmail.com>
References: <20180131175407.18301-1-andriy.shevchenko@linux.intel.com> <20180131185051.GC8676@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f181.google.com ([209.85.216.181]:34279 "EHLO
        mail-qt0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751391AbeAaS7V (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 31 Jan 2018 13:59:21 -0500
In-Reply-To: <20180131185051.GC8676@fury>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, AceLan Kao <acelan.kao@canonical.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Wed, Jan 31, 2018 at 8:50 PM, Darren Hart <dvhart@infradead.org> wrote:
> On Wed, Jan 31, 2018 at 07:54:06PM +0200, Andy Shevchenko wrote:
>> Some headers are not needed since the driver can be built as module.
>> Remove them.
>
> Removing init because it's included by module.h, and removing acpi_bus.h
> because it's included by acpi.h - but not because it can be built as a
> module - right?  Just checking, the wording in the commit msg seemed odd
> to me.

Correct. I'll rephrase this in place.

> These removals seem appropriate to me, but so we have it recorded here -
> in general, including headers that you explicitly make use of is good
> practice, and not depending on others to include them. But in this case,
> the implicit includes are reasonable expectations as they are tightly
> coupled with the parent include.

There are two classes of headers (at least?):
- let say "user-visible" ones, which drivers usually include like you
pointed above
- low level ones, which in most cases are not supposed to be included directly

So, for first class I agree with you, and acpi_bus.h in this case can
be considered as an example of second class.

> Reviewed-by: Darren Hart (VMware) <dvhart@infradead.org>

Thanks!

-- 
With Best Regards,
Andy Shevchenko
