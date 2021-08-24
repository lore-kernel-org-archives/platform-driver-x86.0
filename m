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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63BFCC432BE
	for <platform-driver-x86@archiver.kernel.org>; Tue, 24 Aug 2021 11:37:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3DDF961183
	for <platform-driver-x86@archiver.kernel.org>; Tue, 24 Aug 2021 11:37:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236621AbhHXLiX (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 24 Aug 2021 07:38:23 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:7648 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236531AbhHXLiW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 24 Aug 2021 07:38:22 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 17OARKuG025058;
        Tue, 24 Aug 2021 11:37:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=pMvx9Kk0cca4YCjMZ1yWHm+2tM8KdlZtOLx5sg2Sp/U=;
 b=eVP/fI+i3ITm32DUSikDtixs/TZqiFUQvck0VvbCrI6c2vpX+jMozVTvBihwaijfzPyT
 AumEWoIwDb9qNy82Jjj+XnJr1go/o3S5Ub59iogIBQNaQfk2daf0Iw0Ri0+B3Q/r79Pe
 qSsHcWvX87vbtnI8hQOrTJADrlx/UeEfbqMbwreQ6Q0IimzTl0Gt6Zsv2/MtWNavw2Ep
 PMMJXG21xAJFgN/L5vpweFiK4U242nVgCSIHvVRTLFp0f113oU/YjKADrYtqWeG6CUre
 /Vsm0MUOERr4a2PSL8Sm+66jMQaE6KFLVEHeodp882Nq0GgoVgRRfLK2Ue+MQzD4f02h OQ== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2020-01-29;
 bh=pMvx9Kk0cca4YCjMZ1yWHm+2tM8KdlZtOLx5sg2Sp/U=;
 b=zhq9I+J+YGaRffvPC6pfjfyNK5YMuLemrhT5F7//bU1wUVZizlmY52oM6Jk9v3gN6UGR
 xElIt+aQS5HiU63eoU2xGQu7KmzQDYlsaUbq2dddc2twaeOb7kXcJiIZxs5fgm0rvjjH
 +MTCU3wb1zrXhGR5uaGhHc5npBQZQhyORbC+iTuhX55EWPIvBvoZjwOSYR4Vu9XtuWnC
 n9OfihVQJWnCk170S5OCJ7gnIm9tw/sCEifrz+uCXl9NWEBlMp0vHIJz4QKXeiPzO18F
 chCOCngoUjGAJ+3Grrux+g2abIUW45jEWZDbEVLkdXkmM0x1U9Ur51cXWDRAu8x6AF/F 2w== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by mx0b-00069f02.pphosted.com with ESMTP id 3amu7vrrhd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 24 Aug 2021 11:37:11 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17OBVWOk069398;
        Tue, 24 Aug 2021 11:37:10 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
        by userp3030.oracle.com with ESMTP id 3ajpkx4nkv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 24 Aug 2021 11:37:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MuS85unyvu2eD1+TgPepXXjVvfP5P84ajE2PFFaKnXxEW0Xvz7HySxk2LQ5uwN2uJJbY5Upclrqvw/c0+d4ZgSu6woEU7au5nNfGlNeQcMIAAW/HPXOa1PcwBz0RSEc3mLsf7l+DcfbsjyQizzgE5/U4yskYsGPPExK7C+3+YB+rSAWBIBpuUzzZ//A255oQKue1gKAt+bK+Rq0USh1UYt9B0USTsvRDFXuo1BWXU3jgAFLvLR18QA7VprQEap1cc0GabghLIaz5DrNEMlQ19vV7pCZNfsxJO9weHgPCvTCyFYIQxfi/kZoOW6HqMvjrT7XYlLwfQBopP69LPWBovw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pMvx9Kk0cca4YCjMZ1yWHm+2tM8KdlZtOLx5sg2Sp/U=;
 b=XZgsuMlOWie8qjXSVNH7RU6fr4szOBMJ6YnXbxhEsjR0pJ/kpht4/fE5hZbHBLkCh3ZF4QHq2iMUZGErBytK+h3bZH+RKirJr4YvtL33hvBHrq7IWIm3z2/PTGfK60n3SHfNEXYGhqyYO/a9bQf83TENihhF2EkBpdBqyJ0sMVYB47x9SwkrRm1OGgyv9dvy43mM494mNwu1O/Yj5uVPs9MqD2kZRFOBrxNMtLPm5ma9Ckzg0Gusyc/vU8Z6/0H+F8OIjMM8F0HcIM1cUeQcyhSI4NpNNVZMcbw5/TlP8iLXHQC6vqDme3oprDTO6m8zpRIE0vEuarrg4Pz9En9ebw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pMvx9Kk0cca4YCjMZ1yWHm+2tM8KdlZtOLx5sg2Sp/U=;
 b=hJKl4/Xz19nhIDydTz04/FQnOIwKy7C9pjQGgG3Gf5ojaslcr/VwRoawelEdnxR2yLc0noVik4FKp0ESaQQYOMJSn04Pp+MvJnRp0u7EJAP1wc6kYjuyf/mV82E9lDwsDZW9BC3rXCf/Gvi42aADXiYzphT/Ifx/ktnyUQ7Dy9Y=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR1001MB2128.namprd10.prod.outlook.com
 (2603:10b6:301:2d::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.24; Tue, 24 Aug
 2021 11:37:07 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 11:37:07 +0000
Date:   Tue, 24 Aug 2021 14:36:54 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Corentin Chary <corentin.chary@gmail.com>,
        "Luke D. Jones" <luke@ljones.dev>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        acpi4asus-user@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] asus-wmi: delete impossible condition
Message-ID: <20210824113654.GA31143@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0104.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:23::19) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kili (62.8.83.99) by ZR0P278CA0104.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:23::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 11:37:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c3919fc8-e3b7-434d-a4d1-08d966f38053
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2128:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR1001MB212808EB769021D6E87145328EC59@MWHPR1001MB2128.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 01D0Z1o3cPzwQdx072IqRF/0mnTtwlszHI8NYe3zmiNDV9WHjYTgQqT3fC1kziILO45hck+yRJnLtsUjYqiq87quGd9/PeqQ7IRyK9wwAdL83TuRgvPlZr2XkKLK/bEIvOlQ8JBFbEd/8atpimkKEPpRoxb+xkME8wFzx7x8zPcPped5d1Osd1w+ErqAA3IwBwabRKyg8KyKaUaB/gI4KQJAPBHKZEwEx+huEtObi71rEONHFOW0Nw6FubBpWpqZVpKQUffX7WxkTBZiSstYpwLbxavbIVI8qy0n+URqfczjXShw1scTUg+iGQaxIWLSxUaCSgD52WCknOrgh1eQOi4OhXPDLkYHbi84Oy1k5Y/Pt1c9Gcv5lRsIguakCJqCfZn0dWpDM18eyElKqTCHWP/p5BAAXkfEOO2lkde1bus4WJcRgz+NjnBPRUY/HMVpHhEmO5whpsdjwLyZzXq85u6cT/tD5okm1dOLOY2BD7+OLeX8xqQx9zhjn9v646rUJd3in2CFeNihGFET8GnKuH8zDrE8esrmzJrxOLE5lAl/Rs4sQg4u1njAgbY90jrPb2kr/8e+DwfNKvBj+fLrMkDeds5zwJr//vOkeZFvxvg4BchvMD64Dq2MG1pZ/tkULcJ2hTCI59qJqh4AolB0JD6YftlO60/zn82GvpZn2aWoOfuS0HgVAlVzFT47lmiuP6i4O2w+OW47uAVyMaE2Gg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(346002)(39860400002)(376002)(366004)(136003)(33656002)(5660300002)(52116002)(4744005)(6496006)(54906003)(9576002)(33716001)(316002)(110136005)(38350700002)(38100700002)(478600001)(6666004)(86362001)(8676002)(8936002)(55016002)(26005)(2906002)(186003)(9686003)(44832011)(4326008)(83380400001)(956004)(1076003)(66476007)(66556008)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iYLCI2e6fZmiRkn2+bT1Z/onRuksjDbJVXDYZ0YGVbnLzHED9FDVIQ/12ocZ?=
 =?us-ascii?Q?oRZYEybxKDeK2zzVPq/BiS7CHUD2+OLhVxo/90uhrYWouHsHgYuA/6svbk0C?=
 =?us-ascii?Q?bBRO+ymHF0s+w/OX4nxD9PygvKEVat96Zi1lKsfsxqyBTkljOPJWdL4k38VB?=
 =?us-ascii?Q?LCwSJe2+WhPMOy1IsrBdub4vjYXAx28vGgbGwyqu247+3LPTiivPywWBBZgA?=
 =?us-ascii?Q?gfdfT+TUXdRD/zC0WqrqUlCgFzWc8d65I3o+ULqOGZAkAmMfiarqbWY4F+T1?=
 =?us-ascii?Q?UfmBc74/mZwZskCOQXRWPmrt2a3h22AwqC1U6Lz/wVGfwGZEvFu8FRB0Dzkc?=
 =?us-ascii?Q?chli8VqR5+s3rqTAMrkz2+9axf1tvB6/sWdoEqch99NxntjoCvDoIV44ps6v?=
 =?us-ascii?Q?9DqpBxsiDdI+nkYsEa0UIdWM/UJNTq/wuZ4N+ZFSIiottA1iHrd82cRjQ44y?=
 =?us-ascii?Q?ISJRxVvfmO9Y+MOORfFzue4q+OkICQEUmcGo5XuMCugujg3M0Lmmmc+Glaq/?=
 =?us-ascii?Q?u7bzD01pF2V+wZ5oBRQcM6QAl6Da8aW3a/f8r+7B3f4KASBUdF7wz64tkPyB?=
 =?us-ascii?Q?uMKNnXGk/H4szlyXE04MgTYpYRSxLnTL93MDarc89clf4GzSlCIQs+GkjU7V?=
 =?us-ascii?Q?mTQOk/gh4lhcvrVZyK6tcrPqBZqVqvh3MpB5Zdf01r2tlU33cVtk2opuB/wi?=
 =?us-ascii?Q?maUM46Mx0y4rLE6T5buqJ4kMsViBBPGOKbQZg2EIpfLBkaRoANuIty8ZBwpH?=
 =?us-ascii?Q?rvu8Z3rkuEPq/LWFjSjO3BwXyoU1xSVpI1kd+dsE2fkgGaAKFDH9EXdROc9I?=
 =?us-ascii?Q?g0iNyJUrvokmyuBqUbntvQM/DNzL9w22vaASSxaaIegKJvKCVxHdy4/kx59k?=
 =?us-ascii?Q?WuXtY22N/v4p8sJrrcS8WNbqLVqXFP4GkAT3kbsNpQRD8PG6EPFiHqrjS3tG?=
 =?us-ascii?Q?iiLaatA4oHgXiwm5CJnCd/g+dCKEztftFjZdfqTvoSB87rLU5ck/5+jBtLvl?=
 =?us-ascii?Q?0/PxmD4Kx1nHRcY7h/ayBoEGvdjMdWkMinsD3Ltgf305wLd+KF2PfITjGUDd?=
 =?us-ascii?Q?uZuA8Zzai/Z8lc5RryEwkm7qD69MAjGEJ1bAU4UslS8gPATybZZm/guOSgd2?=
 =?us-ascii?Q?u+kEAFBV0wH6xRKaciJrRRahemfAqJE0+THY4PuG7mMVyxLGw+5/ZcnHw6r1?=
 =?us-ascii?Q?2931pQ0CzDgGuxm+GlXE3AIcKyOEYDdMYQ/o3rKANZxBhOuQEi9QfvpyzGgN?=
 =?us-ascii?Q?WMHMPhg07QTM5A+pq64xYOODD2bKFkH1iTURCfQYcaO1AVCxt6bgO/IkgpCM?=
 =?us-ascii?Q?KLHEg/Aj+umO6G2JH2yjYUtD?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3919fc8-e3b7-434d-a4d1-08d966f38053
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 11:37:06.9285
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e7aQiHf11Uiiz5ZtDfbPWsnCXwxZ4WWY0TUSucIJpIua/51bdR1jVtaCl9RIUO+RcLzQ8W5EJ5wNg+74NkIhiW6Vg0Q4TLRPNXQnLgNoDsk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2128
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10085 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 malwarescore=0
 mlxscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108240077
X-Proofpoint-GUID: HK7PnAHtGUcPrAvzSd-xp5DFKkHFsPd9
X-Proofpoint-ORIG-GUID: HK7PnAHtGUcPrAvzSd-xp5DFKkHFsPd9
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The "asus->throttle_thermal_policy_mode" variable is a u8 so it can't
be negative.  And we always verify that the value is valid before
setting the policy mode so there is no need to check again here.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/platform/x86/asus-wmi.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index cc5811844012..679429d41264 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -2179,9 +2179,6 @@ static int platform_profile_get(struct platform_profile_handler *pprof,
 
 	tp = asus->throttle_thermal_policy_mode;
 
-	if (tp < 0)
-		return tp;
-
 	switch (tp) {
 	case ASUS_THROTTLE_THERMAL_POLICY_DEFAULT:
 		*profile = PLATFORM_PROFILE_BALANCED;
-- 
2.20.1

