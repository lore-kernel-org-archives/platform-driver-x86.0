From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: acerhdf: Replace HTTP links with HTTPS ones
Date: Wed, 15 Jul 2020 13:03:40 +0300
Message-ID: <CAHp75VcZ5f0xw9RbV0OZ0DuE6JqCfkTExqO=MJ9AE0TFdCV8Xg@mail.gmail.com>
References: <CAHp75Ve2pPGN3BtMw6x1xR5Cyv8VP=KMJMMJ9qao29ArrxPo9w@mail.gmail.com>
 <20200714190657.47527-1-grandmaster@al2klimov.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200714190657.47527-1-grandmaster@al2klimov.de>
Sender: linux-kernel-owner@vger.kernel.org
To: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Lee Jones <lee.jones@linaro.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Ayman Bagabas <ayman.bagabas@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Jul 14, 2020 at 10:07 PM Alexander A. Klimov
<grandmaster@al2klimov.de> wrote:
>
> Rationale:
> Reduces attack surface on kernel devs opening the links for MITM
> as HTTPS traffic is much harder to manipulate.
>
> Deterministic algorithm:
> For each file:
>   If not .svg:
>     For each line:
>       If doesn't contain `\bxmlns\b`:
>         For each link, `\bhttp://[^# \t\r\n]*(?:\w|/)`:
>           If neither `\bgnu\.org/license`, nor `\bmozilla\.org/MPL\b`:
>             If both the HTTP and HTTPS versions
>             return 200 OK and serve the same content:
>               Replace HTTP with HTTPS.

So, please unify two Acer patches now into one.

(And don't forget to provide proper version of the patch)

Thanks!

-- 
With Best Regards,
Andy Shevchenko
