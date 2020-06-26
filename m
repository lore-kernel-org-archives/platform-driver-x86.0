From: kernel test robot <lkp@intel.com>
Subject: [RFC PATCH] thermal: thermal_zone_device_set_mode() can be static
Date: Sat, 27 Jun 2020 04:50:28 +0800
Message-ID: <20200626205028.GA2296@014f859222aa>
References: <20200626173755.26379-7-andrzej.p@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-acpi-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200626173755.26379-7-andrzej.p@collabora.com>
Sender: linux-acpi-owner@vger.kernel.org
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>, linux-pm@vger.kernel.org, linux-acpi@vger.kernel.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Cc: kbuild-all@lists.01.org, "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>
List-Id: platform-driver-x86.vger.kernel.org


Signed-off-by: kernel test robot <lkp@intel.com>
---
 thermal_core.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/thermal/thermal_core.c b/drivers/thermal/thermal_core.c
index 3181295075b9a..f02c57c986f0e 100644
--- a/drivers/thermal/thermal_core.c
+++ b/drivers/thermal/thermal_core.c
@@ -459,8 +459,8 @@ static void thermal_zone_device_reset(struct thermal_zone_device *tz)
 	thermal_zone_device_init(tz);
 }
 
-int thermal_zone_device_set_mode(struct thermal_zone_device *tz,
-				 enum thermal_device_mode mode)
+static int thermal_zone_device_set_mode(struct thermal_zone_device *tz,
+					enum thermal_device_mode mode)
 {
 	int ret = 0;
 
