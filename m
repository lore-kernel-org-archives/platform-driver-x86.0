Return-Path: <SRS0=a5Ee=EJ=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C977BC388F7
	for <platform-driver-x86@archiver.kernel.org>; Tue,  3 Nov 2020 12:28:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 65AFA22384
	for <platform-driver-x86@archiver.kernel.org>; Tue,  3 Nov 2020 12:28:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.b="Uztb6tmu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728236AbgKCM25 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 3 Nov 2020 07:28:57 -0500
Received: from mail-co1nam11on2045.outbound.protection.outlook.com ([40.107.220.45]:29280
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728168AbgKCM24 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 3 Nov 2020 07:28:56 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WbnzHXxn6CkQA2xequH3a3uZltMixqKSrbT5XtRtgNb4twdjEVCETmuj6oxdsUVRs6kqVWp67xRs60axKmGdBDin3iuPqQgom25M6BsCnTu+d9qDeLjBPdAvixNG81xk/CgS6Kxn1vw8354ZiPGiSeHzgfk19/+PYS4oFH+EHPjrDts3a0fPU5f319gg9xK9by1Jh1uoSoqhwUgovEnyHx61ptLdyqfc0cJb8z+URQyPbQOky2+cTHVjeBI3LQBqZ0oCO9xSGa0O0VgY6clmWl8ORjFg6iC5n+zDD6RISKIPMLNn5rhiqq/RyhUP1NU54LGV9oXYbc0Yx/uDUgjv0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QcbtO9pB0oyFUbKgeU2a+q4oGKu3RCAVaKCySowRXlc=;
 b=XZ62EhEfq1N/eDmBL8f9kFjpJRmjHRMUAQWmjFTajrWpdHFpqF7XwCLXssfmWm60ZnPYJ/PgFHF/sS7NxW9FaGEoCRA/tn265AUVawawRTwLwQnOtWy4Ma7aCJoLj4PePomKYrvlAv2t/xd7+2s7yTJwZqmf/Vnn/NFnpnBrQSqCP+4PNy+e2cPt4VOVz1VbPG9IWGmK7B85XfvEULfqNHe2te4WYBdVK+60jI9YyCHFtt3bCZO4kRu1iKbOcutueKl6LpvSSdR3ULaH9YlLBbkXejHvz8KO5OjVhy6YO0eVZhcZiAHmPVPOdN0K1ck4SUDV4sUJBQIgnicKFgGH6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QcbtO9pB0oyFUbKgeU2a+q4oGKu3RCAVaKCySowRXlc=;
 b=Uztb6tmuB76cc3Zsa7SuNlACbJxqhj3qemCuqP7NgBswTaAC9LZ7bIL0fUiK7m0ccxBUq3ZEQqK8Iej7+uVE3wbARDz04CY6TdLL8fQfBqmNRd8fBP34yTxUIoeoiyemzjCp04kGJ4FQAfeTh30vqBvU5tjudR9Cvbca4GEtHYg=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from BN6PR1201MB0004.namprd12.prod.outlook.com
 (2603:10b6:404:ac::23) by BN8PR12MB4625.namprd12.prod.outlook.com
 (2603:10b6:408:71::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Tue, 3 Nov
 2020 12:28:50 +0000
Received: from BN6PR1201MB0004.namprd12.prod.outlook.com
 ([fe80::3cd9:1c02:b4b6:104f]) by BN6PR1201MB0004.namprd12.prod.outlook.com
 ([fe80::3cd9:1c02:b4b6:104f%9]) with mapi id 15.20.3499.032; Tue, 3 Nov 2020
 12:28:49 +0000
Subject: Re: [PATCH v2] platform/x86: amd-pmc: Add AMD platform support for
 S2Idle
To:     hdegoede@redhat.com, mgross@linux.intel.com,
        platform-driver-x86@vger.kernel.org
Cc:     Alexander.Deucher@amd.com
References: <20201028185654.2692118-1-Shyam-sundar.S-k@amd.com>
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Message-ID: <e33a8ba5-4355-8e66-b890-2fa4af8adc81@amd.com>
Date:   Tue, 3 Nov 2020 17:58:43 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
In-Reply-To: <20201028185654.2692118-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Originating-IP: [117.236.185.255]
X-ClientProxiedBy: BM1PR01CA0166.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::36) To BN6PR1201MB0004.namprd12.prod.outlook.com
 (2603:10b6:404:ac::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.4] (117.236.185.255) by BM1PR01CA0166.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:68::36) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend Transport; Tue, 3 Nov 2020 12:28:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ee35751a-774f-4216-b635-08d87ff403c8
