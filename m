Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010023.outbound.protection.outlook.com [40.93.198.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E024E7818;
	Fri, 25 Sep 2026 19:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790364776; cv=fail; b=ojoD5G9ld90Z6+xySN3cLuJF4+5/SeR60KXrcXWptXEs/KtbkQTo2Hr6PHSa1WvBAyEThhLog9dGOmmGAS54ULjVRyO6jjPHtxOwW4t09nmCQddX12gtnc1wBaSCNlH3c+m6hQH6TxhN5K+GRUCB/fIQk+MQwdoJRI8mYmz9rMM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790364776; c=relaxed/simple;
	bh=zp4N4xANu9Fo5E9LUAq4z//cffG6TzkwP24djT3Hpto=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Yne04Ufo6ffYG2BVbizA51ZlUdW6tWHU4SHpXnqA8FmRGIaBOSFTaoKrQgqgFDFVRfpxilDP5VO+slB+czoY+5waK/01mndPovLqsoshr2DtEZbwscPYrO7S8Wtxhy2y7rv5Jk6l1/oepHxHERkzCkpJ6Xz8ArplVa8/KSDJwOw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=epW8JQsj; arc=fail smtp.client-ip=40.93.198.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="epW8JQsj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xNnabi1hVkfb38XD9n+X9Ev0o3A3lx0JDc+ClIw3nuEThcK3Z9SR1FBxD99zCpQ6A26jOi8ZyzucYUO6KqkaoWLypjiDPQlR2OBcd6RPb3c9mjeJ0XOSwiCntoGeIHw+DbPk1Mce/RiItG01xySzWQEuc56cAxv2Dtn4wm3weMtda46eyck6G1N59TDOdKYP1eTU5dJt76WoinnZpzrD6B+6Z5p4wumnIRcbEbxzFBkNdIWispi+mxTF7WBJpq048fcVKnKgaDcWmcIh1Zpy685a/tEmSBLDwG5P4R0QWnwEz4kih5Zb5/FK7I5Oc92qLveWWVoBNKJl/UNiIupHnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jer1ncvCW2t28xTO/RL2NciYq4uyKRGJDg2TUtiCEU0=;
 b=aLrCEwiLwu1EbCjwS8FWe8nsUp2ePVg/m7+PNRMqAn2/aNQy3CgdUbuXW0QKeQyqZ7IieGeJz12I2av1hVb1t3WM+kzE2Mf3nrFvbrzHQVShcdDmHZ1M2vGiip5qwggPg2AZUFfL/IXLqqCzhKjk2BV1Y1jtqxGwca1h1SVJBHTk/jnWuDBJ4kcMR9SWDO6b93TYeyScjTcE5pRIQCfnExt4ouiqUxC2pBLtcTZi1/rlqQxB/mShYp45fAqfE7rJB2ccCxNOv8tX5LPGHhnb9IwCh/5jlkG600B7+r35XemsLBRjEWydN0NRGZFABPoUGc2sMcJEOViNNcKaB2TG7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jer1ncvCW2t28xTO/RL2NciYq4uyKRGJDg2TUtiCEU0=;
 b=epW8JQsjGTDMYFd6UcnI0dEGIvE3BVM4fS+gPXS+/ahwlOHMaNsk9zH+/O2J0Kjc7FRUIIfHTFBPFbtMgWfsvGoM4lLhHFKpC+trfovk0M9Gap4glsQCQVIKrJjHexdgitWfT7lq6pIowFzmJo8PP0TFzAiCen+GMBVZb7WQ0wjKWshRcMJV5lw6XEl5s35JO+iAsZxXyq5fdkNxUGazxpxR7njf02qX8kKUjsiKDp/jkZy5FLruRZN/vNdem2DHy+MIJYdhd2ReHrf0elD2C1eMZ9cj4391+csE9iQGi4S8UlvgiKb++xOmyFVTpY0kIjzNYS5S25eOFxN4pu0+aA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV3PR12MB9356.namprd12.prod.outlook.com (2603:10b6:408:20c::21)
 by SJ0PR12MB7475.namprd12.prod.outlook.com (2603:10b6:a03:48d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 19:32:44 +0000
Received: from LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286]) by LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286%5]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 19:32:43 +0000
From: Yury Norov <ynorov@nvidia.com>
To: Matthew Garrett <mjg59@srcf.ucam.org>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org (open list)
Cc: Yury Norov <ynorov@nvidia.com>,
	Yury Norov <yury.norov@gmail.com>
