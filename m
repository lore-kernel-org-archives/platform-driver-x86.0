From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v2 00/11] mux/typec: Add USB / TypeC mux drivers and hook them up on some x86 systems
Date: Tue,  5 Sep 2017 18:42:10 +0200
Message-ID: <20170905164221.11266-1-hdegoede@redhat.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Peter Rosin <peda@axentia.se>, Mathias Nyman <mathias.nyman@intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, devel@driverdev.osuosl.org, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, Sathyanarayanan Kuppuswamy Natarajan <sathyaosid@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Hi All,

Here is v2 of my USB / Type-C mux series, addressing various comments
from the reviews of v1. See the per patch changelogs for details.

For reference here the cover letter of v1:

This series consists of 4 parts:

1) Core mux changes to add support for getting mux-controllers on
   non DT platforms and to add some standardised state values for USB

2) Add Intel CHT USB mux and Pericom-PI3USB30532 Type-C mux drivers

3) Hookup the Intel CHT USB mux driver for CHT devices without Type-C

4) Hookup both the Intel CHT USB mux and Pericom-PI3USB30532 Type-C mux
   drivers to the fusb302 Type-C port controller found on some CHT x86 devs

Please review, or in the case of the drivers/mux changes (which are a dep
for some of the other patches) merge if the patches are ready.

Regards,

Hans
