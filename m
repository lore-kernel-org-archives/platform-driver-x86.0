From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86/pcengines-apuv2: use KEY_RESTART for front button
Date: Thu, 25 Jul 2019 21:57:40 +0300
Message-ID: <CAHp75Vf1pyWjK6hbrNqDjk4v=H0nZLzwKHNK51XteTCo4-QJLA@mail.gmail.com>
References: <1563795379-7521-1-git-send-email-info@metux.net>
 <CAHp75Vch3KNCkwp69a_fBtMy3B3k=NEbAmPZE2cn5HSn577HOw@mail.gmail.com> <332c666b-1bb3-d4bb-ad1b-98b36992de71@metux.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <332c666b-1bb3-d4bb-ad1b-98b36992de71@metux.net>
Sender: linux-kernel-owner@vger.kernel.org
To: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc: "Enrico Weigelt, metux IT consult" <info@metux.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Jul 25, 2019 at 9:50 PM Enrico Weigelt, metux IT consult
<lkml@metux.net> wrote:
>
> On 25.07.19 19:17, Andy Shevchenko wrote:
> > On Mon, Jul 22, 2019 at 2:36 PM Enrico Weigelt, metux IT consult
> > <info@metux.net> wrote:
> >>
> >> From: Enrico Weigelt <info@metux.net>
> >>
> >> The keycode KEY_RESTART is more appropriate for the front button,
> >> as most people use it for things like restart or factory reset.
> >>
> >
> > Should it go as Fixes?
>
> I think so. Technically, the feature already worked, but the keycode
> wasn't semantically fine.

Can you provide a Fixes tag?

-- 
With Best Regards,
Andy Shevchenko
