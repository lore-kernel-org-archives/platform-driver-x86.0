Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50B81C433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon,  7 Mar 2022 14:18:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236104AbiCGOTw (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 7 Mar 2022 09:19:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232301AbiCGOTv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 7 Mar 2022 09:19:51 -0500
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AF8D3A184;
        Mon,  7 Mar 2022 06:18:57 -0800 (PST)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 227BtcwI006652;
        Mon, 7 Mar 2022 14:18:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=VqtIgnutTGKQGJfYXkJ9tsHS9v4w9he3u5/HMIT6Ge0=;
 b=yQ/L0dMK7skZz/xQTMik8dn07aFywtwBk4i/uwuI3Taf83jD8IW6X8JKJSi+Z4TN2fKp
 mh8kvxr9rkDEhtTkG7hnfINzlKV3C+AMS1ivokLV3sER1m25G001btnN9mwq8f1ZrIC8
 qFu87yKjNrsH+DkjacqDzTy3U91NVYHUR3giri/Il8/w1tKkBThjDGuKlDHIRuHlE/bA
 BIy8vP6H7WTW02gEb3vS/z3CHmL9Y0/lY8s59Iq56Bp0YSao38hXOiFZtjtVx60yu98b
 gVTTUMmfQVbKC1c6/i20gyW0B6FYfnXfMla5JsnamhpV87AuzZzB7BrMQIHJgQtv1vu1 gw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by mx0b-00069f02.pphosted.com with ESMTP id 3ekxn2bxbh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 07 Mar 2022 14:18:48 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 227EFFA5101010;
        Mon, 7 Mar 2022 14:18:47 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam08lp2048.outbound.protection.outlook.com [104.47.74.48])
        by userp3030.oracle.com with ESMTP id 3ekvytju59-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 07 Mar 2022 14:18:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A6I6AA4Nt5gGgors+p+WCAs3UxDNVKBBL+/x6r7AyJ/BcfTOUMBdn16W4hpYmFtjbRGOXJwBg4RbAuybcUan3dBku0td99GEaCdmrfkiDkX4jd7u+Jq5Ak3bD/Vt6vVLBy3K/OG71JPWRN5+1lcwvPxysgxiz5Xqc+m280Fx3r9hwyK+FOqNqL8mtKR1kvO7y4awfTXQdd9y0a6zERhZtiyMiJlO8FQPuY1bQgoM1npYSdObOfyzCGS31p+xn97nUtbYtZRzhJX8BmGisUOwowL/6WDSZFQrXIMshUTbgXYuCjcH5Y8YpS3YU1kcEsgcHojCBkCGwHJp3nKU2MAZuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VqtIgnutTGKQGJfYXkJ9tsHS9v4w9he3u5/HMIT6Ge0=;
 b=h0HjEV8DHXuYNs2V7gg2rxGtIos3ITVs0+saYVYYVGlUC8u+Su2UQezcnwpNHtbnEdvgTGLo/mvzalngJNEzfDVr6v44EyrlHUc6YDDKollnEW7sDzVNxHo3FcN9br0m+w8A0gXRB0B5jpUw4FnwU3dO0rHXL1YKflL+1igPbPrA+an3PFfmSsS4YWTb/LVNUD+H05pKlon+nF2N70fULulFka87xiX6lvxW8f9F/1PnrOi2tJ8Z1b4HiEOGEPgq2aMPwoDwsJXuk0Ebfw2RpNsEDqEPmERFEssmnqO8xWYIlGiEj9V+xWsUzL6rfDwDQrgJezKB6ZhmhP64Yn+f4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VqtIgnutTGKQGJfYXkJ9tsHS9v4w9he3u5/HMIT6Ge0=;
 b=qdyK/NeoHkEKvcmydb5JD0322vo2g5FD1bDfgbWopTccAzzs7xm4rvZ+vhPjXlmgSJcB/ZOSEbL1o6Y7NXTJMK+8eUxx/iod9Z8xNQlNlFeqh0KCzY5KPNWtCIJIS3H+fP32298JPF8oJDzZ0xvWstFgfofb9++sEXfJW0+3NRs=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1502.namprd10.prod.outlook.com
 (2603:10b6:300:21::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.15; Mon, 7 Mar
 2022 14:18:45 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5%4]) with mapi id 15.20.5038.026; Mon, 7 Mar 2022
 14:18:45 +0000
Date:   Mon, 7 Mar 2022 17:18:32 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Sanket Goswami <Sanket.Goswami@amd.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Mario Limonciello <mario.limonciello@amd.com>,
        platform-driver-x86@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] platform/x86: amd-pmc: uninitialized variable in
 amd_pmc_s2d_init()
