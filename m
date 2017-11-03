From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2 0/3] Sony-laptop: Adjustments for sony_nc_setup_rfkill()
Date: Fri, 3 Nov 2017 14:02:37 +0200
Message-ID: <CAHp75VfaWLSwzLpnWHj0sD9ZVVbSCi+ya_+PESXjU2FbHefE0Q@mail.gmail.com>
References: <f33d9aa0-1a8e-f702-7513-5c0d5b464529@users.sourceforge.net>
 <CAHp75VcMkXCioCzmLE0+BTmkqc5RSOx9yPO0ectVHMrMvewgwg@mail.gmail.com> <17ee534c-9fe6-19c4-0522-76cd3cbe5f88@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <kernel-janitors-owner@vger.kernel.org>
In-Reply-To: <17ee534c-9fe6-19c4-0522-76cd3cbe5f88@users.sourceforge.net>
Sender: kernel-janitors-owner@vger.kernel.org
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, Darren Hart <dvhart@infradead.org>, Marco Chiappero <marco@absence.it>, Matthew Garrett <mjg@redhat.com>, Mattia Dongili <malattia@linux.it>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Andy Shevchenko <andy@infradead.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Nov 1, 2017 at 8:45 PM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 1 Nov 2017 19:34:56 +0100
>
> Three update suggestions were taken into account
> from static source code analysis.

I have applied first two, the last one is subject to discuss a necessity of it.

So, if Darren on my side than we won't apply it, if he opposes, I
would hear an argument why we might need it.

>
> Markus Elfring (3):
>   Fix exception handling
>   Delete an unnecessary variable initialisation
>   Use common error handling code
> ---
>
> v2:
> Two additional suggestions were taken into account from a corresponding
> source code review.
>
>  drivers/platform/x86/sony-laptop.c | 33 ++++++++++++++++++---------------
>  1 file changed, 18 insertions(+), 15 deletions(-)
>
> --
> 2.14.3
>



-- 
With Best Regards,
Andy Shevchenko
