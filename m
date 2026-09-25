Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010023.outbound.protection.outlook.com [40.93.198.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2AF74E80B7;
	Fri, 25 Sep 2026 19:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790364780; cv=fail; b=bCAZTHPR8u0l1o3t7/TP+FFAlU7PCX3f5pSfhrdxyz1GrJI4LNaX+1CMG9qOCPQaIdJ8s0LjxhU/dxIzygT7TXjzaaMNjRCK8jo5x1zFDzfzyUJk0fUtXMoONhhKAaXmsRvUWz9h55bb6mcnQeI2PT0c1RSTtcRMb3pRUl8r0Rs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790364780; c=relaxed/simple;
	bh=gwBfw4RTtJm09rX+VnGTYxPRBHdXnRtGIFx54vammMQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=W/ZJSxVUx9faNsb6mRCQWcfwNqPVRCsIHpFVIIPtQ8MPEbOO4LXaqgfz4We9/ivVUG/8Xpij7TIOmAvV1MBJiJ9VgcxFOYoVrD1cUrKmzk2SH2o3Z0BuUODvVInYsW6EG6BbOH6Hj/sPExnHQ2gbyFlmIABFv+BLUDVcVqxrb1I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ag9JGe+n; arc=fail smtp.client-ip=40.93.198.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ag9JGe+n"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b9H6FEhudlFWUlHbeA/CPRPepNEU6iN9DJY/j9CW13c5m3GFTresrx47DkwSPmxzKOlYcdoL44QM8PxXqcIIs2p0FnmUbch6hESF6hN/fGSBVE5WmCk1hP+PVOeUfyRjR7s+BboH2D0WMPIMEUhOujsQLmEuqWqojgEPEpW4KADyKu3d1cdRFPGfVZ5ihX+TW/YepLrIyNCDrE8QlRx/1K9ziVml4jK9hUsZHfafDBzCI1gXI/GIh8CbyRgiLA60B14mGtZ7/EwDcvGUrlYPeF70leZp3/kWlx0W8IVvbHdJWb+3hirhcWKH6TRBjIwbsuPEvGcXkVP9EUYbR/ch/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ifMTDqhxicc4SKsCICK05NFF8auVUzH17T5mQCg/HlQ=;
 b=Z3iUH5RB0wC2cR5VHSaeyQmQjOTzeC9GxiQ2RFaQj36fwR3k1M9UuH26Je8KQH5bKGiq4YBqSOthhlYElA2jjj8I6rJU4e3WnzK7r0jEu07vtxiQSwKF6+i7B+hwKQ7MeY1n2idjdySJhda8EokOEYdoLWVrxivNX+hp3yiyp10hdiaaF1mOBcWwCTplcc0B/PSlyGS/58ybqbA4CsiHAPEELHSkMR2e75ekFcWIp7Z6n0VA9xI0u7tfH/v+6ZJ7QkkbVSGyLRUjKFWmH3A7YRkTJUaleJeByITI98T2wY6JzwjikMYBXVj+9zPyoYGbvNYbN15AGbW4XPh9UsyaRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ifMTDqhxicc4SKsCICK05NFF8auVUzH17T5mQCg/HlQ=;
 b=ag9JGe+novNW3FBaAkkC1kCGm4PVHQZHKQaS2MIuYKQkv4yt6cdW5bDr/E5RtN+O4C+4c4FnAeBCTV8nX4Q9cei01Mz40YcekXt6Li09tADbPUGJWCP2LDPenhchAT1CRTXhFeYBV+gRYV+27V+1RyXGAGCEb+TMwQXeiybfNr7Brw5UGHI//LxLEVySelWmGxCIxZBs05Apq0fIUv5zFVgydEVGVIdSmH0KSNcFZaDt/I+DtfgdsKllQDL3iRo5P2YAxzuuV8FmvwbwBuGxU+Rmk/Z51Gbsn6HQkORX+aRLfxXgdS+1xzMQQ+fNkS3ps6ina4HRVs14LeGh6qP4JA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV3PR12MB9356.namprd12.prod.outlook.com (2603:10b6:408:20c::21)
 by SJ0PR12MB7475.namprd12.prod.outlook.com (2603:10b6:a03:48d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 19:32:45 +0000
Received: from LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286]) by LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286%5]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 19:32:45 +0000
From: Yury Norov <ynorov@nvidia.com>
To: Matthew Garrett <mjg59@srcf.ucam.org>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org (open list)
Cc: Yury Norov <ynorov@nvidia.com>,
	Yury Norov <yury.norov@gmail.com>
