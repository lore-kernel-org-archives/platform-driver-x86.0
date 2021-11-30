Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B2DEC433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue, 30 Nov 2021 15:42:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242412AbhK3PqA (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 30 Nov 2021 10:46:00 -0500
Received: from mail-dm6nam08on2073.outbound.protection.outlook.com ([40.107.102.73]:62817
        "EHLO NAM04-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S241817AbhK3Ppq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 30 Nov 2021 10:45:46 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dtEiQ3emVFvK3zKGsTIO0fG43wVgPUhFYCIhpPGgYlcEM1eMGYTRfDFdo/2Q3dwgrXfFRpT70wW22RqnuLiJHHMqSHdF6Z7RGHaj/WQvlMpJ/i6zsvquUIsIvblOtpDqw+ruFyeLcTjFjhwgDqi5qHEdomZdrpshbELD+TcnkR/FbF3m5cQOqT+ZT3O5QLfvk9V4Y0ZLuBNPBigBNO9Ft24CZGXXG6FY7nW2i5Zs5xqPH3OTYkjjqIlqQrR/1J6ZXcQK0cJFiffUUj2FStDZ78ICntaRFfVbvR1PpOB4EdJ415u9hIDbp4n4MNzHSxDifq7aH0uImnNWtzeCJ6tHYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EPP2ZI4r0XS/RcwGKCSk0Sq9IzRWQLL5H6uX6XYQfrA=;
 b=ZuIConTpEwZb1rQTIK4KZe6EtblIfn+cqCTQY8IlHebSvIdfeebhXzxFY7pfuPQYGJF0Zk3va4md/Ut+pSWTR71Tl5ia0f0N+OBR4YuLG1RKAfTItA2yhpAd+v3gKbTv0EzK0lqUjYpHdglsmiDCFUue89q+CsBYltrCNIXcW/lBKlmOCMhig3ZCVsjOpMAaS3F/hoL1inUu31cJRNSM1F7KyzrDT5+xBH07Vt0ZssxB8Dqcpm2VoAF5gbyZ2vy/1vK1kDeBuCrmIHG+plu3ee7HUKtC0Rm9CYllbGwUR6o/uQx6S9l51YdSVe8ssrCYZN7TiUlt7t+ySzuTwbxAnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EPP2ZI4r0XS/RcwGKCSk0Sq9IzRWQLL5H6uX6XYQfrA=;
 b=f9Y4HQqeQ95xi0729xmUGkaH0DNweud6cAHJUn/eeiCYwu+MPk3sZsus9MOda64DZqD+rd6LzWlxcdSBGaRc5L9/tr1dvYGJw80MviMCn7sp9i+Qd+rbD8p4RK2WfN1hWzFiDHGqCBvXoKTUSCLtHK8Gvjybb73BTOnIrlqQyoA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by BL1PR12MB5364.namprd12.prod.outlook.com (2603:10b6:208:314::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Tue, 30 Nov
 2021 15:42:26 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::e8e1:a20d:de7c:8b53]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::e8e1:a20d:de7c:8b53%3]) with mapi id 15.20.4734.024; Tue, 30 Nov 2021
 15:42:26 +0000
Subject: Re: [PATCH 1/1] amd-pmu: fix s2idle failures on certain AMD laptops
To:     "Limonciello, Mario" <mario.limonciello@amd.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Fabrizio Bertocci <fabriziobertocci@gmail.com>,
        platform-driver-x86@vger.kernel.org,
        Sanket Goswami <Sanket.Goswami@amd.com>
