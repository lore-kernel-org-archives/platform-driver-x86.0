From: Azael Avalos <coproscefalo@gmail.com>
Subject: Re: [PATCH] toshiba-wmi: Fix loading the driver on non Toshiba laptops
Date: Wed, 19 Oct 2016 17:27:49 -0600
Message-ID: <CAGdLNWFz8g3q15Ha5uvc9og6aiYFcKCLa7SDqz_e3xnLGnWa+w@mail.gmail.com>
References: <20160825185055.12143-1-coproscefalo@gmail.com>
 <20160828170037.GC96930@f23x64.localdomain> <CAGdLNWGderHFpsqcRc5FjHYOCokoKzfsTeMUkjyZYhAU3guQ0w@mail.gmail.com>
 <20161019202643.GB78689@f23x64.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-it0-f47.google.com ([209.85.214.47]:38130 "EHLO
        mail-it0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752006AbcJSX1w (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 19 Oct 2016 19:27:52 -0400
In-Reply-To: <20161019202643.GB78689@f23x64.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Carlos Corbacho <carlos@strangeworlds.co.uk>

Hi Darren,

2016-10-19 14:26 GMT-06:00 Darren Hart <dvhart@infradead.org>:
> On Wed, Oct 12, 2016 at 10:26:43AM -0600, Azael Avalos wrote:
>> *ping*
>>
>> 2016-08-28 11:00 GMT-06:00 Darren Hart <dvhart@infradead.org>:
>> > On Thu, Aug 25, 2016 at 12:50:55PM -0600, Azael Avalos wrote:
>> >> Bug 150611 uncovered that the WMI ID used by the toshiba-wmi driver
>> >> is not Toshiba specific, and as such, the driver was being loaded
>> >> on non Toshiba laptops too.
>> >>
>> >> This patch adds a DMI matching list checking for TOSHIBA as the
>> >> vendor, refusing to load if it is not.
>> >>
>> >> Also the WMI GUID was renamed, dropping the TOSHIBA_ prefix, to
>> >> better reflect that such GUID is not a Toshiba specific one.
>> >>
>> >> Cc: <stable@vger.kernel.org> # 4.4+
>> >> Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
>> >> ---
>> >> Hi Darren,
>> >>
>> >> I was waiting on input from the bug above, but haven't received an
>> >> answer (as of yet), so I decided to send this to the mailing list
>> >> for feedback as to whether this is the correct approach for this
>> >> issue.
>> >
>> > Thanks. Let's see if Carlos (wmi.c author) has an opinion...
>> >
>> > Carlos?
>>
>> Any input on this?
>
> Looks like a sane workaround to me. Queued to fixes.

Thanks.

>
> Want to going to stable?

If possible, yes, as this issue affects other laptop manufacturers,
we may never know if someone might try to load an older kernel
on an affected laptop and end up with the toshiba_wmi loaded
instead of the actual laptop support module, however, I'm not
sure if this is a "big" issue to bother stable, if not, simply drop
the cc to stable for me please.

> --
> Darren Hart
> Intel Open Source Technology Center


Cheers
Azael


-- 
-- El mundo apesta y vosotros apestais tambien --