Subject: [PATCH 1/2] platform/x86: dell-laptop: Use fns() in kbd_led_level_set()
Date: Fri, 25 Sep 2026 15:32:38 -0400
Message-ID: <20260925193239.248779-2-ynorov@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260925193239.248779-1-ynorov@nvidia.com>
References: <20260925193239.248779-1-ynorov@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0333.namprd13.prod.outlook.com
 (2603:10b6:208:2c6::8) To LV3PR12MB9356.namprd12.prod.outlook.com
 (2603:10b6:408:20c::21)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR12MB9356:EE_|SJ0PR12MB7475:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bf99301-23de-4703-7eb1-08df1b3bc553
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|56012099006|10067099003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	GugUaIqSprQsFW966Stku1iT66oDrMwH9N8QajGfxhPkgQF3jlLzCykHrVRyCez8BlU55oo8MtYwGjQlmLmnA8LVcWBDEKV4hKaYOmaXRMjV5CauSCzaSl7PTZpy91X6MMzLP5+2k6IYreUDHdLcDQIixYiidNSgJNsMA1Rlfe/xpNrrX640oEDs4YWe5qOsON9J2eCAbQXApcT6MO7xVodrlJ50oBcIuLwB83xzBryhAXJ/vMA2NLWQlkXQHmsBElisuNy2Twi64OUnbRbeW+liKbGeYgv//alazhd7Apdad/7wKTBsAgUKwIMJlpJ2JLSbpg0F45/ncoRGHK4f7vMYBdStK2RolkbO72sCNHqnlG8N49RKGcy/J+Dt1MmcZs8W83vPfDGVoXNx2w70oyg/IDI7HDIhmmbhPqszoZvo//e624jL4khWWH0WpJYP012MBk+sOfbeYMMP0V9Z9bnh+clvvRySKjpln9+4vzaceomo4vobuWViH1Uv7WtRZa/JLrXdRqNryLe+XwY2vP/krON3Tm306dlPs8RWuNtKxAGd9D6TQOFDG3STa3BKq1tT3S/gLKxO+3x6PGFyDyk4oMtzTtssZmU+xKH8W6DYaGoPJ/k2taOPbOlGXiD5rPxhDA6iM9XnUj7JKbzRs+v9wu9w8k29H1Don0fyccY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9356.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XXEMa+8KvcvrSvikp/7wuJuEIzfKCOg6e8MaHpRnQG7BQq9kZMANoTOgzyTf?=
 =?us-ascii?Q?HVX+1LVYmF06mjFOhWe4oBQNeV6wKoanaePJdcORXnqYAyz97f6sHKVmAKJC?=
 =?us-ascii?Q?BcIJ5zUMbft4PGMUIgcYUqHwhNyGET2tqSXH4kJGjyDGjkvZUwORlJ8w5TSN?=
 =?us-ascii?Q?QGMWTFVfwQWYbg8jD6mjeLzkxxtmnaex++6UiU9uH3IQjIn/oJpxR9ovXv4v?=
 =?us-ascii?Q?4YTTKe/TLAtHAE92EIsVQ0urhms6SgHae2CsxZxeDjNxnMxHLXqcOByMFr7U?=
 =?us-ascii?Q?XW1We+/aAHNgLIe9sGjctNX9oXSuMr9Pb6DMOSpmHiQQ7orhD9cC+NDnHRSk?=
 =?us-ascii?Q?Bb5TckSEyJYkgf/DV6dlUF+sZhp1PlPOWEbvTrtHc6tIpls9Sv6IE4Ka/Lr7?=
 =?us-ascii?Q?pJSNSYWbOc7V78HUAx706UhJVHFKhJWsxT9KXhrm0ztu8nY+xUHakAnJ+GrS?=
 =?us-ascii?Q?DnCpg81kHhfCX8vEdvC4hJFds9nys/+OTWVFBUApvgAhqUQO6u2cpL2vJM+t?=
 =?us-ascii?Q?DH+gqqtjPEOdCWrbQQbwLj8jXSMd0Nq6TbikVai+DB3I2BBD23sRsAyI+C21?=
 =?us-ascii?Q?217y6K21iMchTtoK7vEoGLFiX5ftu2aNHqgnlEPCOQtISn2M/l80uUYG6Otp?=
 =?us-ascii?Q?id/Utog9p4d2vSLhmNh+gApVBHu+6CpZux3KXD/pRt7ahZsydhOqgkYhX+u+?=
 =?us-ascii?Q?70B/jHiPOCE6Ci88fLbklhHaEF+lT2WLTcL0BCt5I7bsdiXYBNEg2HdD/b9q?=
 =?us-ascii?Q?+n7wiJPLWRCcihWWCqFm9jp6aEYfytcB4zB5AFoI6+4hhJ2jjeMu4SUi+Yul?=
 =?us-ascii?Q?r+Co7/bIy2daSBg/OXbf0mnXdhUG8kVyFMovAcn4YvJOcdLw+oHb0sjR5HqM?=
 =?us-ascii?Q?DmqmcyfsiLpkcdWlcymYBpvLX3I1p8awa++bASfxxfzyHOm5Nxuew3PEYY17?=
 =?us-ascii?Q?CgF8/hsdaseKbOIm3WqLQBFuctIQhiCj8kbSw9Gd/k33Y4sbKPxBWYm2iv8g?=
 =?us-ascii?Q?MLuUzXwYiIBWBaUB72pLL7ohB8S+ikbDppqvjlY5fhgfnFsRSETbUiC+AOHN?=
 =?us-ascii?Q?s1B6HVZJe8nu0XaT2uHBpE1vWO9Fpe2c1rcdlv12FsWoT4ifh4d8FVpWZHd4?=
 =?us-ascii?Q?g/y/yM79Gp32oh2mNqEdFb7DvUPVDfEkKgxChytgM4RkRahUEalULJ4ofFwt?=
 =?us-ascii?Q?J8lPdGPZyRrN1sDAP+yNbE0S7EJzPKcDa3T4GXlCoYdQxhJcLmOdBxFACA8e?=
 =?us-ascii?Q?rhWzTOzH7NABn2vs/g1ABxDtj2AcAFP2Um1muqwKsjb1buv3YH90zFE2sJsO?=
 =?us-ascii?Q?ohcXHQ2yptv+1N4exoXf/6yM+xQaEv/q4wT983Xv3ROboq3++xII7ocbW5AY?=
 =?us-ascii?Q?iCg6jYNMz9CPZZLulkRF9xIvF9z1SzCNDxIKZO4Q821XyzT/c3y/kY9MMHDz?=
 =?us-ascii?Q?78Tjrry8MCGvo3D4PUCil4yh/1p3AkJfakKgurgN3ZOfVWU4kOm2C+NyiSbj?=
 =?us-ascii?Q?QV39aQcgpyylu8kH5sZkt4xT0kdPcp8/c7pbHg86ZyTJhcV0tXcHy1fmKgyC?=
 =?us-ascii?Q?M4RWH2YJX65/nme38jyOj+y5gH5ix0tax9045O31wLt4xMYspMUen0nltQhc?=
 =?us-ascii?Q?BdSkh7fNkzWCsNi7qupccpxw0x3s65LoKnquVuLP3xUR43tQxgvXbRoC+614?=
 =?us-ascii?Q?iYXv4QAB+Aedu2Zu3Lh30U2GBHhLWs3m/0oywrezlZbOAqSo?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bf99301-23de-4703-7eb1-08df1b3bc553
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9356.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 19:32:43.8457
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ejcEARgSTS8m+vFdsEHBsKxZ/3InuysoVc3h5QhfIe8C+i2tx1YES3dC/pEPiu6onfWlyd6DSX5nYKyjkSjtRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7475

