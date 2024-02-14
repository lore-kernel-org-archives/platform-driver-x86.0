Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2047.outbound.protection.outlook.com [40.107.237.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E0952F94
	for <platform-driver-x86@vger.kernel.org>; Wed, 14 Feb 2024 12:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707914899; cv=fail; b=imjJP/2LWa02/yY5ILHZEf04YeAGdC6p8nqgICJagykwjXmFdFQ+LGPQ2IkNbVTx+jTVrUo4+w7L5zh9esaoIv5wva6FD2HoaWORzsObF+Qc0MF5XCjXB9ueDeikeYzfJRIYJjk242WholIOLyFOFqCxfpnnYEL+cAdXB3jWGlI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707914899; c=relaxed/simple;
	bh=O5fP3S33QaM9Z8cEjuQ6pI91bTDEfw/pS+/hgXkNJQ4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=lhSbjPsPgMqr0A7clMwhD5N/9F3SUUn2vMvWzwVESfpmcJxyDbuhGtcm6uaKH889dl4f9vVw7PBI2SUy1ML8eQlS3Xu3Ro4SCGFNjNHmbdx5uNPNEvGioJlunxrTeuEzKq5hQiIyGNhpTBq/FFzpUTACAsSfekuxcIxLYeKz7yo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=kfjRmv5S; arc=fail smtp.client-ip=40.107.237.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="kfjRmv5S"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NIxnr1pqo7Aefxfe5UHyQ2Ssrss8eqAnDYQwyp7WJyaX128Ec/xjlA0yIHcrEXT0Gh+44ecPygk+28wpNni3XgW4esv6KbbHzw6zmzkyYt3RNtS3U3tAsUcjK2m+FhdWPG9NBB50BmVPk2VRGMlYpvTNonDz2mrVOTXF5V7aBmReNNfCb4wpmo1eXjCOOdDh9pshM42/+MfzSZpoJ6uxC7FhNrkIndqKaYyCMkMOvNV706/XcHQwzluJYbJRBQmR9WhDz9RPTPk8LTla510OVe48CUtdiU/CwhpCMFWo9FcLPUA+Aeb9gyV/dSCcLh2jY6q199+LZ+5tQf++3qRq5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sGQ/+ruUvSJb96GSOTI5hJoAwlDkI424esgm/6Nwchg=;
 b=U9jMcvnBzp2wGp6x+AR/pLNQk9v0kaDJyYI9Vv1Ofp5XZeMmAq7rDFXb7xfFUVkrfBjO0c6Jesu+m4s70MYxCfojtM1qRT2Fi5+/KNKiFoFLWhxI4caczR4DRD6GpQot9YKrCPrzkPIJJC2+HjRylBfImpEDwKj08g3OmkWSN1wmQ+XOcFDnV98CMUJ/UvpOWRDoDn1C3k/wP+AEVz49xkLnJHgPVGZ7gPMGUtgmssy8FjvmW+h99WD4S5J3KdshklgAEZhfUNPKl3b4P+2Nj8P3W+St2CDcuunLomZuK8k/BWdMyAL/lVI5n7MiK1yFJ/BvEv8Qpovpxwo7//H3dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sGQ/+ruUvSJb96GSOTI5hJoAwlDkI424esgm/6Nwchg=;
 b=kfjRmv5SY2EdKD1dO8n8c1EJp2OZGZxQYD1ghFcmyhBtjSscrq1RmCQwABSmeoqM08ugQZVNoK5jcU4wVCrKb6uOd9EHkvfnoCtSRWIy6FTKs9wONh2R/74D5JkJsfmDlHzIx0UXvSRev5NbSTgcRJl17AuyZ9H3xt++wmtzc2U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by DM4PR12MB6640.namprd12.prod.outlook.com (2603:10b6:8:8f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.25; Wed, 14 Feb
 2024 12:48:12 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::c17f:8a14:844e:2500]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::c17f:8a14:844e:2500%5]) with mapi id 15.20.7292.022; Wed, 14 Feb 2024
 12:48:12 +0000
Message-ID: <5fbf2de3-80a7-4831-9d34-a5f99aaac038@amd.com>
Date: Wed, 14 Feb 2024 18:18:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] platform/x86/amd/pmf: remove smart_pc_status enum
Content-Language: en-US
To: Hans de Goede <hdegoede@redhat.com>, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com,
 mario.limonciello@amd.com
