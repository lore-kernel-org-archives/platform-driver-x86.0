From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] Sony-laptop: Use common error handling code in sony_nc_setup_rfkill()
Date: Tue, 31 Oct 2017 18:35:02 +0200
Message-ID: <CAHp75VeDYakxD_g+N0RcmXFmGR3Du+p2yRaTiYhNxgr+0SQ9og@mail.gmail.com>
References: <f33d9aa0-1a8e-f702-7513-5c0d5b464529@users.sourceforge.net>
 <CAHp75VcMkXCioCzmLE0+BTmkqc5RSOx9yPO0ectVHMrMvewgwg@mail.gmail.com> <dadb7068-e4ed-b91d-ce31-aca2d6afd9f3@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <kernel-janitors-owner@vger.kernel.org>
In-Reply-To: <dadb7068-e4ed-b91d-ce31-aca2d6afd9f3@users.sourceforge.net>
Sender: kernel-janitors-owner@vger.kernel.org
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Mattia Dongili <malattia@linux.it>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Oct 31, 2017 at 4:24 PM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:
>> Apparently this patch done without reading the actual code.
>
> I performed another simple software refactoring.

Which is _useless_ per se by the reasons you had been told already
_several_ times about.

Either you do a real fix (propagate correct error codes to upper
layers), or just don't bother at all.

>> NAK.

-- 
With Best Regards,
Andy Shevchenko
