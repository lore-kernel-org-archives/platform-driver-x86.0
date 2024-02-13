Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2057.outbound.protection.outlook.com [40.107.237.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A699D1758D
	for <platform-driver-x86@vger.kernel.org>; Tue, 13 Feb 2024 07:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707809926; cv=fail; b=D0/MkKaMv6fQB+6+jeKClw//V5CrCYAfX8fQT6RYhzuHHL2WwCbIScp3yQ5TcgKAzbO+oGCm6TjrQUCe8A0qv7fO4PpcPB+YWD2xLqsy9atfhGiQR9QGbhTXagjSS9dgVVaTTdygPIWT9S6O9QMJEsUPcgYpI2/IvyNhsLjEUw0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707809926; c=relaxed/simple;
	bh=2NzCQBg3QINWMqmWekxOEzgBEdryEuXCBKsPE71XQyE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jvpDITvfU/uLLc9J5RzMpC/jDQ8udK23kuxbmYNiBhGTrxqbiCLxVQVATRRZdDIe5I7DCcGBoJOXv3SblpXa+vzWQC8Be2ij0F/eOZApysee210JqpdIDjeBk7/ua2fzsm36v5G7X9S66RkO7YSFEO6dBA1ek2/V/HUjlqACHPA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Xai8UPNH; arc=fail smtp.client-ip=40.107.237.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Xai8UPNH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WtzVlRTwbV32MWDf6uCENDjbzBZH9uu/2ReVMLMWpNlIazrmhMLzpvVB3FFo887mhVY+AfQH32aPwNxasBLhK4gxw5436cxe1PlsAGzWo5uwDYH2ldP9cop13gb7ImfLX8JZxinpzKVfU4tldcMbja6bUxSEpII3xrTLPXEC+ZmhHzfzaE2HuJ3JzceIf8z0A1zPuxAn96Ewk+OUwMcjlv0BaAGgDURyPSviMgkuHItnkEJrqFkyMrbVqOeWveOLnTGZuyCEMm/crKLR/1V/94k/H3k+k+Vir4LAmO4SyrztIH/E7y7Wilss1pfZd2kgvgxupUejGDFh7qQAcYw77A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=snBYB7e/sUOCdE8O0US2nRpUH2djwdVwMAk/dXOIokQ=;
 b=mG93jeGvFouwv3BkofMzQhFb8454U8tOOgyT9VdEdjATwZz5MwRWcDgDMiqNB6xQ9Yp/RuNQ7oEbJ/3L6OKuPr8mJc2KHVD0wU/U9qP5PPXEjjiLfmK6Prl0G+q4Z059yhE2fRGgs83oKwxa7AMSHugN9kfTWxMDXkcMvHvYbR3gzLkYWcON+cx735DfV9WlNMnV7HtRZzvWSdO+BiwPT27zbtheUtv/ZPqQyMOAP/DN1+Yb5gzkmG504g4aBKak5VAu0EIiU06HgtZ3vEVV+L+MO8oCpKufYIMr91AJNN5283MGuOdx38qVx2JwXBLWXiSKs0Oanh/c4oG+WUJS5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=snBYB7e/sUOCdE8O0US2nRpUH2djwdVwMAk/dXOIokQ=;
 b=Xai8UPNHcsOQgVxTYwoS9Te1V2yF+jUkx3KDZ12lqLO9Tb7I+WbUnCbhinxQRneo6f2C5Go4VonL2SWC5UoyIZL6i7SWA7Og0YwYzc0B6cWcXU4VLSMtaoYnXe4xLPK+/ToXcNTPHN8W/mtTWgJWlK5jEv+YnYUuZdlTYhom1LI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by SA3PR12MB9228.namprd12.prod.outlook.com (2603:10b6:806:39c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.25; Tue, 13 Feb
 2024 07:38:41 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::c17f:8a14:844e:2500]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::c17f:8a14:844e:2500%5]) with mapi id 15.20.7292.022; Tue, 13 Feb 2024
 07:38:41 +0000
Message-ID: <351bf6c0-0d0a-4823-95f8-bdf96285d526@amd.com>
Date: Tue, 13 Feb 2024 13:08:34 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/amd/pmf: Fix TEE enact command failure after
 suspend and resume
