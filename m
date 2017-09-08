From: Peter Rosin <peda@axentia.se>
Subject: Re: [PATCH 1/2] mux: add mux_control_get_optional() API
Date: Fri, 8 Sep 2017 17:54:03 +0200
Message-ID: <64cd3a6d-cf3e-89ed-0c26-65b395d18008@axentia.se>
References: <20170905164221.11266-6-hdegoede@redhat.com>
 <20170908154514.4463-1-peda@axentia.se>
 <20170908154514.4463-2-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170908154514.4463-2-peda@axentia.se>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Stephen Boyd <stephen.boyd@linaro.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Mathias Nyman <mathias.nyman@intel.com>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, devel@driverdev.osuosl.org, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, Sathyanarayanan Kuppuswamy Natarajan <sathyaosid@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On 2017-09-08 17:45, Peter Rosin wrote:
> From: Stephen Boyd <stephen.boyd@linaro.org>
> 
> Sometimes drivers only use muxes under certain scenarios. For
> example, the chipidea usb controller may be connected to a usb
> switch on some platforms, and connected directly to a usb port on
> others. The driver won't know one way or the other though, so add
> a mux_control_get_optional() API that allows the driver to
> differentiate errors getting the mux from there not being a mux
> for the driver to use at all.
> ---
>  Documentation/driver-model/devres.txt |   1 +
>  drivers/mux/core.c                    | 104 +++++++++++++++++++++++++++-------
>  include/linux/mux/consumer.h          |   4 ++
>  3 files changed, 89 insertions(+), 20 deletions(-)
> 
> I haven't tested this patch, and hence I have not signed it and I also
> removed the sign-off from Stephen...

Huh, I definitely intended to mention that this patch is based on [1]
from Stephen, but that I've made changes according to the comments in
that thread (and more). And those changes are what made me remove the
sign-off from Stephen...

Sorry for the noise,
Peter

[1] https://lkml.org/lkml/2017/7/14/655
