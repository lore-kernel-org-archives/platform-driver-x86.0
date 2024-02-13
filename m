Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2087.outbound.protection.outlook.com [40.107.95.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9AC5FF04
	for <platform-driver-x86@vger.kernel.org>; Tue, 13 Feb 2024 14:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707836365; cv=fail; b=YbndiaHNObTgjObpsLATFKaATRYevc6d/y9AvyzesVLVQZSvM5vXLujL9yNhK00rEcZcIuFRGALfRIj6xt0M7h1v0oSb6f5SufQnPbp25+G/cB/4w8EYwS3NmpLKqyzaPPWtPyTXabpuyUPv71XJXS57MDAi+3cCY4dsCNL5oSs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707836365; c=relaxed/simple;
	bh=ddKwJ2yTyk+dPQhEiM6uXSIKPrd9RHh3yQ3GBFR5IJA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=A6/6oSBJQq5QHUyEWplzx5e0K0ayYhxdOYK2gjyCtbwep8W89Trpv22pdZvXKJKcF2uS/M9gjsLmLH3fNUY7nhSGlrUPkzIYirLNlaBG7vr5dgloFF2UmzpSpIaZB8cABQ03m6un7Ex9FnAXQefYuD5jnih7dka7zq4OqPyazxI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=DK8mHM8h; arc=fail smtp.client-ip=40.107.95.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="DK8mHM8h"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j34DhAKvR43OmrgYNYZTwNaeALG+wYzsiVG6nGchUh6IydzJmmKqraG4LCwBHDII66bGArXIAjE5GPkrLbwkQiTh+ni15H6AdCiCRmQjZF/xqqDMEGZS4gR5M2e4ClpK+bHWWjsESOIGh1uBgVFJ2ToshQuCs60C4ZH5nXMaNf5OgJVL8IragC2S815IMgX/rFZsHgdbh9X1018SV8PE+aAO1w4o6hqc6tL/xzLzNk6Cw89dgRum9s8GhoFtwUVHpjcgLfyZdwoQCNzGXWb38+kT1DBlupEcBinsgY/bvQ9UfxYgtFC4+wDjxzvMEESntzHVXHOLd3uQ13u/Jnl19w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3hIkzaJKz6iOcg5r3Ug7DLEIctrDUN7BtLk0Hm+NPrQ=;
 b=HL+Kx7qWxRrxS6/2RVlw5B3wQs33CBLUMfZKM5W/VyXLOuVbuoo1X13XSCx6sl9bx+OzePBsq/QytO9u9j7DbqPaQG877spe2UQAI3cSpI51jEy/OgjFzSxum/JOobX8p5bC9MsosVSwnbNlnCR+07GwdHdyLR5/JXSyfU1QRB13wPCuC34etQzqjp1Mzfq9TWeTAP89AjiYdKyiuK8JJHWbmfQtkDa+OLTjjPOS6yfXd4+b1ZN7AiNRJuAEGn6dIcBXN2SSp6r3KrDnht4u0e+Z6CHjYXsAxrudgdj8v7lrJ3HjZJfkFEJzCMlvj+55Q51WptIkwOu6n/sjTvR/jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3hIkzaJKz6iOcg5r3Ug7DLEIctrDUN7BtLk0Hm+NPrQ=;
 b=DK8mHM8hsOfpAT840PeikPI43+FYJZCGi293UdWqYQmRbVBk8gZjeREGLDOHhRqIn7g2ELdNLoEAHoph9vt4j4Qbv57u5ZWsBRhTq12KTa8QxXfu+afITrmeaeL5GVHa1cmjMRtSbA+5d9NYpaw0U1u2yeiU2SQ+3Gw4P/qPmKw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DM4PR12MB5867.namprd12.prod.outlook.com (2603:10b6:8:66::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.25; Tue, 13 Feb
 2024 14:59:19 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dd00:9ab5:4d11:2d1a]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dd00:9ab5:4d11:2d1a%7]) with mapi id 15.20.7292.019; Tue, 13 Feb 2024
 14:59:19 +0000
Message-ID: <bb2bc294-fddf-4a45-bb99-b121d1933c74@amd.com>
Date: Tue, 13 Feb 2024 08:59:17 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] platform/x86/amd/pmf: Fix TEE enact command
 failure after suspend and resume
Content-Language: en-US
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20240213073651.404220-1-Shyam-sundar.S-k@amd.com>
 <20240213073651.404220-2-Shyam-sundar.S-k@amd.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20240213073651.404220-2-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DM4PR12MB5867:EE_