To: Hans de Goede <hdegoede@redhat.com>, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com,
 mario.limonciello@amd.com
References: <20240212092440.4135787-1-Shyam-sundar.S-k@amd.com>
 <ec06098b-5e69-4df0-94d0-22c5755b9351@redhat.com>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <ec06098b-5e69-4df0-94d0-22c5755b9351@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0226.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:eb::9) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|SA3PR12MB9228:EE_
X-MS-Office365-Filtering-Correlation-Id: da12c6bd-c78b-498f-75ea-08dc2c66cc58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QJLkKg3+255aORTjMjQbAmuJwPD189g57bpIn6kcMERemgmaD8SDD+4dzSgzO4HX1D8bL/HuN/hGoS+rPqj0pB3z+CIPhvm9CPjwadBkiA6rIL9nnUsNekeP0VmlBwP63H73vUfBmpdbVFoaYNF3lNStjI7oluwzyJHj/coddvRYr0MBDBiAuwcXTj6CE9bVe6Tm6jGI33co3fIRCtjhSv+M1PFucqKHa826d3YG+VPAc0ZtB6jrvdWvYZq+VOExt7CHQVsWUTIxQqA5ev5BBtPL5YIQjOP91/bJGf9q6lwmI928garxBmt/E0uN9hQbAi3ju6LeZ05vLNSkGjRb9CR8xihIpaaMA+H8HVtjjUBJHlnVxcTsMP6Mw4JA+0JUU7AxFCdXQFjd7M6+BsZ/GCCwtgT2qqpPakaVX6HPiaB3ndGWxEnwfDqrRkqXUwyCb2FVzAqa1+RUxdR13UNgz9N76MS5KqydaJn+EmUOZTCscjsxDptFupGs+1sM+LAsNM5CV63BvmRW+SbDs5O/3fK9PUcgcSqQO5I8BmUhwXEqXoY+aigpf1vC3dl4MHuv
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(376002)(39860400002)(366004)(136003)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(15650500001)(31686004)(2906002)(26005)(41300700001)(2616005)(478600001)(4326008)(8676002)(5660300002)(53546011)(83380400001)(66556008)(8936002)(66476007)(66946007)(36756003)(31696002)(86362001)(316002)(6506007)(6486002)(6512007)(6666004)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VkZDTlBQbXI5c0craWZ0WXhJWjh0MmkyNmhxVGMxRUpLclR4djhubm9mMS9F?=
 =?utf-8?B?TmVyYkpER1lWVlAyYnEveWRiRVRsNFJnbGJUYXZPL3BBTzVIcGt6cm95MnY0?=
 =?utf-8?B?S1VDcjdoa3NBYWpxRmVRQSs2U1h3VVNMK09FWlZGN1Rkc3pxdHFYd0gxT2Rp?=
 =?utf-8?B?b1hpM05OY1k1c3JJSzNrb3lORzZJMGdMeWtzWExpeXJrZWZPL29YR0ZtWm5K?=
 =?utf-8?B?bWQ2Zy9nU3gwRkNaMFRvWmhtdUdXSHh1Mmo1VUsrTkoza2M4L0cwam5qQ3RY?=
 =?utf-8?B?dDB4VllBU1c1WmdxZjgyQkdOVTlwVHpEQnZTTFdGRlcwWWxyRUMwUFkxa0w4?=
 =?utf-8?B?dUMycWNWMkhGWkRRL29MdWZoM1JzaHdvQWszdmJGSVpjY2Z3SS9RZ3Z0YzdU?=
 =?utf-8?B?VytQRVBJYllMLzZWUnZVZ3lsdUhzNW1HMlJJTFlmWnN4cGpNQzlGR2NQcnQ4?=
 =?utf-8?B?bC8yN3ZFaU1leUFPRUVYQmZqSm5UaTdsZXhRMDYrLzkwOVlvYllncFVlSThp?=
 =?utf-8?B?RFVZaEdKc2tFQWNQK2ltTGloTUlpN2N2OGZ4bjh1ZnllNUF5NmFUYWgyZ21i?=
 =?utf-8?B?S3dHMjN5ZDZPNXc4bEpUZTU4YS8zNE1pQ1ZYbTlYbWFWUW1YRHV6b05oL1Y3?=
 =?utf-8?B?SGUybnBLOWk3ekk5TUl2Rk9GaDVhWWtVMXZ5SFgyaWRtV3Q4R2JFWGhJRXMr?=
 =?utf-8?B?U0tPM0ZkYW5TUEhRWmJyUCt6a1Y3NTZXV01Wc2RoV0RIRGRVdWhzUk1CclBX?=
 =?utf-8?B?VmtzeXc5RkJnQTZrcWZ2cDV0eEFJT2QxcXkzVWtRdjBoM0JsV216OWEzcGFN?=
 =?utf-8?B?bFNTSG14YW0zQmZoMzdUQ0ppT0JORkVJY3FVbGVYZkNYL3Q2RkNqY3h5Wjlw?=
 =?utf-8?B?SDlmYzhGSm1TSG03M202OEk1N3BKbnFFZ1V4bHE0c052bmwxRU5uMGsxMXBC?=
 =?utf-8?B?aEZDVmFGK0pEbGxuWityTXdRNWVYZVM0M2EzRFFIb2g2d21GREY4L29wMmhZ?=
 =?utf-8?B?YXhkQk5LOVFIL2UvbmU4S0JTSXNkWUFiWVEzckpTNy8wVmJIdDVhM2lTa3Uy?=
 =?utf-8?B?akVQL2k3MkVBZnhBZndTM1NyTFByV3grcG81a0xNSVF3WXNWRGhmbERJR2xM?=
 =?utf-8?B?Z2hPT0xyMlVYb2Y5Z3dvUmhWRzNyVy85aGk5bEhIdE0zRnRrYTYwUzA2eE9I?=
 =?utf-8?B?SCs5L2NGSFhTaHY5R3N2VFhsL2V3b201Tk9lUlNKNm5jbnFMbGMrWnNTOXQ2?=
 =?utf-8?B?b3NRVFNRSjVZMHFnRVprT1ZnNG0zYTZhelB6MExYQWluVzN4dG13UjJzUno0?=
 =?utf-8?B?OVZVVzE4UGJxTFpQZG9DU2dIMVBBZkt0M0todnVDVSsxdzJlUUVEb1lXaS93?=
 =?utf-8?B?cFpvdlFDc0hTSlROcFBJeEpVQVJUZS9PRmg2Rk04dG1oYnVTMkJKa3Y0dWJw?=
 =?utf-8?B?MVBtUjNUbnBTZUY1T25YMkd1YXVHSTRhTFFxZnVuaU5pTDFKNlZ2VHU1U1Vw?=
 =?utf-8?B?YjR0ZEpPS05RL2hLZGJMeHJnakVPd3U1aDBXQmxhTHE4bitOZ1I0YzV1aW1U?=
 =?utf-8?B?UHRhRTdiT3YraHRjYndVbituY1p1STZIWHZ2OXhFVUFoaVpnUnRFUmRUY21t?=
 =?utf-8?B?MTV4U2FkSGlFMGhnZjJJQWFuMU5DU2s2elR3Y0dyTjE3RGpKa1VZTG5JV1Ix?=
 =?utf-8?B?eUhpQ0hlN3U5a0NGME45M0lwbXptOCtGSkFDeEhoRnc1QkFqMXFzVmpHS2U1?=
 =?utf-8?B?M3M3UDZ4VjhKY09HNDNERk43dFM0QzgzYlZmQ3g1QlZrNkMyNDZPWWMwTFRR?=
 =?utf-8?B?VmVhNWVhOHU2WUJMdVpGMzB1VGJnUDFKbVJTUU9semFCK0dXeEhpZlpoVE9n?=
 =?utf-8?B?TFo4aFdGSUJ1ZTdrak5IVG5DVDhEL0VsZ3kwYzh2OFJUOFI0MDA4WGhNQ0N1?=
 =?utf-8?B?OWNZemxJNXRXeHhjbEV3alpMZlJPLzdtQ0JTMC9XUEJUYzJCc1A3UXZEQXM3?=
 =?utf-8?B?RzcwWXkyM0VnaW9lbDRoV1Y3cGV5QkpUZmJ2SE5qSWJyV3QwNUgyejZuQWJJ?=
 =?utf-8?B?WjJkNmxBNklvdTRaV3Z3Uy9haGFUMWJQRVZsd21WNElNVGo3a3FHZ3JiUjBM?=
 =?utf-8?Q?mIM9uQsFoxzqGOdRwMRVod5s6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da12c6bd-c78b-498f-75ea-08dc2c66cc58
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2024 07:38:40.9421
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vn/ob+4YwTQ4c1zthR0Z3Tax68z+369pJDSeQwQIFl1zrnnGU4dLy0NE+TPbXA9apSnOxhy+X5z+cqT+IZP2GA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9228

