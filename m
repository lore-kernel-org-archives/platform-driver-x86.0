Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A24CC0015E
	for <platform-driver-x86@archiver.kernel.org>; Fri, 11 Aug 2023 12:05:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233932AbjHKMFC (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 11 Aug 2023 08:05:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231939AbjHKMFB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 11 Aug 2023 08:05:01 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17E5B10F
        for <platform-driver-x86@vger.kernel.org>; Fri, 11 Aug 2023 05:05:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JQz3f6xoCjX7g8wnUuz65uXFVa2zPWc9Xee8OHcM/wJUxvuQoQusVpBilqw+75bRSmXiiZCPoV8oFM7RxGPSOmqpX8q7VPNqXkGUutz3UtXiZuZVCplL5VCmD9tcFVxXAaW5eY0Jzdwvnqss5Y8lMyOuVkySAWKunlxX2Iv5l85ej6lqp/i99QwOBuQiJDcT80ll6S/K19BdF9HDu9qkCQs50rgi8oEbwmBYiqGxC9zENJLKRXZnz4XuEKFQTgLf2867xii1+8ZK7l3yaPt9T3amf6rZA1VUEU4yaV4+QdpFJoy94WdG55fK/R+Z/KlQqLCwcKJa2inpj+Vw8u0WwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vPBOY5g0Fs1v1MUQ3rKYdcrqtC9WBqaHNS3zrUg9vt8=;
 b=OyS3jJTB5qNQ5VuDh4uZuYlUfY0/zsZiukehe9o7zkCPhfJV+03zeRPQ/dnxwOBCKNDC3s0BVrbjaOtHGIkqMh571UTk4nShEUDtRikEq9g67zmyBue0Qd59MHIErA47FzFYTZNVtxtrOHLASQpwy8T0AYWYhwrO530kMVvxkjg9dARn0K1C6tDJ21ICMtfwS/rN30I27qOpiXT2mpz9yhuBoFoJM2fkC7ZOTjQJqpXVAXz5+MrFbFc2+0ZIY5Zc9gJF+XpKPgsWAQBDmYPG4duRw4yNy+QaE1SYLQvHgfIWzVgjbH99xpVVi8O0XAApYKiXFtLfnJ9Ac/RONax32Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vPBOY5g0Fs1v1MUQ3rKYdcrqtC9WBqaHNS3zrUg9vt8=;
 b=hh+qKBh6jnUotfxcphXvdc0GI1FvphJvA5S+u8E2TfYABEuH+o8Kgr0aMLb4n8MR2SqIEFU+R8sGHzhtUTKaOPRTUyT2hqBsCF53EZZTPt2gApErSkIvnQW/b6/IgN4be51wFUm4hmmDs0sqHM+Rj+0FIiBWnjwcWU2Hb8QnerM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SJ1PR12MB6291.namprd12.prod.outlook.com (2603:10b6:a03:456::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Fri, 11 Aug
 2023 12:04:55 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::36f9:ffa7:c770:d146]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::36f9:ffa7:c770:d146%7]) with mapi id 15.20.6652.029; Fri, 11 Aug 2023
 12:04:55 +0000
Message-ID: <744416dd-b860-4ad9-b731-857fd53fbb4e@amd.com>
Date:   Fri, 11 Aug 2023 07:04:52 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] platform/x86/amd/pmc: Read SMU version at the time of
 probe
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
        markgross@kernel.org
Cc:     Sanket.Goswami@amd.com, platform-driver-x86@vger.kernel.org
References: <20230811112116.2279419-1-Shyam-sundar.S-k@amd.com>
 <20230811112116.2279419-3-Shyam-sundar.S-k@amd.com>