References: <CADtzkx7TdfbwtaVEXUdD6YXPey52E-nZVQNs+Z41DTx7gqMqtw@mail.gmail.com>
 <4a3d55d0-c53d-d0dc-8023-c059ddffc84c@redhat.com>
 <d594dad8-9bd2-dc38-c96d-9fd8699f286b@amd.com>
 <a8e11149-36dc-fe7e-3a08-d6f33a107741@amd.com>
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Message-ID: <2e85722e-e43c-b039-793b-473711a80bcc@amd.com>
Date:   Tue, 30 Nov 2021 21:12:11 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <a8e11149-36dc-fe7e-3a08-d6f33a107741@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BM1PR0101CA0020.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:18::30) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
Received: from [10.252.89.180] (165.204.159.242) by BM1PR0101CA0020.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:18::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.24 via Frontend Transport; Tue, 30 Nov 2021 15:42:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 76ab6650-4d32-4af9-689f-08d9b41801ea
X-MS-TrafficTypeDiagnostic: BL1PR12MB5364:
X-Microsoft-Antispam-PRVS: <BL1PR12MB536461B6BC72F0F8BCE73CBC9A679@BL1PR12MB5364.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BpBYrzuV7PkLCBlY2+Y6vZZnHrKVL9+rWs8kbWcQBYxQat747stVcMp0sBQKT1aA0DAoWPF453jA17hG0p8a7IUSpKd3s9kg3fTP17mIc4SrYl15S7A0cRspO5/MhNN9XPlSfHDnEz7LsnBHgynyH3GiP1TGpYIKnmaOiZeoHNNlWeO4LiEMBdVy+DSXEmfALND+Keyw7UJx/JqNRQ8S68MAbwRk4/wKjIVu970x7JgMFmi6ANPOwGneZPOPyKxjSUQKWMLNg+uFNLn4ZmQ8qX7ZnIjRuZKe5+e1eIRv+UEHkxzdX8PI9npPnTKgLAyy7fC3qJyrxBXL/Mzw0Pel8e+FhF55RnThk/3o006ZX5bP/2urrjogtBOCLlT5l2X2sURYrap9qiuiSIuDyayMIJ7SZGga/hbYl8BJhKhmJWcVvUEW8KgiSpU1nWaoMJX4pnxQIRLyFB6VCtjjGTo1rcF1GZYCijo4Hs2HtPXe13gpqZOjyVoG/SFFz0sVLKcX9rKWoCD2Ft7koo1NNt8/bttXBh4oshK791tQ6js4i7im/hzxvEWDnjv12dxkZ6zVydnkTo3A3o13EBN+tZ20s0HDxWwu/84aqmhNR4bzIm/coA71U6TLzt6AUInCwQihxLGIwOIohOR1ktpn+7MfigeJxhRy/nbXGf3Bxe/l5Zyw5xHQRanyLGcmL4OVXesjAV6PZdxWBJlHhrf94aif4+QakLdyQRl3J7lEyXICrhVTjrRpNq0dGiw611KNcgAf
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(186003)(8936002)(86362001)(31686004)(508600001)(36756003)(5660300002)(110136005)(31696002)(26005)(966005)(8676002)(6666004)(45080400002)(6486002)(53546011)(2906002)(66476007)(66556008)(6636002)(16576012)(316002)(38100700002)(66946007)(956004)(83380400001)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MnpMcHF2RUpVQW01cFBPb05sWXJJZjkyUWpsUzlmdzR5SlIxckpCTUZBUEpk?=
 =?utf-8?B?dkF0OEx6UHhteEtWRVN4T1RMa3BPUVdGVnpxVGpLaSt1cUkrQUhNVEVvT2dx?=
 =?utf-8?B?a0gzSlg2WnlDbzhKK0JFOFhJQVNRUjlMc0ZmMmZCcXBBaGtFRDVXb2JZeHVr?=
 =?utf-8?B?ZVluQ0QxYkFTclZqc3d0MGlPS1BaTjNXbGs2SEgySXFueEdSRkU1MVlDdTZH?=
 =?utf-8?B?N2EwWU1JTlZuNXI0L3lFYUxrQkMydVBaNmdFUnFDT3ZxcFNLeC94d1grZG8w?=
 =?utf-8?B?TlJqeEFLWHJaYzdMWEptd2VQZ0dLZElaV2NkTCtWdlJOMjE4MlNEZTVST1E5?=
 =?utf-8?B?R25Bb09xWVhreDRuMGN6dUQxa1JpeDZQYUxCNmlMOXY3NG5LNExjZWl0VDh0?=
 =?utf-8?B?cEhHSTFicmoyZXZOMjZmZDF5QzZuTFRtdHFlbVFSeEhRNk9HRHFGKzQxSzVu?=
 =?utf-8?B?am9WeUt5ZmhKemJQZEpzdUlUKzVOSGNTNE4zZVhQOHdkMzk2TmVUVVdWL3NM?=
 =?utf-8?B?azVkbXZOWjlVUyt0Y1BjakNDTXZ0bi9lbXVIUlJLeEl2M2ZwUDJucFZObTJp?=
 =?utf-8?B?VGRRbXpCMGVkUlNqVFdDdkpMT1FOVjl5NTRpVDhremVBQnp3dG91V2U2enZG?=
 =?utf-8?B?Q3FUK0dqOCtEN0gwYXhOME5SbUxnczhrYUIwWTBRcitZL0RiVWtBNnJCbktK?=
 =?utf-8?B?cm1DUXY2UWM5YzNPZlhMYkFESHNyQk1vcUhmejMrZnBpLzRlbGk0N2RwQ3Uz?=
 =?utf-8?B?VUxPeENXY0I1dWNLVUdzalZ2N1UzWTFLa25DaE1ZNXVFQWJhOTVyR2ZPQ0hL?=
 =?utf-8?B?R084dGNZVVRVUk5qSDdsOG1Na0sxM1FEWlBaWTlULzJnNmo4YlREM08zVzF3?=
 =?utf-8?B?a0Q1WnB2WDRSRElzWkVRcGNld2NPKzNlZTUxd3BjaG9mOHdUMXpSZjBQNHNs?=
 =?utf-8?B?cnlLZmlSL21mbDFLRVlVTE1HZytlQWVHWUd3b2ozK0dxME1BaEl3LzIxUXVx?=
 =?utf-8?B?QzJLaGRaYkxEK1BIUEpBUTMyUERtRC9ZNjVhcGMxUVNoYlNVZHRpMmVrT2ZE?=
 =?utf-8?B?NHRhVk9QMnZSSkFhT2xyREJUUkkvZHBNYlQyNDRqVk5pT09TZ0JyU1Rvcjl3?=
 =?utf-8?B?elZOVlk2UDdqKzVwTVJnVEJiUUVuVkpxZmh3YkNaY1RjVUpadzdwVmZjcjhF?=
 =?utf-8?B?RlM5aGx4NnBydFZSNFI4WU5hcHZFRVgxZGZIbFZOakExQmFuNlNZWWZKem1s?=
 =?utf-8?B?TWtnL2tYaElrK1ZJOHhPanpHck8wVkF2K3JxMVZaR2UzMWcyWTN2aHRiT1N5?=
 =?utf-8?B?enBBYnpzOWJ4UWNZbzlqek9WVWkvYk4vLzFITnpoTWYvd1pxMi9kTFdJYXp6?=
 =?utf-8?B?T3dMQVlscmRpSHRmNVFHSVpWZ3RlUjlnUXpqRUFwQW1QUjF1bldEcWV4QTkz?=
 =?utf-8?B?Uk9HTmdCQU5tTXZtVG50elRGUlpHMUZmckF4YWJhTFQ3VmJyZWZqWi93Rm1B?=
 =?utf-8?B?Q2JMd2xQcko2TDYrb2tScHdlSnY2UHN0aE5iZHcxTnAvcXpnVFRMZDhTOXZp?=
 =?utf-8?B?V3NOc0FmQXo2TGdmSCtsaktDd2hHSFQ4VEpHbFRwcXdocW9rNEdFWmI5Q3RK?=
 =?utf-8?B?YnE3VVVUUnFVK3BKV2JoU0N2UWM5WWNVWG9WUXdnU3FKeUNEL1VrZFpNa2Nl?=
 =?utf-8?B?RkxmRGI2QndBVVdlS21pZTFrU2xSY0hZUldVUENWQ04vWmZ5NzNWQ3grUFJz?=
 =?utf-8?B?MHEzb0U4RWUwTHo3WDBCUkhZaHBCK1N5cnVXSEN2NDBZbGZ3Y3E3cElIY29u?=
 =?utf-8?B?cTVWK3cxY2JyQVZaL0U0STdydW15K1ZuRVRYbTd1eCtRcFhVUlVKbE9nY3d0?=
 =?utf-8?B?RG4yKzFTdkxkRzVaL2dyZlZNOWtWaWxiNDdkaGdvNGVOalQrT3gxb0o0NXZq?=
 =?utf-8?B?NkYyclU1elluZ0JjVzMySmdjTDNvV1BOYkF5NGxtWU0yZkdyWUFUckVSTG1F?=
 =?utf-8?B?UWtvc3M4Z0VHUzYwRk5PRUF4TGFBRWxmT1g0Mmp6bDJrWFEyZlV2WHRtOXNh?=
 =?utf-8?B?Qjg1VVB0ampmSE5HdUQzQXBOQlQxNGRKUmZ3Y2NPVkdFNlBnc0VFQ21uU2Vx?=
 =?utf-8?B?MnRhZ1dQTWVjUnpqNzZBcWluQmdicFAwc0h1MG1ZT2xPWmtyRG8vSXNKcFpz?=
 =?utf-8?Q?MjAjRaXp7t2igR/yIxmqDy4=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76ab6650-4d32-4af9-689f-08d9b41801ea
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2021 15:42:25.8838
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: onpWQo0ZLVd8wkZruvZ+L2scrSzifzk3UfOFb23inCeRRrWt7pF7YEVtPnI3n7lG6/qmxsJGolq0XvIxH9GWWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5364
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org



