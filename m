From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: ideapad-laptop: hide unused 'touchpad_store'
Date: Mon, 22 May 2017 20:02:43 +0300
Message-ID: <CAHp75Ve5cN4bkA1Q2-6_N6wz0ZCsps3fOnb1Kobi_wK5=Hn4Jg@mail.gmail.com>
References: <20170522130709.242445-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f193.google.com ([209.85.220.193]:36727 "EHLO
        mail-qk0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757323AbdEVRCp (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 22 May 2017 13:02:45 -0400
In-Reply-To: <20170522130709.242445-1-arnd@arndb.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Ike Panhc <ike.pan@canonical.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, =?UTF-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>, Brian Masney <masneyb@onstation.org>, Ritesh Raj Sarraf <rrs@debian.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, May 22, 2017 at 4:07 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> A readonly sysfs property must not have a 'store' function:
>
> drivers/platform/x86/ideapad-laptop.c:438:16: error: 'touchpad_store' defined but not used [-Werror=unused-function]
>
> We can either comment it out or remove the function entirely,
> without a good reason one or or another I picked the second option.

Hmm... I was expecting something like this but didn't get a single
error from kbuild bot.

>
> Fixes: 7f363145992c ("platform/x86: ideapad-laptop: Switch touchpad attribute to be RO")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/platform/x86/ideapad-laptop.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
> index f7a4608cc60b..c4c7ae3179c0 100644
> --- a/drivers/platform/x86/ideapad-laptop.c
> +++ b/drivers/platform/x86/ideapad-laptop.c
> @@ -435,6 +435,8 @@ static ssize_t touchpad_show(struct device *dev,
>         return sprintf(buf, "%lu\n", result);
>  }
>
> +#if 0
> +/* Switch to RO for now: It might be revisited in the future */

Can we use __maybe_unused instead?

-- 
With Best Regards,
Andy Shevchenko
