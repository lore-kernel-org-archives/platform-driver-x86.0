Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EA53C48BDF
	for <platform-driver-x86@archiver.kernel.org>; Sun, 20 Jun 2021 16:47:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2682D6108E
	for <platform-driver-x86@archiver.kernel.org>; Sun, 20 Jun 2021 16:47:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229605AbhFTQte (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 20 Jun 2021 12:49:34 -0400
Received: from mail-bn8nam11on2070.outbound.protection.outlook.com ([40.107.236.70]:52001
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229600AbhFTQtd (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 20 Jun 2021 12:49:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EwJD7lkHg8UPLf4cj47wOoltKwDmlKKWgWh98I86K7eQ56A9qCjU1NhFqdcsLl7U2XHzh2D7SgsXQ+x/Nb0BmM5JvgG7l1+CZXJP5/rWmeFeDXKtrB/8I+pc9TnOLFM47DhGEpA/96iZfW4hKL10/P92xNw71W2037a5SJL54NtFlyRTCo2BjBfY7+29JEgwFlIQBvtm4R1R0J/cx/MlhId15u/cbbn5/ot2N7cjSM5BxFa1km1XASDvAYAF5V4GdrocvgzK1QgFg/PItosVkrYaOhCYY67960Fs5IAXliYg2ksHcQEdRbB6i7BwqJuSuebDI3Px+z/Ede9jYA0UmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DbhxQoiP6YJJm68uLI+EkH2dXBW96J9OX86fukQNZIA=;
 b=C6kc8WgBWPPrDzypgBp2xikWBiRsuaYMYHXPG5OotOJS9byF5Y9v4P15nPSAAnC3x7dx3rfxbhiFzn/BfzPYT9Ji2oNeAwIvYMrosfa7BWm2kQkEGQ/fP1T+fS+oT2J9BFP+Est8+Xmtdxam1sYjBAWCHqaZ1OB1pcHZkjjfl6kSqrU0bBAh+794JDzD0kYXz+X+SiW/o4CA8mX4zcJgSnxXZ2fQz5LA/7B7967JNn8rvKrUTW2NTxFi9z7dvA+cKaoorkH34vrFqPk0yfEoqjelfOSwsF3kBjvuf78eDyppZaWO3fQjOQfplkBcRgv1nA0aFG9N7EsEdRoorxD8iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DbhxQoiP6YJJm68uLI+EkH2dXBW96J9OX86fukQNZIA=;
 b=hBRaoRCvTt/HhnJTjBDod8OGkiWiHAs+YtpvlnjSqSQDp4OyaBfMvingDd746ImqDQJYDm+lib/6BXRC05gd3VbsIxFywre9zDGSbp2EOlSEiLgr1yToaeoh5D6DKXAzYziakXm59D/HZkEwaC3XpjaqHRwOOSylmdm+iJn1tcM=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by BL1PR12MB5095.namprd12.prod.outlook.com (2603:10b6:208:31b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.15; Sun, 20 Jun
 2021 16:47:18 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::3172:2af0:3407:853a]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::3172:2af0:3407:853a%8]) with mapi id 15.20.4242.023; Sun, 20 Jun 2021
 16:47:18 +0000
Subject: Re: [PATCH 2/6] platform/x86: amd-pmc: Fix SMU firmware reporting
 mechanism
To:     Hans de Goede <hdegoede@redhat.com>,
        "Limonciello, Mario" <mario.limonciello@amd.com>,
        mgross@linux.intel.com
Cc:     platform-driver-x86@vger.kernel.org
References: <20210617113040.1603970-1-Shyam-sundar.S-k@amd.com>
 <20210617113040.1603970-3-Shyam-sundar.S-k@amd.com>
 <14a37253-e44b-bd1d-8df3-57a127abe5c1@redhat.com>
 <f0b399a8-4262-50df-3ae7-6327cf93b4fd@amd.com>
 <5099e1d7-af97-c3fc-e5d0-442129ef3601@redhat.com>
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Message-ID: <97638dc1-529c-688d-9791-6bdc58322f60@amd.com>
Date:   Sun, 20 Jun 2021 22:17:06 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <5099e1d7-af97-c3fc-e5d0-442129ef3601@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-Originating-IP: [165.204.158.249]
X-ClientProxiedBy: SI2P153CA0007.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::8)
 To BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.152.48] (165.204.158.249) by SI2P153CA0007.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::8) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.0 via Frontend Transport; Sun, 20 Jun 2021 16:47:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 907529c4-c79f-48a9-01cd-08d9340b1086
