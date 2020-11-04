Return-Path: <SRS0=p7YD=EK=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64B58C388F9
	for <platform-driver-x86@archiver.kernel.org>; Wed,  4 Nov 2020 15:34:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 02EF52072C
	for <platform-driver-x86@archiver.kernel.org>; Wed,  4 Nov 2020 15:34:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.b="dGL/fihu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726919AbgKDPew (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 4 Nov 2020 10:34:52 -0500
Received: from mail-dm6nam11on2084.outbound.protection.outlook.com ([40.107.223.84]:61909
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726801AbgKDPew (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 4 Nov 2020 10:34:52 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OQoRiEZ9EziqmUCelB5rZsCo3MyBqXqiWBJ1Wjc7eQpO/YjPRR9Q5TPqHcKc3YmuUwEZyHq2qDaMNdXyMYmbZd5IjW5nYXoNVCFd+PhthfnzQbfmTq277anlFhJaayooQQavpht3vsFIGpIH0taGx+vOE+xB/RxD/rZTx6Clj/SWC+CxylFW7cFpNOSyaTbFGLggNX6VBPKeva4zr6tTnVH0LWxHu3nJfx6QeAJBXTj9DiPi/qjhD0JpRbfBJOA58iQIDSVrprwDc3IzTOXCOucyi4MIbf6hwWj2qI0D4nWLS5ZN2hoAIInsBYMU050Ac+ALljaqofEGFW9NZhWFyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OFiNbqToCwVMQNLtYt+neWnDTXLP5xRKdOMASkbnap8=;
 b=icgZ5/1gEWp9RcY9s79syQR6WVS+fHDiP8P93SY+xXVvU6i3MDPUTieypNmvGRNuJ8rUZM+JFn9jXvY1lumLW+EbVt3OSSGqKB7INRSYC6Bcf+kKQU22V1YkCiV2szGpdhomrM4MGe6mZxt6yaej+58FvNmgqv64ihqF08TkI0fQW96YjOg5iDKUBYW6DKFuwPmghXm6quws8NGC3/It7zig2MXBhxo0gvHng9c+tKwc46/1phRQRALRMpqPB00yy6GOUmqKGFZ94RobJ3IHKpyZHqo3kd42ntf8jAE3bdTOh3KqbHJxnNFBXODFqqERB0jI/dGps0UBT8B34MRD5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OFiNbqToCwVMQNLtYt+neWnDTXLP5xRKdOMASkbnap8=;
 b=dGL/fihuOJtgl8YVzgS7aB1qQV4qSAEFJ0YfGei5nAu56iK1+yflJZSlJPRO6uFhbXdWUZcl1OKgijm0eroMC1AzdVjlAAXVhVRDuO9kxTzLx0VNWU7vt82m8rX/xJZyRSh/6E6vi4Z2jTqQnqyhqj/MIX+nAEn5G4c4Pee3sCo=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0013.namprd12.prod.outlook.com
 (2603:10b6:300:e0::21) by MWHPR1201MB0095.namprd12.prod.outlook.com
 (2603:10b6:301:4e::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.19; Wed, 4 Nov
 2020 15:34:47 +0000
Received: from MWHPR1201MB0013.namprd12.prod.outlook.com
 ([fe80::f8f1:2f87:d2f3:c83a]) by MWHPR1201MB0013.namprd12.prod.outlook.com
 ([fe80::f8f1:2f87:d2f3:c83a%9]) with mapi id 15.20.3499.032; Wed, 4 Nov 2020
 15:34:47 +0000
Subject: Re: [PATCH v2] platform/x86: amd-pmc: Add AMD platform support for
 S2Idle
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Alex Deucher <Alexander.Deucher@amd.com>
References: <20201028185654.2692118-1-Shyam-sundar.S-k@amd.com>
 <CAHp75VdzK_Uu5hrjSHbX_aRA9xOvcDhh91WNMx+3Ova6Y3jFig@mail.gmail.com>
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Message-ID: <bdcba6b8-85b3-9257-a3c8-9fa711aaa780@amd.com>
Date:   Wed, 4 Nov 2020 21:04:34 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
In-Reply-To: <CAHp75VdzK_Uu5hrjSHbX_aRA9xOvcDhh91WNMx+3Ova6Y3jFig@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Originating-IP: [165.204.159.242]
X-ClientProxiedBy: BMXPR01CA0087.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:54::27) To MWHPR1201MB0013.namprd12.prod.outlook.com
 (2603:10b6:300:e0::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.252.89.180] (165.204.159.242) by BMXPR01CA0087.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:54::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend Transport; Wed, 4 Nov 2020 15:34:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0973f925-a2de-4014-741f-08d880d72946
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0095:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR1201MB0095DC6848DDC734DBBEF67C9AEF0@MWHPR1201MB0095.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p5b9anP90OtpT2gem+739t7Gn4PGNw3fKO1jitv83qYsyydX9jKp1K03r5K1Zh21qhU5tuSDBu9Fb5yF3B9tONCVb71IZPC+qrUDMHBQSR9ojzAqG2rpnprxKNt89Vbi7kkfhhw+5NQDb+sQPB2lwivx9nnmAmrlPV2ZGJuuiac6Jnm78xYJ0YrvDx3YyTe58wiCh9HPbECF9fMC0f7SeubAbdbrFmVsHdcI/gwmF7ccB+RUCv2D8OKP0vfU9qt9vzjl4yqnFm4er+yLS7iCjv3ZAwuxK4YRDhoO+0kpjw3DJLrf14/gNiJJvCemJM2eG1e6QmB2GU/62NyqGfg08aDj1R/kkwo/vV9B/F1RSf+0p8x+p3YGNwQnB3G0KYO5
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1201MB0013.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(346002)(396003)(366004)(136003)(54906003)(66556008)(36756003)(2616005)(316002)(52116002)(4744005)(83380400001)(8676002)(186003)(478600001)(6916009)(66476007)(16576012)(956004)(66946007)(5660300002)(31686004)(16526019)(6666004)(26005)(8936002)(31696002)(86362001)(6486002)(4326008)(2906002)(53546011)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: nloUc7+5tBsWpS9zKFVee/BIgwmQ24+7tQfz7XNHppNzx5imK7dZxqgKFnRLuydx8zXVRsCI3mBaaSIZiL12wOZzfNO7nioVr9WM2b94tpM7wnf74JqONV1t4mujvOTAs8BzDUFr4Gxyd1tydgLfH2HhtTE33HKgaID2yLENxdZxDYmpxXxXQYWHzzXsG8RrKZB2DljxZHTKb1jvdCQdW7rdBOvnVFFZP0uoEBhfmiqvyn4xu9/AISBqfn1ZnmapZfprPdiR3MTIhpzguu4wg8GvNxx/B59M9n4aaserbCCFiBB45/MCHzUIGzukUL2KdADmxM4fDWN+zjTqYrOWEcT0sq++3loPhZYg91l4LTUzp0FTHkyHdDo9bF+X+eEPHvO/2PsadPCkROc7CBDj5BK0go3rv+vZeKwuGj17N3ost9tDbGC+zuUOaEFjST8iOna7cNZUYL/hgaxmxGftiurK5UEa5ZTaYJD9yJGNfhrSyQ0goVPrWDNQefsm5St/4PhVGDWnblPTmWAw+FlxCFGq9WGSBw1Q/n7uytvbvsRd4TgjMwIV02ZSxy7BXGZdG7boH+6St4mihN4OXw84qRcEYjc1I8MAgvwAtLQhbCZereYrVdTQECo9kkWZd6taO0lSBTHnKA3IMGW3oiPNGQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0973f925-a2de-4014-741f-08d880d72946
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0013.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2020 15:34:47.4371
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sv/MSJygjxZMuNK6F8qDgmp+U7bQQbceu/GyGrKNuyV76qNa/Vk/6qVLUYdEb7vbztPKGpU/qelBeAaW5wM0bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0095
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Andy,

On 11/4/2020 4:19 AM, Andy Shevchenko wrote:
> [CAUTION: External Email]
> 
> On Thu, Oct 29, 2020 at 10:57 AM Shyam Sundar S K
> <Shyam-sundar.S-k@amd.com> wrote:
>>
>> AMD Power Management Controller driver aka. amd-pmc driver is the
> 
> aka. -> a.k.a. or AKA
> 
>> controller which is meant for final S2Idle transaction that goes to the
> 
> for the final
> 
>> PMFW running on the AMD SMU (System Management Unit) responsible for
>> tuning of the VDD.
>>
>> Once all the monitored list or the idle constraints are met, this driver
>> would go and set the OS_HINT (meaning all the devices have reached to
>> their lowest state possible) via the SMU mailboxes.
>>
>> This driver would also provide some debug capabilities via debugfs.
> 
> ...
> 
>> +F:     drivers/platform/x86/amd-pmc.c
>> +F:     drivers/platform/x86/amd-pmc.h
> 
> Can be one entry.
> 
I have addressed the comments. can you please review it again?

- Shyam

