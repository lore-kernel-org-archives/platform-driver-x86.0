From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: [PATCH] platform/x86: i2c-multi-instantiate: Derive the device name from parent
Date: Fri, 20 Sep 2019 13:02:33 +0300
Message-ID: <20190920100233.12829-1-heikki.krogerus@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <stable-owner@vger.kernel.org>
Sender: stable-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy@infradead.org>
Cc: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

When naming the new devices, instead of using the ACPI ID in
the name as base, using the parent device's name. That makes
it possible to support multiple multi-instance i2c devices
of the same type in the same system.

This fixes an issue seen on some Intel Kaby Lake based
boards:

sysfs: cannot create duplicate filename '/devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-0/i2c-INT3515-tps6598x.0'

Fixes: 2336dfadfb1e ("platform/x86: i2c-multi-instantiate: Allow to have same slaves")
Cc: stable@vger.kernel.org
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/platform/x86/i2c-multi-instantiate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/i2c-multi-instantiate.c b/drivers/platform/x86/i2c-multi-instantiate.c
index 61fe341a85aa..ea68f6ed66ae 100644
--- a/drivers/platform/x86/i2c-multi-instantiate.c
+++ b/drivers/platform/x86/i2c-multi-instantiate.c
@@ -90,7 +90,7 @@ static int i2c_multi_inst_probe(struct platform_device *pdev)
 	for (i = 0; i < multi->num_clients && inst_data[i].type; i++) {
 		memset(&board_info, 0, sizeof(board_info));
 		strlcpy(board_info.type, inst_data[i].type, I2C_NAME_SIZE);
-		snprintf(name, sizeof(name), "%s-%s.%d", match->id,
+		snprintf(name, sizeof(name), "%s-%s.%d", dev_name(dev),
 			 inst_data[i].type, i);
 		board_info.dev_name = name;
 		switch (inst_data[i].flags & IRQ_RESOURCE_TYPE) {
-- 
2.23.0