X-MS-Office365-Filtering-Correlation-Id: 731cf3f6-393d-4dc3-9660-08dc2ca45b0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XjL0g6l7Y7BuXd64c8MkQ6GMR2FobV27WoYaawdAtE3ucWfMk/BS5j5BUXE9fKGy0ZJ9YP6mQf3JiDu7OYU6JbdpUp7eXd8MotyWiZ93WSnEOwaLNNWoZv6HhyzLhv2sxZ1f7gofJ+2NYvb3ZxssAjDPt6qtNhEU79fSWm0JXkbu+350Nc9ByjciMpOJeSliy6fm+Ia6s+kfpGyyYQv+dLxrU6LG/Ngqf3i61W2KmuDGU1m3F10m+BFp99mos/CVKJjIh8v2yvt+t+yD88DMgQhRkCBw57E/NpmxrSuKlR7UBTCx5ifZrxjgloA7FzuHVXJ/svYaloFJpchewRAf9EnC5QZC4ng8RV0FjjH4HoCFbupZrR2EfEUJQPQ3yQ+A4rx+4Mcjhnd3cH2IC7rzQOFKs2fjoboT8Ucmy1u/gV0/1OWmryGxmrCESox7WsU+tkJsHxJP3spGR9hLXNClIaPoRfB+Jcgb+9Vqgs92tZu68NDq+hAcPlJosaBoYD3/3PzIbLM2M3tVK41dYpk94w3J1zbWYpDZrrO6+J0SZZcLd7s2VQCo16KdtnhwpN2C
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(39860400002)(366004)(396003)(376002)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(15650500001)(5660300002)(44832011)(31696002)(86362001)(2906002)(66476007)(66556008)(66946007)(8936002)(8676002)(4326008)(38100700002)(2616005)(26005)(41300700001)(83380400001)(316002)(36756003)(53546011)(478600001)(6486002)(6512007)(6506007)(31686004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c1Q2ckY5NFpUMzVDSzh0YXFic1plRGgrYWVKV0xnM3ByYWhBekZSSERsdGlx?=
 =?utf-8?B?Rnh2MmRnZUtXQUl4UG9xK1VGdGxzcWRWVU1Vd0ZQNEZwaHR3UGJZSk9xQktR?=
 =?utf-8?B?NnVabjNTMnVMb1F3R2UzUnRzcmx5YW1aSE8wVW1Ta25MU1dYdjk1cjB1NGpV?=
 =?utf-8?B?dTZoQWxzWWcrckFHbSsyS0k4RkxYL0dOTWMvUytrRUhxN2J1Tm44NStXd2hk?=
 =?utf-8?B?d1NoTU41RmtGZjhablE1MjhvcHNrWnAydW5hcWZuQkZkQ3pqWTdZSEw0NWkw?=
 =?utf-8?B?SElISWxaT29JMWJhMEY5ZGYyL3I1N3QvVFpCTGhlcXBEMmNWVXJTRitJdHpW?=
 =?utf-8?B?TExYdEdjU1ZmZVNhSmh5WnhNanpBdHhvOGJGemtkMGM0STdFbE1xODNEbC95?=
 =?utf-8?B?bVZ6YjJzMXlGOTA4SWNsK0N1TXZXWVJkc0pwSjN4cXFqN3Z3RFU2SW16T1Fp?=
 =?utf-8?B?YUtOS0Z5TzZTK0lRNitMakZEcU9sZkZCWEpXdGlMVGljOENEbk01aVNhcUJO?=
 =?utf-8?B?Nkw3dmljUEtvd1F3YVBJZHhDSi9EZWxnVlJKblM1WTZvRGNEdWlmakdpclFF?=
 =?utf-8?B?cVJyK3d3SUVEdVdLZnliYXF3TlZPSzlaYWJHb0hYRWl2UXBvckxVUlhyL2pw?=
 =?utf-8?B?bHhiWGZxaHJkbnZrbzNPYW51SnRRV2pqd2hNTTBoYWtvV2lJVDQ4UU5yR2RN?=
 =?utf-8?B?TW1XajlnMXhpNU16KzUyMU94SDFOc3N5cGNPR0RrOHhVc1AybUc5cDI2REJu?=
 =?utf-8?B?Y3NNbmJWVUtRRDRoamRHVHljSTE3SDBwQ214THViYVNrdzJiMUQwdGlDZHhR?=
 =?utf-8?B?MFhFSkY4b0piN1pLNjlieTh6TSswSC9palU0SzZyN0YwU1dhK2Z1Y1Z6SzdD?=
 =?utf-8?B?dko3VUJkd1pXS0J2RzYwa2NEcmV3QTB1WTl3NjNYNDhwZUZ0MTNXY0Z1MWZP?=
 =?utf-8?B?TTk1WHBEM20xRGZ6MnB3eStjMHd5TGE2c3cvRDU3YVJNc2phNmFFMm9oWktY?=
 =?utf-8?B?Z2g2dWJSWG9VQ2JHRlBZUnBhNmJFN0tTOEx2QVMvUnVqbENkS1p6OXFkeVJp?=
 =?utf-8?B?T0gwZzcrVys4RGNvVXVzL3FtZklXRW8vcnpEelFkRmJLK00zYmdVMTdHS2Qy?=
 =?utf-8?B?N05PRnBEU0gwOTVncVd6bmVOUnd4Ty9EdFFhTEU2bnk4N0VFMlRzMzg2TFM3?=
 =?utf-8?B?TmMySFpMSkV1TFIyaHQ1YkhFVXM0clIzY2NNdkRXdHdjL0Z4akdRKzlQRFd2?=
 =?utf-8?B?QVI1WlZrZFl1TWZLa2VKZi84OTBaY2gwcUp3d0p6SmNvazJ0YllWWEs5TVdt?=
 =?utf-8?B?QTFTSUVOMjBYS2lsVFM5YU9NRVp6NE9HN1VqUVpUVkZXNm5sRk84NEl4ZERQ?=
 =?utf-8?B?OUF0RTJqTUJxOFh4ZU91UUpWM0dVWmE5M2FnRUo1OW5YOUpaYWJZRGRkM2Fh?=
 =?utf-8?B?Tm5OckFJZUFzVlE4ZE4rVEVqU01SVnV6Vy9qMEhOZ1QyUkRtTWJVWTVjcW83?=
 =?utf-8?B?d0tLVkd4ZjdOL1g3S2VIQ25Vb1gvWEY0Z3FhL2hGMWtLTDJlTktndHpKSzZw?=
 =?utf-8?B?QjhhdzJKM3JmVWZ1UUtkNXhaZDNySjBVREtUdktRU1huM0JhYThIaHRZd2Rw?=
 =?utf-8?B?TGZzU0V3dGFBOEZvZkJLdnlzVmViRWQ4UCsxOEsvS1BXY0hQNUJDZUV6VFlM?=
 =?utf-8?B?MnJPWGR3TG9QNjV3MGwvOXRVTGRQZGMxT3BWU1ZUeERkSmh1OE1UOUVZY2JK?=
 =?utf-8?B?Vm9wREhFZ2NGSTgxamNrUnAzL05aRDBiTElONGYwSmZPcFNqN0k4WEE3eGhw?=
 =?utf-8?B?ZWhKaXF1Vm5EbWMyQ1d1aTFMS0MyZk5FUFp6SnVNRGQ3cy9tY0UrYUpUU2hO?=
 =?utf-8?B?d0hvWFZkZHNzYUtTRUhEOC9RUUlhSEkycWlJRUN1dnJDS0VSdWxQLzUrc3RZ?=
 =?utf-8?B?eGVLVlAybUJSSmpGU0t6OEFacXRiN3VyNlRiWDg1M1hrWHF6dnE4U0llQzY0?=
 =?utf-8?B?WTluaDFkR1pEWlRlNjgwWjhOYXEzVXh2QkdYdThWMmsvbnpnSlJVMmsrYjNY?=
 =?utf-8?B?TUZQL2RxTmkyVWx6MGgvZzZXcVI2aU9JN29UQnJLUm9CRjVJckJZZnRVVUo4?=
 =?utf-8?Q?lVYBeRZNPS+vqqnCdYAz7T06W?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 731cf3f6-393d-4dc3-9660-08dc2ca45b0b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2024 14:59:19.4847
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oEBL1rcGUG+xCeibVUg2P2OAM19gqvnWCoKu4Mav/tIhj+DCgAHWSh+2gBn9+OMTO4Fh3IKqAAIcI4IB13KC6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5867

On 2/13/2024 01:36, Shyam Sundar S K wrote:
> TEE enact command failures are seen after each suspend/resume cycle;
> fix this by cancelling the policy builder workqueue before going into
> suspend and reschedule the workqueue after resume.
> 
> [  629.516792] ccp 0000:c2:00.2: tee: command 0x5 timed out, disabling PSP
> [  629.516835] amd-pmf AMDI0102:00: TEE enact cmd failed. err: ffff000e, ret:0
> [  630.550464] amd-pmf AMDI0102:00: AMD_PMF_REGISTER_RESPONSE:1
> [  630.550511] amd-pmf AMDI0102:00: AMD_PMF_REGISTER_ARGUMENT:7
> [  630.550548] amd-pmf AMDI0102:00: AMD_PMF_REGISTER_MESSAGE:16
> 
> Fixes: ae82cef7d9c5 ("platform/x86/amd/pmf: Add support for PMF-TA interaction")
> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>

I think you're missing a Co-Develped-by tag here.

> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>

> ---
> 
> v1->v2:
> - remove enum smart_pc_status and adjust the code handling
> 
>   drivers/platform/x86/amd/pmf/core.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> index ff0d61a56484..0645164c25a0 100644
> --- a/drivers/platform/x86/amd/pmf/core.c
> +++ b/drivers/platform/x86/amd/pmf/core.c
> @@ -296,6 +296,9 @@ static int amd_pmf_suspend_handler(struct device *dev)
>   {
>   	struct amd_pmf_dev *pdev = dev_get_drvdata(dev);
>   
> +	if (pdev->smart_pc_enabled)
> +		cancel_delayed_work_sync(&pdev->pb_work);
> +
>   	kfree(pdev->buf);
>   
>   	return 0;
> @@ -312,6 +315,9 @@ static int amd_pmf_resume_handler(struct device *dev)
>   			return ret;
>   	}
>   
> +	if (pdev->smart_pc_enabled)
> +		schedule_delayed_work(&pdev->pb_work, msecs_to_jiffies(2000));
> +
>   	return 0;
>   }
>   

