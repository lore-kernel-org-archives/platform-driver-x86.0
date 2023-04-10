Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 937F7C77B61
	for <platform-driver-x86@archiver.kernel.org>; Mon, 10 Apr 2023 17:35:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229830AbjDJRfl (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 10 Apr 2023 13:35:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229645AbjDJRfj (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 10 Apr 2023 13:35:39 -0400
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2087.outbound.protection.outlook.com [40.107.212.87])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 789B72686
        for <platform-driver-x86@vger.kernel.org>; Mon, 10 Apr 2023 10:35:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ikvG0tbju7n0qrommfFiTEqEtq6rp4/799xiJQP7SEEdLVGKeHIdj9Fj35yopUsdPj/WELllnAC+zaVxLJXpZpBjSRZKjbfex/wfJpnggsyYGaIyfrfcidEERBVZxKaVKW5AdQHiUcLBmyZrU6WgbBRAApLQ8g0CrBhnX4p5zcQmAso9X2KYteybJsk/LqP1fxA9xKTV78gXhisY3pX28ktsxDLG5QsgzTcc90BGSS2hs7+TcPFLukxSd0fUMzZKO4qyyR/wvHsNDT2u5GWuE4Ti17xgNcuWFlFZRnUBLT6Chae0kjG9q9CyXa24TMkTXwsWbNb2EbAm+G6GKuOyVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3X2UWlvKrLu5xFIgcl4MjPvafwR3J8oQA+TXMKPBgYU=;
 b=mIaTVaN1/cD7VAQzjaikvUFDUgr/myMyNABR0R2EU+13VVupUnCffV2oLMw8CltbARbbIMQo7qrgBOmvaNsC/9/+r2Jwvz6ZlcqzrKbHJJ6QGFoEQZM4QRFjmjh9Oha6xTD+y56hxXLCHCwUw034kXllIw8lpe+I6jF9ZoY3m3SVzXLFGLl5cAMSHdZuLpCoih+Bj16OXTF91xDjhiAU9ADqxCao2kyQ12+DWNOGYulCGQn6TIdBhhHF+cuBBrOwuvtuIve7hBQeCW1LE2m/P9T56eZrYzP7ieLy69wbdq5P1ooUlU/1FYreKv/MVTDjI6KX9nFqoD2B/yhiWUeUVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3X2UWlvKrLu5xFIgcl4MjPvafwR3J8oQA+TXMKPBgYU=;
 b=eVL+Az662FRP3kc/bS1I7WjoBOUbuaZeRRbch1NikeOdbgncEMxdKoHrUSSIbjBx4HNCSKHTFFaGhTe2DNbL3BOkR3yXRqhklAiIok/SQHL+ZtOP8xDD2jraVJHAMfJKjKIkoQ8VWvoHG42skek+kQS8borUBvr7GV6cDXz1DWI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by SN7PR12MB8819.namprd12.prod.outlook.com (2603:10b6:806:32a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.36; Mon, 10 Apr
 2023 17:35:34 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::70d7:b03e:aecf:3b6d]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::70d7:b03e:aecf:3b6d%6]) with mapi id 15.20.6277.038; Mon, 10 Apr 2023
 17:35:34 +0000
Message-ID: <79e72f1a-b2f0-b55d-26e8-4880ef5cd941@amd.com>
Date:   Mon, 10 Apr 2023 23:05:25 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH 7/8] platform/x86/amd: pmc: Get STB DRAM size from PMFW
To:     Mario Limonciello <mario.limonciello@amd.com>, hdegoede@redhat.com,
        markgross@kernel.org
