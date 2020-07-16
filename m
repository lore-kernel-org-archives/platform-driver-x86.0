From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 2/2] usb: typec: intel_pmc_mux: Check the port status
 before connect
Date: Thu, 16 Jul 2020 09:05:08 +0200
Message-ID: <20200716070508.GB962748@kroah.com>
References: <20200716003310.26125-1-rajmohan.mani@intel.com>
 <20200716003310.26125-3-rajmohan.mani@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200716003310.26125-3-rajmohan.mani@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rajmohan Mani <rajmohan.mani@intel.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Lee Jones <lee.jones@linaro.org>, Ayman Bagabas <ayman.bagabas@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, Jithu Joseph <jithu.joseph@intel.com>, =?utf-8?B?Qmxhxb4=?= Hrastnik <blaz@mxxn.io>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, Heikki Krogerus <heikki.krogerus@linux.intel.com>, linux-usb@vger.kernel.org, pmalani@chromium.org, bleung@chromium.org
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Jul 15, 2020 at 05:33:10PM -0700, Rajmohan Mani wrote:
> From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> 
> The PMC microcontroller that we use for configuration, does
> not supply any status information back. For port status we
> need to talk to another controller on the board called IOM
> (I/O manager).
> 
> By checking the port status before configuring the muxes, we
> can make sure that we do not reconfigure the port after
> bootup when the system firmware (for example BIOS) has
> already configured it.
> 
> Using the status information also to check if DisplayPort
> HPD is still asserted when the cable plug is disconnected,
> and clearing it if it is.
> 
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

You can't just forward on patches from others without also adding your
signed-off-by to them, right?

Please fix up this series and try again.

thanks,

greg k-h