X-MS-TrafficTypeDiagnostic: BL1PR12MB5095:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB5095DEAAD8177081A9D1C0D89A0B9@BL1PR12MB5095.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ieZEGV6HQqNGEa41aKSTh9JInTCaFrc09/MxWdLdYwi1+/uDAgLIr6WJaEpICK84x+wHT8JsaIvTrqc5rJn5tmTrvN1lzoPd/PV9i9DZUln90elIDn3YFxamroulBx604jDNS21eq8DJjU3M/wid1HRyvBTCW+WE0sGzjm2ICsZx4h2xmCIpdPJ4WS+5YycONTrGb4hW5MMyg4c/qUHJLhdKXgSPY2LQ5y929zhrv7IeDwIECkMfb3pXWiixqMXzEK6eiRdq1+CkML56Hh6Bo9TLVeN4yKkYXz007EslRdMOVtvOgsFiHULlgsTomcx9LoPnMegEXuyWz+msVY+vzP+ERJnutqo7tY3rVN5AsluKRn6mF2zMdNG8PU5LaCGyWBw51b8Ntwl6XoOMGjIDd924GzinzL0NOXzLt5JWTAnTAZCCSaypXsXFdAqWnS+Bem5W0xhb0Yq8VGYeFWZR+EQejq0T03KIw6NlMyYqOYJc6ZcWYZz4BMGWAdJQf9uCp7SOCXU3aVezLyYqCudOgSDPfSW/wg43ZlSn2Lcn1nfC/G6YJPBT61aZsCqp0Br0Mn+baPO3EnDJ97Sm7DjplG/+hhTA+tTuIgzVg2yYXWTkvFKn+d+gw78ixKiNp/ZkeWxjds6GZtNxqehE11plRUDKccKpBy62WerUvkbtCde/LZTCIL9BAXtqnkMOYL+7
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(136003)(39860400002)(346002)(376002)(16526019)(66476007)(186003)(110136005)(8936002)(478600001)(5660300002)(86362001)(36756003)(6666004)(38100700002)(66946007)(83380400001)(26005)(16576012)(31696002)(31686004)(8676002)(2616005)(4326008)(53546011)(316002)(2906002)(6486002)(956004)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d2h5TzFNSEw0K0NMeUFrZkkwTHcrNmVWSm5lNEUwRitlWEhtSmxETFJFQU1x?=
 =?utf-8?B?bUp5Y2tKUkVhSmNDOGY0UVdvbFVjd0V0QnY5WnJ0dis0d2ZPS003Wi80ZjRu?=
 =?utf-8?B?R1lpbW0ybXRyRWc2Z0VrNlRCck9FTmNCYk5ia0N1YnhzcWpiQlZNYlUxZEJ0?=
 =?utf-8?B?Y0JHb2RjclZTOVZwbjFMM3VpS2JsSTZaeGplLzFVM3owVmJ1ajNkQjdHandz?=
 =?utf-8?B?a3R2ZVc5NytYM2R3YVdhSVRGOU8wb2poSXF4MDBScXVSempPVmJTdFBXWSt1?=
 =?utf-8?B?WkxUekg0Wm8zOGRqbFVRYVhRVUhnV1gwaTllVkU0cjFhTFlobjVTRUlrWkVa?=
 =?utf-8?B?ZWNrTmhOMFRERk51N01MRStFcjkvb1J2QmU2ZHZsdEdKaTlDR2kvYXEwYmxa?=
 =?utf-8?B?YmFldlBXNmE0WTRzVlU2TExEM0hMWXRCREFwc2k3d1ZNRFhnSlk1dkJGcGM2?=
 =?utf-8?B?eUQzU3AvNUU1cHdnYzQwU0J0WkdXWllZSVBER25NdHZmRDM3dmRicjJSRUw0?=
 =?utf-8?B?TEV1U21iSnNBdkM3Qks3RmdHUDVmdVl2dldBcjJEdGtpZnJ5bjBIVVN2SThB?=
 =?utf-8?B?ZllRWm52YnAwQm01Z1Nsbkc5aTU4WVp4VW15SWVLaVRqVUU2Rjc2VHgyU3hS?=
 =?utf-8?B?TkgrTmNHLzNsREhMTmVUKzQ3SGtMayt0ck1pT3B4UFZyRWVnRWlMQlUxWndB?=
 =?utf-8?B?RVBNbzhheFV3dEkzS0xxbytlYitvZFhnQmtDY014aEQyV3crenhMWUl2OUsv?=
 =?utf-8?B?U3ZjNXZhOFBZdHdhekhTZ1dpTHFxdkRVdkNSRjErWWs0M05RVXgwQ0FGZUt6?=
 =?utf-8?B?OENhTU8rRDVIQko1ZU1SUm5NcXdSWS9xbUlhTU1iTUFNYjBEV0pYbFdmRVdP?=
 =?utf-8?B?SWRpOWdaSTg3MEpYTEs3dEJQTjBwYk9lVmJBek5JQ3NpSFFvd1RxSm5pRzJi?=
 =?utf-8?B?L29LK3RXYy9RZXNHL1N1RkJXYXJKeUJIVjVlMGx0RTRJSDhqRUIrQ0d0bDI5?=
 =?utf-8?B?cmR6R1RtZnovS01NU1M4b05GQk5oeU9jUWR6Rkc4Zi9ZM3F6bUkydERjNHhi?=
 =?utf-8?B?ZTNjckUwRzFIOFZpSDY0ZXd5L1RpTDY3L2NxSVlZL0grR25yU3pMY2N4dmM2?=
 =?utf-8?B?a3RTZnlSWHFsSWYyWmloK2NZMm9iMndkMDRnTmFMUDQvUnlYK2FjWXRmWmIy?=
 =?utf-8?B?R0w3M3Z2dDd2bXRBa2RWbGhraUFFdVBqTHMzbkFsaGRjYXcyWFhkcHNva0tj?=
 =?utf-8?B?THBKWFQydzcydEdiLy85NVRacmRUWEE4RDV4Y05Zb252aWF2VlE4a3F6VDJq?=
 =?utf-8?B?c0poOWI2VmtMSUxQeE9aYjhVVmZlMXVCM0hFM1ZaN0hkYzI2dG5pcnRvVTho?=
 =?utf-8?B?VHc2ZHZzMGZzT1F1VU5maDJ5K0oxWFRla0JiaHM0c2N6cGgxRXcxWEJsQ0NX?=
 =?utf-8?B?a3pBM0VuTS9UNHFKUTFHUW9GWWJFL25aQng5ZEhCSzJIRWJYMHAyWnBXOWlS?=
 =?utf-8?B?OS84SklCV2dTSW5VY1pGa1pJM2NOUnhmU1g0RHQvcXVDQk8wTmZGTGVhMVBs?=
 =?utf-8?B?THI0VWxYeWUremdlZHpLWUxURFVwdzhxSDZJQmdIWVdDZWVuV2ZpYlJEVnkw?=
 =?utf-8?B?eFYwZW56YzB6aCtBeEZ3a0hhZWtHK3NOR0lkMmxHK2k4RGw1RlpoL01QVFI4?=
 =?utf-8?B?S090TWRRUmpKUmp4RTIybkVFMzVvU3hEYTh1dXp4U1JXRktIblBpZDdybW9F?=
 =?utf-8?Q?52sDi9fP+kE+9LaAzL5BzFnuL85GeyI9ddWM7Zo?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 907529c4-c79f-48a9-01cd-08d9340b1086
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2021 16:47:18.0180
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H5Mf4wVD/glyiDLd20ogNWOgYby1p6vd3mqb4Z1t6vV513nrAL0zFLk0yQnbLD5H4za7apOSSnqgyKdcGRlV9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5095
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org



