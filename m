Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE004C77B6E
	for <platform-driver-x86@archiver.kernel.org>; Sun,  9 Apr 2023 20:48:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229480AbjDIUsa (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 9 Apr 2023 16:48:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbjDIUs3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 9 Apr 2023 16:48:29 -0400
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2063.outbound.protection.outlook.com [40.107.212.63])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B610A273A
        for <platform-driver-x86@vger.kernel.org>; Sun,  9 Apr 2023 13:48:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WEHd1Kzo+yzfllWX/u/XoSFVGFUZ55rpd8m4x093rVBOcAcTS+dBh7hogKM80z5uHZtONnjlFOvShIAMgZAhxhY7XrrPtR4+3upnEtfPOYU3SSn+5zE6PMblohFAxu9SWbJ2j8/tSxv9c/1C3OJLwbD0zvPr6Q9fk7nJN0zh+4UKfdlJWrsWjz6GjQkap5o2aZIhCpsoKNutOwjh1Pmk4cCRxshYdL1fWgKbFPLUmR4cNt6OwZNtuUuKPbbjVQKZ78whs7vARLvngkEHX/H1GVFq7o/6YOmPB1SLl9IJHo4OXjfVIAAJpgviPl+zKtidMDyE7goAb39UiR1X/j2afg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m8HnaEW/Tve6JYvbiMxAsS1+IqnvkyrRnKVspuEnfLA=;
 b=XKPvGb+kMfRovwdepMt1gCKxWCnXcwdZpf+z5orH6ZHH3+LemBOS/LuFkNKpNGv21pIIw9/82daxGrV4jmAzxjJqd6uln3cIOWS+zzUiDC7LOJJlJk33j58Nh+T0tsB4UmCLvQ7D73UYSvsnNEXPRzOHQcCjy014pOgJRGSmPXJtCs1RyMxVXKKOYe82yB2QUNyYSUBXcuKFnwkEsEoTTlkBoFpj9evMrIwsJyWrxwT0/xa3bWaI8qIxnq7PvFAg81EZPUlglA2eolx52q8C7jopgaadl3a0g7B5COkROEUnMt0/wMx54bFFwSC/ZO0Eob5N2kgkB3HpcDBKm5DGPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m8HnaEW/Tve6JYvbiMxAsS1+IqnvkyrRnKVspuEnfLA=;
 b=4RgIve2xBFLtwDKwr5eAfGZ8qn/HTmcSx5Pwp//qoNvz8NIsXZFXiOlbxsqzdDytPJt9c1zsIMgUHzIqxh3/419UCa7ntpUvPaMe5UDbqRrmPcapWtBRUK5JxJPEfULbJzLkhtD2wCz6kqg6+RRql2ujy5ZttdExUmQOg5UvaMs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SA1PR12MB7197.namprd12.prod.outlook.com (2603:10b6:806:2bd::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.35; Sun, 9 Apr
 2023 20:48:23 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::f4d:82d0:c8c:bebe]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::f4d:82d0:c8c:bebe%2]) with mapi id 15.20.6277.036; Sun, 9 Apr 2023
 20:48:23 +0000
Message-ID: <0a38a599-b0fe-630d-5367-7ae38a01c566@amd.com>
Date:   Sun, 9 Apr 2023 15:48:18 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 7/8] platform/x86/amd: pmc: Get STB DRAM size from PMFW
Content-Language: en-US
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
        markgross@kernel.org
Cc:     Sanket.Goswami@amd.com, platform-driver-x86@vger.kernel.org
References: <20230409185348.556161-1-Shyam-sundar.S-k@amd.com>
 <20230409185348.556161-8-Shyam-sundar.S-k@amd.com>
From:   Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20230409185348.556161-8-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN6PR08CA0022.namprd08.prod.outlook.com
 (2603:10b6:805:66::35) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SA1PR12MB7197:EE_
