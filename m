From: "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v6 00/15] software node: add support for reference properties
Date: Tue, 5 Nov 2019 23:09:34 +0100
Message-ID: <CAJZ5v0iihCMCc9xozdafrxjwH7cXYDMu_Vfx1snYfOEYTYRJVQ@mail.gmail.com>
References: <20191023200233.86616-1-dmitry.torokhov@gmail.com> <20191030224304.GH57214@dtor-ws>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191030224304.GH57214@dtor-ws>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Oct 30, 2019 at 11:43 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> Hi Rafael,
>
> On Wed, Oct 23, 2019 at 01:02:18PM -0700, Dmitry Torokhov wrote:
> > These series implement "references" properties for software nodes as true
> > properties, instead of managing them completely separately.
> >
> > The first 10 patches are generic cleanups and consolidation and
> > unification of the existing code; patch #11 implements moving of small
> > properties inline when copying property entries; patch #12 implements
> > PROPERTY_ENTRY_REF() and friends; patch #13 converts the user of
> > references to the property syntax, and patch #14 removes the remains of
> > references as entities that are managed separately.
> >
> > Patch #15 adds unit tests to verify that the handling of property
> > entries is correct.
>
> Do you have any concerns with the series? I think Andy did all the
> reviewing that he could...

Yes, he did, and he is unconvinced.

I basically have no problems with patches [1-9/15], so I'm going to
queue them up for 5.5.

Patch [10/15] by itself is kind of pointless IMO, so it'll depend on
what happens to the rest.

Patch [11/15] kind of causes brows to rise, so let me reply to it directly.
