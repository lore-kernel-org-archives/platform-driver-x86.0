Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7AC3C433DB
	for <platform-driver-x86@archiver.kernel.org>; Wed, 30 Dec 2020 08:12:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A806A21919
	for <platform-driver-x86@archiver.kernel.org>; Wed, 30 Dec 2020 08:12:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726214AbgL3IMG (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 30 Dec 2020 03:12:06 -0500
Received: from mail-dm6nam10on2073.outbound.protection.outlook.com ([40.107.93.73]:4724
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726168AbgL3IMG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 30 Dec 2020 03:12:06 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BIAiCLYFjpmKJOR75uzyiT7om1sXXDB/t2sZJMTcSFlU3hh26BHz9kt2ngFdWiSlrbt2GxJ3f6IQnjPB/ap5/IOEl8agFA3LUWfHwK2kiO8cYK0oKGf1mVH9cGG1So1pvsTk2LXpOrLjafowwroS/ssCnQq86vcUuGG5Z8c5t6PYK94Szo7+RvZTL0htpoA469jCnNQ2YTrRwcMaT7S48uBqiM6v/QrfGmF4l1PHabzKFMUXNcsikMp9JWQUXPn0OtdRhpt0SmLSE5WKcMZ3y6OhoIwuyDO2j+Af5DGjm1uptdpqx08KQKKhoIG6ezJKemYsEyql5QVVVkr0jTysnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N4JwJslN/umKP43CK3LLnBtp8u+Omt/oIvfagSst9fw=;
 b=C2MlqsLDMWItqMW/iC+m2k9mgeN1yl9G1ao/UXMF4nGlLNMk9JpDtpfmS29yVe61VJ/t91M8z60PymfcSjGVlsCJBljxDEvX1yoaxGA1MFR7k98jyKkjRtpOuizVQ93MOKoDifgwYUdx6roub2z+eJQI3em4BHSu7vnCsHIOAMSIHu7jPLhEHITmYyKZKXF060AiorFm9eXSaz1B7J/1Q9EU/tDFXMhzpiO9uJj3T//wYK/PcZlGfeT1XedZr0V0GFPyA7Haklz4V6W2TNnq2v7eaVpRvuAKhcWjGMF50H/CleR8tgWMqC+n+t2Duz5qxmcBK1KRZNYcAtbB6R94Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N4JwJslN/umKP43CK3LLnBtp8u+Omt/oIvfagSst9fw=;
 b=Pgy58HODRQweamcj+UrS2zzZp/19Xo8GJn80LGyJHLp68XAFiQddn0OtZ6DWWkUMRlUaS+weps3cEfUPrdtxdgUI4TnnsTsGrjw9oyRY9W8k1jM7lByB5KE4U8AYWo7DpqshFsdMI/5CTC8N3n684tJCnaEQ+QGCxo76QUJxY0g=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from SN1PR12MB2495.namprd12.prod.outlook.com (2603:10b6:802:32::17)
 by SA0PR12MB4448.namprd12.prod.outlook.com (2603:10b6:806:94::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.20; Wed, 30 Dec
 2020 08:11:12 +0000
Received: from SN1PR12MB2495.namprd12.prod.outlook.com
 ([fe80::319c:4e6a:99f1:e451]) by SN1PR12MB2495.namprd12.prod.outlook.com
 ([fe80::319c:4e6a:99f1:e451%3]) with mapi id 15.20.3721.020; Wed, 30 Dec 2020
 08:11:12 +0000
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     hdegoede@redhat.com, mgross@linux.intel.com
Cc:     andy.shevchenko@gmail.com, platform-driver-x86@vger.kernel.org,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] platform/x86: amd-pmc: Fix build issue for make ARCH=i386
Date:   Wed, 30 Dec 2020 13:40:28 +0530
Message-Id: <20201230081028.2615217-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [165.204.156.251]
X-ClientProxiedBy: MAXPR0101CA0052.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:e::14) To SN1PR12MB2495.namprd12.prod.outlook.com
 (2603:10b6:802:32::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jatayu.amd.com (165.204.156.251) by MAXPR0101CA0052.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:e::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.20 via Frontend Transport; Wed, 30 Dec 2020 08:11:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c0f7109d-1ffe-4fde-2d9a-08d8ac9a78df
X-MS-TrafficTypeDiagnostic: SA0PR12MB4448:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB44483695A69CD43C1155AD009AD70@SA0PR12MB4448.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:381;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OOIIS8w0UOR1JsEusFWkvd1UylGmFY1kJ0q7DhSqMJfE58oSLw5MR1ABf8RMEB5LQP9wTN+oioNHPY/xwPHW8tIeX4/LWmjnWTofXviC7WWJgdZuGk+wHDLxn7u8kcgIRi3tNGrRJrA4XkhPzEYBdNVwFj1kaVslFSUpmysBqJNE8glEDvNFOr4JeW+VNk3wQyFz+Tz2xSEOPIdbbLHdVsaDWLmO8YGI00YpMxglFU4iHvi4qAOPZwP3WOD9iquDWooA+pFym2RO4F66pIEYuwzSnaKeu7MCYc9beFqusGd8QHJ3pzF8cPEBPoPHkan+2Iq+RDp/zHngh5SkrrudvDy2b3DrOM9EYo3+2DbnxfN9Vl9gj30oLkgrgoq6/Lj2D3szHzaAkqKsAi+ta2GMCA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN1PR12MB2495.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(346002)(396003)(136003)(366004)(26005)(478600001)(1076003)(16526019)(186003)(6666004)(2616005)(83380400001)(36756003)(7696005)(52116002)(956004)(8676002)(6486002)(2906002)(86362001)(4744005)(54906003)(8936002)(5660300002)(66946007)(66476007)(4326008)(316002)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?VIMy52qommzdQJ4wRRO2dW2BDTCyQbF4PLk4UVZEoKaxhfkHHL3B1c4wuFKz?=
 =?us-ascii?Q?9C57Foe8A2h6uvkqDAxSgChxbtqjSxkAoswz32p4SDUTDwz8NzYADstJmZWS?=
 =?us-ascii?Q?CDgciP+RTZhBleFcalaNDur4qlzWEhA6q6FwSo34KT7bULxy51RYu9P44d2s?=
 =?us-ascii?Q?bxENlSLjhVavWMnR/2P3CeNyOv/y7JvgJerOQlh+gAi1Iz0Nf0n5HEjXTa2V?=
 =?us-ascii?Q?zTcgHZVON+1XrXwwzKWn9kK/CRMICWJ1iY0F3v3fmquZ0uxRk4bmypg803PR?=
 =?us-ascii?Q?0bNOzJOW/Qy8vnbNgoAs7cKJGWO9sBhcoSY9DHw24aWmNcJKtBew7nkwyjdY?=
 =?us-ascii?Q?+lrS28/JKVvb8tWNKauXDBEXm7PZBMU145hVhA349ufAxFhpfFQBK/X15MLw?=
 =?us-ascii?Q?f3w9QUdsUJHxYD+9QwQbd7WXuGZw9Lax38LiXxw0GmNdp//B1hH5eVWUnzfe?=
 =?us-ascii?Q?urAD3goTVF44oQdhhMCf0oMh0RcMlnIoLxAz/VIUOs39A5iTN3MKnqoF1xK6?=
 =?us-ascii?Q?t4dwjQAISox5TdF+xdn/B2vC/d5kRmg7P2BLfzgiHcOd5k2a+aAuvxYiXdN2?=
 =?us-ascii?Q?szKyJOxgYzjVaV43Bn75Xaj6MezFeQIxPbROacXW+fDldKVQ33kiZFF1EMCV?=
 =?us-ascii?Q?RMQWn3dumUcseSHnUjLInEwBtskY38t3wu5br28YxYvk8q0Ofinsq0ND0Vtp?=
 =?us-ascii?Q?S4Ke9ci6xURBV+V/IJIv4d3dL8d+Kz5cSa4Y9icw5GWcbYTrdvztpE/srRhZ?=
 =?us-ascii?Q?eK4AMgdcXF6UFN9E1olpkPy2TrOaiOOUfpk+cenrL6KVbbZh4WE4sTzRrFjN?=
 =?us-ascii?Q?gOtpdNWnoeP4dTKPVEKkaMsNbuxClsaMX4IT1nWZcYOEpYX+NO0pMjNC9rV3?=
 =?us-ascii?Q?YGL+C2zIfP4g5cu35T8iq3HzZhG/rjX6yYwR7RE/OQbouQ5fYT+qTstG8XL8?=
 =?us-ascii?Q?CyzlUEri7g2tFFFIgvcTw5BCcHn75dK1VSxOA5GAjYsOIbtcSDncCfvg/lZJ?=
 =?us-ascii?Q?Fpp4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: SN1PR12MB2495.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2020 08:11:12.4269
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: c0f7109d-1ffe-4fde-2d9a-08d8ac9a78df
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kgZfDixAN3pXyYijL0SVcqdIBIrCJ91SEZGFEdFLnO9Kv5D+OznvGrUNJMwMzkX/LDY3PCnTSWNdE6/4aEzA/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4448
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

lkp reported that CONFIG_DEBUG_FS was not defined because of wrong usage
if macro, correcting it now.

Fixes: 156ec4731cb2 ("platform/x86: amd-pmc: Add AMD platform support for S2Idle")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd-pmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
index 0102bf1c7916..ef8342572463 100644
--- a/drivers/platform/x86/amd-pmc.c
+++ b/drivers/platform/x86/amd-pmc.c
@@ -85,7 +85,7 @@ static inline void amd_pmc_reg_write(struct amd_pmc_dev *dev, int reg_offset, u3
 	iowrite32(val, dev->regbase + reg_offset);
 }
 
-#if CONFIG_DEBUG_FS
+#ifdef CONFIG_DEBUG_FS
 static int smu_fw_info_show(struct seq_file *s, void *unused)
 {
 	struct amd_pmc_dev *dev = s->private;
-- 
2.25.1

