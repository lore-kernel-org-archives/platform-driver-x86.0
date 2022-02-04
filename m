Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A213C433F5
	for <platform-driver-x86@archiver.kernel.org>; Fri,  4 Feb 2022 17:53:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377186AbiBDRxD (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 4 Feb 2022 12:53:03 -0500
Received: from mail-bn7nam10on2055.outbound.protection.outlook.com ([40.107.92.55]:60705
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237982AbiBDRxD (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 4 Feb 2022 12:53:03 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RvsrH+utno3+YbREhLGNajU65Kk5DIDXpSQfCx9AqjqZ5JxpwWAMaPXZYE8ZUmS7aC6R3Z+DoiQBKceGl2F4iTrpwYrpW1O3N6otq8AoenPvDP1Ih2U+9vTY+UleJBUy+xAQOrgHgaakdvBmXX6K3evxQl4185sE7SRNlHOvsa2QB6ivaeeOikw7EnNSrRFioZeSvdYisw9F0BBuU2xTo4DpsQxBZH+ykTevk60ysOwgA4sDI5DL6YSV4sPyOYLRKERC8Z0TLNjGhvTz6MLOPpodNIAZVeHW7Yk7ruobAZg+PWMkBp27JPypzzVBd5n3U+CokHne5rkJTFpn34NYfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tg3nWHioy3UYvKhpGyLMK4/lVmZVFdgflKqsfFr1UCo=;
 b=ZYqw5Q4Mv5IPMbpuFM/amrGt9H6tOS/7P321+cfayjkwUwnKokrHiKiCVxpXgh86eVggC5Zd8mUme3VHEOfgsmwVdg8WEkJSsmnYvRMPTkD3QZw+6PKcGBc/1tFQ7ivpCBP0Zk2Y7pj5mCOr0jv1Dd0Gwo8Ukyn24Uz6T5RfHSesFphzQvOI65lb+xMSW9Io4zN+3zOnUnr4F7Uhsi6nKi+GZCabomrDBnIFoadiFa+85keCX1I8JwlvsfEekm5M0nGjnthyGNQ/jUU3q3t+v9yiVBhhvvBoFEIMhCQFfjwtUFnrDnqb5ksnSp4MXhTtSLHXqJXiJqLMHgugsjRC7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tg3nWHioy3UYvKhpGyLMK4/lVmZVFdgflKqsfFr1UCo=;
 b=3aLaTsDHPuUzxtWV0zixxaS2fcXHyiFVTAK5MX/6fy+Wsb8n/3nrrUG3Evw78v5UQ9u1R0W3ykjEtLqRYBu/Jc4EZ3DNmtzZ2sPoBs7pmLMitQ8JEZXOnLoiUWdvI+sUxElS6gVBFVB0XZJEy+iSVb0yjGxCW3SkHjpCi7f/tJQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5157.namprd12.prod.outlook.com (2603:10b6:208:308::15)
 by CH2PR12MB4008.namprd12.prod.outlook.com (2603:10b6:610:26::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.11; Fri, 4 Feb
 2022 17:53:00 +0000
Received: from BL1PR12MB5157.namprd12.prod.outlook.com
 ([fe80::42f:534d:e82:b59f]) by BL1PR12MB5157.namprd12.prod.outlook.com
 ([fe80::42f:534d:e82:b59f%4]) with mapi id 15.20.4951.014; Fri, 4 Feb 2022
 17:53:00 +0000
Message-ID: <cfedbce4-d567-05b8-f08d-b64bffa0dc3c@amd.com>
Date:   Fri, 4 Feb 2022 11:52:58 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v2] platform/x86: amd-pmc: Add support for AMD Spill to
 DRAM STB feature
Content-Language: en-US
To:     Sanket Goswami <Sanket.Goswami@amd.com>, Shyam-sundar.S-k@amd.com,
        hdegoede@redhat.com, markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org
References: <20220204122527.3873552-1-Sanket.Goswami@amd.com>
From:   "Limonciello, Mario" <mario.limonciello@amd.com>
In-Reply-To: <20220204122527.3873552-1-Sanket.Goswami@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR05CA0023.namprd05.prod.outlook.com
 (2603:10b6:208:c0::36) To BL1PR12MB5157.namprd12.prod.outlook.com
 (2603:10b6:208:308::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 54c318aa-82af-46cb-f670-08d9e8072f4e
X-MS-TrafficTypeDiagnostic: CH2PR12MB4008:EE_
X-Microsoft-Antispam-PRVS: <CH2PR12MB4008ACC133735DEE5C96FDB5E2299@CH2PR12MB4008.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:751;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 22fKDL8MPQKLf/ZLecK/lIlUdJoy/6YJVh6nI8FK0onBht/PbkSXIn29+JqzfYW906KzKGl5Id385DD8dvFE0Gmp03GQVu1eb7/+I5SqT/zEgH45l/YFfz4VL1qjxwMlMln24/KX/H2+/aKxPqDr4yWUPGMbTsDH3Q3zjVYLEzRl+k/10umtMZMdE1tGAjanpen07OEDYHTKjiuxykOqjSCdWhiHpRnOJfuaPhtfjPtyvuXMM3HNC47V2i5xhzvHpzDuEOE1Ol5NqaFfGeq87tyoheohALS4+urh5RYZBsfiXtFFzQqTH6HIMJWskCaoVpNh6B0RZazXeqIFVQhFaPpfoQ7x07Z9wkzvIs0XbXQ9fvYzsqqOz1rH0p7P5TyTruPudDcHzlPGM2DWp65fuxZxAbuzuFtYZX1jrD8hST2FR1DLGBSjLZbbjEXvhVYopEjbfx/VBF8BxMUbKiTQvPuOJTWgbviJ7YWjh1tNA/dw6X3715EnMOI9YpneqA1EnIYJ8R8SwPFgDTK56r+Fodg3YyqMhxjpQ5dFbij2HOyXrecTJ8ncXsgtA7I+v0RMd5ae0B4GsByoNsGlMv5TrrM/gdf+lfpzM86LAE6MUBbJY+7JviGUtkvTJt90lPsFzadGZ76A7qLh8u4qRC9L62RfsW45FbSE9Gd9fc16W7yU6ZvRy9tUR4h2nyx8H9/C0T/ejXvwTgV17IJc0TMZ6kAPXE6/3SrjgBHr2au+Bp4xdJ5teHLPaJcKTCbRQB1O
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5157.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6486002)(38100700002)(31696002)(53546011)(2616005)(508600001)(36756003)(83380400001)(6512007)(26005)(186003)(6506007)(31686004)(86362001)(5660300002)(8676002)(66556008)(66476007)(4326008)(66946007)(8936002)(2906002)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bTRGVlp6SHU5cnBtSUFPVmFmODZPZmJZUU5sakdzeVo4Z2VOTEQ5bUtreEVp?=
 =?utf-8?B?UjhMV1Y5b1VsUmU1NVN4Tmc3WUtQenlTa2t6N1dDUmZ5SHRYbmZJNm9YZURk?=
 =?utf-8?B?VWRlNWNhcVZ0Wk8yRUJOMkRaTVpoUDMyRnpHcytFVnlWNVZ2U0Q2ZXZDZktF?=
 =?utf-8?B?ODdIcDd3SjNFQytPQ21JYWFCK0R4STBPTTdBYjB6elZ1dkFaSjg5YUhZNHV4?=
 =?utf-8?B?OXNwV1JJeFRzcS9ac2p0ZU4zTnNjT1kwTzlVbzY0MzRBVm4yT2FWdHgwYVp5?=
 =?utf-8?B?M3RjVkJrRTU2Qk5MRGxoa21TbHZuVEp2ZWcrL3hDNTYvczdnanBWcHI4TllW?=
 =?utf-8?B?eXdudTZqUlZZR1RyVnVvRmNlT1Q3bkRxUXZjQzE3UEhydGQ1c3ZjZ0ROcklJ?=
 =?utf-8?B?LzNhWXVBS096NENkbHpwbmV6ekp0VHpTelVFenpzVDN4Tk1kTFR4ZldoRWJ6?=
 =?utf-8?B?blp2TE9RRjlaNERBMzdWRFN3U3E0c3hTM1JJZHpCVitsZ3M3WFhPam8yNmtR?=
 =?utf-8?B?N0NaZHBhZTdrcnk5UzFUTVFsUnpWQ0g3eGlnTCtvSnJzUjV0b0xYUmlXSnA1?=
 =?utf-8?B?N2FVTEw5MGp4Sm1zRWVLRGpHNEN5a0xnTkthTkxrU0orMXZ6N1Jjd3FjaFpT?=
 =?utf-8?B?Tk5qVjhRMDhMU1FZRUV6dnFTY0VPVG10dXRDd1d0Y0xPbkNhM3J0WW96bHFO?=
 =?utf-8?B?eWk0Yk1ZbVRQeXN4TmY1anF4V1Q3RTl4TW52cHpEc3VONWR1cHc3cTJaTUVZ?=
 =?utf-8?B?U3N4RGltUzJZNnZwR1BtUUVUWWFLSWc3UWxYZzhPaFlaL1RmTVdtTW5XK1Q4?=
 =?utf-8?B?ekg5ZWNRRGk2ZE9GR25Fd1NxZ1hHWkRkVHVVRTVyK25HUGtQZ0hGK3Jkeitv?=
 =?utf-8?B?cFNwSkJEZzRwZGpwNzgxWVNrRklEcWlORS9ESjhTWGZ3K2NGZHIwK0lZdEh0?=
 =?utf-8?B?STVpZW5MOGd5eW9jVjNDUG9pa3h2dGQ2S1F3YjB2WlpaL1JPQkwvWk16THpE?=
 =?utf-8?B?UlQ2VUxhZXc4TSsyTDFPcU4wOEpqc2J3dnYwRnZ0NHdqWXFIMkR5Snk1NXdR?=
 =?utf-8?B?eEJaOE4zS0t0clVNZEVhc2hmem5zOUN6REdLRUdLcGNESlpPb0hSdkNTRGpx?=
 =?utf-8?B?MHlPK0lRRkVpd0pucFBZWFZYZXEvSkw0cnFhM1VsVHR4L2cvNFVwVmFSV1Fq?=
 =?utf-8?B?VHo1MzhBckx5OVVWcnpKelhDelFSRE11SzdQeXpIU1JIKzZuR3g3d3JQeHZI?=
 =?utf-8?B?dXVSYjUwQ0Zvb0pqSU8vZEJidjJQTm9RSkYrVWh2U3FNVFdHNUpTM0ZJMExP?=
 =?utf-8?B?TEpIVHdxb0FMYUV5TjFBYmtUaVhUUUg3dWRBRE4xZG0wbXN4amtLSjlGMlN3?=
 =?utf-8?B?NTJuaE4vREc2UkdDNmVyOHd3b08rd254RzBFaUNqQnoyenI3SjJvK2wrM1lk?=
 =?utf-8?B?bmJVRGVsNDhqM0ZXT0llNGk1YkJPcEIwS25mVmkreWFyWFgzNlhxUXp2Sk1F?=
 =?utf-8?B?ckRLMVRzVVNRdUVVbFpubDFvK0V4R2VCbDQzQ3NGVnVGai9BY0JOMTR4U3B6?=
 =?utf-8?B?dCtpdkJONHdvQnJvWDhxNm5LOXNiTENEd001dU9BRTJ4R29HY2tqOFJyN1Yv?=
 =?utf-8?B?OWFYWW1TOWJ3VVU2Yk9ackFkZzJQUnBKTmNqYzNhQmptSUdVenViQ3FXL3dJ?=
 =?utf-8?B?ak4zRzZLY1l3ZGoveVh1Qnd5a2pxVjBHYzVSck1BN3dtekE4amVxVUhaL0Qv?=
 =?utf-8?B?TVo2UG82Tk52aDlKQzloYmlNT1JncDNPVXJBUFowNzJDOG1TWDlmeCtrdFRu?=
 =?utf-8?B?SHZJTVRhK0JydkJ0TGVlakFxc3NpUmtHK2NaUjlpSS9lZndVbURjOTlHbmow?=
 =?utf-8?B?MlRMNzVpZVJEUDdHbUM0VFJhVXVuYkQvVnFlTEFYTnlHcWJtdUxoMVNwYWJU?=
 =?utf-8?B?aHZhdHRxbGc2RGN0dnhHQnNyQ1VQV3UwWlpsN1JmSzk3dmJ1amM4cjJZZE5v?=
 =?utf-8?B?Y2FVeXlHUWFWNXRFdVl5TFJZZHczVnZlVGZINkc4MkxsZEhVMVd1S3R6a2Vj?=
 =?utf-8?B?TVlsMDRnMU9xUlVhODdwUkloMTV2ZTZNaGUrV0liR045TjU1bzRRbkQyZUEz?=
 =?utf-8?B?a3V5b1F1MGhhS3h4YlBEcE55U3diZVJXVmpxYU1qejN5ajhFTWxzbEwyd1Fv?=
 =?utf-8?Q?jgJDkGUDbdnvUL4xxbBu0Wc=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54c318aa-82af-46cb-f670-08d9e8072f4e
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5157.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2022 17:53:00.7629
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LRKATAK5GPg9wl0Eq7OcNywHiW9UGXtfX2M2rHokjRaNvvfBJTtP477uGRH+sLdwN9FitDuRBVUJZ11fFuaC3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4008
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 2/4/2022 06:25, Sanket Goswami wrote:
> Spill to DRAM functionality is a feature that allows STB (Smart Trace
> Buffer) to spill data from SRAM into DRAM on some future AMD ASICs. The
> size allocated for STB is more than the earlier SoC's which helps to
> collect more tracing and telemetry data.
> 
> Co-developed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>

One minor nit below; you can choose to ignore it or follow up later if 
you want.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
> Changes in v2:
> - Create separate routine amd_pmc_s2d_init() and move the S2D initialization logic there.
> - Handle the msg_port flag accordingly so that OS_HINT goes to PMC message port.
> 
>   drivers/platform/x86/amd-pmc.c | 144 +++++++++++++++++++++++++++++----
>   1 file changed, 130 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
> index 4c72ba68b315..69fdbb0d9f45 100644
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
> +
>   /* Base address of SMU for mapping physical address to virtual address */
>   #define AMD_PMC_SMU_INDEX_ADDRESS	0xB8
>   #define AMD_PMC_SMU_INDEX_DATA		0xBC
> @@ -95,6 +105,12 @@ enum amd_pmc_def {
>   	MSG_OS_HINT_RN,
>   };
>   
> +enum s2d_arg {
> +	S2D_TELEMETRY_SIZE = 0x01,
> +	S2D_PHYS_ADDR_LOW,
> +	S2D_PHYS_ADDR_HIGH,
> +};
> +
>   struct amd_pmc_bit_map {
>   	const char *name;
>   	u32 bit_mask;
> @@ -119,7 +135,9 @@ static const struct amd_pmc_bit_map soc15_ip_blk[] = {
>   struct amd_pmc_dev {
>   	void __iomem *regbase;
>   	void __iomem *smu_virt_addr;
> +	void __iomem *stb_virt_addr;
>   	void __iomem *fch_virt_addr;
> +	bool msg_port;
>   	u32 base_addr;
>   	u32 cpu_id;
>   	u32 active_ips;
> @@ -236,6 +254,44 @@ static const struct file_operations amd_pmc_stb_debugfs_fops = {
>   	.release = amd_pmc_stb_debugfs_release,
>   };
>   
> +static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
> +{
> +	struct amd_pmc_dev *dev = filp->f_inode->i_private;
> +	u32 *buf;
> +
> +	buf = kzalloc(S2D_TELEMETRY_BYTES_MAX, GFP_KERNEL);
> +	if (!buf)
> +		return -ENOMEM;
> +
> +	memcpy_fromio(buf, dev->stb_virt_addr, S2D_TELEMETRY_BYTES_MAX);
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
> @@ -350,9 +406,14 @@ static void amd_pmc_dbgfs_register(struct amd_pmc_dev *dev)
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
> @@ -392,26 +453,47 @@ static int amd_pmc_setup_smu_logging(struct amd_pmc_dev *dev)
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

This and the other two above debug statements should actually be 
something like:

dev_dbg(dev->dev, "AMD_%s_REGISTER_MESSAGE":%x\n", dev->msg_port ? "S2D" 
: "PMC", value);


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
> @@ -420,16 +502,16 @@ static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg,
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
> @@ -442,7 +524,7 @@ static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg,
>   		if (ret) {
>   			/* PMFW may take longer time to return back the data */
>   			usleep_range(DELAY_MIN_US, 10 * DELAY_MAX_US);
> -			*data = amd_pmc_reg_read(dev, AMD_PMC_REGISTER_ARGUMENT);
> +			*data = amd_pmc_reg_read(dev, argument);
>   		}
>   		break;
>   	case AMD_PMC_RESULT_CMD_REJECT_BUSY:
> @@ -601,6 +683,34 @@ static const struct pci_device_id pmc_pci_ids[] = {
>   	{ }
>   };
>   
> +static int amd_pmc_s2d_init(struct amd_pmc_dev *dev)
> +{
> +	u32 size, phys_addr_low, phys_addr_hi;
> +	u64 stb_phys_addr;
> +
> +	/* Spill to DRAM feature uses separate SMU message port */
> +	dev->msg_port = 1;
> +
> +	amd_pmc_send_cmd(dev, S2D_TELEMETRY_SIZE, &size, STB_SPILL_TO_DRAM, 1);
> +	if (size != S2D_TELEMETRY_BYTES_MAX)
> +		return -EIO;
> +
> +	/* Get STB DRAM address */
> +	amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_LOW, &phys_addr_low, STB_SPILL_TO_DRAM, 1);
> +	amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_HIGH, &phys_addr_hi, STB_SPILL_TO_DRAM, 1);
> +
> +	stb_phys_addr = ((u64)phys_addr_hi << 32 | phys_addr_low);
> +
> +	/* Clear msg_port for other SMU operation */
> +	dev->msg_port = 0;
> +
> +	dev->stb_virt_addr = devm_ioremap(dev->dev, stb_phys_addr, S2D_TELEMETRY_DRAMBYTES_MAX);
> +	if (!dev->stb_virt_addr)
> +		return -ENOMEM;
> +
> +	return 0;
> +}
> +
>   static int amd_pmc_write_stb(struct amd_pmc_dev *dev, u32 data)
>   {
>   	int err;
> @@ -719,6 +829,12 @@ static int amd_pmc_probe(struct platform_device *pdev)
>   	if (err)
>   		dev_err(dev->dev, "SMU debugging info not supported on this platform\n");
>   
> +	if (enable_stb && dev->cpu_id == AMD_CPU_ID_YC) {
> +		err = amd_pmc_s2d_init(dev);
> +		if (err)
> +			return err;
> +	}
> +
>   	amd_pmc_get_smu_version(dev);
>   	platform_set_drvdata(pdev, dev);
>   	amd_pmc_dbgfs_register(dev);

