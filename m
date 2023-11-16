Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D177C47071
	for <platform-driver-x86@archiver.kernel.org>; Thu, 16 Nov 2023 17:06:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345281AbjKPRGK (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 16 Nov 2023 12:06:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345268AbjKPRGI (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 16 Nov 2023 12:06:08 -0500
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AF411A8
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Nov 2023 09:06:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aBBMLMNKdMiQr0r3K60l11Wymj9EJfLUGmgwRaRvfkOibg9iUq4kIdYwUEvqetETX1fHF7AC2/vmYvpW3/PHELAloYvbgg8ghpNDssM2U9R96KYOIcNkaCl+SHk2jrXJawe4TAy50XX/xis7SfFl32iYuGuFQXAi4+bCF5r0d03E271PabSpsB24hDGYS7ecMvhWxs5lOpq7vhxAJsPMm5bhL+c8YULXYiBTqPRogVa65PLMN587u2mZrDZfXcm2rGM0ad7hw+hZ++wHSG6TjCmXWhd6KgcolZo20MJsDZ3O6wDWltCz1aBd3Q6KSLChIySHH898Ku1aQHCz0CagBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p+JlzzAakSUIX1I51keg0uhVHasJwshK0qDeciAYvoQ=;
 b=AcFNPEpWks5NZHN/nZbxVdkj1wzc4jqi1IamAM+n/ETc+t6w2xD3wAV0P4s+qGZtKbHBbWylVv3fkR9almX1JBR+hovVQ0zzOk9Ec8n/f8A1RJRvNoAwm6obBCSBTQJecJmmcLnoC7vJXWrbdQ+UYw3XPjvI5X/XQtWiXj0MWRM2KHv/jRgVZ389TwJcUHWXpU4T8auE9OqF+sl8GNUJ6eS91IXRdAYSVu33hItxR+MOlii1OZxzbBotQ9rEoXGQX50Gi/p4ZvStuJciavJHSOImDOjpj8SfOyiGT2pfQlK3o/cY1fyTzntx9GcYV627/pQFglIXHcJ5po6LF7xVsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p+JlzzAakSUIX1I51keg0uhVHasJwshK0qDeciAYvoQ=;
 b=lfThC8o1zDhUq5b0rtLDnQF2R6eibmyQmO4UfPOitX+KTsS96gT2GteOd5eIamxGdIVCdlyA+01ROzYiDK8anUiknxI2mZ0NfOFSiXu6NlLAQfcCPAoUl4xsw9gqG6nDarVwPZJGYvLVwXyICgO2RtvJXnSMwyiABT148sKwUH8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DM4PR12MB6278.namprd12.prod.outlook.com (2603:10b6:8:a4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Thu, 16 Nov
 2023 17:06:00 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::83d7:9c4f:4d9b:1f2a]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::83d7:9c4f:4d9b:1f2a%5]) with mapi id 15.20.7002.019; Thu, 16 Nov 2023
 17:05:59 +0000
Message-ID: <db938696-6ac1-4ac5-9143-f3b54bd2cf40@amd.com>
Date:   Thu, 16 Nov 2023 11:05:57 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] platform/x86/amd/pmc: adjust getting DRAM size
 behavior
Content-Language: en-US
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
        ilpo.jarvinen@linux.intel.com, markgross@kernel.org
Cc:     Sanket.Goswami@amd.com, platform-driver-x86@vger.kernel.org,
        Mark Hasemeyer <markhas@chromium.org>
References: <20231116170121.3372222-1-Shyam-sundar.S-k@amd.com>
From:   Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20231116170121.3372222-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9PR10CA0023.namprd10.prod.outlook.com
 (2603:10b6:806:a7::28) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DM4PR12MB6278:EE_
