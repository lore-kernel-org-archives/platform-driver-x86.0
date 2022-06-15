Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 298C6C43334
	for <platform-driver-x86@archiver.kernel.org>; Wed, 15 Jun 2022 08:11:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229460AbiFOILb (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 15 Jun 2022 04:11:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241973AbiFOILa (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 15 Jun 2022 04:11:30 -0400
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAA0F1E3E8;
        Wed, 15 Jun 2022 01:11:29 -0700 (PDT)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25F6raWQ013333;
        Wed, 15 Jun 2022 08:11:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=RVYgOEYTaEeDcQ9JRXrd9YyL2hLeLNH5IeEuZ/Uz/vc=;
 b=wWfnazgQHc22hjKmEZgnEuud52abKqHAeneU6LmVpeFiw54pN/sl3VhFwzsqOou1X4Ic
 vQEHFVdqvn4les70Upl3KGkvclOeQFpSeGheAC0tZxUNlii2DBgTDb67M0yG34LwPRJF
 0dNQK/btnbxyLV9cTMjQuwhqAd/qbwrIvBkwlmv+ubUV/PUDoFfEfly5S6Ye14B3smdI
 1+fCOEewLbNVxEiXBBw7RLMx57P02fduRV6mE4/LJmrbO+5ay7o02NduUevjmRL2qO6G
 dmR4gvRvxoAB2URTNR8S5jf5+j82VkXIa3dXae1SBkd8AkvabxmZj38tKI01cOE4eEys kA== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gmkktfvyh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 15 Jun 2022 08:11:23 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
        by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 25F8ABbo037476;
        Wed, 15 Jun 2022 08:11:22 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2108.outbound.protection.outlook.com [104.47.70.108])
        by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id 3gpqq12mqu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 15 Jun 2022 08:11:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TlQTpVyZLi7V/G5SImE4nZK9uinEFzugg7C40XDrRCY6gZDv1zZSBV+m2UOr9hqZJx4vu9y2V0B0j4hgm1wnW9BFtYx06PyVb4K8sqfVAXPjB3g2GQxNn2kz9Hrw2ffUHQ7+tmo9HqSSBKYOKWYjKI1iej8yk1DQVW9aPnAfYRRJ7mqna0wmRRIvatXRBCUA0zBH1w+LiFXYg/NVbm9vJUI4wsDsX0uY9kRcFB5K70o/EmgWuau7C2Z5ZuUtRi5L073B46U4Inrww2nn3Ge16zTYLaQeplwv57u7ZIuenp2BZsYx08d9JHthhp+jV0IeMDNVriHLfBU+5jp6wsZ8MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RVYgOEYTaEeDcQ9JRXrd9YyL2hLeLNH5IeEuZ/Uz/vc=;
 b=HCRaEzIXAo05cuQiNSDJNp9TR6a6hq/UJN3eoUW0obDQiY2g+1BfXCHrYLmaUWwBSYW7zXXGu8R5nnH2LfTNmQS7WYC+Gk4/ARmdX6/Umv/kswfpw7z5JXvpareFxP23f5gvCM5JwqK0SxhhWk2iouwtquig4Mdil7KTT951z1UhESLrW+W06I5CJhQ8lETF8zqcUR7dqT8nKScRi1XGU4/Spbsf9OiEAvy4717Wj0TSJYkT19xdMVY814N8Gdra6wgzTaurrhFtVs5etP2wFEJq+XzQDICXEU6Ojc4fDNPSGbiEwNWV5equKoXAQsnD0Qc75AXL5vdHgGwLJig7tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RVYgOEYTaEeDcQ9JRXrd9YyL2hLeLNH5IeEuZ/Uz/vc=;
 b=idvDM5It2+dane0zKrL/NP9OnldSYxY0ZE1d/8HL5mNQpjLsoJCtnGYnYeUSHzIUHILqZ8uJhfqay3+ojRvOqJyo8O/39+jPZkwzTJE9UilLa+AV31jtQjoZGLN3+BALuBpOxdGAI2pMjn4A9cRSHFDZNeLdUBtrhdixaaSXGYI=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CY4PR1001MB2264.namprd10.prod.outlook.com
 (2603:10b6:910:43::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.19; Wed, 15 Jun
 2022 08:11:20 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b%6]) with mapi id 15.20.5332.020; Wed, 15 Jun 2022
 08:11:20 +0000
Date:   Wed, 15 Jun 2022 11:11:07 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Michael Shych <michaelsh@nvidia.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>,
        platform-driver-x86@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] platform/mellanox: nvsw-sn2201: fix error code in
 nvsw_sn2201_create_static_devices()
