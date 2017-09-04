From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 07/11] extcon: intel-int3496: Add support for controlling
 the USB-role mux
Date: Mon, 4 Sep 2017 16:11:26 +0200
Message-ID: <18836881-172c-1301-a0b7-50576c5ed460@redhat.com>
References: <20170901214845.7153-1-hdegoede@redhat.com>
 <20170901214845.7153-8-hdegoede@redhat.com>
 <CAHp75VfcPZM6cTKsJ5sG9vJgtZeOO9aKwd0cPddTQOwz58cEyA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VfcPZM6cTKsJ5sG9vJgtZeOO9aKwd0cPddTQOwz58cEyA@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Peter Rosin <peda@axentia.se>, Mathias Nyman <mathias.nyman@intel.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, devel@driverdev.osuosl.org, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, Sathyanarayanan Kuppuswamy Natarajan <sathyaosid@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, USB <linux-usb@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

Hi,

On 02-09-17 12:39, Andy Shevchenko wrote:
> On Sat, Sep 2, 2017 at 12:48 AM, Hans de Goede <hdegoede@redhat.com> wrote:
>> Cherry Trail SoCs have a built-in USB-role mux for switching between
>> the host and device controllers, rather then using an external mux
>> controller by a GPIO.
>>
>> There is a driver using the mux-subsys to control this mux, this
>> commit adds support to the intel-int3496 driver to get a mux_controller
>> handle for the mux and set the mux through the mux-subsys rather then
>> through a GPIO.
> 
>>          tristate "Intel INT3496 ACPI device extcon driver"
>>          depends on GPIOLIB && ACPI && (X86 || COMPILE_TEST)
>> +       select MULTIPLEXER
> 
>> +#include <asm/cpu_device_id.h>
>> +#include <asm/intel-family.h>
> 
> I think it is going to fail when !X86 && COMPILE_TEST.

Good catch, I've dropped the || COMPILE_TEST for v2

>>   static void int3496_do_usb_id(struct work_struct *work)
>>   {
>>          struct int3496_data *data =
>>                  container_of(work, struct int3496_data, work.work);
>> -       int id = gpiod_get_value_cansleep(data->gpio_usb_id);
>> +       int ret, id = gpiod_get_value_cansleep(data->gpio_usb_id);
> 
> Better to keep them on separate lines.

Ok, fixed for v2.

Regards,

Hans