X-MS-Office365-Filtering-Correlation-Id: d6e41b24-aafb-4c58-18ba-08dbe6c64e77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l4tz5ycz9OzEgHIOsjgZXkE2YEwScj8iA0AU+uO0H9FIsd/bqdT/o1yxDKv3xZmAILLuQXUkUehaiNBvIIrmsMgRzme2ihMhjeD5FlTauCvyyehEGL4DEIKolnayZgv2m9Sv/Vs4vjy1S21i4Oq9gKQK6nYdy8qko8jnRheOXBj9Dsu+qnGc19ZwuVmMKtQ5aDtzjbB3IMopENmlMMqKgeQXmqdLRKNkAdiPlHMQF4/45vTXKBCh/FXcbSPpdMdRHkKLwvqLHS+dbBMjJdR9Y0o+YaX/3W38BCExmQ6iS/8Ce/eL4ayz4MbUjqdzN56OvjULJoAvp39U2Wlc6+8CnjrlaTCbAuSqcnv83CfvHuXK1XOtZjZYllVbv667HAeV+xFwoAip2hv0B7RrW/8CxubKFscE6U/OZM/SQMsLizwp1fn+BbQ9aPsCo2aoCWHCTR25ZBOrLF3zvxYMK4W2AY7k8IdeqzEUhbA8P5ZgcUC1ufUIxH1IMhp0gca+Oulk54tYfegiMRUWyapeRBH0tCaVeKMrC3lojxf3QnVibdaHu+tmU9nhZ6kOg6kvqko97kl9cK/jZB0PUbODL/Euj+eOhETAlTG4RBhiB9ntv/hYSRAUxrKOB4JHIX/AB/Mt2/LCSuhtCw6/69N/oma43Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(396003)(376002)(346002)(136003)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(66476007)(66556008)(6512007)(316002)(36756003)(66946007)(26005)(66899024)(2616005)(966005)(478600001)(6506007)(53546011)(31696002)(86362001)(5660300002)(38100700002)(31686004)(2906002)(6486002)(83380400001)(8936002)(41300700001)(44832011)(8676002)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V0pmS2NkZjM4VXRKYloxdXhxSm9oVnpNOHlIRkh3djh3d082bmJUT1NNMUI0?=
 =?utf-8?B?MDF5SlZnaXhqQkxhSW1ZSThMUC92eUlDbzBrMUJ1MFhLM0R1TFZkbXUvMVFS?=
 =?utf-8?B?YTBqWUd5dHM1VTNCKzNRMi9jd0UvNXhsK1Zodmh3SGkwdHUveXdPbldzWW5o?=
 =?utf-8?B?QTdiSHp2NS9sOVN1QUtVaWU2ZGR3L2VFb2svNzNUUFRtVXNQdHA3NVVYUktT?=
 =?utf-8?B?MkpwWExlN1pLcXJad1Y2N2JTSmdRZnlUV0FDQ2EwTzVUQzhqMHprS0lnSzZJ?=
 =?utf-8?B?c25tTERWOXVnWU5QaTZFTU8wbWZIbVdvUzVLZWhNTXBJeUlHYjFHa2lmSDhj?=
 =?utf-8?B?YVFESWh0SFNycVpRV3FZUElmbVNLU1VpeG1UNGFCeUNNOTVsOTVqTU5PQUVX?=
 =?utf-8?B?eStzZDhGZTcwWlMraXNvM1poeEUzOTlwdnZ2NmJOV0RCOUFEaDB3ZE0zR3Zq?=
 =?utf-8?B?ZmxJNlFXZk9jUzJhLzgwajhoTFd4ckF2UWVWcnpHQ1JQOGNqWWZOT2FOMGt3?=
 =?utf-8?B?N1FweWpDaWtMclVRMGV6eE54TS8yQmJDVk94VUdmb2NTUzRkU3lEdVdSV1Qw?=
 =?utf-8?B?RWIwZk1LcUVyVjFTcFpaenFFc2JmZU9XWW1RL0g4ZWJDTUtZNmU3enBHYkZG?=
 =?utf-8?B?QmV5ZDBPZ05kcnpyMHIwQTJrLzJFdTlDb2JKVkxsUnFDMkRRQjRyWXR1NzEw?=
 =?utf-8?B?emFqUzcyTWJYVEY4TlhtVlFlTmczQnU1Rm83eEdFSE1nd3RsVXljQ0dDUkhk?=
 =?utf-8?B?TDh2N3RuL2ZvVXhMYjZhK05MQzMzbjgwSUJSbWtvanR4MFk4bzZQYTZxL3Jo?=
 =?utf-8?B?YWdQb2tVbHlVWWZsOG9IRDlPaVVPQ0JFYmhQMmt3dytKMlA2MDBqQ3EzaEZm?=
 =?utf-8?B?OThTNTlKd0wySVNaQ1k2MjZ4ZUlFS0YxQ2d5NVlweUF3S3MyNEJNRUhpcjF1?=
 =?utf-8?B?MHIvaW5WWm92WlkyZzE4ajdZWDUrWDRFY1QrdWVxaXJFUVVsclp4WHNzZnVq?=
 =?utf-8?B?ZzB5N0g5Y1dtbFRBMDVvdG0xd1hxNE1ycTlSVXRhMW4rOHA1YlhHdHdNWmxG?=
 =?utf-8?B?ZCtDUE9KbjBPWGorN2RneS95SWpMUFhmNDluS0kyZ3ZZQUVNU3ZCSHY0NUho?=
 =?utf-8?B?ZFBySS9zY216WmQzTE0vaWxwbGpFNTRXZU9qUG5uREpFcXF4MGRKRy9rckV3?=
 =?utf-8?B?aEg2ZVl2RXBQRTlORDAxVHNDb2gwZG9iL0tET2xWaE91VURUVjdxSWNCRnFj?=
 =?utf-8?B?S29uMzZEd3d4L0xsUXFQQzhTZDhRamxTK1JjRno1TDlnQ1N6TnlpQm1EU2dK?=
 =?utf-8?B?ZnFMV0tpOGhVNVhqZHpiQ3dUc3ZQbmZ6YS9HbHJpQU80NXhObmlXQkFXN0Iy?=
 =?utf-8?B?T3hLcXhJc3A2eW1SWWRhR1grQnM1VDhWT0pEdE1ZU1BJRzB3ZnFVWVlaQ2ND?=
 =?utf-8?B?dWw3L2NHSG5PNTNqRjkxa3FPRjZ3U0YxK3RFb1N6RUlKbUVRcnBZMEFTY2hD?=
 =?utf-8?B?aThuMTdyeklVbGJnQWtoSDBSak1RVHUvOUkvdEgzcVRYTzl6NkRKTnBOQTZU?=
 =?utf-8?B?KzVrM1pEUndyR0VKNU10eElPdklncHg4UXowc2VOd2NobWI4TW03aTVzcno1?=
 =?utf-8?B?N0VJdUtrSHlZYnBlcVlwdG5qbkMrZWdQK0I1bmpiNHNNUnN4d2FxZlI1d2dJ?=
 =?utf-8?B?ODhGL2didktMRlhyTXJhUzdqQ3FTdUQ0bjhNTE85MWxLV3krekRESytzZHRG?=
 =?utf-8?B?ZExOMjVkQWloa3E4UWpUUFh5NTFvWHNiSHIxdnR0QU1uQUgyRE5jdm5aRUpw?=
 =?utf-8?B?eC92QXlkblhtS0Q4RTRUWldmeGY5eEVQdmlCS0RJaWE1RmZ4YjlaaFBWWCtp?=
 =?utf-8?B?NVN2emdmUm5hVTJLRUpFUUhaL0dVSkhDTERoTVNHWktGYVVjK3llcXA4OUpO?=
 =?utf-8?B?YjBSeThUNzBaVncvMXBnQXpqb2d2UlFvV0pTWDBYWGdBTDhDTm5WbURna1By?=
 =?utf-8?B?RUQ2WDV2KzZabkRHcVdtWm5CRnFlNzRVeUN4L3pPV01vWDhuMlA2b0hoM2tr?=
 =?utf-8?B?Ykkva0tnQ1ZoeEM4TFFwdW9Ud01NME1VOXFmc2hEd1ltN3ZFRVhsVGFJN05P?=
 =?utf-8?Q?Rml2PV0TRKTULXh+5XSZjgOuo?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6e41b24-aafb-4c58-18ba-08dbe6c64e77
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2023 17:05:59.8720
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cd/nKfYr1Azb2qnS34wApYh2odiTcuAoOzHuWLvUnkgXVoAM9rmpZA7SFWLJ0RPPy/E9mhz783f40PzzbEzqnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6278
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 11/16/2023 11:01, Shyam Sundar S K wrote:
> amd_pmc_get_dram_size() is used to get the DRAM size information. But in
> the current code, mailbox command to get the DRAM size info is sent based
> on the values of dev->major and dev->minor.
> 
> But dev->major and dev->minor will have either junk or zero assigned to
> them until at least once a call to amd_pmc_get_smu_version() is made which
> ideally populates dev->major and dev->minor.
> 
> Ideally to suffice this, adding a amd_pmc_get_smu_version() call to
> amd_pmc_get_dram_size() would solve, but that has a downside of elevating
> the boot times.
> 
> After talking to the PMFW team, its understood that the "get dram size"
> mbox command would only be supported on specific platforms (like Mendocino)
> and not all. So, adjust getting DRAM size behavior such that,
> 
> - if that's Rembrandt or Mendocino and the underlying PMFW knows how
> to execute the "get dram size" command it shall give the custom dram size.
> 
> - if the underlying FW does not report the dram size, we just proceed
> further and assign the default dram size.
> 
> Simplest way to address this is to remove amd_pmc_get_dram_size() function
> and directly call the "get dram size" command in the amd_pmc_s2d_init().
> 
> Reported-by: Mark Hasemeyer <markhas@chromium.org>
> Closes: https://lore.kernel.org/platform-driver-x86/3b224c62-a1d8-41bd-aced-5825f5f20e66@amd.com/
> Fixes: be8325fb3d8c ("platform/x86/amd: pmc: Get STB DRAM size from PMFW")
> Suggested-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

