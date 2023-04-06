Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90934C761A6
	for <platform-driver-x86@archiver.kernel.org>; Thu,  6 Apr 2023 16:54:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239240AbjDFQyE (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 6 Apr 2023 12:54:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237927AbjDFQyD (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 6 Apr 2023 12:54:03 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2066.outbound.protection.outlook.com [40.107.220.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0F302108
        for <platform-driver-x86@vger.kernel.org>; Thu,  6 Apr 2023 09:54:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f1PSw3+UkahRc93HPs9ILOpHDSZTAy2JDblyrxx9haOFSGgHvty72yfJ2oh7KcRsUWZanWEAt6cMANd9Wn/CiwxE5QFzSdG4pkzTotgbrnA5W+FdWA0f2XnhPSD+xqYDQ5D0JMpWs43OLJcBVFF/0TRWwkxwPXWXoujW/L1+1MeUav2udYy7OXmKQOXH47qhRTmAysoVfh4z45OGt/GvGo17rD3RIVxVIdXUi2bJoDb3YG1hUV4iUKGBU/53qFzPu3xgWeEji5kblZBSwToIqOqK5VFU6VbNq3ZkQKwTJdmG6arP7HasjIUSbmMJH7TjgQGp6n2pZw4aDfe/yh/3hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mdq5jTSaReW4FhF35UfdNVypuV5ydYMTMwku4huoO1E=;
 b=gQv0u2tEU7xgrkGItP79OGWDf1LTIMoirMMVHimj3yZwNYaH91DXD1x+UGSy5Y3ISJZOg25U/Anrl9htO8dYETBRVoaqAqbfa1vi6jQZq1vMU4jD/h1cMysF6Cj7sdxx1o5JXczTZ54UTq3Xi8vLr/IoZW4jAAoLVUCYXRVhgeXAUWJ5k4piQh1JezUQcvdz/dDARj6I1DFla2fQ7sCEfzFjKnbjSUAIAKTRaObwr71N945dyZBPXOCMiFP6TyjOQs6XG1rrEo8rA5q6dbWQbCZg04TSvMK7LAV7zrle8LRWlEAUmbXKgGFwt/DV7tXK+J9uFJaGj5926P3tU4DH9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mdq5jTSaReW4FhF35UfdNVypuV5ydYMTMwku4huoO1E=;
 b=DoBJbsLCNTpnrCCyCUcocos3kMRg52fqR4407F7kFyCQBSwcILZgsLNi9PeSgr3W69JnJ46Vs4L/OcPN9jJD5bouD4OqKAtBaLn3LhkzpbxMp6LSvscR3kfZetYRI/4502TtL8GkobLdbHBS3BCxrudlQV+pQwvW1N4Wot/2QgY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CH2PR12MB5513.namprd12.prod.outlook.com (2603:10b6:610:68::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Thu, 6 Apr
 2023 16:53:58 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::f4d:82d0:c8c:bebe]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::f4d:82d0:c8c:bebe%2]) with mapi id 15.20.6254.035; Thu, 6 Apr 2023
 16:53:58 +0000
Message-ID: <409e3bbc-27b3-8237-3890-63c4c3a55574@amd.com>
Date:   Thu, 6 Apr 2023 11:53:56 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 3/3] platform/x86/amd/pmf: Move out of BIOS SMN pair for
 driver probe
Content-Language: en-US
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
        markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com,
        "Held, Felix" <Felix.Held@amd.com>
References: <20230406164807.50969-1-Shyam-sundar.S-k@amd.com>
 <20230406164807.50969-4-Shyam-sundar.S-k@amd.com>
From:   "Limonciello, Mario" <mario.limonciello@amd.com>
In-Reply-To: <20230406164807.50969-4-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BLAPR03CA0110.namprd03.prod.outlook.com
 (2603:10b6:208:32a::25) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CH2PR12MB5513:EE_
