From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v5 1/1] platform/x86/intel_cht_int33fe: Split code to USB
 Micro-B and Type-C variants
Date: Wed, 25 Sep 2019 20:42:03 +0300
Message-ID: <CAHp75VfL0RUgMhZk=gesxBcBfRkfV8kC1zsN9TNg53qpUNVU0w@mail.gmail.com>
References: <20190920223356.6622-1-jekhor@gmail.com> <20190920223356.6622-2-jekhor@gmail.com>
 <1cca117d-1951-0335-1aef-ac994c3c757b@redhat.com> <CAHp75VcoS2OFr8kwM7vq0iCqf6BpyJ4SO7peAUHKxAXdgA7CMA@mail.gmail.com>
 <20190925162712.GA3653@jeknote.loshitsa1.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190925162712.GA3653@jeknote.loshitsa1.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Yauhen Kharuzhy <jekhor@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Darren Hart <dvhart@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andy Shevchenko <andy@infradead.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Sep 25, 2019 at 7:27 PM Yauhen Kharuzhy <jekhor@gmail.com> wrote:
> On Wed, Sep 25, 2019 at 06:02:22PM +0300, Andy Shevchenko wrote:
> > On Sat, Sep 21, 2019 at 9:31 PM Hans de Goede <hdegoede@redhat.com> wrote:

> > By some reason it doesn't apply.
>
> I have checked, and have no issues when applying this patch to the current
> torvalds/master and linux-next/master branches (351c8a09b00b and 9e88347dedd8
> commit IDs).

It doesn't apply to the subsystem tree (for-next or my review branch)

-- 
With Best Regards,
Andy Shevchenko