Cc:     Sanket.Goswami@amd.com, platform-driver-x86@vger.kernel.org
References: <20230409185348.556161-1-Shyam-sundar.S-k@amd.com>
 <20230409185348.556161-8-Shyam-sundar.S-k@amd.com>
 <0a38a599-b0fe-630d-5367-7ae38a01c566@amd.com>
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <0a38a599-b0fe-630d-5367-7ae38a01c566@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0027.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::11) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|SN7PR12MB8819:EE_
X-MS-Office365-Filtering-Correlation-Id: 5666c601-48d3-4b7d-3ca9-08db39e9fd03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OCiup/sPu1auhMu8DlhoBDLnlxN6pZ7BHF9z/XCP9jcXii957XXb+ncwN0rs+ForS8/I5i3xCASlk22c3Rx2bb/DHWmJ1aYXOLRHnrATTiDTAr67TnxCWJRu9KKtuZ/Pm5cLhwiU61qbY2TV2gFzqm2u3MNx7ZZr6NELlEPAbigNs8Qz9rllobr9TyBHop/Pkptcpgfs7AqT8mech1xoHGOAKH22XnhkIpT8y4oEtMl9hVQaUGoT0JFdQOIPlyV/fQ3/10HVapNvKoTYudI2teQpurm5E1GoTcGDmVlp1PuFLafxNoiHdTSrXdsohCAPo4RPOznSFr5P2oMkRt3x/Vck9AL/ki5qHKQuPEGs0JO2Y2RrpICzvJUlmv0J86cHbw2RW9Q27TEZb7RMdfCOv+TmR+uoXrVuRF7n3uHlQ2CkxR/NR7mDkZYD2I7fFbbPhWr4JOFDR8UQX4L0IfLuWr9g5Kc6MVSbYsM4NYqGRddrWf/wsmCrrPQRRKlC4cMQPk/FFrUokEUYmiEEgy8QZGIrGm11/2GVvqGajZusGrFxxGR5TXXoT/lQVq9umPatoZV8hybYEr6si5mNoX5Dojgr1Y6/qVXRZlsX5RHpoptQ87Iumg9XC2XYxGc+XwDnd4IykBgK33KFG/f7Feh38Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(136003)(376002)(396003)(346002)(39860400002)(451199021)(478600001)(316002)(6512007)(53546011)(6506007)(186003)(6486002)(6666004)(2906002)(5660300002)(4326008)(66946007)(8936002)(8676002)(41300700001)(66476007)(66556008)(38100700002)(86362001)(31696002)(36756003)(83380400001)(2616005)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VUVGU09HdWdGbzM2VW1JNGFYcnhuTk42SDFxT3hKTkhiNHJtRmxKOE43Vjlh?=
 =?utf-8?B?SDVtY2RURVEyVHIvNEpLcU1qWUwvRzVVMWpUb3ZYQlhtbnRwaFF5VGJud3BV?=
 =?utf-8?B?SElhQnQ0R2t5V3V3eDc0Ri8rcDZlQkt1Z0cvNDB0MlZIS3hSK0t1VG8wN2Ew?=
 =?utf-8?B?TVFUU0VVakE3TFptQ2Y2OE5vSkZ1aExERDMyTC9KVFhTc0dTZFdMNEJOZnZq?=
 =?utf-8?B?dVloMFVscTBJY25ua2tEN3ZpSlVueTM0ZmpEdXhYNXhKaWZLejgxR3Q4N1cw?=
 =?utf-8?B?eUNFMk1FcDRQSUs4MVNGNlBjUnVxdHBJVFoxTnFOaEw5cUYva0pFNWkzSEx6?=
 =?utf-8?B?ZkRreGJudGRzOVJrNjlsVGRmNzBrRnFUR2VmbWYrSkVmajYvMUUwVjNlRHVv?=
 =?utf-8?B?VWhyRlBQQkNXOWtxVGxoTjArSG5OZld1RDI1dGkxUjZQQXQ5cGVpdDNZYzRF?=
 =?utf-8?B?WFkyMmt2ak4zMHpERHlVdHlVN3dNTGk4YUNrSGxnZTFYeURLZHV5c1ZOTmsw?=
 =?utf-8?B?YjJrdnR3eVByOHd0NXlxYmNueU93VnpPRGVoS29HcGRhYzU4dkkremRwVjZH?=
 =?utf-8?B?T3hvQjZNMWZ1bXE4Z0JhZDdQZ0FTaTdneDdmeGYwT2M3MWRlSFkwOXBWWC93?=
 =?utf-8?B?WjEvdjdRc0M2SHEvSVFRYWxsdzNPT0sydHRyQU9IQWpyTmMzdE1VcXJ3UXc5?=
 =?utf-8?B?WFJXc0ljd0hwNDlXSGR2eitqaXV6RWVScG9UUDAyVUdxVnJtclBSUDlFd2Vp?=
 =?utf-8?B?dnh4MHRBazFxUlk2WHlCYkRmKzRZL3JMTVYrMFRidHRzcWFzL3YwSWVzQWpY?=
 =?utf-8?B?UTI3WmJmc05NeUg0djdZUkZKSXNXcXN0VmhGcTZkRkdJMzNtMHg3akltQjZR?=
 =?utf-8?B?UjFlQnJSdFA4SUJvakc5dWNadjR6M3k1clF3T0E0OG9GeHRvZTNjZ3JWV1ZN?=
 =?utf-8?B?VXVVN3dFZHJiTzY1OW1pZkxITFZlZjJNTmk1RUY0RVBuRlZpVFVtcUlaRTF0?=
 =?utf-8?B?aXpzZFBhYXozaHNXUm1rTHpWVVg0UmlZTFdQY0ZXYWd2YlZNVFBZNHIyUGFL?=
 =?utf-8?B?NW05NW1rVW9XRTcyTGVLbHpyWjBKZ3JBOUs3cWxXU0R6VnNGcVIxTm5OQnlB?=
 =?utf-8?B?SXdTU21BajNmVTlQMGJ3Y3hHSE5NZEtOM1gva1RmVmpleUM5R0R5K0FISVhQ?=
 =?utf-8?B?S0FhYmNnRXhWSlgxRnRkaDRFaTRtamNsSU9GeUhZeFNrdmR3cnNueUNNMWtj?=
 =?utf-8?B?T2Q3Nnh0bXZFTXdnWkZxaWtRZkYrbmZSZFh4QzdVc3dFQmFaQVcyUm90cUNQ?=
 =?utf-8?B?N1hwNklNTnJZYVhPZHRpa25EV1RuY2RzUTcxeUhuVWdjUzFuUDlNSXI5Rmxx?=
 =?utf-8?B?b3huM01tazhsWjViZ1RUTXJCQ2NDSWRsY1V4VWRxdlJhcmoxWTkzTWF4YXBL?=
 =?utf-8?B?RmNESGFWRTEwN2lhaEZRbStpZndHUnZ6WEs5UGhYbUVpSXljQ3VRVndkaDFQ?=
 =?utf-8?B?RWd3L2dkZlhIWEY2T1VTaTFVV1AwOVluYVpPenBRMlRRTHVMdFNkSmpCM1Ny?=
 =?utf-8?B?dXVsaU5TN3d6UXM4K283NEdZUkF3TWxhSHk5MlpOcjh6T3RRWS9BUDVyNStW?=
 =?utf-8?B?a1ZJcXN4Q2ZaZytuakJycDlQZTRSQjB1eks2Q2gyY1BZYW9GbUNnSDg4NEZ0?=
 =?utf-8?B?L1BhR0tjSXdPbTBySkNzN05tQmNVTWZNTzZNNDh0aC9rSVJ1bk4ydWFLYUpi?=
 =?utf-8?B?aUVobkc5TldpNHVObk43WEN1Z3VLTVROSEUyRDBVRW9hTmR0QTFZMGszdnlV?=
 =?utf-8?B?V0dmUVF3aVUwdGxUWFh4MTB3MVlhTnY3bEhHYUVXTWozYXZvSHp4QkVSRU9Y?=
 =?utf-8?B?VlU3czVDQStxdU45S21GTjU5ajlvckdkZ09GUGFTdHEzVnZhQjFUeVRGMG03?=
 =?utf-8?B?L05LV202SWxMUXVKcThXNVUwMDVlSmVoaXFPWG96dTlJY2lVUGtRWTdDak0w?=
 =?utf-8?B?WDFzY2NFeE5laHRiK0t6UG5HTVR0N3BtUFovL21ycW13WTliRDdxNERnbXRa?=
 =?utf-8?B?Y0xzcStsajQ4TW92dDY0TGlHT3pRcXBoc0FUaXFYYklWNDFVL043RGUxZ3Rl?=
 =?utf-8?B?R01hcjdSdHdOL0VTL0J5VGd4MlhzUEpVTEliTFFZa2FKYXdkMURRWnEvMnRK?=
 =?utf-8?Q?35tjiRrpijxHNJnp6WKiq7d2EEPYF5DifnU6UaatqglF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5666c601-48d3-4b7d-3ca9-08db39e9fd03
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2023 17:35:34.1644
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uCVR7YPEeWjkcloJ/scdVxCPqb1kplsNdLLU2el6jcgT1UEi/viLiPkrfw7k12cr+3Kw2JiU+WqMnFSR+kiABg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8819
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org



