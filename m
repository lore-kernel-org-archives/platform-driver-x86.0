From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Remove always false 'value <
 0' statement
Date: Wed, 29 Apr 2020 15:35:34 +0300
Message-ID: <CAHp75VfmGQx=+pips170Wmw0ACAQ40NJTLcVTZaMrv3LrL1LHw@mail.gmail.com>
References: <1588150780-53718-1-git-send-email-wangxiongfeng2@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1588150780-53718-1-git-send-email-wangxiongfeng2@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Xiongfeng Wang <wangxiongfeng2@huawei.com>
Cc: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Thinkpad-acpi devel ML <ibm-acpi-devel@lists.sourceforge.net>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Apr 29, 2020 at 12:06 PM Xiongfeng Wang
<wangxiongfeng2@huawei.com> wrote:
>
> Since 'value' is declared as unsigned long, the following statement is
> always false.
>         value < 0
>
> So let's remove it.

It's bogus. The warning here doesn't tell anything useful, so doesn't the patch.

-- 
With Best Regards,
Andy Shevchenko
