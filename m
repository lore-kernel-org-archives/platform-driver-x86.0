From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: sony-laptop: Mark expected switch fall-through
Date: Sat, 7 Jul 2018 19:19:04 +0300
Message-ID: <CAHp75VcZ96tU5aKfNuSn5emJzavC1W3C2ovdwgWE-66kF0xWGA@mail.gmail.com>
References: <20180705204703.GA12352@embeddedor.com> <20180706232427.GC3041@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180706232427.GC3041@fury>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Mattia Dongili <malattia@linux.it>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Sat, Jul 7, 2018 at 2:24 AM, Darren Hart <dvhart@infradead.org> wrote:

>         return AE_CTRL_TERMINATE;
>
> Is unreachable as there are no "break" statements in the switch, and the default
> falls through to return AE_OK. Something doesn't seem right here.

Darren, I didn't look at the code in question, though just to clarify
such error codes.
If the function used in acpi_walk_namespace() or alike, AE_OK means
"To continue", while AE_CTRL_TERMINATE to "stop, whatever we looked
for is found right now".

-- 
With Best Regards,
Andy Shevchenko
