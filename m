Return-Path: <SRS0=JE7e=ED=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81260C388F7
	for <platform-driver-x86@archiver.kernel.org>; Wed, 28 Oct 2020 22:29:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 29C3A2070E
	for <platform-driver-x86@archiver.kernel.org>; Wed, 28 Oct 2020 22:29:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.b="T3s4+qCl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387559AbgJ1W3l (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 28 Oct 2020 18:29:41 -0400
Received: from mail-co1nam11on2065.outbound.protection.outlook.com ([40.107.220.65]:44865
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2387545AbgJ1W3j (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 28 Oct 2020 18:29:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tpt2iHstfBj2oWcVNPy/fIIgrq6H2/dfPT2/wa5LbfExi07Ru5VHCLTDdG3kTEuC+4Zs1pTV0ZtAa6s1frW3UQteNZChn6iDhSet5WPHvU1cINGvKsqUGd7LFz33ULJ7TCxiVH2WO51TJ4eEuD6u8/LuTDOyIJVR7aWyt2p29l/4ni5pMG6h1jTeqKIdb79a87B76/Hl6jG3+v/lM2mx1wzSPBzBJdgDdJaWJt4Hp9QtbvOljivXdHWq7iU87mviHg7wn91BqOZdXRgx2mta2FZXfu4otWj4hmqJgwY2a5mqAFfllgt+apUy5UsJv8XrH/TgFhw7vclcfOiugtjwXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oRk27dkPrFe19FO7RWgDAJEO+MFznPhf43pneIgMKgY=;
 b=f8D4H1LvuYoiHpffeHtr+Pqr+iD531LfyrcWlEaSpFFPn1wHOOUAFEIJilBRZHC5ylrV5I1iEUbr6pWKu0O9wpP2GZLPpiik86M3AgDt6C4RWZm895A4CPX/Vp3oeiGffQ45CwPdY04VUFuwklPjYyfaNCSt+DZcDfEYW4T2rsBM2U96s+MfwGcI0pt6g1BRThnLTtAP7XvjX52SfLFTOzP96EEdA1/+iE0o1MSpb0nsPHEsfBXZtJfwr+tAlccSuf9RIEIbdnAeKJOwJpMqkPkBDgXIASRSCqutFG/qqT8zQX7Dgb8GbQJ5Furr6MfBWLmu7128wq/ekWNuQngbNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oRk27dkPrFe19FO7RWgDAJEO+MFznPhf43pneIgMKgY=;
 b=T3s4+qClw8s3XMyE8UFbM9rzKPcls5NXsKbiCdoo28xGqNlmO/7QStdzjkkbV66LoJsubYG/QbGSZvtWchP1iPFzCQKnfsmisDbFOAcmOe0ckoJ1NxX5OJ/pdxkLEjsKF3KOBQaatH5s8p4UzXLbrlt7qwIXvgiVKUDgEvSeFGo=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from BN6PR1201MB0004.namprd12.prod.outlook.com
 (2603:10b6:404:ac::23) by BN8PR12MB3348.namprd12.prod.outlook.com
 (2603:10b6:408:47::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.25; Wed, 28 Oct
 2020 15:55:34 +0000
Received: from BN6PR1201MB0004.namprd12.prod.outlook.com
 ([fe80::e8ab:4ae2:8e36:dfc9]) by BN6PR1201MB0004.namprd12.prod.outlook.com
 ([fe80::e8ab:4ae2:8e36:dfc9%5]) with mapi id 15.20.3477.029; Wed, 28 Oct 2020
 15:55:34 +0000
Subject: Re: [PATCH] platform/x86: amd-pmc: Add AMD platform support for
 S2Idle
To:     Hans de Goede <hdegoede@redhat.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        mgross@linux.intel.com, platform-driver-x86@vger.kernel.org
References: <20201023080410.458629-1-Shyam-sundar.S-k@amd.com>
 <9c38b017-edec-9c1b-3dfc-18a6a2000998@redhat.com>
Cc:     Alexander.Deucher@amd.com
From:   Shyam Sundar S K <ssundark@amd.com>
Message-ID: <afe22192-b9c3-5562-fc30-fbc6c90e655d@amd.com>
Date:   Wed, 28 Oct 2020 21:24:55 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
In-Reply-To: <9c38b017-edec-9c1b-3dfc-18a6a2000998@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-Originating-IP: [165.204.159.242]
X-ClientProxiedBy: BM1PR01CA0150.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::20) To BN6PR1201MB0004.namprd12.prod.outlook.com
 (2603:10b6:404:ac::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.252.89.180] (165.204.159.242) by BM1PR01CA0150.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:68::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend Transport; Wed, 28 Oct 2020 15:55:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 01a5126f-d31c-4d88-e5af-08d87b59e7c1
X-MS-TrafficTypeDiagnostic: BN8PR12MB3348:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN8PR12MB33488F6D5667A6CA93E0FFAD9A170@BN8PR12MB3348.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 15olNmgTlzZi62gPmeHdoFsBKNIzrO/F4DYuZKTz54Z072X7KLZa9halbhNtqukl0dgZs4UL0jLX22Aq5utWINt/o+hu2dBSkSSq8h+oVIkoExwSZh3G4RhEzybUHFrM5BUk9l0MVJI0Of2w2e6kQoekyoT/XBNmItsFiDkIgN2ELrdnohjQG6NjEDTeEGiQT/w1AhZTe9oeKAJrIl+IyZ3ihfQDf7OhzPLl7vGWRiQF+Q9aPBsy/TuIYrmDJsna5X7M2PvPBpGIFxuS3Mdmrp5f8z7+RsyxkDGE6Vd5eL7xJFCQqArPGKCuEz3Ec+Gh8m/FIRzbi52HUzutxCA/uCJtFBRSL01DSeC7eeK3djohLi2Hv6NyaDx3VoBSe7PQ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR1201MB0004.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(396003)(346002)(366004)(39860400002)(66476007)(36756003)(16526019)(16576012)(316002)(2906002)(66556008)(6666004)(8936002)(110136005)(6486002)(31686004)(52116002)(26005)(31696002)(53546011)(2616005)(956004)(66946007)(8676002)(5660300002)(4744005)(83380400001)(186003)(478600001)(4326008)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: XYLGOhMqRqICkKLSGoEmXCl7EFkcrEYtR4wCRgbvN69Uj2UKuYkjBhVJePcDMoMf2bShiosZfyKiyMPoB941KUx97AL25mm9vJGatN0p97kHaNClcKChZ4wceFhZJcSB7S32MN6E5XxWjEr6yo7J591+Q+nWoAZpDcW4jVVGYpbPzDW6ThNsNsR7uZ6RownYB+hJb8fZnTqkWg0QDxTYIIvHb0YPGg7ZNBtuNhY07XoKuPRANkIbOArqlam1ZvwmVEPZ8Ls3py6enDlGtFRYLOJgKvBogZeEWMkBIbrjqiRbRiBFuWsXHGVIdYm4alDsbqdn2AL39IHTiPb59HI/I/ohbx/f1m7b5wMXsQlGtZvW/b8VpByTU4LYdke5u1FMla/P3fVK1HeEOTaZH8Y9dHGI5zDvmqxUm90XW705gLtfFywTwT+iUFmmR7gjCu3zng3ZAs0xtHeqANDOQt/+qnStmBp3HQKKmsUUBVvYsgLeVkp3MPzjRlYXjesq9OBoFuM7dayZ0U7r+82xpO0cd6W0HjkLe1O13p/WSLryMB42h1zW/Mg4lA307l5EHNGAERiAaEgRc31Q/wQ1SBCtykwEc8BbW1mTIfh6GNVVx5E9zgzGIiu/fdMN+q4+Ys9RJBn7B2FnoqiWYpN3U4aa9A==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01a5126f-d31c-4d88-e5af-08d87b59e7c1
X-MS-Exchange-CrossTenant-AuthSource: BN6PR1201MB0004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2020 15:55:34.7463
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T313LFy3PoC2w4nI5bTXlunvJBN2F5q2tX70kFBWWmSawLHNRyfkXVdyC7hdzDwSxJl6iUfKrEHzjkfXjTO/7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3348
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Hans,

On 10/28/2020 5:48 PM, Hans de Goede wrote:
> [CAUTION: External Email]
>
> Hi,
>
> On 10/23/20 10:04 AM, Shyam Sundar S K wrote:
>> AMD Power Management Controller driver aka. amd-pmc driver is the
>> controller which is meant for final S2Idle transaction that goes to the
>> PMFW running on the AMD SMU (System Management Unit) responsible for
>> tuning of the VDD.
>>
>> Once all the monitored list or the idle constraints are met, this driver
>> would go and set the OS_HINT (meaning all the devices have reached to
>> their lowest state possible) via the SMU mailboxes.
>>
>> This driver would also provide some debug capabilities via debugfs.
>>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> Thank you for your patch, I have various review remarks, see my
> comments inline.

Adding Alex..

Thank you Hans for the feedback. I have sent a v2, can you please review it.

Thanks,

Shyam

