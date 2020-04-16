From: Maxim Mikityanskiy <maxtram95@gmail.com>
Subject: Re: [PATCH] platform/x86: intel_int0002_vgpio: Only bind to the
 INT0002 dev when using s2idle
Date: Fri, 17 Apr 2020 00:54:36 +0300
Message-ID: <CAKErNvqqHAVAkETsSjneSpaPNwoaHh1F=4XKS8F+ZBPp0gR0YQ@mail.gmail.com>
References: <20200407213058.62870-1-hdegoede@redhat.com> <CAKErNvqM9ax8RB+Hm0e70a_uk_Ok3KfSQDmy0q9jKFaAQM3Fsg@mail.gmail.com>
 <b876973e-71f4-1dbc-1b41-138f81511685@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <b876973e-71f4-1dbc-1b41-138f81511685@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "5 . 3+" <stable@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Apr 14, 2020 at 4:24 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 4/8/20 2:11 PM, Maxim Mikityanskiy wrote:
> > On Wed, Apr 8, 2020 at 12:31 AM Hans de Goede <hdegoede@redhat.com> wro=
te:
> >>
> >> Commit 871f1f2bcb01 ("platform/x86: intel_int0002_vgpio: Only implemen=
t
> >> irq_set_wake on Bay Trail") stopped passing irq_set_wake requests on t=
o
> >> the parents IRQ because this was breaking suspend (causing immediate
> >> wakeups) on an Asus E202SA.
> >>
> >> This workaround for this issue is mostly fine, on most Cherry Trail
> >> devices where we need the INT0002 device for wakeups by e.g. USB kbds,
> >> the parent IRQ is shared with the ACPI SCI and that is marked as wakeu=
p
> >> anyways.
> >>
> >> But not on all devices, specifically on a Medion Akoya E1239T there is
> >> no SCI at all, and because the irq_set_wake request is not passed on t=
o
> >> the parent IRQ, wake up by the builtin USB kbd does not work here.
> >>
> >> So the workaround for the Asus E202SA immediate wake problem is causin=
g
> >> problems elsewhere; and in hindsight it is not the correct fix,
> >> the Asus E202SA uses Airmont CPU cores, but this does not mean it is a
> >> Cherry Trail based device, Brasswell uses Airmont CPU cores too and th=
is
> >> actually is a Braswell device.
> >>
> >> Most (all?) Braswell devices use classic S3 mode suspend rather then
> >> s2idle suspend and in this case directly dealing with PME events as
> >> the INT0002 driver does likely is not the best idea, so that this is
> >> causing issues is not surprising.
> >>
> >> Replace the workaround of not passing irq_set_wake requests on to the
> >> parents IRQ, by not binding to the INT0002 device when s2idle is not u=
sed.
> >> This fixes USB kbd wakeups not working on some Cherry Trail devices,
> >> while still avoiding mucking with the wakeup flags on the Asus E202SA
> >> (and other Brasswell devices).
> >
> > I tested this patch over kernel 5.6.2 on Asus E202SA and didn't notice
> > any regressions. Wakeup by opening lid, by pressing a button on
> > keyboard, by USB keyboard =E2=80=94 all seem to work fine. So, if appro=
priate:
> >
> > Tested-by: Maxim Mikityanskiy <maxtram95@gmail.com>
>
> Thank you for testing this.
>
> > I have a question though. After your patch this driver will basically
> > be a no-op on my laptop. Does it mean I don't even need it in the
> > first place? What about the IRQ storm this driver is meant to deal
> > with =E2=80=94 does it never happen on Braswell? What are the reproduct=
ion
> > steps to verify my hardware is not affected? I have that INT0002
> > device, so I'm worried it may cause issues if not bound to the driver.
>
> I do not expect Braswell platforms to suffer from the IRQ storm
> issue. That was something which I hit on a Cherry Trail based device.
>
> To test this, try waking up the device from suspend by an USB attached
> keyboard (this may not work, in that case wake it some other way).
>
> After this do:
>
> cat /proc/interrupts | grep " 9-fasteoi"
>
> This should output something like this:
>
> [root@localhost ~]# cat /proc/interrupts | grep " 9-fasteoi"
>     9:          0          0          0          0   IO-APIC    9-fasteoi=
   acpi
>
> Repeat this a couple of times, of the numbers after the 9:
> increase (very) rapidly you have an interrupt storm. Likely
> they will either be fully unchanged or change very slowly.

Thanks a lot for the instructions. After a wakeup by USB keyboard, the
counter increased by a few hundred (compared to the value before
suspend), but there was no further growth, so it looks I'm safe.
(Tested with your patch, of course.)

> Note if nothing is output then IRQ 9 is not used on your
> model, then the INT0002 device cannot cause an interrupt storm.
>
> Regards,
>
> Hans
>
>
>
> >
> >> Cc: Maxim Mikityanskiy <maxtram95@gmail.com>
> >> Cc: 5.3+ <stable@vger.kernel.org> # 5.3+
> >> Fixes: 871f1f2bcb01 ("platform/x86: intel_int0002_vgpio: Only implemen=
t irq_set_wake on Bay Trail")
> >> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> >> ---
> >>   drivers/platform/x86/intel_int0002_vgpio.c | 18 +++++-------------
> >>   1 file changed, 5 insertions(+), 13 deletions(-)
> >>
> >> diff --git a/drivers/platform/x86/intel_int0002_vgpio.c b/drivers/plat=
form/x86/intel_int0002_vgpio.c
> >> index 55f088f535e2..e8bec72d3823 100644
> >> --- a/drivers/platform/x86/intel_int0002_vgpio.c
> >> +++ b/drivers/platform/x86/intel_int0002_vgpio.c
> >> @@ -143,21 +143,9 @@ static struct irq_chip int0002_byt_irqchip =3D {
> >>          .irq_set_wake           =3D int0002_irq_set_wake,
> >>   };
> >>
> >> -static struct irq_chip int0002_cht_irqchip =3D {
> >> -       .name                   =3D DRV_NAME,
> >> -       .irq_ack                =3D int0002_irq_ack,
> >> -       .irq_mask               =3D int0002_irq_mask,
> >> -       .irq_unmask             =3D int0002_irq_unmask,
> >> -       /*
> >> -        * No set_wake, on CHT the IRQ is typically shared with the AC=
PI SCI
> >> -        * and we don't want to mess with the ACPI SCI irq settings.
> >> -        */
> >> -       .flags                  =3D IRQCHIP_SKIP_SET_WAKE,
> >> -};
> >> -
> >>   static const struct x86_cpu_id int0002_cpu_ids[] =3D {
> >>          INTEL_CPU_FAM6(ATOM_SILVERMONT, int0002_byt_irqchip),   /* Va=
lleyview, Bay Trail  */
> >> -       INTEL_CPU_FAM6(ATOM_AIRMONT, int0002_cht_irqchip),      /* Bra=
swell, Cherry Trail */
> >> +       INTEL_CPU_FAM6(ATOM_AIRMONT, int0002_byt_irqchip),      /* Bra=
swell, Cherry Trail */
> >>          {}
> >>   };
> >>
> >> @@ -181,6 +169,10 @@ static int int0002_probe(struct platform_device *=
pdev)
> >>          if (!cpu_id)
> >>                  return -ENODEV;
> >>
> >> +       /* We only need to directly deal with PMEs when using s2idle *=
/
> >> +       if (!pm_suspend_default_s2idle())
> >> +               return -ENODEV;
> >> +
> >>          irq =3D platform_get_irq(pdev, 0);
> >>          if (irq < 0)
> >>                  return irq;
> >> --
> >> 2.26.0
> >>
> >
>
