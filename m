From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: acer-wmi: use true and false for boolean values
Date: Sun, 5 Aug 2018 13:26:20 +0300
Message-ID: <CAHp75Vc=HLMVhQ30z9LTM7z+nmYgYPSRJib0PVTVW8H25eYg5g@mail.gmail.com>
References: <20180805001839.GA22975@embeddedor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180805001839.GA22975@embeddedor.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: "Lee, Chun-Yi" <jlee@suse.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Sun, Aug 5, 2018 at 3:18 AM, Gustavo A. R. Silva
<gustavo@embeddedor.com> wrote:
> Return statements in functions returning bool should use true or false
> instead of an integer value.
>
> This code was detected with the help of Coccinelle.

>  static bool has_cap(u32 cap)
>  {
>         if ((interface->capability & cap) != 0)
> -               return 1;
> +               return true;
>
> -       return 0;
> +       return false;
>  }

this entire function can be oneliner:

return !!(...);


-- 
With Best Regards,
Andy Shevchenko
