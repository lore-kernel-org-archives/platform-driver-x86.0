From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v3 10/11] iio: light: cm32181: Add support for parsing
 CPM0 and CPM1 ACPI tables
Date: Sun, 3 May 2020 19:25:20 +0300
Message-ID: <CAHp75Vdt+shL3yXHfct17DUHdRBBrCzC4vBjQL8YHbimFefV7A@mail.gmail.com>
References: <20200428172923.567806-1-hdegoede@redhat.com> <20200428172923.567806-10-hdegoede@redhat.com>
 <20200503122237.4af34181@archlinux>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <20200503122237.4af34181@archlinux>
Sender: linux-acpi-owner@vger.kernel.org
To: Jonathan Cameron <jic23@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>, "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-iio <linux-iio@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Sun, May 3, 2020 at 2:22 PM Jonathan Cameron <jic23@kernel.org> wrote:
> On Tue, 28 Apr 2020 19:29:22 +0200
> Hans de Goede <hdegoede@redhat.com> wrote:

...

> > This was tested on the following models: Acer Switch 10 SW5-012 (CM32181)
> > Asus T100TA (CM3218), Asus T100CHI (CM3218) and HP X2 10-n000nd (CM32181).
>
> I assume it's far too much to hope this CPM0 / CPM1 stuff is actually defined
> in a spec anywhere?
>
> There are standard way of adding vendor specific data blobs to ACPI and this
> isn't one of them (unless I'm missing something).  People need to beat
> up vendors earlier about this stuff.
>
> Grumble over...
>
> Code looks fine to me, but I'd like an ACPI review ideally.

ACPI didn't cover embedded world and has the following issues
a) where it should be strict (like how many I2CSerialBus() resources
can be given and for what type of devices, etc), it doesn't
b) they need to provides better validation tools, but they didn't
c) it's still windows oriented :-(

Above is custom extension on how to add device properties (and note,
we have now _DSD() and still we have some M$ way of thinking how to
use them).

Since the above approach is in the wild, I'm afraid we have not many
possibilities here (each of them with own problems):
1/ shout at vendors to use ACPI properly and simple don't by broken
hardware (rather firmware)
2/ try to support custom changes (may lead to several approaches for
the same thing)
3/ create a lot of board files (something in between 1/ and 2/)

As a result:
1/ is obviously a best one, but I think it's an utopia.
2/ in practice we don't have many deviations (luckily OEMs are quite
lazy to modify reference BIOSes and often reuse existing approaches)
3/ may not work, because on cheap laptops the means of distinguishing
them (like DMI strings) may also been broken.

-- 
With Best Regards,
Andy Shevchenko
