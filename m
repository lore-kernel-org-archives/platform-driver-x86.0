Received: from out203-205-221-231.mail.qq.com (out203-205-221-231.mail.qq.com [203.205.221.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BFCF326923;
	Mon, 10 Aug 2026 04:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786337288; cv=none; b=kh2ov6ZfeELLb82VDY3kfqsLDelKN9DfyuB9gtJPAqBV9EVJEU22GN3kNBgXhBlf3i9le6wJCs7vxgx6o7CJP6MVxtRLC/mxOtTcYw0JEOtWPqBp0DThxKF42KjkEvFnt//J1s/O++GcbOIfoD3dNzRltdiUVZJYPNHzxgwvqq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786337288; c=relaxed/simple;
	bh=gjCZL/T0kGx96Lca4zmlRmD3GHhBHV4JGFqA7AdH9X4=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=CAV5ngroCFVtLoqjKESFaOiMhtA2aIyGhqfB4esUfEIAxDjI9yZAPB1f0YhojPwD3oXd2B7RG2imWJZuY/xlmUnA1LY+Z+CySwW7Fae+Gvy5SjruRVwzB9yVkgkpG8MsFc5aXlwtgTQQB8OCRKy04FmlDX5AknVS+OHmCM90Z7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rsplwe.com; spf=pass smtp.mailfrom=rsplwe.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=KD2CChdJ; arc=none smtp.client-ip=203.205.221.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rsplwe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rsplwe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="KD2CChdJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1786337278; bh=2PRA67SL4xV5BXdxAreMVQBkR45aqucAZFTDeNjbVkc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KD2CChdJmAdYDvwOmRrWvwS7WN5JgIbjJXwxMROPUKt0KyCtS1zDGcc7V4+JstwVT
	 ToXmSiSLoAH/Q4gy6uInE6IXWKpurhaH5e5vxKqobDIPAYswmPGm7UXtV/RLaKmBs2
	 17QVHs3dQN9clpfhLzPk+xTtYfT8Y6U9J4pPptNw=
Received: from kasumi-star ([14.218.70.170])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id BF4AB415; Mon, 10 Aug 2026 12:47:52 +0800
X-QQ-mid: xmsmtpt1786337276t99k7z7uj
Message-ID: <tencent_83AC7CB82056A710CF379116369765662205@qq.com>
X-QQ-XMAILINFO: OATpkVjS499u8J+XX4DqcRatoDvFsmMYKPU5FfL580Mf6sa4lA2Cns8J7/wRNU
	 k7dzFRxtf8NW9F6lBgEbGDSx3eiiAp1DlBntY7mYJvxeFK+I+tAbboZr/bTEhNrP1jK93BBcZPSN
	 8PB0a8GxG7lwZ5lrvkcrC9L8N5nlzaBFZUAaVQCvhq29Kyt9sQ0Q/5bvpzBrAwDhfHlZV5/jhlNU
	 zAZKtqV2Skz9p+w4kZLsa3h2UZBSG1+s7Nh9JrrD8ITlVN30bXoMrZTnwh18TUFSflo2Jpa+E4xp
	 /21rP4rW6ixXc37HU+GHKv9GPcoXdZ7KvSMOqmHdcdxrMhhOJYv4vi2Cy5Q0L+3hR1bsU3o4kDkg
	 ZfuL5lpIbsaDfqd2pkNToh1OAIMYTh9BeHNUzIOLyw009tcGqpitTewivWWacsfDHZY8suJNjPCy
	 m6upe+CiLDyo6sbdN3ngKAQwdnmSxhUIP77K3XUBgFEImyra3RznDaB9SZLQMJVNwr+pM4SR+cv5
	 gl7nqhqPvWquBBsvg2P+62CflAKzrApLZuUsXMrZMeZskSpITmNW1ckoMdfM1NOFwiKYt1OR75BD
	 1tkUvKuYGiQlCvY5NvZv/CJdE9B3mMqfsmQGCf19BoivjbGJYARRQmDvJVEaO/Q3lyoe9l9qLwwh
	 o5tgvSBIKIZ75tZDVFfim+b1DXhUxZnmDKvDmAbv19tBYCl/8Y+ItD1BCqitfbyEGm0fjPh4hULX
	 jesSCN3YVL3ayyqUGyImCx6axiGzJ4bqWbZ0mPJ2YmpKCBFpaMgB2jWnPhpGmyDZ1g/1vZ9epjzI
	 VsTWHUysGmJSymomQVHwE8dNcvcXmVeT8lvHh+XPCIgUrdXrAepBTJ0lruFaXyKJNxgZ9WPcW6kc
	 vAq4ceXCuYgE4oyvZD7tHwZ5m4z2Vy2gFe/ztiWGgS8oipJr/3aiz3dx/XiZh+MStJ6jXiD8Eh6c
	 052GqhPzx7SkxdUENC8KSSN3mN065UWyQRL9wV08tUygKLmbpXapVzolVU6g1EFyKQzfNsKzhmZR
	 zUVQn6M+vnz59RvrdYK+9dgeQmiElJEEJBsiPXIQWPZhpHVLcZj8Whwmvb7H4zFYLRV3e8KAWbnG
	 VoE//qe19s19ccBIt6iOLq/rF0gBt6pAy89hcS1QM42DAL0I9U27aqubMIbaWTK8j0LbpA
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
From: Rsplwe <i@rsplwe.com>
To: ilpo.jarvinen@linux.intel.com
Cc: hansg@kernel.org,
	W_Armin@gmx.de,
	qby140326@gmail.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rsplwe <i@rsplwe.com>
Subject: [PATCH 1/2] platform/x86: bitland-mifs-wmi: Add sysfs controls for device status
Date: Mon, 10 Aug 2026 12:47:50 +0800
X-OQ-MSGID: <20260810044751.43045-5-i@rsplwe.com>
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