Message-ID: <YqmUGwmPK7cPolk/@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-ClientProxiedBy: ZR0P278CA0077.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:22::10) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1b5b6fbf-912d-4cad-d85c-08da4ea6a136
X-MS-TrafficTypeDiagnostic: CY4PR1001MB2264:EE_
X-Microsoft-Antispam-PRVS: <CY4PR1001MB2264B81CA7B588E9F49671028EAD9@CY4PR1001MB2264.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HbWXuJ8w+XiK0Vtqsd8svtWL+akOGF8lu+95RQPxXcUVB0d6B665HeT063P/3oYZ98I6qU0UxrenW4Hd2LzzoVCDqRiRtsvGrNNQSjCCA34BSYpcE/+tgvs80eeNzIzCqeUJoyW9yPrOIzkJlzCSBF3DavAQgy1OqjbKZO/Rs3hX2SfWZwncZH37EnXrRdC4oYL7byeBRK3C0klfix3rc1MuJK/dNnBe9DvHNiVXq/6dA4wov27jLZtcwoGCWT08rR+iurY4t6xRh7lZVY7EgduAFjo0IhhMIvoUlZP3QcBJt0OtpxY7RqUoJhF2v9watNYuHEcQc/irH/JJ2l62cUkhGY+6xJQQ6AyZs0VuSNNhNC5b/7Z3IoDjAUbJqlk3VhBtRUqADhxyFqMb892e6MckKTSgjXpMkES8NJku7kpXjMEMxJ6qieA7fBd7eoD7JcGY+WMH3a/W+lwrnkV4LI1/KS9l1Nfwg2YFbETYq8Ynin68mvMz9AnY2vfd0JzZuGxgKVX6CqlEYvRHMa4Nya3StF0UGIIKDL+t9qrr/2YXHuxYDSrwv2kKOWqr7Gp7dxXOLm7ldrAENA1R/yzEL0ZLcGKxdPvT0vts1Dl0zdRLwlSfdIwMT5bJhrjBZRpBvAKPS/MNU+eRkMn1rv4ow/4V5bjDmOQNgQhOVv2MauQzMnuUQW8aK+Hdbag86gJzkuKdZrykeCwf5OFrul3C0A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(366004)(52116002)(6666004)(6506007)(38100700002)(186003)(54906003)(6512007)(508600001)(26005)(9686003)(83380400001)(66556008)(5660300002)(44832011)(8676002)(33716001)(86362001)(8936002)(6486002)(2906002)(110136005)(4326008)(316002)(66946007)(66476007)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LI+Gc1mWh47LIQWvW+DIuXyeNrBpCnr+/Bf7E0ck1278rteOdr20LOMlHv0j?=
 =?us-ascii?Q?GnDUDf/e4QmCgaH7TwzdAhfzCLQhccI02NMIZblc46VtKOmWc9JRhbTWlcGw?=
 =?us-ascii?Q?OM4fnutliRGD7qIFr5MVSMcL6eRjsvC6RPxuk4FliRAT2OxRSepU1fd3KWp1?=
 =?us-ascii?Q?q2ZI7nRTJzulHSiir6ceBADsZOgmQWAEgpy5hbWJnkRhY+CijUTF/GM6tVjs?=
 =?us-ascii?Q?UV0vDDxOgtSgahFNp5HOrNy/2MdV3pnkFuhPbco8EXXkjYgQplflcQYggH9p?=
 =?us-ascii?Q?fzIPX2Sm+AKwod+3f9gIpzS7H+LMgVLaXM1g+ibQZo20kxanHtaFIYcELbsy?=
 =?us-ascii?Q?GXatLUZvuksZ255asPf1lIEi+fpShXwWzk/5nlx55qgUbdZXzx6YCZgf6FZJ?=
 =?us-ascii?Q?BjQsgyEYBw5FXu1StGvGYaVXrC1lP2mYVWWH620JIj+Ebn5mcAY+s52mxZbS?=
 =?us-ascii?Q?d6IJAG21HXmUokyVhQS06XkHsnURieVzV7fveW/tKqilDmznBA09cpZlM94O?=
 =?us-ascii?Q?9yk1EJP1aG71uXAWOrEZde0HnT0cWOTEbcXeLdqxRf8ioJ5/zMc8OpoG7+9q?=
 =?us-ascii?Q?ntLcRgYwI8AoW1FvUPNL3Ry497wHuZY0o3RKT+Xi9j/GbfOByJ4xqEaZY1pM?=
 =?us-ascii?Q?hYcYtWLpgrwWqmlksRfuexpFe5QNDN8xVey6bD6I3fO8JpvFf2gowzlxYQTb?=
 =?us-ascii?Q?7QMmPyr6MfA0hY6kAf7xldr2dLxzYlWblP9KIAB+81E8pPLrLs//NFFOeYkz?=
 =?us-ascii?Q?dHN6izzX7xC+nrkIwEM3fnDaVu1udPKuV5elIpdDqJPgx/MCj73kZib8wb74?=
 =?us-ascii?Q?P2vrJIq8F8YLH6Lq8DqfC9rHv44vPFMNJVXZzSgS+6Sxzj22p7ztB+MlRLxp?=
 =?us-ascii?Q?v7Kg5iuD2KCCIkZsi5Lq1URxWOA/FFXpRo8utMgqU+D36DWt96PelyjnJ+P7?=
 =?us-ascii?Q?sZAvhGa+e7nIo+cUwRQUEOrBwAoCh7hxcm0BIefjm0R3C6cuzMHYd5DJBaAk?=
 =?us-ascii?Q?w1zB9JAU13eEWZjhimPd56paDuOOb03hgOsgb0IoTHdNUQio0U+cbaF1STMt?=
 =?us-ascii?Q?YHf2nG9IelsI/Lc8019NB43ateLIVxu8RS/hOJx3DDupHVbE3YhVvvYurxCf?=
 =?us-ascii?Q?clvZTG+yyLolzTU0W01shL3NbcKS7KyPL0LGU4/A4SwUeCYE8fw2SRJN+jOU?=
 =?us-ascii?Q?uumcnPegNBGb0hF/BG44Cs8J1RF45qe7jbCGt8pev3jN9X8TShlKh7E9BfK9?=
 =?us-ascii?Q?VOdOvzQQyPyKTer7haIHyXzu4yrGCn7v/kiEa6jWTd+BAtRTHYipkpyc6mUq?=
 =?us-ascii?Q?bSO3IUZ77qmRQKEv4K+NS6EEbx1GtTkk+q/Sw/hkmUbCIGj6gAuew+VuDvSY?=
 =?us-ascii?Q?OqOR8xpXcgUwpRqlFqOyeFziARf1b73CydRBB21S/g8X8YSsdOS4pQqJPwQe?=
 =?us-ascii?Q?oX2x8xhT71JWFY0nAa30Ns+S1Q6PDL/QJcWDzQY5tUSeI4RdA6BREHbU5X3X?=
 =?us-ascii?Q?rmof6HAh85a6GW7HapuAVlRsII8NqEJiPTdvqcn81NakXl704F8huei7LAgj?=
 =?us-ascii?Q?68vAJwil+Xy4GAuL2mJBzt0itKzddU1iLLCic7VQM19polDywK3V7COJWBNC?=
 =?us-ascii?Q?lOEmfb83UJhDxZZ1D7Pq2kCCKN/VL6yVstatC8AeXEJtzt6Zc6ZTPolIERSy?=
 =?us-ascii?Q?keKHNkpv5PZwwtADBJTzItb4bxPrUVjHniP4tbggef/UwC445GrrOJx5Jjq2?=
 =?us-ascii?Q?45XZhjEifZDURMz0di1RRdD4Jc/ORyw=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b5b6fbf-912d-4cad-d85c-08da4ea6a136
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2022 08:11:20.3860
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tks+BGNIkmpTxkyX4r002OUPulx9h60bigweifFS8cwHn3I/jhiu+iJfoMuHfvzPCLjA3aSNQm1MxTYS0lgq6w0b7PZZRwX/awd8yK6f6PE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1001MB2264
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517,18.0.874
 definitions=2022-06-15_03:2022-06-13,2022-06-15 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=999
 bulkscore=0 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206150030
