Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73C35C43334
	for <platform-driver-x86@archiver.kernel.org>; Wed, 20 Jul 2022 18:34:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229539AbiGTSeB (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 20 Jul 2022 14:34:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbiGTSeA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 20 Jul 2022 14:34:00 -0400
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06ED87173A;
        Wed, 20 Jul 2022 11:33:59 -0700 (PDT)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26KGcpIm024995;
        Wed, 20 Jul 2022 18:33:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2022-7-12;
 bh=KOuwClg1v71ZbayA5IyaVp5ETmHRjX9RmUlnw853U+U=;
 b=fvN81oNPawzm1DeefwJWwvYFnBhXjKEe1/xxWqAzmTB3ev5bbiPePaB+c4g2NrWrc1V2
 RyUN75jCyZ3sAcMelAbE2RvNuQXZDlN9PhXICPADrPv2QZZ4B+I0dwHeqOSrgOeh2OkA
 MxJkupRYkM1YncR1aB3FUZI69d1g77N65A8+oURxcRj5iP42++P/ftQyKC0EEOTVUmMD
 TO52heblOtnG5O7mSII9szLo8FzSBFhMyewvOmsdlhKrPKRec/ytJsBpcsV3+eOO9UgG
 Y27TL41c01kBgrLS9WmXVXbZ1mt74JeVyGmEIc7Vyf35OKNGp+iz1DgtAkR8lRe29qEP pQ== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3hbnvtjgby-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 20 Jul 2022 18:33:50 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
        by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 26KHLjFI039255;
        Wed, 20 Jul 2022 18:33:50 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2101.outbound.protection.outlook.com [104.47.70.101])
        by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3hc1k5wagq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 20 Jul 2022 18:33:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ijcm+9ff1/LLlxIrmFYUpiy+9B3PGFbtN5+iF8K+QxQsxJ9JYUiVRsyz7yNuzzbNiaQ/JeuXs1odgM3dCUIv9oc5rMnBSO1hNGzidvk3HSfvW22feKYxjXH6l1JUQ94VegwwsnI1F12wLkFjhZIyYlY9GHZ1pq3kRGZszMwktAlnOad4GCO7W85p4vKmUfNRtjmnCY7F1c202GJt+PsIzJ5/AvgDpQn3/tHbBh6gnvkSNW4LuP10n+wRnmB5rhuUwtMZ7x/wktwiriBMuTBDVRW7kblPup3PI/BvSGoKHmgqzgrjltpjNfsz2VJ8LKqJhLZSQVe/s+qb4Ok0vP7fJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KOuwClg1v71ZbayA5IyaVp5ETmHRjX9RmUlnw853U+U=;
 b=Y0CJqGOjdxm1yrdnbK4Gy0DbJ8amqvcaXWXi7IbVPmiG1UsfaXnCML0OSL60y5c+i6IIQecsHaFnIpLjxOq0WIA2wDxxPkt2dHmy+BHcM1R8B6OmAYdMXE4A9NZHfFrt786G8U9UnmnO0wPN6SGhRwwnDEHAtWiV8ie+yJpN6l6PxCEzC9QnTXa71XTPED7DcUOLQG/gsyJCNd5RbzDI9WpRVSum38U0b8yIET6GlPnmFOEX+5f0kZqYvrx6GAVdPWUShT7QxkqIRs1aCTOLfeL6KAp1Gt6tk+iIOrKgnXC6jdIR+0LOqXaSCqVS1mXfODAAvsuqRQqcWERRi/q0Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KOuwClg1v71ZbayA5IyaVp5ETmHRjX9RmUlnw853U+U=;
 b=JZdgZSsZDWjXYU7RaS/SGzTNysSx77QXFzKtsjzOPO3HmHzVseQDXYtIm95BWRCNxaG147ZEbCL7ePTgcPaA89WsSCpWJz5CT9bXw/o2Aiod51eGSXs5eCQQaqFqI5tXNyed614p3bSvqvOSiKIdCAUAQqh0FC7p0S+bPcGj90g=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BN6PR10MB1444.namprd10.prod.outlook.com
 (2603:10b6:404:46::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.13; Wed, 20 Jul
 2022 18:33:47 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::24dc:9f9a:c139:5c97]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::24dc:9f9a:c139:5c97%4]) with mapi id 15.20.5458.018; Wed, 20 Jul 2022
 18:33:47 +0000