Ilpo when committing can you please add a stable tag for this?

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>

> ---
> v4:
> - Based on review-ilpo branch (tip commit: 94ace9eda882)
> - Add Mark as "Reported-by:"
> - Add more commit log notes.
> 
> v3:
> - Based on review-ilpo branch
> - Remove amd_pmc_get_dram_size() function
> - Remove prints that are not noisy
> 
> v2:
> - Based on review-ilpo branch
> - Drop calling get smu version from probe.
> 
>   drivers/platform/x86/amd/pmc/pmc.c | 31 ++----------------------------
>   1 file changed, 2 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
> index cd6ac04c1468..c3104714b480 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.c
> +++ b/drivers/platform/x86/amd/pmc/pmc.c
> @@ -964,33 +964,6 @@ static const struct pci_device_id pmc_pci_ids[] = {
>   	{ }
>   };
>   
> -static int amd_pmc_get_dram_size(struct amd_pmc_dev *dev)
> -{
> -	int ret;
> -
> -	switch (dev->cpu_id) {
> -	case AMD_CPU_ID_YC:
> -		if (!(dev->major > 90 || (dev->major == 90 && dev->minor > 39))) {
> -			ret = -EINVAL;
> -			goto err_dram_size;
> -		}
> -		break;
> -	default:
> -		ret = -EINVAL;
> -		goto err_dram_size;
> -	}
> -
> -	ret = amd_pmc_send_cmd(dev, S2D_DRAM_SIZE, &dev->dram_size, dev->s2d_msg_id, true);
> -	if (ret || !dev->dram_size)
> -		goto err_dram_size;
> -
> -	return 0;
> -
> -err_dram_size:
> -	dev_err(dev->dev, "DRAM size command not supported for this platform\n");
> -	return ret;
> -}
> -
>   static int amd_pmc_s2d_init(struct amd_pmc_dev *dev)
>   {
>   	u32 phys_addr_low, phys_addr_hi;
> @@ -1009,8 +982,8 @@ static int amd_pmc_s2d_init(struct amd_pmc_dev *dev)
>   		return -EIO;
>   
>   	/* Get DRAM size */
> -	ret = amd_pmc_get_dram_size(dev);
> -	if (ret)
> +	ret = amd_pmc_send_cmd(dev, S2D_DRAM_SIZE, &dev->dram_size, dev->s2d_msg_id, true);
> +	if (ret || !dev->dram_size)
>   		dev->dram_size = S2D_TELEMETRY_DRAMBYTES_MAX;
>   
>   	/* Get STB DRAM address */

