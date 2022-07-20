Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88873C433EF
	for <platform-driver-x86@archiver.kernel.org>; Wed, 20 Jul 2022 18:24:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229661AbiGTSYF (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 20 Jul 2022 14:24:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240915AbiGTSYE (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 20 Jul 2022 14:24:04 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DB94709A3;
        Wed, 20 Jul 2022 11:24:03 -0700 (PDT)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26KGcx35001728;
        Wed, 20 Jul 2022 18:23:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2022-7-12;
 bh=7zyxY15wi3RVKCHxh3s9IZH6VQ2eIIsz0L8xWiQWOFk=;
 b=zBDvVLVHBHvsKb55k1Dt2Tr9mwqIHI8n6L8crvSurjTbDQek58AD8Mui4Z0cCUc5WUWL
 rn1neuE+GKR7aWwO7Cw85EFI0MCFeYOo2C8Xy7W/p/eeUSVXG97MycWmsHsctRKE8+yD
 jM02qA6B/zotqecZpcm5dRk9Dbym3bmVtK67TZ8TBTxZ/5ITJF3wTH99tzI5muJZl9bD
 k513R7g9kdC76C/RIifHOAin90+taZnQZnmQBXMYAllZtgc1zj+gPmFxpOpSMtVI/Rkt
 7O+serUfD9Hctb7MIA7dqyTO7s6B+aQid0wzwbiriaKN7X6Oo9lGuTlLI8OXzMF635lj pg== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3hbkrca79k-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 20 Jul 2022 18:23:51 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
        by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 26KHnYRI016443;
        Wed, 20 Jul 2022 18:23:50 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2175.outbound.protection.outlook.com [104.47.59.175])
        by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3hc1enq59f-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 20 Jul 2022 18:23:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NsZWMiDeiftYUuDZG3ixWzNy4xpSn8QZWO4Sfq12JPVaE5Sg5HgOGmXwefJQmuDl7WYFPCz+hzmOmOnmdiRgrtWgr30r11Vz8LGIjr4ixa4IT3UQlFSJUWSwDTcgEpfENjRGN/0XKsu2Cb6ciYKBP3hGLn/aTL3MLteh8+fKHRxjgLFnLZXKDcu1PwcEJJ1tFz0ueqmnaUAxHOIyUxBFpFf0jvd7tBuImLXDPmniZCDgHqd0RAa0wF4qKqK3yh2anDPShkIbBhmSu5Z/1y+ainTTO60/edhyHtSZ2yNjMmauPqXtbLRuT3/eQaslSs8r9b5IkFCv+aQ2rJSixiBfsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7zyxY15wi3RVKCHxh3s9IZH6VQ2eIIsz0L8xWiQWOFk=;
 b=oR6Yl8Af6JjT7nustOPxiAQleCICOYo5gU/QsOjQnYFhzvPXZKSSC9PlYSxvVa9hIInQkYbVGD1VQKkigOfZJ2NPYoo4phdlf3jQL6CgQsmUFF2hgXTT4oJFDJ1v6vcsIxivTMd3MH99Hde7ruQ21qVY4DIa3afKqv/maY9S20kYOjIa0gyhCZY0W9M4fEmrTI9R6lubgi4xxL/zMjNy6+e1UFKdwP9Anh1+kR5zxXcQzPgi8fD1ZV3aNp7+FvowCH1Aq7SGRjaCesOknNJ0Czhp2qt6SWUV6nvfa2Disn0vkn+n7SUM2oz6dTpMJaPGQPaXC7rf/f2WY1S7To+3/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7zyxY15wi3RVKCHxh3s9IZH6VQ2eIIsz0L8xWiQWOFk=;
 b=e5fT/1fzT0Mh9I2rnlOSAY97nD3emhDfoOO0FnCN6Wb1C+ieKFG18FZhcvm3ktWL/V4jfGIBtW0rotGiQesLN9m7cTnBqHeein8aCfdEiN3RK/jK+AmP/AyvewrV2b6HH5tOAbYZssCYWcFGUaUuC+OlYMhLCtSWLJqnrJgSuQg=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by SN6PR10MB2688.namprd10.prod.outlook.com
 (2603:10b6:805:4e::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.12; Wed, 20 Jul
 2022 18:23:47 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::24dc:9f9a:c139:5c97]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::24dc:9f9a:c139:5c97%4]) with mapi id 15.20.5458.018; Wed, 20 Jul 2022
 18:23:47 +0000
