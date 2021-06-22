Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3390EC2B9F4
	for <platform-driver-x86@archiver.kernel.org>; Tue, 22 Jun 2021 17:55:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1104E60E08
	for <platform-driver-x86@archiver.kernel.org>; Tue, 22 Jun 2021 17:55:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230146AbhFVR54 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 22 Jun 2021 13:57:56 -0400
Received: from mail-bn8nam12on2043.outbound.protection.outlook.com ([40.107.237.43]:7456
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229501AbhFVR54 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 22 Jun 2021 13:57:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oNpXVuMVMoNRn+lLL1DMTw+071P0LAU/HgLyY1TlCgtqWSXVIkRaoaF1B/IurBnyYX/8vbJcG93p6s2b2ERCNE9TizyIl15LDrYBqnwxgxhVLFnbKgO6oG6SK7bxRrYFzefGfsviJTaTQx358GqDhm+MRpLkcKsAvhJz/66MKmowzqiGUZSnvpbeAC9GSqiKru3goSb9U6R1w82cmAeikzQVMEvi+3JlL2FBQWFffjVv3yQoBB9qzXVIQp1QECBCBbGMrYxX4ckhC7C15/LjHXIXB3oLkuQhCdi8ojgIT250SJxHpm7mmlnab4Zf4pOjHEb59bynsFd1FHec776QIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A9WPRFK/8DadEmOje/9Px2ZUf4ydymz6T8Dkdoh3uzk=;
 b=ez1NZ4UwDmNL8vL/r4Zf0D59ydJzEAVKKeIMg/Q5g09wYBoEPecWc0iflwAtDlrUMd68s2ehVXmrfhqdKs6RywNKCJ4THkQgLxVbczbNY/eOIkBUg8mFdwZwT2G4qxjrL9HyaIPlDCd22NTQGvLXySTPcM2JgEBFybb9WuUhQOpL0GEvGJJcZK4cnuMG0unQfDr/Qj77CeeRiyfcy7+P03NTSNFNeG93AaliyP0p8O6T3huS7swfQfL4vHbKm4sxStyw9t/JypxBEV/ImTw1fSnSSCCCj//x2o513UNdyuCcGX4nLq6kEv1+8heam86BZ/3kUgEik0uOHN9XBT9b7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A9WPRFK/8DadEmOje/9Px2ZUf4ydymz6T8Dkdoh3uzk=;
 b=5BGoVrLC31FXtGy2Bg1xPuHbD9+cMroIdSOQktz8r/DRWsqItW4vriYmwiCdVRMb2khRLbwNkYBREZ19DxwWTy/Mop/uR/sS0LaUIKcpwhtAajcOTZyoR3ZhwyfWGh4k3GdoTTxrEYDPCBoZRgRbxWvwp2ENJElyGwi3S2vPdFM=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4510.namprd12.prod.outlook.com (2603:10b6:806:94::8)
 by SN6PR12MB2717.namprd12.prod.outlook.com (2603:10b6:805:68::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.16; Tue, 22 Jun
 2021 17:55:38 +0000
Received: from SA0PR12MB4510.namprd12.prod.outlook.com
 ([fe80::9c16:2794:cd04:2be0]) by SA0PR12MB4510.namprd12.prod.outlook.com
 ([fe80::9c16:2794:cd04:2be0%6]) with mapi id 15.20.4242.023; Tue, 22 Jun 2021
 17:55:38 +0000
From:   Mario Limonciello <mario.limonciello@amd.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org (open list:X86 PLATFORM DRIVERS),
        markpearson@lenovo.com
Cc:     Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH] platform/x86: think-lmi: Fix issues with duplicate attributes
Date:   Tue, 22 Jun 2021 12:55:16 -0500
Message-Id: <20210622175516.10100-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [76.251.167.31]
X-ClientProxiedBy: SA0PR11CA0039.namprd11.prod.outlook.com
 (2603:10b6:806:d0::14) To SA0PR12MB4510.namprd12.prod.outlook.com
 (2603:10b6:806:94::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from AUS-LX-MLIMONCI.amd.com (76.251.167.31) by SA0PR11CA0039.namprd11.prod.outlook.com (2603:10b6:806:d0::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18 via Frontend Transport; Tue, 22 Jun 2021 17:55:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 939cda59-8aff-4572-f107-08d935a6f17b
X-MS-TrafficTypeDiagnostic: SN6PR12MB2717:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB271764DBD8A0F0E6806E8244E2099@SN6PR12MB2717.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bBrqSTwVakYz72fdk5/2TXM5udyxAfUxp4tJw/yYl052fYXl+6qwM8c1JwWiJUNZ/LfIXzjZChgCG8K3+5u8wdnL9bLv2cwZZt534pRTEj30tFYPIypp6kv6aIVilisLk9DiY6+bp4TwMAKxh7GiLo8yRChuPY/lMGAkINh5gze2mSc7dY+eZuXDJzSHseOZDpFUx4XUrQgl7chZXlg5leLfAkiL/wihvIOz/OHzsjV5i+L6tXKuLnj0k204X1rJTewir6PVJFvHMvf4VY/YrI3MWIrHrAtZ9s9s+9MErmdEj4+s3Bz/vis5bh/QYHYfFNHCDWiyXzKi8vEwt0CQdAuB1jggsUNNhy1+/wgaSfWaVyGahJB6E91iP5ZoV9zr8Fs01hHhHtGQ4QmLKjRWI38QKR85SsLmOcbbPcSSjTrvBlq+DZs2kKOdh0+iIIBmeLdEJuxBdfFgeY/KL70+eQrKJeBREQKHQTmPTZbBw3Z16ONbt5poAPNt/n33bLNgxAwPpSF2qgyxvzbZlalLBwuS3u4dS/5aqrDtQkhbeLAaHcTGWJc5ltenFFdkHaimjm9fY1EFT9YmHfvluPa0BDRRVpG3ja3QdHHUhYkg/VIq/FjOxZ6BAfWpgwiZtlr4MsYG4ePZnKhg5xctalt9qw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4510.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(396003)(346002)(136003)(39860400002)(2616005)(956004)(2906002)(1076003)(4326008)(478600001)(316002)(86362001)(38350700002)(38100700002)(36756003)(44832011)(6666004)(8936002)(66476007)(66946007)(5660300002)(66556008)(8676002)(16526019)(186003)(26005)(6486002)(7696005)(110136005)(83380400001)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ouVzLQ+8QkymiKIieWH6AFLD0R7PoTH0JoNDPcGf2aWP1fKWFN8rArs41kmf?=
 =?us-ascii?Q?+7bS2vxzs2BhNy7cBsPxOi06b+7B8wTfskH8uM/xIb7iU7hAEpWaJWM6KbDJ?=
 =?us-ascii?Q?02l17936+pg2aEIZ2XkFsON4NbRSNj+JIAck4u6wxWNuJ7kLhqP5O8cjQapy?=
 =?us-ascii?Q?rhfsv5hjFvYAafagqTjylMokj3rJkg1ZqbAxXiwqVGI1o8lSid6pYXAXDOOt?=
 =?us-ascii?Q?YfFrdJDNXzw9GGnB2fdmSRpnLRfk8uaBzxHpQd6uRgz/46/Qf430ktWcv08O?=
 =?us-ascii?Q?g4Vtx4T274hW0anqFcIrg3U7wNQKWkAlAIYWLABSVWtuSGkDbE3uS6q2IwF6?=
 =?us-ascii?Q?RKLzjEPvUrkDClMvQmVOlVYuVeGDWHGmklsIoVvYn+b6+vpBetU9S5RHfYil?=
 =?us-ascii?Q?u8wt1CbstAiEUhbghUi5WQAw/jfPm/JXGMXHULY/88oGmIAUjuCQhZOYWi3O?=
 =?us-ascii?Q?9seADr49GMcmOt1mBVeiXjZZglGx9dsVM8w8CXIO4656DYbOhye7YO6Dx+Md?=
 =?us-ascii?Q?P1B6prkdSSmnJy0GSLxctfStNh+GbW+CdC7VV2XneHnZ4A1OZBZfkgU+Y9fz?=
 =?us-ascii?Q?aiyTcOn5ECmaZlgcUVZ7CDT/wRbZJIBXpduLBXJ0IcB93trwZA8AoOikwTDs?=
 =?us-ascii?Q?x/+FjUkAu0hqKf1pCxSNnh1YtgBIZUI47L0DFDc6VT8vXWCmyO4wtVLgwoO6?=
 =?us-ascii?Q?poNfcMaG2uCeV10E39adzHnPUMgewMYSXPaofO0swEkLedEvh+QJ4XQGOgB9?=
 =?us-ascii?Q?YZuAa+FxwYt3swwYS+9C0dQh4v3sVCYxRAkjexdbRl5jVm96tp1BLb38nOpc?=
 =?us-ascii?Q?Vxs3OpZoPLu+hyhjvw2An4lmWQWCntt9UJ+Cb4wW2GOVpA/Oc2zpEmVo4QYN?=
 =?us-ascii?Q?hFQil8APXT+35/nJ8Q8xl/elCg/fZRPT3cVVcPNm1jIods4qJCH9Zsi8gFZs?=
 =?us-ascii?Q?7BIXv1Vgtojwlz2GPiAZLuhSvoSO+PZCXcT2X00SZ+wBkMjc27gZYLuuj7jJ?=
 =?us-ascii?Q?sWDqPpdZ2jZIa89GEN0SbCyUXyifpVBBcwIClV25bAPej23LUZOqK3YMjj+3?=
 =?us-ascii?Q?gOlLIM0w2dtjJBtAbVAIs7/vaTf7aoN8Dw2YO5odnvP/GOkOnoveTWRERwyI?=
 =?us-ascii?Q?dNPQh/NJe6f0aJ135z59MIbYNcPWLOrrnEWXYwhaOT7Kz/vK1u0cO6b8glu4?=
 =?us-ascii?Q?Y+rolSYz/vgEfscYnMXw2k9/WcBfOBQBQv/fVHbxNb1J2YEXxByLFV6IhLm2?=
 =?us-ascii?Q?I7UHGkAhuiitks3UOTyOe6jrEJyCpVH0wyos5Q7rY/aL/HYPlez0r1QNDHIU?=
 =?us-ascii?Q?f1sDSj6qWNWs3RKpwEFn889/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 939cda59-8aff-4572-f107-08d935a6f17b
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4510.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2021 17:55:38.3344
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AMyX4f/8M0S5Trt5ax6YLDf6cxzIKyVIa4VNOE4Iyqap4Xl3uEK7mi3OOdV0a3NQ+KuMCtwKq0D8Xv9Lc1v6IQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2717
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On an AMD based Lenovo T14, I find that the module doesn't work at
all, and instead has a traceback with messages like:

```
sysfs: cannot create duplicate filename '/devices/virtual/firmware-attributes/thinklmi/attributes/Reserved'
```

Check for duplicates before adding any attributes.

Fixes: a40cd7ef22fb ("platform/x86: think-lmi: Add WMI interface support on Lenovo platforms")
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/platform/x86/think-lmi.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
index d2644230b91f..b029d4a5bc3c 100644
--- a/drivers/platform/x86/think-lmi.c
+++ b/drivers/platform/x86/think-lmi.c
@@ -691,6 +691,13 @@ static int tlmi_sysfs_init(void)
 		if (!tlmi_priv.setting[i])
 			continue;
 
+		/* check for duplicate */
+		if (kset_find_obj(tlmi_priv.attribute_kset, tlmi_priv.setting[i]->display_name)) {
+			pr_debug("duplicate attribute name found - %s\n",
+				tlmi_priv.setting[i]->display_name);
+			continue;
+		}
+
 		/* Build attribute */
 		tlmi_priv.setting[i]->kobj.kset = tlmi_priv.attribute_kset;
 		ret = kobject_init_and_add(&tlmi_priv.setting[i]->kobj, &tlmi_attr_setting_ktype,
-- 
2.25.1

