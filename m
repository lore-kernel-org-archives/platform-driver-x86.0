From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2 1/1] platform/x86/intel_cht_int33fe: Split code to USB
 TypeB and TypeC variants
Date: Wed, 18 Sep 2019 16:07:15 +0300
Message-ID: <CAHp75Vc1puy01=Ki6EiJfZTGPtgkWiar9GhEb7EX0OF7CmNo7w@mail.gmail.com>
References: <20190917194507.14771-1-jekhor@gmail.com> <20190917194507.14771-2-jekhor@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190917194507.14771-2-jekhor@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yauhen Kharuzhy <jekhor@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andy Shevchenko <andy@infradead.org>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Sep 17, 2019 at 10:45 PM Yauhen Kharuzhy <jekhor@gmail.com> wrote:
>
> Existing intel_cht_int33fe ACPI pseudo-device driver assumes that
> hardware has TypeC connector and register related devices described as
> I2C connections in the _CRS resource.
>
> There is at least one hardware (Lenovo Yoga Book YB1-91L/F) with micro
> USB B connector exists. It has INT33FE device in the DSDT table but
> there are only two I2C connection described: PMIC and BQ27452 battery
> fuel gauge.
>
> Splitting existing INT33FE driver allow to maintain code for USB type B
> (AB) connector variant separately and make it simpler.
>
> Split driver to intel_cht_int33fe_common.c and
> intel_cht_int33fe_{typeb,typec}.c. Compile all this source to one .ko
> module to make user experience easier.

Before sending new version also check that you spell correctly
"Type-C" everywhere (except variable / function names).


-- 
With Best Regards,
Andy Shevchenko