Date:   Wed, 20 Jul 2022 21:23:38 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Andres Salomon <dilinger@queued.net>
Cc:     Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] Platform: OLPC: uninitialized data in debugfs write
Message-ID: <YthIKn+TfZSZMEcM@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-ClientProxiedBy: ZR0P278CA0126.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:20::23) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9240e274-a7cb-436f-0961-08da6a7cfc7b
X-MS-TrafficTypeDiagnostic: SN6PR10MB2688:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: voxdQVeCjS31FgLjTuji2K8e38ctFvFpG+bHQFYmfxOMo3ynW4OLYwsFr8Vx/prgAveutXAgCOYv0Uzms5ZhyNhkeT4p5tuSVQWvi8CHsKFWzNa4zwSGHlN3VvuXkw0j2N8U+0nkkSbhPpWuJ9mnG83L0XuD6dfBdOdbODRDhph81Zw3izGhdAWntOXKtMOG3eMNJFBpl5wXpmxIYX3ENfCBw0sFJNYpxFuaTEu1TE6C7F4TcvmFYJklbebLv7PCdDWz6iONCCyfVjaSrMpFyCd8dVWvfGcbbZtakS5t/Yr15LJK8A2CCQNJ7Uc0Mfz+Y8XbJmK3+/sjLfU5iZGgE/lqm4DlSyHaJ/cFrl3cq93rthYGrU123sytvqIn5nZ4QcZqZN/Xzf7N6Hw4HuLAS5Eky2M2fa9JTcbMmy2ceWAQGIfLkNj+mtGv/4gEskhLKwFDSCxJdy5FNITKeTEGU4LGfn7oy91tTw19Hf9BgLjhJ+RKX7GOF4v1cOEYkQtUAsUl+6vEplRFIujTIZoxzuqmlh8s3TsxAoUvs1svODil4UKu4gpy12L5NL6Vuh4uEo2bMd83LW4BxJ0tDd1S4tnK8fpAxo7BwXYiG8M1BIXmSgvEbSidIE6uYRo8WrK+/QU6ZuQ4paZVgVIkayj/9ZY171SkN4VPgueXnqqR7LDUnS4gLtYfQOxC56TZ++deMTPLIf5H4PluWwaf1+x+9QIjwtuU56PY4RVRv3FQy1K4YIjSzFu0lGrBQd/0WAyYrOJVT5q4ZpsSTCFtDitgI6wxOLUc8LTCfhegAjHJe6X8YPVSe+z1/G8ZRrnCkBAnEEOJu5p9wHprl5yFutqBUg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(39860400002)(346002)(136003)(366004)(396003)(376002)(33716001)(38350700002)(86362001)(38100700002)(478600001)(8936002)(6486002)(5660300002)(316002)(41300700001)(44832011)(110136005)(8676002)(186003)(4326008)(66476007)(66556008)(6666004)(66946007)(83380400001)(52116002)(6512007)(2906002)(9686003)(6506007)(26005)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?46iQikEY7DV+KKNaZ58NXQvxDNEnQlFY3f32tDFzgc8BZyJ6cHiB9amsDWnG?=
 =?us-ascii?Q?5WhmHs5jYfx9NMRqy5vpQO8z7BMkQhdZ1n6Pl2zicbJ6RfAX+Ad+bL79jn5c?=
 =?us-ascii?Q?QboSEIgwVzPRo10amlnMxjKfOky7YX7jFtpb+iBsDBb8ltVvLZUXIHmqmCqz?=
 =?us-ascii?Q?rmjZeS6Jr3ZU7HsQYfkXPX9DeS4neTqyrUH/eeZgb1tRrujHcMnWty2cwppI?=
 =?us-ascii?Q?ieRa9qt5adUw6rgsHJc9Jau96BIv+7DmYKYK6H6+j14XtsQAKE/1tUaXe4qO?=
 =?us-ascii?Q?27Q8WVq0Pnj8v907CUQ2iamZpfupxuSnuUpcV1df8U6DuOZUm8f6+DjHMW9h?=
 =?us-ascii?Q?16Xe4fgWyNUUAjM/Uh6BTnVrFBu0iiTFQwH1wnUnOFAJX/LuPYyj8cwtTcWS?=
 =?us-ascii?Q?+S4n7VbWiv7a4PfnsDzxi2TNDMIBNf15Dg9AqjEMDKbFdfiinyRQOnIkZHa0?=
 =?us-ascii?Q?nO7Zacj4mv2iGEld/NLZdXj3xBGXf5qQ6SpFzats4vA2Ka77h3Fc0Q49ITRU?=
 =?us-ascii?Q?JS7EUr1QPUlM9DfHTDGMMIu7zPTYiMd1Xer6Ah2MBofcpl2K5o5Rx2aafQS0?=
 =?us-ascii?Q?rpdqLxuNtGM1h7kazxgbWX1MC2aoYQSM2XE5JU1K1+XheGdq7Zzl9CjHBKvs?=
 =?us-ascii?Q?HBSOSRdT8+tW3bkjIbb6vC6uaAuUcHPmwjDXge7PEK8WRNm6MP7jbTR3qW6Y?=
 =?us-ascii?Q?MCEwW5tEbjy86nREChCtLCZK912P8CKGFhwyHIivSj9Kjq2lZ7mSApHXzLJs?=
 =?us-ascii?Q?qflB3gyxrirE6+G8PTuG6yszn7CCyyj/lqXJMRg+kJ/ob+UStNNb5ZlgYAHq?=
 =?us-ascii?Q?BkWVlozFRe0zliMDshKqTGWV39NmeSFHtqcS7GNLDAdDUPVYhKcvkV34Pv0d?=
 =?us-ascii?Q?VmsHSBDZD0x/n/s0ogGlOGNMsQzFBCgHe5MpHHTj1SZtTyoYpRK0zhucVmUh?=
 =?us-ascii?Q?kJxzESjw0rPXDtgMqygZiNfi1vy4vz/04TDv84/DwoIxvdQ06VdYl6kpiT3R?=
 =?us-ascii?Q?nUDD2YLMS4tumH99w+u2Qq8pPeZi9Hu14YfaG908epPaYfcAwceZhMCDTQ97?=
 =?us-ascii?Q?sEkZA7oduveSy40K0uD7uJ9gb3WXsWOYy5hIDPDpDwhbZTg+j+TgjpNlIAqZ?=
 =?us-ascii?Q?ublXMYpQfRxzNM5hiMsjVaJ8IHbz0Pw4SD6Mzi2wPdvLr/9/aALVE7ZbfYy3?=
 =?us-ascii?Q?XdH4KxuD8p78weBlktOBDlgtKyaz/cc7/EhBAd8I/4HDhJq7GnvpcZeeeC5p?=
 =?us-ascii?Q?iI0JLH7igpu48yiKPkz0MRmbKjSMfmHk0xu0csfZoQZezoWsDDMVPQIVGWOJ?=
 =?us-ascii?Q?Wd4KD5yZ+boCpeVtauz3IG95rmX7zyLfmR2SM/xr4A19eU11qh7zaKKDAnto?=
 =?us-ascii?Q?FBmP336sVovh2FN5V1cICFOu/xVt5XqzOZurojreB2Q00ISPImakePujued+?=
 =?us-ascii?Q?NFNvdemtAZFVwEJw2lJPSeizF5LDVR07GI3z4y956ngiIup4kD10I8TXXH4x?=
 =?us-ascii?Q?5khR77qMxH69X/n4DoimhhfMSGW5m1Hyp4L9k0T2ZMr2F1YaB3LRB2QSAW/I?=
 =?us-ascii?Q?hVu+DNJZ27vXeiY6rStO2SNJPPkOdNyssTWiUgy+?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9240e274-a7cb-436f-0961-08da6a7cfc7b
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2022 18:23:47.3881
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NJ5L4SYP3Wcko+0J0y9gXV8JLEsMVC3Cc2u/G51S0ReFUkGLch7i5h/KXo7YIeQnchh221KKc5bKJovUVfMd4EQSCI8j28wV10hg7aoqG34=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR10MB2688
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-20_12,2022-07-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 mlxlogscore=999
 suspectscore=0 phishscore=0 adultscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207200075
