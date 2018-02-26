From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH v3 09/12] usb: roles: Add Intel xHCI USB role switch
 driver
Date: Mon, 26 Feb 2018 13:42:11 +0200
Message-ID: <20180226114211.GA25535@kuha.fi.intel.com>
References: <20180226090925.29436-1-hdegoede@redhat.com>
 <20180226090925.29436-10-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180226090925.29436-10-hdegoede@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guenter Roeck <linux@roeck-us.net>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Feb 26, 2018 at 10:09:22AM +0100, Hans de Goede wrote:
> Various Intel SoCs (Cherry Trail, Broxton and others) have an internal USB
> role switch for swiching the OTG USB data lines between the xHCI host
> controller and the dwc3 gadget controller.
> 
> Note on some Cherry Trail systems there is ACPI/AML code listening to
> edge interrupts on the id-pin (through an _AIE ACPI method) and switching
> the role between ROLE_HOST and ROLE_NONE based on the id-pin. Note it does
> not set the role to ROLE_DEVICE, because device-mode is usually not used
> under Windows.
> 
> The presence of AML code which modifies the cfg0 reg (on some systems)
> means that our read/write/modify of cfg0 may race with the AML code
> doing the same to avoid this we take the global ACPI lock while doing
> the read/write/modify.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

Thanks Hans!

-- 
heikki