Content-Language: en-US
From:   "Limonciello, Mario" <mario.limonciello@amd.com>
In-Reply-To: <20230811112116.2279419-3-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR06CA0006.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::19) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SJ1PR12MB6291:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c3e3949-a2c7-4a18-571b-08db9a632d1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YrHpsDwXcy7/qA7h9CQIdq5UeOUQklV8AluIdY2/7nhOidD3PF6lZLM7JfcE5K879RK4lYN9ge/mIb1U1gi93ju7NJ+j99YXpPxmWYDSPokAYhreadUQ/N9Kswm/YcIrZU8ZCGp09+ozgx5j9542mJXID117tL/aDqkKlFFqweRDBKDXpq9kUV1Qh//1GlEjBX8ZFV8ZYqqhjhsijLM6928i8LUgheq5LVs9JZDtyzESVOsW0vg2S7Tg5U2jjn6V1udCT2rv3rQSnIiNi3K6LCsef5Rpsx8qFp1n7ud0WhkEtJ0GkLW8R7UvtPdo6adaw3OdWjHPYSLuKePzA/1mJ+jNDwZnlq3aTPDbPo9cXXgSRbyBpewbdC+cWMZj1ZikDLRicM7bn7g685+a7MKIK1M2NrAijCkZ6koBnGDIbfPhmbR3rwulJUtJIwMbsrAue1YNs5+/QELrFFJB/Rc6RIgKyjUuiiCUBRGZLUuYBS8p2+Rd5+sDRf0QOPK1BuG5lp8KtB8+jfz4HN7iZv/gX6B2Cq6B68xqbZSlG3CuL4P1aYSTZvza0Z/YFhiRJJa8l6McuUYWKcmJuPvrtE5ImXbvopKYAit+f8mC7+DfPSo5SLNoBOKBDnGoEeG/7E8qq/nFuw8e46HRIHZOt8DoOQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(366004)(346002)(39860400002)(376002)(136003)(451199021)(1800799006)(186006)(36756003)(53546011)(2906002)(478600001)(26005)(6506007)(6512007)(6486002)(31696002)(6666004)(8936002)(5660300002)(316002)(8676002)(66556008)(66946007)(4326008)(66476007)(41300700001)(31686004)(38100700002)(2616005)(86362001)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RnFoeGdua1ppQ0lRYnJZL3daTE1Cdm1pdGx2SlN1TFdkcHZRS2VaelFMZVFi?=
 =?utf-8?B?alZHZUlDSjlmc2tRdWNWLzJqd0dXNkZUOHdNUTd6V05RbW8yOEdHby80d1pS?=
 =?utf-8?B?emxJUTJBaVRVUlJ5UXM5dGFLTFYybmxUOXJoOFZRb0xlQXB5TnFSTlc0NFlQ?=
 =?utf-8?B?SWtjbmZuQ293QTVaMk9NNGNWRDYvUmw0bjZacXgvZXRMWXlGcXo3c1FoYnds?=
 =?utf-8?B?dE5BVDJtM1JVTVUxNi96MmV6U01BYzZlOWZsRmJGSUdoM2k1RURlaGVNcmhD?=
 =?utf-8?B?Nkpoekt3S2RNMDBrd1QxQ0hxVklnTEpEZjlyaEtySU9QOG1GeTlQczVoQnFG?=
 =?utf-8?B?K091bGt3WHVTVXlCMnZueW1FejJYL3FPTXpEbHpJNWRHZ3dzUGhPQkF5ZnpO?=
 =?utf-8?B?TlJRRmo5MmNscTU0cDhXUzhVM2hneEk5ZHJ2S3JSODZGSnB0TnlQNjhUUDVK?=
 =?utf-8?B?bUZrYkFiaDJnd2FWNVhUdGs0c0xhekgxOFhlK2tmYllFdkNvdEdYWTg0Sy9w?=
 =?utf-8?B?RGw3d25Bd3FBWUJqdjJMazk3WjJlYUoxMXpPSEhzOXJLcWh6bWJGRmViUHBr?=
 =?utf-8?B?NHZQSy9SdHkyZDZnbUJKUjlsdU1ZdUVXY1dWUGNOaG5veHQ1bDdKaWh0S0k5?=
 =?utf-8?B?MyszWWVnbGl5VVFsRjNwTzZXZ3d1cVRoZmZWQU5RamR5WXc4bGRtbkJvZUg4?=
 =?utf-8?B?UGt3RVBxcU9DNVFHZURaYm10NG1UOWhTS29BdGRnR2pxYmdkV2NVWHMrZDBz?=
 =?utf-8?B?bzJDa0thOU85Vml4VzlQelhvRER0dUpPVnFJaEZjaDhhZzVPMHFicXNiMWZH?=
 =?utf-8?B?QjlyZlRDZUpackFIRTZwdVNtdnhzMzFtdTN6QlVyenV5TVhPcDlPUnJTQnMv?=
 =?utf-8?B?dWU4QmxFSjRDWEorTjZBMHpjU2NleDJzUmwzWFZNN0JSVGNrSXQzOEIzY1ZX?=
 =?utf-8?B?L3BQQjFvbzFjL3E5L1RnR2RDVXhTbzZkbnhaZ0VuZkNmWnVIY1VMQWwxRUla?=
 =?utf-8?B?U20vM2tLcHd2dW1MMUdiZ0pZYzgrbFhIVlA4eVgzSDFxMUhOUldPclRFNnZr?=
 =?utf-8?B?bTN3Njg0aGRTSGVONEhJbHo2UXdpWFZ2VjBJeHlxRVR5OVVKeU90eW9GeEVx?=
 =?utf-8?B?Qjlua1dkVEdnSEVzc0xPUmR6Mi8xVDBLOXZCNEVxVnFYSnZ4ZXA4Y0E4VHRE?=
 =?utf-8?B?aUs0eksvT0w2c0lTOHRlMDRxOWtacW1rVCt0L3pqZ2RTLzhmU3hseDdMMzIv?=
 =?utf-8?B?YTlRWnd6WUNWeXRXMjV3Szd1RTZKbnVQaUNmZGhHM1ZIOEwrY1FxN045bWZu?=
 =?utf-8?B?bGZWQnlwT2FIUnA3dHo2Q05FeHFOR2ZzemVRMjNmOTE4YndITDFBblRHZER0?=
 =?utf-8?B?aTh1cGdrbGJuNUM5WnlPUTV4NjZ4SXJySm5tSWc0blFwZEVsenRkcjZRVy9U?=
 =?utf-8?B?VW1hdU8wSDFzMEJOMXh1UkUycUV6Zk1haDl2dFVUbXE1cEpOVUlCV3lZOUt4?=
 =?utf-8?B?T2tsRHU1THpmU2pZS0xlUmhqQlQwR2Nwd3lBc2tKWEErM3ZpRnhJdHhGaUN1?=
 =?utf-8?B?emZ2UWpjeExML1VEMGwyZEJLenRsT3lhK1BEQVBYSEV3SlMzRTNQZFZ0N3Nx?=
 =?utf-8?B?M1RnSnpJWnVJOHVSWVpZa2Z6L3NOT1QxK1V0anhjcGlwaDhDbVdlYm81djBr?=
 =?utf-8?B?Ny83Z256ZW5VOVAvZ0tZWTFYbUtxZFE1eEtaQ3NvNGVtbDk3Y2N0Ly92WHNV?=
 =?utf-8?B?ckpINzN4Njg0bDE0aHJUencrVWtwRkp5WmxObWZrSzB0eFJQMWVnUXdCYTFE?=
 =?utf-8?B?eWEwUFJhd1FIQnFNT3ZjdVpBdlB1T29OTmg0TXJBM3MwVm9rYy8xWW9zSUIx?=
 =?utf-8?B?NnNTUmtyMTJCcEZxWkNkYmxOU2JNMmRLS2R5K09adEdSOFRrSjQrMGtTYWhl?=
 =?utf-8?B?di9VMW9EK296bjhzN1BkM0lpT2ZmbFJnTzkrRGRxTm1BeE44SXZhZ3hqWHVa?=
 =?utf-8?B?MnZpVGJvYWFZQnF0VmN5VG5sQmV2YWFUcTVVRC9id3VpNEVETW5mdXhsS1BU?=
 =?utf-8?B?dDhMcVlaM2NpM0tmUmxWUmRvZWpzNXNuSU5HZHpNUGpGU1piY3pSdHM2Mngz?=
 =?utf-8?Q?eA2vTjTy2TjTQxbUFmYQPmjqS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c3e3949-a2c7-4a18-571b-08db9a632d1f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2023 12:04:55.4914
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8lJSEbMckq8BhoK5P9AOsJN8f2wzMfIVw0GE2MalstKunnD/gQAPivEDvru5Tt5xtLJ+lPHU98AszQ3G8/9lTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6291
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org



