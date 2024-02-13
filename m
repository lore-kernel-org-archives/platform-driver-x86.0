Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2085.outbound.protection.outlook.com [40.107.93.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74C26024F
	for <platform-driver-x86@vger.kernel.org>; Tue, 13 Feb 2024 14:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707836373; cv=fail; b=b76CgG7xkbHHzncjm9Mi1XWrFzmayfQFiSiICcjIKpL3RLr2cBl63lswgs88PQ09+GzMa6RUWtZUnreusn3kUWISMdWODFERj3CWCXMDFHObvXblOfU3c0q6U/Ht1u5d2odQlxmGPelJjBsi7PpX3DYXawkdSob4W3AN1Llve18=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707836373; c=relaxed/simple;
	bh=OvI75mIGMINa8cVV1dImd8uvbB2BLMqfxI1MHR4yyds=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Lbs3+itcM6c9HBwEZl+3nmyCMoKN0we99CPOn6ntVKa/PHj7W0QLlQ3jk9Q3Y/k5eknbBcWN/i4pxxSH7duTZdeIfNxAsYjzo9Rvm7uruvqOB1enOv7zKh9sPOzvfM1NLXT2b6Y8gdQ+iwKPk59y7cRwEw0OhPCcY4/oEEsiQrI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=0BSTFrFd; arc=fail smtp.client-ip=40.107.93.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="0BSTFrFd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ArFRnLaHzPhtca9uyJUMQxp0JS7lThMuFHUVcejTmkFXzCXwXb2eknXnH0RZn+6PeDSUvqUzDQyEM5qJHPMEXy76HmAcXxV5RV37nnJE1UraDaX3ogaiIMBg+oNg0lIE3DOJGx0BHyH7HBrtx8TmH160P5TMsx2rMdUVQD9ljxsMmQ1lYCZLGVAiMnui5XICuLCe/iyx6u7tvIYCiwzLbuXV7k6NNLelrXqu8tckpMLpTLL4tHJSessptwNkZbms17nGFD5Wt5Pac2WXl7M0A8oi2NzEQlJe7r6EhZkJRnA6oTfqHnZUEtLXJ7R9uMrh5arhRCHWq0gdn79207DHcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cAcb/7c7MRMEzoextHVcWzubk4noXWfPFViD7hSF7EI=;
 b=hzHQn62WjtNPELxQUl9FvRdkxf55BALp8duIGU/cxkXZPYsIwCAju8F2mfEaqOGv0/gC8jGrHPbEQ5oDpTrA4o7xMXhJy5zeJ31AbU4/cO37xCYw21bKSdxQXyVoKqo8YotQlMUY/kqTlLm+MRAABWeNkqadPpAONaja1Bt2oh1YlIzoUo2ulFA+n6AZn1G8Dz9h9o9hD7md2BeFfUNXzaCP3yGpNF3B2E4gCd8hMc6LHGxVXCaKnJjdUGaBv5XSA9Cf6vC5Dj2m2nmG7ps4zetJrqNy6bVmFqleyBBA+GuycZnVe+fPLjQIZKObW2UDhH9pRzktqXgLi2oRbGUrUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cAcb/7c7MRMEzoextHVcWzubk4noXWfPFViD7hSF7EI=;
 b=0BSTFrFdjSwnmp+KumwOboJVcL8nWJp8yzAbFkuDmixgWqkq25gd7eqpTUab3NZoTS5b2C1FmzEr9xku08DKOxouTJRyGkbTR+3b0kRZ9JWtvNIj9O4ogNvr+HIEzlLdAil3ECjjDu6EpZ+91/2vFwjtHlGosWZEpk6JFRToG3c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by LV3PR12MB9144.namprd12.prod.outlook.com (2603:10b6:408:19d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.25; Tue, 13 Feb
 2024 14:59:27 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dd00:9ab5:4d11:2d1a]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dd00:9ab5:4d11:2d1a%7]) with mapi id 15.20.7292.019; Tue, 13 Feb 2024
 14:59:27 +0000
