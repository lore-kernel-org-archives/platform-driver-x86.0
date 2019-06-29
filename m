From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: acer-wmi: Mark expected switch fall-throughs
Date: Sat, 29 Jun 2019 16:13:16 +0300
Message-ID: <CAHp75Vf52tq9UWx9sr3VihZSddQMoEcqeXWzW4y6CJFq7cgH0w@mail.gmail.com>
References: <20190508164934.GA20064@embeddedor> <20190508230645.GB32286@wrath> <b1869c7f-0927-9a30-a195-a188719c748c@embeddedor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <b1869c7f-0927-9a30-a195-a188719c748c@embeddedor.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: Darren Hart <dvhart@infradead.org>, "Lee, Chun-Yi" <jlee@suse.com>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kees Cook <keescook@chromium.org>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, May 9, 2019 at 4:48 AM Gustavo A. R. Silva
<gustavo@embeddedor.com> wrote:

> Commit 5c742b45dd5fbbb6cf74d3378341704f4b23c5e8 mentions that "This was fixed
> in acer_acpi some time ago, but I forgot to port the patch over to acer-wmi
> when it was merged." Notice that this driver (acer-wmi) is based on the
> no-longer existing acer_acpi driver. But after googling for a while I could
> found the fix the original author talks about:
>
> https://repo.or.cz/acer_acpi.git/commitdiff/74c08a38875ffa9989c3100947650ac8a388c189
>
> So, the fix is indeed similar and contains the same fall-throughs from case
> ACER_AMW0_V2 to case ACER_WMID in both functions get_u32() and set_u32().

Pushed to my review and testing queue, thanks!

-- 
With Best Regards,
Andy Shevchenko
