Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CE19C433EF
	for <platform-driver-x86@archiver.kernel.org>; Fri, 17 Dec 2021 07:12:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233563AbhLQHM2 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 17 Dec 2021 02:12:28 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:24458 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229503AbhLQHM2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 17 Dec 2021 02:12:28 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BH2SlNS004115;
        Fri, 17 Dec 2021 07:12:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=ACHscVdzqkI6KvkvA/G7fc6FlPvFgs/cll3knj0c2Wo=;
 b=gtYku1brzgWRQDrElQNX+J5QmWJERbI0xyUrQwpPpsi8/sBZUJcK5uJU2GCgRdUDrXt5
 9Jn48/R7lqKgOe81KtrbN9NRlNMMavLOoMivGeOOEYQd6zgy/pEbpyhPYqDB+MZJawFR
 9xjAwUnOR5sb6yrw8F0ZvmhoaK+e88KySL0RpwtlVWhlisEvg/Mh2UVG5NyAQeo4eiJf
 pB1gEIWoUQkZVHiMBjcvHadp31bhxIDdBFsxR7GSbtRBo1SzElVaJmiFU7CUP2Nc0vms
 1IOFInwEuzZa7SF53IMyqWmwhsfFNv6SQVy5E4av+V6VUcLm3fMEr1UsPq3gMrQpvIeD /Q== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by mx0b-00069f02.pphosted.com with ESMTP id 3cykmcmv5a-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 17 Dec 2021 07:12:23 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BH7AeoC029999;
        Fri, 17 Dec 2021 07:12:22 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
        by aserp3020.oracle.com with ESMTP id 3cxmrem255-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 17 Dec 2021 07:12:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GLIXo4tgfpIO9eDi4+EepNArx3iQm06HX0sjS2uZIOW0bWLr8b4LGlZh3tOj+Xs6oZ6l+KqyvagSWacKZzFm3g9uUAqpRvcWQroftFxUIE2NS/6JT45KhGxjXGsY+R3yFYOOxlOFfG4InU03lxBb0IkWyQPjgSkd20YptVs7K6sZOqzzQhLjfq8VMtkvjk2NPILoqSHZB6Cquf5998KMy+iHnbxyqEqgbsUOZQnITL1mpEgsXrkT4cLinWcmO+QsCVTU0Dc7q3peFZXrqIi1Bo4iDUuh1V7w6n+Ch7UuiWtVq7Xw5+piJiOSrwDoj2HtBqOSitLYZQVA8s2zeAfzzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ACHscVdzqkI6KvkvA/G7fc6FlPvFgs/cll3knj0c2Wo=;
 b=EcaMaHQumkOZdUmvcz9p8QFkFZ84NjpKvdNEJWI0Pamnkv35Ro/Q7uNDplsU9STi1qvTNuj5vKcnyhHcLKxy2ugurl3Fv480Eaa58r1Ng93l3FHC22UjRVhEIbIq5TM6kEUHzQghDWENWATvPdWflz+2Ct89tqMfDDpg1KSQ6y6i8Ejjfzd5i17aMT05KhlCPVLd/+y9O9tnymCTN7tFzHluJoKx4zckSHsRRh071NZ4jJdD4QGzDeS+yXxpOFcmwvbXDPF20SDW+LuOfxEM/SHl7h033MxhrLEr9s7oXdMl8Xj06L6NvNFMyy9iVCAvXsJ/My2kp6RiCN6qFSxfvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ACHscVdzqkI6KvkvA/G7fc6FlPvFgs/cll3knj0c2Wo=;
 b=emZyoSCTvVTr35SrQbDgtdBI6Aevdx/8JvbqNXKwKyJl6fkBipMeeYfDj9ndVqvfWBSPS5ixzLPx9oZq+NPBAMMpFVFl5UP9ek++pPhK7aCkpzdmTLrNPtA1YczTFW70ZLyd9UXm7MO1bKMDO1Rrjdo+1ePeb+I5WWYOLl1nc7M=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MW4PR10MB5863.namprd10.prod.outlook.com
 (2603:10b6:303:18e::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Fri, 17 Dec
 2021 07:12:20 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::7194:c377:36cc:d9f0]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::7194:c377:36cc:d9f0%6]) with mapi id 15.20.4801.016; Fri, 17 Dec 2021
 07:12:20 +0000