X-MS-Office365-Filtering-Correlation-Id: 611583fc-7bc9-4d93-2a83-08db393bc271
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MQvXUdFHHx+P+O0SFY8tUjnf+yRdIOUA4aAVXLg+wYd1nATPSfU8I+MDOLyttNc/Quhue8qmC2rUZgkh094aRnhBz6YDIyxCU3FH8Bry31SiWDQzlI7gb6V2GkVwaD0KD+en4i2CILFbUnpXMkVlAqD90xi5SYRJ0L1DDJp6fICtxb1O4od9vtitM6zTQuUIfcmx2nHCn9pjTTQHTv7xaVi5efjjFrMnV84AtYJzLIpXNiBD2r7KNIu0FAX6JtdBu7hNnyDErcnOhGGZVzXEcL12No9t69PGmM9I5TVVQ5nN6bDeJPMk7huzAZcOFFHStTNBC0n8IThQUOdvjrUl2/UVZYkLW9WyOS87IWjNIPiMGf0nUXVWakH341rMAWreZMA+XbVexF6wdUXu0obv6ZmqdVQ8ES7xF6p0MB3LNrJrTTvbCCCznFGRSHaoYeOCTd6bUaYMEVOpK/ldfke0R3AWNZwII78/LXOLZ7lmjrp4wrCU+SwBXSc4Ykm6wUgaBdmAcihbgTV5R8ZfhPLLhhW3DkN8enkXOGvuR/rmgvLLWYJWgWYxuQ9bYV9hHts/WYzijKQMgPv3u1vJ8dqSJYINyORSFf86wFIKICQtB10kjeKezWNxiBHzWjX02ZiIejgD9GXA8xVzBwJ/s6+izg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(376002)(346002)(39860400002)(366004)(451199021)(6666004)(8936002)(44832011)(6486002)(5660300002)(31696002)(86362001)(66556008)(66476007)(66946007)(8676002)(4326008)(478600001)(38100700002)(316002)(31686004)(2906002)(53546011)(6512007)(6506007)(2616005)(83380400001)(41300700001)(36756003)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T3gwQSt6eTQ3SmpJZVFyakRrcDhvVkorU2E4S04rcFUzQzFXRmdBZU5KYjlC?=
 =?utf-8?B?bCtVRnluL3prVDcwY3lSbVpnOC9CVFlLRE90b25EWkZFSHd6cnlhMFJpTTcz?=
 =?utf-8?B?R3Fkckpqb1FPTVAyazQ2NVVoaEIvQlh2djVlNzJ5NmhiZ3gzM3Q0UDZvZkc2?=
 =?utf-8?B?VVhtNzVEYlZ5S0d4c1U0K1psZ3NBRjVxb2lSYzBDdWxZQ29xRTJiek9zcysr?=
 =?utf-8?B?L2MrMVEwMmtwaWsxWXlIM1RIN3pkWDIrM0FJV01RZnp5b1J0OHN4RFVTRk9l?=
 =?utf-8?B?aGU4dVpxeU9wcExnajdCRmtYMlMvVnNyNnBmVUIrVkp1RCtzSGdvcWxBOHR4?=
 =?utf-8?B?Q3FjRTRPWXpUZlBCSE5nZ3Fvc1FManV1ZHBpbHRSdHgvaXNWbkRqb0piK3g3?=
 =?utf-8?B?SGJqQTVrUEw5LzlhU1ZhYkovZ3hmRHVmYTNXS1ZRY3hyWndyYnpIMHUxSmF0?=
 =?utf-8?B?QjExZFFkQ004QkdLM2FMQ3JZckFETHdKTDAxRDlQK2tRMzRqRDBjaC9sYXJT?=
 =?utf-8?B?bGUzenI2MXFXVksyL0I2UW9Iamx2K3JDOUdEdUZ3SThsbVRGZVJhak43NWxm?=
 =?utf-8?B?RDQ5ajVlZWJTY0I2dDFkNWQ0MWoyN1ovZkJEakhhVlZRTnZuakl2UXJ4dVJU?=
 =?utf-8?B?TUpGOGpvRXFKL0VwcmY0cHBqRmVQR2Jwb0R4V3UyTU95VXpiSU9lSjRReUcw?=
 =?utf-8?B?Yk5aRHE0OTRWMnZhZzkrOHBCcGJRN1UwY2k3Y1FHSnpaNlJPVE9rM2Y0Vjd3?=
 =?utf-8?B?NDZuL250MjFKQ0dER0FBZVM2RGtheGRMRDFkWG9JOG0xNjhSRlBHNmQvRmMv?=
 =?utf-8?B?NGpYUkdYcGYvZ1FIaG9GeHVPV2N2RVFrSVVHc3BnUG1ocFRPVStBcU1iWjJJ?=
 =?utf-8?B?SFNSUWpEYjFtRjdIM2NqaWhnRDBUMW8wTzhSS3BxZFBPdXNiTkJXZld1OS9Z?=
 =?utf-8?B?YU0vSGRQRXpkNk5PdHZBbmRDdEhiV1pjQUdqaTVhM3pHc2VieGo0U3lZNFk1?=
 =?utf-8?B?RWxZaFpjcTVCcWV6MGNZK09DMnN5RWh3Smp6U0JmWmtpQ3plZHVwcEM1RGk3?=
 =?utf-8?B?Rm5yZ3VXRXV1dWhrMURtMnZEWThDc3hTWnl6NG5QbzdDcnBiS1Vpb3dTcXNz?=
 =?utf-8?B?T0krNjRldVlaWFN1YWd2dm12VkM3NHRTMHp6cFVvOE0vVE9wT3l2RC9UY1lX?=
 =?utf-8?B?dWpOSTNqd3BBMTZLM2EydWluQ3dyMjJhZEhSSWl4S3MxT1VkYllTM3cxcFVW?=
 =?utf-8?B?OGVaKzY2YWE0UFJEdzZERUhNcnpxaHJPeVZtLzFyQWdtZE5JOWVNOHAxT3NT?=
 =?utf-8?B?T0IwL3g5bm8yeVRCK1lTazkzVy94SEJKY3lmUmZ0REhJRlh2dFNOcXFFS1JS?=
 =?utf-8?B?azQ5OExCL0VEOWNsMjFsQTFYR0tuRXp0M0s4OGdhd0VQSVBoZWM0S0xZQVJw?=
 =?utf-8?B?dStXQkRkWjV4a1ZDUitPNWFxb1ZzeXVYMldSRXhBSE93Z29NZHBXUTh5VWFQ?=
 =?utf-8?B?WW1WMEthMXpmOElnTVY5NllXQzZvWVo3QlRhbFZYaDB3NVhiNTZBcmRUQTJu?=
 =?utf-8?B?NXdHNGFVb0tpYlVRcGpObUl5dUNpL3F0eHF4MGxYMXpkR0dRdWtiS3pYeXUv?=
 =?utf-8?B?dklZcnNmbXYwTXdwNjRESUwwZ0dJL0c0bjJXeGdESG92cGtDTjNOajF5aDRM?=
 =?utf-8?B?Vkdnd3JWbDJMa09HVlZyZndtbjkzbmpmcndYa1E4WXJFUUNwQ3R3QUQ0Z2xK?=
 =?utf-8?B?c1ArV3lLYVBhcDFFMlRVejlZUlYvS2ZaRnR4V0Zra0FrS1VWSGJVNjdibTF1?=
 =?utf-8?B?MUpaQ201TitKUFNsVVFxdnRNSFV3Tmt1K0Ird0hONHlFRms3Sy93RS9WWUxt?=
 =?utf-8?B?bjBNdjQ0cWp5bEF6dXRkVGxEcGdNQ3Q3VTUwaWc5blJGN0Z1MjNvVkFLMXFF?=
 =?utf-8?B?YTVQdFF4d245VUpHWlJiZTFzS1VMZ1hteGhzd2dyVndmTFcxS0lKZ1BsTUFy?=
 =?utf-8?B?T0RWa1BZVnpPdFM3alNya09Ka2VCay84UW5HUjd1RmxOSDUxa2hJMmFSNE5t?=
 =?utf-8?B?bVpPQlNZSU1ROUZaWE43dG5KSXhaMmFmTlVxdFluQTZpQWVwNTV4QU9iaDF1?=
 =?utf-8?B?dHdGNlI2SDZKRE1FdWVSZGR2THF6WHJYZ0FTcWtJbExtaG1NdSt5YjBnTTRH?=
 =?utf-8?Q?oe+uLpHUT5VbHPMbzxxh9UIn3jKbxk4HVUeZAtHfvTEt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 611583fc-7bc9-4d93-2a83-08db393bc271
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2023 20:48:23.3061
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 60G1id8lcJHyPNuuSqK8UcOK0zX4KrB0eNw1/M/i7IQVFqrg51vJ8XP8wgztjxmp16yennRmxQM+SZp1nZ3G+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7197
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org