X-MS-Office365-Filtering-Correlation-Id: 54ef9321-ffc5-479c-6b1f-08db36bf83da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NP+ZZXZ6KkYPn/Vm/KhOobPouFaUsZea7+KfCs9S+7aXCO4d48B+hsqDYyCzF7RvqIDZ6nKzN+Z15yj/8qbUbQ8PULd48wxFAMJr/xifZyTaRU9Gs8N1dGHkdaOSLFAdBATes/79Hyu8KcVOB3aBZDUADfRRX6j7NuK8cnyjoopoYJj8UyINvMzvwxqHYDnS7THJ3yE6Y98DWgWumWFbNM+3cNmNVk3f60GNBB16PLvrI4WUG2KOOkRNFgGliFSmyTTVpQ+xV321OvxuflY6iRYBpSR7OO22xF+cXoD9z0EQ5O2OOsfq746UmarxGBnmMIAQYKXJOdvOjGzbEnCQlKre6mnUlLAo1R26BffyhFM+1VTHETx2xPCskgDwI/t6rvgn9jiK6mqBL/p81hgdyTt7posJ37gliOENe4f0ikz2Wn9h/8IxhcJbLrqk0DOAwcLcTZykkjQNjasN9p9kANySd4Dsi1bF+5mQElo6KQoaVyBYXvlV8EJB5gQZob9cOCgwDEVywdOgn20a8eeYdqGsvm2i4Jeq4/dQW2PEoc0BOwXNm26Y4cJb9yyc67Q2D2ATn/eg8Wuchyd/ROhNWAAZeNkmjSoF86Qs0RgWFIWDHLxD91AxUFM4YQ7AmDDEft4wTDZmlaLmR6R8dXTnJA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(376002)(396003)(366004)(39860400002)(451199021)(31686004)(26005)(186003)(53546011)(2906002)(31696002)(5660300002)(86362001)(8936002)(6506007)(83380400001)(4326008)(6512007)(41300700001)(2616005)(478600001)(36756003)(316002)(66946007)(38100700002)(6486002)(8676002)(66476007)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UERNQzRPUC9HMHlwSzh3T0NLU003ZjRWditlVGwvUC9DbFlOUjEzYnhnRWlj?=
 =?utf-8?B?R2tTdFBjcUFQTWJlU2xNSkhiWWNTZzdPLzBTS0I4VjJLYnd5aTBoL0ppQjhm?=
 =?utf-8?B?VE0xWW5mdStqdEdZZnMwNmh0RHZTdE44U3NHRllIdkp6TnZhYUNmaXhVczh6?=
 =?utf-8?B?ZllPMzNCZEJwcGFEcU8wcTBDUHlySnJDLzExRnpwYUVXZHVKL0pvWEZ6VUE0?=
 =?utf-8?B?ajViTVZBSjJBMlB5aW5OR0E1YWZNelM2WUo3WHRmZVRnN09yYTdaWXNSNWZV?=
 =?utf-8?B?NzVyMFVUQWNSTHBIYUFUVERRMWY5dGVzanRQM0Q5dFVsaU5oaXpCREs2YjNx?=
 =?utf-8?B?d2wrZlpTTTUycWZUV0l1Ri9NeDExeTFMV3RjaHdIenNIYnJ4QjZZYXVIekF0?=
 =?utf-8?B?cnhEdGxNekMwRVhGRmNRaHpKeFNRZjhhcGFhRU1NakJ0OVRSSnVzcnVhVXgv?=
 =?utf-8?B?aXpVUkJuOTQxT1ZkenhsY3owcEJoa25kek45eit4eklaRDVwZnAzM2t0Z3dR?=
 =?utf-8?B?U1ZZUEQ4ZHpZYkFZeEwwWnhYZDRicHhuUDJtaG1qSndKak42U3JCSWYya1hH?=
 =?utf-8?B?TzF5dGptUTJ6QjQrd2prZU9iT1hwcDJoYU9paHBRRlRvOTUwS3RXN3VjTlFS?=
 =?utf-8?B?b3EzWUlTV1dyY2RmalZOejJ6SkY2enhnWE9HZTIxNGpHTjk4OGFpWVZ3dEh0?=
 =?utf-8?B?VlNzSk1yenk5eU1hWDdPZmN3QlM3SHZXS2RUN2l0R0lWOVdBTUV5OE54TDRH?=
 =?utf-8?B?SERTVW1iWE9WZXlHeVR3U1hQeGt1ZFZNVEl2eXB0R3pWd1RiWCt4dGswcDIx?=
 =?utf-8?B?R1dmUGVqT004MEJ2VFJvaWsvZE9BcEhKZmc3eVVpWGRqWldLSVlTM0UvbnIr?=
 =?utf-8?B?bzJ2RFRMVWV2QjBsQkJtaW02M3R5NzZDblhmTlFJcHVMUittcUVpV1oreStx?=
 =?utf-8?B?aGovZW9YR2MwR3Zvd2YxSDNjM2V6THRJallERWZhYUhIYm96aXlYR2pRV3p3?=
 =?utf-8?B?WGcreGNvTFgwalZ2cVVFYlJXZytwdzJzYmZDQVQxVjNqeGYxZmpyc3hpbFFW?=
 =?utf-8?B?ZHlCYWhRc29GOWdXcWh0MzliZlNqTFp5UXk2OEIrQ1VPdU9tSjM1TE5MakFT?=
 =?utf-8?B?OWh3K1ZKSXBpd2h0T1lJaDdGOCsyMlp1MjQzQVhocHQ1NXdoS0ZUbVd6N0pR?=
 =?utf-8?B?UjdFV0x4elRuSWQ5bVo0UFdsTlZIdVpoV3RHVHpQYnFpd1IxYVFYcWFPbGM2?=
 =?utf-8?B?MjBITW93M2JnZmZlV3BRK2VsNk5TcThZYXphVG1MbHZtQWZ0OTZPV1MvZUxN?=
 =?utf-8?B?Y3dPL0lSSG9qM29BSGY2QUpYbkRxREMwR3l0UXJsY1V1R09XdXV1V0kxYU9S?=
 =?utf-8?B?ZjlZYno3T3R3UVI5YUZTRzFKbXYwZnl3Q1dJTFZYY3UxT0t0cWpSZ3g2Q2VJ?=
 =?utf-8?B?N05SV3ZWTlBqRXpIRUxTTjd6T3pReDNFQndVb2E0R09OZkJBSHZCNTRVTFNV?=
 =?utf-8?B?eFl0a2VQMURBcjZLQkVuYlR5dUN0ZlB3LzNDY2lMTTJaUDhoYWZXL09CczZa?=
 =?utf-8?B?T2xOWTFCZkQ3Z0J3bGF0LzdIbno2bzVKWnVnQXVkSEJzR0xRYzgzNkRWOGRN?=
 =?utf-8?B?ejNBQlBKS2dNVGdtNVBYSFN3MmlQSnBIUVAwaFlEVFJENmJIQUNlZmxjUHRG?=
 =?utf-8?B?R1dhY0U2aE1yemZJQVJXdEx0Wmk4cm1mSFVmMGc5dGJ2Lzk1QStSVXFzUnNI?=
 =?utf-8?B?RjA4KzhIbjdnZGU5N3pueGdOeEw3OFBub3VJKzd5QkpVcmQ1cjdteHh0UmtJ?=
 =?utf-8?B?YXZhaldmZGNETm11N1VOY0NPZVR4YnpFUEJsKzYwWXk0b3k4QWhBeDZ0M2JW?=
 =?utf-8?B?dlhycGZib2dLbklBdzJlU0k0SXQ5dXBtUUVFN0FpUFBxT1NUWit2VUdaSlpK?=
 =?utf-8?B?K2s5ZUtHL29vYlhiaEEvY3Z1SHV5T3FtMUFVM0hpTlBpRlllcFVmdjRJZThT?=
 =?utf-8?B?UmRiUHhxY1d1dUhJMmlVTlh4MG5pb3dkUUk1Y0dDcmltc1RMOGozWHF4UDEv?=
 =?utf-8?B?VGcvRUVpbGhWd3ljSG5kQzJsTEp4Yk5td0JWQ25DMFRzZXN1L01jTyt6Rlh0?=
 =?utf-8?Q?jfVGInUuA86/roJGKoH1GK8GC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54ef9321-ffc5-479c-6b1f-08db36bf83da
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2023 16:53:58.3168
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PnqbXUtINelT/TfWo5WMa06UKwjBOBCmfD4jqgIk6yu4bkwjkFSirMOeU9prvzgZNherABVbR8xJ1/6Me6kCFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB5513
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 4/6/2023 11:48, Shyam Sundar S K wrote:
> The current SMN index used for the driver probe seems to be meant
> for the BIOS pair and there are potential concurrency problems that can
> occur with an inopportune SMI.
> 
> It is been advised to use SMN_INDEX_0 instead of SMN_INDEX_2, which is
> what amd_nb.c provides and this function has protections to ensure that
> only one caller can use it at a time.
> 
> Fixes: da5ce22df5fe ("platform/x86/amd/pmf: Add support for PMF core layer")
> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>

