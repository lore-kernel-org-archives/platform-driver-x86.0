From: Daniel Drake <drake@endlessm.com>
Subject: Re: [PATCH 04/11] platform/x86: asus-wmi: Add quirk to force DSTS WMI
 method detection
Date: Thu, 11 Apr 2019 18:55:55 +0800
Message-ID: <CAD8Lp46Xs2QJ521+ameM3793jaYXzEeV=PqLYfW4J2ZRoRKbRw@mail.gmail.com>
References: <a8dd77f3-1e28-6416-5f04-aff44d5bb6d6@gmail.com> <d8e0f65c-8c4e-7b60-93bd-3bf90e2da344@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d8e0f65c-8c4e-7b60-93bd-3bf90e2da344@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yurii Pavlovskyi <yurii.pavlovskyi@gmail.com>
Cc: Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Endless Linux Upstreaming Team <linux@endlessm.com>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Apr 11, 2019 at 4:28 AM Yurii Pavlovskyi
<yurii.pavlovskyi@gmail.com> wrote:
> The DSTS method detection fails, as nothing is returned if method is not
> defined in WMNB. As a result the control of keyboard backlight is not
> functional for TUF Gaming series laptops (at the time the only
> functionality of the driver on this model implemented with WMI methods).
>
> Patch was tested on a newer TUF Gaming FX505GM and older K54C model.
>
> FX505GM:
> Method (WMNB, 3, Serialized)
> { ...
>     If ((Local0 == 0x53545344))
>     {
>         ...
>         Return (Zero)
>     }
>     ...
>     // No return
> }
>
> K54C:
> Method (WMNB, 3, Serialized)
> { ...
>     If ((Local0 == 0x53545344))
>     {
>         ...
>         Return (0x02)
>     }
>     ...
>     Return (0xFFFFFFFE)
> }
>
> The non-existing method ASUS_WMI_METHODID_DSTS=0x53544344 (actually it is
> DCTS in little endian ASCII) is selected in asus->dsts.
>
> One way to fix this would be to call both for every known device ID until
> some answers - this would increase module load time.
>
> Another option is to check some device that is known to exist on every
> model - none known at the time.
>
> Last option, which is implemented, is to check for presence of the
> ASUS7000 device in ACPI tree (it is a dummy device), which is the
> condition used for loading the vendor driver for this model. This might
> not fix every affected model ever produced, but it likely does not
> introduce any regressions. The patch introduces a quirk that is enabled
> when ASUS7000 is found.
>
> Scope (_SB)
> {
>     Device (ATK)
>     {
>         Name (_HID, "ASUS7000")  // _HID: Hardware ID
>     }
> }

Hmm, tricky! But about time we did something about the DSTS vs DCTS guessing.

While we don't have definitive knowledge of the right thing to do
here, I think I have enough info available to solidify some
assumptions we'd otherwise be afraid to make, and then we can
implement a better approach here.

In our database of 144 Asus DSDTs, 14 of them respond to DCTS:

AS_D520MT
D425MC
D640SA
D320SF-K
D415MT
D830MT
G11DF
M32CD4-K
V221ID
V272UN_SKU3
Z240IE
ZN220IC-K
ZN241IC
ZN270IE

Of those 14, they all additionally respond to DSTS, except for D415MT
and AS_D520MT.

In all 14 cases, the DCTS handling is done inside a device with _UID
ASUSWMI. None of the other 130 products have a device with that _UID.

Furthermore, we recently received access to the ASUS spec, which
confirms that the Instance Name for EeePC is "ACPI\PNP0C14\ASUSWMI_0"
whereas the Instance Name for other notebooks is "ACPI\PNP0C14\ATK_0".

The 12 devices that respond to both DCTS and DSTS, do it on separate
different devices, albeit with the same _WDG UUID. The one with _UID
ASUSWMI responds to DCTS, and the one with _UID ATK responds to DSTS.

So that seems fairly convincing. My thinking is that we can check the
_UID of the underlying device, and use DCTS for ASUSWMI, DSTS
otherwise. To do that, I think you'd have to rework the driver probing
so that it happens through wmi_driver_register(). Then from the probe
function onwards you will get a wmi_device, and hopefully you can get
the _UID through that instance somehow.

There's a separate issue of what happens on those 12 machines where
there are two WMI devs, with the same _WDG GUID.
drivers/platform/x86/wmi.c drops duplicates, so one of them is being
ignored in that case. We'd ideally find a way to ignore the ASUSWMI
node and go with ATK in that situation. But I think this can be
separated from your work here.

Thanks for these patches and welcome to the world of kernel development!

Daniel