References: <20240213073651.404220-1-Shyam-sundar.S-k@amd.com>
 <a51c26ae-ceaa-4492-a3f0-e15b83dacd3d@amd.com>
 <dfc7aeec-e858-4eab-b84a-f6d9513b2e97@redhat.com>
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <dfc7aeec-e858-4eab-b84a-f6d9513b2e97@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0187.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:be::10) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|DM4PR12MB6640:EE_
X-MS-Office365-Filtering-Correlation-Id: b0b9a9a5-2874-45b6-81a6-08dc2d5b3402
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ciOM939k87TL9IARcSNC0LxcWrIyYFi+o27crNMoWfn9HspsE+a78ss//C1a/X5nQZCAtwaa4syvO9VZ1hI8wF2u5bM6JETQzlYik7Yg1jX2h9YTsoGGOC7Cfq4nyZoxaCjg572nhmmKx70YOZtLhJdiTUlLWFqOl8v1wy9gmLdzwcH5pMHGgP+zs0CNJZOuDLZg5wlPR9zbNvt/fRTQJalKkPR0uGn/rgTMu5FoaNO75HdIiKWQnCmzV4d28+c5BRmvji+Vkc+zqAYaaF8o93jhXdNeeCPOTNgph281DBKAX158Kn0tBdpYVtmi55ssoHJJ04OcfaMFulBvw1URNW2apwFqZg9y26GlyujxV8BX0JVtSKRxoWO92FTdIKNfPRBHa4Kowm401pOOWg2ff4CEWAnR7aIbvKIiPLxOKEyF4I4zG65dmxEa890bMk9vwH8NiiEL6YpCGAEi8e7i750EcOPISEVOf0yOJYgUZurHxlBMY2PP9I6TCOyvJjSJciEE2jHHaht6i2IE1DL7TlHz6oiw5qu1Kc+iavBQZQ6p6yESoZWTDRaKQHVLK0tV
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(136003)(376002)(346002)(366004)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(478600001)(6486002)(36756003)(6666004)(6512007)(26005)(2616005)(2906002)(38100700002)(66476007)(66946007)(66556008)(4326008)(5660300002)(316002)(8676002)(8936002)(86362001)(31696002)(83380400001)(53546011)(6506007)(41300700001)(31686004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eFlKZVMzMXo5Nm5LQkdka1lFbVoyVS84R0NRRkdYQWpqTUloYmZsZXpSU2ZS?=
 =?utf-8?B?eGNuLzJiT0J0bXR0SjNEQ1MrZUlrVzVmQ3dWazBINmlQL3lCNUFWWkpBc0JU?=
 =?utf-8?B?SnZDUUtkMWsrOEYyVTNJbFhJU29oZGp3WVd2enVBYkxNcWhERUhMclNtZk9w?=
 =?utf-8?B?djEvc0hVUlJReUx1WWgxWEErdTRML2tTTUF2eXhKN2E1TlBqN1dJY1VVY0RD?=
 =?utf-8?B?UGpwWHRBMDlvK09SYXFhS1NkeWdXS2JFQ0MvemliaDlzaXlmOGFTckk0Wksy?=
 =?utf-8?B?enV4d2ViOU9rQXZDeThSTWtuRUpoWmtpLy9WcnZyc3VRRFhQdmtjRDNaTWtG?=
 =?utf-8?B?dmJYcUxEOHBJMXFhdGtHVXl0U3ZpREtRL2Q3RW5IdFkwM25vZjR3dm90WWJj?=
 =?utf-8?B?dnF2akNYOStZQ3J6ZTR4b3ZlUWkvSEVUbkRsd29weE5RRXFOazRIdVVWSCtB?=
 =?utf-8?B?K2JBSjhzK1lKN2xDSHQ5anVTQ1VqUjkrZFo4Zm05c3FQbUhNcDg2TTQ5ekM4?=
 =?utf-8?B?MmVGTUtPNFdaLytsbmlqbGVnVmFPbHpYaHVuZDNsQS9PUWxTZCtLZk9KNjMx?=
 =?utf-8?B?RjV2alNFQVNJQ2dVOFUrVGt4SjA3aGQxMzQraEFVQTlzWEd6WVJpbzE2aFRi?=
 =?utf-8?B?OXZzQVFNVTJjbUlkM0Z3WFVBS3ZmcWhjTVdKLzJhN1JEdGtMTUZTN1l4SFQz?=
 =?utf-8?B?cHpidm5PTTRXMDQ2dG5yOEY1cmtDc0hwSXN1V3ZtM0ZSN2pUV3piV2NwYncw?=
 =?utf-8?B?VnBoUnoreThUdFkzZlpKaWh3aXVxaDhESlAybGlLaG9Md1RiR0lBS2R3NTRI?=
 =?utf-8?B?dVMrOGwxTk9rbTQ5Slp5dXIxWGh4ajBoV0UrdHpFM2JyWmVjUWlSbCs4UWNE?=
 =?utf-8?B?YUppV282WkpZVFphU0h0em9TUzUzaVBlMmFnWHR5Wk1QaktCMzUwV2JzMHFM?=
 =?utf-8?B?eHBQTEZ5NjEweS9pZmlzZ2RrWHovLy9wMDR6KzUxbDF1a2lSSXJOME5mWlM2?=
 =?utf-8?B?OW9Zb2REY2JtbXVQbUZUSXlPdHRXQmhUMFFMTnhLZExBL2JFRGFsVDRodGdT?=
 =?utf-8?B?K1ZyMm5iaVNOY0N6d0dseWZrRG9jdkE1SHhXUmpHRWpXOGl1TS9qcHZNbGVz?=
 =?utf-8?B?cmpoK29sTThHQTNpM215REJWZTNUUVRrNDFZRWtoL1R5YlB1dk1QWTNwbFRl?=
 =?utf-8?B?VFp3cDNkdEhEWkQ5QWlYR1p1aWx6WDcyNGhvUC9tR3Z6ZnIxWHpUeFgxR1N0?=
 =?utf-8?B?dktXbDY3Zm9NcTB5L2xTdVdrUzNCdWhpMkhueG9XTFl0Y2NpZHFFQlcwTytD?=
 =?utf-8?B?NVRTVDM2UitiNVorVXFld2RObCtNNnhTQ1VQUFZ2RDMrcXg4Y0RvL1R0NWdx?=
 =?utf-8?B?ZVRpUzYzQ1R1bWxIcUp0djZWSjEySHZ0ZlhmSytFS2dEU3NSUkJjbmpQK2JS?=
 =?utf-8?B?Y2JTZ2YzUUN2VVhDNG5EL0FMU2IwWXVTVVNCRm5rN1VSVUpkcVQvZ3hrUlZ3?=
 =?utf-8?B?Mmwra3NiSzlYenJ3TmN3YnZvZ0t6dGNFSlVvTEtnc2hqa0pqayt6NVRxVngx?=
 =?utf-8?B?bUtOeWpJaFlQcGpBWGxCWXJyeERYMkJBaE1HVjd2SUFRWWZIV0I0S3llS2Jq?=
 =?utf-8?B?UzN1TVJHVVVOdDNDU3lxaG5JNDJFSkVkeEI5R0IxS2RRNlE5MEpaT2pDdnJn?=
 =?utf-8?B?WTg1Uk5xd3VLQXd3TUtmTEZ3THpKbnZ5MmpxaTRzeENzTlBlYTF5QjhFV0lD?=
 =?utf-8?B?Q0VjQm9HeXVEbktkOHZxaUdSQXU1VGh5OE1Fa3FUbTF3dkh4VDRpOG41UW5O?=
 =?utf-8?B?RGNuRjgvODlidVBHekFQTTNaQnBDckxHZmQ1c3lqRFNuUUtLYktGV3NYcjNJ?=
 =?utf-8?B?d3kzSDE0NmxTeHJLSzdFZnBRZ1lHeS9YM1E3eHpjdVVmOGtXdzR0ODg4MHda?=
 =?utf-8?B?bkJuaFJYSHg5bG5QdmIzRmxWcytzbGVpUWJTelpmQS80Wk5VQ3dDcWIxVDFS?=
 =?utf-8?B?aVEyeUJLUWtrcDlDQVZoVU15dDBZdVk1MHZZZDNIZUhReFQ3MHhENVRRd0pJ?=
 =?utf-8?B?bVc5MXpjYktWeXFwWVlUMzV0by9MMG1nNFFEbFl5R1p2MGNENDJTSWJ3Mlc0?=
 =?utf-8?Q?lIhz4GSjpatfIZ4mqDZENC35M?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0b9a9a5-2874-45b6-81a6-08dc2d5b3402
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2024 12:48:12.1406
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lFvISnZQpUXb9NSqQG6944R3XGdZ6BpP0DMcdYh7Rpcutx2bN1rinJXaUTSX9QMPXnvi83IPXPm64YEaIsjBJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6640

Hi Hans,

On 2/14/2024 16:00, Hans de Goede wrote:
> Hi,
> 
> On 2/14/24 10:28, Shyam Sundar S K wrote:
>> Hi Hans,
>>
>> On 2/13/2024 13:06, Shyam Sundar S K wrote:
>>> Improve code readability by removing smart_pc_status enum, as the same
>>> can be done with a simple true/false check; Update the code checks
>>> accordingly.
>>>
>>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>> ---
>>> v1->v2:
>>> - remove enum smart_pc_status and adjust the code handling
>>
>> Please drop this patch for your review list. I tested this on a wrong
>> environment and seems like some more code handling is required before
>> we remove the enum.
> 
> Ah yes, I see I missed that this also chnages the return value of
> amd_pmf_init_smart_pc(). I assume that is what you are referring to ?

That's right. Need to handle this case.

Also, when Smart PC is advertised and enabled the other two features
have to be dropped.

Thanks,
Shyam

> 
> Regards,
> 
> Hans
> 
> 
>>>  drivers/platform/x86/amd/pmf/pmf.h    | 5 -----
>>>  drivers/platform/x86/amd/pmf/tee-if.c | 4 ++--
>>>  3 files changed, 3 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
>>> index feaa09f5b35a..ff0d61a56484 100644
>>> --- a/drivers/platform/x86/amd/pmf/core.c
>>> +++ b/drivers/platform/x86/amd/pmf/core.c
>>> @@ -351,7 +351,7 @@ static void amd_pmf_deinit_features(struct amd_pmf_dev *dev)
>>>  		amd_pmf_deinit_sps(dev);
>>>  	}
>>>  
>>> -	if (!dev->smart_pc_enabled) {
>>> +	if (dev->smart_pc_enabled) {
>>>  		amd_pmf_deinit_smart_pc(dev);
>>>  	} else if (is_apmf_func_supported(dev, APMF_FUNC_AUTO_MODE)) {
>>>  		amd_pmf_deinit_auto_mode(dev);
>>> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
>>> index 16999c5b334f..66cae1cca73c 100644
>>> --- a/drivers/platform/x86/amd/pmf/pmf.h
>>> +++ b/drivers/platform/x86/amd/pmf/pmf.h
>>> @@ -441,11 +441,6 @@ struct apmf_dyn_slider_output {
>>>  	struct apmf_cnqf_power_set ps[APMF_CNQF_MAX];
>>>  } __packed;
>>>  
>>> -enum smart_pc_status {
>>> -	PMF_SMART_PC_ENABLED,
>>> -	PMF_SMART_PC_DISABLED,
>>> -};
>>> -
>>>  /* Smart PC - TA internals */
>>>  enum system_state {
>>>  	SYSTEM_STATE_S0i3,
>>> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
>>> index f8c0177afb0d..8b7e3f87702e 100644
>>> --- a/drivers/platform/x86/amd/pmf/tee-if.c
>>> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
>>> @@ -260,7 +260,7 @@ static int amd_pmf_start_policy_engine(struct amd_pmf_dev *dev)
>>>  	res = amd_pmf_invoke_cmd_init(dev);
>>>  	if (res == TA_PMF_TYPE_SUCCESS) {
>>>  		/* Now its safe to announce that smart pc is enabled */
>>> -		dev->smart_pc_enabled = PMF_SMART_PC_ENABLED;
>>> +		dev->smart_pc_enabled = true;
>>>  		/*
>>>  		 * Start collecting the data from TA FW after a small delay
>>>  		 * or else, we might end up getting stale values.
>>> @@ -268,7 +268,7 @@ static int amd_pmf_start_policy_engine(struct amd_pmf_dev *dev)
>>>  		schedule_delayed_work(&dev->pb_work, msecs_to_jiffies(pb_actions_ms * 3));
>>>  	} else {
>>>  		dev_err(dev->dev, "ta invoke cmd init failed err: %x\n", res);
>>> -		dev->smart_pc_enabled = PMF_SMART_PC_DISABLED;
>>> +		dev->smart_pc_enabled = false;
>>>  		return res;
>>>  	}
>>>  
>>
> 