X-Proofpoint-GUID: ttcBpsE-McbFSlEeMv7pIc8_e8Ope6yS
X-Proofpoint-ORIG-GUID: ttcBpsE-McbFSlEeMv7pIc8_e8Ope6yS
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

This should return PTR_ERR() instead of IS_ERR().  Also "dev->client"
has been set to NULL by this point so it returns 0/success so preserve
the error code earlier.

Fixes: 662f24826f95 ("platform/mellanox: Add support for new SN2201 system")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/platform/mellanox/nvsw-sn2201.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/mellanox/nvsw-sn2201.c b/drivers/platform/mellanox/nvsw-sn2201.c
index 0bcdc7c75007..217e22e81c1a 100644
--- a/drivers/platform/mellanox/nvsw-sn2201.c
+++ b/drivers/platform/mellanox/nvsw-sn2201.c
@@ -890,6 +890,7 @@ nvsw_sn2201_create_static_devices(struct nvsw_sn2201 *nvsw_sn2201,
 				  int size)
 {
 	struct mlxreg_hotplug_device *dev = devs;
+	int ret;
 	int i;
 
 	/* Create I2C static devices. */
@@ -901,6 +902,7 @@ nvsw_sn2201_create_static_devices(struct nvsw_sn2201 *nvsw_sn2201,
 				dev->nr, dev->brdinfo->addr);
 
 			dev->adapter = NULL;
+			ret = PTR_ERR(dev->client);
 			goto fail_create_static_devices;
 		}
 	}
@@ -914,7 +916,7 @@ nvsw_sn2201_create_static_devices(struct nvsw_sn2201 *nvsw_sn2201,
 		dev->client = NULL;
 		dev->adapter = NULL;
 	}
-	return IS_ERR(dev->client);
+	return ret;
 }
 
 static void nvsw_sn2201_destroy_static_devices(struct nvsw_sn2201 *nvsw_sn2201,
-- 
2.35.1

