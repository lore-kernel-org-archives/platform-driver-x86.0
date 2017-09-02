From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 07/11] extcon: intel-int3496: Add support for controlling
 the USB-role mux
Date: Sat, 2 Sep 2017 13:39:39 +0300
Message-ID: <CAHp75VfcPZM6cTKsJ5sG9vJgtZeOO9aKwd0cPddTQOwz58cEyA@mail.gmail.com>
References: <20170901214845.7153-1-hdegoede@redhat.com>
 <20170901214845.7153-8-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20170901214845.7153-8-hdegoede@redhat.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: devel@driverdev.osuosl.org, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, USB <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Sathyanarayanan Kuppuswamy Natarajan <sathyaosid@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Guenter Roeck <linux@roeck-us.net>, Darren Hart <dvhart@infradead.org>, Peter Rosin <peda@axentia.se>, Andy Shevchenko <andy@infradead.org>
List-Id: platform-driver-x86.vger.kernel.org

On Sat, Sep 2, 2017 at 12:48 AM, Hans de Goede <hdegoede@redhat.com> wrote:
> Cherry Trail SoCs have a built-in USB-role mux for switching between
> the host and device controllers, rather then using an external mux
> controller by a GPIO.
>
> There is a driver using the mux-subsys to control this mux, this
> commit adds support to the intel-int3496 driver to get a mux_controller
> handle for the mux and set the mux through the mux-subsys rather then
> through a GPIO.

>         tristate "Intel INT3496 ACPI device extcon driver"
>         depends on GPIOLIB && ACPI && (X86 || COMPILE_TEST)
> +       select MULTIPLEXER

> +#include <asm/cpu_device_id.h>
> +#include <asm/intel-family.h>

I think it is going to fail when !X86 && COMPILE_TEST.


>  static void int3496_do_usb_id(struct work_struct *work)
>  {
>         struct int3496_data *data =
>                 container_of(work, struct int3496_data, work.work);
> -       int id = gpiod_get_value_cansleep(data->gpio_usb_id);
> +       int ret, id = gpiod_get_value_cansleep(data->gpio_usb_id);

Better to keep them on separate lines.

-- 
With Best Regards,
Andy Shevchenko
