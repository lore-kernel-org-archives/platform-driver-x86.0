From: "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v8 1/6] software node: rename is_array to is_inline
Date: Thu, 12 Dec 2019 17:41:21 +0100
Message-ID: <CAJZ5v0i3dSOSa37yWLM+zDVnMKVTkOxbyKD4vo0KVwj_uFB26Q@mail.gmail.com>
References: <20191108042225.45391-1-dmitry.torokhov@gmail.com>
 <20191108042225.45391-2-dmitry.torokhov@gmail.com> <CGME20191212111237eucas1p1a278d2d5d2437e3219896367e82604cc@eucas1p1.samsung.com>
 <b3f6ca8b-dbdf-0cec-aa8f-47ffcc5c5307@samsung.com> <20191212112825.GK32742@smile.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191212112825.GK32742@smile.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Felipe Balbi <balbi@kernel.org>, Linux USB Mailing List <linux-usb@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Dec 12, 2019 at 12:28 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Dec 12, 2019 at 12:12:36PM +0100, Marek Szyprowski wrote:
> > Dear All,
> >
> > On 08.11.2019 05:22, Dmitry Torokhov wrote:
> > > We do not need a special flag to know if we are dealing with an array,
> > > as we can get that data from ratio between element length and the data
> > > size, however we do need a flag to know whether the data is stored
> > > directly inside property_entry or separately.
> > >
> > > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> >
> > Today I've noticed that this patch got merged to linux-next as commit
> > e6bff4665c595b5a4aff173848851ed49ac3bfad. Sadly it breaks DWC3/xHCI
> > driver operation on Samsung Exynos5 SoCs (and probably on other SoCs
> > which use DWC3 in host mode too). I get the following errors during boot:
> >
> > dwc3 12000000.dwc3: failed to add properties to xHCI
> > dwc3 12000000.dwc3: failed to initialize host
> > dwc3: probe of 12000000.dwc3 failed with error -61
> >
> > Here is a full kernel log from Exynos5250-based Snow Chromebook on KernelCI:
> >
> > https://storage.kernelci.org/next/master/next-20191212/arm/exynos_defconfig/gcc-8/lab-collabora/boot-exynos5250-snow.txt
> >
> > (lack of 'ref' clk is not related nor fatal to the driver operation).
> >
> > The code which fails after this patch is located in
> > drivers/usb/dwc3/host.c. Let me know if I can help more in locating the bug.
>
> Thank you for report.
>
> I think we should not have that patch in the fist place... I used to have
> a bad feeling about it and then forgot about it existence.

Well, I think you mean the [2/6].

The $subject one really shouldn't change functionality, we must have
missed something here.

Anyway, I'll drop this branch from the linux-next one for now.