Message-ID: <20220307141832.GA19660@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZRAP278CA0013.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:10::23) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cd2155d0-7ad9-448a-7938-08da00456364
X-MS-TrafficTypeDiagnostic: MWHPR10MB1502:EE_
X-Microsoft-Antispam-PRVS: <MWHPR10MB1502C3614C6345AA69E6461D8E089@MWHPR10MB1502.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ewirMoiNZjHF5kg5SFQ0RTuNkrhNxhUV4V1tLLj2pMc8XAwnaWC5iZuhl5gzV/D/eMNj3TX/62/BRR9B3mRyfYvtGrgm53E9pXXKQUTq8eZH3RbnbpNl+MLuwUEjxbhyviyjGYknttqPkvHdoZ5LoFkiVS8yrc9C0c+JxGOV9c2ja+Sd6xtuacnIlJ18I1cbj/kGN6aJJxTBwJGkgrsTl0ZImLyP5dfimdNbU65m6rKnaSVi7VGj5u2o/nNqVhXaoX04VeW/FNjlxyfpFfIjSpfxxaTcCLtVIZ39BBJVSbQLxD3CpVcqBw8UyYw/gDuwV/IboAWEWgRsBgxrn0Olht3t5xenoozhGM62z7UNvjWIH7W6fpHyzzBXautqftimq+sB0TclmTYgRvT/ZNb3a+twCKYh+xyFM8WUn7JlJQfmgduLAa0aYZLn1fWRMyHnMuJvmMmHciVX2mSYsOXCpREwNYnZZkTmRajI/KnKhgw+FRllOC9s+5tSaCMmGUyCW5pphmfv9ZsPgdC5OXKfWs5EB1SwU3AOwBqCzZRb5JMGmlaMBaV/dLkbDlWPOHPEnJHgOH5n9TdkdlgdZb9+fxREGyRxeEbMls4XY3y+Mw/o/VuYtM/A/U/ewfM6e0iR4vJtiDdTSi8xOrPxkXRgD7GiLww9oE9tbztRdt3IMduabmHcYxsHy72/mSzrcj7ZRuzihGZlG/BowWHckhFW5w+Y+N1cjTrURtYhHLt9qwMLIurRo3W/dl+d8l5v1Fr4
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(5660300002)(66946007)(8676002)(4326008)(66556008)(66476007)(38100700002)(38350700002)(33656002)(8936002)(54906003)(110136005)(316002)(33716001)(44832011)(4744005)(2906002)(9686003)(186003)(1076003)(6512007)(52116002)(86362001)(6486002)(26005)(6666004)(508600001)(83380400001)(6506007)(70780200001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AE0asfcHF4V6gYykrZl9Dk2D5I/uNWTtq6uVOjSIFWF5lERWORA6vtZfFV40?=
 =?us-ascii?Q?BebdX42WR8S009KtEfcpHJybBJHbSuGTHi/UqPOQlHOy/gfXZbd/p1yhdGU1?=
 =?us-ascii?Q?i9NxZDEDtKW0xVMPPYzL0JAXTJdZ53KxDcBlxNNLtfryAUuANGAyTiPp8Dfk?=
 =?us-ascii?Q?JAo+E0uPFQLIMsAol5CRAzo+r/k/MrKh8aCbPRmYfpHVNKzazPyOZHFDnjRt?=
 =?us-ascii?Q?MIkN7QbnudlSAs9g0ME+D0hzGJlkCgHMqsv6pVF7EAppmOACeRhb9bcUWWOO?=
 =?us-ascii?Q?9U/2L5MpqeuIgjT4H8b9szhjKzSGwAnlhjrZXOgwI7owbRyGCukKr5bDHXVI?=
 =?us-ascii?Q?8RU2daHXGm6tEZKDrG11X0CUmOoGPhEgs4BnEUJnyYJt5PgFMYsOUvijKmtp?=
 =?us-ascii?Q?U0/Mf3YH+zJ9+M37TKaS1YjOFxljj/tGF4CxDA8rWSN9jVg3A0qoyS4iLdMX?=
 =?us-ascii?Q?eFna88ooAfMTKok7pvxwPxd1i4TiL2svkjfATNV1d0BYdbuwV8sG2SbegUA2?=
 =?us-ascii?Q?4KnbcglnDz99bP3z6B1FSAWXjJ2blf7/IqQZYfCWwZjwrWHdQs57giELT2zq?=
 =?us-ascii?Q?G1oFPPt8RAB3VG7aAyuGSOJwiGq3qFOmCdfOIwQbL8g/Ga5CxM8U0z3R2+lE?=
 =?us-ascii?Q?y7Le+BXVV2Pf9nQSiVu7fkI+DtDV5b5Qetg0BErjWH7ZrPWZbB2lYI4U47px?=
 =?us-ascii?Q?j8Rnryd7uEP/k0Nl5Z7jNsoRyDfi96xfqXiElj4ZDDZj9/oB5x27lHVD6RZA?=
 =?us-ascii?Q?buKYWBy815VZE2qEshqUxwjfdca662LyNS53gH6371PbYFD2x8zAmU8O7ISX?=
 =?us-ascii?Q?dtepW+XD1kSUWZjfd8Qvm4WCpGICaREPk5fmgD1vUa7mNu3KCW1eRflf/CNs?=
 =?us-ascii?Q?PwMHY/ERxS56NLTNrgrWW6kdN7y3xW7k4u3sb/VnyVK0jTutzBbIe1fn0yKF?=
 =?us-ascii?Q?0pcqcQfk0HUYYubwt0Du+WfxZc5Lv0Pza/CO8GWtPXkxYaGmkSWv31IZWa4K?=
 =?us-ascii?Q?2R7cwh4ilkWc3JpcblZ3NlsDXnbNzCEEOZhAiPAgUPoS44upfCiIzc+nRjtq?=
 =?us-ascii?Q?SOSSvygbSZTNUNTPFAb4xNGXd8lEfNiuDXsfJpxUj0yaHon1ZQFuCOIfwngY?=
 =?us-ascii?Q?+tcDJl1V4YXDZU/JIybQZ87xy0v8c8P6cCGqNCAEfpcqaHgSKTjmX+hdkkuO?=
 =?us-ascii?Q?WsKxp9RqJYDknW3nQFCVMFsdQQQ7XblVTkseNjWQgCMgHaS6yitcl37FLhJx?=
 =?us-ascii?Q?nBq2EYJa07G1Bu/Ggf5jjfrhtT9b+myU8hYl+a6Kw6s6vybDstkqLnSgRgoQ?=
 =?us-ascii?Q?6LqdodZ6silSVAfRltcZhQYhhBNg7bhiFZjvTx8zZL3A0HXx3Jj4OPc1280w?=
 =?us-ascii?Q?wY/PaZtW5itsE4DGmtYSUP3a5B+I5FgRWkNFThLNyzaK0aVVGfyzJa+dGu6K?=
 =?us-ascii?Q?S7crgApvGt3g8prwLMJVy89iENA9DTl/FK61KTIBkRhIBh3ym6kl7fltpAXT?=
 =?us-ascii?Q?pBRnzPn2vSgJtzIFGZWcfv1J6mK9CIjTOC4fLpwugQbSHmZsqnsRV5Ao/l13?=
 =?us-ascii?Q?byhK4iwxaEiKt9iEQKwyyiKDe1EikU05ha6ouGhXuopH7vApslFTmlN7bjYk?=
 =?us-ascii?Q?gcVJxHUs7BodWZ5W+ckYzNGC98CU+fv4yDqeJbYliLOs/8E2bUDbIcAAxadf?=
 =?us-ascii?Q?QL6wmA=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd2155d0-7ad9-448a-7938-08da00456364
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 14:18:45.0212
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: enHerj56OJmfuvPxZWBJBaj/85a1WKoJoImY7LCeOpji/tJnaEEduS6Y1RO3qhazC8wqmkJ8Jf+Z1HzDLtbBJ8qizBf0tBqFsIH/XisteIM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1502
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10278 signatures=690470
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxscore=0
 suspectscore=0 bulkscore=0 mlxlogscore=999 adultscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203070083
X-Proofpoint-ORIG-GUID: FJkKi8OWgjdfLB29MRf09rxvd-C1POfp
X-Proofpoint-GUID: FJkKi8OWgjdfLB29MRf09rxvd-C1POfp
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The "size" variable can be uninitialized if amd_pmc_send_cmd() fails.

Fixes: 3d7d407dfb05 ("platform/x86: amd-pmc: Add support for AMD Spill to DRAM STB feature")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/platform/x86/amd-pmc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
index 425a86108f75..fc0b4d628dec 100644
--- a/drivers/platform/x86/amd-pmc.c
+++ b/drivers/platform/x86/amd-pmc.c
@@ -708,8 +708,9 @@ static const struct pci_device_id pmc_pci_ids[] = {
 
 static int amd_pmc_s2d_init(struct amd_pmc_dev *dev)
 {
-	u32 size, phys_addr_low, phys_addr_hi;
+	u32 phys_addr_low, phys_addr_hi;
 	u64 stb_phys_addr;
+	u32 size = 0;
 
 	/* Spill to DRAM feature uses separate SMU message port */
 	dev->msg_port = 1;
-- 
2.20.1

