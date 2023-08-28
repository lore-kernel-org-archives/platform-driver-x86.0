Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42F7EC83F12
	for <platform-driver-x86@archiver.kernel.org>; Mon, 28 Aug 2023 19:18:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232131AbjH1TSO (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 28 Aug 2023 15:18:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233345AbjH1TRo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 28 Aug 2023 15:17:44 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2079.outbound.protection.outlook.com [40.107.93.79])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 948FF102
        for <platform-driver-x86@vger.kernel.org>; Mon, 28 Aug 2023 12:17:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m2rhH8yWQ7r32CNObiCH1H+u2XpTYL5qZGutwpju5blC3uy5Qe+4ExEoU0CKl70q87k3WhghXzA4UsEhyTd0Wd1iYmuBXbq+YwoWw6NRXGoGpApfvrwZRXsavHbzKtEY5xQQRJcb0gnvuZLX2QWOnDvHuFdsdyKwRDA4JV4A4KDFjYYr9nIa0eyx+eTlV2cwiebhndrC/ZNvxtzSFcGwFPPLyGO428mgSvsZwpK6ZnyJUXOOBxD6cafvCjFW0ptXzAdNk/YZCnZEhYfyT5kB6Ldbhcjj+bAWZFGpvQiaMgN+rY11iQY5IdgtRrtLNZJb+chly2cas4uH4Bi0zbX8bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H6eGJ6bgTMs4dueYTr/pgrO7CkfzCm01Myq8KoQ1aBw=;
 b=Gi5hpbRIuqAjTIkH5uE+SmPo9Bt6Hfrw3Erim/JdqSVHguC/lNQQa55twJaqMHAXyyimNU6JJzVnZsgJSrlGMPk6Q5cTxjj9SiSI9b54TTwxoAkZ7rw+3nzwF7mYmcsKjdwLmPcPQy+bs9qjMVDURDzJZbbEmZr813yyCpgR6f7aBJn6kr4Q0D/7GneHYW5Qmpa3Rm8y/HZxTZOy15lZnQmEcxW2xMXmAWLufhKQv4nYOPVRfK1gNebZTMqUbo9EM0nT5aGliHJO6dBZFwTL1N7/p2Mgj3OG6PlBFVFrUVePz7rdhNDgEjk2rC+H+8XK42p/7Hr5aqRcaN1MsV00VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H6eGJ6bgTMs4dueYTr/pgrO7CkfzCm01Myq8KoQ1aBw=;
 b=BY5L6Ez6X4zfCuWQddUDjHB6Nrf/BJeYaU1r9v8n9s3M4Qmaqbi5R2GiJy4T4i7XlXCc5ADhunh0LxHCd5otq4zLhnXyLNRfpPZMY/mcX+6Q4Whi1SWgpeBK3XpWHk6Qi0EMGT1Cz1Fi5YWK4r170NcavU5FQDSCdByE/fKPwRM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS7PR12MB6095.namprd12.prod.outlook.com (2603:10b6:8:9c::19) by
 CH3PR12MB7691.namprd12.prod.outlook.com (2603:10b6:610:151::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Mon, 28 Aug
 2023 19:17:38 +0000
Received: from DS7PR12MB6095.namprd12.prod.outlook.com
 ([fe80::44a:f414:7a0f:9dae]) by DS7PR12MB6095.namprd12.prod.outlook.com
 ([fe80::44a:f414:7a0f:9dae%7]) with mapi id 15.20.6699.034; Mon, 28 Aug 2023
 19:17:38 +0000
Message-ID: <9a9f7b6b-45d6-42bc-9a98-fcfff2d83f3a@amd.com>
Date:   Mon, 28 Aug 2023 14:17:35 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] platform/x86/amd/pmc: Add PMFW command id to support
 S2D force flush
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
        markgross@kernel.org
