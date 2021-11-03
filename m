Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A59ACC4332F
	for <platform-driver-x86@archiver.kernel.org>; Wed,  3 Nov 2021 18:39:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 85CBA6109F
	for <platform-driver-x86@archiver.kernel.org>; Wed,  3 Nov 2021 18:39:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231288AbhKCSmB (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 3 Nov 2021 14:42:01 -0400
Received: from mail-dm6nam10on2046.outbound.protection.outlook.com ([40.107.93.46]:35321
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229703AbhKCSmA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 3 Nov 2021 14:42:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MUuBwNDjmN/leba55c/MF36VXZcCtwKOtJyslxCmXVqzLmq3K+pSGlyFEaGhrfZTDima89sfidHwT/f+AUX6Tjy3yxyZUVpuowrkk3ObgVHXSCpNg+wvIO0PUmvkVn7p5wUSNV+7xkaU+nJzLsTOUoXmHandk1BaAroOHAHHY3nLRUN75hyoLGAs5ugTDupJwlLhhNMZQ9jdiFOsnvPKrey0L6pMk04Agz+gFfWTAnl4dzfoP4F+B1ltM8AaGrSdASc8zwo5YmD573XE53y6zOxEb84fNWTzHtz4AeF5OGNPE7TpYGvuPm7hCWKUfhw7pnOs5MbII4ZaG7hpLd3fuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+tI5m+EsxjKKIscrHwrX+tfhOlQltJfC8PkNqupHJjw=;
 b=Mzu0r0ex5UDGxl1Z0mEJ6B41ryhuEedMVWxfUatXuzwfva4KQyx/eFVEonY1iwITTSpmy1u6TdLhsBxPiEYpRpdj6EVbwIh83xtqrZbUMQ/B8+oxEd4C4EKfGsEmK3puQ5L4iRh5gb0tFtDcX9gzorwxBzzLWLT98w1FY955KPC/Lazm+40GWK6GJkeb5COG63LLoIShQbREMct+Jz4tJRgm5C/mpsZBnxI3ouUa6KBWQd9OX+KAMYTaOdHp/bQ9n9esDSkCt5QqrAeWlYN2Eb9epl1OVreKurllCXFd7/w2SLp33hh/MzGyJKVvJSXSXbreHmXwJ31GyTxQACQa5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+tI5m+EsxjKKIscrHwrX+tfhOlQltJfC8PkNqupHJjw=;
 b=dOhKr4e+/ol2t4r7PUCdc6P16CQjomm5rgH5s8mEMf6g1yBTFeWSbw0cZ8T4hQH+gDzz0FW1zJblz7/TdHdeDYBMICX1vZQ21luh2Ztrt+tvdZhZuchdtH5T307VKm7bk+5vkWgkrnYl7Cy/5t/FV3cq7A5TrXXtB9MFfhGjYaE=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4510.namprd12.prod.outlook.com (2603:10b6:806:94::8)
 by SN6PR12MB2637.namprd12.prod.outlook.com (2603:10b6:805:6b::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Wed, 3 Nov
 2021 18:39:21 +0000
Received: from SA0PR12MB4510.namprd12.prod.outlook.com
 ([fe80::7cbc:2454:74b9:f4ea]) by SA0PR12MB4510.namprd12.prod.outlook.com
 ([fe80::7cbc:2454:74b9:f4ea%6]) with mapi id 15.20.4649.020; Wed, 3 Nov 2021
 18:39:21 +0000
Message-ID: <54185145-cbec-319f-d450-a41b7f81d700@amd.com>
Date:   Wed, 3 Nov 2021 13:39:19 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v5 3/3] platform/x86: amd-pmc: Add support for AMD Smart
 Trace Buffer
Content-Language: en-US
To:     Sanket Goswami <Sanket.Goswami@amd.com>, Shyam-sundar.S-k@amd.com,
        hdegoede@redhat.com, mgross@linux.intel.com
Cc:     platform-driver-x86@vger.kernel.org
References: <20211029172304.2998-1-Sanket.Goswami@amd.com>
 <20211029172304.2998-4-Sanket.Goswami@amd.com>
From:   "Limonciello, Mario" <mario.limonciello@amd.com>
In-Reply-To: <20211029172304.2998-4-Sanket.Goswami@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN9PR03CA0792.namprd03.prod.outlook.com
 (2603:10b6:408:13f::17) To SA0PR12MB4510.namprd12.prod.outlook.com
 (2603:10b6:806:94::8)
MIME-Version: 1.0
Received: from [10.254.34.155] (165.204.84.11) by BN9PR03CA0792.namprd03.prod.outlook.com (2603:10b6:408:13f::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15 via Frontend Transport; Wed, 3 Nov 2021 18:39:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dedf9dc8-6440-48d7-787b-08d99ef9406f
X-MS-TrafficTypeDiagnostic: SN6PR12MB2637:
X-Microsoft-Antispam-PRVS: <SN6PR12MB26378D1AAA29EAC1106E1F2AE28C9@SN6PR12MB2637.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yxQerjJP+zttF0xjVIUf8guuQeB/HRNNnFHHaOXqAK+zctba6HBvMLC/cV6g80Yh4Ruj/UB5EGadvcl02Pt83t5QhnLAWowGwMfDkyVqtovyTPyr+YvZgs26WRAjxnfJn4xf5nsEP8RyXT3/ji9kn0jbD7Hf4cHu+jhSHXkGaPafAxf5UgA5ZzsfK/YmRB3NuVJEAaK5xQyT5bU0r/dKW/PUwA+NuqJEUmXx/5F7zGEimMrwOrQLiQWVCzpKT/seOQojn5vLNRDW/dNEa4tQarJdt8dJELP/qU6pRBalqbKXkSoTzbo3jO2H4+FF8853k59t48hEX5zQyB2a9riDdfGIjjqv/Me9SRiS4IfWN9/V00EpAh9YMgt33wG5rMkCc3ngJjrAItbqwivnyPzKp0InqYrXF+Nec/HiytgAqgkqjA8OuL4HdCZICA16QsM4M2Su9kqNnqe8ojeSaKSqX6avkHmimUknwKPb+ZLZFQwRnKDQ+jQrpJh8CyKB4SdBz86c7+NTFXp7Qq4e2hI0Asj81V6QDadeEQWv85PwVfMEnE78cfuchuFVjqeR+OGE2sKTKxd7OxQUUaaHW549hFlgkz2LiPE5VNTHoSk5vI2125qvXaVAdBdwTpDI71SFVWkwmWKKlvYSPdl33KH23BYkel3WblmrcWuDufDcdugdI7Tv04Hd+BjVPsgv+g83Dt4YlPSKKMibpq2vjzYFL5wmZuzHxyVVWNtSeTH0+/8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4510.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(956004)(31696002)(2616005)(26005)(36756003)(66946007)(186003)(53546011)(2906002)(4326008)(66476007)(5660300002)(66556008)(8676002)(38100700002)(31686004)(508600001)(8936002)(6486002)(316002)(86362001)(83380400001)(16576012)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WWtLNDFkY09NcG1mUDJKOUF0QzlqS0lsSitrRWxKb1dzK25RaXFKS3VOQnNH?=
 =?utf-8?B?dVQwc0NCV0dSZS9zYk1LT0hOT2JKNy9GNndsL0ROcS83K0JHK2VBaCt3YS9F?=
 =?utf-8?B?UXcvemhnS3RYc2wrWlpQWjJoOG5uNjhVT1NSbHpaaUYrdHQxY05qUTZrY01m?=
 =?utf-8?B?QmpqNkw2a1BEUURaN0RKV2paS2FIajAzN1NjRkIwczl1c05ObmlKbHZza2FJ?=
 =?utf-8?B?RjN0eTY5cy9CQ2NTWVBxTHVuVTlGM2hpZEhKME5LNlNJVmRlL05BaGduUmo4?=
 =?utf-8?B?V0NyT3pJOXU4ZTBtN0lQWURCeUtQQkwxeTlOUjlaSUVwM1BNTEFJU0hTUUt6?=
 =?utf-8?B?SEl5QTdGYXhqa282WnZkcVB4aStJRHdYVm1pb2pQSkc1TUpRU25saDU5K3ZI?=
 =?utf-8?B?UlNMcXozeUNxNDN3cThCY3YxMWZ4Ui85T2V6YVpKUU5JeG1teTF6dTFxNUtQ?=
 =?utf-8?B?dk1UYWRTMDF0K1h2dWJ4Z2s3akFBTFVCYlZpWUtYT3FRVlZJWERTQnRLbnpR?=
 =?utf-8?B?ZS8vMHFRSzZYMkI0Zkx1ZGRQVnlSMmJGb1JUQmN5RlhvYnlHNm02TFkxcndp?=
 =?utf-8?B?RUJmNkdJMXQ4N1pPZlNkeTNPcjZqNTA1YW9ZaEwrcG9TQldhRm1LdDRHNVpn?=
 =?utf-8?B?Y0tySHI3ZmpJTHRZNlJDNFBwZW1Bc3VxeUVoWnQzWGYyMFd6M2p6a2czRlZL?=
 =?utf-8?B?SGNDRGtDM1gvRlMzVFNqL09VK2svM1k0Zk14UkZLc3FoNDcxZGJJYzI1UDJl?=
 =?utf-8?B?OWJ4UHBFakRPSVRVTWoydHYzY2ZSM1hHOHJFQ0hGM2J1Nk1ESk9hRlhwMGts?=
 =?utf-8?B?OXFSL3FyM25DazZzRXpnQjNOSWd4d3hjYmlDMmdTTDhhZ1BRMlFvQlFTelRO?=
 =?utf-8?B?SU55ZzFDT2xVblkyaUxhcXN1S3puOVNvYWVVcWZCZ0RvZEV4NlhWRVdEaU5q?=
 =?utf-8?B?Z0tBRkR2bTM1RzZLZ2FJcGZFaThTNTNPNmFBTEljYWJ1U0RXTnhpbzRoa05I?=
 =?utf-8?B?YXk4OW8vSEdxZ2RBbUUwTGxlaHU3aXpOR1ZtanhOKzFSczV1OFlyTklGa1dB?=
 =?utf-8?B?V0xhdnRnSEN2UXgxcW1weFBKWGhFblFYWWFqMkJjOXlIN1ArQXk1VUtCKy8z?=
 =?utf-8?B?Y1cxOTd1WTFtK3Q0LzhNdDAwcjloQmp5MHBuNWhsRkxtanFQYVhEUDMvNkdt?=
 =?utf-8?B?cERTd29QUmtRY3lPempXVyt4enduR3hxUE9Wb3BxcktVaFZwNVV4MVV0MzZl?=
 =?utf-8?B?UW9uQUlJSmF1UTVRcVppVnlYZ2pnejRzQVE5bWl2SmpIYjRCUmRzaDBmQWky?=
 =?utf-8?B?S29Fd01OT1I5czU1T09FdkNWc0x2NGdVVjAyL0VVT2hhSXhkNVdPM05GSDR1?=
 =?utf-8?B?WUc3NWp5OVlQTi9VT3ppN3FxOUg0aHYxZkEvVEZtblZiZG10OGo5OHB6TTZW?=
 =?utf-8?B?UnFOWWJQdkdJbW5HUjQwQm1IUlNrR1Zqb1p3TFB0L0lCS1ZqbEoxc1Y5M2R0?=
 =?utf-8?B?VUtTTE0xalZXcEYydUV6VHFtQWJwVzBqQUlLN2s0bk9uQlp5aVZPOXhaTTNy?=
 =?utf-8?B?MlJiSnVZUGh6SFNoR1UwdWMzVTgxWWp3dWxuV2tldTlHcnFVc3J3R3U5MW5j?=
 =?utf-8?B?OE9mQWJ4TzlVcHFHWkZibFVOSjVSblNNaTVPUXNZUGJ1ZWpzbkNBc1Y2YWFa?=
 =?utf-8?B?OHFId25vaFBMcUw3U213SzVzaCtyb3ZsbVlPTG5rOUgwNWpLbGFoSWtKTkFQ?=
 =?utf-8?B?aHFOZlJJTU1nNW1sN2NZbEtZa0FWQ2tLc1VwRWpaL29JMXl4QkhicEVaN0VV?=
 =?utf-8?B?UVdnQzFML3VrZ0VzZ2xZQ0ozU29BTWxGdEZqODZSWHd4YWp3d3EwK0R0NVFt?=
 =?utf-8?B?cjlleTZBVHFVZ0RkNXVEYnc3d2RodVptMUZpTUZ2RFdBWWxnZCtzNkkwQkhL?=
 =?utf-8?B?ak4rNnI3UVZUSTZiRmxsdmxrTFhmRVVGY0dUbHpXcWFVVDFqa2FjL0U5UDIw?=
 =?utf-8?B?M3BOM2RZOUZUVDN1VVhLNVNDTzdLWVNUbUkyaDVrR0ZtMWNPZ0JMc0VNMVhl?=
 =?utf-8?B?aTYzL3UvVUZ3WXVuTnQ0VVdiTmVTWHhZMnVuMmRwNjdCcHV1a05URE1Bbm8z?=
 =?utf-8?B?bGU1dUUyYTZjbG1LQlFsSXJqYU5jb0ptb3N2NkZEbkYxeG5LOXdTdWhDMEs0?=
 =?utf-8?Q?Scr1d6EPGnzYUKXEIzSqEkM=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dedf9dc8-6440-48d7-787b-08d99ef9406f
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4510.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2021 18:39:21.7994
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3p/5pnEUS4h5pBLOVoPXwQbAyKCRSRX/gUV3KDaiA+3bxcgacZNuO/2dvpyOGDTNhWuufT6vrsHkeXSaliB9pQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2637
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 10/29/2021 12:23, Sanket Goswami wrote:
> STB (Smart Trace Buffer), is a debug trace buffer which is used to help
> isolate failures by analyzing the last feature that a system was running
> before hitting a failure. This nonintrusive way is always running in the
> background and trace is stored into the SoC.
> 
> This patch provides mechanism to access the STB buffer using the read
> and write routines.
> 
> Co-developed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Tested-by: Scott Bruce <smbruce@gmail.com>
> ---
> Changes in v5:
> - Use kfree() only once in .open as suggested by Hans.
> 
> Changes in v4:
> - Use kzalloc() for memory allocation.
> 
> Changes in v3:
> - Use sizeof(u32) with multiplier as suggested by Mark Gross.
> 
> Changes in v2:
> - Create amd_pmc_stb_debugfs_fops structure to get STB data.
> - Address review comments from Hans.
> 
>   drivers/platform/x86/amd-pmc.c | 127 +++++++++++++++++++++++++++++++++
>   1 file changed, 127 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
> index ea099f7759f2..a39354ea96c4 100644
> --- a/drivers/platform/x86/amd-pmc.c
> +++ b/drivers/platform/x86/amd-pmc.c
> @@ -35,6 +35,12 @@
>   #define AMD_PMC_SCRATCH_REG_CZN		0x94
>   #define AMD_PMC_SCRATCH_REG_YC		0xD14
>   
> +/* STB Registers */
> +#define AMD_PMC_STB_INDEX_ADDRESS	0xF8
> +#define AMD_PMC_STB_INDEX_DATA		0xFC
> +#define AMD_PMC_STB_PMI_0		0x03E30600
> +#define AMD_PMC_STB_PREDEF		0xC6000001
> +
>   /* Base address of SMU for mapping physical address to virtual address */
>   #define AMD_PMC_SMU_INDEX_ADDRESS	0xB8
>   #define AMD_PMC_SMU_INDEX_DATA		0xBC
> @@ -82,6 +88,7 @@
>   #define SOC_SUBSYSTEM_IP_MAX	12
>   #define DELAY_MIN_US		2000
>   #define DELAY_MAX_US		3000
> +#define FIFO_SIZE		4096
>   enum amd_pmc_def {
>   	MSG_TEST = 0x01,
>   	MSG_OS_HINT_PCO,
> @@ -128,8 +135,14 @@ struct amd_pmc_dev {
>   #endif /* CONFIG_DEBUG_FS */
>   };
>   
> +static bool enable_stb;
> +module_param(enable_stb, bool, 0644);
> +MODULE_PARM_DESC(enable_stb, "Enable the STB debug mechanism");
> +
>   static struct amd_pmc_dev pmc;
>   static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg, bool ret);
> +static int amd_pmc_write_stb(struct amd_pmc_dev *dev, u32 data);
> +static int amd_pmc_read_stb(struct amd_pmc_dev *dev, u32 *buf);
>   
>   static inline u32 amd_pmc_reg_read(struct amd_pmc_dev *dev, int reg_offset)
>   {
> @@ -176,6 +189,50 @@ static int amd_pmc_get_smu_version(struct amd_pmc_dev *dev)
>   	return 0;
>   }
>   
> +static int amd_pmc_stb_debugfs_open(struct inode *inode, struct file *filp)
> +{
> +	struct amd_pmc_dev *dev = filp->f_inode->i_private;
> +	u32 size = FIFO_SIZE * sizeof(u32);
> +	u32 *buf;
> +	int rc;
> +
> +	buf = kzalloc(size, GFP_KERNEL);
> +	if (!buf)
> +		return -ENOMEM;
> +
> +	rc = amd_pmc_read_stb(dev, buf);
> +	if (rc) {
> +		kfree(buf);
> +		return rc;
> +	}
> +
> +	filp->private_data = buf;
> +	return rc;
> +}
> +
> +static ssize_t amd_pmc_stb_debugfs_read(struct file *filp, char __user *buf, size_t size,
> +					loff_t *pos)
> +{
> +	if (!filp->private_data)
> +		return -EINVAL;
> +
> +	return simple_read_from_buffer(buf, size, pos, filp->private_data,
> +				       FIFO_SIZE * sizeof(u32));
> +}
> +
> +static int amd_pmc_stb_debugfs_release(struct inode *inode, struct file *filp)
> +{
> +	kfree(filp->private_data);
> +	return 0;
> +}
> +
> +const struct file_operations amd_pmc_stb_debugfs_fops = {
> +	.owner = THIS_MODULE,
> +	.open = amd_pmc_stb_debugfs_open,
> +	.read = amd_pmc_stb_debugfs_read,
> +	.release = amd_pmc_stb_debugfs_release,
> +};
> +
>   static int amd_pmc_idlemask_read(struct amd_pmc_dev *pdev, struct device *dev,
>   				 struct seq_file *s)
>   {
> @@ -289,6 +346,10 @@ static void amd_pmc_dbgfs_register(struct amd_pmc_dev *dev)
>   			    &s0ix_stats_fops);
>   	debugfs_create_file("amd_pmc_idlemask", 0644, dev->dbgfs_dir, dev,
>   			    &amd_pmc_idlemask_fops);
> +	/* Enable STB only when the module_param is set */
> +	if (enable_stb)
> +		debugfs_create_file("stb_read", 0644, dev->dbgfs_dir, dev,
> +				    &amd_pmc_stb_debugfs_fops);

Have you considered using debugfs_create_blob instead?  Wouldn't this 
make it match the data type more closely?

>   }
>   #else
>   static inline void amd_pmc_dbgfs_register(struct amd_pmc_dev *dev)
> @@ -485,6 +546,9 @@ static int __maybe_unused amd_pmc_suspend(struct device *dev)
>   	if (rc)
>   		dev_err(pdev->dev, "suspend failed\n");
>   
> +	if (enable_stb)
> +		amd_pmc_write_stb(pdev, AMD_PMC_STB_PREDEF);
> +
>   	return rc;
>   }
>   
> @@ -505,6 +569,10 @@ static int __maybe_unused amd_pmc_resume(struct device *dev)
>   	/* Dump the IdleMask to see the blockers */
>   	amd_pmc_idlemask_read(pdev, dev, NULL);
>   
> +	/* Write data incremented by 1 to distinguish in stb_read */
> +	if (enable_stb)
> +		amd_pmc_write_stb(pdev, AMD_PMC_STB_PREDEF + 1);
> +
>   	return 0;
>   }
>   
> @@ -521,6 +589,65 @@ static const struct pci_device_id pmc_pci_ids[] = {
>   	{ }
>   };
>   
> +static int amd_pmc_write_stb(struct amd_pmc_dev *dev, u32 data)
> +{
> +	int err;
> +
> +	err = pci_write_config_dword(dev->rdev, AMD_PMC_STB_INDEX_ADDRESS, AMD_PMC_STB_PMI_0);
> +	if (err) {
> +		dev_err(dev->dev, "failed to write addr in stb: 0x%X\n",
> +			AMD_PMC_STB_INDEX_ADDRESS);
> +		err = pcibios_err_to_errno(err);
> +		goto err_pci_dev_put;
> +	}
> +
> +	err = pci_write_config_dword(dev->rdev, AMD_PMC_STB_INDEX_DATA, data);
> +	if (err) {
> +		dev_err(dev->dev, "failed to write data in stb: 0x%X\n",
> +			AMD_PMC_STB_INDEX_DATA);
> +		err = pcibios_err_to_errno(err);
> +		goto err_pci_dev_put;
> +	}
> +
> +	return 0;
> +
> +err_pci_dev_put:
> +	pci_dev_put(dev->rdev);
> +	return err;
> +}
> +
> +static int amd_pmc_read_stb(struct amd_pmc_dev *dev, u32 *buf)
> +{
> +	int i, err;
> +	u32 value;
> +
> +	err = pci_write_config_dword(dev->rdev, AMD_PMC_STB_INDEX_ADDRESS, AMD_PMC_STB_PMI_0);
> +	if (err) {
> +		dev_err(dev->dev, "error writing addr to stb: 0x%X\n",
> +			AMD_PMC_STB_INDEX_ADDRESS);
> +		err = pcibios_err_to_errno(err);
> +		goto err_pci_dev_put;
> +	}
> +
> +	for (i = 0; i < FIFO_SIZE; i++) {
> +		err = pci_read_config_dword(dev->rdev, AMD_PMC_STB_INDEX_DATA, &value);
> +		if (err) {
> +			dev_err(dev->dev, "error reading data from stb: 0x%X\n",
> +				AMD_PMC_STB_INDEX_DATA);
> +			err = pcibios_err_to_errno(err);
> +			goto err_pci_dev_put;
> +		}
> +
> +		*buf++ = value;
> +	}
> +
> +	return 0;
> +
> +err_pci_dev_put:
> +	pci_dev_put(dev->rdev);
> +	return err;
> +}
> +
>   static int amd_pmc_probe(struct platform_device *pdev)
>   {
>   	struct amd_pmc_dev *dev = &pmc;
> 

