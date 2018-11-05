From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH V7 6/9] misc/pvpanic : break dependency on ACPI
Date: Mon, 5 Nov 2018 15:00:30 +0200
Message-ID: <CAHp75VeukhU7s_uyVoEPDaVYFe5r6dGq1iEzXU5Kumiw7f-4gQ@mail.gmail.com>
References: <1541414431-84128-1-git-send-email-peng.hao2@zte.com.cn> <1541414431-84128-6-git-send-email-peng.hao2@zte.com.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1541414431-84128-6-git-send-email-peng.hao2@zte.com.cn>
Sender: linux-kernel-owner@vger.kernel.org
To: peng.hao2@zte.com.cn
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, hutao@cn.fujitsu.com, Linux Documentation List <linux-doc@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Nov 5, 2018 at 4:31 AM Peng Hao <peng.hao2@zte.com.cn> wrote:
>
> The pvpanic driver is available for architectures that do not
> support ACPI.So break the dependency.
>

Logically better to split this to two patches:
- preparation w/o any functional change, i.e. grouping ACPI related
stuff (which will go under #ifdef later on)
- do the OF extension

After addressing the split,
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

-- 
With Best Regards,
Andy Shevchenko
