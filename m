From: Frans Klaver <fransklaver@gmail.com>
Subject: [PATCH 08/13] eeepc-laptop: pull out SENSOR_STORE_FUNC and SENSOR_SHOW_FUNC macros
Date: Sat, 13 Sep 2014 01:06:47 +0200
Message-ID: <1410563212-31565-9-git-send-email-fransklaver@gmail.com>
References: <1410563212-31565-1-git-send-email-fransklaver@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1410563212-31565-1-git-send-email-fransklaver@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: Frans Klaver <fransklaver@gmail.com>, Corentin Chary <corentin.chary@gmail.com>, Rafael Wysocki <rafael.j.wysocki@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Pull out EEEPC_SENSOR_STORE_FUNC and EEEPC_SENSOR_SHOW_FUNC. These
macros define functions that call store_sys_hwmon() and show_sys_hwmon()
respectively. This helps prevent duplication later on.

Signed-off-by: Frans Klaver <fransklaver@gmail.com>
---
 drivers/platform/x86/eeepc-laptop.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/eeepc-laptop.c b/drivers/platform/x86/eeepc-laptop.c
index 4f6490d..fbaa4d5 100644
--- a/drivers/platform/x86/eeepc-laptop.c
+++ b/drivers/platform/x86/eeepc-laptop.c
@@ -1039,19 +1039,25 @@ static ssize_t show_sys_hwmon(int (*get)(void), char *buf)
 	return sprintf(buf, "%d\n", get());
 }
 
-#define EEEPC_CREATE_SENSOR_ATTR(_name, _mode, _get, _set)		\
+#define EEEPC_SENSOR_SHOW_FUNC(_name, _get)				\
 	static ssize_t show_##_name(struct device *dev,			\
 				    struct device_attribute *attr,	\
 				    char *buf)				\
 	{								\
 		return show_sys_hwmon(_get, buf);			\
-	}								\
+	}
+
+#define EEEPC_SENSOR_STORE_FUNC(_name, _set)				\
 	static ssize_t store_##_name(struct device *dev,		\
 				     struct device_attribute *attr,	\
 				     const char *buf, size_t count)	\
 	{								\
 		return store_sys_hwmon(_set, buf, count);		\
-	}								\
+	}
+
+#define EEEPC_CREATE_SENSOR_ATTR(_name, _mode, _get, _set)		\
+	EEEPC_SENSOR_SHOW_FUNC(_name, _get)				\
+	EEEPC_SENSOR_STORE_FUNC(_name, _set)				\
 	static DEVICE_ATTR(_name, _mode, show_##_name, store_##_name)
 
 EEEPC_CREATE_SENSOR_ATTR(fan1_input, S_IRUGO, eeepc_get_fan_rpm, NULL);
-- 
2.1.0
