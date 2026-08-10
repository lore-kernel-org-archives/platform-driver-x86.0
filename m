Received: from out203-205-221-149.mail.qq.com (out203-205-221-149.mail.qq.com [203.205.221.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A054B04B7;
	Mon, 10 Aug 2026 04:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786337286; cv=none; b=dbDUDvcqsYLqMxo3ATpbI1i/DWF+8F1Rm+vUYgd3lJA9KVjT9Z9IAuTFA95bP2Nh0VLPkcxf9bYvaUjCIVsNeBweGounH6OTYFaZz7JuxJfRmjf3ZppGWvwdQIvUI50Pkd30NI9xs+5s1+UpN043492Oe0+RuA+l6fikBb3b+rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786337286; c=relaxed/simple;
	bh=gjCZL/T0kGx96Lca4zmlRmD3GHhBHV4JGFqA7AdH9X4=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=MjOK6GuXTaZd/oZHMm847JFx471BM9qZH6iklFdvYBjrCbWzzO/5npH4bH8y4Jtw7hLlfotPiLESxZkZuWCpnO3w12zZfmTHeRSRDudbNDV+G9LB6IQWlwiy54xhXOY2wVhr2nZFm+IQ+DqbIK9sonZc0pRfN1vR7qCWkevAtnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rsplwe.com; spf=pass smtp.mailfrom=rsplwe.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=LEDu3D59; arc=none smtp.client-ip=203.205.221.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rsplwe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rsplwe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="LEDu3D59"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1786337276; bh=2PRA67SL4xV5BXdxAreMVQBkR45aqucAZFTDeNjbVkc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LEDu3D59UO59lfv/Xb3H068cAfJtK4jrNufxoPQQqHbrjlul0g37q8LikFZ/BVuf7
	 BgTr7xg6xh0itW21SS48lgMlYl4BQEbOLoVlC3n4aFijuvUVzmRS35aU9d8uF7xoHp
	 /voFm/bZNjE6YSL/GDekSY1JuAm27Pq7XsD0M7Ls=
Received: from kasumi-star ([14.218.70.170])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id BF4AB415; Mon, 10 Aug 2026 12:47:52 +0800
X-QQ-mid: xmsmtpt1786337274tyhop51ny
Message-ID: <tencent_980A8B7CD3695F73AF671CC25086E5623709@qq.com>
X-QQ-XMAILINFO: Mr71nPvm9CAIwtIZRbShOO9g69oVXIR7EAC/uZJXOibGwdNIlQtEDWA8YZ+zbs
	 MBhDQENgUlVQ/GYvyIIr/JmOUPL3OO534Vn6j97ZLrpW4fQJMO6qvBE772lvcMnBvGSxAuNDk/KB
	 asscrx/vrBKOtT70Nd6P3kDbY8pGMuiZRaJF8If5SGtUv5+QXyQppRblFwZx6Jm59PcrgmVOKX/V
	 cOGT6PpKkvaLNF9iWIL90elfQTmDRefidlDro1w9zzsFh+p4OjAt/rFeu061RQi9BoaILsbJnX70
	 HQ/bMXp9ieC74LQxAG25IkwUliZ8kiMr8KUQyMLTVZK8pZSovDbpkKW3e1yayhnZatp1dQHTO4ej
	 TZ3vjflw35mo2jdgG/Y98oLUaZeMFp2uXlvcHjeRUK2Mj09a4o5Z6Tm4/SadEotpqpKSVYzoqMip
	 4WBZmHiNP6lZd1DrMtPZUzu5QSMSoIzOL/40o6pDbHjDTgmA6txIeB6OwxrIwYFXLZCtJfJ0HorW
	 KrKVU0pfczZOTp3lA8X9G7op4Hpf6+bfu6uh4+KRO7dK5n0jmpstIMd6SOcBBWREnVT5YhhMqkI9
	 p2NCVSjeR/lUf3LztSMZqu29ycOQ6AsdygJSWHI6IlP+reQT9SRmTzB+u1CfpQ6+e7avaTnb1LKN
	 r5cp33TVSWNpx0TWY6GWC4d3JQp3ZXsvEnIMLHi4kIQ0+mgcX3dv03NK6SFUgJAt7pXO6BCQqXDW
	 F77zuI4dZS7KRVmDA+eYc/fXRWsq7G3pyklKeee3977OQ9qfJKqMwbQzyyl8sODI6GAiTSvrW2CL
	 4nuPEKvQkzF3dYVs5VAj1qTz7Xv1sWOMHxLyAXC5eHpWCIogcKUvXig8ZdNReEDiLrvCprv65VDR
	 3VjCvLbhxpIhAj+/SFGO+Jujy6H12z21PMjUGXu+xNmuJmE5fabv9FOJ+MtxIJls85In4etmXkOk
	 0wZ33X2vJsKpv0HzLywesQN1IvDlNF+um60Rvkm+OmcKjgPXSR/nGLTF+47yE3nEjqj8uzsTIKqd
	 MzklZ9vUBQ2S/TmHpPkfi9WSPnCg8Il7herLgxhsnUFIvUlp9omNYIM9x1bNdwAo+tGtK6oZ/zbE
	 tvRRw5swPjc+2D9SsU7IjWJZ3VsnTaIN7TQjcp7rr1xs/53Zk=
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
From: Rsplwe <i@rsplwe.com>
To: ilpo.jarvinen@linux.intel.com
Cc: hansg@kernel.org,
	W_Armin@gmx.de,
	qby140326@gmail.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rsplwe <i@rsplwe.com>
Subject: [PATCH 1/2] platform/x86: bitland-mifs-wmi: Add sysfs controls for device status
Date: Mon, 10 Aug 2026 12:47:47 +0800
X-OQ-MSGID: <20260810044751.43045-2-i@rsplwe.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260810044751.43045-1-i@rsplwe.com>
References: <20260810044751.43045-1-i@rsplwe.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add sysfs interfaces for controlling device status: Ambient Light, Fn Key Lock, TouchPad Lock.

Add missing ambient light command/event definitions and updated documentation.

Signed-off-by: Rsplwe <i@rsplwe.com>
---
 .../wmi/devices/bitland-mifs-wmi.rst          |   4 +
 drivers/platform/x86/bitland-mifs-wmi.c       | 166 +++++++++++++++++-
 2 files changed, 168 insertions(+), 2 deletions(-)

diff --git a/Documentation/wmi/devices/bitland-mifs-wmi.rst b/Documentation/wmi/devices/bitland-mifs-wmi.rst
index 9e86ecc2993c..57c5e6e18132 100644
--- a/Documentation/wmi/devices/bitland-mifs-wmi.rst
+++ b/Documentation/wmi/devices/bitland-mifs-wmi.rst
@@ -109,6 +109,8 @@ The following Command IDs are used in the third byte of the buffer:
 |          |                       | Bytes 6-7: GPU Fan RPM (Little Endian)   |
 |          |                       | Bytes 10-11: SYS Fan RPM (Little Endian) |
 +----------+-----------------------+------------------------------------------+
+| 15       | Ambient Light         | 0: Off, 1: On                            |
++----------+-----------------------+------------------------------------------+
 | 16       | RGBKeyboardMode       | 0: Off, 1: Auto Cyclic, 2: Fixed,        |
 |          |                       | 3: Custom                                |
 +----------+-----------------------+------------------------------------------+
@@ -168,6 +170,8 @@ Note: reserved event ids are not listed there
 +----------+------------------------------------------------------------------+
 | 9        | CapsLock state change                                            |
 +----------+------------------------------------------------------------------+
+| 10       | Ambient Light state change                                       |
++----------+------------------------------------------------------------------+
 | 13       | NumLock state change                                             |
 +----------+------------------------------------------------------------------+
 | 14       | ScrollLock state change                                          |
diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
index 3a373184519d..e2652d1a1bf7 100644
--- a/drivers/platform/x86/bitland-mifs-wmi.c
+++ b/drivers/platform/x86/bitland-mifs-wmi.c
@@ -50,6 +50,7 @@ enum bitland_mifs_function {
 	WMI_FN_FN_LOCK			= 11,
 	WMI_FN_TP_LOCK			= 12,
 	WMI_FN_FAN_SPEEDS		= 13,
+	WMI_FN_AMBIENT_LIGHT		= 15,
 	WMI_FN_RGB_KB_MODE		= 16,
 	WMI_FN_RGB_KB_COLOR		= 17,
 	WMI_FN_RGB_KB_BRIGHTNESS	= 18,
@@ -83,6 +84,7 @@ enum bitland_mifs_event_id {
 	WMI_EVENT_FNLOCK_STATE		= 7,
 	WMI_EVENT_KBD_MODE		= 8,
 	WMI_EVENT_CAPSLOCK_STATE	= 9,
+	WMI_EVENT_AMBIENTLIGHT_STATE	= 10,
 	WMI_EVENT_CALCULATOR_START	= 11,
 	WMI_EVENT_BROWSER_START		= 12,
 	WMI_EVENT_NUMLOCK_STATE		= 13,
@@ -143,6 +145,7 @@ enum bitland_notifier_actions {
 	BITLAND_NOTIFY_KBD_BRIGHTNESS,
 	BITLAND_NOTIFY_PLATFORM_PROFILE,
 	BITLAND_NOTIFY_HWMON,
+	BITLAND_NOTIFY_SYSFS_STATE,
 };
 
 struct bitland_fan_notify_data {
@@ -568,6 +571,139 @@ static ssize_t kb_mode_store(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
+static int bitland_state_get(struct bitland_mifs_wmi_data *data, u8 function)
+{
+	struct bitland_mifs_input input = {
+		.reserved1 = 0,
+		.operation = WMI_METHOD_GET,
+		.reserved2 = 0,
+	};
+	struct bitland_mifs_output res;
+	int ret;
+
+	input.function = function;
+
+	ret = bitland_mifs_wmi_call(data, &input, &res);
+	if (ret)
+		return ret;
+
+	return res.data[0];
+}
+
+/* Switch states: 0:OFF, 1:ON */
+static ssize_t ambient_light_show(struct device *dev, struct device_attribute *attr,
+				  char *buf)
+{
+	struct bitland_mifs_wmi_data *data = dev_get_drvdata(dev);
+	int state;
+
+	state = bitland_state_get(data, WMI_FN_AMBIENT_LIGHT);
+	if (state < 0)
+		return state;
+
+	return sysfs_emit(buf, "%d\n", state);
+}
+
+static ssize_t ambient_light_store(struct device *dev, struct device_attribute *attr,
+				   const char *buf, size_t count)
+{
+	struct bitland_mifs_wmi_data *data = dev_get_drvdata(dev);
+	struct bitland_mifs_input input = {
+		.reserved1 = 0,
+		.operation = WMI_METHOD_SET,
+		.reserved2 = 0,
+		.function = WMI_FN_AMBIENT_LIGHT,
+	};
+	bool val;
+	int ret;
+
+	if (kstrtobool(buf, &val))
+		return -EINVAL;
+
+	input.payload[0] = val;
+
+	ret = bitland_mifs_wmi_call(data, &input, NULL);
+	if (ret)
+		return ret;
+
+	return count;
+}
+
+static ssize_t fn_lock_show(struct device *dev, struct device_attribute *attr,
+			    char *buf)
+{
+	struct bitland_mifs_wmi_data *data = dev_get_drvdata(dev);
+	int state;
+
+	state = bitland_state_get(data, WMI_FN_FN_LOCK);
+	if (state < 0)
+		return state;
+
+	return sysfs_emit(buf, "%d\n", state);
+}
+
+static ssize_t fn_lock_store(struct device *dev, struct device_attribute *attr,
+			     const char *buf, size_t count)
+{
+	struct bitland_mifs_wmi_data *data = dev_get_drvdata(dev);
+	struct bitland_mifs_input input = {
+		.reserved1 = 0,
+		.operation = WMI_METHOD_SET,
+		.reserved2 = 0,
+		.function = WMI_FN_FN_LOCK,
+	};
+	bool val;
+	int ret;
+
+	if (kstrtobool(buf, &val))
+		return -EINVAL;
+
+	input.payload[0] = val;
+
+	ret = bitland_mifs_wmi_call(data, &input, NULL);
+	if (ret)
+		return ret;
+
+	return count;
+}
+
+static ssize_t tp_lock_show(struct device *dev, struct device_attribute *attr,
+			    char *buf)
+{
+	struct bitland_mifs_wmi_data *data = dev_get_drvdata(dev);
+	int state;
+
+	state = bitland_state_get(data, WMI_FN_TP_LOCK);
+	if (state < 0)
+		return state;
+
+	return sysfs_emit(buf, "%d\n", state);
+}
+
+static ssize_t tp_lock_store(struct device *dev, struct device_attribute *attr,
+			     const char *buf, size_t count)
+{
+	struct bitland_mifs_wmi_data *data = dev_get_drvdata(dev);
+	struct bitland_mifs_input input = {
+		.reserved1 = 0,
+		.operation = WMI_METHOD_SET,
+		.reserved2 = 0,
+		.function = WMI_FN_TP_LOCK,
+	};
+	bool val;
+	int ret;
+
+	if (kstrtobool(buf, &val))
+		return -EINVAL;
+
+	input.payload[0] = val;
+
+	ret = bitland_mifs_wmi_call(data, &input, NULL);
+	if (ret)
+		return ret;
+	return count;
+}
+
 /* Fan Boost: 0:Normal, 1:Max Speed */
 static ssize_t fan_boost_store(struct device *dev,
 			       struct device_attribute *attr, const char *buf,
@@ -599,11 +735,17 @@ static ssize_t fan_boost_store(struct device *dev,
 static const DEVICE_ATTR_RW(gpu_mode);
 static const DEVICE_ATTR_RW(kb_mode);
 static const DEVICE_ATTR_WO(fan_boost);
+static const DEVICE_ATTR_RW(ambient_light);
+static const DEVICE_ATTR_RW(fn_lock);
+static const DEVICE_ATTR_RW(tp_lock);
 
 static const struct attribute *const laptop_attrs[] = {
 	&dev_attr_gpu_mode.attr,
 	&dev_attr_kb_mode.attr,
 	&dev_attr_fan_boost.attr,
+	&dev_attr_ambient_light.attr,
+	&dev_attr_fn_lock.attr,
+	&dev_attr_tp_lock.attr,
 	NULL,
 };
 ATTRIBUTE_GROUPS(laptop);
@@ -653,6 +795,11 @@ static int bitland_notifier_callback(struct notifier_block *nb,
 		hwmon_notify_event(data_ctx->hwmon_dev, hwmon_fan,
 				   hwmon_fan_input, fan_info->channel);
 		break;
+	case BITLAND_NOTIFY_SYSFS_STATE:
+		const char *attr = data;
+
+		sysfs_notify(&data_ctx->wdev->dev.kobj, NULL, attr);
+		break;
 	}
 
 	return NOTIFY_OK;
@@ -798,8 +945,6 @@ static void bitland_mifs_wmi_notify(struct wmi_device *wdev,
 		break;
 
 	case WMI_EVENT_AIRPLANE_MODE:
-	case WMI_EVENT_TOUCHPAD_STATE:
-	case WMI_EVENT_FNLOCK_STATE:
 	case WMI_EVENT_KBD_MODE:
 	case WMI_EVENT_CAPSLOCK_STATE:
 	case WMI_EVENT_NUMLOCK_STATE:
@@ -810,6 +955,23 @@ static void bitland_mifs_wmi_notify(struct wmi_device *wdev,
 		dev_dbg(&wdev->dev, "State change event: id=%d value=%d\n",
 			event->event_id, event->value_low);
 		break;
+	case WMI_EVENT_AMBIENTLIGHT_STATE:
+		blocking_notifier_call_chain(&bitland_notifier_list,
+					     BITLAND_NOTIFY_SYSFS_STATE,
+					     "ambient_light");
+		break;
+
+	case WMI_EVENT_TOUCHPAD_STATE:
+		blocking_notifier_call_chain(&bitland_notifier_list,
+					     BITLAND_NOTIFY_SYSFS_STATE,
+					     "tp_lock");
+		break;
+
+	case WMI_EVENT_FNLOCK_STATE:
+		blocking_notifier_call_chain(&bitland_notifier_list,
+					     BITLAND_NOTIFY_SYSFS_STATE,
+					     "fn_lock");
+		break;
 
 	default:
 		dev_dbg(&wdev->dev, "Unknown event: id=0x%02x value=0x%02x\n",
-- 
2.55.0

