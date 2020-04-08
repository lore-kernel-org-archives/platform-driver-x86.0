From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/6] device property: export set_secondary_fwnode() to modules
Date: Wed,  8 Apr 2020 19:09:01 +0300
Message-ID: <20200408160905.12101-2-andriy.shevchenko@linux.intel.com>
References: <20200408160905.12101-1-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200408160905.12101-1-andriy.shevchenko@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>, linux-acpi@vger.kernel.org, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, Darren Hart <dvhart@infradead.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

Some drivers when compiled as modules may need to set secondary firmware node.
Export set_secondary_fwnode() to make it possible without code duplication.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/base/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index dbb0f9130f42..11ab8fa7bd00 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -3738,6 +3738,7 @@ void set_secondary_fwnode(struct device *dev, struct fwnode_handle *fwnode)
 	else
 		dev->fwnode = fwnode;
 }
+EXPORT_SYMBOL_GPL(set_secondary_fwnode);
 
 /**
  * device_set_of_node_from_dev - reuse device-tree node of another device
-- 
2.25.1