Replace the loop clearing lower set bits with fns() to select the
supported token corresponding to the requested brightness. Preserve the
zero return when the requested index is out of range.

Signed-off-by: Yury Norov <ynorov@nvidia.com>
---
 drivers/platform/x86/dell/dell-laptop.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-laptop.c b/drivers/platform/x86/dell/dell-laptop.c
index 89e85c7f7132..03d3bb70b0d1 100644
--- a/drivers/platform/x86/dell/dell-laptop.c
+++ b/drivers/platform/x86/dell/dell-laptop.c
@@ -17,6 +17,7 @@
 #include <linux/init.h>
 #include <linux/platform_device.h>
 #include <linux/backlight.h>
+#include <linux/bitops.h>
 #include <linux/err.h>
 #include <linux/dmi.h>
 #include <linux/io.h>
@@ -2036,7 +2037,7 @@ static int kbd_led_level_set(struct led_classdev *led_cdev,
 	enum led_brightness new_value = value;
 	struct kbd_state state;
 	struct kbd_state new_state;
-	u16 num;
+	unsigned int bit;
 	int ret;
 
 	mutex_lock(&kbd_led_mutex);
@@ -2051,12 +2052,8 @@ static int kbd_led_level_set(struct led_classdev *led_cdev,
 			goto out;
 		ret = kbd_set_state_safe(&new_state, &state);
 	} else if (kbd_get_valid_token_counts()) {
-		for (num = kbd_token_bits; num != 0 && value > 0; --value)
-			num &= num - 1; /* clear the first bit set */
-		if (num == 0)
-			ret = 0;
-		else
-			ret = kbd_set_token_bit(ffs(num) - 1);
+		bit = fns(kbd_token_bits, value);
+		ret = bit == BITS_PER_LONG ? 0 : kbd_set_token_bit(bit);
 	} else {
 		pr_warn("Keyboard brightness level control not supported\n");
 		ret = -ENXIO;
-- 
2.53.0