X-MS-TrafficTypeDiagnostic: BN8PR12MB4625:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN8PR12MB4625D4CA6DD113176B9016D49A110@BN8PR12MB4625.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ABMvgIhau0gz4F7n6kIzecKYW09UgSvKzFbeVVRQlvKVt+PMXl9ElmkClm+x26V/uu9NBJG1rkL1J3mTYkl/NMriXvn0247e5Ko1HOyTmV19ZTBbSQidP6I816pkYoxNyO6+aHOMKYBV99fBo+4d2yGjJGQoxVKhoeHTNQkcUZp0EA5AS5PxqIDJTDWqrOz/5ZSkP7v6cghkApYz6uW3xlXA82X/ZxKEzHyFbcmkEKS0tKJeL5tjaChUlx2uuVfIxfSCuXQrwmfY9IHHb0a/9JHSUiQh3E5CBE6lOJtwboDbJppxANoAtWeZPiRo59DCuWD29A+UyrukgqTa9wsOkUoOwFwDSpi0Q8CxE2rPh/5mUx2EyojYHrckrd1nkdp2zoYTAt4SupN1i0/5AUxB8QQbsjDhFOt78gLXw6yTK1+y5ms0LUW/FhqDRSAD4NDNrTBOz5XfhrA4aC6eyVf5CA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR1201MB0004.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39860400002)(136003)(376002)(346002)(396003)(52116002)(186003)(26005)(86362001)(5660300002)(2906002)(36756003)(16526019)(316002)(8676002)(4744005)(16576012)(83380400001)(66556008)(53546011)(66946007)(66476007)(478600001)(31696002)(31686004)(4326008)(2616005)(6486002)(6666004)(8936002)(956004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: Uo65Ee9skuW3lEGwjB2tUFmQ9HMhT3uCSEiA6Ck/EXeAl05OFVHS7PZj7/vXK88QqXGxxIq79VBDdmkqK4MhT0mIERdmMOcTY+Rq5j2Z2D1yx5hsXPSY6qSB/VYBE9DRiW2F/EExQIYErwf6DPP5Hf4YlHio+9sP6SO3T2rSTCip2RX3iyQssQHbpajkj0MhF0v7zFclOvcdlrR+DjjZSv4zKf36WU1WmBC/WyfBYoBfAxZHfFX+vkeZOwakk+8rnfIrta/FFZ7re6QgVEoCg50wyBxOR3cLTRrDHFoLQRns99vj6yDkmdVBXd9e0MQM0g2RDe0v+Tg1OqpstOsivQQLMDaZ8KqtjxhVHRuMQnMqspODaZz3t6Y5Vukqo10catUM/7kt8UD50wtwh2aHbEit3Db+1Gv12TwW1TkxkUQNax3lfjwZOsW8caXrx4KCimrYmJfOQK3Z21fNLV+FaImMqIuWPt/vWwNa4gdiKnUgIuTJWUQtyUP6qePU/HWlLmxr1qMNfkxEs4UfO3EspJsxMZ1sIGj0680mv2LceZ39BC74xja4CIvlsNGN+0TXSyW3CxsCtzaxZkyMzyDtYdh952GV0uIcFcUa1rJ9XQDr6ublB8P4zYaZwoVWOpmMRxhMQ3g5aOoZt1QlbV4TQg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee35751a-774f-4216-b635-08d87ff403c8
X-MS-Exchange-CrossTenant-AuthSource: BN6PR1201MB0004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2020 12:28:49.7578
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bZg8i6pzSq17IOxlnGEptMKlWz6s4yagcQ+c8TM9VB6tGczIhjbRqrTbFpHxodakS4tu9SNeeps5rbLpulCLxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB4625
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Hans,

On 10/29/2020 12:26 AM, Shyam Sundar S K wrote:
> AMD Power Management Controller driver aka. amd-pmc driver is the
> controller which is meant for final S2Idle transaction that goes to the
> PMFW running on the AMD SMU (System Management Unit) responsible for
> tuning of the VDD.
> 
> Once all the monitored list or the idle constraints are met, this driver
> would go and set the OS_HINT (meaning all the devices have reached to
> their lowest state possible) via the SMU mailboxes.
> 
> This driver would also provide some debug capabilities via debugfs.
> 
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
> Changes since v1:(https://www.spinics.net/lists/platform-driver-x86/msg23269.html)
> - Remove duplicate code and make a common routine for polling SMU
> - Reorg Maintainers info
> - add missing iounmap() during erroneous case.
> 

any feedback on this patch, please?

- Shyam