Hi Hans,

On 2/12/2024 15:17, Hans de Goede wrote:
> Hi,
> 
> Thank you for your patch.
> 
> On 2/12/24 10:24, Shyam Sundar S K wrote:
>> TEE enact command failures are seen after each suspend/resume cycle;
>> fix this by cancelling the policy builder workqueue before going into
>> suspend and reschedule the workqueue after resume.
>>
>> [  629.516792] ccp 0000:c2:00.2: tee: command 0x5 timed out, disabling PSP
>> [  629.516835] amd-pmf AMDI0102:00: TEE enact cmd failed. err: ffff000e, ret:0
>> [  630.550464] amd-pmf AMDI0102:00: AMD_PMF_REGISTER_RESPONSE:1
>> [  630.550511] amd-pmf AMDI0102:00: AMD_PMF_REGISTER_ARGUMENT:7
>> [  630.550548] amd-pmf AMDI0102:00: AMD_PMF_REGISTER_MESSAGE:16
>>
>> Fixes: ae82cef7d9c5 ("platform/x86/amd/pmf: Add support for PMF-TA interaction")
>> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>>  drivers/platform/x86/amd/pmf/core.c | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
>> index feaa09f5b35a..be9edb849006 100644
>> --- a/drivers/platform/x86/amd/pmf/core.c
>> +++ b/drivers/platform/x86/amd/pmf/core.c
>> @@ -296,6 +296,9 @@ static int amd_pmf_suspend_handler(struct device *dev)
>>  {
>>  	struct amd_pmf_dev *pdev = dev_get_drvdata(dev);
>>  
>> +	if (!pdev->smart_pc_enabled)
>> +		cancel_delayed_work_sync(&pdev->pb_work);
>> +
> 
> These inverted checks are very confusing and this is all caused by this
> enum which causes the smart_pc_enabled enabled bool to be inverted:
> 
> enum smart_pc_status {
>         PMF_SMART_PC_ENABLED,
>         PMF_SMART_PC_DISABLED,
> };
> 
> Please do a preparation patch for this fix which:
> 
> 1. Drops this broken enum, there is no need to have an enum for what
> is simply a true/false case.
> 
> 2. Replace PMF_SMART_PC_ENABLED with true, PMF_SMART_PC_DISABLED with false,
> so that the contents of pdev->smart_pc_enabled actually matches its name
> instead of being inverted.
> 
> 3. Change the single existing smart_pc_enabled check from:
> 
>         if (!dev->smart_pc_enabled) {
>                 amd_pmf_deinit_smart_pc(dev);
> 
> Which is nonsensical code, if not enabled clean it up? Into
> the much more sensible version of:
> 
>         if (dev->smart_pc_enabled) {
>                 amd_pmf_deinit_smart_pc(dev);
> 
> And then redo this patch on top of this preparation patch,
> also replacing the "if (!dev->smart_pc_enabled)" checks
> in this patch with "if (dev->smart_pc_enabled)" so that
> the code actually makes sense to a casual reader.

Thank you. I agree with your remarks. Have sent out a new revision now.

Thanks,
Shyam

> 
> Regards,
> 
> Hans
> 
> 
> 
> 
> 
> 
>>  	kfree(pdev->buf);
>>  
>>  	return 0;
>> @@ -312,6 +315,9 @@ static int amd_pmf_resume_handler(struct device *dev)
>>  			return ret;
>>  	}
>>  
>> +	if (!pdev->smart_pc_enabled)
>> +		schedule_delayed_work(&pdev->pb_work, msecs_to_jiffies(2000));
>> +
>>  	return 0;
>>  }
>>  
> 
