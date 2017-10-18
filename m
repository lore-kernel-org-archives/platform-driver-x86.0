From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v3 10/14] extcon: intel-int3496: Add support for
 controlling the USB-role mux
Date: Wed, 18 Oct 2017 11:33:14 +0900
Message-ID: <59E6BD6A.4020101@samsung.com>
References: <20170922183803.10701-1-hdegoede@redhat.com>
        <CGME20170922183852epcas4p10bfda717358daa0aca9fa60fe7cf370c@epcas4p1.samsung.com>
        <20170922183803.10701-10-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20170922183803.10701-10-hdegoede@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Peter Rosin <peda@axentia.se>, Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, devel@driverdev.osuosl.org, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, Sathyanarayanan Kuppuswamy Natarajan <sathyaosid@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Hi Hans,

On 2017년 09월 23일 03:37, Hans de Goede wrote:
> Cherry Trail SoCs have a built-in USB-role mux for switching between
> the host and device controllers, rather then using an external mux
> controller by a GPIO.
> 
> There is a driver using the mux-subsys to control this mux, this
> commit adds support to the intel-int3496 driver to get a mux_controller
> handle for the mux and set the mux through the mux-subsys rather then
> through a GPIO.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v2:
> -Drop || COMPILE_TEST from Kconfig depends on, as we will now fail to
>  compile on !X86
> -Minor code style tweaks
> ---
>  drivers/extcon/Kconfig                |  3 +-
>  drivers/extcon/extcon-intel-int3496.c | 59 +++++++++++++++++++++++++++++++++++
>  2 files changed, 61 insertions(+), 1 deletion(-)

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

[snip]

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