On 11/30/2021 7:34 PM, Limonciello, Mario wrote:
> On 11/30/2021 06:29, Shyam Sundar S K wrote:
>>
>>
>> On 11/30/2021 4:57 PM, Hans de Goede wrote:
>>> Hi,
>>>
>>> On 11/30/21 05:15, Fabrizio Bertocci wrote:
>>>> On some AMD hardware laptops, the system fails communicating with the
>>>> PMU when entering s2idle and the machine is battery powered.
>>>>
>>>> Hardware description: HP Pavilion Aero Laptop 13-be0097nr
>>>> CPU: AMD Ryzen 7 5800U with Radeon Graphics
>>>> GPU: 03:00.0 VGA compatible controller [0300]: Advanced Micro Devices,
>>>> Inc. [AMD/ATI] Device [1002:1638] (rev c1)
>>>>
>>>> Detailed description of the problem (and investigation) here:
>>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.freedesktop.org%2Fdrm%2Famd%2F-%2Fissues%2F1799&amp;data=04%7C01%7Cshyam-sundar.s-k%40amd.com%7Ce8ed4219951f4df1dbe708d9b3f4761c%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637738684806355205%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=EwYxPgELsgQ2YpNQROFyptvt2Z0jQ0Yso8wptp6Dz4g%3D&amp;reserved=0
>>>>
>>>>
>>>> Patch is a single line: reduce the polling delay in half, from 100uSec
>>>> to 50uSec when waiting for a change in state from the PMC after a
>>>> write command operation.
>>>>
>>>> Tested on kernel tree detached at tag 5.14
>>>> (7d2a07b769330c34b4deabeed939325c77a7ec2f)
>>>> After changing the delay, I did not see a single failure on this
>>>> machine (I have this fix for now more than one week and s2idle worked
>>>> every single time on battery power).
>>>>
>>>> Signed-off-by: Fabrizio Bertocci <fabriziobertocci@gmail.com>
>>>
>>> Thank you for your patch. I've added a couple of AMD developers who
>>> work on this driver to the Cc.
>>>
>>> AMD folks, can you review/ack this patch please?
>>
>> Looks good to me.
>>
>> Acked-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>
>> Thanks,
>> Shyam
>>
> 
> Fabrizio,
> 
> Thanks!
> 
> Hans,
> 
> Can you please add Cc: stable@vger.kernel.org when you commit this?

Also, please help on the subject-line correction, from
amd-pmu to amd-pmc.

Thanks,
Shyam
