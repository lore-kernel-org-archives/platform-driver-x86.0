From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: [PATCH 0/2] platform/x86: intel_cht_int33fe: Start using software nodes
Date: Tue, 19 Feb 2019 14:59:57 +0300
Message-ID: <20190219115959.55553-1-heikki.krogerus@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy@infradead.org>, Hans de Goede <hdegoede@redhat.com>
Cc: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Hi guys,

The software nodes support node hierarchy. By using them with fusb302
we can add a separate fwnode also for the USB connector as a child of
fusb302. We can then use the "standard" USB connector device
properties with the connector node, and stop using the deprecated
fusb302 specific properties.

Since the goal is to ultimately move to the software node API from the
old device property API, converting also max17047 in this series.

If you test this now (before v5.1-rc1 is out), then the series depends
Greg's latest usb-next:
https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/log/?h=usb-next

and on a patch in Rafael's latest linux-next branch:
https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git/commit/?h=linux-next&id=344798206f171c5abea7ab1f9762fa526d7f539d

thanks,

Heikki Krogerus (2):
  platform/x86: intel_cht_int33fe: Provide fwnode for the USB connector
  platform/x86: intel_cht_int33fe: Create fwnode for max17047

 drivers/platform/x86/intel_cht_int33fe.c | 122 +++++++++++++++++------
 1 file changed, 91 insertions(+), 31 deletions(-)

-- 
2.20.1
