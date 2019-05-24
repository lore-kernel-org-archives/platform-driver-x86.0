From: Daniel Drake <drake@endlessm.com>
Subject: Re: [PATCH v4 03/13] platform/x86: asus-wmi: Increase input buffer
 size of WMI methods
Date: Fri, 24 May 2019 14:01:14 -0600
Message-ID: <CAD8Lp46s0agX15gSXq_hXc2TFn9v9dfZYi7+j=HuQJdGBK2Hug@mail.gmail.com>
References: <c8cdb347-e206-76b2-0d43-546ef660ffb7@gmail.com> <4613f54b-b6ba-c9ad-15ca-e43d440b9f63@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4613f54b-b6ba-c9ad-15ca-e43d440b9f63@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yurii Pavlovskyi <yurii.pavlovskyi@gmail.com>
Cc: Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Chris Chiu <chiu@endlessm.com>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, May 14, 2019 at 12:54 PM Yurii Pavlovskyi
<yurii.pavlovskyi@gmail.com> wrote:
>
> The asus-nb-wmi driver is matched by WMI alias but fails to load on TUF
> Gaming series laptops producing multiple ACPI errors in the kernel log.
>
> The input buffer for WMI method invocation size is 2 dwords, whereas
> 3 are expected by this model.
>
> FX505GM:
> ..
> Method (WMNB, 3, Serialized)
> {
>     P8XH (Zero, 0x11)
>     CreateDWordField (Arg2, Zero, IIA0)
>     CreateDWordField (Arg2, 0x04, IIA1)
>     CreateDWordField (Arg2, 0x08, IIA2)
>     Local0 = (Arg1 & 0xFFFFFFFF)
>     ...
>
> Compare with older K54C:
> ...
> Method (WMNB, 3, NotSerialized)
> {
>     CreateDWordField (Arg2, 0x00, IIA0)
>     CreateDWordField (Arg2, 0x04, IIA1)
>     Local0 = (Arg1 & 0xFFFFFFFF)
>     ...
>
> Increase buffer size to 3 dwords. No negative consequences of this change
> are expected, as the input buffer size is not verified. The original
> function is replaced by a wrapper for a new method passing value 0 for the
> last parameter. The new function will be used to control RGB keyboard
> backlight.
>
> Signed-off-by: Yurii Pavlovskyi <yurii.pavlovskyi@gmail.com>

Reviewed-by: Daniel Drake <drake@endlessm.com>
