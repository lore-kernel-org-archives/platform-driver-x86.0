From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v4 0/3] i2c: Hookup typec power-negotation to the PMIC and charger
Date: Sun,  3 Sep 2017 14:41:53 +0200
Message-ID: <20170903124156.7440-1-hdegoede@redhat.com>
Return-path: <linux-i2c-owner@vger.kernel.org>
Sender: linux-i2c-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Wolfram Sang <wsa@the-dreams.de>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Hi Wolfram,

Almost all patches from my patch series for hooking up typec
power-negotation to the PMIC and charger drivers have been
queued for merging into 4.14, leaving only the 3 patches of
the v4 of this series.

The first 2 patches are i2c patches, if you could review and
merge these (preferably for 4.14, but 4.15 is fine too) that would
be great.

Darren, Andy, the single platform/x86 patch in here should only
be merged after the 2 i2c patches are in place, otherwise users
of the board(s) in question will end up not having any battery
monitoring. Also note that this patch applies on top of the
"[PATCH v2] platform/x86: intel_cht_int33fe: Work around BIOS bug on some devices"
patch I send out yesterday.

Regards,

Hans
