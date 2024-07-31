Received: from AUS01-SY4-obe.outbound.protection.outlook.com (mail-sy4aus01olkn2167.outbound.protection.outlook.com [40.92.62.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 840B41A8BEF
	for <platform-driver-x86@vger.kernel.org>; Wed, 31 Jul 2024 11:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.62.167
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722425755; cv=fail; b=ejhi15KrfWqXe8CYbc74DlsyQHLFYVM8mK0lprehGmtjERCun4EYIJ2bXQ7oC08GLc3N8tqL6lDPlnBZOAyAOva4pcPpUJydnKeUaB/yI4LhWBuNDuAQpbKBUJfNzcQSohvEaRArRfK2bas+4W3PnmYfYGjhAg+Ik0/Ya56bUVc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722425755; c=relaxed/simple;
	bh=mxTg/xkaw7SetaQuyD6xmqTnfV6K9HfZUZH/IY18pZY=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=MBK5+VsLnmYdbq2el5+aSzk4WYCBWCCozuSMQ99dILgDMBm+dRlUBEdZKPxzzNfzMKDDgYQDyKpkx2ooBCxeZLLaqbcyKfM/f+K22FH9A1SOMPzTei4kJ9S7n1lRBRTnqo7/MOVJuuL/V7H0VOga3wDKhKXpqLtzFfsdyPhz9H4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=users.sourceforge.net; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=YzFRmBrf; arc=fail smtp.client-ip=40.92.62.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=users.sourceforge.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="YzFRmBrf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h/a8RvfIODJ4Ed8sLmlzz4KKo2BY+lcTCGVdruMYT9EW/2E3fsZmf49SOb0axfzbxjwJ0vSE74hHQI3rnnNWom7IFgHJqyqtVAMQ2Esy7+hCSB1XnefDth/heeW2YQbEsBgsYnB/v6PNfEDyrgaeThlBQsJwnjUW2xtiTxkU664v0NyGJEwbGQGii3NcjXtXBeRIHL9oclU9VHQJLk1G5SP1wWhNo28Z+jL8QsK/3VeB10l6ZrXyf8Y85begKwUHZmFfJJuuL8UeVUv+OWCuRpOxZef29XBVf2bTmkGpkpQaazy7ldPElh5vlap4d/tNpPgFcmJA0ACIm14rz/6Jug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pRqcx4KxiaqV49YDKs8f1dswIE7zWuDmlUsnzjRRfSE=;
 b=GrdehMxLFHkDJtWhbJhmLPkDrcj76QN0exjJYAhHlXCKsK/EimO0nr4GC6JqyZfHiMeQr+p8Kzz6YQNyBeMK1Ui/9KBxC+U8s4YX3aFdfGiPgrsUDz3rsKONRg4S1r9ld9K+sigKkvHkBcPOhEU55pg3dzTxkpP8QqCFlTVEs66tBllHgbNZ/woqfWGuWMAN7j5BrKfUxq5CqaYFe8PQPZxgATY5yIPjI5PLZWK8uiWmiYqDL+ZUt/QOajXoz9Yc3khuza3JzgsaUH1sFIy3mg5B+qIc7JukajulILUCgXvDJ8SmzPIuyg0pDx3Zc5VmozWDrRhARVK1YOBETNt9YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pRqcx4KxiaqV49YDKs8f1dswIE7zWuDmlUsnzjRRfSE=;
 b=YzFRmBrfXmleEIw/4YKinBHQ6p04L2u+jaYCUjN1ibGBXY4AhhJHTNJ0rNuYaES2MawGu1Y81uYHxFEE0u/T2tPxQTg4OA961/wW4r5bgUnNswwm+sE9n6L+uVvxXoXpnHUi0f5Z19khRw+4m8jB/f/ySz0AvFgXATYjFMvp5LnIRikgEny5y3gcMDm4tY92ogmiKMs6G17MBwvbqs0Nwe+OPY5v0/NYenF6MSy/T7vjMHJwQxw3rZTJyFniaPeHXeK/f87yLBBSNvlpFGnmzSjF9O1OD4UrQ1kqkYxXYn0qgRriopVRqjhZbT/dlHgbrF6VwBTrDBNgdo9HtQ/6Tg==
Received: from ME3P282MB3003.AUSP282.PROD.OUTLOOK.COM (2603:10c6:220:150::12)
 by ME4P282MB0982.AUSP282.PROD.OUTLOOK.COM (2603:10c6:220:c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Wed, 31 Jul
 2024 11:35:49 +0000
Received: from ME3P282MB3003.AUSP282.PROD.OUTLOOK.COM
 ([fe80::a309:11d6:4508:99f8]) by ME3P282MB3003.AUSP282.PROD.OUTLOOK.COM
 ([fe80::a309:11d6:4508:99f8%7]) with mapi id 15.20.7828.021; Wed, 31 Jul 2024
 11:35:49 +0000
From: Joshua Leivenzon <hacker1024@users.sourceforge.net>
To: platform-driver-x86@vger.kernel.org
Cc: Corentin Chary <corentin.chary@gmail.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	Joshua Leivenzon <hacker1024@users.sourceforge.net>
Subject: [PATCH 0/1] platform/x86: asus-wmi: Add lite thermal policy support
Date: Wed, 31 Jul 2024 21:35:06 +1000
Message-ID:
 <ME3P282MB30030C86C5064F1096C147A3A4B12@ME3P282MB3003.AUSP282.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.45.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [iDPy210ZtmTqZVggWivKeQuexhdTvzbC]
X-ClientProxiedBy: SYAPR01CA0016.ausprd01.prod.outlook.com (2603:10c6:1::28)
 To ME3P282MB3003.AUSP282.PROD.OUTLOOK.COM (2603:10c6:220:150::12)
X-Microsoft-Original-Message-ID:
 <20240731113507.178929-1-hacker1024@users.sourceforge.net>
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
X-MS-Office365-Filtering-Correlation-Id: 2f2902a9-6808-4ad4-af1f-08dcb154ecdd
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799006|5072599009|19110799003|461199028|3412199025|440099028|1710799026;
X-Microsoft-Antispam-Message-Info:
	c9rSWrELSe5zwSlXImOMfrQNjY+QOwL26I2gqCxayfcH4xoTOgotPrn+SH1fUJHPGxrCliHDEF9fnP6/DyytIGfNFiXr7WBSe0jwcSmV0+kf76v2IwfuM0WaoL86XLd2CPtgrzCw3gy3DTiotSxKkCB99XdROI6iYhjtdTbh/XDPXwD6M+gN1GBe2sOYzJWkX8F1l8SHwSW7g19z5rzD3UTHvaMRDqkXIM9ENoyP0TCJs3ZcqKvio2OaxO5DGZeFQFmDJTVmsMMQo+em100FEDC1hjNNLKRn/PoSloIe7a7y+Rah128pRph1wGDcnOUwab9L/lLAtqKkigcTcvNpv9DhDMOgORQuodi8MhCKiEZFP0bT/ccrVcdxMv4QiWT8EpMrLX+SyGbWZ761dJ6jPp5iz/616/wqy2EFx4q6qAYRyeFB8IUzCP2TOcX39AWnGe0Q8fwYTWsIHQmog96SczdMxU1qZtji53V6/1XcyKUEJMF+ykPJ/xtGYW6KMRASKKqcgOXN0POs/+XKqsvPuwSkMAKLVoIFR+gKB2fSKnZUtk4ch6/croq7rHwzI5S+Xp6UmzZJaO+aEyu0cNffY5VDaBimFOpa2IYBQhw70i8o/PsttJrHBet965EfHLYbnvd2qyXi8W1xP53XDnkWLrUHhENwd0Ko9dni5Clrpiy21cTvVmldidl0USC0jTp13WnASGZQMkOAavf+zbTpSQ==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Qs8RjorYfkZvxMZ9BJ/6sw5z/USHBjBCQPyYDwOnKukDrPxgTzvAuaeLMnu4?=
 =?us-ascii?Q?vRdrLxH4XXe/ZPkhJGmZZbnMb8+jW/f03ZQ0MyIOZcxPXiuCrXZGhB3Kx4h1?=
 =?us-ascii?Q?pdFvjCT3HJF+BUXI2jLtfpARaQDn9DM9P5ENhmyth6ShplJ8mGb/8S58b4S1?=
 =?us-ascii?Q?uZwAPxmVzezJA4dVuy3t7gVSwWt/TGtLusPlCyOPg+2RhjesCZ2zV38e+SU+?=
 =?us-ascii?Q?/vlxiz7Wey5eAABa49W8l4iWxgqZ7EFdicukpXyOqkOASD7d1g1/f/pnY0QE?=
 =?us-ascii?Q?WIDBTsSeH3CAYG4almyXUPbV+sAWYtXQW1eRxD47pXhMCTZ++o+udmRH4VAg?=
 =?us-ascii?Q?HOM0tq+LCYdRQeA01EcbZyJciK1iW8bM2y1BBFBbXo/q+/sNGLi6hHlUn5o5?=
 =?us-ascii?Q?3kbla2G8uaNgPq/APJCb3+BV7/aaY7DUKM2n5FhIQtXwxk5vJ/FJF8yvsbsI?=
 =?us-ascii?Q?ns3eWKViwenOZO/VGr0Qq2d6n5pv+xk64TyIxZcDcUQdyaur8yfCv0NoQfR6?=
 =?us-ascii?Q?tvYPDq4S0Y4XF175JTumWzJQFvKgahuTs4VIhB9vwtxycMHccsUxgjwBMajE?=
 =?us-ascii?Q?ABRPejvWOrGdxsuiXu8rCMq7/fhjQ2hIP5+/fdUEFeCP60tD+3UuC8Kej/Zv?=
 =?us-ascii?Q?FnYdo+2gGO/WUYdwlKCGXfvsh1NfgF6c16mACHokJLLgJEWB+ya5RFFJFjOp?=
 =?us-ascii?Q?rBvkUkcCVCmm2aUTIMvCKbmf7UD84q4ce5t+U1Q96AdkeI1xHMQU2vVECFv9?=
 =?us-ascii?Q?srA1ueiE5P/fmc2GBCsjX3lfx4GvSCKXLlWe7VOHVb+tnc/2z1oNWu4ZPQdn?=
 =?us-ascii?Q?lTLECXJ7KccMi8wq5e32j9Cm5bLi+wg0u4UvWjfeORczjiVoL1p02Ha/K1zF?=
 =?us-ascii?Q?90lfCV2zsp3pb1oRK1b4tVFy8IoXgm2MI07sAlCGtPSMmRsL/J6UDOCAA9xn?=
 =?us-ascii?Q?SvRoga+AinT0OfeKVRnVZqd5NGDW1j7jpQnaY00/xa44iKdyYdhhZXuspyNL?=
 =?us-ascii?Q?HGLP9j1JFN72wBZmLMrhunFoX4pBo1qwe/xRFFgbOGBsS1Gt34TaHHLE3afD?=
 =?us-ascii?Q?eAsGFEZazQTsXoLuTVdPE2DNaizeleAVBz07S0QjHRj2H/SUTJtHWeV90+XU?=
 =?us-ascii?Q?zl7XeboA8Yf46Qqxl5gpRcZ4orWcPR2iXwC/oJycIFrjE5t0QgJjix2t6hMc?=
 =?us-ascii?Q?4Q/Lx1bWLfGf+PKUGFa5/Qya+n2lzASdIUg06UpC3s+wTtXDyOEE8J7ZcwSl?=
 =?us-ascii?Q?hHGKCF4t5M4vZy3HWdtp?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f2902a9-6808-4ad4-af1f-08dcb154ecdd
X-MS-Exchange-CrossTenant-AuthSource: ME3P282MB3003.AUSP282.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 11:35:49.0959
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ME4P282MB0982

Hi all,

I have implemented thermal policy support for the Zenbook Duo 2024 (UX8406) in
the asus-wmi driver. Some other models have been reported to use this method as
well.

In short, these devices are handled in a very similar manner to the already
supported devices. All that changes is the WMI device ID, as well as
(annoyingly) the integer values used to represent each mode.

There may be a cleverer way to implement the branching logic I have added - I
am of course very open to suggestions.

This is my very first kernel contribution, so I apologise if I have done
anything incorrectly!

Joshua Leivenzon (1):
  platform/x86: asus-wmi: Add lite thermal policy support

 drivers/platform/x86/asus-wmi.c            | 102 +++++++++++++++------
 include/linux/platform_data/x86/asus-wmi.h |   1 +
 2 files changed, 76 insertions(+), 27 deletions(-)

-- 
2.45.2