On 4/10/2023 2:18 AM, Mario Limonciello wrote:
> 
> On 4/9/23 13:53, Shyam Sundar S K wrote:
>> Recent PMFW's have support for querying the STB DRAM size. Add this
>> support to the driver.
>>
>> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
>> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>>   drivers/platform/x86/amd/pmc.c | 29 ++++++++++++++++++++++++++++-
>>   1 file changed, 28 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/platform/x86/amd/pmc.c
>> b/drivers/platform/x86/amd/pmc.c
>> index b14d068a6474..86f32b01e3ff 100644
>> --- a/drivers/platform/x86/amd/pmc.c
>> +++ b/drivers/platform/x86/amd/pmc.c
>> @@ -114,6 +114,7 @@ enum s2d_arg {
>>       S2D_PHYS_ADDR_LOW,
>>       S2D_PHYS_ADDR_HIGH,
>>       S2D_NUM_SAMPLES,
>> +    S2D_DRAM_SIZE,
>>   };
>>     struct amd_pmc_bit_map {
>> @@ -146,6 +147,7 @@ struct amd_pmc_dev {
>>       u32 base_addr;
>>       u32 cpu_id;
>>       u32 active_ips;
>> +    u32 dram_size;
>>   /* SMU version information */
>>       u8 smu_program;
>>       u8 major;
>> @@ -895,11 +897,31 @@ static const struct pci_device_id pmc_pci_ids[] = {
>>       { }
>>   };
>>   +static int amd_pmc_get_dram_size(struct amd_pmc_dev *dev)
>> +{
>> +    if (dev->cpu_id != AMD_CPU_ID_YC)
>> +        goto err_dram_size;
>> +
>> +    if (dev->major > 90 || (dev->major == 90 && dev->minor > 39))
>> +        goto err_dram_size;
> 
> Is this only for YC and not for PS?

Its only YC for now, as this is important of the Chrome work. FW team
has to still port the same change from YC to PS branch.

Once that is done, we can make other changes too. Agree?

Thanks,
Shyam

> 
> The version check I think you should make it clear it's only intended
> for this program.
> 
> switch(dev->cpu_id) {
> case AMD_CPU_ID_YC:
>     if (version_check)
>         goto err_dram_size;
>     break;
> 
> default:
>     goto err_dram_size;
> 
> }
> 
> Then when it comes time to add another system it either will need a
> localized
> version check or it will just be supported and no check needed. Either
> way it
> is cleaner in the code.
> 
>> +
>> +    amd_pmc_send_cmd(dev, S2D_DRAM_SIZE, &dev->dram_size,
>> STB_SPILL_TO_DRAM, 1);
>> +    if (!dev->dram_size)
>> +        goto err_dram_size;
>> +
>> +    return 0;
>> +
>> +err_dram_size:
>> +    dev_err(dev->dev, "DRAM size command not supported for this
>> platform\n");
>> +    return -EINVAL;
>> +}
>> +
>>   static int amd_pmc_s2d_init(struct amd_pmc_dev *dev)
>>   {
>>       u32 phys_addr_low, phys_addr_hi;
>>       u64 stb_phys_addr;
>>       u32 size = 0;
>> +    int ret;
>>         /* Spill to DRAM feature uses separate SMU message port */
>>       dev->msg_port = 1;
>> @@ -908,6 +930,11 @@ static int amd_pmc_s2d_init(struct amd_pmc_dev *dev)
>>       if (size != S2D_TELEMETRY_BYTES_MAX)
>>           return -EIO;
>>   +    /* Get DRAM size */
>> +    ret = amd_pmc_get_dram_size(dev);
>> +    if (ret)
>> +        dev->dram_size = S2D_TELEMETRY_DRAMBYTES_MAX;
>> +
>>       /* Get STB DRAM address */
>>       amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_LOW, &phys_addr_low,
>> STB_SPILL_TO_DRAM, 1);
>>       amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_HIGH, &phys_addr_hi,
>> STB_SPILL_TO_DRAM, 1);
>> @@ -917,7 +944,7 @@ static int amd_pmc_s2d_init(struct amd_pmc_dev *dev)
>>       /* Clear msg_port for other SMU operation */
>>       dev->msg_port = 0;
>>   -    dev->stb_virt_addr = devm_ioremap(dev->dev, stb_phys_addr,
>> S2D_TELEMETRY_DRAMBYTES_MAX);
>> +    dev->stb_virt_addr = devm_ioremap(dev->dev, stb_phys_addr,
>> dev->dram_size);
>>       if (!dev->stb_virt_addr)
>>           return -ENOMEM;
>>   
