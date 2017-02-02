From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: silead depends on I2C being built-in
Date: Thu, 2 Feb 2017 17:24:51 +0200
Message-ID: <CAHp75Ve5mgsoRjr-LiCWG6inYp8bcSKk__XN7xynt_T_tkDYWQ@mail.gmail.com>
References: <20170202142744.3418986-1-arnd@arndb.de> <859e4199-8c8d-c1a8-6898-5ed4fe4572e4@redhat.com>
 <CAHp75VfgGOGhO-U_dMWGvnChUqXnuxwC-xKSMNs-FJeyBzOoDw@mail.gmail.com> <3f7dc6b8-7447-f067-b771-8a306800ede3@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f175.google.com ([209.85.216.175]:34784 "EHLO
        mail-qt0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751201AbdBBPYy (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 2 Feb 2017 10:24:54 -0500
In-Reply-To: <3f7dc6b8-7447-f067-b771-8a306800ede3@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Feb 2, 2017 at 5:10 PM, Hans de Goede <hdegoede@redhat.com> wrote:
> On 02-02-17 16:01, Andy Shevchenko wrote:
>> On Thu, Feb 2, 2017 at 4:45 PM, Hans de Goede <hdegoede@redhat.com> wrote:

>>> Thank you.
>>>
>>> Acked-by: Hans de Goede <hdegoede@redhat.com>
>>
>>
>> I'm a bit confused now:
>>
>> http://www.spinics.net/lists/platform-driver-x86/msg10408.html
>>
>> Please, clarify.
>
> The depends on INPUT is not entirely wrong, the module does not
> need it, but without the SILEAD driver being build the silead_dmi
> code is of no use. Since multiple people already reported this
> I thought it would be best to just go ahead with Arnd's version.

Thanks, pushed to testing.

-- 
With Best Regards,
Andy Shevchenko