On 4/9/23 13:53, Shyam Sundar S K wrote:
> Recent PMFW's have support for querying the STB DRAM size. Add this
> support to the driver.
>
> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>   drivers/platform/x86/amd/pmc.c | 29 ++++++++++++++++++++++++++++-
>   1 file changed, 28 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/amd/pmc.c b/drivers/platform/x86/amd/pmc.c
> index b14d068a6474..86f32b01e3ff 100644
> --- a/drivers/platform/x86/amd/pmc.c
> +++ b/drivers/platform/x86/amd/pmc.c
> @@ -114,6 +114,7 @@ enum s2d_arg {
>   	S2D_PHYS_ADDR_LOW,
>   	S2D_PHYS_ADDR_HIGH,
>   	S2D_NUM_SAMPLES,
> +	S2D_DRAM_SIZE,
>   };
>   
>   struct amd_pmc_bit_map {
> @@ -146,6 +147,7 @@ struct amd_pmc_dev {
>   	u32 base_addr;
>   	u32 cpu_id;
>   	u32 active_ips;
> +	u32 dram_size;
>   /* SMU version information */
>   	u8 smu_program;
>   	u8 major;
> @@ -895,11 +897,31 @@ static const struct pci_device_id pmc_pci_ids[] = {
>   	{ }
>   };
>   
> +static int amd_pmc_get_dram_size(struct amd_pmc_dev *dev)
> +{
> +	if (dev->cpu_id != AMD_CPU_ID_YC)
> +		goto err_dram_size;
> +
> +	if (dev->major > 90 || (dev->major == 90 && dev->minor > 39))
> +		goto err_dram_size;

Is this only for YC and not for PS?

The version check I think you should make it clear it's only intended 
for this program.

switch(dev->cpu_id) {
case AMD_CPU_ID_YC:
     if (version_check)
         goto err_dram_size;
     break;

default:
     goto err_dram_size;

}

Then when it comes time to add another system it either will need a 
localized
version check or it will just be supported and no check needed. Either 
way it
is cleaner in the code.

> +
> +	amd_pmc_send_cmd(dev, S2D_DRAM_SIZE, &dev->dram_size, STB_SPILL_TO_DRAM, 1);
> +	if (!dev->dram_size)
> +		goto err_dram_size;
> +
> +	return 0;
> +
> +err_dram_size:
> +	dev_err(dev->dev, "DRAM size command not supported for this platform\n");
> +	return -EINVAL;
> +}
> +
>   static int amd_pmc_s2d_init(struct amd_pmc_dev *dev)
>   {
>   	u32 phys_addr_low, phys_addr_hi;
>   	u64 stb_phys_addr;
>   	u32 size = 0;
> +	int ret;
>   
>   	/* Spill to DRAM feature uses separate SMU message port */
>   	dev->msg_port = 1;
> @@ -908,6 +930,11 @@ static int amd_pmc_s2d_init(struct amd_pmc_dev *dev)
>   	if (size != S2D_TELEMETRY_BYTES_MAX)
>   		return -EIO;
>   
> +	/* Get DRAM size */
> +	ret = amd_pmc_get_dram_size(dev);
> +	if (ret)
> +		dev->dram_size = S2D_TELEMETRY_DRAMBYTES_MAX;
> +
>   	/* Get STB DRAM address */
>   	amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_LOW, &phys_addr_low, STB_SPILL_TO_DRAM, 1);
>   	amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_HIGH, &phys_addr_hi, STB_SPILL_TO_DRAM, 1);
> @@ -917,7 +944,7 @@ static int amd_pmc_s2d_init(struct amd_pmc_dev *dev)
>   	/* Clear msg_port for other SMU operation */
>   	dev->msg_port = 0;
>   
> -	dev->stb_virt_addr = devm_ioremap(dev->dev, stb_phys_addr, S2D_TELEMETRY_DRAMBYTES_MAX);
> +	dev->stb_virt_addr = devm_ioremap(dev->dev, stb_phys_addr, dev->dram_size);
>   	if (!dev->stb_virt_addr)
>   		return -ENOMEM;
>   
