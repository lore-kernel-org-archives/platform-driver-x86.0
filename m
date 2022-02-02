Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F9A5C433EF
	for <platform-driver-x86@archiver.kernel.org>; Wed,  2 Feb 2022 04:44:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232137AbiBBEot (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 1 Feb 2022 23:44:49 -0500
Received: from mail-bn8nam08on2045.outbound.protection.outlook.com ([40.107.100.45]:44768
        "EHLO NAM04-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232035AbiBBEot (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 1 Feb 2022 23:44:49 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xa7daNPAQRKXa8XVwPJLsvIoc6CpM5Yrc8j6qsPAZ49wZrADnrS4gM3lYhzeEVCYlYtHU/iYrtzwpdy24093je9qFdLLpig/Kug9ImMooHLu4vSHXjnP2F5oosZj7yETbOtEwbqt5U8ntZQ1bX1BCd6PA0SmRi62k1HXvH+LwUXOv3VLQca4LHHouhEph7UeC2zrnv6gkMQa87VemEJd7wIEjslT+9q3kVYJm100NkXLcfcChGLvlcaljDUa0LcXMKoPEOdxQQNdgMwuB6ZG4BpMEjqXcgJ6Teyi2VaqRbV19YhpBGMxtAPbSUwpSWYp1BIcf8OB+tKGcqePt+8UEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=acpu9dQPj5gJIqLpLSrNCkYdFR7Ou53ta8H2xZbx6lM=;
 b=OiJKihruWhlfUM8h1iyzD/sY66yKy3hrSPDMcivKw6b78P6C4ZzWXCeGkt7pTir4Wx0Aamf6+D6+etML5bV6Nm5hnf8ta7UYWBD8blr2hBQt+yl7cdvCvbtOcURCJUCQowVHTD7NrgvnH+Lxl3w4XqgIHiy+KYjqZvBnfqeHVC8ZOJyiHCWJh0VdO4mtiDlFGgQjXzMEJLs/5dQdlwMFWF/0n5KZ8N0iLd0lLr19VHq9YYJAB2FSRt5MJcQquwwZuylIPqGLBGbkMrceIT+l+FdSE4TCrK8b4oMJlS0Kj04ZyB1SqofIgz8ms+YH0UaYP+oc4uda/sU+b7VWv7SrkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=acpu9dQPj5gJIqLpLSrNCkYdFR7Ou53ta8H2xZbx6lM=;
 b=MIFfhXhanKW3LFFD2bdsjJvIkrVekxlcMtWaC0G4Lw4P7dV8z0iZKyphq+L98lRX56YO64WnNesBeDI8CPfv9SaSU7bzjHCrJlK58Zq8Htjxgw+nDX0Igjn1ukXlq4D5ouIEHxlN+z3E5aNJhip9lAwvAM8wVzUijCKzQCdZ40A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5157.namprd12.prod.outlook.com (2603:10b6:208:308::15)
 by CY4PR12MB1926.namprd12.prod.outlook.com (2603:10b6:903:11b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.19; Wed, 2 Feb
 2022 04:44:46 +0000
Received: from BL1PR12MB5157.namprd12.prod.outlook.com
 ([fe80::42f:534d:e82:b59f]) by BL1PR12MB5157.namprd12.prod.outlook.com
 ([fe80::42f:534d:e82:b59f%4]) with mapi id 15.20.4951.012; Wed, 2 Feb 2022
 04:44:46 +0000
Message-ID: <eb2b2f5c-a484-72af-b275-297533a84c57@amd.com>
Date:   Tue, 1 Feb 2022 22:44:43 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] platform/x86: amd-pmc: Add support for AMD Spill to DRAM
 STB feature
Content-Language: en-US
To:     Sanket Goswami <Sanket.Goswami@amd.com>, Shyam-sundar.S-k@amd.com,
        hdegoede@redhat.com, markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org
References: <20220127100913.2819051-1-Sanket.Goswami@amd.com>
From:   "Limonciello, Mario" <mario.limonciello@amd.com>
In-Reply-To: <20220127100913.2819051-1-Sanket.Goswami@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR05CA0008.namprd05.prod.outlook.com (2603:10b6:610::21)
 To BL1PR12MB5157.namprd12.prod.outlook.com (2603:10b6:208:308::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2fc107eb-f881-4a05-4cb4-08d9e606bc93
X-MS-TrafficTypeDiagnostic: CY4PR12MB1926:EE_
X-Microsoft-Antispam-PRVS: <CY4PR12MB19263A3E232E90DCC42DF48DE2279@CY4PR12MB1926.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5iyMUERslw5Rg3H4pF1WiAjDgXYAJ2hDVnlxy9ONtZysnVKGwFDA2LHp3MQjIzq8UE0iNSz/yd5rhlPK8RVkkQRv99l7Bg0648Xq5ZfPcKApkaHVnzvJMtsgu7kdrTRBV8z5Y3+x091a/VynHk096nhP9m7S0jQemMMzbBdqPdlHN9g74mbrcrkjV5JijLADZd1A1jIYeSEVQY9Jta1TGv7hG+AFQ7TvxvxQbcHSRSWtHagNghQk+LrnZD21eW/asMI1kKTXi9EC9vz61Rd/i8nHBmSiE2tjyILL/SsDLG7e9s7853HGKjsPKF/psg5c6X7HqSPd4ynT6YCDodYNHi7Kt1ymFEmlWXsDk6dvWxxSZVco0bxafDa9wK1zgCaNL2G36HM7ASxC78CvqmVeaKZO1Ce7KWQw2Q7oZPObdxuJHdrbwZ5zM5YM2p96eWp2OyeYyHREqCYdDNdJtsGV0VrG0kqzyKDUi6ZJvL3ji8lYPe3ZyXC24xICyBxNYl9AWncx4/34DysgBntBuXhrfMDgdni7mQdcBacRPFVY5VdghLix3P+gVW6iZLSVC3lCyj7N3GNipwkhTHCq7uZvKfC+cDXEmMVt+HgqDY49nrf7X0GTkTYY/EjT/tT5o60B5xFq0pCFETq4P9xN6PwEi36OHbrzXW1rbTG1Tv5p5W1s7VjZ1e4+BzTMX/StdOsvL8vEd3/pqwaYWV9a2G4Wul26TunH6GtdHwAvynDav9DFbbCXOMUQySoi5by4a2Gc
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5157.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(31696002)(53546011)(6506007)(36756003)(38100700002)(316002)(6512007)(4326008)(86362001)(6666004)(508600001)(66946007)(5660300002)(6486002)(66556008)(8936002)(8676002)(66476007)(31686004)(186003)(2906002)(2616005)(83380400001)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L0UxMDNHbmovcWxYb1dURFBnU3Q5cms4QVd2VWxqV21nQUpoeEVlQzgxN1Zn?=
 =?utf-8?B?MEFraDVOTDdVZDFiSDBuN3F0OCtKeHdBSE95S3pRbUYvNWV6L0s2QUJpWm93?=
 =?utf-8?B?NkV3dVczaUMrZGM4cTI0TmRJOFVWNldxclNDRmM1aDE1Nk82K1BTTzdiZGJm?=
 =?utf-8?B?MkhyUE9DOE4wYWFoOVNQeW8xYm10Uk82VklZNURRYit3QnIrU3NEVHkvb044?=
 =?utf-8?B?K0ZMdUtWMEZCRmE0cUo1dzVHNTNhWVhweHNLZWJESkM5ci90Lzc2aUREcUV3?=
 =?utf-8?B?YWtieVZ2bDZja1JiaFhneGp2c0ZWUmE3L1AwVE1RYmQ5T014dHpnYzhBWkow?=
 =?utf-8?B?MXo2TXFNVmxFVXFDTCtUblNabFpVQXhDU2wzdWY3YVJydzQvRmM1QUh2S1M1?=
 =?utf-8?B?NGYzUE8zUHZTY05wNjFoYnJncUg3eHp5Z2dGeDB4TC8yQ2x2TjlBUHROZzMr?=
 =?utf-8?B?RnhTNTR0Vzh2VCszU3k3MTlDM1NPdmxjbVM2Y3g1Y1FobWt3VkdrVUFBUXU1?=
 =?utf-8?B?UWxacGZhOC9YckxXN1d2VTVrbWdVdmpCYmQraVVvcCs3bzFYakt6VUk1TTAy?=
 =?utf-8?B?endzY0p6OTNzbHNRRXM1N2M5TXM3dHB5MVdYQisyWno5UGFGcXFqVGEraGZK?=
 =?utf-8?B?UFp5SFRrUTc2dklQWGM0aW9QOXphOEVkM3ZFbG0reTRGaGhXdGM5VHlVRnZQ?=
 =?utf-8?B?OWFOWUJ4WHBCcGFuKy95bDR6dEJraUdoOSs3M3AxRGZ4d2hSendON0JyeUla?=
 =?utf-8?B?U2ZxaGt0SERqWXlKRG52MDU5Ukx6eHIyZ0hBT3RJMzQrd3pPbGw1SGNNWk5q?=
 =?utf-8?B?ejFQM05VRTJKZ0kwUi9SVjhhWEtCY1VMMTVaWm4yODhEZEtJNnowZTFSN2NT?=
 =?utf-8?B?amFpS0pjMFpMWWgraCtLL0trMHlydUU0dmtqQVBHRkZRNzFCZUJDeVNwVmYr?=
 =?utf-8?B?VGdkcGIzYURZQVZNV0d6d0t0MnJQQmRRMVZVcXdCUzlCOGc2SFFBVWp1UlhK?=
 =?utf-8?B?YmJ1OEtvMWwzV2phcTh2cmhVNFlZNys4TkVaSnpETkNtYVF3dHM4cldlbC9Q?=
 =?utf-8?B?elpBR2pEd1M2Z1ZWQWF1a0Fvbk1JOUd4ZkpuYlgybEZFSFJVZ1k3ZnZmWXhk?=
 =?utf-8?B?SlJHV2E0T1YvR0tONnFOWWtHdTM0YUljNnlVbkM0bWNkVFZvbWRvUVUwRVRt?=
 =?utf-8?B?VVAxSDVxYmZGU3JMeWlPNWovQXZwZjlTaXMvMU9ERmZWay9WT094QWhwNEFR?=
 =?utf-8?B?UW1mdkErQ3c4S3ljQzVOd1ArenRRQXA1RElKZm9PMGFCMllZcW1rM3VGNlFn?=
 =?utf-8?B?MTZtdTFranZ2a3FtWmg1Q3hmQUJCbVE4NDZpcWZhV3UxbFFsemJ0eVAwOS9D?=
 =?utf-8?B?OTliQ1M5R3VlbGxTKzE2eHVrWEZhanRaM0Y3QUh6SFVJUEN1ZjJCM3dDUnlK?=
 =?utf-8?B?STE0UkhaRWFGdlhOeEFnYVBJd0Ric2FsTWRXNFdIVzZkdmlmWm8vaW5wZHlH?=
 =?utf-8?B?dENlb2NNanljeE9lcng3dVVXQ05JRWRCSGRUOUpzdytMblVza3ZBc09WMHhx?=
 =?utf-8?B?dlpXdFNrWnNOa2JBWHh0N1M5SWlaekFLaXdVSEJvVXdWT0lQamNBUjUvU2xi?=
 =?utf-8?B?Z1hhcXR1ckhONGVvK3d0cnhYaTJLejdqTVdxU2dGZk1sTmhmUDRkTHI4Zm5P?=
 =?utf-8?B?bDdxYXdEb0R5OUg5ODFuT254YWdTN0pkalJVWHQxdzZROHJmSnc1b0FlNHN4?=
 =?utf-8?B?bC8vTVY0bE5adU9vRXE0UEtqeHdVOEpBb1g0SDdYYWZoVTN2MTBLOXNWTUpB?=
 =?utf-8?B?TzRqTXRBVmw2VEpKaFM0VWpQYThPN0N5WHErUVJuT2ovZk5kbDZPQkY1VUk2?=
 =?utf-8?B?ZlVvMW52WFhadTgvZE84YlVXZ3ZLUVo1N1NTTW9lM215VExaVjRwbHdxZ09k?=
 =?utf-8?B?amtRUjZJY25hQ3hwSlJLUWRhT0k5eE9GK2E2VDlLb1dicnk1RVZBbXpQV1pk?=
 =?utf-8?B?KzlIcmhONTk1RlR0bG1Ob1BzOE5IUFgxZUZoWG9OUlRrRkkwUjJrN0pnK3Fn?=
 =?utf-8?B?MjBtRStzdWRQSCtocm5iWHdZeEFDdzNCV1piQXg4SzZzZ3MrTncxMFQ5K1Zs?=
 =?utf-8?B?WGdUOTBsV3p3ZlRUTGhxaUl2OHFsWUtOeElNQTFjVlBFMFZvZEpmNVhRbkVD?=
 =?utf-8?Q?F0HWuvJLMYmOiZn8jo93EVQ=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fc107eb-f881-4a05-4cb4-08d9e606bc93
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5157.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2022 04:44:45.9160
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SRNju/32c34//k/qWKh9PuDyDqMmgeEDFqrrHvbPWub2Cg3V9Gt853L9WFCrKClcTYhiA58BzdkbcdAxpaV7Xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1926
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 1/27/2022 04:09, Sanket Goswami wrote:
> Spill to DRAM functionality is a feature that allows STB (Smart Trace
> Buffer) to spill data from SRAM into DRAM on some future AMD ASICs. The
> size allocated for STB is more than the earlier SoC's which helps to
> collect more tracing and telemetry data.
> 
> Co-developed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> ---
>   drivers/platform/x86/amd-pmc.c | 132 +++++++++++++++++++++++++++++----
>   1 file changed, 118 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
> index 4c72ba68b315..3040f50627c6 100644
> --- a/drivers/platform/x86/amd-pmc.c
> +++ b/drivers/platform/x86/amd-pmc.c
> @@ -41,6 +41,16 @@
>   #define AMD_PMC_STB_PMI_0		0x03E30600
>   #define AMD_PMC_STB_PREDEF		0xC6000001
>   
> +/* STB S2D(Spill to DRAM) has different message port offset */
> +#define STB_SPILL_TO_DRAM		0xBE
> +#define AMD_S2D_REGISTER_MESSAGE	0xA20
> +#define AMD_S2D_REGISTER_RESPONSE	0xA80
> +#define AMD_S2D_REGISTER_ARGUMENT	0xA88
> +
> +/* STB Spill to DRAM Parameters */
> +#define S2D_TELEMETRY_BYTES_MAX		0x100000
> +#define S2D_TELEMETRY_DRAMBYTES_MAX	0x1000000

Why have two separate definitions for the same value?  Is there a case 
that these will ever be different?

> +
>   /* Base address of SMU for mapping physical address to virtual address */
>   #define AMD_PMC_SMU_INDEX_ADDRESS	0xB8
>   #define AMD_PMC_SMU_INDEX_DATA		0xBC
> @@ -95,6 +105,13 @@ enum amd_pmc_def {
>   	MSG_OS_HINT_RN,
>   };
>   
> +enum s2d_arg {
> +	S2D_TELEMETRY_SIZE = 0x01,
> +	S2D_PHYS_ADDR_LOW,
> +	S2D_PHYS_ADDR_HIGH,
> +	S2D_NUM_SAMPLES,
> +};
> +
>   struct amd_pmc_bit_map {
>   	const char *name;
>   	u32 bit_mask;
> @@ -119,7 +136,9 @@ static const struct amd_pmc_bit_map soc15_ip_blk[] = {
>   struct amd_pmc_dev {
>   	void __iomem *regbase;
>   	void __iomem *smu_virt_addr;
> +	void __iomem *stb_virt_addr;
>   	void __iomem *fch_virt_addr;
> +	bool msg_port;
>   	u32 base_addr;
>   	u32 cpu_id;
>   	u32 active_ips;
> @@ -236,6 +255,65 @@ static const struct file_operations amd_pmc_stb_debugfs_fops = {
>   	.release = amd_pmc_stb_debugfs_release,
>   };
>   
> +static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
> +{
> +	struct amd_pmc_dev *dev = filp->f_inode->i_private;
> +	u32 *buf, phys_addr_low, phys_addr_hi, size, samples;
> +	u64 stb_phys_addr;
> +
> +	/* Spill to DRAM feature uses separate SMU message port */
> +	dev->msg_port = 1;

This message port is only used for STD right?  Existing messages for 
version, OS_HINT and the like should go through the old port.

You don't seem to ever unset this, so I think if the STB was opened 
before S0i3 was invoked I would think it would cause the OS_HINT message 
to be sent to the wrong port wouldn't it?

It might be safer to modify amd_pmc_send_cmd to have an extra argument 
of which port to use in each invocation.  Then only in debugfs_v2 
operations you can use this port.

> +
> +	amd_pmc_send_cmd(dev, S2D_TELEMETRY_SIZE, &size, STB_SPILL_TO_DRAM, 1);
> +	if (size != S2D_TELEMETRY_BYTES_MAX)
> +		return -EIO;

What if the firmware was configured to use less than 16MB?  Shouldn't 
you be able to respect that?

I would think you instead want to have a boundary check on the "max" to 
support.

> +
> +	/* Get STB DRAM address */
> +	amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_LOW, &phys_addr_low, STB_SPILL_TO_DRAM, 1);
> +	amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_HIGH, &phys_addr_hi, STB_SPILL_TO_DRAM, 1);
> +
> +	/* Get the number of samples present in the STB buffer */
> +	amd_pmc_send_cmd(dev, S2D_NUM_SAMPLES, &samples, STB_SPILL_TO_DRAM, 1);
> +	stb_phys_addr = ((u64)phys_addr_hi << 32 | phys_addr_low);
> +
> +	dev->stb_virt_addr = devm_ioremap(dev->dev, stb_phys_addr, S2D_TELEMETRY_DRAMBYTES_MAX);
> +	if (!dev->stb_virt_addr)
> +		return -ENOMEM;
> +
> +	buf = kzalloc(S2D_TELEMETRY_BYTES_MAX, GFP_KERNEL);
> +	if (!buf)
> +		return -ENOMEM;

Shouldn't you clear the iomapping for dev->stb_virt_addr on this failure?

> +
> +	memcpy_fromio(buf, dev->stb_virt_addr, S2D_TELEMETRY_BYTES_MAX);
> +
> +	filp->private_data = buf;
> +
> +	return 0;
> +}
> +
> +static ssize_t amd_pmc_stb_debugfs_read_v2(struct file *filp, char __user *buf, size_t size,
> +					   loff_t *pos)
> +{
> +	if (!filp->private_data)
> +		return -EINVAL;
> +
> +	return simple_read_from_buffer(buf, size, pos, filp->private_data,
> +					S2D_TELEMETRY_BYTES_MAX);
> +}
> +
> +static int amd_pmc_stb_debugfs_release_v2(struct inode *inode, struct file *filp)
> +{
> +	kfree(filp->private_data);
> +	return 0;
> +}
> +
> +static const struct file_operations amd_pmc_stb_debugfs_fops_v2 = {
> +	.owner = THIS_MODULE,
> +	.open = amd_pmc_stb_debugfs_open_v2,
> +	.read = amd_pmc_stb_debugfs_read_v2,
> +	.release = amd_pmc_stb_debugfs_release_v2,
> +};
> +
>   static int amd_pmc_idlemask_read(struct amd_pmc_dev *pdev, struct device *dev,
>   				 struct seq_file *s)
>   {
> @@ -350,9 +428,14 @@ static void amd_pmc_dbgfs_register(struct amd_pmc_dev *dev)
>   	debugfs_create_file("amd_pmc_idlemask", 0644, dev->dbgfs_dir, dev,
>   			    &amd_pmc_idlemask_fops);
>   	/* Enable STB only when the module_param is set */
> -	if (enable_stb)
> -		debugfs_create_file("stb_read", 0644, dev->dbgfs_dir, dev,
> -				    &amd_pmc_stb_debugfs_fops);
> +	if (enable_stb) {
> +		if (dev->cpu_id == AMD_CPU_ID_YC)
> +			debugfs_create_file("stb_read", 0644, dev->dbgfs_dir, dev,
> +					    &amd_pmc_stb_debugfs_fops_v2);
> +		else
> +			debugfs_create_file("stb_read", 0644, dev->dbgfs_dir, dev,
> +					    &amd_pmc_stb_debugfs_fops);
> +	}
>   }
>   #else
>   static inline void amd_pmc_dbgfs_register(struct amd_pmc_dev *dev)
> @@ -392,26 +475,47 @@ static int amd_pmc_setup_smu_logging(struct amd_pmc_dev *dev)
>   
>   static void amd_pmc_dump_registers(struct amd_pmc_dev *dev)
>   {
> -	u32 value;
> +	u32 value, message, argument, response;
> +
> +	if (dev->msg_port) {
> +		message = AMD_S2D_REGISTER_MESSAGE;
> +		argument = AMD_S2D_REGISTER_ARGUMENT;
> +		response = AMD_S2D_REGISTER_RESPONSE;
> +	} else {
> +		message = AMD_PMC_REGISTER_MESSAGE;
> +		argument = AMD_PMC_REGISTER_ARGUMENT;
> +		response = AMD_PMC_REGISTER_RESPONSE;
> +	}
>   
> -	value = amd_pmc_reg_read(dev, AMD_PMC_REGISTER_RESPONSE);
> +	value = amd_pmc_reg_read(dev, response);
>   	dev_dbg(dev->dev, "AMD_PMC_REGISTER_RESPONSE:%x\n", value);
>   
> -	value = amd_pmc_reg_read(dev, AMD_PMC_REGISTER_ARGUMENT);
> +	value = amd_pmc_reg_read(dev, argument);
>   	dev_dbg(dev->dev, "AMD_PMC_REGISTER_ARGUMENT:%x\n", value);
>   
> -	value = amd_pmc_reg_read(dev, AMD_PMC_REGISTER_MESSAGE);
> +	value = amd_pmc_reg_read(dev, message);
>   	dev_dbg(dev->dev, "AMD_PMC_REGISTER_MESSAGE:%x\n", value);
>   }
>   
>   static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg, bool ret)
>   {
>   	int rc;
> -	u32 val;
> +	u32 val, message, argument, response;
>   
>   	mutex_lock(&dev->lock);
> +
> +	if (dev->msg_port) {
> +		message = AMD_S2D_REGISTER_MESSAGE;
> +		argument = AMD_S2D_REGISTER_ARGUMENT;
> +		response = AMD_S2D_REGISTER_RESPONSE;
> +	} else {
> +		message = AMD_PMC_REGISTER_MESSAGE;
> +		argument = AMD_PMC_REGISTER_ARGUMENT;
> +		response = AMD_PMC_REGISTER_RESPONSE;
> +	}
> +
>   	/* Wait until we get a valid response */
> -	rc = readx_poll_timeout(ioread32, dev->regbase + AMD_PMC_REGISTER_RESPONSE,
> +	rc = readx_poll_timeout(ioread32, dev->regbase + response,
>   				val, val != 0, PMC_MSG_DELAY_MIN_US,
>   				PMC_MSG_DELAY_MIN_US * RESPONSE_REGISTER_LOOP_MAX);
>   	if (rc) {
> @@ -420,16 +524,16 @@ static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg,
>   	}
>   
>   	/* Write zero to response register */
> -	amd_pmc_reg_write(dev, AMD_PMC_REGISTER_RESPONSE, 0);
> +	amd_pmc_reg_write(dev, response, 0);
>   
>   	/* Write argument into response register */
> -	amd_pmc_reg_write(dev, AMD_PMC_REGISTER_ARGUMENT, arg);
> +	amd_pmc_reg_write(dev, argument, arg);
>   
>   	/* Write message ID to message ID register */
> -	amd_pmc_reg_write(dev, AMD_PMC_REGISTER_MESSAGE, msg);
> +	amd_pmc_reg_write(dev, message, msg);
>   
>   	/* Wait until we get a valid response */
> -	rc = readx_poll_timeout(ioread32, dev->regbase + AMD_PMC_REGISTER_RESPONSE,
> +	rc = readx_poll_timeout(ioread32, dev->regbase + response,
>   				val, val != 0, PMC_MSG_DELAY_MIN_US,
>   				PMC_MSG_DELAY_MIN_US * RESPONSE_REGISTER_LOOP_MAX);
>   	if (rc) {
> @@ -442,7 +546,7 @@ static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg,
>   		if (ret) {
>   			/* PMFW may take longer time to return back the data */
>   			usleep_range(DELAY_MIN_US, 10 * DELAY_MAX_US);
> -			*data = amd_pmc_reg_read(dev, AMD_PMC_REGISTER_ARGUMENT);
> +			*data = amd_pmc_reg_read(dev, argument);
>   		}
>   		break;
>   	case AMD_PMC_RESULT_CMD_REJECT_BUSY:

