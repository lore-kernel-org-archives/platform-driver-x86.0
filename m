Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2077.outbound.protection.outlook.com [40.107.92.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA2F12E44
	for <platform-driver-x86@vger.kernel.org>; Wed, 14 Feb 2024 09:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707902908; cv=fail; b=Z78m3yc9yAVQGF1FJxePRORGXzS+Xpw9P9QLEMJ6UEzlbxC4mN7xOoa7CCVT6N0Qr8CjHhSzQXMh3qkDGA/15sqmVgT8QyK2y9HPPoJPqzg2fOs7e4y/A9PNSaaOQrPLUnfX3KUkSRhY23MWN5nkpIefifrTv81lJTk0dXL3XeM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707902908; c=relaxed/simple;
	bh=Y2+XgcEbM/Z4LZzKcYKJAJ1KQeJe1SiQZGn+rw7QtA4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pCmeyWZUnkHXlBsqrnxxG/vudGOvQnmMTWIVy8kacvrZM+5fnPTjF2G4J1+vFUq7i00Sz4d+elL/DIAJvGxutcGi0ZLvaHGdm8NKs7AMYhUU7yZnyzZUbEnh7jPyXokN3cMx6ZbOmA8oXGpcC7hgGpw7BJJG2D0nu7eLcMHRJYE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=jR8t+pX9; arc=fail smtp.client-ip=40.107.92.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="jR8t+pX9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WHCMVz2uV1zOeO7rwWiAK0HEDezEJU93BztpKC6HSj2y/7zvJC03Uqx7ItsOvU0MtE7I6ciW8ylq2WEGqwVrhmVkLhCDCvs8E6smiFChskzh+8ovhBnmfxyMB7RBwYZUX480X3N1h1YS+/kH1sv166Hb+jdjIJseDZ7wMUOIVrzYblYQ5rjDBbsBQuQf9RROfWSlezEwjEOxNFeQxQvYLoZOpTH4dluXN6qfKEtXfBZn2MhhnYrIiZHm582WChQy5JtnldzoH5Js+x5yufV271pcUwYvOZLaoOB8A+ytGyJ7NoL3h/VnIFyB30dUNGoKdLxW0TT7SBBy7C9OioTVeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=abDyrMlizmvgtxtq0eXKCWVWVvR8nQ01bJksnrPQPV8=;
 b=Z6eU+WY8eWuR3w8SwtIss7np+Eh1iMnV8EbHaEXeviCZxgzQ9jGnQq8U4VlF8ZAY5QE8qWwS41jreQjNcDMZaEfg1OJsby6u5pUrT07FstmZ+aVojA7NYp9+JD5ficEvIbGuAnxTnlG7MqVaqGV0zryXelB2f/zWz5Wv8Yorihbm6SEh7W1olGJH4ZcVfC4vIS4XEflwZwFQFsOAGLqnD55pNVX+JnRuEuLVplFVAPEZIvdFTuoMZ1rJtanC0WiEQvqfkKaBO+5wIhOAtrLC7vM8Yzzj9/zQoUKNwNFY6CC/ZwK/RwkFFeeaq5FHjWKOdIsPoIITkGtZdmhLKEFfyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=abDyrMlizmvgtxtq0eXKCWVWVvR8nQ01bJksnrPQPV8=;
 b=jR8t+pX9E4TSA+PBPh1ve1Besut5+pzrzYPocZTmJfRhc1LxbpD3lL4efM24E7nmsBhWUt4Lb5meaSsTREhXeUoKEkwpHGA93SOYPxY6bkM7F0n2fypll3ZppHeVhs7FdQ+glIC8S0bAg7f0/h1723WNZG1TqqdukoCrVdi7a7U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by MN2PR12MB4504.namprd12.prod.outlook.com (2603:10b6:208:24f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.26; Wed, 14 Feb
 2024 09:28:19 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::c17f:8a14:844e:2500]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::c17f:8a14:844e:2500%5]) with mapi id 15.20.7292.022; Wed, 14 Feb 2024
 09:28:19 +0000