Subject: [PATCH 2/2] platform/x86: dell-laptop: Fix token-based keyboard brightness readback
Date: Fri, 25 Sep 2026 15:32:39 -0400
Message-ID: <20260925193239.248779-3-ynorov@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260925193239.248779-1-ynorov@nvidia.com>
References: <20260925193239.248779-1-ynorov@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0337.namprd13.prod.outlook.com
 (2603:10b6:208:2c6::12) To LV3PR12MB9356.namprd12.prod.outlook.com
 (2603:10b6:408:20c::21)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR12MB9356:EE_|SJ0PR12MB7475:EE_
X-MS-Office365-Filtering-Correlation-Id: a886b361-9345-4ac5-c44f-08df1b3bc60e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|56012099006|10067099003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	hI9gwCEeV6Fz38VcHzrOjqJqLgOqIqXuLWMGpM4VfpRjO9r6dqg4PMZKo823gxo167rcQWHbKoZq3cmCyIK7R2KdYcW3LAQ71WS2N+ITevPPFawjpVY/1KGlqRYw9hhIrqhP1+sTrW6CYzyrbgch3T+E2Qr1zwHpzAblU8RLxeCF1o2hvlM1ZJP1AZc1eU19njcPg6H8xV/YR6EsSKil1hwAaagpcffnaC2+gJV+vbVtI4je2HxtX8O7y3aPp98JBsaWZqu9ejp+oEBUPbwZ2ScDfkxDzNbqTpWZJgWxbT7tl2jhPt7ba/CQ6NgY0Z8w3KiJeKewlctAciDJUgYDIUjRsEa1DhAdGT99XGy55wiOc3KqVtWEQ/ws/W/e9wMpH2b7JpoQAZZ2iFb2iwT0+vVmpz3CJK+iBCcWtMjOIukLmE/41QaMUI/E28/ie43xNXKLF766AGDtjMsg8an8E62dNc6WeJs14vSQXuBmccBSyGaPMJBtx4yhvgRN1f/FlTThYDCu/Fry14l2BbUCGTbZl4NkK3oXR1wNzgTBHJiKdHc1PB1mfRA8lD7nrh3EAIn2oQ6BacrSP3BnEHKhc/laLY2g3f1+S97Y2YzFzRDCE/S4J3W9PR0CuCO7GbzElgTakqafcUlIdOJ1wiWeVBj/eWSEFm9nDJRzKNRuh74=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9356.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9gfhJDcpL1Ha/1LVJ1BtaSEhSriEzJWtMgA3+hpjWLg5FvbSSpnxU0pp0ueu?=
 =?us-ascii?Q?ZmQul80gucm8l4ANt5JOUcdq1L/odFuyJOgIDJGhPTclZTYXJgdQfduo0LxE?=
 =?us-ascii?Q?52VuSuyvPSHoQg6NTnx3R4LOwZDxjHsIEvEeTg0T/GlLS/excyhzjVGDQHbN?=
 =?us-ascii?Q?kKUVC9rV5f3xTJIIak1D9MTeDxaNBJ9hP1c3vnD+SiUHWPSB9X4SE1I6ekXF?=
 =?us-ascii?Q?kLXiQMQSE/UAbq+bDcTxNdGsS6y58OP8KQm4NXFPz1aZlGEoJwbraOEmfkLq?=
 =?us-ascii?Q?yQ9NqR20xhElGT3IyFeMwyfa+kPQzYSTc0BK63qIE96QF3PTWiHPVNDR1Dj3?=
 =?us-ascii?Q?feqpz/E/mB1XylqddWFAs5SlgBHbH/PGjSQXB0zkQ1NL37Ni8NOysBCF/hI/?=
 =?us-ascii?Q?8SFnKTao0e21mKm7lTsimLz6mlzoTcTNzroK0FrDRJcUBp3SSKk+JVcCsVpV?=
 =?us-ascii?Q?/b0goTSvkpqgssptb+Pl1Cqxj1ztGb3BetB7ohzaod4fJoHNe6vVu+NUNytW?=
 =?us-ascii?Q?unhMT2N2YNZ3wgqnsUde/kCVZlfjZekJhsdhfObIyJXml0dzX/3uxfpbFvH+?=
 =?us-ascii?Q?WTLWgA3wJExZ8PEIPPysKNlXtk9SW1YNJkzI3+zR7FqZZpOIQUMf93Om+nSC?=
 =?us-ascii?Q?JFDpSnTxvlCvbCrkrj3PJzjR7hDKCLQ/Gubfc4Yeq4mQLIkFf2VDGO5vqdZW?=
 =?us-ascii?Q?Ta7NwtOvA5rgyODiHzqw+HZ6JIqIAqtaJe7gSk+tlfDeBrkUwQXt7jAArvs6?=
 =?us-ascii?Q?3Z6sw8LnMR/1brETAzyDQ5/TAsRSwHUs8gu2iqfP2RtmdmxJvkAQf3y7cThM?=
 =?us-ascii?Q?Ag+ShAkwkOATkbMAxbgZod64IZrY/VGLdi4aD9qF3Ap6uUGCZJK9o54RwG5H?=
 =?us-ascii?Q?iBF0kjMykOKWqm8RgY0PC9YZTukuWjUgzTaQkdX1wp2YYY+MknafNus4nDpX?=
 =?us-ascii?Q?H2TcEl2/7VMYbfh80zJ38z9awfbS6kE7AeEW9JfFB60SSqj6WYFHnfjDfZY7?=
 =?us-ascii?Q?Qj6vSvgF+H8tTCTYACu4pvt0CwgUJETwRIg+hxAamUsyoOWhnQd8ePXMHbcT?=
 =?us-ascii?Q?rvAG2N78cFBJFTRNSfBXGyLPnYhVE+fySE2te9+mAzA9ZX7o7UfIWxKkl8gq?=
 =?us-ascii?Q?//9OtEyfVBMjkk1ADrWY+aGvRcTJH9DVr1cUqn1YZrqNM2NnbKChn0RZ/mX/?=
 =?us-ascii?Q?TPjP7yoa2VWFN60wMlb1PGsTVrQ2u6crB4ImnpyficXTKkn6cL/lnBFlsg+X?=
 =?us-ascii?Q?9Oqhh0Q4Fe8A+qsVJN+UQOLfS31dV7i19kiyjFdpqkqc21OqLrVZpww+zNK1?=
 =?us-ascii?Q?MMhYc70fjon0Uc396BYs7PDLPcKvoltnHgp8sCgIgmZi7QRcQ3uGqqwAISez?=
 =?us-ascii?Q?iB/VH+DUHRW4vUfHdYQaz3eXwFtyX1YbxMH5hab5CK/hJ79n0uWYkUs2BrQc?=
 =?us-ascii?Q?bq2wzo07ZsU5HlJ2LwzfcrY7wz/vDkbBBwehmgPw2lVugd1/PZZTyD1sRcjo?=
 =?us-ascii?Q?QXqggolwlKUp48V7yN922hLfnaHRy2ClzwgrBumUuKF+Zz21GubHXXA8W5ar?=
 =?us-ascii?Q?cT/cGghngyPV54V4R1ybEsm/qk4zhJyEl+ne1q2fnC73EvOYdFjtnS1g+Vpw?=
 =?us-ascii?Q?d7HhvP/xqd+Gn3gRBhp2Gt0rNcloUVDomKINFPRUMkJ0nTAimJ9yVVgDsfTu?=
 =?us-ascii?Q?cc4vNIREOonceMET7APAgNvvjvczn9VBEmAZGMiswuAu1DY/?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a886b361-9345-4ac5-c44f-08df1b3bc60e
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9356.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 19:32:45.0637
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wj7mpASK/Aj71rmDejl1RBijjcjR/G0dUfbZD+3TtWOGGs9zu76dchjPXVp5G5qSAqmAOwVtP2bBH8jXdf4+7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7475