Cc:     Sanket.Goswami@amd.com, platform-driver-x86@vger.kernel.org
References: <20230828152134.4120496-1-Shyam-sundar.S-k@amd.com>
Content-Language: en-US
From:   Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20230828152134.4120496-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR01CA0028.prod.exchangelabs.com (2603:10b6:805:b6::41)
 To DS7PR12MB6095.namprd12.prod.outlook.com (2603:10b6:8:9c::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB6095:EE_|CH3PR12MB7691:EE_
X-MS-Office365-Filtering-Correlation-Id: efb05234-0112-4e51-2cae-08dba7fb7150
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vOp1HoM2Jsv3PxBiWUrAWsCzo5ZvFxpIXo/KahLRHrQScYoTxv08KQvgQ6I49pyP9mKtjY6/den1/qMiPZDNJ1eCQShghGMIjyQfzvMYQX+9HZuticZ0I/T3ckJIirtpSHUioUHKC0/yZ+HsLuyBA+5zYNyLvpe0IZe3WEFS1+bg4tuHHdJKk957h9mCVO7qxPph6C/snd1t+dWQj/dCegFzd93jj1gflURjOCXwKVJpJ/Fq6Xtnt33oAGn7y1DmXy9q1gFixjly4743xYE/yvrRRkHyfzLVuibzTaQqSC8tO9BXOfQVquGiTjcxI8jXWwE8uxYR7GCyBC0b6xfkmKoy3NNnJC9cNf0+YA7SGmXJ0PLfIjtkZfdvRsfPQzToW3CJEYNuIleN9DsHqB/JJGXVgAU95djYmbcn+ROpoAh6o9znhhuY4bb+U9K1YMB2XAUe6KC4iZpDo50hW6pHy+9WblNO1qLKhB0//QeuMhq2rg+klh1wFFyObMDArLYkP4bPC7gdzAjjwSBvtPNB010IYKxj/Omzr/L6nJ7zOLiT1ykW/W+0qT2C3xuGwHVIQVRdeBaaMe2VzuJ9l5JTb2c+kZ+1hNLIaGgZCk4djnbyXIY6pBb8k+ThExgRwu/y
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB6095.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(376002)(396003)(366004)(346002)(451199024)(186009)(1800799009)(53546011)(5660300002)(316002)(38100700002)(66476007)(41300700001)(66556008)(66946007)(83380400001)(6512007)(478600001)(2906002)(8676002)(4326008)(8936002)(44832011)(31686004)(86362001)(6666004)(6506007)(6486002)(2616005)(36756003)(26005)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SWxFT0grNlo5U2ljeVFSZGZPTUxlbGNnU0dabzBPNndkTmFMekpLR3BhY2xC?=
 =?utf-8?B?allkZW9sU21BSm1VeFUxLy90M24vOUlBaHEvNzNDTFA5S0R4dEdySTZDaFFr?=
 =?utf-8?B?T3BjT0xBTElCYjFPcDA0Z2xNRDMrTWVyQzFJdEhsdDhCbE85cXVYdUh5Yk1X?=
 =?utf-8?B?Q3RRRHd5RWkxRFlHLzg3azdLdVpJdDU2U1oyWnJndGdIejF4RFA4ZGhUbTNJ?=
 =?utf-8?B?RXBOZmZBYXllREpNUGM0SjVoT2x1VTEwNFhEbGNYWWtWM01RSlZ6ZE1xTzRT?=
 =?utf-8?B?cDVZUlYycCttV21UOW01ZFl1bG5YUmx3bnYycTViendqUjIxSDVwSlN4dUFQ?=
 =?utf-8?B?WEZNanNydHZnZGlDUkxnc0hBL2ZtMzhVY0FSWFVsaWxpRU1kaHFpa2VIQnlx?=
 =?utf-8?B?UUpPYkluM3lWNW5oVk55YTlQazBCVG43SVhSd2ZrQkxDME1KaGdtRThYRjI2?=
 =?utf-8?B?VnI0V0cwVlR6aHhoS0ZTV0lLcWNhN3FQTnJhcVZqTnAvajhoNFUySmhteGpP?=
 =?utf-8?B?bjVCKzhyaWJKSS9qL2lkbFVDdFlDU1puOHd0U09pWUpqQVd1SEszVmdGb0Mv?=
 =?utf-8?B?Mk9kWHNFNUJZakNDNVZBSVZhWVpBR3FlM1cyVEVzNk1rcFB3aU9TalM5a3VZ?=
 =?utf-8?B?TUFBWnZDOVJTUEdUckNVZ2RRRWs4UVJ6TllvTzM0a1VYandxWlQ2L0dHYzUv?=
 =?utf-8?B?S0RWTTcyaWRhNUJTMEZlMjFpT3YrV0ZsTElsZ1ZNYlM5bjRrWWhyRmxiTFlv?=
 =?utf-8?B?RFllRG0zZmVhc2FNK1JNMDhiZ0NiUDJZYitqeFJGdHVHUG5wa3RtRDZsTXk1?=
 =?utf-8?B?bHZHckxhZzlvU3BKL3FJWVgvM1RtZ0NDSHNNSFhBRUQyeWRrNzhDU1R5SVJo?=
 =?utf-8?B?NHlJYmhRTXEzaEg0WVNJZVkxV0ZaNkpCZUFxaWpSYWMyU0Y5YWZrY0ZhQUd1?=
 =?utf-8?B?WGtlNEhtTmdHdks5RGVmb1Y5U0RNYlc0NlppbnNNWitmcXdmNkl4U3pNSzVq?=
 =?utf-8?B?ZUVHSDhRVGZSSTZGdVUrWUFYSG1RaWVYMzgzMmdYMTZQYzI5NWJPc3N2ZUdI?=
 =?utf-8?B?WmpJZlIyUlNCdThkOURWT2IyVHM3eUovWXp1NW5OVmJyamo3T1ZDbGp1WGY0?=
 =?utf-8?B?MU90TWF1ajJUY2dwYy9NYWJuUmxDMCt5L0xsTW5HMUI2ZDFBQUhzRkltL2c1?=
 =?utf-8?B?QlpnVDZYMnNoSGRObmdSTXlXdWtyUjRyOWVmUzZNdjcxWHNrbHk2RDJOMjJk?=
 =?utf-8?B?bkxXWmZJRUVjQlNIYmIzdGxCWEtuZmNjTEdvRm9DMFYxRFpER3NzNTh0VFhs?=
 =?utf-8?B?UlJYelJyL1UvSmZaTDVYaHk5dTdSVGJHeWlpcU92MGJaZVpnNzN3V0IwUXN0?=
 =?utf-8?B?ZTdmcTl3MkpFRGRnRUxycHJtYmFWYVlBak1pZGRDSytWT055K2QxQjVRV2Zl?=
 =?utf-8?B?NHpRQkJ3cGtFbVpiK2JPSG1Bb1RNdWM0YnVPZ3Fuc0RIL1h3aXdTM25wLzl6?=
 =?utf-8?B?WS9RYmpBVUYvY3FVQW1GWW5hY3Nuc0EvazltNmt4NjBCZGREQnQxczNqZnFR?=
 =?utf-8?B?N3I5Yno4dDNUZVNha1RSRWxmT3dCemM3bjJiMmdBLy9Xd3B4VTlRNGZnNGN4?=
 =?utf-8?B?SHJPMTNWNC9OditoS3NaV1FSb0dWWnI1QkxuWWxIVmM4aHJCdEFUUEdLcC9N?=
 =?utf-8?B?QmU3V0c2WG1EQ2NKaFcwY0tvalM0a25Cbkh4L1RLY0J6LzRGdGV1Mkg0OW4v?=
 =?utf-8?B?V1pUZmVBa2xBUDA1Rm1xWllPbnkxVFNsUEFqL1lmd1ZjaFRkZ0NCOFFxRjQx?=
 =?utf-8?B?WklqRDJUaUUwNGo4UXZvMDhYTnpzUm9UUTBqbTErUWFiQkgwaGFmNHZmQjJE?=
 =?utf-8?B?TWNpM0J3Nld5K3F2VlN3T3Zya3h5VWY4QjJDR1U4S0RCMEt1dk1IK2Q5SHpY?=
 =?utf-8?B?bVRNOFd3bUlDZVVzN2UxbTJtQjRvSDBGV3dISkI2MVlmUnVWVkxKVmtQcVJs?=
 =?utf-8?B?VU5LTEhUdUlKMVFjazA2bUhtam9qWjROV3Rjano5c202c2s1OXNneTlmRzlt?=
 =?utf-8?B?MEdKNnZiajdoQ3J1Y1ZWa3pPSFhyangrSkxKeW5pU255RlZETVJKN2V1K04v?=
 =?utf-8?Q?z+2y/GKiQMS1VSs4+ZlY/hPjJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efb05234-0112-4e51-2cae-08dba7fb7150
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB6095.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2023 19:17:38.4584
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HsMSn1bHjmIamfsUQn478wDt0cl+8hZ9uMs3N/b8We8yQb3izq8MZHrFNcxLGk1KiafKCjvW9q3Et9Qme1YTIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7691
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 8/28/2023 10:21, Shyam Sundar S K wrote:
> Recent PMFW have the capability that can force flush the FIFO
> contents to DRAM on sending a command id via the mailbox. Add this support
> to the driver.
> 
> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
> v1->v2:
>   - rebase to 'review-hans' branch
>   - drop 2/4 of v1
>     (https://patchwork.kernel.org/project/platform-driver-x86/list/?series=775324&state=%2A&archive=both)
> 
>   drivers/platform/x86/amd/pmc/pmc.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
> index c1e788b67a74..c92dd5077a16 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.c
> +++ b/drivers/platform/x86/amd/pmc/pmc.c
> @@ -55,6 +55,9 @@
>   #define S2D_TELEMETRY_BYTES_MAX		0x100000
>   #define S2D_TELEMETRY_DRAMBYTES_MAX	0x1000000
>   
> +/* STB Spill to DRAM Message Definition */
> +#define STB_FORCE_FLUSH_DATA		0xCF
> +
>   /* Base address of SMU for mapping physical address to virtual address */
>   #define AMD_PMC_MAPPING_SIZE		0x01000
>   #define AMD_PMC_BASE_ADDR_OFFSET	0x10000
> @@ -236,7 +239,7 @@ static const struct file_operations amd_pmc_stb_debugfs_fops = {
>   static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
>   {
>   	struct amd_pmc_dev *dev = filp->f_inode->i_private;
> -	u32 *buf, fsize, num_samples, stb_rdptr_offset = 0;
> +	u32 *buf, fsize, num_samples, val, stb_rdptr_offset = 0;
>   	int ret;
>   
>   	/* Write dummy postcode while reading the STB buffer */
> @@ -251,6 +254,10 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
>   	/* Spill to DRAM num_samples uses separate SMU message port */
>   	dev->msg_port = 1;
>   
> +	ret = amd_pmc_send_cmd(dev, 0, &val, STB_FORCE_FLUSH_DATA, 1);
> +	if (ret)
> +		dev_warn_once(dev->dev, "S2D force flush not supported\n");
> +

As this is only supported by some PMFW versions, isn't this message 
going to be pretty noisy if it's used on something older?

As it's not critical I think it can go down to dbg, and you should also 
add ": %d, ret)" so that we can confirm what error code if something 
ever goes wrong with this in the future.

>   	/* Get the num_samples to calculate the last push location */
>   	ret = amd_pmc_send_cmd(dev, S2D_NUM_SAMPLES, &num_samples, dev->s2d_msg_id, true);
>   	/* Clear msg_port for other SMU operation */