Date:   Wed, 20 Jul 2022 21:33:29 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Andres Salomon <dilinger@queued.net>
Cc:     Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] Platform: OLPC: uninitialized data in debugfs write
Message-ID: <20220720183329.GE2316@kadam>
References: <YthIKn+TfZSZMEcM@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YthIKn+TfZSZMEcM@kili>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0018.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4c::23)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 586e1f58-9211-4f70-9c42-08da6a7e6267
X-MS-TrafficTypeDiagnostic: BN6PR10MB1444:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KxEksZ3OHVwcEuCG3ieCNMQ55smBYyX9TCT1g+MeU1QZJnnb5ZI4n3dn4PSbBdebjAFS1VPGyuTsj6QDxqSPfo8TduJ63vQrxl1y3Bhq2ooa0V0fc/iw19zd9PrdsmgGIPE4rgsrbXd656hvyxScZNYcPst1DwhK58OBF+RBGkctCglsfIHSGjflFjkei4ru+hTXe+ZSTuo7aC8qlHIvOEC0pCNursIAPFdvjFb0uqM8Zul892pzH+yMxNRD6z1mSb9RNbkAIBPpICTSRhMLxkslXV2j73tU3VkO+GqQHdQXb+S6HHJG0+xRnUuan7Kb93gD9EKBGZLCAX5hoT+gK0cPMZl2J+gIWKGcFQAU8qYPnAk64Kz9cfBK7sdu1PDc2yK/zr2F+Gv6Wcd9xOZjbe6PA+09vGDE/ST6nQw78WCJf9gXxPu6OvMjqG7tr5I89ga12u9EpCbfg1uXpcF8OlAyjdFAvWX9DaZHlvrxlu9CdLgmN5EjoHvK7QaExfJ6fser/1ydXOsSLUoWptQBuWwScBWAgMcI8FUtv52qnXydIVp6C8gl4b3AzXYhGsJJ75pIMXnCy2pWRR9k2SxTz+5Fz+j2/259Cmpm+Ze8KtVXlkqKdaIcdgBysVUHKAApvNcPD+9wRwmsiYFVBF1K4av+P9bcTN7nGBoYl0wj/EHKbtYQuNoM3slA33dQiF2pNc8xVDLgYwLq1ipKf5pLNAEItMaGuqC78wm9stMasVnWkfRtyPRtUmqLQjozC6zSFQlE2WsZR2nNwJIlxm9Rmsi239WOw5WlQ3bnuYa5tsc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(136003)(376002)(396003)(346002)(39860400002)(366004)(316002)(4326008)(6506007)(83380400001)(110136005)(66946007)(66556008)(66476007)(38100700002)(38350700002)(8676002)(33716001)(26005)(5660300002)(8936002)(9686003)(6512007)(6486002)(478600001)(41300700001)(33656002)(44832011)(1076003)(6666004)(186003)(86362001)(2906002)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?q6LO83ygY2bWbg8/XhJ0ZvXa1DyntJp+nRdGNuRVWbWpSJw4Uu0Hk1oSrVIf?=
 =?us-ascii?Q?2s+z+vD21p/YzyojsZlpfA/Y/JIG3sBuWzPPcrahJGVs2dFfHQTYU87sZE1n?=
 =?us-ascii?Q?SjZuWDeUKmoXv7PIFndxFp/q1bUdWIwS/Fu3poC8dAQaU7J2nAeFFxpgQ1Rb?=
 =?us-ascii?Q?4K1t7rpP2zrwhS14oGM099iG1yiC9q35Hvl0HVD7cbGdZpEHTUTV2oun/wM/?=
 =?us-ascii?Q?cG3QOJZIQR/rH8POQj6puv0pkjcNmmJIC0jaUN7wRxNGsHf+TTDtSmJdvacb?=
 =?us-ascii?Q?DVW4MbLJ0wHObM5fL7gvt71BAabZhhwJcDtHby1eukgqNbQRwsGILwSctjGD?=
 =?us-ascii?Q?Cg7kmygYO8qCYM7EVaok+Bn1hO/fvGZL2w+KksPzW1z+1Y/MnXQWPuf/7m91?=
 =?us-ascii?Q?lPY9l5R1OVRGdeHYcIePvc16aBSt3lMDvvGmqOACggto4OCK08DAcRIFDkYX?=
 =?us-ascii?Q?bjLiPAJnHI9oeOKEhObW4lBn1KX2G0p2h8XtHwcwV5tkQYyrUss7UOt3R3Bz?=
 =?us-ascii?Q?lQXWqwgyXdQFNcKEF/qD6PbkG1AjwwiRhdfogy3z0tePaRQV6Z3ZrPlMVbya?=
 =?us-ascii?Q?E9xmcC+0jjaphSnedMoyVDqQQMXpId7FF1oXOfTYkeQ3q9foeX9ZbO+7xTiS?=
 =?us-ascii?Q?MgnP9oq8FT6ibwLNPsczfEvopecxno7nOQBhuzIS/r4DVi4nqZOGUkO6mklk?=
 =?us-ascii?Q?Do/vQdRy5HwACqh1VG0OlKwOPmzAdIAPzsclgpmTiC6hPOPyy8xG0f8Zaxc7?=
 =?us-ascii?Q?SLGANRrL/MmteYLrtKOTQ5HZEVsZKsCQP3wbtFSfDyHSNLmRoX8GIsACm1dw?=
 =?us-ascii?Q?nTpv2e0qqLI7zb0H0O3jTc95t9ww+X/18Eml7Ol0nCmV8trHhq75NnS0BQMF?=
 =?us-ascii?Q?IAKmcANSxM3l2x24r5YCe86PDxhNWgkU3S12ZXJ3fs1PZNqV+sXxC2x+5cVj?=
 =?us-ascii?Q?EbFaxdHAh59Z3jQIklj9eEoXZ5nXdCqgERdNy/UYuohBYz/cJbrlGMSussws?=
 =?us-ascii?Q?yuPiU6jpimeb8sHKxIzww1biuvQlkBcAFEVhRrMNpBOtwdeswEkkkqudGO9L?=
 =?us-ascii?Q?JPwoZoZFisjS/ZAtsuMDg873ko5Iu57a80AD52J2epkbmqlORzNVuUblaIrK?=
 =?us-ascii?Q?ZbjOaW238PgdlBcRok9O71xRbEIsJmDt00adEdTkixTceR042RoQnrZYg4RY?=
 =?us-ascii?Q?i4OckVPJelupFGhOW94rmORNVl0KIaNHT0TxSPUYaaesdVPHIZSHB9VYHBCf?=
 =?us-ascii?Q?1gP4BsXUzu1C346jUwX0ZTXytJBsiN18laOeF9jzYGX8Mda3GPLBNqfh6p/g?=
 =?us-ascii?Q?aFWZqby5VxxrFDEig8f8VSyLoyQX92jxA79fUSTZlmVTE/AwIfE3h1H3oPpQ?=
 =?us-ascii?Q?x5tNnoe50dXHmyRpzDEDR//AEKrqK7cd5V/a53IWLgwwoxix1ef3D0ASMcTh?=
 =?us-ascii?Q?pVQE5OUao/02sxdEtgtcehJxIx2Pgc9vFFY6WsrVazHQknV/UQi5TXVVyrxm?=
 =?us-ascii?Q?Fqu+VY/bc/Tq97mlJm41MNX0fgPJgViE5ihg5iK1rTN3P/KIE42WDe/3LEmZ?=
 =?us-ascii?Q?NyHAYENCqfVLMh5I+BHhsPXNWs6jklUvwTB3PCSHJ226t5Qy5sw+E6M5fNDD?=
 =?us-ascii?Q?DA=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 586e1f58-9211-4f70-9c42-08da6a7e6267
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2022 18:33:47.6977
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gNibHqFaiHypwavB4A5xcfAltP7xQ0DtCtz/qdQbfGw5jvlZuPFB2zk9W/M+DIy48UiEzqjImiQBworlmbFY6w1fwLDmsm4/wMJ96KBhC9M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR10MB1444
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-20_12,2022-07-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0
 mlxlogscore=999 malwarescore=0 adultscore=0 mlxscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207200076
