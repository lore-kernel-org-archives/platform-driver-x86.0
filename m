Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03140C433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue, 30 Nov 2021 12:30:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241587AbhK3MdS (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 30 Nov 2021 07:33:18 -0500
Received: from mail-bn8nam11on2048.outbound.protection.outlook.com ([40.107.236.48]:16983
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S241583AbhK3MdS (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 30 Nov 2021 07:33:18 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AgdphOr9Uvw7SQNVLF7W2Tly/yn4srieRHZPPdL20uL+J7s4gBjiXOv1VfCEErNLX84Bj3SrFGYkAVGSz/X6jyFsX5eUhjnb0MLH8pIUatdVJSgr7MQfFlzXf49dt5DHR9UiXBy9uouEeB4N0mSRqdBx/TgI+H4wVvUrqdF82uL1pGB3hiy99BeJisDamPVlC+etGvFKQNtu1Bmb/AHb3mExGRAtYW0MEVBDVAlVJrdQiB1jcBxsAYRWXSftExTHYSBtyaZRlS3J5wl5OyKOJk29ZUEpvCxcekN0nmJEYID5mn/8lPnxTqgYmNKNtzncuI5UotcawMgkfmxk/pcHvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hO+Yi1n2zBzP6AVnAHGW6oTR+cP2jDNe+Q7R3kR2sSo=;
 b=DVTGwc5nV7fVsf2+ALK1iwyaQJvEM2SA0VrjxgK/1L+fc6aq7rpeENPNjxoxQRnndcdCRolXOSjJ9nngqKdiOWsw0a/bcBQoSwYfs2SC0xSUYWY3cyr4GbxfJRRa5fQiPsioWbITr60InwcW1WjSOpQKhq0DOtRJE/esHfiYNPLzHE3d241wx7hBsr3rDjn/zbDKJWkuLXMrlNxpCzHPNExHQmABqGyHvToyIW9U6GWnx00VI7jfwbgtUZM4VJk1VdHnY48J/erUCQPIyzt2B6Dx/VUQbrWncetK3bTufOOo7hTfG4xC68uNql7bnLlDv5xe/aGPI9Yx8ZjZfq86Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hO+Yi1n2zBzP6AVnAHGW6oTR+cP2jDNe+Q7R3kR2sSo=;
 b=Swb+7wfR75hIWSywE7vq7+xO4MftXRE4dOVERJ66ZL6GN2FDJQgCOXiztVD1fIEWP/mkdAS8J0ZlvsC27d8yUSl7Arps6MohuWS6l/V4AMQvMBWudryxNBFXVHemW06HUz049AZUWGC/vt40sjPV8KQJcv1omZ9ECm6XMmFaU94=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by BL1PR12MB5141.namprd12.prod.outlook.com (2603:10b6:208:309::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Tue, 30 Nov
 2021 12:29:57 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::e8e1:a20d:de7c:8b53]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::e8e1:a20d:de7c:8b53%3]) with mapi id 15.20.4734.024; Tue, 30 Nov 2021
 12:29:56 +0000
Subject: Re: [PATCH 1/1] amd-pmu: fix s2idle failures on certain AMD laptops
To:     Hans de Goede <hdegoede@redhat.com>,
        Fabrizio Bertocci <fabriziobertocci@gmail.com>,
        platform-driver-x86@vger.kernel.org,
        Sanket Goswami <Sanket.Goswami@amd.com>,
        "Limonciello, Mario" <Mario.Limonciello@amd.com>
References: <CADtzkx7TdfbwtaVEXUdD6YXPey52E-nZVQNs+Z41DTx7gqMqtw@mail.gmail.com>
 <4a3d55d0-c53d-d0dc-8023-c059ddffc84c@redhat.com>
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Message-ID: <d594dad8-9bd2-dc38-c96d-9fd8699f286b@amd.com>
Date:   Tue, 30 Nov 2021 17:59:42 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <4a3d55d0-c53d-d0dc-8023-c059ddffc84c@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN0PR01CA0018.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4f::23) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
Received: from [10.252.89.180] (165.204.159.242) by PN0PR01CA0018.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:4f::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23 via Frontend Transport; Tue, 30 Nov 2021 12:29:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f3af3b89-0d31-4700-ee03-08d9b3fd1de4
X-MS-TrafficTypeDiagnostic: BL1PR12MB5141:
X-Microsoft-Antispam-PRVS: <BL1PR12MB514134FDD5BA5A8CD9398A8A9A679@BL1PR12MB5141.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oUlx6/PJ4hdtpjDbCNtSKXf3beCiO1H1ZeWNFrUFWVIXkUdpg2SbBAoal4Tp9iOyOWZksHr3od7ezrU1W/gcKObU21Zx9tTE37wj8WmxzVqXS+QCTdDcAr70g9uTfO3QnEIqAH3R2uVdxIxopV6ZocmLRWpc7QjCLjIyjeIwQjw4deNrABWmwpTvgquVa+GA60F7bKwSl+5zEHM7jkT5IrqfUC7mgzti7DcsykuCqnmr8gAcZiqHv42Anx9aZ0WWiaGVD4GMKlymAKFhBVkJsMqBTVlGdhtE/iaWDbGIJnNuDxsNE74M/jAXNsVEV7PFeRKVOIm3kG4QZjJFVze62CafsME05bZ2FTvPHQhYUS0enppT3LA6uu9eUHgJrx3dmTnJ2rFSbEtI2PDyZR1GgHsrNzj987w2Goa7Jod3fOvDLm458uD8OvVNx9/FqC/d/I61C/nVmwaAbhdqMOp3DHuC/5x3s0FtiFiMQfjP/HXFrN/BaIZ0muPmVuFuy8WrLRd2vUgKA/+wU743oihS9/oA0pQj83i+OBDUqBr7RWXgafF5fyB4j2Ej1rtVw35xFmyLlB7t0IkXHgcPlTIzVWWvdUvL2QB8PGwYb4gqICRvaFNIBCrgbUe4b4A1lRMPUftNC4yWud1Qvny3mYqcr8+kN6sRy+mUbazBnJsWD0AST4IGBAl+f1qPxvGew5gYQCu4Nam4xXv+al0KuBW4feLmTjNOJ+EJRh9EhdhATbTobScnzdhayIFSkTPuka7I
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6636002)(38100700002)(26005)(83380400001)(45080400002)(86362001)(186003)(966005)(2616005)(31696002)(16576012)(2906002)(508600001)(31686004)(8936002)(66556008)(66476007)(110136005)(6486002)(5660300002)(53546011)(8676002)(66946007)(36756003)(956004)(6666004)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OW1JbTV6ZmVwWDRkRlFZMnlvM3hqNVljc3k5eThIMUgyN3lqZlhrZHNpR2V3?=
 =?utf-8?B?SXB6dks5U1JUTkRxZVVUeFJKdHJqaW5MU20xK2NEWE5MbE0rcVVTRUlhZVhi?=
 =?utf-8?B?Q1MvVStmV1pjYktzNnpqcHMwWGhrZ2lDVnJ1cTJ0MVZjbHE3Rml0YTdNNHhQ?=
 =?utf-8?B?aVkzVkloWHlubm9pOEFreEQ3alA1bGdreWprelhOOGU1cEVuVGtSMmV1OGJS?=
 =?utf-8?B?MndKWUF5T0svM284b0R5bCtwWkRJNk9QdmFNcC9sRFY0dGFWRDVsaDNSek9E?=
 =?utf-8?B?b0JxWUwwQjh0ZGpmVkVNeFpWSWpkRWlDQUw1RXFnY3Fkc2NqVGE4STVOcFZQ?=
 =?utf-8?B?bHV1OFFGR1pvSzZIck1XUUtDRW1WOXVOT2dxdG5QRmxCRGdESk9BbWpLK3lE?=
 =?utf-8?B?QnpFSnA4S2cxQzZRUHpMbEJQdXZCMlFzTS9EOFR1OE42TExXSkdvNk9yQlBL?=
 =?utf-8?B?UFBCcFhaSkFCZEN0SmdDQ3pLTlM5dFpXM09KUElJVVdPR3RFWTl3MHZmMHov?=
 =?utf-8?B?YTNFMVVOanhpMTZMdGd0VWxuNGpRR2JDYXpmN0lVdTc4ZXErQ1JET093Mlhk?=
 =?utf-8?B?Ym1Ncit6OGxROVFwQnpBWlE0ZlpHOHlBZ1hNeG5jbjlXR0FVNUlIZGxiZmlG?=
 =?utf-8?B?R1FoZW1zeTk3VVVsWUNpNFZYUUF5Q0c5UzlSSjdSTjhRYjk4U05SRVk4di9T?=
 =?utf-8?B?QWVnTkw2ZEZxcXhTUVE5dVp5ZW5XL3lHay95eVc5SENWYmpBWGRrcVBLN1dS?=
 =?utf-8?B?a2dtOHQzbFVsNVB6WXBvQW5zR3RySHlIVVNUYzNmSFlOZnhka1JVZktMc0Rk?=
 =?utf-8?B?SUdWT0N4TEIyL3dPNXprUlhoMzMyaVhFZ0xERHlqZC9ydzBibVE2aW1ZRElP?=
 =?utf-8?B?UXc4c1RwMjZZdGk1VmxONlgwU2xEZ2NuTWVDVllwN3dGWFlpczNmbVdnMlNm?=
 =?utf-8?B?QmYvcFVFTXFYMHJIMnRkYVlTQmhqMGFoN3FTZWFocmNBUTQ4VUNmVjJiWWZY?=
 =?utf-8?B?ZmE0bDNQYnFxY21oVTQ0K2VDb3ZVMVhzNVFJeElFYy82cWMxYXJULzZnVHJF?=
 =?utf-8?B?UDg4Q1VUZkt3REk1dWZrdEh5L0h1TEhQZGN6VXEreHFRK0tuZGRVeFBFTG81?=
 =?utf-8?B?ditRMDNtTHFVbEhBZ05GdDgrVmEvVndCVTI5ZG5iN1BBalNTcDk1ZDVPeFhI?=
 =?utf-8?B?QVloZVpkOUgybHh6Wkl1QlFTODhnWjRCeStqV0p5UjFhT203ZlRCUHczZk9n?=
 =?utf-8?B?RnVPcmQ5OTJiSmtOMldoNXA5d3JmYU44OUxZcG11czhQQzBlVjArZjNmOUo2?=
 =?utf-8?B?V1Zia0NxYlNCRnIwKzNqTURjMHFuUCtXQjJpVEtSbVFHRzl5Mm1RUjRtQ0V0?=
 =?utf-8?B?VGJtYU45MHN5RTRZbDJvSC96eEx4Q3BxTmRJa0t5WTdZQlNiVXVQc1ZBTkRE?=
 =?utf-8?B?QlY5aDBJU2JEMm1QK0lkb041UTA3WWlMalpWZmVwaU8yL2U2ZkZ4QnBjcTJp?=
 =?utf-8?B?aGVNVmpacklrS2lNWERyWGhrV01sb3lxclNUdklUWDJCRTdZaDdWTmx4RG5o?=
 =?utf-8?B?T2VUcXh0bmtmbnFPQlRZc0VjTHlMTXZKWUE1dk5KS29oNTNneWFSODliUjUz?=
 =?utf-8?B?NWtYT2MwVkJldlJWdkU3SGVNTFNvWHZjdWpMeFNoTzlXM3VTaEJmUnZOSXRs?=
 =?utf-8?B?NmpYMmFTWlVDYXducVliRXliUk9kN2xuNG4vMHc1RzFIVmZpSWRWSTFtNG1O?=
 =?utf-8?B?M2R3d05meWx6Y252Vnk5UzZqOGN4em1HZDhFaXFFbFdHc3dCQmpEVVVDM3Zh?=
 =?utf-8?B?WVYraVBxbjk5T2YvVkFQU1h4UWtpZHhZMFkwY0JDM2RFd1ZDMzhTK1lOSlNs?=
 =?utf-8?B?b1YzTjdLOHdOb1l5eHZVYzNSL2tueFpCOWRoTTNEU2dMUlc2cDNEcmVteER0?=
 =?utf-8?B?V1daN1J2eEo0VnJaK3RVMlRKM1BLbHI3NEUzVS94cjBXdXlmWGt6c29WeVNG?=
 =?utf-8?B?R01LNnFCUjJ1RVJ3Y0k5UTM4L3FYcFN6S2tQVXZvMSsyajNrK3ptaHloYm9y?=
 =?utf-8?B?a0hmc3NJbEdsWG1IQ3NHNXE3SkVnQk1hQVoyZm01elhySkJHbVM4UWxycUkr?=
 =?utf-8?B?SmpFeUhsamdJV2s0U1hobU52Y3YzbWdXK0JnMXdmbkk5VW9VYkZZM01NcElu?=
 =?utf-8?Q?xBK6W0344Vw5q/PJ2GoKVTc=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3af3b89-0d31-4700-ee03-08d9b3fd1de4
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2021 12:29:56.1167
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7SBBr4aJFc4LtV6xBHphvU/sYMGeZ2D4ItSm8Vx9jp2kYLt3Lb/bbq0PlQWTHsPA4cwwI9tZITKs800dCi3zFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5141
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org



