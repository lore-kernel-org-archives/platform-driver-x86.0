From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: peaq-wmi: silence a static checker warning
Date: Tue, 18 Jul 2017 18:08:30 +0300
Message-ID: <CAHp75VdSD0zVFtnwF8oWt24P8DM6vZQNO93F_38yaCYBzCCBRw@mail.gmail.com>
References: <20170718092849.nim5tiaycdenfyfz@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-oi0-f45.google.com ([209.85.218.45]:35840 "EHLO
        mail-oi0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751445AbdGRPIc (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 18 Jul 2017 11:08:32 -0400
In-Reply-To: <20170718092849.nim5tiaycdenfyfz@mwanda>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Darren Hart <dvhart@infradead.org>, Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Tue, Jul 18, 2017 at 12:28 PM, Dan Carpenter
<dan.carpenter@oracle.com> wrote:
> Static checkers complain because:
>
>         if (peaq_ignore_events_counter && --peaq_ignore_events_counter >= 0)
>                                           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> The second part of the condition is always true because
> "peaq_ignore_events_counter" is unsigned.  It doesn't cause a problem
> because the first part of the condition prevents underflows, but it's
> simple enough to make the static checker happy.

Isn't it the same to

if (peaq_ignore_events_counter && peaq_ignore_events_counter--)

?

-- 
With Best Regards,
Andy Shevchenko