Message-ID: <87f6c9a7-ec3a-410f-bc2b-04b6c63c01b4@amd.com>
Date: Tue, 13 Feb 2024 08:59:26 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] platform/x86/amd/pmf: remove smart_pc_status enum
Content-Language: en-US
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20240213073651.404220-1-Shyam-sundar.S-k@amd.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20240213073651.404220-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0054.namprd11.prod.outlook.com
 (2603:10b6:806:d0::29) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|LV3PR12MB9144:EE_
X-MS-Office365-Filtering-Correlation-Id: 3dc4ed22-128a-4ec0-cc61-08dc2ca45ff6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jCbp01cI12J4hIem9FT9PArP0Bsj201lS0CVtjwTK4L7Q9FIt5i60QQ+pBNXVn0O2IvmWDD/jBwQsrgy6AXF+o354nfRYZRFN2gg+GfpI8W8xBkXM93Rb6BOzwVKEruz5Dpfd10hNOLdSIbhhKNN0pmGPdSN2PgH/Siz4u9qtjy8NaT1dKZaetcY+9cPDWaGWlhOCMVmT4N30otNaEURmqTlSGzbWbNzTLng58P3b0YLoq5E6GCx91837WZs1cy46Q+PBW8FNb/gI9a3/zKCLlQHXUA6S1Y9mp0hBbhue92ENZ9rrlL9UoWCEmfJknMm1iaRZQ7MDsLR4b06yjfKhaGjNMuPhkgTdyw06lvPhu0kdbTr5w7ZgS5b1GT2eFgouTBkPzuhGhTJs0cxEuQqILsuIGyt3lubPWvEoMysDU+ixHbUSdWWj7vIagBj2B+AsI6NJxpJ/Z+6IdL12223dS4QDFJNfLF5YBJBQDGbF+qPeXwmQZ9V/iu2W2uN8BfaJQvHfn1CGxNkTS2+q/j4LtLpXA6UOE5/tCXcLHF/mB3HMO+nYg52oSRifdRFlVi+
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(366004)(136003)(376002)(39860400002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(2906002)(31686004)(44832011)(2616005)(478600001)(41300700001)(26005)(83380400001)(5660300002)(66946007)(66476007)(8936002)(4326008)(8676002)(53546011)(36756003)(66556008)(6486002)(31696002)(6512007)(6506007)(316002)(38100700002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MHZ2endOMW5WRWFuU3lSNFEwei9PWExTWmpHRTFwMm9Za1BTNjdQaTBsQUlJ?=
 =?utf-8?B?VHJ4OG1LdHRhV0QvQTNQT2svNjBBaUFEaStJQUZJd0xVSG1XWTJHaXdTdWhC?=
 =?utf-8?B?L1lza3ZFeEw4RU5UNjlqandCQnVBNzJiQ05pOE5KYmJJOTJCZFRvaC95UXFM?=
 =?utf-8?B?Rnk4aGNEZ1Bjd1NHUE5KblJ6N3Z6RmY3VEZXSjJFZ0FlUFFUczNKTmxVdnl4?=
 =?utf-8?B?S1ZvZGd4dG5QRWpPQld5NitMQ2VSVytMdXZpUnZ2NjFZbDFzVms2NmdUY1Jn?=
 =?utf-8?B?UFpTZDlHQk9BMFZ3SDV1ZU4vNlNTTmJYMnFJdGp0Ulg1dzBGY3VXNjBKT3FO?=
 =?utf-8?B?RDNTa1d1TC8rVERJU2pMb2pBeTAyQXBhM2c0SXhLZnR5RHZIMmdhWDZlOEJN?=
 =?utf-8?B?T2c3bDRBOGtmVXBWMkNTNEE1UHhZUnE5d2hEcEJnNk1VQVJ3by8wQU51Z2pw?=
 =?utf-8?B?RDdST0RnNElybXp3MjhiSktRUjdxdHVCQkllQmRYSXZoOElxMDlyS0ZkMmV3?=
 =?utf-8?B?NnFOSDVRbXlHM0JBb29YWlBsWk9FWE1kWFpVYnNnMFFlSURFMGpnS2lPeVlu?=
 =?utf-8?B?MGY2c3ZuaGlnUEdGYUE0K1phQ1Ezc3BvUlFocXFadndLRnZRQTdmdFJ6em00?=
 =?utf-8?B?YzhRVC9haFd1ZFV4Q1BnNk45dXFKeUdRamxhMW5odXQ5YWFBdDN2a2R2Ykg3?=
 =?utf-8?B?aStPOHBnODN2SGI3c2YzYUdtbE9nek1QN3N0STB3eFM3dWVUVHNZdTBGblVv?=
 =?utf-8?B?RzlEa21qYUJHTWhJWVBBRUZPeE5iMFJCbFBGLy9TSnpxS0wvcmNyT24zTjdl?=
 =?utf-8?B?NUdmNkVqcnF0MGwzcHFZRGRIUGUvVXZicm1pOVloU1lpdFE2UHZsNVgvZTVh?=
 =?utf-8?B?bml3aUJnV1pCS1RrWlMwVjFVK05XVWhENlN5eDBNbWQ0Z1Zwc3U1TXgrcXdv?=
 =?utf-8?B?N3BhSm5tSGp4WjF4QzRLZExaUUY5UmNuUWFZVFpFV01YYkhZTGRESld3ZG9T?=
 =?utf-8?B?QzA3UE1BRnBGMW16OTJHZm52RThpMTFGNWsvL2lUN2lRa2FFdk81ZUdUTDIy?=
 =?utf-8?B?Z2VzMTdDNnFPQ0lYRGJNRnlqejc2dm1HOWR2RlJIN0cyVzRXM1J2ekx5S1JG?=
 =?utf-8?B?KzVqOEJTQTNzZFdSOStra1hBR2dQWU45WXJXWkZUSTRrTDg3WmdrcVNTV1Fi?=
 =?utf-8?B?MVhGVGdmRGxJd1lXZytvK1BTbFRXZk1HVWpnSUhKS3BvM1RiM2QzdHdQanRI?=
 =?utf-8?B?SW1oQlUzR3BhbFB1NGl1OE1tc2JySnEwSCttWVpGb0kwYnRPdUZ4SnQycEl1?=
 =?utf-8?B?OXl3MnljaHJzMjI2c1kxV3VWaVp0WTJpaHFTZ0FNK3BIU2hhZGRXSkI2czlM?=
 =?utf-8?B?QnF6NUpNV0FzRFdxRVVnMzVHMjBJazRjWEZSeXY0YVhIYm1vQmpLTHF1dy9L?=
 =?utf-8?B?ME8vb0VmRmUwbTNUdzhUSmVaT003VVpETXVXME9RYUVaWkJXaSsxQjA0azVv?=
 =?utf-8?B?dXJiRllPQ0FSS1lVamRvOW1WL1Nuem1CZGRKN08xLzhhMmpHeTBnby9YSnMx?=
 =?utf-8?B?Zy9uOCtTeURBWkdDNlNCcUxjdkErNmdJajVzQkJReHA4alRETmNTL3BmcEFD?=
 =?utf-8?B?dGg1SDVRMUlKQlVDaVJrRGxPR1RHeFdBQjVoaGU2b3ZOUUltQmo4ZlpoL1dt?=
 =?utf-8?B?Ym5nSy9VMlptVFZKeG1oaXM3YnUvclhKZHZUVmRaaklDRVExSEw4cXh6T3p0?=
 =?utf-8?B?eEhycUVIbFlnbklSVTN0ZVlxYlVFQ21yUit4Qy9sREh1WFFJZ2FUZDBxa0dj?=
 =?utf-8?B?eTdwNmtJeTdXaWF2Sm9qSG5xWkg3WVJTSXhUZytva1dicFNMQW50YXJ5NUFV?=
 =?utf-8?B?WEhRRjlFekFqd290Z0M0VVJMWEpTVDlNL1E2UHdtUTJ1UWtMWE53SWpHdGVi?=
 =?utf-8?B?QURnWDgyT1c5aThIV29BUmhURjFDTTc5R3BzTkEvT0ZZd3M2UzZjSFduVkxa?=
 =?utf-8?B?UWlzZjE3NHdZZkQwS2FXVmtHYTAwSGNPZUM5clhzZ0g5dWN4RFRobVgzS3BW?=
 =?utf-8?B?OU9PR2hzaDg2a2g3QXAza0VMU2VCRklPQ1JHa0xkMC9sOURnL3ZCRmxjQUVi?=
 =?utf-8?Q?BJlT0E+yeG8oC47bX5/3G654+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dc4ed22-128a-4ec0-cc61-08dc2ca45ff6
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2024 14:59:27.7177
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rxHUw6sOkHXTyban7G80FaTpNeRenJN/tFVNp2T8TWSoGw9ntcCsHBsKmW7IpcDIl6WdJgrHZzre/+c0EgerWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9144

On 2/13/2024 01:36, Shyam Sundar S K wrote:
> Improve code readability by removing smart_pc_status enum, as the same
> can be done with a simple true/false check; Update the code checks
> accordingly.
> 
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
> v1->v2:
> - remove enum smart_pc_status and adjust the code handling
> 
>   drivers/platform/x86/amd/pmf/core.c   | 2 +-
>   drivers/platform/x86/amd/pmf/pmf.h    | 5 -----
>   drivers/platform/x86/amd/pmf/tee-if.c | 4 ++--
>   3 files changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> index feaa09f5b35a..ff0d61a56484 100644
> --- a/drivers/platform/x86/amd/pmf/core.c
> +++ b/drivers/platform/x86/amd/pmf/core.c
> @@ -351,7 +351,7 @@ static void amd_pmf_deinit_features(struct amd_pmf_dev *dev)
>   		amd_pmf_deinit_sps(dev);
>   	}
>   
> -	if (!dev->smart_pc_enabled) {
> +	if (dev->smart_pc_enabled) {
>   		amd_pmf_deinit_smart_pc(dev);
>   	} else if (is_apmf_func_supported(dev, APMF_FUNC_AUTO_MODE)) {
>   		amd_pmf_deinit_auto_mode(dev);
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index 16999c5b334f..66cae1cca73c 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -441,11 +441,6 @@ struct apmf_dyn_slider_output {
>   	struct apmf_cnqf_power_set ps[APMF_CNQF_MAX];
>   } __packed;
>   
> -enum smart_pc_status {
> -	PMF_SMART_PC_ENABLED,
> -	PMF_SMART_PC_DISABLED,
> -};
> -
>   /* Smart PC - TA internals */
>   enum system_state {
>   	SYSTEM_STATE_S0i3,
> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
> index f8c0177afb0d..8b7e3f87702e 100644
> --- a/drivers/platform/x86/amd/pmf/tee-if.c
> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
> @@ -260,7 +260,7 @@ static int amd_pmf_start_policy_engine(struct amd_pmf_dev *dev)
>   	res = amd_pmf_invoke_cmd_init(dev);
>   	if (res == TA_PMF_TYPE_SUCCESS) {
>   		/* Now its safe to announce that smart pc is enabled */
> -		dev->smart_pc_enabled = PMF_SMART_PC_ENABLED;
> +		dev->smart_pc_enabled = true;
>   		/*
>   		 * Start collecting the data from TA FW after a small delay
>   		 * or else, we might end up getting stale values.
> @@ -268,7 +268,7 @@ static int amd_pmf_start_policy_engine(struct amd_pmf_dev *dev)
>   		schedule_delayed_work(&dev->pb_work, msecs_to_jiffies(pb_actions_ms * 3));
>   	} else {
>   		dev_err(dev->dev, "ta invoke cmd init failed err: %x\n", res);
> -		dev->smart_pc_enabled = PMF_SMART_PC_DISABLED;
> +		dev->smart_pc_enabled = false;
>   		return res;
>   	}
>   

