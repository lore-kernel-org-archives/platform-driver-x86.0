Received: from AUS01-SY4-obe.outbound.protection.outlook.com (mail-sy4aus01olkn2141.outbound.protection.outlook.com [40.92.62.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3BE81A8BEF
	for <platform-driver-x86@vger.kernel.org>; Wed, 31 Jul 2024 11:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.62.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722425766; cv=fail; b=RPFSHYmDni/xGJMQbfwsB0xqZBKQDc7vt3kW3TCb/T0G3P549esruS9A3BjGII4tsi8JWUDAKlqe4hpuY2+T+6ZZzmMrW02M72Asy7CiF8uNLPWa4MrHs0xKHX+ZvQmPXr4tgMdETpL402UjT1nD27+QIsMh7QJ5BAyp8F+BrgU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722425766; c=relaxed/simple;
	bh=/kDns4uYgUa8l9Fbhmiba768k2ESiF33PiM00n6Dwto=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NdUikVxYBwcV1HmwG+vllFvyHN28UuQgc4kxdNkNQ0/S9gFK0Tl+MZkpcdSeOYAEs1n8WXwJCRgFXyLZfqbG/PIRC2bTWave+yMOVXg7aug0m5ubA48v4gegQGWIJZHMBzbesIsFDdwCTRMGRoZfRSnptEktm7UxVkZQQsjVYjI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=users.sourceforge.net; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=ZVWhlNqj; arc=fail smtp.client-ip=40.92.62.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=users.sourceforge.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="ZVWhlNqj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wmbUQzj/VJVwFJ0XXV5qQ4YgC9Wa369TfInzTOfEn5A6UIdEGpG9AM5Co0HEIY3JS4WObvGDiZdN4ULISCf6iTmR2ZjAO0hq7mN3J4e0sI4J4i+yFJ81wWW5NgR37yvkrLZ35q9k1+AtTic9AvWWpCu8yGsBiFnvd4nt+bU8YTDGrjZXh+SRrgSGyzbYaIFIV4603XeSOrdr6662MCJGdEAiY2s5h1BBFzvqr3YzPtpSPa1VlYP7er3hFQyuyMQvdENwnHI6bmZIIEAPt0eZGSJehD8NW0Ma3Y43N+vCNwxDr8yIIuXFxGV5At84D/nlTjQ3c3iWLLME75AWtmvovQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bhwlY5hoWDR++9T6df+7kxvowjHNrQxWk8jHgoVco24=;
 b=N15kKEOnGEmDwgPubFoZu1fnqbfB71sr6Dhfp0vnQe6OoD5RwI6dzSefmBpuShLe6k539GT+xEetBZyjQRXlpjBT2Ept1S2g7+pwE2XzC4IgRzJ9ZnjbtEgXNt4YLO4EtQFQW2bnD8xda6DDHBiYZS7KdSLPBd7wAdiRCNIm9xwiPLZEikTSknfDjm9yAg9E80SDWHraC5BTLwVWN/raa/OqmrKE9n6K0go9YncAQjyEXWFp9MMFLo+4hWOu1kJFqskoE313YzkXIrhzQv5yQB7Bp7Mtx3cEDkssMonU2gSRkpldPRDnhqUTR8OCxjSes6rFNqYy62JNr00J/DvcIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bhwlY5hoWDR++9T6df+7kxvowjHNrQxWk8jHgoVco24=;
 b=ZVWhlNqjLi9Ibcwx7cyLVMurm7+aTF20Rjar0cdb2CZZs+6i3hzUfbfwrB8+EW3QN6VF9nygE6i3/XXRwUbisHckVnbrRqqOEvTCwMHFyxU0z0UeVkVbysXULl9Fg/xRZ8p39WxN8LQkDBJw4HXbCsTl//JckqMqWi6kD/FcMLHnBtU3ViI4tJ41I3gDcrJb2nVsgCR/4yhlqJOFFfKlm7nH70dfCLCSVO21Y8fsDCpbqs5eJAz7VcV5ym0/BjjbQzlzDqzCLJZAbGhLkFvN4NTP+BkPbiSBg3pUQa5t4kCuLsPwwLOBd7DMLAyt5aV0Ez2z+n9CBY2J4OHf8bs6Cg==
Received: from ME3P282MB3003.AUSP282.PROD.OUTLOOK.COM (2603:10c6:220:150::12)
 by ME4P282MB0982.AUSP282.PROD.OUTLOOK.COM (2603:10c6:220:c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Wed, 31 Jul
 2024 11:36:00 +0000
Received: from ME3P282MB3003.AUSP282.PROD.OUTLOOK.COM
 ([fe80::a309:11d6:4508:99f8]) by ME3P282MB3003.AUSP282.PROD.OUTLOOK.COM
 ([fe80::a309:11d6:4508:99f8%7]) with mapi id 15.20.7828.021; Wed, 31 Jul 2024
 11:36:00 +0000
From: Joshua Leivenzon <hacker1024@users.sourceforge.net>
To: platform-driver-x86@vger.kernel.org
Cc: Corentin Chary <corentin.chary@gmail.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	Joshua Leivenzon <hacker1024@users.sourceforge.net>
Subject: [PATCH 1/1] platform/x86: asus-wmi: Add lite thermal policy support
Date: Wed, 31 Jul 2024 21:35:07 +1000
Message-ID:
 <ME3P282MB300372C60091A735770D94B1A4B12@ME3P282MB3003.AUSP282.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240731113507.178929-1-hacker1024@users.sourceforge.net>
References: <20240731113507.178929-1-hacker1024@users.sourceforge.net>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [2H2yxgHaiU7iBIlpE+lYLSr44s993Jdx]
X-ClientProxiedBy: SYAPR01CA0016.ausprd01.prod.outlook.com (2603:10c6:1::28)
 To ME3P282MB3003.AUSP282.PROD.OUTLOOK.COM (2603:10c6:220:150::12)
X-Microsoft-Original-Message-ID:
 <20240731113507.178929-2-hacker1024@users.sourceforge.net>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Sender: Josh Leivenzon <joshleivenzon@outlook.com>
X-MS-Exchange-MessageSentRepresentingType: 2
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ME3P282MB3003:EE_|ME4P282MB0982:EE_
X-MS-Office365-Filtering-Correlation-Id: 17fcb046-9388-4f6f-16c0-08dcb154f3ad
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799006|5072599009|19110799003|461199028|3412199025|440099028|1710799026;
X-Microsoft-Antispam-Message-Info:
	ML8vRb/jWJd+qnb8B5Uc2RbgFMx/Ff8RC7LuQ0AF67u02YMTQ0XUo9ea+tW1UB+4AwBxvBQBsIcId77f8hSmg1nQ5F7oImNAxK5ORSamincR3/r3zv4yXkR/RP6GUkgwf4TBKJeaiYLURqQaZwT413iGfBMo9D0dSD4N7ANQGFgztXqxh3NlSe0SgWADqavqCT09Zeaq9BDFMlmbO3isJt3466igBGkF4ECJWMtNPeLNzO8O91QtBb9hGYAf8IGO8o3Gl2hcPALzptvUlkSyQ6eH9yE3qrpRnKzERj+33UFBskFlhYkYcAZPg/O89q/oEDvBzpS6cRYrSGHFaa1raAYPYnUgFoW1yRMCUd7IxV/6ntRfGGDzrb4EhHEojGmLUt5xZr6BDVfm6Tto6c5qr7rOS1nbqbyxotI6G0oUIj8bAPTPkQJWhT1arJUwXi2IQjEMxDngE6e4w7C+Io6AjuYZZ7vGRsvOeBTAWOFPWWktZ9d69o5kf11TdvIDm5fH/+lvDwCGlRy2mkXeI8z86uHQTCGgBeFHOGelZuDkH1b92/KGikRjcI50Ns/KISH/Z1tCqWFrij2w8Kif5QOw2ZIyBd4GUPfevrG+tuOFB6M0sjcfLpJL6nCoZ3I6j3az0YVMdWQRk9/WfG0+TjnRwjRAurbBEx12iaL2RzUTDwyQTJD0QL7JxLNh+UoGO37M0PYsQy/ekn7r7vg14YpaDQ==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HUmOPAf1fNKu+keZdZohDqfCSUP71JMKv1DJTLSl7+1/DfJJYMvRGrQ6fnGI?=
 =?us-ascii?Q?2mPYOMYCPqrersZaVMimgj5gt62Su1lcfmkKmzgxvMqjTO19vy/f6i2v1trY?=
 =?us-ascii?Q?nzeta4HJcXTnSFHNaGbYaPGxtYU0iTFzu+U19fpDmlzNzNpawIq9hFDer21A?=
 =?us-ascii?Q?Vn5VyWo4ZsW7zc91PYkhYT9acDIyuD5O9km0vHvm0PkTiYdLV8Mf/7tRyv/C?=
 =?us-ascii?Q?S4v2dvq6rf4QFHa70eu0Jnvmu6p4WgWWzSQgNA3BKs9j+wiSScf3QtJFaJUj?=
 =?us-ascii?Q?v88iW+i/ByiB1uUBW3O0U0XBcSKyfSXskIOxi0dUiiSQ1MQTR5SfMb7B1GnJ?=
 =?us-ascii?Q?ATdKTw+6X+ut5ppHdgGUkDKRjPEvGQFe8VswK5tpFXOjoiZ4leCQAezEmFvn?=
 =?us-ascii?Q?OnGGw0gvCe6iwyKK4V8UNcaxUYOQB7vGwYSicD7QHuOn2vJESi5cwAPGG9vf?=
 =?us-ascii?Q?tdG7Ftqwl7l2Hn3hbKvVz9o0sbkq8JS4NBbZB204dh7JdDBJfkVDU4CO9kpb?=
 =?us-ascii?Q?53bj/6G3Gqm9bDuFF9LsMiZuhC9Zjzktachu2Go5yAqR1RF88Q+gR0k2e/CD?=
 =?us-ascii?Q?m/YhQhJ8ARy6vqMVRPrv2W4AA9mUaYMo0rK2i4lHRgH/SlgvC/4VGq62pcZM?=
 =?us-ascii?Q?dSUYgI2WrjRgbmig7M6HzGBfST5AV2rCvjdj8AgAgLwaUegn++58y4ve8AK1?=
 =?us-ascii?Q?Tr9fpFiSkiMUxMZScvkqNahpcCCA+KIXgQRV7k4ktlh1KDs0vlgjNf+w7hq7?=
 =?us-ascii?Q?xGIXn+4t4tavV36TzUX0/eP4zNnPHDtzXrh4Yaa1P6z7l1vBkfWOM67pRaWv?=
 =?us-ascii?Q?7uny3z/0Q0reNrk2bBDdsXAXvOBAbe6i+TNIznVa6wr9NobFMzgL2UL4kf2U?=
 =?us-ascii?Q?/N+8di8YvG6QlGcBfH/tAbdNpOJ40aUeKS+gBLaRd6Egz6g5sA60ayA/IAjJ?=
 =?us-ascii?Q?EyOmvScwfy0JuUqLkwhbYmK7VD29ePgBOBk3R55o4mcU214Cj98tfaNhqmU4?=
 =?us-ascii?Q?xNlzvz5nBzJCEWhKf/Dc2S3li/dyr3nGviRzrYt2CVHi/+0ImLpf/iNIYpjZ?=
 =?us-ascii?Q?J7DdM6Ss28pF8KxWuoKZeGYkOpJyOwiU+ViKgrLsT/K6A48t0gik+BJZPqsw?=
 =?us-ascii?Q?5pWvY3qDoXqAmKWUvL5k0tbBY6leAL6bcojFSkWUrYYv0ihxDDBiWiRS0gIS?=
 =?us-ascii?Q?1kafR5zKQ176qxRAZaRiOpvx+W5lqZi6GJ+lHdFC5SO1VH6ctGSBXmBGh0BC?=
 =?us-ascii?Q?9l7tbuhJMGvuwbayJhE+?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17fcb046-9388-4f6f-16c0-08dcb154f3ad
X-MS-Exchange-CrossTenant-AuthSource: ME3P282MB3003.AUSP282.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 11:36:00.5258
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ME4P282MB0982

Some ASUS laptops, such as the Zenbook Duo 2024 (UX8406), use a different WMI
device ID to set the thermal policy.

These devices tend to lack support for custom fan curve management, hence the
"lite" designation.

Signed-off-by: Joshua Leivenzon <hacker1024@users.sourceforge.net>
---
 drivers/platform/x86/asus-wmi.c            | 102 +++++++++++++++------
 include/linux/platform_data/x86/asus-wmi.h |   1 +
 2 files changed, 76 insertions(+), 27 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index cc735931f97b..a89cbc063a3f 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -93,9 +93,13 @@ module_param(fnlock_default, bool, 0444);
 #define ASUS_FAN_BOOST_MODE_SILENT_MASK		0x02
 #define ASUS_FAN_BOOST_MODES_MASK		0x03
 
+#define ASUS_THROTTLE_THERMAL_POLICY_COUNT 3
 #define ASUS_THROTTLE_THERMAL_POLICY_DEFAULT	0
 #define ASUS_THROTTLE_THERMAL_POLICY_OVERBOOST	1
 #define ASUS_THROTTLE_THERMAL_POLICY_SILENT	2
+#define ASUS_THROTTLE_THERMAL_POLICY_LITE_DEFAULT 0
+#define ASUS_THROTTLE_THERMAL_POLICY_LITE_OVERBOOST 2
+#define ASUS_THROTTLE_THERMAL_POLICY_LITE_SILENT 1
 
 #define USB_INTEL_XUSB2PR		0xD0
 #define PCI_DEVICE_ID_INTEL_LYNXPOINT_LP_XHCI	0x9c31
@@ -287,6 +291,7 @@ struct asus_wmi {
 	bool kbd_rgb_state_available;
 
 	bool throttle_thermal_policy_available;
+	bool throttle_thermal_policy_lite;
 	u8 throttle_thermal_policy_mode;
 
 	bool cpu_fan_curve_available;
@@ -3639,6 +3644,14 @@ static int throttle_thermal_policy_check_present(struct asus_wmi *asus)
 	err = asus_wmi_get_devstate(asus,
 				    ASUS_WMI_DEVID_THROTTLE_THERMAL_POLICY,
 				    &result);
+	if (err == -ENODEV) {
+		err = asus_wmi_get_devstate(asus,
+						ASUS_WMI_DEVID_THROTTLE_THERMAL_POLICY_LITE,
+						&result);
+		asus->throttle_thermal_policy_lite = true;
+	} else {
+		asus->throttle_thermal_policy_lite = false;
+	}
 	if (err) {
 		if (err == -ENODEV)
 			return 0;
@@ -3659,7 +3672,10 @@ static int throttle_thermal_policy_write(struct asus_wmi *asus)
 
 	value = asus->throttle_thermal_policy_mode;
 
-	err = asus_wmi_set_devstate(ASUS_WMI_DEVID_THROTTLE_THERMAL_POLICY,
+	err = asus_wmi_set_devstate(
+					asus->throttle_thermal_policy_lite
+						? ASUS_WMI_DEVID_THROTTLE_THERMAL_POLICY_LITE
+						: ASUS_WMI_DEVID_THROTTLE_THERMAL_POLICY,
 				    value, &retval);
 
 	sysfs_notify(&asus->platform_device->dev.kobj, NULL,
@@ -3701,7 +3717,7 @@ static int throttle_thermal_policy_switch_next(struct asus_wmi *asus)
 	u8 new_mode = asus->throttle_thermal_policy_mode + 1;
 	int err;
 
-	if (new_mode > ASUS_THROTTLE_THERMAL_POLICY_SILENT)
+	if (new_mode > ASUS_THROTTLE_THERMAL_POLICY_COUNT - 1)
 		new_mode = ASUS_THROTTLE_THERMAL_POLICY_DEFAULT;
 
 	asus->throttle_thermal_policy_mode = new_mode;
@@ -3740,7 +3756,7 @@ static ssize_t throttle_thermal_policy_store(struct device *dev,
 	if (result < 0)
 		return result;
 
-	if (new_mode > ASUS_THROTTLE_THERMAL_POLICY_SILENT)
+	if (new_mode > ASUS_THROTTLE_THERMAL_POLICY_COUNT - 1)
 		return -EINVAL;
 
 	asus->throttle_thermal_policy_mode = new_mode;
@@ -3771,18 +3787,34 @@ static int asus_wmi_platform_profile_get(struct platform_profile_handler *pprof,
 
 	tp = asus->throttle_thermal_policy_mode;
 
-	switch (tp) {
-	case ASUS_THROTTLE_THERMAL_POLICY_DEFAULT:
-		*profile = PLATFORM_PROFILE_BALANCED;
-		break;
-	case ASUS_THROTTLE_THERMAL_POLICY_OVERBOOST:
-		*profile = PLATFORM_PROFILE_PERFORMANCE;
-		break;
-	case ASUS_THROTTLE_THERMAL_POLICY_SILENT:
-		*profile = PLATFORM_PROFILE_QUIET;
-		break;
-	default:
-		return -EINVAL;
+	if (!asus->throttle_thermal_policy_lite) {
+		switch (tp) {
+		case ASUS_THROTTLE_THERMAL_POLICY_DEFAULT:
+			*profile = PLATFORM_PROFILE_BALANCED;
+			break;
+		case ASUS_THROTTLE_THERMAL_POLICY_OVERBOOST:
+			*profile = PLATFORM_PROFILE_PERFORMANCE;
+			break;
+		case ASUS_THROTTLE_THERMAL_POLICY_SILENT:
+			*profile = PLATFORM_PROFILE_QUIET;
+			break;
+		default:
+			return -EINVAL;
+		}
+	} else {
+		switch (tp) {
+		case ASUS_THROTTLE_THERMAL_POLICY_LITE_DEFAULT:
+			*profile = PLATFORM_PROFILE_BALANCED;
+			break;
+		case ASUS_THROTTLE_THERMAL_POLICY_LITE_OVERBOOST:
+			*profile = PLATFORM_PROFILE_PERFORMANCE;
+			break;
+		case ASUS_THROTTLE_THERMAL_POLICY_LITE_SILENT:
+			*profile = PLATFORM_PROFILE_QUIET;
+			break;
+		default:
+			return -EINVAL;
+		}
 	}
 
 	return 0;
@@ -3796,18 +3828,34 @@ static int asus_wmi_platform_profile_set(struct platform_profile_handler *pprof,
 
 	asus = container_of(pprof, struct asus_wmi, platform_profile_handler);
 
-	switch (profile) {
-	case PLATFORM_PROFILE_PERFORMANCE:
-		tp = ASUS_THROTTLE_THERMAL_POLICY_OVERBOOST;
-		break;
-	case PLATFORM_PROFILE_BALANCED:
-		tp = ASUS_THROTTLE_THERMAL_POLICY_DEFAULT;
-		break;
-	case PLATFORM_PROFILE_QUIET:
-		tp = ASUS_THROTTLE_THERMAL_POLICY_SILENT;
-		break;
-	default:
-		return -EOPNOTSUPP;
+	if (!asus->throttle_thermal_policy_lite) {
+		switch (profile) {
+		case PLATFORM_PROFILE_PERFORMANCE:
+			tp = ASUS_THROTTLE_THERMAL_POLICY_OVERBOOST;
+			break;
+		case PLATFORM_PROFILE_BALANCED:
+			tp = ASUS_THROTTLE_THERMAL_POLICY_DEFAULT;
+			break;
+		case PLATFORM_PROFILE_QUIET:
+			tp = ASUS_THROTTLE_THERMAL_POLICY_SILENT;
+			break;
+		default:
+			return -EOPNOTSUPP;
+		}
+	} else {
+		switch (profile) {
+		case PLATFORM_PROFILE_PERFORMANCE:
+			tp = ASUS_THROTTLE_THERMAL_POLICY_LITE_OVERBOOST;
+			break;
+		case PLATFORM_PROFILE_BALANCED:
+			tp = ASUS_THROTTLE_THERMAL_POLICY_LITE_DEFAULT;
+			break;
+		case PLATFORM_PROFILE_QUIET:
+			tp = ASUS_THROTTLE_THERMAL_POLICY_LITE_SILENT;
+			break;
+		default:
+			return -EOPNOTSUPP;
+		}
 	}
 
 	asus->throttle_thermal_policy_mode = tp;
diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
index 0aeeae1c1943..f37e34ea36a5 100644
--- a/include/linux/platform_data/x86/asus-wmi.h
+++ b/include/linux/platform_data/x86/asus-wmi.h
@@ -68,6 +68,7 @@
 #define ASUS_WMI_DEVID_SCREENPAD_LIGHT	0x00050032
 #define ASUS_WMI_DEVID_FAN_BOOST_MODE	0x00110018
 #define ASUS_WMI_DEVID_THROTTLE_THERMAL_POLICY 0x00120075
+#define ASUS_WMI_DEVID_THROTTLE_THERMAL_POLICY_LITE 0x00110019
 
 /* Misc */
 #define ASUS_WMI_DEVID_PANEL_OD		0x00050019
-- 
2.45.2