> ---
>   drivers/platform/x86/amd/pmf/Kconfig |  1 +
>   drivers/platform/x86/amd/pmf/core.c  | 22 +++++-----------------
>   2 files changed, 6 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/Kconfig b/drivers/platform/x86/amd/pmf/Kconfig
> index 7129de0fb9fb..c7cda8bd478c 100644
> --- a/drivers/platform/x86/amd/pmf/Kconfig
> +++ b/drivers/platform/x86/amd/pmf/Kconfig
> @@ -7,6 +7,7 @@ config AMD_PMF
>   	tristate "AMD Platform Management Framework"
>   	depends on ACPI && PCI
>   	depends on POWER_SUPPLY
> +	depends on AMD_NB
>   	select ACPI_PLATFORM_PROFILE
>   	help
>   	  This driver provides support for the AMD Platform Management Framework.
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> index da23639071d7..0acc0b622129 100644
> --- a/drivers/platform/x86/amd/pmf/core.c
> +++ b/drivers/platform/x86/amd/pmf/core.c
> @@ -8,6 +8,7 @@
>    * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>    */
>   
> +#include <asm/amd_nb.h>
>   #include <linux/debugfs.h>
>   #include <linux/iopoll.h>
>   #include <linux/module.h>
> @@ -22,8 +23,6 @@
>   #define AMD_PMF_REGISTER_ARGUMENT	0xA58
>   
>   /* Base address of SMU for mapping physical address to virtual address */
> -#define AMD_PMF_SMU_INDEX_ADDRESS	0xB8
> -#define AMD_PMF_SMU_INDEX_DATA		0xBC
>   #define AMD_PMF_MAPPING_SIZE		0x01000
>   #define AMD_PMF_BASE_ADDR_OFFSET	0x10000
>   #define AMD_PMF_BASE_ADDR_LO		0x13B102E8
> @@ -348,30 +347,19 @@ static int amd_pmf_probe(struct platform_device *pdev)
>   	}
>   
>   	dev->cpu_id = rdev->device;
> -	err = pci_write_config_dword(rdev, AMD_PMF_SMU_INDEX_ADDRESS, AMD_PMF_BASE_ADDR_LO);
> -	if (err) {
> -		dev_err(dev->dev, "error writing to 0x%x\n", AMD_PMF_SMU_INDEX_ADDRESS);
> -		pci_dev_put(rdev);
> -		return pcibios_err_to_errno(err);
> -	}
>   
> -	err = pci_read_config_dword(rdev, AMD_PMF_SMU_INDEX_DATA, &val);
> +	err = amd_smn_read(0, AMD_PMF_BASE_ADDR_LO, &val);
>   	if (err) {
> +		dev_err(dev->dev, "error in reading from 0x%x\n", AMD_PMF_BASE_ADDR_LO);
>   		pci_dev_put(rdev);
>   		return pcibios_err_to_errno(err);
>   	}
>   
>   	base_addr_lo = val & AMD_PMF_BASE_ADDR_HI_MASK;
>   
> -	err = pci_write_config_dword(rdev, AMD_PMF_SMU_INDEX_ADDRESS, AMD_PMF_BASE_ADDR_HI);
> -	if (err) {
> -		dev_err(dev->dev, "error writing to 0x%x\n", AMD_PMF_SMU_INDEX_ADDRESS);
> -		pci_dev_put(rdev);
> -		return pcibios_err_to_errno(err);
> -	}
> -
> -	err = pci_read_config_dword(rdev, AMD_PMF_SMU_INDEX_DATA, &val);
> +	err = amd_smn_read(0, AMD_PMF_BASE_ADDR_HI, &val);
>   	if (err) {
> +		dev_err(dev->dev, "error in reading from 0x%x\n", AMD_PMF_BASE_ADDR_HI);
>   		pci_dev_put(rdev);
>   		return pcibios_err_to_errno(err);
>   	}