On 11/30/2021 4:57 PM, Hans de Goede wrote:
> Hi,
> 
> On 11/30/21 05:15, Fabrizio Bertocci wrote:
>> On some AMD hardware laptops, the system fails communicating with the
>> PMU when entering s2idle and the machine is battery powered.
>>
>> Hardware description: HP Pavilion Aero Laptop 13-be0097nr
>> CPU: AMD Ryzen 7 5800U with Radeon Graphics
>> GPU: 03:00.0 VGA compatible controller [0300]: Advanced Micro Devices,
>> Inc. [AMD/ATI] Device [1002:1638] (rev c1)
>>
>> Detailed description of the problem (and investigation) here:
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.freedesktop.org%2Fdrm%2Famd%2F-%2Fissues%2F1799&amp;data=04%7C01%7Cshyam-sundar.s-k%40amd.com%7Ce8ed4219951f4df1dbe708d9b3f4761c%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637738684806355205%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=EwYxPgELsgQ2YpNQROFyptvt2Z0jQ0Yso8wptp6Dz4g%3D&amp;reserved=0
>>
>> Patch is a single line: reduce the polling delay in half, from 100uSec
>> to 50uSec when waiting for a change in state from the PMC after a
>> write command operation.
>>
>> Tested on kernel tree detached at tag 5.14
>> (7d2a07b769330c34b4deabeed939325c77a7ec2f)
>> After changing the delay, I did not see a single failure on this
>> machine (I have this fix for now more than one week and s2idle worked
>> every single time on battery power).
>>
>> Signed-off-by: Fabrizio Bertocci <fabriziobertocci@gmail.com>
> 
> Thank you for your patch. I've added a couple of AMD developers who
> work on this driver to the Cc.
> 
> AMD folks, can you review/ack this patch please?

Looks good to me.

Acked-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

Thanks,
Shyam
