From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v3 03/11] platform/x86: asus-wmi: Increase the input
 buffer size of WMI methods
Date: Wed, 8 May 2019 16:30:03 +0300
Message-ID: <CAHp75Ve0MrS2_ROzo4_o9oTjTvs+GSfUn=2CRQx1L_W+5JR6Vw@mail.gmail.com>
References: <7acd57fe-604a-a96a-4ca2-a25bc88d6405@gmail.com> <5e1a56c3-0448-a648-e331-a2e1d0421b56@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5e1a56c3-0448-a648-e331-a2e1d0421b56@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yurii Pavlovskyi <yurii.pavlovskyi@gmail.com>
Cc: Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Daniel Drake <drake@endlessm.com>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Apr 19, 2019 at 1:07 PM Yurii Pavlovskyi
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


> -int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1, u32 *retval)
> +static int asus_wmi_evaluate_method_3dw(u32 method_id, u32 arg0, u32 arg1,
> +               u32 arg2, u32 *retval)

I would name as "..._method3" and move arg2 to previous line

>  {
>         struct bios_args args = {
>                 .arg0 = arg0,
>                 .arg1 = arg1,
> +               .arg2 = arg2

Keep comma, it will help in the future, like above helped you here.

--
With Best Regards,
Andy Shevchenko
