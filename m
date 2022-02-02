Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F127FC433EF
	for <platform-driver-x86@archiver.kernel.org>; Wed,  2 Feb 2022 19:23:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230387AbiBBTXl (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 2 Feb 2022 14:23:41 -0500
Received: from mail-sn1anam02on2061.outbound.protection.outlook.com ([40.107.96.61]:41475
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229676AbiBBTXk (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 2 Feb 2022 14:23:40 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M+gv3DvwA1ekNEZazSIk5bdtkV1u7fLu1GnVxt90z+46GMBb9Cj/Amddym4ydcGqVw2wFLlFsC1YTPJL3V7sj5w2Mpm/1p88wCGg5xZ75OsEhIEZqSsSsljC39Leku2T5MCDTb4EyoJ7jSo3HkbiD25h8QOf2sxoXfH1SKwWAubJrntOcH9BiIpanMuGp/TjQdlEwTOpxccMMTMKjAMPEqi20WJGtxbL7h0L8tFNQnrZkP8KDigrn40lSw7/jg4VXgOYDrBgvIOPXjiACa6085SwqmNT9oALxEL8tlKUu8iVXH6TjODl4JW6k9i+Jqq1qILCnq7SCZitElI28i952Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y7AWrZIgzOYVhakt7Bx7SHB32+KunwAAxaRTiDByWqQ=;
 b=Pt/lR87y4mTIkeC4IMRROnIEoGmLdc6RcWWsCU+HdFl4s0vM5TGRoE8EgLEdLxDfz53Jy/ZGBhaiPitpdW6eGTIitSHvCH6j4j3ARBXpFNxJ8dhPpnBoPdRGXVpVEIN0Zvf1gt2lgbhc4tnUDK2abOP4GPYqQ1TBTa5I59uiCOjtUz2qHz+VQR9osex0701wKuPC+19FKU9ZAfdnixFzWMr8fj19ZlJ20sGcdC1YwGKumG0IImGj89ialSy3+3Uz8ZN45HnXZFc3UYJiV2UjR8nadRkoyAEpsKy8dhmlnH6TjcOn+oDYH6fBXyrUaZVWDlLgReli1XZLUzjqtmFQ5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y7AWrZIgzOYVhakt7Bx7SHB32+KunwAAxaRTiDByWqQ=;
 b=bouPp0IWU9wXZ+Wswf2xis6aB3HWxi+h3P4zilADLjTrtvN+Q4mLtNjW6kEkeC+TaE/Ejs6hK9wcjj72DKEjaAKM1ekog1p8KjBjiga+LL/k8PLlmA5cj3fadhMiokLjwmMfx1K7G9L+lgpN7wQkuiF2bm5Ihb9KmxFfijmvtLo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5157.namprd12.prod.outlook.com (2603:10b6:208:308::15)
 by BN6PR12MB1364.namprd12.prod.outlook.com (2603:10b6:404:1e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.11; Wed, 2 Feb
 2022 19:23:38 +0000
Received: from BL1PR12MB5157.namprd12.prod.outlook.com
 ([fe80::42f:534d:e82:b59f]) by BL1PR12MB5157.namprd12.prod.outlook.com
 ([fe80::42f:534d:e82:b59f%4]) with mapi id 15.20.4951.012; Wed, 2 Feb 2022
 19:23:37 +0000
Message-ID: <ca709019-9b8b-3546-49c0-9a20ec1c833b@amd.com>
Date:   Wed, 2 Feb 2022 13:23:35 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH] platform/x86: amd-pmc: Add support for AMD Spill to DRAM
 STB feature
Content-Language: en-US
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Sanket Goswami <Sanket.Goswami@amd.com>, hdegoede@redhat.com,
        markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org
References: <20220127100913.2819051-1-Sanket.Goswami@amd.com>
 <eb2b2f5c-a484-72af-b275-297533a84c57@amd.com>
 <b01dd497-2b1d-4d0e-5de6-67081986f066@amd.com>
 <7b3da1a7-cdd0-9ed4-8e0b-91c191ad9166@amd.com>
 <b8a09995-91c2-1ef1-a028-0b825f0fcebb@amd.com>
From:   "Limonciello, Mario" <mario.limonciello@amd.com>
In-Reply-To: <b8a09995-91c2-1ef1-a028-0b825f0fcebb@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH2PR11CA0029.namprd11.prod.outlook.com
 (2603:10b6:610:54::39) To BL1PR12MB5157.namprd12.prod.outlook.com
 (2603:10b6:208:308::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3fa079d8-7ea6-4f1b-b0ae-08d9e6818321
X-MS-TrafficTypeDiagnostic: BN6PR12MB1364:EE_
X-Microsoft-Antispam-PRVS: <BN6PR12MB13644E9FE71B93E439540A90E2279@BN6PR12MB1364.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /sM7JdHxzNuCxB4zIRW/AAmdhqOBxvYcN/Sx5/wsxxIVZi6ZEWoSBw/dSIw2KGloRdKFZezwyuQ444J74XIqO/mK+7VEoAQ0wN9l2ZsNHq6fAfWEKu4Ssu2ZGs4Tw5wz6aeCn8qWDcuxEqbRYC1RBXKeOsB1Kj8VpYEB1rA/XINLtD5PqakrDzwr6kzhAG4JBCskXvWv7q4hUgsZvZb5htw12KV+Nu+etndLtV0LGVG+kURGfkBMgBtzY3xOIsCw1TM+pUzbxvVNn2rpDm7jTD5myMXE2Osy9/aww4R0WCWaU8YKhRYlwJbNEh5iL0lAcNoWs14ZqtS9Zb+Qvcue2oOGS2G4O5WSVX67kIFiMqQLplzcG68xb/UjD1UtaV0w3Ut15OVgT9H/akK9GOAJGdYbFDA3S23zIu0gpL2RmvohO8sgTp8jmNbTZxmFk8p0NHcfJ4Pf/ryWJloejhkc8PZ0OyQ+keMcnY6o8Mf9IA1s6xfuDYLyY8SK3ouSygrZA1n0P5g3koetjKnj+Qqahs/t2ZY+CTmQPjCLP2PEI2H/jT+4+idlVDRqCjCQO2Psgywu+Bf6gPkp7GcEMFfpB27HU3UQbFrpMWYul5Z2ckRjrjwADY4wY69voqdPoQ39CZooPuVqOv7gwRZAsP8YQU6sd6iZiRE2PEnhVqvmAPjYADg5OULWftOe2IjEapoS2bbAHCw/H/OHGl68S4lXGHaruI0DONdrF8L+W5Qw3gnHJx7pe70IFkgiXNk0cWks
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5157.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(316002)(66556008)(4326008)(86362001)(8936002)(31696002)(66476007)(8676002)(66946007)(110136005)(5660300002)(38100700002)(2616005)(31686004)(83380400001)(508600001)(36756003)(6506007)(6512007)(186003)(26005)(2906002)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aVkxSzFkNUEyQi9QeXVBU29hZUUzR0hCb2lweTlUSndhRDQ5RDVtTUFVd2sr?=
 =?utf-8?B?bWtHeVZGbnF5MzNEczNxazNSWDZOV0tlQkVBN2FTZUx0QURsQUI4dElqZHJh?=
 =?utf-8?B?dUhpeUpHQnd6ZC90MTdsOFpUeVNoWDVTS0FkdzdKdjB4cDEzcXhoOTQ0bXRo?=
 =?utf-8?B?Mm8vWm11am44ZWd1dHB5ZjMvamZCcWV4UnVTRytYV0wwaU9jVk43M0hFZGpZ?=
 =?utf-8?B?bFc3UzVTQUZCQk1ZNHNLUWY4b09JdnEwdEFhS0ZxZisvcHh2UzU2azVwTUpN?=
 =?utf-8?B?NjBVbFpsdmQrcFNXdnJFL0tSQ0dEbHhiVm0rQlpML1d5czczMjg2Ri9ORmh0?=
 =?utf-8?B?bTFnMWlYSzl2VzNibDRZV1YxeUk3bkZiYzRQNjZHYkthdktIc2xWUHpiRVVs?=
 =?utf-8?B?MEhjYThjUkl1eC9DNnVQUVQzMjZDRFN1a2tCQS9Pb281SElJTHQ1L3dOSkdj?=
 =?utf-8?B?elZZcXVtZ01DZkZWeFRoMmw0N2oyRGdvYlFtdG03VjBKV2RoYTRGNGVETDJm?=
 =?utf-8?B?bW9vbkJ4MDJubFNZeTRycjhkeGszbUdWYUE0TFhwOHIrOG5FQkdqTEhYc1ZD?=
 =?utf-8?B?MUhPazFuQUgvR1YrZFZ2Z1BCVGVrU3IzMmNXMW5VN0lTNWxIZ0FhTlpNbktx?=
 =?utf-8?B?M2hYbkF2bUNhUy9LQWhLVS9nelkzZTNMQzZBdE1TQVh6RVBiRldjR1VYM2xS?=
 =?utf-8?B?LzhMc2UzUDBPbk00VE1kVUZKUzBmVjd2MnQ4NEM5MU1BN2JmQVljQXhxS25i?=
 =?utf-8?B?QkdxUUtTTnV2eFRVYk1mUXFBV1EwRDFrWHdwRXZkZWlyTXlkTTFhNUwwaG51?=
 =?utf-8?B?bHIwZG8vRjlEWVBYWkQzblhsb3A2NTZ1MHJpaEh1RFlVWEYwNmlvS0thOWhy?=
 =?utf-8?B?UGJ6TXBuVGQzMlArSDRCY211YXR0ZDZZUXYyUG9yOTJ2cTF0Y2ZlYkV2OGlW?=
 =?utf-8?B?bkVUYzU4SXRzeEcxQkdtTzB5Z09hbzlPd0xIYnpaK2w1dC90OCs2Ym9OMlVj?=
 =?utf-8?B?RjhTQXY3a3BWMWZHNVliWUVPb0dueEk5a0FZZVBWZ2xzcVp2U2tiY3NBcWtF?=
 =?utf-8?B?c0tTR042aEZ6MkhOQlpDMUxQbFI4MlBnWGdSSkNCdVhyTmVkL2lxUERpaDRD?=
 =?utf-8?B?OTVlMmphZ21zZDdaSGVCL0swNWxtdHhndDBjYmIyTnlFSmN1a3R2UWdtNjhl?=
 =?utf-8?B?azhUL1pNQndVMmVvQ0VuRE5xWHdnVTk4eG9nUzI5aG1zTEFrZERUOG40dHgr?=
 =?utf-8?B?VlRrV2JRUWFMdkxtdUIxTldRc2J2ME1hM2tRY3BFSS96RCt2ZDhmUGVRc1l6?=
 =?utf-8?B?b0FKYUpTbjFkM1l2T1RqSFZEYXVWR3h2OXVDQUlDc3JOS2s3SjcyYnhRd3J4?=
 =?utf-8?B?QTdUNEdkR2M1Q0FKQkVIZ3lkMjB0dGVxVE5VMHppN2wwNW9LV3MwRjFYdlVS?=
 =?utf-8?B?aDEzWjU5UmN3UUsyNWtHTmFWbzF0RXFrdjVkcE80L1crT05aMVYraW1SWmh0?=
 =?utf-8?B?bUgySngxNHFTbzN1TGJqelBCc3VjYndlSDZ6OS91Y1RLb2dqcWNQK01XcHZQ?=
 =?utf-8?B?Ym96cXFaTnNOTUJ3NEhGakU2R0ZZdkh6UEtiRWo1MCtOQzZnNlhWZjRWSDVL?=
 =?utf-8?B?VTdoTzJqQUh4a1Y4SlVzUk1jYks3cGs3QXUvT3ZyeC9HWWozN1prN0RiTVZC?=
 =?utf-8?B?THlGZ01FeVNSQlFhTEovQkE0Q29oeDM5K2VlV2tQak1kclZFcWpNQXM0Y1Yz?=
 =?utf-8?B?c3RicjNGTmgzTTNHMVVNbnFqUFJoVkFoVEJoZ1pZczBNbmNjczRPMFhTeUpv?=
 =?utf-8?B?UWp1aDdNMGM3Tk9wV1FndWpmVFIyMHBNY09lbkNIRFdjTDdTYThvZ0RYTkFz?=
 =?utf-8?B?SGhpSVBxTko0ZnIvdzIxRTVTcU5vTTFXVklGKzI2UkVRV0JxWUJ3MUtOTDhO?=
 =?utf-8?B?eFBDM3lvKzNkd1A0Yk5VV3dldXdUcFhKZE5iRUMzYUVnVjR4ZFhINmlNbkxT?=
 =?utf-8?B?S3hQTWNtbWZDMEtkaXRiT1htRVNlbDV3TGdBN1BiRXlUN0ZZNlRremdzMzhp?=
 =?utf-8?B?dTN0c0RnNjgzK1AwQjJHVjNueEl2NGxUWE9kUCsvNEY4R0R6ZzFUL1RNbVA1?=
 =?utf-8?B?dFErUUZBcDVRQm9KZEs4a2JQakVTd1ZJNUp0QU4zMnU3L3hlT3dxUlIwQ251?=
 =?utf-8?Q?kOv+DV2rRoA/fJhLiFdMITE=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fa079d8-7ea6-4f1b-b0ae-08d9e6818321
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5157.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2022 19:23:37.7953
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TLC0gtOgwE35aA8IPoGKPLkc0xLRsmR0Hhd9gh6dg+vMDVwaCZzQ14UXHQIgdoveJbUWjLi7y/IvQuEfmvwEOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1364
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org


>> I don't think you followed my thought process here.
>>
>> If `amd_pmc_stb_debugfs_open_v2` is called then dev->msg_port is set to 1.
>>
>> So that means that any future call to `amd_pmc_send_cmd` (such as is
>> done for OS_HINT) will use the STD registers.  So doesn't that mean
>> OS_HINT is sent to STD registers?
>>
>> If STD registers support all the existing commands as the PMC registers
>> this is fine, otherwise I think there needs to be more logic to check
>> whether the command is PMC or STD related.
> 
> ah..I get your point now..

OK glad it makes sense and is a valid worry.

> 
>>
>> But you only allow size to be S2D_TELEMETRY_BYTES_MAX, shouldn't you be
>> flexible to a range of what the firmware returns rather than the single
>> value?
> 
> the value is derived after querying the FW, atleast by design today for
> yellow carp devices the FW team has confirmed that it shall remain 1M
> (even the next ASIC version too).

Very well - I suppose if this is fixed in the FW for YC when another 
ASIC changes this the driver can just change then too.

>>
>> I think those only take account when unloading the driver or unbinding
>> the device though, don't they?  So if devm_ioremap worked but kzalloc
>> failed then you call `amd_pmc_stb_debugfs_open_v2` again without unbind
>> or unload driver devm_ioremap will be called again too.
> 
> Makes sense. Will move them to a new routine maybe something like
> amd_pmc_s2d_init() and call that from the probe() so that should address
> this problem.

Yeap, sounds good.

> 
> shall respin a new revision.
> 
> Thanks,
> Shyam
> 
>>
>>>
>>> Thanks,
>>> Shyam
>>>
>>>>
>>>>> +
>>>>> +    memcpy_fromio(buf, dev->stb_virt_addr, S2D_TELEMETRY_BYTES_MAX);
>>>>> +
>>>>> +    filp->private_data = buf;
>>>>> +
>>>>> +    return 0;
>>>>> +}
>>>>> +
>>>>> +static ssize_t amd_pmc_stb_debugfs_read_v2(struct file *filp, char
>>>>> __user *buf, size_t size,
>>>>> +                       loff_t *pos)
>>>>> +{
>>>>> +    if (!filp->private_data)
>>>>> +        return -EINVAL;
>>>>> +
>>>>> +    return simple_read_from_buffer(buf, size, pos, filp->private_data,
>>>>> +                    S2D_TELEMETRY_BYTES_MAX);
>>>>> +}
>>>>> +
>>>>> +static int amd_pmc_stb_debugfs_release_v2(struct inode *inode, struct
>>>>> file *filp)
>>>>> +{
>>>>> +    kfree(filp->private_data);
>>>>> +    return 0;
>>>>> +}
>>>>> +
>>>>> +static const struct file_operations amd_pmc_stb_debugfs_fops_v2 = {
>>>>> +    .owner = THIS_MODULE,
>>>>> +    .open = amd_pmc_stb_debugfs_open_v2,
>>>>> +    .read = amd_pmc_stb_debugfs_read_v2,
>>>>> +    .release = amd_pmc_stb_debugfs_release_v2,
>>>>> +};
>>>>> +
>>>>>     static int amd_pmc_idlemask_read(struct amd_pmc_dev *pdev, struct
>>>>> device *dev,
>>>>>                      struct seq_file *s)
>>>>>     {
>>>>> @@ -350,9 +428,14 @@ static void amd_pmc_dbgfs_register(struct
>>>>> amd_pmc_dev *dev)
>>>>>         debugfs_create_file("amd_pmc_idlemask", 0644, dev->dbgfs_dir,
>>>>> dev,
>>>>>                     &amd_pmc_idlemask_fops);
>>>>>         /* Enable STB only when the module_param is set */
>>>>> -    if (enable_stb)
>>>>> -        debugfs_create_file("stb_read", 0644, dev->dbgfs_dir, dev,
>>>>> -                    &amd_pmc_stb_debugfs_fops);
>>>>> +    if (enable_stb) {
>>>>> +        if (dev->cpu_id == AMD_CPU_ID_YC)
>>>>> +            debugfs_create_file("stb_read", 0644, dev->dbgfs_dir, dev,
>>>>> +                        &amd_pmc_stb_debugfs_fops_v2);
>>>>> +        else
>>>>> +            debugfs_create_file("stb_read", 0644, dev->dbgfs_dir, dev,
>>>>> +                        &amd_pmc_stb_debugfs_fops);
>>>>> +    }
>>>>>     }
>>>>>     #else
>>>>>     static inline void amd_pmc_dbgfs_register(struct amd_pmc_dev *dev)
>>>>> @@ -392,26 +475,47 @@ static int amd_pmc_setup_smu_logging(struct
>>>>> amd_pmc_dev *dev)
>>>>>       static void amd_pmc_dump_registers(struct amd_pmc_dev *dev)
>>>>>     {
>>>>> -    u32 value;
>>>>> +    u32 value, message, argument, response;
>>>>> +
>>>>> +    if (dev->msg_port) {
>>>>> +        message = AMD_S2D_REGISTER_MESSAGE;
>>>>> +        argument = AMD_S2D_REGISTER_ARGUMENT;
>>>>> +        response = AMD_S2D_REGISTER_RESPONSE;
>>>>> +    } else {
>>>>> +        message = AMD_PMC_REGISTER_MESSAGE;
>>>>> +        argument = AMD_PMC_REGISTER_ARGUMENT;
>>>>> +        response = AMD_PMC_REGISTER_RESPONSE;
>>>>> +    }
>>>>>     -    value = amd_pmc_reg_read(dev, AMD_PMC_REGISTER_RESPONSE);
>>>>> +    value = amd_pmc_reg_read(dev, response);
>>>>>         dev_dbg(dev->dev, "AMD_PMC_REGISTER_RESPONSE:%x\n", value);
>>>>>     -    value = amd_pmc_reg_read(dev, AMD_PMC_REGISTER_ARGUMENT);
>>>>> +    value = amd_pmc_reg_read(dev, argument);
>>>>>         dev_dbg(dev->dev, "AMD_PMC_REGISTER_ARGUMENT:%x\n", value);
>>>>>     -    value = amd_pmc_reg_read(dev, AMD_PMC_REGISTER_MESSAGE);
>>>>> +    value = amd_pmc_reg_read(dev, message);
>>>>>         dev_dbg(dev->dev, "AMD_PMC_REGISTER_MESSAGE:%x\n", value);
>>>>>     }
>>>>>       static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32
>>>>> *data, u8 msg, bool ret)
>>>>>     {
>>>>>         int rc;
>>>>> -    u32 val;
>>>>> +    u32 val, message, argument, response;
>>>>>           mutex_lock(&dev->lock);
>>>>> +
>>>>> +    if (dev->msg_port) {
>>>>> +        message = AMD_S2D_REGISTER_MESSAGE;
>>>>> +        argument = AMD_S2D_REGISTER_ARGUMENT;
>>>>> +        response = AMD_S2D_REGISTER_RESPONSE;
>>>>> +    } else {
>>>>> +        message = AMD_PMC_REGISTER_MESSAGE;
>>>>> +        argument = AMD_PMC_REGISTER_ARGUMENT;
>>>>> +        response = AMD_PMC_REGISTER_RESPONSE;
>>>>> +    }
>>>>> +
>>>>>         /* Wait until we get a valid response */
>>>>> -    rc = readx_poll_timeout(ioread32, dev->regbase +
>>>>> AMD_PMC_REGISTER_RESPONSE,
>>>>> +    rc = readx_poll_timeout(ioread32, dev->regbase + response,
>>>>>                     val, val != 0, PMC_MSG_DELAY_MIN_US,
>>>>>                     PMC_MSG_DELAY_MIN_US * RESPONSE_REGISTER_LOOP_MAX);
>>>>>         if (rc) {
>>>>> @@ -420,16 +524,16 @@ static int amd_pmc_send_cmd(struct amd_pmc_dev
>>>>> *dev, u32 arg, u32 *data, u8 msg,
>>>>>         }
>>>>>           /* Write zero to response register */
>>>>> -    amd_pmc_reg_write(dev, AMD_PMC_REGISTER_RESPONSE, 0);
>>>>> +    amd_pmc_reg_write(dev, response, 0);
>>>>>           /* Write argument into response register */
>>>>> -    amd_pmc_reg_write(dev, AMD_PMC_REGISTER_ARGUMENT, arg);
>>>>> +    amd_pmc_reg_write(dev, argument, arg);
>>>>>           /* Write message ID to message ID register */
>>>>> -    amd_pmc_reg_write(dev, AMD_PMC_REGISTER_MESSAGE, msg);
>>>>> +    amd_pmc_reg_write(dev, message, msg);
>>>>>           /* Wait until we get a valid response */
>>>>> -    rc = readx_poll_timeout(ioread32, dev->regbase +
>>>>> AMD_PMC_REGISTER_RESPONSE,
>>>>> +    rc = readx_poll_timeout(ioread32, dev->regbase + response,
>>>>>                     val, val != 0, PMC_MSG_DELAY_MIN_US,
>>>>>                     PMC_MSG_DELAY_MIN_US * RESPONSE_REGISTER_LOOP_MAX);
>>>>>         if (rc) {
>>>>> @@ -442,7 +546,7 @@ static int amd_pmc_send_cmd(struct amd_pmc_dev
>>>>> *dev, u32 arg, u32 *data, u8 msg,
>>>>>             if (ret) {
>>>>>                 /* PMFW may take longer time to return back the data */
>>>>>                 usleep_range(DELAY_MIN_US, 10 * DELAY_MAX_US);
>>>>> -            *data = amd_pmc_reg_read(dev, AMD_PMC_REGISTER_ARGUMENT);
>>>>> +            *data = amd_pmc_reg_read(dev, argument);
>>>>>             }
>>>>>             break;
>>>>>         case AMD_PMC_RESULT_CMD_REJECT_BUSY:
>>>>
>>