X-Proofpoint-GUID: XQEeJmb-dUtWDdql-fFWKktsRUMibrCo
X-Proofpoint-ORIG-GUID: XQEeJmb-dUtWDdql-fFWKktsRUMibrCo
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, Jul 20, 2022 at 09:23:38PM +0300, Dan Carpenter wrote:
> The call to:
> 
> 	size = simple_write_to_buffer(cmdbuf, sizeof(cmdbuf), ppos, buf, size);
> 
> will succeed if at least one byte is written to the "cmdbuf" buffer.
> The "*ppos" value controls which byte is written.  Another problem is
> that this code does not check for errors so it's possible for the entire
> buffer to be unintialized.
> 
> Inintialize the struct to zero to prevent reading uninitialized stack
> data.
> 
> Debugfs is normally only writable by root so the impact of this bug is
> very minimal.
> 
> Fixes: 6cca83d498bd ("Platform: OLPC: move debugfs support from x86 EC driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> The ec_dbgfs_cmd_write() function is not great.  We could copy the data
> outside the lock for example.  But that's outside the scope of this
> patch.

More relevant another improvement would be to replace the
simple_write_to_buffer() with a check for "if (*ppos) return 0;" and
a copy_from_user().  The simple_write_to_buffer() function is not
appropriate here.

However I can't test this code, and this is not really core code so I
just did the minimum to fix the bug.

regards,
dan carpenter

