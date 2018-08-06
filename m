From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: acer-wmi: refactor function has_cap
Date: Mon, 6 Aug 2018 23:16:31 +0300
Message-ID: <CAHp75VdrmVgGSTeT+rzyQbKwJyseq06b6s+d8aXCvimGgL3uMQ@mail.gmail.com>
References: <20180806200052.GA29026@embeddedor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180806200052.GA29026@embeddedor.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: "Lee, Chun-Yi" <jlee@suse.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Joe Perches <joe@perches.com>, David Laight <David.Laight@aculab.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Aug 6, 2018 at 11:00 PM, Gustavo A. R. Silva
<gustavo@embeddedor.com> wrote:
> Refactor function has_cap in order to avoid returning integer
> values, when instead it should return booleans.
>
> This code was detected with the help of Coccinelle.
>
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
> ---
>  drivers/platform/x86/acer-wmi.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
> index 8952173..ff1689d 100644
> --- a/drivers/platform/x86/acer-wmi.c
> +++ b/drivers/platform/x86/acer-wmi.c
> @@ -672,10 +672,7 @@ static void __init find_quirks(void)
>
>  static bool has_cap(u32 cap)
>  {
> -       if ((interface->capability & cap) != 0)
> -               return 1;
> -
> -       return 0;
> +       return (interface->capability & cap) != 0;
>  }

Thanks, as Joe mentioned even != 0 part is not needed (followed by
unneeded parens), though I would let it be (one line is good enough to
me) if there will be no strong preferences.

-- 
With Best Regards,
Andy Shevchenko