On 8/11/2023 6:21 AM, Shyam Sundar S K wrote:
> Currently the SMU version is being read at multiple places, unify all
> of them and get the SMU version at the time of probe.
> 
> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>   drivers/platform/x86/amd/pmc/pmc.c | 39 +++++-------------------------
>   1 file changed, 6 insertions(+), 33 deletions(-)
> 

It's actually quite intentional that the SMU version isn't read at probe 
but rather at first use.  The reason is that it increased boot time in a 
measurable way.

> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
> index c1e788b67a74..043451fabbbe 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.c
> +++ b/drivers/platform/x86/amd/pmc/pmc.c
> @@ -405,12 +405,6 @@ static ssize_t smu_fw_version_show(struct device *d, struct device_attribute *at
>   {
>   	struct amd_pmc_dev *dev = dev_get_drvdata(d);
>   
> -	if (!dev->major) {
> -		int rc = amd_pmc_get_smu_version(dev);
> -
> -		if (rc)
> -			return rc;
> -	}
>   	return sysfs_emit(buf, "%u.%u.%u\n", dev->major, dev->minor, dev->rev);
>   }
>   
> @@ -419,12 +413,6 @@ static ssize_t smu_program_show(struct device *d, struct device_attribute *attr,
>   {
>   	struct amd_pmc_dev *dev = dev_get_drvdata(d);
>   
> -	if (!dev->major) {
> -		int rc = amd_pmc_get_smu_version(dev);
> -
> -		if (rc)
> -			return rc;
> -	}
>   	return sysfs_emit(buf, "%u\n", dev->smu_program);
>   }
>   
> @@ -526,16 +514,9 @@ static int amd_pmc_idlemask_read(struct amd_pmc_dev *pdev, struct device *dev,
>   				 struct seq_file *s)
>   {
>   	u32 val;
> -	int rc;
>   
>   	switch (pdev->cpu_id) {
>   	case AMD_CPU_ID_CZN:
> -		/* we haven't yet read SMU version */
> -		if (!pdev->major) {
> -			rc = amd_pmc_get_smu_version(pdev);
> -			if (rc)
> -				return rc;
> -		}
>   		if (pdev->major > 56 || (pdev->major >= 55 && pdev->minor >= 37))
>   			val = amd_pmc_reg_read(pdev, AMD_PMC_SCRATCH_REG_CZN);
>   		else
> @@ -717,13 +698,6 @@ static int amd_pmc_get_os_hint(struct amd_pmc_dev *dev)
>   static int amd_pmc_czn_wa_irq1(struct amd_pmc_dev *pdev)
>   {
>   	struct device *d;
> -	int rc;
> -
> -	if (!pdev->major) {
> -		rc = amd_pmc_get_smu_version(pdev);
> -		if (rc)
> -			return rc;
> -	}
>   
>   	if (pdev->major > 64 || (pdev->major == 64 && pdev->minor > 65))
>   		return 0;
> @@ -749,13 +723,6 @@ static int amd_pmc_verify_czn_rtc(struct amd_pmc_dev *pdev, u32 *arg)
>   	struct rtc_time tm;
>   	int rc;
>   
> -	/* we haven't yet read SMU version */
> -	if (!pdev->major) {
> -		rc = amd_pmc_get_smu_version(pdev);
> -		if (rc)
> -			return rc;
> -	}
> -
>   	if (pdev->major < 64 || (pdev->major == 64 && pdev->minor < 53))
>   		return 0;
>   
> @@ -1059,6 +1026,12 @@ static int amd_pmc_probe(struct platform_device *pdev)
>   
>   	mutex_init(&dev->lock);
>   
> +	err = amd_pmc_get_smu_version(dev);
> +	if (err) {
> +		dev_err(dev->dev, "error reading SMU version\n");
> +		goto err_pci_dev_put;
> +	}
> +
>   	if (enable_stb && amd_pmc_is_stb_supported(dev)) {
>   		err = amd_pmc_s2d_init(dev);
>   		if (err)
