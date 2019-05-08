From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] fix double fetch in wmi_ioctl.
Date: Wed, 8 May 2019 11:40:30 +0300
Message-ID: <CAHp75VeZgWxEvrVGajiosPCZNMwobYV9OjC4sVyW_pajK5B3Zw@mail.gmail.com>
References: <20190508082319.GA8817@hjy-HP-Notebook>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190508082319.GA8817@hjy-HP-Notebook>
Sender: linux-kernel-owner@vger.kernel.org
To: JingYi Hou <houjingyi647@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, May 8, 2019 at 11:23 AM JingYi Hou <houjingyi647@gmail.com> wrote:
> There is a double fetch problem in function wmi_ioctl.
> After second fetch overwrite the length to avoid this.
> buf->length is not used now,but it may in the future.
> It is good to get it fixed up.

So, there is no issue right now.
Patch is not needed then.

Thanks!

-- 
With Best Regards,
Andy Shevchenko