Date:   Fri, 17 Dec 2021 10:12:09 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Mark Pearson <markpearson@lenovo.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] platform/x86: think-lmi: Prevent underflow in index_store()
Message-ID: <20211217071209.GF26548@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0163.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:45::10) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 63cc6ea4-f36f-461f-237b-08d9c12c90ce
X-MS-TrafficTypeDiagnostic: MW4PR10MB5863:EE_
X-Microsoft-Antispam-PRVS: <MW4PR10MB586307712FB98B70E04712758E789@MW4PR10MB5863.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zw0NjzpNZvgKl57PQw4bNg7cD8TQ6vxiP90OvEk4PO+nMxbUVJMQaRRA5nRbNlhl8Mr58k9q3g7VHfu4da5/oYZUZ6s/LT6bzBeXjyrWwJPxnj0yHqxuyVr4fzPMiK5OlRuP/oAn8+UeED6O+ePrz1MPSHiIIHMYeQAGcv+OHKWsh7zAN4sjfv12h8gP2n1UU1IpwMT1m12msXCzvYF4WGamAe/ZJLT7VlYnvf21y1qBvSt7TRHQeP8p2Y+XyQHiDCosJz3DFJra9wx2jymPHRrRfMu42DjBt7Id0Npr63WtQz9xBurb9Np/W9rcT7KQ6ZdS+MwR3T3EJbN/btGFV3BCXmhYqHIkBCv3dZbLsfW4UYfiCe5DtVduM+yEuiCsibH0jnm2m5+mFBQDOrGUhrmkB08pRzGz+yxC6SsDUU47cfRGd93vrV1GD+PBeNZt4XNkRq2qstum+ATvivT5X8Y4UVBmyhfosm8Sb47IbehZnsrXWSYtW0RljjHe/QtzAQ58M5PfakPjCziuHQv68/tlQnS87PjLOXZ4toedr2Uym8trHhaD71+8EPC2AnnkMNFivh2yxk5NH6YRbrzdwTO2wX1EeS9YDPE4XwcEcIhZJM35qb+ki5RbpYpxTogTBoPtF9o4+DkzjSpW7OrkjQkxyIOVavAInb0D3K9mNqyh9yeLmMZhBgWhDqHg2FEXM7mFJ5kYyM3qwJMsZNgyXQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(366004)(8936002)(33656002)(6506007)(186003)(6916009)(6486002)(86362001)(66556008)(83380400001)(6512007)(316002)(4744005)(66946007)(5660300002)(54906003)(66476007)(8676002)(33716001)(9686003)(44832011)(38350700002)(6666004)(2906002)(1076003)(38100700002)(26005)(508600001)(4326008)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HIE840i+4UgOpksDAJEY0G6aWX3VkzajSxsr3rZq3gO0nrBr4cQlZwTHKyVM?=
 =?us-ascii?Q?rKKvK61U6IjJC7VklBiwt79SmSfbXfTMj6mwMtAZBvntpIthUUUTzeV2sCsK?=
 =?us-ascii?Q?UD8/UC9h9Ah5R2tznoVYoEM1ydFmXqtJdtMDlo2wmXUliJGkKky4duZzuNSy?=
 =?us-ascii?Q?uoH1zwzkPT3z3zFgsHmAP3GfIG4HiXspe0uUyi1SeEICt3agAl9DKP8LjeQv?=
 =?us-ascii?Q?MhqNhuV130HmXBqTqVQVeQDdH+0OjA4xnsU7aTrv7iPUCEPkbRICdeiu+Vf5?=
 =?us-ascii?Q?1lHV83Wnj8w/yOAZVC8vBrG3whToTSd216Nu5h53NfAaBHY5uSudg0loaj2G?=
 =?us-ascii?Q?aImnbG/8kP6aUqEwECeA43yEb9XIv8dyDgkIMOh//mvS7mmew5YeOOXlQvYt?=
 =?us-ascii?Q?SqrbLTnrtyIVr+nETby6wyr4JgC/VkidETXaU5umcMxYgcMu/5zcVnNz+s2T?=
 =?us-ascii?Q?b9mGlvav+0+WynMNw4PxMrCrPpE5l5h/WJth5g+ZmyaGG/IxVwyy32AQOYUf?=
 =?us-ascii?Q?3tFHtc4LTKcVtJE6EYdg/loD5Jmd4+3952reBG7qz5hkPuLjzqvusR7KV/uB?=
 =?us-ascii?Q?VGFkRlJ045963t9naoTPb4bGjvElgFuMzj/0+0iKnElp/8ccbg7qFvvtxmOe?=
 =?us-ascii?Q?Q7rvonTQO3g54YP1nQTy295kTw2fXV2vT0QlhplXjMX7Oablv/pVUnsdveiz?=
 =?us-ascii?Q?Q8diorlvKtYNyPR8XIU9RH4C+wAQvZpFdQU0/XnCYtNsKtNEDRkopLWaBpdE?=
 =?us-ascii?Q?ILPX9Gu2EkFJjgVAv5OsIkYUwQTvSEM1zvpZx8YrJmCl2Eag0Ikhse57ySVp?=
 =?us-ascii?Q?IgO46FqueBc/tZ5tYDeq/s5eILuIodqaJzpl1b6LtwiFOoRb5DjxbADfNOQW?=
 =?us-ascii?Q?otctBdDOmmWuEPPxh98vJ+flp5DHpVALLorKz7O/0bU/OwALG3pBlgcBou4M?=
 =?us-ascii?Q?nThZukX/fvp9TXMDaafBUbMu7oi6d2xrTY18aPWQBfX1r5O5ks6WGb3bY2iz?=
 =?us-ascii?Q?CJ76yZKpeGZpsbJcZic9ltZAc1FFj9MCummInNV6Oat05JEVuP79rmCh/ats?=
 =?us-ascii?Q?dT1mtDguHpZ4fB8+vOCLzpvclVP1Ig6LkE5sDBA2s7PDOvIBqPjzmWFRp5Ru?=
 =?us-ascii?Q?gtv5oqYQs8ewkmkrtw8aLlXGQU3iyB5AHRcbMolAjD+PRtpNpNT7bkQnQHwO?=
 =?us-ascii?Q?A+debEZ11UCUoE6Z3wulqjclY8WGqOEMX0NugeLkMVdLYebqsdPIpEf4766U?=
 =?us-ascii?Q?Ha95QBKp6K6jrlf949s1Hf95eVJB1H8umCNSNjSzRKRJwNl/81ckHJkAubSj?=
 =?us-ascii?Q?SJarBZ2nW846/KXrzu/u7LzZPQByhMVg2aa/i4QAwRrcIYO9UtoRbTuTjSmF?=
 =?us-ascii?Q?dLpStWaJLE7OQaUOS0MlsYbhfEDLcd/vm6xU60i+dLzeQE9BxZ+q1+8GBdrI?=
 =?us-ascii?Q?dg8/BlMCJyuNPyIitBv83Unbdan8BJY1GURVVwGpy5LkEPvUcQXA8ViSXjfN?=
 =?us-ascii?Q?OvbWU/4fH8t462HBOnnKFuINsCBNOTjTkv0xfxnBGodxFo9fOkEIs49SbJtC?=
 =?us-ascii?Q?cZ2FvKFaXbZl/b5+KicTg+gwYeq1zgGZj6r9KVTSxrp2EsVzPfqA0+JQiYPx?=
 =?us-ascii?Q?B2cL3pshlz3SmJOmxnGZW2g836TGeW3XGAuhiuj5MFQrYGvrHXFuC+jMO5Jv?=
 =?us-ascii?Q?9asl4pNCw+OWePTJo0AMfgaOJTI=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63cc6ea4-f36f-461f-237b-08d9c12c90ce
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2021 07:12:20.2815
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0uMaXv2dAeTncNs+90G6kQCHXtJvQKvQVe7ulNfm0ZLunv7t/QVj2khdRGZfnprMGZNJLdL0T66Xeu+PfYUVh0BdJXyYhGdyunFxUliWjNo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5863
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10200 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 spamscore=0
 mlxlogscore=999 suspectscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112170040
X-Proofpoint-ORIG-GUID: B1f_NJWwcZ6Iq7usRf-w1rScrEGfHBVs
X-Proofpoint-GUID: B1f_NJWwcZ6Iq7usRf-w1rScrEGfHBVs
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

There needs to be a check to prevent negative offsets for
setting->index.  I have reviewed this code and I think that the
"if (block->instance_count <= instance)" check in __query_block() will
prevent this from resulting in an out of bounds access.  But it's
still worth fixing.

Fixes: 640a5fa50a42 ("platform/x86: think-lmi: Opcode support")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/platform/x86/think-lmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
index 27ab8e4e5b83..0b73e16cccea 100644
--- a/drivers/platform/x86/think-lmi.c
+++ b/drivers/platform/x86/think-lmi.c
@@ -573,7 +573,7 @@ static ssize_t index_store(struct kobject *kobj,
 	if (err < 0)
 		return err;
 
-	if (val > TLMI_INDEX_MAX)
+	if (val < 0 || val > TLMI_INDEX_MAX)
 		return -EINVAL;
 
 	setting->index = val;
-- 
2.20.1

