Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF4F3C433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue, 30 Nov 2021 14:05:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231134AbhK3OIL (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 30 Nov 2021 09:08:11 -0500
Received: from mail-co1nam11on2060.outbound.protection.outlook.com ([40.107.220.60]:48897
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232664AbhK3OIH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 30 Nov 2021 09:08:07 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g5bzIH/Z+YU8OqXctol9lRd6QunXDmWpRlam6ewscvKT7OCdOC0Thl6/okqx/+wN5Z7nLa3BYvPQELlKDDxB7E4rlAicUuhvXsTVurnQicThkTzn/DHk62WEn3drl9WXkIAOiDyhsvqGf3Spy1LKuuvfI5V/+PGk9Jphpw7S8FyFZCxNxuHUSEgV4xyeQ3MY6fSlASG45QBkamLvwYH8vSAIuheWpmelfh1EQxA8RAXhUsQ4qgvZlq01ctbEiZ1UND61C5/uOoC/KF6Vz9h1NJ5HhS7AkxE2p7829mMYsNp7E+Wz5wAqxqdo1yuw+Vl19nOBdN5LWXECwqHrj6kzpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nUfbHov0/WVGn0GpD2udm5vhUcMH/lNBIqZZ/NI+ziA=;
 b=Rz+A75d5Qd8N3HGj1kIvOcQBuS878RdMpJtOgIMVrIbZJ+ICe32ovnZ2AwTsZhxdlHxHkozoRaYTXaWeqQEy5DlQMJysiBZ4fEAHr3A1sn7rmA2ayMDLbDMbFihIUDoYwDYHnWai19qeJjyXVwix65dbGjVIOtsPcl859VBARKbSAcThzCRCdQf2XNA67T736A93fx5Jp8tDExhkcIWF6nsVoFupOVJD/OAXGn+LreuX+9E1o5FKRko8fldXyAZnyTW5+xOQsb8FxZ50uRWiMrGe0grqCh79OfWUNvNKhxn0QgO2vS9O1hmAxXJxGFrgBA5K5Sx5FQkQ7Sq6oGNd3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nUfbHov0/WVGn0GpD2udm5vhUcMH/lNBIqZZ/NI+ziA=;
 b=L9ZVMzb2spO3ZB8wGthLJF4myhFkGVur4d4SI5e5s0lJTOnm3rFdHLw4r/DTe6EOgAxlv6fGfY0+A801igji5yuyeiqKliUds/2XnROSuVwWeKtze01kgRUCyJi+g5Zf4Gw0QVmghheRwxGv2X8SWOThLNZqvn3dxAaAyfsVWT0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4510.namprd12.prod.outlook.com (2603:10b6:806:94::8)
 by SN6PR12MB2637.namprd12.prod.outlook.com (2603:10b6:805:6b::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.24; Tue, 30 Nov
 2021 14:04:45 +0000
Received: from SA0PR12MB4510.namprd12.prod.outlook.com
 ([fe80::7cbc:2454:74b9:f4ea]) by SA0PR12MB4510.namprd12.prod.outlook.com
 ([fe80::7cbc:2454:74b9:f4ea%6]) with mapi id 15.20.4734.024; Tue, 30 Nov 2021
 14:04:45 +0000
Message-ID: <a8e11149-36dc-fe7e-3a08-d6f33a107741@amd.com>
Date:   Tue, 30 Nov 2021 08:04:45 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 1/1] amd-pmu: fix s2idle failures on certain AMD laptops
Content-Language: en-US
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Fabrizio Bertocci <fabriziobertocci@gmail.com>,
        platform-driver-x86@vger.kernel.org,
        Sanket Goswami <Sanket.Goswami@amd.com>
References: <CADtzkx7TdfbwtaVEXUdD6YXPey52E-nZVQNs+Z41DTx7gqMqtw@mail.gmail.com>
 <4a3d55d0-c53d-d0dc-8023-c059ddffc84c@redhat.com>
 <d594dad8-9bd2-dc38-c96d-9fd8699f286b@amd.com>
From:   "Limonciello, Mario" <mario.limonciello@amd.com>
In-Reply-To: <d594dad8-9bd2-dc38-c96d-9fd8699f286b@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN9PR03CA0791.namprd03.prod.outlook.com
 (2603:10b6:408:13f::16) To SA0PR12MB4510.namprd12.prod.outlook.com
 (2603:10b6:806:94::8)
MIME-Version: 1.0
Received: from [IPV6:2600:1700:70:f700:113a:fe8:86b5:8e44] (2600:1700:70:f700:113a:fe8:86b5:8e44) by BN9PR03CA0791.namprd03.prod.outlook.com (2603:10b6:408:13f::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11 via Frontend Transport; Tue, 30 Nov 2021 14:04:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a5a4e114-0ade-480b-c320-08d9b40a5d09
X-MS-TrafficTypeDiagnostic: SN6PR12MB2637:
X-Microsoft-Antispam-PRVS: <SN6PR12MB26373569967B82F859ED4FC0E2679@SN6PR12MB2637.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: T1qzF2x/OdkmDBE7EY4kYWe7v5BZU2hK3Ms7ijBKqad6Hm6AD4EvAWUbMItIP+nxr3+7ByskwehFWeY5e3Y1tz3EM0cZPqEteZcnJB1LvNK2yW2PPKPWvWJ4LIpHGeevek5i6XTwwDS+GrFceYwNgSHaL6u9g0QSCw9wo3HPV14z3ZtiOdkDGDmT/1a0SZZ5JWBpA2Yrm6x3g1c7c//WSGKwu2iriK1o1+oRvzsNIOK6NZj6wrCYi9yu40Ex/4nAvf+5mDromFk6+AUSvKBhk3TjgAAdePzvvvQxAhdQUsUmB10Y+6QTHCDeQdwmSGb7XA/y39AtPgQI6VEadKL8c0Rl5qID2o7Wp51Q5BhoDgLzTntJhyBqiauM6mAFwiasroFgUx2uQeMtIM3Stg3JRMIXTiB7Jo+IpPT1FZTqGNsZOAs6mKguWjW0LU8igW7DE0tPhFUxxmNOHX60A51uaalg/y7jwcXjMi9euqwzrHjuTcVIqCO8XAaFntMvuVpMLZJUxEzrs5qcjc5xI9+e1LdLLcl+7ZEX70kNdBh3InQj97eHMonQHEq1hzo9Xm0/Yj9WLiL8sXVKok4Ogj5eRmLZKwSJqG8SqICx7MT5bry2m9ZehyO8XkGEtwdQtMzn2ItjW0lC+jEpHFSCkKeLHy30uKtFhh3mC1DFR1PFQ6xCVnRPzzMkzFkKpSd2WOT5k/+hqM9ISsYq4tgOybaCshpvycCAPubV+KYxJZhDlXy+6Oc7zdM14l2fFGZIxUxm
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4510.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2616005)(8676002)(31686004)(6636002)(2906002)(966005)(508600001)(38100700002)(86362001)(83380400001)(316002)(66946007)(66476007)(66556008)(36756003)(5660300002)(6486002)(186003)(45080400002)(110136005)(53546011)(8936002)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SHNpbXJwN1hNQ0RFb0Z0U0o4RDVsMlBMMm1jbHhOTEtNck03Q0hzdm1kalhK?=
 =?utf-8?B?NExIVi9iVFlJbklFc2hKT3J5bXdPRmJ6RCtnOFdxSnNyejQwdEgyc1dJMDIw?=
 =?utf-8?B?THdxUGRXU2dXVlFKT0tlcGpmN1g5NnlzK2lyNHQ5dm9ScmN2d1E0T3Jzck5k?=
 =?utf-8?B?ejBkZGYybzJqcjh4TXlLdmZ4UVdiajA5T0x2dDdDR3RrQUJRMVFSRzliaW02?=
 =?utf-8?B?NjM1cjdmWWwyM2ZDYklRWExBejFxeTNqM2phd0JiZEpqdXhPR2lkR3VqRDF2?=
 =?utf-8?B?WW1IOWliMlhGdU5WNlp1d3RPcmxlT2o0aWZUUkNKTWlad0tCc2plRGQ4aGh2?=
 =?utf-8?B?U0QwZUVXT2I3SWp6K1Jhb0U1Nyt0MjFlNEE5aHdDK1hYQXlRVWVlZUh6YVV0?=
 =?utf-8?B?YWl3b0RyMnlQMmtnK1E1ZXdsSmR1SW1GKy9zVmJwUUt0UjNBcEZPaHNqeEdi?=
 =?utf-8?B?OU9lN3pJTmZKL3BzK09NdlJQUFVaR3hjU25vbkFZVURjME5mZGhtRDc1bTds?=
 =?utf-8?B?WElraXRTM0JXaWxyZmJySnp0dlFIUEJBNVhIYVBzZHZsYTcyeUFsdGdrR2dp?=
 =?utf-8?B?Zkc2Zjg2K0JkbUc1eTBhaWRKNncwYzJPcXQ0bVRzK0FDcWpoMDlOYW4rZUkz?=
 =?utf-8?B?N1NqTVlmMDJGSmFvY0lkdWlKL1U3T1pUM3FwaUxlNWt3QWdaV3NqYnh1UjRM?=
 =?utf-8?B?TjZwNmF3VHE2blVPRUFyOElacytGNGRzVFJYa3BVKzlnelRldjNZblh6SGpz?=
 =?utf-8?B?SjRHTUdIcGtsYXZaTm5OWWZ5V0FQRER1NmFWcngrWElteThUNlhOMGF4a1k1?=
 =?utf-8?B?NlFld2cvb0VDY3g3dk5qemJxaHBJclR2UXFobys2aUVkcWsrTmFNWVhkaDdl?=
 =?utf-8?B?VFZsaG5HdUxYZXY3UzlTdVJVQjdILzdiWHNoRTBlY3JmejJQSis3VXpIZEhO?=
 =?utf-8?B?Mmk4S05zSk1LSGRPUDU1MTJ0OXZJYVpYK29ZWVByOTNZYWQ5eTNUNXU5VDNr?=
 =?utf-8?B?U2dCdlg1RjdVRXpNTE5yUkNYbGdjd1FFM1ZsTjRMdkNKck9mYUFOdTlWUjAv?=
 =?utf-8?B?eXJ3dlMzblVaS29BOFcyNGR2TjJhOUVjVmIrZG90WEJtbHgvQktDUXBzbCs1?=
 =?utf-8?B?d01PMU9JREVPUjMraHlBNUVHTFd4NDdVSHUxelF0aC94VEpBSXhxSVZUUG90?=
 =?utf-8?B?cjdRREx1NllyQ3hxOXp5WXVCYVBCb3hOQVYvQ2V1emw2UXp5NHdQejAyQ2ZT?=
 =?utf-8?B?L1dvU1Mvd0JCWGJ1bC9KTWlRa0hFZlNaZUFGQU1MS1QySTBvbVN0TFNpcUUy?=
 =?utf-8?B?VlNYbzM4SFp4NldtWmxFYWJKdFFlckx2S2gwSUZJUGdBM0dGU2VHWDN6dmtW?=
 =?utf-8?B?aXhTdm9QekdlVW9YVjFJOUtWMzRtVmZFWVhCWGI4VHlHOCtsQ1U3d0xiUDMw?=
 =?utf-8?B?MklVZGZKWGtoaktvSnhhcFI3ZUhJTnpYU0FPS05qRWEzRUp6Sit5OXZoc0JU?=
 =?utf-8?B?c291cUZRY2dWcFZmL2FoYVVzZ0tmcVhxUzFKTlBza3JCMnYvcEp6ZHB5bmZr?=
 =?utf-8?B?Si9uNTRNNlNxczh2eVBENlBqRlBsOWFGdXRsOXdyYU9ramFsZ3A2OUNQUHVU?=
 =?utf-8?B?QVZ4QllHemp1bTd3amZkckhIdUQrZVJ2K1hYTkZvdklsekM1VVR1QzNTckZB?=
 =?utf-8?B?RnBoSjVPWmJLOU1vK0pBSTJib0MxenhtRENwL3BEZklxdmtHSnQyRlM4VlVy?=
 =?utf-8?B?d2dYL3Z5WHFNRzdSSEtuZmN3aVBZYUoydTVpaUJmT0pEMHhRUytzUUZYdVQ2?=
 =?utf-8?B?dHBGcHlxVnRQWnI4M3V0K0VzVGd5N1htb0Y5OEdpQ0JBZlZMN3djcVhIcnFO?=
 =?utf-8?B?cmxGMDMyME1CYTUxVytiNVRvTGRHdnRtTDVrRzZSY08vbDBReStQWGthZFlF?=
 =?utf-8?B?R1JmYXExVGMrL0xGa2x6dTlVMzcyKzQ1aVdGV1JIMk5mS29hVGd1bXFyeGZ1?=
 =?utf-8?B?QWkvRUN1cTZsMTAzL2dKbDZodUFHZy85RG41YnNGM1J0NGkrNHhCMGVtWUxm?=
 =?utf-8?B?S2hhelMrUm5vOHFkaTNFOGNWUyt5WGZCMGRZT1owNDg4a2dQZnNRVG9YVUF5?=
 =?utf-8?B?bEVJQnZVd3dLVVltMkhQVVNxUjc3Uk5PTXRWTVpOMUNaZE5tL2dqejFodG5G?=
 =?utf-8?B?OUFpbnhkYmhuYnkyWmlRU3lIUzRGOWxYcFZOOU9wS3Nmb2ZIK1NkemFvSnBT?=
 =?utf-8?Q?9Kp7XErR3mE/qFGvSSep9wCq+fXI3Tsvm0FdzMM6dc=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5a4e114-0ade-480b-c320-08d9b40a5d09
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4510.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2021 14:04:45.4623
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GCnE3/lm7alqyHbQRSPhTNb3uhyilydtsFHwpTAgALKWz/pkB4t2Or37nRISPzNlVCM0lJn/9ITlb3uiahTY0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2637
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 11/30/2021 06:29, Shyam Sundar S K wrote:
> 
> 
> On 11/30/2021 4:57 PM, Hans de Goede wrote:
>> Hi,
>>
>> On 11/30/21 05:15, Fabrizio Bertocci wrote:
>>> On some AMD hardware laptops, the system fails communicating with the
>>> PMU when entering s2idle and the machine is battery powered.
>>>
>>> Hardware description: HP Pavilion Aero Laptop 13-be0097nr
>>> CPU: AMD Ryzen 7 5800U with Radeon Graphics
>>> GPU: 03:00.0 VGA compatible controller [0300]: Advanced Micro Devices,
>>> Inc. [AMD/ATI] Device [1002:1638] (rev c1)
>>>
>>> Detailed description of the problem (and investigation) here:
>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.freedesktop.org%2Fdrm%2Famd%2F-%2Fissues%2F1799&amp;data=04%7C01%7Cshyam-sundar.s-k%40amd.com%7Ce8ed4219951f4df1dbe708d9b3f4761c%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637738684806355205%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=EwYxPgELsgQ2YpNQROFyptvt2Z0jQ0Yso8wptp6Dz4g%3D&amp;reserved=0
>>>
>>> Patch is a single line: reduce the polling delay in half, from 100uSec
>>> to 50uSec when waiting for a change in state from the PMC after a
>>> write command operation.
>>>
>>> Tested on kernel tree detached at tag 5.14
>>> (7d2a07b769330c34b4deabeed939325c77a7ec2f)
>>> After changing the delay, I did not see a single failure on this
>>> machine (I have this fix for now more than one week and s2idle worked
>>> every single time on battery power).
>>>
>>> Signed-off-by: Fabrizio Bertocci <fabriziobertocci@gmail.com>
>>
>> Thank you for your patch. I've added a couple of AMD developers who
>> work on this driver to the Cc.
>>
>> AMD folks, can you review/ack this patch please?
> 
> Looks good to me.
> 
> Acked-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> 
> Thanks,
> Shyam
> 

Fabrizio,

Thanks!

Hans,

Can you please add Cc: stable@vger.kernel.org when you commit this?
