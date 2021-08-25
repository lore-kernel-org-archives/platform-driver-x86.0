Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DE3EC4320A
	for <platform-driver-x86@archiver.kernel.org>; Wed, 25 Aug 2021 07:24:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0A13C6127B
	for <platform-driver-x86@archiver.kernel.org>; Wed, 25 Aug 2021 07:24:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238869AbhHYHZJ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 25 Aug 2021 03:25:09 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:21632 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236402AbhHYHZI (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 25 Aug 2021 03:25:08 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 17P1pUFR001041;
        Wed, 25 Aug 2021 07:24:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=bNloc4HqEb/pnDkkKYkFHRElMpgZHOLm9whGNCrvhYE=;
 b=f5qNrbVyDwGwjwL0NwpDGwKIpvHeY6IkaOxJ3ChVai5egRfp0vSWCYxnqzFSfRLDOkeu
 Oq9fxGNhrmRQhEWnvVe7rNOanZM4QunbeE3uqE99ouhRxxMRcgv6TVv51KPReI6pGxww
 g5ocJQmcOma5AN8IXhV8M/QgaTHF6ZXoHzztRb0+g5LlEzYXnFZwerJwjwfABZCO1Wbo
 fSRSYDBtXpLorptvte4SFgJGj9by/DaysWV6hrXTM9JQzWtBjirJ8muncRzdG0xzKJTw
 opJbslZD6r7mLO9XOHGfA3Nggs6tO2Ij/1+zMPezQbiFe9Iu6ckhNbkzjEfp5AIOikMt Hw== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2020-01-29;
 bh=bNloc4HqEb/pnDkkKYkFHRElMpgZHOLm9whGNCrvhYE=;
 b=qGjHejpbBjKtDFPQGPHYYfjOJKIvVKE2BQwhASmi7IQc770TmG57eIs0lbmHqn2WeZEV
 OCeVvfVFjiANXdd+8UE8oaLeQUmicX0FnUCp0QgqkxtcCqrQJakUac54VJrsGjGBv5nT
 kHpcpRpGveOye1mtflkQAYw6B+WXaNTu49C1kX8DlkcnVbayPPYCaJbLwUOwBIaLyzXD
 KXSKdsUYPqaz9vrgF7Vz/rmD6U62/OR7rr0NjKIEeDZPUd7JNXBrPzGefItEj6Ci12K5
 N+RrEjJmOyMYBXVvk1ESM+ROYPVwAaAB82fRVEkDeC4zZpwxmod7dLsAeC34HkP6Gf0D kA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by mx0b-00069f02.pphosted.com with ESMTP id 3amvtvttyw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 25 Aug 2021 07:24:15 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17P7FQjo136030;
        Wed, 25 Aug 2021 07:24:14 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2106.outbound.protection.outlook.com [104.47.55.106])
        by aserp3030.oracle.com with ESMTP id 3ajqhg3hfd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 25 Aug 2021 07:24:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uh8aeX2ZatVpJUmL36TQbc3Z9vRL5+cPzalxLtSnzNw6Bi4PqDPAdIP3k1P95Wj2IK9Z1JYGKFh5HCWT6vzQHbOFaAGQ72Y/EjJ1ChJ8AUm5hVkolxpuTGiDoX8IS3joEJZQCPjJGiwI+BcuYCy4hlInQsMh+zqRc94r0m/FC3luVCIb1nbrhW2HDuJDZDCHd5FODaKFPGo6uDhUtolTsjI0I7x40qrgou4dupI8/kTULYFEvBQS7aCEWWUEMda3J+n0j3sP0xpIs5jGoQqEyYXB3Lnj54iXHpL0oQiO3oPrn09lMLuOVLLXrUFALRB4VaCwT2sHFG87ckW0gZmtlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bNloc4HqEb/pnDkkKYkFHRElMpgZHOLm9whGNCrvhYE=;
 b=EB0vuRsrV10Y32b2NeeMGkh5373ILitT21yzEAgKG3LcIu2R8QsZOuq6gX96ZGnzvqqXR18NKqmkd1IFLaz4nvLiXc1noYAMiGp2PIkeUHG1q1t8l87BweM4L4xq3331YSGWLO4SYMGoX7P/N6ltHAZw+VqUeMBgcsGECuTt+YJv29u78IdmCfXdNmtGQS4pWWzq/uYL4caowYBIQkEz+f6w+e/OaiTFJEgtV5gYBNwLgSe6AXvjjPgFZTxyvVBMY+qQTETg9Vf4FcnGVronTeDIeVcy3lorGrc4hpXYgJewus9g3WEQoT8MI2kZz1moSQuINOBNIE8ebjANSiOm8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bNloc4HqEb/pnDkkKYkFHRElMpgZHOLm9whGNCrvhYE=;
 b=z0IquUofLJt8De0YsrQy4S4o8iBOfyT+h6Ym9fzBT7EuSTEmoSFwA9hLJ4RcX59OrZ8QRaVGnHwMTaiLffVzt3dKlLdTMXVxPsz8xuHV4S1VCLkoMrL679pWMlmkJ1zHjtLJmPia1y1GTygH6Yy3jyYCw0gcqaqUcmYjNPre9mQ=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR1001MB2096.namprd10.prod.outlook.com
 (2603:10b6:301:2c::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Wed, 25 Aug
 2021 07:24:12 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4457.018; Wed, 25 Aug 2021
 07:24:12 +0000
Date:   Wed, 25 Aug 2021 10:23:57 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] platform/x86: ISST: use semi-colons instead of commas
Message-ID: <20210825072357.GA12957@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: LO4P123CA0068.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::19) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kili (2a02:6900:8208:1848::11d1) by LO4P123CA0068.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:153::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend Transport; Wed, 25 Aug 2021 07:24:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c2782a11-8c1d-43a3-2b58-08d96799560c
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2096:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR1001MB2096FA7F0213E853C18CBF608EC69@MWHPR1001MB2096.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wwIXjoYO4yfaSxKgL7oIlspAgTbHYCPV81IxXygX1RS+8cmEwVPxOMi5oiNOUQqHLlVV64N7YpTjsP9n+IcUGqHIXRTp+TpBn6FcSEldhS8xM+Yk1xupIR+45og9dLzTK4KbliwuvNCONQWFNSZ59XYXHVUi2o4glfFyCRFc4qioC4wcuHJ3sDznmyNq9pqXYnHwZvasuDPjhkwyx7u64EO6ZDW4jkszQbLS4RYzSReltequqT1FaVNxCLGRgUTozTAQJC60d7/k40Ikoljb5SWzDrn++wXOV7s3aezwV223gsumscCWfWP4Px89FWFENM8FmMHEte+SKMh0/RX8289nbgiV0GVQuxLshZZ213hBkHiY8svHFmQL0Bx9k5Hjlbv15BgwFgeKTtA+BmLyocLhUNdmZeR6e/CQz7WaOXBSqwjEPYmsRgJ9IDWntd80FWE+2CSB7XnkaWchcyfnUA7hotIHg1mTFy/7E4gjE/9DlISkrDRlS+RkMug50oYfMAlYcJR2KPpRPIxguBG41FHYTAdLlTD0/GUMcRT84v1sFV+cddxYLDuUNwXD0wUwjwF+UWO35BLcnJBwDI0kKn7YCHS/wHaDgm6T3wQVYkhW/CFsTr1/RoK/OM3Rc6hOz9Jjiqqj6KwvNY+Lix8BjQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(136003)(396003)(366004)(346002)(39860400002)(478600001)(66476007)(66556008)(6666004)(186003)(33656002)(54906003)(86362001)(8676002)(38100700002)(9686003)(83380400001)(5660300002)(8936002)(33716001)(66946007)(9576002)(6916009)(55016002)(1076003)(4326008)(6496006)(44832011)(316002)(2906002)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OvZf/n7L0xnraQtQHwB+DdG67Iu4jhhSbbUboRu4OHB4CPFGlulVi9CwgrdE?=
 =?us-ascii?Q?VPJGJ1QvwxDsAZkife9rE+QOHfOExi4/0V8ZAAgerQTbFiOIxBy/IT7VJ0Y6?=
 =?us-ascii?Q?v24ZC70NV1M71wFu59PR6Nq42BhEXHIggbm5mZFNgTFIINnHZzSx35/GxC1R?=
 =?us-ascii?Q?DcMcdbS+2CYOzUBb2f57Ipmj3PWBlFMoyh0NZX1TZIX9cXIPfga+kYP/Xhqr?=
 =?us-ascii?Q?9c/OaALNWDcZ0Z3kDl2xGNKA3DDfmgZ8tfXvYmsCEEbN3DqVOq7vEnjoSA6x?=
 =?us-ascii?Q?pQYJ9ZnWgvd3gG9BxYDauJVJN8ggHWo42foDrsxjbvwOUZxEvPY8wDIAx6wv?=
 =?us-ascii?Q?f8Tmzz8ByPxqiT6S35iYIvd374jHsCB1gEe+5En6uf/WNAl4xuRvyZRuLgKW?=
 =?us-ascii?Q?INunB6PwJX5fXIns8mu2R4QFxfwGd81ebX6UVKWujKSMUDHN9cZyFNx+VhmP?=
 =?us-ascii?Q?k5v9tTHirN0L+4In3jvT9nna70bFTuT+tP7C7v+lxP8OmceN1VQWL5n2C5Rw?=
 =?us-ascii?Q?FCgA1NB4jyLeTPrwWWESsEm7CLIh1PL3wBKDhujFNlqoBFN6ddXQwNTvNEMK?=
 =?us-ascii?Q?Y8QnTVDKDjWy+Jd+5c3p3Kx2460AaJHjnH4U/26Yy8t/TJuYmAhc6PUXVX9y?=
 =?us-ascii?Q?Jeq9qHSLD7Gk4eqXiisHp+m9Op4mXiXxn1+316L1st4tV2eA0HvXFWx+fODG?=
 =?us-ascii?Q?92LWK/4h7x6zDjM/jrSn9QVwyyzBiNq3xTAeL8CNadmIPlRCcXF2K9ZGhPGP?=
 =?us-ascii?Q?ZJN9ka2xBYxTM0Oy0eCcu2v3lbJYvVOxMtZbzgDPope8snhbLC5X4i7fPnL/?=
 =?us-ascii?Q?Kg2qyDUFsWetb4txM8C172ebC4zZufTwggwIkEn0PrIDMvd1kEXPU2FQUrh2?=
 =?us-ascii?Q?tLcKjfBETAIXSUDEZ0rUGRHBdl9oQkdBm79CZBN+TN0J2UNeMQ09gEP4zf6F?=
 =?us-ascii?Q?7DURxpLvcdzqA0DHCHB+qpHSMedlLb7+r7YS8WtJWocH2YADUrW59WKS4+12?=
 =?us-ascii?Q?dKEGI/hMiftGzqxZ6hYqdDy/LIneBJim0lcTSVI2/Gdaa+UfNmTYIYyE2vlH?=
 =?us-ascii?Q?G8jE1hesYV4ybnZVZs5wjyrQEAr4t34CI2FKJoilPgV+eM/pgp4nTDHgWwjg?=
 =?us-ascii?Q?uVGafshswoUY5pou1Utrw7FUuJHU9Rx6DMo5XCUCOIWv+aJAXDdFHe1GdboA?=
 =?us-ascii?Q?4Vf4VhLG34AhttNDev4vtWiRI80KZAinT043q2fhh+7yF0FoEqXiBPlRa1g8?=
 =?us-ascii?Q?HBk/81kfnxhQbVdVAtmzBrkTP1SXsfYL0j1UdqCI2hT0FT2H19f3v+jyQwvN?=
 =?us-ascii?Q?MVnz1A0JS9nxqznc4Dc+7m5sUnfzr1vFtnr5okDsZ/l+5ISXKkek8dihP60d?=
 =?us-ascii?Q?1cQCZzE=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2782a11-8c1d-43a3-2b58-08d96799560c
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 07:24:12.1824
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YuN5kh/B+iAsBmUoz38UBmNYwvUbfS3TCg0hEr4a6s3c8CircgRXdb6yDBOArIqZt1RlSyyzNi9Gal2eJsxS78fB8oyX8HlsnteGw5/Kt5k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2096
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10086 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 malwarescore=0
 spamscore=0 adultscore=0 mlxlogscore=999 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108250043
