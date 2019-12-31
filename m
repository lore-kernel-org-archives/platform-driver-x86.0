From: Daniel Drake <drake@endlessm.com>
Subject: Re: [PATCH] platform/x86: asus-wmi: Fix keyboard brightness cannot be
 set to 0
Date: Tue, 31 Dec 2019 14:53:37 +0800
Message-ID: <CAD8Lp45Le=s=1Q9oi0JCJTPepNmX002hK7W6UwKztTq09QBUgw@mail.gmail.com>
References: <20191230083044.11582-1-jian-hong@endlessm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191230083044.11582-1-jian-hong@endlessm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jian-Hong Pan <jian-hong@endlessm.com>
Cc: Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Linux Upstreaming Team <linux@endlessm.com>, nweibley@gmail.com
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Dec 30, 2019 at 4:32 PM Jian-Hong Pan <jian-hong@endlessm.com> wrote:
>
> Some of ASUS laptops like UX431FL keyboard backlight cannot be set to
> brightness 0. According to ASUS' information, the brightness should be
> 0x80 ~ 0x83. This patch fixes it by following the logic.
>
> Fixes: e9809c0b9670 ("asus-wmi: add keyboard backlight support")

The spec says says bit 7 is Set light on, and bits 0~3 are level,
similar to the comment being removed. But indeed it isn't entirely
clear about how to turn it off (since what does Light on but level 0
mean?).

This code goes back to 2011, so there's a risk of inversely affecting
old models with this change.

I checked our DSDT collection and the behaviour is quite inconsistent.

On the UX431FLC that you fixed with this patch, we reach:

        Method (SLKI, 1, NotSerialized)
        {
            Local0 = (Arg0 & 0x80)
            If (Local0)
            {
                Local1 = (Arg0 & 0x7F)
                If ((Local1 >= 0x04))
                {
                    Local1 = Zero
                }

                \_SB.PCI0.LPCB.H_EC.KBLL = Local1
                KBLV = Local1
            }

            Return (Local0)
        }

Nothing will happen unless bit 0x80 is set. So that's why your patch
fixes the problem in this case. But In 81 DSDTs examined this is the
only model that exhibits this behaviour. Perhaps it is the very latest
revision that will be rolled out from this point.

Many other models have this:

        Name (PWKB, Buffer (0x04)
        {
             0x00, 0x55, 0xAA, 0xFF                           // .U..
        })
        Method (SLKB, 1, NotSerialized)
        {
            KBLV = (Arg0 & 0x7F)
            If ((Arg0 & 0x80))
            {
                Local0 = DerefOf (PWKB [KBLV])
            }
            Else
            {
                Local0 = Zero
            }

            ST9E (0x1F, 0xFF, Local0)
            Return (One)
        }

for which your patch is also OK. You can follow it through and see
that value 0x0 and 0x80 both result in the same single register write
of value 0.

But there are 30 models (e.g. UX331UN) that will see a behaviour
change via this patch:

        Method (SLKB, 1, NotSerialized)
        {
            KBLV = (Arg0 & 0x7F)
            If ((Arg0 & 0x80))
            {
                Local0 = 0x0900
                Local0 += 0xF0
                WRAM (Local0, KBLV)
                Local0 = DerefOf (PWKB [KBLV])
            }
            Else
            {
                Local0 = Zero
            }

            ST9E (0x1F, 0xFF, Local0)
            Return (One)
        }

Here, writing 0x80 to turn off the keyboard LED will result in an
additional WRAM(0x9f0, 0) call that was not there before. I think we
should double check this detail.

Let's see if we can borrow one of the affected models and double check
this patch there before proceeding. I'll follow up internally.

(I also checked eeepc, but it seems like they don't have a keyboard backlight)


> Signed-off-by: Jian-Hong Pan <jian-hong@endlessm.com>
> ---
>  drivers/platform/x86/asus-wmi.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
>
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 821b08e01635..982f0cc8270c 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -512,13 +512,7 @@ static void kbd_led_update(struct asus_wmi *asus)
>  {
>         int ctrl_param = 0;
>
> -       /*
> -        * bits 0-2: level
> -        * bit 7: light on/off
> -        */
> -       if (asus->kbd_led_wk > 0)
> -               ctrl_param = 0x80 | (asus->kbd_led_wk & 0x7F);
> -
> +       ctrl_param = 0x80 | (asus->kbd_led_wk & 0x7F);
>         asus_wmi_set_devstate(ASUS_WMI_DEVID_KBD_BACKLIGHT, ctrl_param, NULL);
>  }
>
> --
> 2.20.1
>
