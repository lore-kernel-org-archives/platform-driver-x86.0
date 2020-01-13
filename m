From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: asus-wmi: Fix keyboard brightness cannot be
 set to 0
Date: Mon, 13 Jan 2020 11:47:12 +0200
Message-ID: <CAHp75VcPuhRJ8q4x7UUrJV5AMEGV2iMm6_KrVaH8+GtE3AjaOQ@mail.gmail.com>
References: <20191230083044.11582-1-jian-hong@endlessm.com>
 <CAD8Lp45Le=s=1Q9oi0JCJTPepNmX002hK7W6UwKztTq09QBUgw@mail.gmail.com> <CAD8Lp44Vd6Moi+UmbdZDsQx-e_CHoHbgtZHpf8sV_yuHwzRrBA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAD8Lp44Vd6Moi+UmbdZDsQx-e_CHoHbgtZHpf8sV_yuHwzRrBA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Drake <drake@endlessm.com>
Cc: Jian-Hong Pan <jian-hong@endlessm.com>, Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Linux Upstreaming Team <linux@endlessm.com>, nweibley@gmail.com
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Jan 13, 2020 at 5:47 AM Daniel Drake <drake@endlessm.com> wrote:
>
> On Tue, Dec 31, 2019 at 2:53 PM Daniel Drake <drake@endlessm.com> wrote:
> > Here, writing 0x80 to turn off the keyboard LED will result in an
> > additional WRAM(0x9f0, 0) call that was not there before. I think we
> > should double check this detail.
> >
> > Let's see if we can borrow one of the affected models and double check
> > this patch there before proceeding. I'll follow up internally.
>
> Asus were unable to find a product sample with the affected behaviour.
> They did provide us with one from the list I had made, but with a
> newer BIOS version where that behaviour has been eliminated. They also
> advised that always setting bit 7 is the way they do it on Windows. So
> I don't think we have the opportunity for extra verification, but it
> should be safe.
>

> Reviewed-by: Daniel Drake <drake@endlessm.com>

Thank you, Daniel! I'll queue it soon to my tree.

-- 
With Best Regards,
Andy Shevchenko