X-Proofpoint-ORIG-GUID: BJu6Mq2WQqiItHVz-S4L-35sPPcDIq95
X-Proofpoint-GUID: BJu6Mq2WQqiItHVz-S4L-35sPPcDIq95
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The code works the same either way, but it's better to use semi-colons
to separate statements.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/platform/x86/intel_speed_select_if/isst_if_common.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/intel_speed_select_if/isst_if_common.c b/drivers/platform/x86/intel_speed_select_if/isst_if_common.c
index 8a4d52a9028d..c9a85eb2e860 100644
--- a/drivers/platform/x86/intel_speed_select_if/isst_if_common.c
+++ b/drivers/platform/x86/intel_speed_select_if/isst_if_common.c
@@ -265,9 +265,9 @@ static int isst_if_get_platform_info(void __user *argp)
 {
 	struct isst_if_platform_info info;
 
-	info.api_version = ISST_IF_API_VERSION,
-	info.driver_version = ISST_IF_DRIVER_VERSION,
-	info.max_cmds_per_ioctl = ISST_IF_CMD_LIMIT,
+	info.api_version = ISST_IF_API_VERSION;
+	info.driver_version = ISST_IF_DRIVER_VERSION;
+	info.max_cmds_per_ioctl = ISST_IF_CMD_LIMIT;
 	info.mbox_supported = punit_callbacks[ISST_IF_DEV_MBOX].registered;
 	info.mmio_supported = punit_callbacks[ISST_IF_DEV_MMIO].registered;
 
-- 
2.20.1

