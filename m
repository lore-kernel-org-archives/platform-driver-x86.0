Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 153B4C433EF
	for <platform-driver-x86@archiver.kernel.org>; Fri,  4 Mar 2022 13:19:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231634AbiCDNUl (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 4 Mar 2022 08:20:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229748AbiCDNUj (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 4 Mar 2022 08:20:39 -0500
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2F4B22BEE;
        Fri,  4 Mar 2022 05:19:50 -0800 (PST)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 224ApjqU013353;
        Fri, 4 Mar 2022 13:19:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=YKocPvWe0Svz2fWFgyZ5iaWqx6gmUjJKYFIe0gB89DM=;
 b=zEgMHMnOHIhO8DZp7xwi2rZoJiul3YRInZ8PxTlKKpCRJJk8tksyNenLti896HC1Wy/k
 3+4is01j95WibbQnIWb1EKb4P10rcJ360XtK4wVk+FSTYy9U0n0AZChrpfW3r6iQz5Ki
 6JypsQK0Hx+CM8oPi4yB1GKMCMs+B7bVh/ktm67A5FZvVUUwVbIOSKcDPPR9wOkUnRc8
 LF8B8TqsRq5D2h3AuPkj7HcN1V4OIy6G+ROnfp0tMIYQNLdjEsRP0FE7XMM+bydRn3+7
 SaCxh/0cJC8RY0s1FpFEdZVqqSQxVXkZsL718cwIugVWHZMhx51Jm/JuhtdxQ9sdh2la Gw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by mx0b-00069f02.pphosted.com with ESMTP id 3ek4hv1pu7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 04 Mar 2022 13:19:45 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 224DHCZ6092570;
        Fri, 4 Mar 2022 13:19:44 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2104.outbound.protection.outlook.com [104.47.55.104])
        by aserp3020.oracle.com with ESMTP id 3ek4j8u09j-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 04 Mar 2022 13:19:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ASKkhbXU4ez9MXpq5K1/V8Dwp1UiC8HrtZWs06IBjghh/AOrlmngVWuIm4Ka3H4PzKfLuJFG0BTsQ9F9+BuG2hVKs6zTI98zmKyB5Cgaj0306+EKbWjYKAdb38+/rG34cAydNFRjtc0qgHnDw0U/aEmmsFFMkVrAA1sU2ISE4KsCWYz4d3xxWnXje226G1PkQyQ6/1zbVO1/yy9QaX4YmvzRNvGkVJOxdgSAt29YmZChURij4tU3iAvpESGxOU0Hewdt/tppHUa+QpH9xxHRyucG78Fz6oFO7or0DQ7awzVa8efPaDCbZR4Jap+CXd/Nb7LdorjTo36JsiCpx73hJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YKocPvWe0Svz2fWFgyZ5iaWqx6gmUjJKYFIe0gB89DM=;
 b=Qmh4k/Fn87eWw9vJGajni9YiKGEEJ7jDe1TA8Buce8tqKcjJSQzDi5isKZX2iiK035ffuvlPz2DHOe9nRtShUNCqQ/jJsQurMLkYZ2rqr46TijRJI7ziuQplMuMBxxXbb3OpkgHVVvrMXbn6oGoMDK9fEP4hDOMtVdKxajQCWHOxIw58JANNI2uv7Rf6ls25HOP4qpTXIm9EdpNiR6wnVApZmIKOi3PDfNmmx6iWmLLQe/JFwJHE03rO8YD18RZM4/HFsljfh3osR4BhoaAEmccsAEEZtNlQc+auW8UAUlWt4AU4qqRtM5QC0VMpslLJYSY4zOZFHNuFDo3Y625jXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YKocPvWe0Svz2fWFgyZ5iaWqx6gmUjJKYFIe0gB89DM=;
 b=nxVU0fGTJEkR5NwFmqB4gqh8qvRsl7BM7Z2kJC6vGlxxzR/UGkDNw/I5dpJJ71VDEXXe6Kku8JBiZT9F+F5W9sLNx1zrbrASrrQ2L4GPY5zBPTCMgsmT+Jo4fAqKw8PhJc7FYSV4rIxzLYRFhdLK0DhgvXGJxGkfAz6tRLsQgrA=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BYAPR10MB3253.namprd10.prod.outlook.com
 (2603:10b6:a03:154::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Fri, 4 Mar
 2022 13:19:41 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5%4]) with mapi id 15.20.5017.027; Fri, 4 Mar 2022
 13:19:41 +0000
Date:   Fri, 4 Mar 2022 16:19:25 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        platform-driver-x86@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] platform/x86/intel-uncore-freq: fix
 uncore_freq_common_init() error codes
