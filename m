From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 5.8 regression fix] platform/x86: thinkpad_acpi: Revert:
 Use strndup_user() in dispatch_proc_write()
Date: Tue, 14 Jul 2020 11:21:48 +0300
Message-ID: <CAHp75Vd6uGNw5m3-Tc1tkABLT_Wi7CtW2yo8+B5TpYV4U8XE9A@mail.gmail.com>
References: <20200714081510.6070-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200714081510.6070-1-hdegoede@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Thinkpad-acpi devel ML <ibm-acpi-devel@lists.sourceforge.net>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Jul 14, 2020 at 11:15 AM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Commit 35d13c7a0512 ("platform/x86: thinkpad_acpi: Use strndup_user()
> in dispatch_proc_write()") cleaned up dispatch_proc_write() by replacing
> the code to copy the passed in data from userspae with strndup_user().

user space

> But strndup_user() expects a 0 terminated input buffer and the buffer
> passed to dispatch_proc_write() is NOT 0 terminated.
>
> So this change leads to strndup_user() copying some extra random bytes
> from userspace till it hits a 0 byte.
>
> This commit reverts the change to use strndup_user() fixing the
> buffer being passed to the ibm_struct.write() call back containing extra
> junk at the end.

Can we simply use memdup_user()?
And thanks for catching this up!

-- 
With Best Regards,
Andy Shevchenko
