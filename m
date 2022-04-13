Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ABD1C433F5
	for <platform-driver-x86@archiver.kernel.org>; Wed, 13 Apr 2022 07:38:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232492AbiDMHko (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 13 Apr 2022 03:40:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229662AbiDMHkn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 13 Apr 2022 03:40:43 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 042E3DBC;
        Wed, 13 Apr 2022 00:38:22 -0700 (PDT)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23D72w1A031973;
        Wed, 13 Apr 2022 07:37:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=1QqB/+7PrsxrHtg/NhTCZ5UIpBpbIg1jSiOYPwgfbrQ=;
 b=u/IZGrOpYDOxw1qr1tIQmBHH0hlKJ2yHKB5/+sT2Qr7sWdmvVL/w58/0SdRV3dWExAuR
 gbuTQvPSXmzpwg+G6aEVRDpNmi3PynKjwC1SGMgWz0alx5wK20uSbKCmY9Pgjlsl+6H4
 8B10c9Y/ZGmHGbTFCbqcMCnwcwNOXJS/tOBB/iDxEeoCrb8aqwyiVmXLCle9be1mVl3p
 Uj8giU7FR0dCwQTKt3c5lT7zSjPy5hyVVfagOtxBL87fTzmA0qnwLvRIi2Ko3cKwfO3l
 qa3E88lv1X/h7SDq7faOyRDBUg3/EkBiqULQH87hUa4iN7/lZUSUSN+s1gPB/WwwiDbQ 0A== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
        by mx0b-00069f02.pphosted.com with ESMTP id 3fb0jd8uj1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 13 Apr 2022 07:37:58 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 23D7aPTt028693;
        Wed, 13 Apr 2022 07:37:57 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1anam02lp2045.outbound.protection.outlook.com [104.47.57.45])
        by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id 3fck13mtx6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 13 Apr 2022 07:37:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wo68gOjSQskoyTCIdpXeKTNIqK7jZGUCikzPsyOu6ZdkvjxlZDWiWTbNaPAGEWUOIwaNtlSWdKdQ9nrXDDFjb8v3mVAHMKFaNrMqXpFHYH+KXvzX5nw8AaaR1YJIlDKztBArRFhEOWibOZ2b4NnS9mK4ZkASR9NjBN1V8FnDPuBksnSYC6nknIVZ4OtuWvhXKl1B737QBgYqwN2sxA0hXQJyv9JJsxRkGFS6Jw5zAGH3mUPbDYRLu1hBARDIJgzs6d69nTCxmyTZVfB5mIkeH7v/uYBBPWGAkPolNLk7AhYcW8JIY0Wyudllgu+ROrN3wLV9Kd4R9rsLTI2LfygHoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1QqB/+7PrsxrHtg/NhTCZ5UIpBpbIg1jSiOYPwgfbrQ=;
 b=IPOQYJwEyefgKJYVzEYeohJhNPo4eEUgPpgqPHDRohRabshJl+vOvjy7+HmpSIfQaJ8pIVHBQzwhb0MGZnLLZXfJLJQNfzxK8TVQSazl2VTYVPqoY8NXwceSExuJaLBkhAD5Y+orcRLryvn6jzOIXsa54LbMWxF1HeVrA3K1ZSHWnMOqTI8cRN08wQ7kSmn89dHJQiU88mrFDT4qPXJUr80oXG0aaY2WkRcS7rDt/yq107kdnchbPhv6FOcDtMJG62tk/I+ryeIJCrX/XgUMVVUZGYhofoeoCpml5qao98eQKg3GtkcwVAqQIzQrb4Og2hXoBeVGPwrjAv8VutJgqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1QqB/+7PrsxrHtg/NhTCZ5UIpBpbIg1jSiOYPwgfbrQ=;
 b=inEGkXiHnVdR9jCGLe7E0Pevg+ib9AibQWzcC+11nVx23wfFgDBfIvkgbkVLyJ0+zHa9884g89QHSLjyOjVLCFLGXceeM7GyAkMKWwGikorUqrCPOVUgj70xAe/ce/xUeA4nxeREG432Uyf68hHYOqjcL2qO4PwBidq1bvdlG5k=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO1PR10MB4691.namprd10.prod.outlook.com
 (2603:10b6:303:92::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Wed, 13 Apr
 2022 07:37:55 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b5d5:7b39:ca2d:1b87]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b5d5:7b39:ca2d:1b87%5]) with mapi id 15.20.5144.022; Wed, 13 Apr 2022
 07:37:55 +0000
Date:   Wed, 13 Apr 2022 10:37:44 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Corentin Chary <corentin.chary@gmail.com>,
        "Luke D. Jones" <luke@ljones.dev>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        acpi4asus-user@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] platform/x86: asus-wmi: Potential buffer overflow in
 asus_wmi_evaluate_method_buf()