Message-ID: <20220304131925.GG28739@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0114.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:20::11) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 28243f39-3710-4684-703c-08d9fde1a41c
X-MS-TrafficTypeDiagnostic: BYAPR10MB3253:EE_
X-Microsoft-Antispam-PRVS: <BYAPR10MB32535B11417A35CE91F8594D8E059@BYAPR10MB3253.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8ZcE7X3i+ISZFF5b1jMyFbRuJSWbeAXZVzjYVckruwkppMEYnsy65kDV4kc2hnQqNx2RtxU+YaWOdHNiGAJwc7BXvTV5ara6WmRU9MvVNE+iz2I2JdeUpTJsntGSVEhnbrFNmli/G87IaNmT1eSeIlp9Q2Qfk9k7g6LVRwD1lg4hfUCCazCwGvTTXnxR7vzAOouWUmUt/CkdPBbn9syqgAX3C8fqdOYH78qAQ9nAWI51+JjH0qVNiKS+6n1BXt8H1Jmp3Q0GxdwyHszpQjSKpBUB4fDuM5Y7fXEG44pDGBPdH3NuQU4sznn5gyVfqPM/cUiJjmp90WIVLLcNrBfyYaLUHqvsFBhegqp6qr7rjsIbt+QCEZnmO5oiuJPsHeIIj1fG/Br2eng1mu7p88tgsVze0UTutNxFRhOPoanrwm4QApw3dEsMyi2LyG1wLShhnGghuzPVdqWK+HVWxqjrk5j3pP6mO+Ql1ppLw28XNGDZI95J6AXti5NwGz1qGYdcL7XO5yAaJnPGNlFLviuFzjAYE9zL9KEv5thIXMKbKlgCXqRUUWURT7gg9pRECp+0ftwKt2qYjIgXLce2Vd383x/DpzDQE0Dqv/sHsMwLpvTDJz/sfv58RHChGWW9667+YOy8zl0pSw/Qfm8Ok4355O7SUXV+jWrNx2rwGiWoSb/86lCJw65jFTGsRXA6uqzYBObfePM4hIk/BPYycyHgDQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(38350700002)(38100700002)(83380400001)(6512007)(9686003)(52116002)(6506007)(33656002)(33716001)(186003)(26005)(1076003)(316002)(2906002)(6916009)(54906003)(8936002)(4326008)(6486002)(66476007)(8676002)(508600001)(6666004)(66946007)(66556008)(44832011)(5660300002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?v93kmJC3NTKLxhmxj/ziSyHXGzSSbrvfxBeVwzJYqoWCtss2+ED93cFbWCmS?=
 =?us-ascii?Q?gM/AllA688PClcRzta25Lg49qRpo5W08w4BPAbE6dqTNJ5K0EpCBA4Mv74H3?=
 =?us-ascii?Q?PzR9MctbaRmg9UrNh1oq31WLwIMcHL6EL/pz5b+a+C8/vANaIIhDlGH40wOr?=
 =?us-ascii?Q?AEnGKDHIrGWyWs/DOdAcdk/CibX1NgIJWZotYQNzd0hHHdXcrGqu4XtyHlrM?=
 =?us-ascii?Q?hE0kFi3n68/4kDhAIeb24OgtJ3Ji0yeTcPSd9Cl6waLFqhCs3E+LZ0TWVU8J?=
 =?us-ascii?Q?xhURkzOssy80ypgvyU9h60cvT1f31i7U/j2jwSg7cmfZJg/m99Gnyn3to7WL?=
 =?us-ascii?Q?/mpLIlMxI0szbmsDilKVeR6egsH+vqrEZDSCwgVqT1onMDTL1ppT2upBJyjX?=
 =?us-ascii?Q?h+Mp1mXVS/56WXzuDrShxDWot41XcssU3Dle7neN+XqXYJvceLV5mS1HrUay?=
 =?us-ascii?Q?L3kxRMBMF5ZpnuWnGmEwNSDFGaArPccQhKYTOlYjclE5No7Rdah+QV63jOss?=
 =?us-ascii?Q?lc1G04ZKJKMxCxHHgTs4h5jYooh4OWO4RVDWf+4kEWBTkm8I7CUawnX1Yap7?=
 =?us-ascii?Q?sF2eSAuV7Yt7GXZDrY8FCmgfxi4/gh4pU2ZiVK7V5bucuLhqFY8uIRT2zo6g?=
 =?us-ascii?Q?BBReNKggVvepChQkXTrQh/W4gf+0p7VfJ+bgKF4PsA+0eL9dJRmKzBQwjVul?=
 =?us-ascii?Q?8TbB7Nj8eXwDbq36R8kJlF9YiIiWtBBC4bSlbViW2/w/uMIregUKEgGOw11E?=
 =?us-ascii?Q?RFKb4qSCHUmzt+LX2WlvXn3zsRisP3brMWbMNFxGX2f4Gf4kzgUzcXvWA2qq?=
 =?us-ascii?Q?UtBDvoO0I5G4IjNzjUik38s3G+8+M31/O1aFL2qn4hFnxYpG3zhBMrT1+vFY?=
 =?us-ascii?Q?eTOtHqp/q0zL1EO42GnSEf8J0Dnnsos0e+ObpRsF9pTZF4oUlBui/g1gjB8K?=
 =?us-ascii?Q?bQWsSsToiaCLolvcyx2Xzt4RVQYq8Dh/xJdJkyvv9IrzRATdexbmARXTnQjT?=
 =?us-ascii?Q?rWcv/1qRrYeVWwGyZAgXptDhXNVuWCP+TqLkG0AR0x7+jHooFmuRQViFMSNf?=
 =?us-ascii?Q?QqO/rAIqCfkOHOJ2bkqr3MAun8+6Cb89wcdbrMUZNgsm1tx4X5pi3u0Za9Y/?=
 =?us-ascii?Q?SB1SsY/bSBZT8PB1Ni+0N5CtZLE14JZrWXrc34n5R3PqV/95Is/eh/pla4Cw?=
 =?us-ascii?Q?gxMr68vtOM0Zs5dlawTGALVgaZWJm/KHcgC/1BSA5bHQXoOHEDkGwJL0Fu4U?=
 =?us-ascii?Q?phYyGEKJ1uFXKSiXzPJbfpCQzJLkEDW7JUVr+GrlF0+pEjD0sUCoigoQGvNt?=
 =?us-ascii?Q?fkzzGMm3aLrgZyrSFFLXffYFUk76ZytYcM0W2X82wOJvxnUJlivU9P6mU0Gh?=
 =?us-ascii?Q?G/aQc93P+RHHZ/HxWuGhduuyFrASfJhzUzQYo+29/NHwTWCQSsyKXqDNMqs2?=
 =?us-ascii?Q?/I/R3sgxgkXYeJno7Wc0/QxKRL8+AAdDF7u55Wi5eGpjI0FQzkIIpRXyPvlB?=
 =?us-ascii?Q?hLR/AgK2P+a99McUJu5XVItO5X2d57hgyOrhf5JPxVZxCryNWHjRXvC/DDdr?=
 =?us-ascii?Q?93TP8dOiZ/ERGiokesZY6A39IYDsrm+4r5fh52OLe0ZwC0U0zMm4l0/KFbaj?=
 =?us-ascii?Q?mhZKrAIgtUPRshw0vlgpPsCwOCXri37UzkXB+OfV2bh3rcLXdl2INnFRn7pk?=
 =?us-ascii?Q?Zm0Ojw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28243f39-3710-4684-703c-08d9fde1a41c
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2022 13:19:41.7275
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SjC7F9a8TA0YGEgX7CD/KYV2ficUDQitYYO7Rt/KjlZjkNqBz670nyTIZgvZQsXnUZVFX3JSNif2OOuyZLo1IWb9FWukWO20s81JyqgtoJk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3253
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10275 signatures=686983
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0 bulkscore=0
 malwarescore=0 mlxscore=0 spamscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203040073
X-Proofpoint-GUID: I7ujSm0Z0kbDjnPPK0yADMdbAib1r8eF
X-Proofpoint-ORIG-GUID: I7ujSm0Z0kbDjnPPK0yADMdbAib1r8eF
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Currently the uncore_freq_common_init() return one on success and
zero on failure.  There is only one caller and it has a "forgot to set
the error code" bug.  Change uncore_freq_common_init() to return
negative error codes which makes the code simpler and avoids this kind
of bug in the future.

Fixes: dbce412a7733 ("platform/x86/intel-uncore-freq: Split common and enumeration part")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 .../x86/intel/uncore-frequency/uncore-frequency-common.c        | 2 +-
 drivers/platform/x86/intel/uncore-frequency/uncore-frequency.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c
index e4d5a7960234..84eabd6156bb 100644
--- a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c
+++ b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c
@@ -231,7 +231,7 @@ int uncore_freq_common_init(int (*read_control_freq)(struct uncore_data *data, u
 		++uncore_instance_count;
 	mutex_unlock(&uncore_lock);
 
-	return (!!uncore_root_kobj);
+	return uncore_root_kobj ? 0 : -ENOMEM;
 }
 EXPORT_SYMBOL_NS_GPL(uncore_freq_common_init, INTEL_UNCORE_FREQUENCY);
 
diff --git a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency.c b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency.c
index 791af0e287e4..c61f804dd44e 100644
--- a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency.c
+++ b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency.c
@@ -225,7 +225,7 @@ static int __init intel_uncore_init(void)
 
 	ret = uncore_freq_common_init(uncore_read_control_freq, uncore_write_control_freq,
 				      uncore_read_freq);
-	if (!ret)
+	if (ret)
 		goto err_free;
 
 	ret = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
-- 
2.20.1

