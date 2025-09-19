Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011057.outbound.protection.outlook.com [40.93.194.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4557735942
	for <platform-driver-x86@vger.kernel.org>; Fri, 19 Sep 2025 20:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758313619; cv=fail; b=MIuLFu3d64+OFQeQTEjMOFNX7YBX7S5zZUxnp66SEtG1hJS2HY2BWAopSgpmru18fKV/ULeb/XIw5PyI4p+1ax6tm0DmO+cfnQtq4IMvbNT4BKJYPGcY53Sn716U4rGVBrcqR5okQVFc7Lqq/MfhFP9dKP+qzMFBasud2bJYqI8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758313619; c=relaxed/simple;
	bh=f4+lAWIgZ6owY2iqtEhgqTldFos2opB5nC+J4MfapU8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=KHNVWwUV6qJpTNKq/xmXCNgLxmywyY7OJxkyXqLutwLHTTd72DjpB5MLnzVw7WL3Kl0mwZw5HgCi5rkS/WF3nZD0oEyUogcQW44Lqo4R7U/zlQladsDTxLr8yutgVXL1mRzcDpBPrfJv8UOLyMm+bGdWeFCmPtoc8Zfe2PORedI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=rI8UOY/D; arc=fail smtp.client-ip=40.93.194.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="rI8UOY/D"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F8RCvqX+vYNhuQEK/HaUfLC/ifOIE0Yqrj+duxnt/DEF15dgJMTadstan0+UAb4m7HatQZNboYChl0MZSlyRgEB5ZOlKBg67GrrgJF+97tQTPrqhkSKOminXVyjm4vagR7VW05tiTbo0xoAynO11wHU/8CBxPEHBa2uwqrJ6zs4sTrpTbPwARpdM2yKSpUyKnmh8Ulw4Wxh4AADqWBrYi8hVwlr7kOolV3uZUGCU/SOlUnUnMhkDBJJRvkb+CvO5bSSLqi5Tj0gyTX8lRJTyCGLF8UkC5l4AeqHCZJXuPxfDWxDJ3BRs3UPNuVRWWeHdOrwkawm+EoeW49jPUZREHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MSNAvsAhQ/LQ8cjTW9iUL1G/KnmOQZldoMy6Y6YK/Ng=;
 b=luw4WZwrUkkAWQ9W03T8HF57/1NYTXTAOkvE5Zyw4G0ho6q/+ZRjSzE40PlnZltPAVnAQchJU0T5etSyJ4R22QNPloHm+S2b8rz8MZ4eTR8obgsAE5QSMLoPbzD8+Ki6EEoIsqMoh7+fRd/BZNq7puX5f8L/Gjjpy3SetfNvTUrVLhm+zIFifW9Mrg0a4/VVvrFu5lba5u/Mim1lMWcjpDfPnWavnV1ZAumiN6W5KGxaCJoJt0FHfvvjWiBxdIVZrD1QyRD1sDiLTTRuSvxVmQaA43EAuLiffCdmBeZ76Ia/s/+RUoApOOFJyKiBIWd2jC3fWaAkObsOGoE1/ATNzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MSNAvsAhQ/LQ8cjTW9iUL1G/KnmOQZldoMy6Y6YK/Ng=;
 b=rI8UOY/D+w2h3tpyxbPt5IP0vqxA9aW5vE+yErVLxmdU5oBF5eH+KDvGmCKblnM9xiGI0GTcZ5oiKT/6kxrgrDTCw5hlt02zNSN6fBa+7nAPZMMqiL5p6oW/ufg1c19YrcCf7j9zRlhErEPpeOETMluRoWzB7DBcLMuy2AjP3Uw=
Received: from MW4PR03CA0048.namprd03.prod.outlook.com (2603:10b6:303:8e::23)
 by MW5PR12MB5681.namprd12.prod.outlook.com (2603:10b6:303:19e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Fri, 19 Sep
 2025 20:26:52 +0000
Received: from SJ1PEPF00001CDD.namprd05.prod.outlook.com
 (2603:10b6:303:8e:cafe::32) by MW4PR03CA0048.outlook.office365.com
 (2603:10b6:303:8e::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.14 via Frontend Transport; Fri,
 19 Sep 2025 20:26:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00001CDD.mail.protection.outlook.com (10.167.242.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Fri, 19 Sep 2025 20:26:52 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 19 Sep
 2025 13:26:45 -0700
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 19 Sep
 2025 13:26:44 -0700
Received: from [172.19.71.207] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 19 Sep 2025 13:26:44 -0700
Message-ID: <4747fe10-3064-5466-2f78-47cb93f294c8@amd.com>
Date: Fri, 19 Sep 2025 13:26:43 -0700
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/2] platform/x86/amd/pmf: Introduce new interface to
 export NPU metrics
Content-Language: en-US
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, <hdegoede@redhat.com>,
	<ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>
References: <20250919055425.3055817-1-Shyam-sundar.S-k@amd.com>
 <20250919055425.3055817-2-Shyam-sundar.S-k@amd.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <20250919055425.3055817-2-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDD:EE_|MW5PR12MB5681:EE_
X-MS-Office365-Filtering-Correlation-Id: f42e5392-9835-4607-3c96-08ddf7bade4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UHhJb1ZnTGRBK3orT093OXdWdEp3R0JLWHlPc0kzbWFtNnA1UitveXd0SUFE?=
 =?utf-8?B?UEpUSjRRSTJBaDcvbXRUbUkrRHVNZ1JhWHlqalVLTGpnRThZU09KZVNuWVNB?=
 =?utf-8?B?eTJiUE9SamdjbWd4TFF2bGtxcm1sbG5BV1VMcUYzMlRzZENQUFNEeUh0Ym5z?=
 =?utf-8?B?ek41NUgzS2JpQWdXYWdYMHkyZ3BURk44aWxMdkdTUlpBdzlQNHpUdnZxbGRu?=
 =?utf-8?B?UE5kcHc2MkFkUEQ2T3VkWFRXRUJQbGdraWVlNlUrT3plWjJrV3FHUy9kN1VD?=
 =?utf-8?B?SEVOWThQVlZMQWlFazFoZnFBR0RORXprSXF6a0hDalp5cDZaY0gzWWhiYVZz?=
 =?utf-8?B?TlYvZmhLQ0I5eFRXODNFV0hDMHVZWXpvU2VxNGp3YnN5QjRvaDlnZmRUZ2pK?=
 =?utf-8?B?cnBuYTRrWUNLdWRKS1lwaCtZOTFBdEtJNXBuYjFGWUhmR3ZnZW05SXBVRHU4?=
 =?utf-8?B?cUZvei9ENEg4ZzVNUE5Pei85NDdOVmJEMHdDY01VUi9aSWt1SE5uS2N2bGx4?=
 =?utf-8?B?aFp2ZEc0bENGelJxeFBqdzFZOVJFY3BGUjJDK2ZSbEhreDRPY1Rjb0hBOEhq?=
 =?utf-8?B?TUJZQzNxaUlmNS9EYk1oTC9TRWU0QjBrVlU1bHRlSnZaeENXREtMMDFPSE4w?=
 =?utf-8?B?NmFaRUV2V0NSaHVVVlJ5NWZWbGxDbmpEVHlzOEhJVnk0UjBvazVIOEhMb3lK?=
 =?utf-8?B?Ulkva2JtcnFHaHpjRmQ1SDdEOW1HTUYxMUR4SzMrVjRhc3QxN05wdDVFcExt?=
 =?utf-8?B?NGhuOGFVVkNNeGtEanFiM3R3SmJSU2gxbW1RZXgrWUlhbTM2ZFlSN09jMU5v?=
 =?utf-8?B?NkNVb2JEa3lNaUY4cXNzRTB1Skt2R1VFQTJhZmhDY1JKZ3RsT2VSclMyc3do?=
 =?utf-8?B?R0JzekNTbGFKM0g5R2FWLzF4QWRQZHBhcUw3b284ZjcvRDR6R3BoRmZFZ2Vr?=
 =?utf-8?B?NHNzNEVSVEZWejQydGMrb3RzOFAvOXZPTGx2cGNDaHcxT3p5dWZiZkFWdG9u?=
 =?utf-8?B?Ujd2YUNnRy83MHFjY1hKa0hmaWVwZmFjNjJVdFRjUTV0NlZGREpLbGwxNE5a?=
 =?utf-8?B?VVB3VllnM0RJbkNHVFZEVk5iODVuNWk4dEJWa3pESWRsaHdqNmhIdlJ4eUFL?=
 =?utf-8?B?WWwxSSszSVl0YjJDZ1RUSmlQR1diV3FCSzVEb1B6dXdHTmlCY1NkN1JFbFly?=
 =?utf-8?B?RWNXVk9MSU5GWWFpd0VsdzNzakplaHphd2xmMXpPRjd0UG5PNWYxaU9ybDl5?=
 =?utf-8?B?bFNQMi9RelA2R2dwSWN6ZHJVV1FaYTRVak9ER1NpaXR2U3B5ODRQVW9Ib0Zu?=
 =?utf-8?B?dy8rMERXSlVVY1pEMDl2aDlxdi9KVG1wMDJOd0pielV4NE1BaTVKTXAwRC9H?=
 =?utf-8?B?U0dNczdvdzF1ZmxvVmdWKzBMZi85dG1NWjdlQUQxVXZaWVVCb0tYYnNFdlpq?=
 =?utf-8?B?d2VYLzVRdTNjQWlVbFJXNFNESyttZHZaSU9HdTVmdkpHaURHbWFiMXJGZDVU?=
 =?utf-8?B?UEF0eG8vUTgwV1lKVUs3UnhMMlNOODVlcmV4MmlUVFRlczhYWEllMlV5UWJB?=
 =?utf-8?B?aS83Z1BrekRoS1NxcWFHSC9pdUxDK0FWSzNkS2Z3Q21sckhyVHJVNDErN3lY?=
 =?utf-8?B?bVBBY3dJR0x6RlJGQ25oNUJrOXJ6azRwRTgvVVJkZmhWdVRZZ0NXNVRmbERC?=
 =?utf-8?B?RmJKT2QxUmFTUnpQQTdwR1hZS0tTS1podmR2Z2hKVVZxUTdaR1FJQlRoK2lj?=
 =?utf-8?B?ZnNqc0FWUU1SMzdueHF6TExkMGxyNklxVm1hOGtUaWZmb1kzTE9YWUhJTEpl?=
 =?utf-8?B?K2xQVFM5V3hLQ0MwblVINTR1UklLbEwrY0NHS2dtVWZKQnVxbHZkM3VZRUpq?=
 =?utf-8?B?VGRGZlBHcnNkclpzUyswd3dJSzF4ZWxQNDZIMnAzTlFYeUpKc01JNUZQRVFC?=
 =?utf-8?B?RTk2Y2ZFNURyU0dyNDhqMWNVc2twOXNyVVIyMFNxc1JGQlRlRUI5SmZZRmlM?=
 =?utf-8?B?R1pOQ2NqZUczeUM5M3E3TFdoODhYcTNoRG1kaURuZUlNeDNpMENEVGZYMDZZ?=
 =?utf-8?Q?S8f5f+?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 20:26:52.0464
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f42e5392-9835-4607-3c96-08ddf7bade4b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CDD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5681


On 9/18/25 22:54, Shyam Sundar S K wrote:
> The PMF driver retrieves NPU metrics data from the PMFW. This commit
> introduces a new interface to make NPU metrics accessible to other
> drivers like AMDXDNA driver, which can access and utilize this
> information as needed.
>
> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
> Hi Ilpo, this can be applied on origin/review-ilpo-next with git tip commit
> "8236b4667aca"
>
>   drivers/platform/x86/amd/pmf/core.c | 60 +++++++++++++++++++++++++++++
>   drivers/platform/x86/amd/pmf/pmf.h  |  1 +
>   include/linux/amd-pmf-io.h          | 21 ++++++++++
>   3 files changed, 82 insertions(+)
>
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> index ef988605c4da..75529047377c 100644
> --- a/drivers/platform/x86/amd/pmf/core.c
> +++ b/drivers/platform/x86/amd/pmf/core.c
> @@ -8,6 +8,7 @@
>    * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>    */
>   
> +#include <linux/amd-pmf-io.h>
>   #include <linux/debugfs.h>
>   #include <linux/iopoll.h>
>   #include <linux/module.h>
> @@ -53,6 +54,8 @@ static bool force_load;
>   module_param(force_load, bool, 0444);
>   MODULE_PARM_DESC(force_load, "Force load this driver on supported older platforms (experimental)");
>   
> +static struct device *pmf;
So there will never be more than one pmf device in the future?
> +
>   static int amd_pmf_pwr_src_notify_call(struct notifier_block *nb, unsigned long event, void *data)
>   {
>   	struct amd_pmf_dev *pmf = container_of(nb, struct amd_pmf_dev, pwr_src_notifier);
> @@ -314,6 +317,61 @@ int amd_pmf_init_metrics_table(struct amd_pmf_dev *dev)
>   	return 0;
>   }
>   
> +static int is_npu_metrics_supported(struct amd_pmf_dev *pdev)
> +{
> +	switch (pdev->cpu_id) {
> +	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
> +	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
> +		return 0;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int amd_pmf_get_smu_metrics(struct amd_pmf_dev *dev, struct amd_pmf_npu_metrics *data)
> +{
> +	int ret, i;
> +
> +	if (is_npu_metrics_supported(dev))
> +		return -EINVAL;
> +
> +	ret = amd_pmf_set_dram_addr(dev, true);
> +	if (ret)
> +		return ret;
> +
> +	memset(dev->buf, 0, dev->mtable_size);
> +
> +	/* Send SMU command to get NPU metrics */
> +	ret = amd_pmf_send_cmd(dev, SET_TRANSFER_TABLE, 0, 7, NULL);
s/0/false/ ?

What does the 7 mean? Is defining a macro better?

> +	if (ret) {
> +		dev_err(dev->dev, "SMU command failed to get NPU metrics: %d\n", ret);
> +		return ret;
> +	}
> +
> +	memcpy(&dev->m_table_v2, dev->buf, dev->mtable_size);
> +
> +	data->npuclk_freq = dev->m_table_v2.npuclk_freq;
> +	for (i = 0; i < ARRAY_SIZE(data->npu_busy); i++)
> +		data->npu_busy[i] = dev->m_table_v2.npu_busy[i];
> +	data->npu_power = dev->m_table_v2.npu_power;
> +	data->mpnpuclk_freq = dev->m_table_v2.mpnpuclk_freq;
> +	data->npu_reads = dev->m_table_v2.npu_reads;
> +	data->npu_writes = dev->m_table_v2.npu_writes;
> +
> +	return 0;
> +}
> +
> +int amd_pmf_get_npu_data(struct amd_pmf_npu_metrics *info)
> +{
> +	struct amd_pmf_dev *pdev = dev_get_drvdata(pmf);
Could 'pmf' be invalid pointer if the driver is unbound from the device?
> +
> +	if (!pdev || !info)
> +		return -EINVAL;
> +
> +	return amd_pmf_get_smu_metrics(pdev, info);
> +}
> +EXPORT_SYMBOL_GPL(amd_pmf_get_npu_data);
Should the interface be thread safe? I do not see any lock to protect 
dev->m_table_v2 or dev->buf.
> +
>   static int amd_pmf_suspend_handler(struct device *dev)
>   {
>   	struct amd_pmf_dev *pdev = dev_get_drvdata(dev);
> @@ -431,6 +489,8 @@ static int amd_pmf_probe(struct platform_device *pdev)
>   
>   	dev->dev = &pdev->dev;
>   
> +	pmf = dev->dev;

Maybe set pmf after probe is success? And clear it in remove?

Because driver could be bound/unbound, simply using global pointer might 
be unreliable.


Thanks,

Lizhi

> +
>   	rdev = pci_get_domain_bus_and_slot(0, 0, PCI_DEVFN(0, 0));
>   	if (!rdev || !pci_match_id(pmf_pci_ids, rdev)) {
>   		pci_dev_put(rdev);
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index 6ea5380f3b23..622404e71136 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -12,6 +12,7 @@
>   #define PMF_H
>   
>   #include <linux/acpi.h>
> +#include <linux/amd-pmf-io.h>
>   #include <linux/input.h>
>   #include <linux/platform_device.h>
>   #include <linux/platform_profile.h>
> diff --git a/include/linux/amd-pmf-io.h b/include/linux/amd-pmf-io.h
> index 6fa510f419c0..55198d2875cc 100644
> --- a/include/linux/amd-pmf-io.h
> +++ b/include/linux/amd-pmf-io.h
> @@ -61,5 +61,26 @@ enum laptop_placement {
>   	LP_UNDEFINED,
>   };
>   
> +/**
> + * struct amd_pmf_npu_metrics: Get NPU metrics data from PMF driver
> + * @npuclk_freq: NPU clock frequency [MHz]
> + * @npu_busy: NPU busy % [0-100]
> + * @npu_power: NPU power [mW]
> + * @mpnpuclk_freq: MPNPU [MHz]
> + * @npu_reads: NPU read bandwidth [MB/sec]
> + * @npu_writes: NPU write bandwidth [MB/sec]
> + */
> +struct amd_pmf_npu_metrics {
> +	u16 npuclk_freq;
> +	u16 npu_busy[8];
> +	u16 npu_power;
> +	u16 mpnpuclk_freq;
> +	u16 npu_reads;
> +	u16 npu_writes;
> +};
> +
>   int amd_get_sfh_info(struct amd_sfh_info *sfh_info, enum sfh_message_type op);
> +
> +/* AMD PMF and NPU interface */
> +int amd_pmf_get_npu_data(struct amd_pmf_npu_metrics *info);
>   #endif