On 6/17/2021 11:01 PM, Hans de Goede wrote:
> Hi,
> 
> On 6/17/21 6:56 PM, Limonciello, Mario wrote:
>> On 6/17/2021 10:02, Hans de Goede wrote:
>>> Hi,
>>>
>>> On 6/17/21 1:30 PM, Shyam Sundar S K wrote:
>>>> It was lately understood that the current mechanism available in the
>>>> driver to get SMU firmware info works only on internal SMU builds and
>>>> there is a separate way to get all the SMU logging counters (addressed
>>>> in the next patch). Hence remove all the smu info shown via debugfs as it
>>>> is no more useful.
>>>>
>>>> Also, use dump registers routine only at one place i.e. after the command
>>>> submission to SMU is done.
>>>>
>>>> Fixes: 156ec4731cb2 ("platform/x86: amd-pmc: Add AMD platform support for S2Idle")
>>>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>>> ---
>>>>   drivers/platform/x86/amd-pmc.c | 15 +--------------
>>>>   1 file changed, 1 insertion(+), 14 deletions(-)
>>>>
>>>> diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
>>>> index 9c8a53120767..ce0e2ad94d09 100644
>>>> --- a/drivers/platform/x86/amd-pmc.c
>>>> +++ b/drivers/platform/x86/amd-pmc.c
>>>> @@ -52,7 +52,6 @@
>>>>   #define AMD_CPU_ID_PCO            AMD_CPU_ID_RV
>>>>   #define AMD_CPU_ID_CZN            AMD_CPU_ID_RN
>>>>   -#define AMD_SMU_FW_VERSION        0x0
>>>>   #define PMC_MSG_DELAY_MIN_US        100
>>>>   #define RESPONSE_REGISTER_LOOP_MAX    200
>>>>   @@ -88,11 +87,6 @@ static inline void amd_pmc_reg_write(struct amd_pmc_dev *dev, int reg_offset, u3
>>>>   #ifdef CONFIG_DEBUG_FS
>>>>   static int smu_fw_info_show(struct seq_file *s, void *unused)
>>>>   {
>>>> -    struct amd_pmc_dev *dev = s->private;
>>>> -    u32 value;
>>>> -
>>>> -    value = ioread32(dev->smu_base + AMD_SMU_FW_VERSION);
>>>> -    seq_printf(s, "SMU FW Info: %x\n", value);
>>>>       return 0;
>>>>   }
>>>>   DEFINE_SHOW_ATTRIBUTE(smu_fw_info);
>>>> @@ -164,6 +158,7 @@ static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, bool set)
>>>>           dev_err(dev->dev, "SMU response timed out\n");
>>>>           return rc;
>>>>       }
>>>> +    amd_pmc_dump_registers(dev);
>>>
>>> Is this addition instead of a removal intentional ?  If this is intentional
>>> this really should be done in a separate commit, with a commit message
>>> explaining why this change is being made.
>>>
>>>>       return 0;
>>>>   }
>>>>   @@ -176,7 +171,6 @@ static int __maybe_unused amd_pmc_suspend(struct device *dev)
>>>>       if (rc)
>>>>           dev_err(pdev->dev, "suspend failed\n");
>>>>   -    amd_pmc_dump_registers(pdev);
>>>>       return 0;
>>>>   }
>>>>   @@ -189,7 +183,6 @@ static int __maybe_unused amd_pmc_resume(struct device *dev)
>>>>       if (rc)
>>>>           dev_err(pdev->dev, "resume failed\n");
>>>>   -    amd_pmc_dump_registers(pdev);
>>>>       return 0;
>>>>   }
>>>>   @@ -256,17 +249,11 @@ static int amd_pmc_probe(struct platform_device *pdev)
>>>>       pci_dev_put(rdev);
>>>>       base_addr = ((u64)base_addr_hi << 32 | base_addr_lo);
>>>>   -    dev->smu_base = devm_ioremap(dev->dev, base_addr, AMD_PMC_MAPPING_SIZE);
>>>> -    if (!dev->smu_base)
>>>> -        return -ENOMEM;
>>>> -
>>>
>>> Since you are now no longer setting this, I assume that this is also
>>> not used anywhere anymore? And thus the smu_base variable should also
>>> be removed from the "dev" struct.
>>
>> It's removed in the next patch. 
> 
> Ah I missed that.
> 
>> I suppose when Shyam re-spins you're looking to have it removed in "this" patch instead.
> 
> Yes please.

OK. Thanks! Shall re-spin a v2 once you review the series on Monday.

Thanks,
Shyam