Message-ID: <20220413073744.GB8812@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0009.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:16::19) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1554f5ce-346d-4485-6df7-08da1d2085f9
X-MS-TrafficTypeDiagnostic: CO1PR10MB4691:EE_
X-Microsoft-Antispam-PRVS: <CO1PR10MB469161AE8E906E98BBDA2C848EEC9@CO1PR10MB4691.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q9/LFIF/xgvhaDMr/8go2QIJeI96wt58ImNSYSsPG3waQDSjFkkzhiGkec8LtEQWhMpjFj6nU2fDqpcqGVd+g9vdkURpk5nh6EJC/WpIZD7vu3G/YsNvChkx0ehyxI/OiUvs2pOIviHfwO3D3YPb7Zpfov15Bxfh1evxUONdJBcq4h4BfDWw/uc9HwGrXUJRWwlrjxm593f1rSq60kC/xfWMCzxct8C5rb2c2Shdvmc/q9uMe/9ktHybV5BrZGk/LcM5FxxjIntUG5hyJ9r9evI9ZPyzBCq/VppXBkdLUO+SCnbTRp+BIc36MWMmjcgQraIXbjMXUFGvU1IrVLcEJszA4dM25BCp89b00fAQ1IYNIuMFHCJECgnVAXhlpzgK1h/1JnAZM9k7J1zPswwNi+2+2lYU6X+yLyADvmV6+hadjEge218AoNgkm1C8UpRR7+bG553STVZVjvBQzmIa/kcoQFBGqF1rQod1XHr9NAabVH9R9LKE6kDdCRrs8BrAcRMtHlGzOtrFwAWRzNN9KT2i85uJxIrgRuYs4WDOWAu+e8jqZ/LCFzF7SMt3XWi6Mi9++msDvbAVZkgFJJIVlSd6WOsbFvqwxYZocrdtcE2uk6iRoR/wKBpoz+LKIj2Aig/YdmaToMl8krrvwAWhxLttpRirVhtsuTCAYfT7zpheAkxhTZyXtBIw6zn8QGEQRgja933Bg7Qwum8eytDjwQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(9686003)(1076003)(86362001)(83380400001)(38350700002)(26005)(186003)(38100700002)(52116002)(316002)(110136005)(66476007)(66556008)(8936002)(66946007)(4326008)(54906003)(8676002)(6486002)(5660300002)(508600001)(6512007)(6506007)(33716001)(4744005)(44832011)(2906002)(33656002)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?C6eRkSO8abc28ZY0HAoBqBrzLPJTenuTS6IP7MPKYsfCHbDmeKwxJKnHDO7B?=
 =?us-ascii?Q?TGVe3rMtRJGHenQ47aSapDwDvD/PfgRD/+Z2QwXUwrlWAjX8mDqq6QkMQ9Pg?=
 =?us-ascii?Q?gQwOgbCFhUg/6VnnYbWMgmD9JDPS0ObL2lp+2eG3m9gUm8gscD6lTpzTe7DU?=
 =?us-ascii?Q?ez+NlB1QG1jF6UrLeDnJhPVTjoedSCQBOZUxBX8pPJ5Oqkf1WrEg6zYYJ50m?=
 =?us-ascii?Q?2dDRjJVtjz/M3B5fifZVzYxaNVLMyiKuZVvK11CRsBZVCNhMpO0qxc9RRME/?=
 =?us-ascii?Q?0JugLl8ZPZryUihbt1kIiRFVvqQNVv/WtlsVyUok/NEcn7egnoaqsUbTD154?=
 =?us-ascii?Q?TVX6ytL2hPKI36Q74q2950dVhfsZTSoQLsX3ExeGPG4Al1BhK0pvBR6hifql?=
 =?us-ascii?Q?bIbLYICOHl5qT/GpeEG+2KRhEXGpB/UQ2d6ui4PCBRil3z3KrNDd7jgjI+GV?=
 =?us-ascii?Q?Tp2FjAPo3JG21kFMeywzXRjd42ZglL9U1/igXVv69B8OeJyOQpb8/HJeEXOy?=
 =?us-ascii?Q?pdLocimDzjaMB+GKDDrDmoyb4qiWOCusu3yCJSXp+sMaQFjSILeUHuUQTaj0?=
 =?us-ascii?Q?mig0tyRchnSoQyTubOAyKyCzo7XmqOoJO79bD+P1YvGic2DasURtkkXj/Iq3?=
 =?us-ascii?Q?xj3lGSwuIXZYUMXn6rTaaDyUbJeNEpHvAYRdSjjQzn1SXcnxJGTUIUYppfVq?=
 =?us-ascii?Q?ACuNuHoBmcjUXtB/4P8S+iEdhuF09TYLwEzFdDq+8YgMywajh4/CcAHpq7EP?=
 =?us-ascii?Q?CdN31Bmm5Few1HBJhDgVRqkSAgYA/S4xWm6WoBYvyFvAykr9QRSu3u/iUrO0?=
 =?us-ascii?Q?AWQK8r+th29pJ90isXWjaDujwl1lUlO6FYGyAKqz816EquZ+G2EftHbDWyPM?=
 =?us-ascii?Q?offkJka17v/zL8DZg5Pw1CZaBMOwD3ikjE6zcQGJdVbaCINijkx3V3Z/0lcK?=
 =?us-ascii?Q?df+mHqQGRljRDIMLSZX3d2rOZbelkuOIo2fypLdGJge1o8WdzTLrVoeyurli?=
 =?us-ascii?Q?wXHNQBc+cODTpL2+nmD0JzJLum/k4FQcVvppxvH9SKHsqOwZE7L6TWXFK0j8?=
 =?us-ascii?Q?TCa9SX3ZEFTN+tneBSEkr10gHrYv4iH3RWcTmxIFqp0mnZb+Fdz9eOBF3Bv1?=
 =?us-ascii?Q?fusy8NvL06ZtEm/WxQy/suuTSp/eb2PswVtse57Ff9GsBT+4d9bi6ZFYmK2j?=
 =?us-ascii?Q?nEkpPM6ZfvFzgkCvnkyjYnqiO6UmXBHMy7WZL9CVI97neetptcy4szCYh4fR?=
 =?us-ascii?Q?6zezFXCil4EA0/HXpU4dB8KW77raOGOluNnBlXFqVKkuGNG0yUv2LOhvh5UI?=
 =?us-ascii?Q?OFO2RlH1Zi1dEbS6ncBrWGYoZiWL8Nfdut10PJu+orJPyublkR07V84GWk6v?=
 =?us-ascii?Q?3vSLFtdXdAmHjWKkqi307QiJDLdAmFKT0K8VP8uHMq3NtEvXWoJ6rhORV7UV?=
 =?us-ascii?Q?zt2nJc4b3pykXyVE5g3i5/6sE5icn5z6cuEa9//mKx6X/LFIN1KtU3ju0fc+?=
 =?us-ascii?Q?YcKN6X1r1eBCuhPCLa8EqIDIeH50+BOgdynKZBL1bgOzTbrhjHBMfYiNpDz3?=
 =?us-ascii?Q?2HD/V/ueHZbPRAX0yhuSY5BJpOyygfFy1YJ8u6CdFgKjt1tYp3c0yhrQvx5V?=
 =?us-ascii?Q?7lFeCmfBGRXmMVofq7dpJEWUUTkqTL/HwpjsI4guWoJWrful3t1ZQ1QOAI1Z?=
 =?us-ascii?Q?lICmTI0NfNHlGpAvegdy0plnfTVzv6IJdwWIgjXpn2yMfLTvtyL8tL1op/dX?=
 =?us-ascii?Q?tEmKzUh29vEjVl5L8Eu/BDPVZwzeaVg=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1554f5ce-346d-4485-6df7-08da1d2085f9
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2022 07:37:55.2721
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AtfPDr7+wVjq3cIVwRMPS1i9y9nZ1XeeFthpAzff+4BWp8wHV5h+MeviJcFRkgXHBwv3xex1OdtRBg9CuaB5qJTVBTCocKdQPF0MERla8Zk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4691
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486,18.0.858
 definitions=2022-04-12_08:2022-04-11,2022-04-12 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0 adultscore=0
 phishscore=0 mlxscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204130042
X-Proofpoint-ORIG-GUID: jkiAIa7Mtn_kGfGPc0ujowPz4nsLrv41
X-Proofpoint-GUID: jkiAIa7Mtn_kGfGPc0ujowPz4nsLrv41
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

This code tests for if the obj->buffer.length is larger than the buffer
but then it just does the memcpy() anyway.

Fixes: 0f0ac158d28f ("platform/x86: asus-wmi: Add support for custom fan curves")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/platform/x86/asus-wmi.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 2104a2621e50..7e3c0a8e3997 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -371,10 +371,14 @@ static int asus_wmi_evaluate_method_buf(u32 method_id,
 
 	switch (obj->type) {
 	case ACPI_TYPE_BUFFER:
-		if (obj->buffer.length > size)
+		if (obj->buffer.length > size) {
 			err = -ENOSPC;
-		if (obj->buffer.length == 0)
+			break;
+		}
+		if (obj->buffer.length == 0) {
 			err = -ENODATA;
+			break;
+		}
 
 		memcpy(ret_buffer, obj->buffer.pointer, obj->buffer.length);
 		break;
-- 
2.20.1