kbd_get_first_active_token_bit() returns an index into kbd_tokens, while
LED brightness is an ordinal among the supported tokens. These differ
when supported token bits are not consecutive starting at bit 0.

Count the supported token bits below the active token with hweight16()
to recover its zero-based brightness ordinal.

Return zero directly when ret == 0: token bit 0 has no supported tokens
below it, so its brightness ordinal is zero.

Signed-off-by: Yury Norov <ynorov@nvidia.com>
---
 drivers/platform/x86/dell/dell-laptop.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-laptop.c b/drivers/platform/x86/dell/dell-laptop.c
index 03d3bb70b0d1..55fd48222e5e 100644
--- a/drivers/platform/x86/dell/dell-laptop.c
+++ b/drivers/platform/x86/dell/dell-laptop.c
@@ -2003,7 +2003,6 @@ static const struct attribute_group *kbd_led_groups[] = {
 static enum led_brightness kbd_led_level_get(struct led_classdev *led_cdev)
 {
 	int ret;
-	u16 num;
 	struct kbd_state state;
 
 	if (kbd_get_max_level()) {
@@ -2018,13 +2017,10 @@ static enum led_brightness kbd_led_level_get(struct led_classdev *led_cdev)
 
 	if (kbd_get_valid_token_counts()) {
 		ret = kbd_get_first_active_token_bit();
-		if (ret < 0)
-			return 0;
-		for (num = kbd_token_bits; num != 0 && ret > 0; --ret)
-			num &= num - 1; /* clear the first bit set */
-		if (num == 0)
+		if (ret <= 0)
 			return 0;
-		return ffs(num) - 1;
+		/* Brightness is the active token's rank among supported tokens. */
+		return hweight16(kbd_token_bits & GENMASK(ret - 1, 0));
 	}
 
 	pr_warn("Keyboard brightness level control not supported\n");
-- 
2.53.0
