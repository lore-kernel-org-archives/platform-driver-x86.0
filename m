From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: disable bluetooth for some machines
Date: Thu, 7 Mar 2019 14:41:39 +0200
Message-ID: <CAHp75VfCfmqZyBs+8Mr9sh2C_y+XanA0C_NA2uhDJD3yQDh6dQ@mail.gmail.com>
References: <20190307080820.9723-1-jiaxun.yang@flygoat.com>
 <20190307112041.GC13633@kroah.com> <c84c9553-e31b-a175-59a3-aeb35afd0854@flygoat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <c84c9553-e31b-a175-59a3-aeb35afd0854@flygoat.com>
Sender: stable-owner@vger.kernel.org
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, ibm-acpi-devel@lists.sourceforge.net, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Stable <stable@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Mar 7, 2019 at 2:30 PM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
> > On Thu, Mar 07, 2019 at 04:08:20PM +0800, Jiaxun Yang wrote:
> >> Some AMD based ThinkPads have a firmware bug that calling
> >> "GBDC" will cause bluetooth on Intel wireless cards blocked.
> >>
> >> Probe these models by DMI match and disable bluetooth subdriver
> >> if specified Intel wireless card exist.

> Thanks for remind.
>
> Should I resend this patch in correct way?

It still needs a bit of work, and as I told you, we are now during an
opened merge window.

-- 
With Best Regards,
Andy Shevchenko
