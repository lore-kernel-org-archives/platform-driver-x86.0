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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 022E4C2B9F4
	for <platform-driver-x86@archiver.kernel.org>; Tue, 22 Jun 2021 18:26:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D1AFD60249
	for <platform-driver-x86@archiver.kernel.org>; Tue, 22 Jun 2021 18:26:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232049AbhFVS2g (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 22 Jun 2021 14:28:36 -0400
Received: from mail-mw2nam10on2078.outbound.protection.outlook.com ([40.107.94.78]:6017
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230338AbhFVS2a (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 22 Jun 2021 14:28:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X49ZZslBgL1nnyNq0NUL41dNuhvt1IoucBWB/dUI0a2SZLjGLa3j7x/uIq91FQ9EBxVnKld6rIG5vphz5I3G3sz6GjpHBdt0eT3xWrSK2/rvh1y4lCSYXkvRcgN0Sc4BQNXO/kqTm+LYkgFk7nkuVHG1MTpEop22ulGgLI5QSKCCsc6sJfCExCTwogHgsNBUrmE8muPfePleDG6LV3BnrmKmJH6CoYg23xRezt+rx/NG9hlHsP/904zqeljvetC2kgwY9v1zcBp3LKk0j251wRiTSHWERctZOhNCdkxkhIt25aIGhBQzcBAgoIxXIcBK948BqQ9oijj0mQAPSegwcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cG8kpmGeQ20gWyC8F6TTNnS9WxAn3Sk20/Ds9Kle9ek=;
 b=CMOhcxbHQJhHfxY0fVumdlzgy9bzfmO4gcFT2n2lFKAHDoJ4ry6YAZ17F6Neq80gxebGk3qNzhuZmDc//Kmsjl3ueuw0cOlxZoc/x5rzg/rSoI/guyTx4cPB++A+Lx+Y8RCqjKMGEaHSC7iEXJNS7rMHaam8cvA0eQjjGZ6h3+uvlbtwtWb2xtHoO6lwimh/tedG3j2gGvFvzHQhdfoEvD2RaPw26bw2o0g2PmNitiHcpZ6atSy/YQE9z0IMwHlIO5uhb9uvF4fDMoingzmkcmHSdPYWHe6/6NolA0MzWqeyvat3UIa3kTChYgCUEqb77CPPmivoL4MJWl8xTdwoFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cG8kpmGeQ20gWyC8F6TTNnS9WxAn3Sk20/Ds9Kle9ek=;
 b=AfALPMzy9cfjhkrfCSi70OOgWWZiXNO4f6FvICg+8Rpx3NJDshN+oLZ9o5WL71FPzSSRcSRIQErKtN+xADdjdD97sdRzvI/sTv8RHviZnzama63Jy6dmu0WUm7dpq8RzDkC2f1nJS0NAl3LsIcnKuLbI5oBAffBMTstExAuCaeg=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4510.namprd12.prod.outlook.com (2603:10b6:806:94::8)
 by SN6PR12MB4670.namprd12.prod.outlook.com (2603:10b6:805:11::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.18; Tue, 22 Jun
 2021 18:26:13 +0000
Received: from SA0PR12MB4510.namprd12.prod.outlook.com
 ([fe80::9c16:2794:cd04:2be0]) by SA0PR12MB4510.namprd12.prod.outlook.com
 ([fe80::9c16:2794:cd04:2be0%6]) with mapi id 15.20.4242.023; Tue, 22 Jun 2021
 18:26:13 +0000
From:   Mario Limonciello <mario.limonciello@amd.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org (open list:X86 PLATFORM DRIVERS),
        markpearson@lenovo.com
Cc:     Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH] platform/x86: think-lmi: Split current_value to reflect only the value
Date:   Tue, 22 Jun 2021 13:26:13 -0500
Message-Id: <20210622182613.1657-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [76.251.167.31]
X-ClientProxiedBy: SN7PR04CA0114.namprd04.prod.outlook.com
 (2603:10b6:806:122::29) To SA0PR12MB4510.namprd12.prod.outlook.com
 (2603:10b6:806:94::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from AUS-LX-MLIMONCI.amd.com (76.251.167.31) by SN7PR04CA0114.namprd04.prod.outlook.com (2603:10b6:806:122::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21 via Frontend Transport; Tue, 22 Jun 2021 18:26:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 64a67dcc-ac7d-492d-7cca-08d935ab372a
X-MS-TrafficTypeDiagnostic: SN6PR12MB4670:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB4670C10019E64199B0855B83E2099@SN6PR12MB4670.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1122;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ynho/fLARKkQGdVPt1QBLHmBlSo0tzYi09yo0B61CxXMJxul80asINHMO9EPc1sHmjDq21Gw2o7HaGFuPBs7X/bPnMYuQx5kfa13/7B2l9yGAGU7GpO1MGmkUGeetiXQcVMMg4y1aqJuMSKfbiFZU6aEN/Sfmr96xe3W8NYyQiyWcE1o3tUcocUMgRLyE2LlQfGALhBDNuVoofbtKxl4bJqe0QhzKERjuyAAa8iJEdU2waELNC4fWCd2JpdQtVPFVujK/xn5/OYN2DLo2cO3y32+FoNLdxMxFiMTaeEWmrmBACWE9vg/IC3OrHBshHQq6q08kOB5x0y2Dr6/rW89qR03XUJNl0c1sSG2L/S5X/I4xy4CXEbyQ9gIDFoOffRi1Guhps2xwkqhlC5uxADDoIzIN+jzNZmPPKbRYRLS7L/KjtR0zA2lXxP2hvmZSlOXRrl34nhO81gO2txUOLNfOMn9nu/Up0ILrD0CoW7kVSzMFsU6GwOCkZNQXboqF/hesvDoIXL29qEvROAs7q2CoEg0QfppgSA5anmFZYyhyrMU4pGnrXYKdz7lESYwStTpG6aPy7WTGpDGQQgq5ZxITU6/uwc5jaorl3JFIg7a8SHQtZJW8gvtOGlKfBrb4pnB+Oh7nLrmRci367otDorKTl/G3XHgxfFgY7taj3vFrlyzHOmM9gsRX/uOyEwNLbuNKu9B702dW9ocNWDsOeVM7Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4510.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(346002)(396003)(39860400002)(136003)(66476007)(66556008)(38350700002)(38100700002)(110136005)(316002)(186003)(5660300002)(6486002)(2906002)(66946007)(36756003)(16526019)(478600001)(956004)(52116002)(7696005)(2616005)(44832011)(26005)(1076003)(8936002)(4326008)(8676002)(86362001)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1QCm+3fSZL3i/PxQlJXBN9ponuNXcze4l+nXwdDQp3evwjySc7ftxli0tb7T?=
 =?us-ascii?Q?zTgwYiGbuAGlbs8/FZzes21Q6FOkCR97YMiLY0eZ+oxNnUy2npAluf9dooj7?=
 =?us-ascii?Q?TBpU8uNgAIzzu7NikruG062v82k4/CXRvsRgHlBH43Wbr/qP8Tuh/sONSFlt?=
 =?us-ascii?Q?/qEiZJ2NSgPpoxwE67l7baNbQFpJLh3I+yD9F4GNiDitw0WnL/YUJibaVp/b?=
 =?us-ascii?Q?nugYPZgt9qhtk9VYUBtaH+TzDdOPJWBbMT8Ze3Y6FvhULoP6I/r8CMGsLK0b?=
 =?us-ascii?Q?xgvRf42FqJTk4tDmn9ojLlNZALKB7zi67WbdW5cXUka5j10yKSWbP8Wl/tyA?=
 =?us-ascii?Q?5iU/A+ebSTDrxiNQoVayeE4FSx9/fUhwRQPA+eZgY2z4W82jqxMVrvccL2PV?=
 =?us-ascii?Q?UTpXGBIV6L0wYmaWEJ3YY+/ig+hWPju7R2yeYNuM/GkwMsOqmdoZC2iU2dtP?=
 =?us-ascii?Q?NIM/00LAxFKveX1SW3fhTXaRvnNTMRhYCNFBlG8hBl4UsFW4wz3ZT7hw7o5R?=
 =?us-ascii?Q?Jrrx122EpK/FJpInoI+eqPXs3j3IKSKvLkl0gQNZt64dd7bN2XsZpIH30pN2?=
 =?us-ascii?Q?2JhEM+8RKZ2n3lPgscyy/O958pEy5ccuGR/hCoIn2KULEcC/dYhWtAe2hv6E?=
 =?us-ascii?Q?EDNTp2WZhDBhzYfniWrK/52i2IJpuBZLZeQHAbIHqRInp9Ln1yso+kbxWMgd?=
 =?us-ascii?Q?6fW3RyfDwzm2XinRpUDyN1bcxWIDLvZhfbQ/ymMjxJJo3l1I5I3n1jQu+7yN?=
 =?us-ascii?Q?1kZvF+ETTpTZUOYAiMzx23EU4VSXeXX2GInHTjNKJFuiaDa6hduEiyEcHSTK?=
 =?us-ascii?Q?UF9InsL91+l8SkOa3JKwtZnVH6YGh5DkkAfi3085qiQP+urdGJtGvZ8IVAbB?=
 =?us-ascii?Q?5aBcVMMA4soiwxGXd409NOElf9AVbUZKYyWyxz5W/2MslFZ6x3dZkB0TH5SO?=
 =?us-ascii?Q?4X+duwxu7VMiOws4CL6qVnWmOSvOd1UAZ4gfJ8ePTYn0gFjQWmlgNigzALz4?=
 =?us-ascii?Q?bHjbqC3FNoPCgmm//EAVfisBc8mRkxNGzHQcn5zCNY45LJRN1lHvlhEeBpT2?=
 =?us-ascii?Q?5jg2nfdzxOoTrxLkw1Dtz9wfaGRivcMM8kbQ4nIxXdxCAdP9NkPFe6SsXsbu?=
 =?us-ascii?Q?BT2R8Ld1hEcoMLEnnYlILcUbLauYfQFRzB+5FyYa2WrgERnG3vzpiWdCKPz6?=
 =?us-ascii?Q?P2livRG/gRBbHofLKMdNVrgym2n/GSLep0WaN/UCr2KCRXgimmQKmepsJ7HR?=
 =?us-ascii?Q?D+IphwI/21vjC8BTTCxfhLfwny0QVU+ZXxWeY/l1TbR3j0fGZPwZjZbsvLwG?=
 =?us-ascii?Q?z3WOgEaNqXBqAXlUM2lB4b3j?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64a67dcc-ac7d-492d-7cca-08d935ab372a
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4510.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2021 18:26:13.1787
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gt8ryXpEQPLtpQCX30KIClxBmD+0BFY4bNHzFAfvRF/1EcgzIEMk+yMCVZICjDajhER+jBGs2JrcaJVdwZeDxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB4670
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Currently attributes will show things like:
`BootOrderLock,Disable`
rather than just
`Disable`.

Of course this works, but the attribute is intended to be read by
userspace tools and not require further processing.  That is a userspace
tool can display a drop down of `possible_values` and `current_value` is
one of them from the list.

This also aligns `think-lmi` with how `dell-wmi-sysman` works.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/platform/x86/think-lmi.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
index b029d4a5bc3c..4ceaa57396b8 100644
--- a/drivers/platform/x86/think-lmi.c
+++ b/drivers/platform/x86/think-lmi.c
@@ -492,14 +492,19 @@ static ssize_t display_name_show(struct kobject *kobj, struct kobj_attribute *at
 static ssize_t current_value_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
 {
 	struct tlmi_attr_setting *setting = to_tlmi_attr_setting(kobj);
-	char *item;
+	char *item, value;
 	int ret;
 
 	ret = tlmi_setting(setting->index, &item, LENOVO_BIOS_SETTING_GUID);
 	if (ret)
 		return ret;
 
-	ret = sysfs_emit(buf, "%s\n", item);
+	/* validate and split from `item,value` -> `value` */
+	value = strpbrk(item, ",");
+	if (!value || value == item || !strlen(value + 1))
+		return -EINVAL;
+
+	ret = sysfs_emit(buf, "%s\n", value + 1);
 	kfree(item);
 	return ret;
 }
-- 
2.25.1

