From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] add support for battery charging threshold, mute.
 correctly save ac/dc brightness to hardware registers
Date: Wed, 19 Aug 2020 10:50:12 +0300
Message-ID: <CAHp75VdWhSTqCikgnF5vvgw5x96QV5MXBDOWnL4gWt+Z-QK0MQ@mail.gmail.com>
References: <20200818180223.14282-1-kenneth.t.chan@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200818180223.14282-1-kenneth.t.chan@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kenneth Chan <kenneth.t.chan@gmail.com>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Harald Welte <laforge@gnumonks.org>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Aug 18, 2020 at 9:03 PM Kenneth Chan <kenneth.t.chan@gmail.com> wrote:
>

Thank you for a patch, but it misses few crucial points:
 - it should have good description as commit message (body of this letter)
 - it should have signature of origin (Signed-off-by tag) that I can
proceed (I see, it's in wrong position, use `git commit -s` to fix
this)
 - it should be split per one logical change in a patch, e.g. 1)
replacing ACPI prints by pr_*() macros, 2) split MODULE_AUTHOR() by
one author per macro call, 3) etc...


> Signed-off-by: Kenneth Chan <kenneth.t.chan@gmail.com>



-- 
With Best Regards,
Andy Shevchenko