Message-ID: <a51c26ae-ceaa-4492-a3f0-e15b83dacd3d@amd.com>
Date: Wed, 14 Feb 2024 14:58:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] platform/x86/amd/pmf: remove smart_pc_status enum
To: hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com,
 mario.limonciello@amd.com
References: <20240213073651.404220-1-Shyam-sundar.S-k@amd.com>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <20240213073651.404220-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0215.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:ea::8) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|MN2PR12MB4504:EE_
X-MS-Office365-Filtering-Correlation-Id: a4c27e92-77c5-4d2a-39d1-08dc2d3f478e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	czNKy9HaE5R/yf9j9Fd9IaQVxn2fh9gA3+8QxD1mPeAZoZa8zhbjiKPMaQVthx3zpmm2dEPloBSSAVj3CJH2aV2Zxy6NVsJDxlsZUe5Uub5CkH1gG78n0+YYq9YGNxtaLB2ggvTxCzIDudciE7xTyUR0SPI9KP/u50HqDNlvJ7BY2O4Quq1EJq7UUZ2WEvBNtcvciyaUpAQOshiA+y18eCGr9xuOGjk0tGyNtzBNmV+RavNET/IrVSPclpyVDq7seSPbbW48XoYVxjptboC1X5kTieJYZGU8Rfu0y+7xBZvJkhIFsDMJQZm6vHOTFkjE/nOi/XWfooygPu9/uQfCPLN4fQp5nOahjwvNahZwLoA23bxfNItHLqGFHG5pB6VvKLfRgZmaJWTY1E42QiGeBeztNfKCu7zscXW32FrmVwalYBeaJeFedS/iP0NJa0E143QEFrubkI757wVnc9R+fhqHgomX7bPAE4PxhJ4OXnzTMUfBNRwdo5DoQcyZ+T8bcVAQTk8WOwxuYAsR0iKTNZrow+KK7uB3oeKWUdrZU/59VHJvw6G2jXCGmIxk5kOI
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(39860400002)(396003)(366004)(136003)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(5660300002)(8936002)(8676002)(4326008)(66946007)(66556008)(66476007)(2906002)(83380400001)(26005)(36756003)(38100700002)(31696002)(86362001)(6666004)(316002)(2616005)(41300700001)(6512007)(6506007)(6486002)(53546011)(478600001)(31686004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SmNxVkZFNjVHa0FlNmY3bjRDYmsyTzBueDFLcHF0U2lSRm96T2hSUU9RVTky?=
 =?utf-8?B?eG1oYnRMN3FWc3BEUWlIeFQwZTYrZkhSVG1oOHJFSHNyUXR3c0s2bUNrZEY3?=
 =?utf-8?B?cWhMT2hSNXhFdURUNU52Q215VXFQOFp1K2k1VHNSZXVSV2dQVGNxZnJMVk9i?=
 =?utf-8?B?bHdPSGpiTnRzcFBNUXpQOUxGUzVFbTVtSnkzakRoeFFYdTNFUDdpa3RJdU83?=
 =?utf-8?B?TFdMT0VpMHoxQVJmMkR5QUYzQzZ4WlpoUk9ablpPaVoxWXNCNzFudWdzdGhr?=
 =?utf-8?B?TUpEeHQ3VEQrUFZPU0dMRThNeUVjYXJYNzdiT0lpaENtSGwzem5zWGY3M0hR?=
 =?utf-8?B?WGN2eXhibStRb2VjM3VSeUlrWEFsVGNHOUdZcVppcG0wODkwSlNDbktKdVNS?=
 =?utf-8?B?K0xHa21ibDk4QVV3RS9jOWc5bFBsWHZKQ0NQZzZ2VDNrMzY4Z2Q2aVlGTVdN?=
 =?utf-8?B?THVNdk12TjZHMnJCaU1JT1dPSGl5Rmlnb2RpeW0zNVpnNWIxMnVzTkh6ZzNQ?=
 =?utf-8?B?YU9QdVgvVzVUWFg5QjhwNWNxL25PdERuTWFvdUIyQ3IyM2htTDgyQ1IyTzE2?=
 =?utf-8?B?eVhtQldmS2pWeHcwMEs2MC9kTkV1U0FoMGY3MGdGM0lJYkV5OE5mZ1NLZ2Rt?=
 =?utf-8?B?cTJ2TTI5OGlqTGlUZVNLd1Q2bG05anhscjdNcEwxZG9qVjlVSGFIRFV3YmxY?=
 =?utf-8?B?ZmhtVTQyUGFXdUxWYlBHTVdlZlRYTWxNU3prZEVXMXROS2liZzNsNHFuK3kv?=
 =?utf-8?B?YzAyZHFiSVNKVDFRYlpLZ00wUjRmT2ZXbWw3OWRCNzFEUGJjWVNKMWFEUDVS?=
 =?utf-8?B?ZzVyVXJVY2FuMVlyM2N6YkFYbmlHRHl3NTZYMVNWVks3N0ZnMDdiVzAxazh3?=
 =?utf-8?B?VnFJZzFNVHh0TmRyMHRwbWwwV2hma1hRMHJORTQydmt3SDR2d0dqR1VXOWc4?=
 =?utf-8?B?WGN0djZsSW8wRE9vWVNNaEFJUlM0WGpOaHZlZ2pLeGpRTG5Xb01qNDF2MXdz?=
 =?utf-8?B?Wm8rSDI0OHA1bWExcXdBOHFPV0xMdmgyQ0JldlllcEQyVW0yVHVPcnVwaURs?=
 =?utf-8?B?RnpJRkZhWHNTa0htQzl1KzYyMU5BRzZETmxHZWRZZXM2WnZDQ3I5MHByUXVp?=
 =?utf-8?B?QmJTcUNEZDgzYktwL0xQVkltblkva3NMWExKRUNReFlIdjRKOXh4QmVIT3VB?=
 =?utf-8?B?b2pxSHhvV2I2bEdKUlVSRk9BTk1TTXFaZ0JEeStrWXdFQUUwc2dOcytZd0Vy?=
 =?utf-8?B?YytJSWc0UERmSWNUVHlVbGp2b2pyZEVHSFErSEk1ZjNCakNzV1YyMHFlc1dp?=
 =?utf-8?B?cUxMdWVJTW40eWVhNXNzZk9HaHpxVVBkVDg4N1JLeVlua000dHBUMExHbVNm?=
 =?utf-8?B?Vm9VOFN1aldSMmFRWEFPZ0gvS2RDbkcyTzVLTmFSS3RsTTFDTXUvb0Y0TFR6?=
 =?utf-8?B?TGdmWVpBa0VJR01sOGdaWEpkOXR1YzdZdmpIbkE4R3J0VjBsTW1EWU54SXEr?=
 =?utf-8?B?YVd1T1hsQitvT1VDbThvSDlkNjR3UU1Pb2hrUkt2S3ljYWdnRU9ENnBLeEhq?=
 =?utf-8?B?V1B1Ymc2azgxZGZxTmREdjV3ZHhwbW5pT1laSWtmank3UThHRk4zM3E2OEg1?=
 =?utf-8?B?WTJmejF3SG04alZMQ3pHdWpsNnlFa0pTQkRwZmlQYlVtd1FOcC9lbHE5QWhB?=
 =?utf-8?B?Rk9meWpLUkhOZHBwd01lR2kzbHlTdEQvUHlJcUd0TlkzMGRsalZVUlRySVls?=
 =?utf-8?B?M2JpbEJYdnJmV3FWaXpmaExKSVdaYldRMURoVU91TGxYWmlIYzdKUVJtam9o?=
 =?utf-8?B?bW5RWUlxWmxaSVNGcVhZQWo0WldsRUdVQVlkQ0xtaHN6T0w0NW5UUUJXYjVT?=
 =?utf-8?B?aVpacHlSMUQ1YVVEWUZ2TnBlNXA3eENIQkEzeWtvKzFqRTczdS9XZmpKZEpW?=
 =?utf-8?B?ZDVDMzVKeDM4TTF0d2pmV0hseW80TEUwU3Zzd2VyTTlocUdQQWY1QmcwUDAx?=
 =?utf-8?B?TktNYkMxaG9VT3U5aVBzZmlaZzd6OE0wNW1WQ0g1aUdiak8wZ3BwTDExUlpV?=
 =?utf-8?B?ZzZPQWc3d1ZieUk3MFdXWTZncUpOTmJRZUxPNWtkSVRJeGUrdy9PTS9Ld25T?=
 =?utf-8?Q?KiyD6m4VMi7AeFE86Gz8pLm7j?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4c27e92-77c5-4d2a-39d1-08dc2d3f478e
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2024 09:28:18.9857
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 14L3R5pZ3xgbzbLKHgTtDsMQDUymeaJsCkcNR1FqzX+QYwsIzG/l8hE/YdALrOYmu9VrbAnrbBlTsfaYQ/7sBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4504

Hi Hans,

On 2/13/2024 13:06, Shyam Sundar S K wrote:
> Improve code readability by removing smart_pc_status enum, as the same
> can be done with a simple true/false check; Update the code checks
> accordingly.
> 
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
> v1->v2:
> - remove enum smart_pc_status and adjust the code handling

Please drop this patch for your review list. I tested this on a wrong
environment and seems like some more code handling is required before
we remove the enum.

I will send out a new version soon.

Thanks,
Shyam

> 
>  drivers/platform/x86/amd/pmf/core.c   | 2 +-
>  drivers/platform/x86/amd/pmf/pmf.h    | 5 -----
>  drivers/platform/x86/amd/pmf/tee-if.c | 4 ++--
>  3 files changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> index feaa09f5b35a..ff0d61a56484 100644
> --- a/drivers/platform/x86/amd/pmf/core.c
> +++ b/drivers/platform/x86/amd/pmf/core.c
> @@ -351,7 +351,7 @@ static void amd_pmf_deinit_features(struct amd_pmf_dev *dev)
>  		amd_pmf_deinit_sps(dev);
>  	}
>  
> -	if (!dev->smart_pc_enabled) {
> +	if (dev->smart_pc_enabled) {
>  		amd_pmf_deinit_smart_pc(dev);
>  	} else if (is_apmf_func_supported(dev, APMF_FUNC_AUTO_MODE)) {
>  		amd_pmf_deinit_auto_mode(dev);
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index 16999c5b334f..66cae1cca73c 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -441,11 +441,6 @@ struct apmf_dyn_slider_output {
>  	struct apmf_cnqf_power_set ps[APMF_CNQF_MAX];
>  } __packed;
>  
> -enum smart_pc_status {
> -	PMF_SMART_PC_ENABLED,
> -	PMF_SMART_PC_DISABLED,
> -};
> -
>  /* Smart PC - TA internals */
>  enum system_state {
>  	SYSTEM_STATE_S0i3,
> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
> index f8c0177afb0d..8b7e3f87702e 100644
> --- a/drivers/platform/x86/amd/pmf/tee-if.c
> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
> @@ -260,7 +260,7 @@ static int amd_pmf_start_policy_engine(struct amd_pmf_dev *dev)
>  	res = amd_pmf_invoke_cmd_init(dev);
>  	if (res == TA_PMF_TYPE_SUCCESS) {
>  		/* Now its safe to announce that smart pc is enabled */
> -		dev->smart_pc_enabled = PMF_SMART_PC_ENABLED;
> +		dev->smart_pc_enabled = true;
>  		/*
>  		 * Start collecting the data from TA FW after a small delay
>  		 * or else, we might end up getting stale values.
> @@ -268,7 +268,7 @@ static int amd_pmf_start_policy_engine(struct amd_pmf_dev *dev)
>  		schedule_delayed_work(&dev->pb_work, msecs_to_jiffies(pb_actions_ms * 3));
>  	} else {
>  		dev_err(dev->dev, "ta invoke cmd init failed err: %x\n", res);
> -		dev->smart_pc_enabled = PMF_SMART_PC_DISABLED;
> +		dev->smart_pc_enabled = false;
>  		return res;
>  	}
>  