X-Proofpoint-GUID: DPYLHQETz_S-h-zcHCYzdYyJFbA0_021
X-Proofpoint-ORIG-GUID: DPYLHQETz_S-h-zcHCYzdYyJFbA0_021
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The call to:

	size = simple_write_to_buffer(cmdbuf, sizeof(cmdbuf), ppos, buf, size);

will succeed if at least one byte is written to the "cmdbuf" buffer.
The "*ppos" value controls which byte is written.  Another problem is
that this code does not check for errors so it's possible for the entire
buffer to be unintialized.

Inintialize the struct to zero to prevent reading uninitialized stack
data.

Debugfs is normally only writable by root so the impact of this bug is
very minimal.

Fixes: 6cca83d498bd ("Platform: OLPC: move debugfs support from x86 EC driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
The ec_dbgfs_cmd_write() function is not great.  We could copy the data
outside the lock for example.  But that's outside the scope of this
patch.

 drivers/platform/olpc/olpc-ec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/olpc/olpc-ec.c b/drivers/platform/olpc/olpc-ec.c
index 4ff5c3a12991..921520475ff6 100644
--- a/drivers/platform/olpc/olpc-ec.c
+++ b/drivers/platform/olpc/olpc-ec.c
@@ -264,7 +264,7 @@ static ssize_t ec_dbgfs_cmd_write(struct file *file, const char __user *buf,
 	int i, m;
 	unsigned char ec_cmd[EC_MAX_CMD_ARGS];
 	unsigned int ec_cmd_int[EC_MAX_CMD_ARGS];
-	char cmdbuf[64];
+	char cmdbuf[64] = "";
 	int ec_cmd_bytes;
 
 	mutex_lock(&ec_dbgfs_lock);
-- 
2.35.1

