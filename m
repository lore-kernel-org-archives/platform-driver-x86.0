Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010012.outbound.protection.outlook.com [52.101.61.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D432DB780
	for <platform-driver-x86@vger.kernel.org>; Tue,  9 Jun 2026 07:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780991326; cv=fail; b=NjJ5Xk5If36PpKvBGW9FY8xa/Ya1LQDF2dwJO3WxJFvrX/2ijDWV3PYueuNgAcQdRkbziwB8Zy9mZ0fKpq1ctRtFZhIS14KVFm1GKnkEM2HKEk6caLZ3EepjWHyAIZkCCx14zFtIyLSkcb2A0TC/R1vkoN5TS06BecHgH+Y8cGo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780991326; c=relaxed/simple;
	bh=i+GO+DdpTalJBEQS7eE1L4gknXmyDRLiLCWQMZ8Lc4g=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hD+1pqjPOmJyh88P9p9Nsnyy4RGwEvJ2zzXeCYlHCgZeuZwtt4pGwJ4tTnmvFMzGBJ1Sm4BZh0KHDMZwmkyyoXPuKEgPWUMgTK8N6+faHbVDHQQOsU9/R8B+D89Lsch8LB3Hn/1YOo7mz164q1n+UHw76DdRYNX7QlTqNToMTOY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=P+g6OM2/; arc=fail smtp.client-ip=52.101.61.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="P+g6OM2/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VkxmKOa2DDbbBBcwMYNvbdYTYMfKim93cmSR2OwheVLW09Khao38BAlJbNDmECWZjXmfYKI2tAoDI6ylqwCJVTWsqCy9IdPsBTvc3SzzaEpyRGTrItmI9Gud0LsA4T/tRp3JyQkdcffikcLfQLj7h8/TodRceqmS2YtrZPqEsDl2DhEtnc7ZrajuNJzThMKcVEn93oqTOv+hJnvWr65fVXjd1Vun8Lqa9RHJgMcsxNHJ0G83oTuSLqepJ2KUs7BLpsdh9JnyC+OoNnR3TbE6ohadp86fbSTyPMRN0UAykCcRpI/mdFxwPz+IA3F5gpoS+9b46pJ/irdOtSrlRoGttQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bA6bHSz9SttBeoZkv8orhMVZMKNhIBmwPntAtlRYMM8=;
 b=OgdGgwiQCnVlTcAuf00gKHQWev7wv7dN5Ag9kSFgEMz6JsuMFEENxCgiNexZAxeH6qyLG5UHzyXcCvw7xV7LEvMqFu8uM73NDHgU4MFV+QcC+mIfHciGHycEH63gnGe/SzQDy0kUk+wUyfBJIZHC0n1c355W4oy+4Mje7FoviQsFvxYEOdgY9klfztT28Adp2IYqkgack/Ptv9OIxhfNl/7/e++oLQXej6FDLpKkDi2dIcdpdn5Av8N/TdixcZCHRmN4GyU1C0QVSTNmEdlJzkzmB0WqiScxdtw7Y2I3vC8VT6K5kFhAV5Xtz/mnAF+FuuoZ7em0Vc0r6z9q7a/ZxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bA6bHSz9SttBeoZkv8orhMVZMKNhIBmwPntAtlRYMM8=;
 b=P+g6OM2/bzoi4E3+jrDzrPuuFQqqPb93R7FME8SkulF7h6grIjjpdD/11YSdIfEWEPn6Dxoi7Erf/Hxb3du6HPysSZlxhv/zm+BLHdIaX0IwFtRIw2xZxuIFJFAHq6UWiTL9frpILjXN3jdzLZAnIfQwa0+MJYp9VuAMeznokFM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by CH3PR12MB8186.namprd12.prod.outlook.com (2603:10b6:610:129::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Tue, 9 Jun 2026
 07:48:43 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::91cb:8f10:c6d2:d683]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::91cb:8f10:c6d2:d683%4]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 07:48:42 +0000
Message-ID: <8b3d2be8-c1bc-4ca7-8bd1-3ae2f4c4538b@amd.com>
Date: Tue, 9 Jun 2026 13:18:36 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/8] platform/x86/amd/pmf: Implement util layer ioctl
 handler
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Hans de Goede <hansg@kernel.org>
Cc: platform-driver-x86@vger.kernel.org, mario.limonciello@amd.com,
 Sanket.Goswami@amd.com
References: <20260527140205.4073335-1-Shyam-sundar.S-k@amd.com>
 <20260527140205.4073335-7-Shyam-sundar.S-k@amd.com>
 <7134f3bf-1e44-47aa-9419-b716ec4bb17a@kernel.org>
 <577687a7-7d77-660e-e0a5-cbd89217fb55@linux.intel.com>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <577687a7-7d77-660e-e0a5-cbd89217fb55@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0022.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::7) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|CH3PR12MB8186:EE_
X-MS-Office365-Filtering-Correlation-Id: 0920d9e0-0acb-40e4-40c3-08dec5fb86f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|22082099003|5023799004|6133799003|11063799006|4143699003|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info:
	bEbykCy092V6v+bRTvig7HaUG4o6ZX9meRJrhfPkdNmVnIqKa+lEUYImcIJXu/7pbX5f/DkfOLmWAb/8hV3X8+eGI365Q9HvmMkBtBOoXkH9kZx3+h9l6AG6/bvTHxtmbfJe4Y90yPtelkkofHsHmTeR+SjmyY/Fs82COrzwjapUvHZ1tF0jcF/PK5EhEw08PoRUF6pj4BjHRyuSL9Q8HTPL815xOhIpwnhHtK6KmSd5kOQMZjlqNT1oEtuhydrid509XYhcMVWotgxURjWBOZ7E1T8Sw7NrHg6AXYQoAPdG/AUCYn/IXTRCurUe1AUiW5UMDcHHppjQE4f/c4ma9Uk9M6NsGUbSrcZ56IlDSjsP0PYZnvzmiIrHqoLcyjXmQ/CzgnxaPVyQiZZQ4bs9/ppeDb1w7Mo4wxcHW+fixoXt+VhAPXuVWmwvKth0QAzIF0v4Sf2DODHjEKyfdmesJgYmR1DVqxCps3kYcQ8bpeEbuU2QgAUTJb2oIR4/EqYFsBPkbXSRHnxn7euIkwnlCMAkvU+2FUPcZJpxj0Kin/X6A9gfNkWBYbaW2lSKy3YofwNR+kng2g7YcHdZ8o9d9xOVnXD9vhNoNwlGTek90ue1vJSRDS87oWOItAahosPpLFylq1hBE7G6CRpquN4OZhKKFqxZk3uCtDtWa2fbr63savFVAg8LMsE7+5EDTtQE
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(5023799004)(6133799003)(11063799006)(4143699003)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b09zcURieVBjZWVSTVhnSUd1ZUxCaE85dlp4a092MG1zK0NFVEhKVXI5TU9D?=
 =?utf-8?B?Wmc1Z2xxRk5HdUZDNUZtR3hYNlFyVnUxU2xDY05aLzdoMHovS09aVC9LTGNP?=
 =?utf-8?B?amZxMGdkQm14QWlzUnYvOFdiVlExNzViZCtLTWp3RVR5ZlpITlF0bjltTE84?=
 =?utf-8?B?blBJNDhXZ1FyQzg0RHVDWTNNS1J1eWxzYndOMXZjaVIvUVFiVGN1SmVJZnMy?=
 =?utf-8?B?cWYrNUJKTTdKbWtYRXdmZ2JYM2hwQ1VIRE5uVEdoUVI3bmNQL3hzMmtJZW44?=
 =?utf-8?B?cTlUUlZPUkxIK1ZMdGhDZzUyU2hZU2R4K1JSeTkyTzUzN1Z6NThUU3g3NEM4?=
 =?utf-8?B?TGt6c2xpZUhESjhOd2hNTERMUnh3YXB2U2FMRDlLYUh4WEpKcFdtTVhKWjBB?=
 =?utf-8?B?Tk9HcXdYTWc4a3RLU0N5WERBbU1tOEl3eHRuY2pVR253SG9WMWM5a1N6VlhX?=
 =?utf-8?B?ZnFsa1JPSXFiZTZYdE5lY2NWMG9pV1JLLzZ1VzVhYjdsY2JqdU40cTBURWZG?=
 =?utf-8?B?emFzSTFPeUhvZlV1dE5DQy9IUzN4ZVJ4dUVLKy9sWE5VdXRVUFZ2dnNmaGFV?=
 =?utf-8?B?VXV1OGVFN05WemQ5bHo3RXkvTnV6MlBHTmhnUkMzTTJEY3diTlNnL0NrUUVy?=
 =?utf-8?B?eEd6cTB6VkpyVTlMeUlkSVgwNjRNZGtQWC9kUFdXT2ZSYkVteisyb0FCUmRS?=
 =?utf-8?B?bXBsZmNySUltRkE1ci9IeDBLckhzdVBwbDBXUVFiVWNLMmlQYTNLeCsxRlh4?=
 =?utf-8?B?bWY4MEpHblJicHdXeVRnaWJBVlBKUDgrUXJtK2NqYmlvRzZjcElYeVl5ODdv?=
 =?utf-8?B?eVRxUWJMQjFGUjhmM0F4ZXJoSTB0TFlPZXh1cWZ5NzVjOGVGdHhhWGpyL1hi?=
 =?utf-8?B?T0svd0ZXbERBL3QwM0wxc2l6b3QvSGJDQkxZVFI0TkRmR3dkVXYxTy9JU1RH?=
 =?utf-8?B?OGpqNVZSQTdEd0FjVkUvTWZiclpsOGJPd1FHQ01IVTFlVFhuM0RsN2dVV0Zs?=
 =?utf-8?B?SUw4bUM0cGFxWHlJZGE5a3o2cTZCUW90WVJPclNuamE1Q3RqaXIzdDY4TnB1?=
 =?utf-8?B?NDVoS1huZWxUanZyVERlVVN4cy9rdDY1dXM2c2FjT3BHUG5hVlI1WXVkTWg4?=
 =?utf-8?B?eXVmQjBqaGZweVZ0STcycGhsMzBLdHNtODhzR2NJY1ZmaUhPOWZsUGxMeVg2?=
 =?utf-8?B?RUkwUTRZTExZQkJmZFhFR28vNXJYVUI0Y1hQZmdVZ21KSkZjWVNxcDBUeUh4?=
 =?utf-8?B?WTlzS3hEY1V3emxLbkN1R3JQM3d3WGJsYnMyeUl3dDREdDg3d3R5L0Vtb0ZT?=
 =?utf-8?B?VExzZXRRd3Z5V2Jqd1pPSnNZSkdLNkxHKzBVaWdpTVg4VkxSL01MTjZkUGQ1?=
 =?utf-8?B?MDU4NEl3L0I1U1ZXellUdGFxeCtoem1OTzBCRGtIWmNURGlHRVplU3E5TWlO?=
 =?utf-8?B?U3M5MXdyYTN4Y25JcWYwUm9pL3VoVkFtTWlNWXViM3REUy91YkJqUFNyc0h6?=
 =?utf-8?B?aC9OSWdIUm1NcDZldFZ6RWE4TzdUbEgxOTczemF6VE1haklxeGxXYjNhUzli?=
 =?utf-8?B?TkJwblpMM2I0cHV1ZC9RSE9mUGN5YXhYVG0rWk1MQTJrUWxlQU94SFE4c1pq?=
 =?utf-8?B?VmxYNk0vVUkvdkd0aHgwV1JEaDZJeUNFL281UDJxYUJsajkyQ0ZROGhVY2tS?=
 =?utf-8?B?SHpuTmI4ZkRxdUhJSFRVM1lOQTNmYWFXZUVuUE52akZzdnNDcTBUY3BJU3Nl?=
 =?utf-8?B?bURBSTZ1TWpkL1NaQWNSSGRUd1NXQlNlYzFndmRQNFI4VWRHVnljYTI0T0hE?=
 =?utf-8?B?V3ZmcTIxZEUycDVPMjNMZXJmVG9PMDBvUzNlZHY5eGQyakw4SWczRWw2Mk5q?=
 =?utf-8?B?aEk0RWExZnFKb0dlTzJuOUMxU0V3cG1VSFNJcG5haytkTTdOYTdleVM1VVkx?=
 =?utf-8?B?bC8vNklNdmxVTDY3dEFmV1RWeXZjbVIrWVdhSXBZd01nS0xiN04rcjdIcU5Y?=
 =?utf-8?B?dGI0VXRYT0laS0VpUVJjK3lrdTBFMFR5Y0lUUkhUOGN5YTBneFRGNHJmUWpz?=
 =?utf-8?B?cDRYTVFibVZVSDc0bk1UOHN6L2JPNlNCN21ZWFJvNHNtOFY4VEd6RHpRQVVO?=
 =?utf-8?B?bnJpaWIxdU5mYzMvdjJtVjBxdFkxQ2pXcHo0aDF5ZDlkL210YWkwZHlXSzJS?=
 =?utf-8?B?WUpmcGNMYjlXUFpVU1RNNTk5M20xNnpFMmlqSHh4SG9OSk9TazIyWGp3VUNv?=
 =?utf-8?B?NVNTeFBSNEVsOThmd2hqYlN0RFhsU3JUNDMyN0dSSEVMTUdzTkx6N0Q3MWVw?=
 =?utf-8?B?WHdDRGtTRTBkVkExTTdqcXk1UVdRZE1nNkFmaHJ0bnViUVBjZUMyUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0920d9e0-0acb-40e4-40c3-08dec5fb86f4
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 07:48:42.7994
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TklFt2WidAIOiZ2XjKtujPlrp/Cvdm7GNNPlKSqbvw52zBrMtDQCSrkp6ED+8B010JkosIaID4fIngUM2FHJNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8186



On 6/8/2026 20:03, Ilpo Järvinen wrote:
> On Mon, 8 Jun 2026, Hans de Goede wrote:
>> On 27-May-26 4:02 PM, Shyam Sundar S K wrote:
>>> Implement the ioctl handler for the util layer character device. This
>>> support adds the actual functionality to populate PMF metrics from the
>>> TA shared memory buffer and return them to userspace.
>>>
>>> The implementation includes:
>>> - amd_pmf_populate_data() to extract metrics from TA shared memory
>>> - amd_pmf_set_ioctl() to handle userspace ioctl requests
>>> - Size negotiation for forward/backward compatibility
>>> - Feature-based population of struct fields
>>> - Export amd_pmf_get_ta_custom_bios_inputs()
>>>
>>> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
>>> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
>>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>> ---
>>>  drivers/platform/x86/amd/pmf/pmf.h  |   1 +
>>>  drivers/platform/x86/amd/pmf/spc.c  |   3 +-
>>>  drivers/platform/x86/amd/pmf/util.c | 105 +++++++++++++++++++++++++++-
>>>  3 files changed, 107 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
>>> index 269c0a4b1cae..752fa5dd2267 100644
>>> --- a/drivers/platform/x86/amd/pmf/pmf.h
>>> +++ b/drivers/platform/x86/amd/pmf/pmf.h
>>> @@ -903,6 +903,7 @@ int amd_pmf_smartpc_apply_bios_output(struct amd_pmf_dev *dev, u32 val, u32 preq
>>>  void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in);
>>>  void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in);
>>>  int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev);
>>> +u32 amd_pmf_get_ta_custom_bios_inputs(struct ta_pmf_enact_table *in, int index);
>>>  
>>>  int amd_pmf_tee_init(struct amd_pmf_dev *dev, const uuid_t *uuid);
>>>  void amd_pmf_tee_deinit(struct amd_pmf_dev *dev);
>>> diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
>>> index 6e33824ccadc..94355b435a66 100644
>>> --- a/drivers/platform/x86/amd/pmf/spc.c
>>> +++ b/drivers/platform/x86/amd/pmf/spc.c
>>> @@ -18,7 +18,7 @@
>>>  #include "pmf.h"
>>>  
>>>  #ifdef CONFIG_AMD_PMF_DEBUG
>>> -static u32 amd_pmf_get_ta_custom_bios_inputs(struct ta_pmf_enact_table *in, int index)
>>> +u32 amd_pmf_get_ta_custom_bios_inputs(struct ta_pmf_enact_table *in, int index)
>>>  {
>>>  	switch (index) {
>>>  	case 0 ... 1:
>>> @@ -29,6 +29,7 @@ static u32 amd_pmf_get_ta_custom_bios_inputs(struct ta_pmf_enact_table *in, int
>>>  		return 0;
>>>  	}
>>>  }
>>> +EXPORT_SYMBOL(amd_pmf_get_ta_custom_bios_inputs);
>>>  
>>>  void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
>>>  {
>>> diff --git a/drivers/platform/x86/amd/pmf/util.c b/drivers/platform/x86/amd/pmf/util.c
>>> index f8a283192ffe..30fb5c250362 100644
>>> --- a/drivers/platform/x86/amd/pmf/util.c
>>> +++ b/drivers/platform/x86/amd/pmf/util.c
>>> @@ -9,6 +9,7 @@
>>>   *	    Sanket Goswami <Sanket.Goswami@amd.com>
>>>   */
>>>  
>>> +#include <linux/align.h>
>>>  #include <linux/amd-pmf.h>
>>>  #include <linux/miscdevice.h>
>>>  #include <linux/mutex.h>
>>> @@ -19,9 +20,111 @@
>>>  static struct amd_pmf_dev *pmf_dev_handle;
>>>  static DEFINE_MUTEX(pmf_util_lock);
>>>  
>>> +static int amd_pmf_populate_data(struct amd_pmf_dev *pdev, struct amd_pmf_info *info)
>>> +{
>>> +	struct ta_pmf_shared_memory *ta_sm = NULL;
>>> +	struct ta_pmf_enact_table *in = NULL;
>>> +	int idx;
>>> +
>>> +	if (!pdev || !info)
>>> +		return -EINVAL;
>>> +
>>> +	if (!pdev->shbuf)
>>> +		return -EINVAL;
>>> +
>>> +	ta_sm = pdev->shbuf;
>>> +	in = &ta_sm->pmf_input.enact_table;
>>> +
>>> +	/* Set size */
>>> +	info->size = sizeof(*info);
>>> +
>>> +	/* PMF Feature support flags */
>>> +	if (is_apmf_func_supported(pdev, APMF_FUNC_AUTO_MODE))
>>> +		info->features_supported |= AMD_PMF_FEAT_AUTO_MODE;
>>> +	if (is_apmf_func_supported(pdev, APMF_FUNC_STATIC_SLIDER_GRANULAR))
>>> +		info->features_supported |= AMD_PMF_FEAT_STATIC_POWER_SLIDER;
>>> +	if (pdev->smart_pc_enabled)
>>> +		info->features_supported |= AMD_PMF_FEAT_POLICY_BUILDER;
>>> +	if (is_apmf_func_supported(pdev, APMF_FUNC_DYN_SLIDER_AC))
>>> +		info->features_supported |= AMD_PMF_FEAT_DYNAMIC_POWER_SLIDER_AC;
>>> +	if (is_apmf_func_supported(pdev, APMF_FUNC_DYN_SLIDER_DC))
>>> +		info->features_supported |= AMD_PMF_FEAT_DYNAMIC_POWER_SLIDER_DC;
>>> +
>>> +	/* Device States */
>>> +	info->platform_type = in->ev_info.platform_type;
>>> +	info->laptop_placement = in->ev_info.device_state;
>>> +	info->lid_state = in->ev_info.lid_state;
>>> +	info->user_presence = in->ev_info.user_present;
>>> +	info->slider_position = in->ev_info.power_slider;
>>> +
>>> +	/* Thermal and Power Metrics */
>>> +	info->power_source = in->ev_info.power_source;
>>> +	info->skin_temp = in->ev_info.skin_temperature;
>>> +	info->gfx_busy = in->ev_info.gfx_busy;
>>> +	info->ambient_light = in->ev_info.ambient_light;
>>> +	info->avg_c0_residency = in->ev_info.avg_c0residency;
>>> +	info->max_c0_residency = in->ev_info.max_c0residency;
>>> +	info->socket_power = in->ev_info.socket_power;
>>> +
>>> +	/* Custom BIOS input parameters */
>>> +	for (idx = 0; idx < AMD_PMF_BIOS_PARAMS_MAX; idx++)
>>> +		info->bios_input[idx] = amd_pmf_get_ta_custom_bios_inputs(in, idx);
>>> +
>>> +	/* BIOS output parameters */
>>> +	for (idx = 0; idx < AMD_PMF_BIOS_PARAMS_MAX; idx++)
>>> +		info->bios_output[idx] = pdev->bios_output[idx];
>>> +
>>> +	return 0;
>>> +}
>>> +
>>>  static long amd_pmf_set_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>>>  {
>>> -	return -ENOTTY;
>>> +	struct amd_pmf_dev *pdev = filp->private_data;
>>> +	void __user *argp = (void __user *)arg;
>>> +	struct amd_pmf_info info = {};
>>> +	size_t copy_size;
>>> +	__u64 user_size;
>>> +	int ret;
>>> +
>>> +	if (cmd != IOCTL_AMD_PMF_POPULATE_DATA)
>>> +		return -ENOTTY;
>>> +
>>> +	/* First read just the size field from userspace */
>>> +	if (copy_from_user(&user_size, argp, sizeof(user_size)))
>>> +		return -EFAULT;
>>> +
>>> +	if (user_size > sizeof(info))
>>> +		return -EINVAL;
>>
>> Why? If the struct ever gets extended and a newer userspace runs on
>> an older kernel this will now trigger. Instead just clamp to
>> sizeof(info) .
> 
> If this is not here, some of the content userspace wanted will not be 
> there so part of the struct member will not be filled. Userspace needs to 
> be extremely careful which fields it can access in such a case.
> 
>>> +	if (!IS_ALIGNED(user_size, sizeof(__u64)))
>>> +		return -EINVAL;
>>
>> Why ?  I guess on x86_64 this will always be true, but what about
>> i386 ?
> 
> user_size comes from userspace so it could be anything userspace put 
> there and is unrelated to the arch. It just doesn't look useful to copy 
> partial fields if userspace gives a strange user_size. Of course it never 
> happens if userspace uses sizeof() to fill the size in.
> 
>> More specifically this simply seems unnecessary and I believe this
>> entire check can be dropped.
>>
>>> +	if (user_size > sizeof(__u64)) {
>>
>> This should be:
>>
>> if (user_size >= (offsetof(struct amd_pmf_info, features_supported) + sizeof(features_from_user))) {
>>
>>> +		__u32 features_from_user = 0;
>>> +
>>> +		if (copy_from_user(&features_from_user, argp + offsetof(struct
>>> +		    amd_pmf_info, features_supported), sizeof(features_from_user)))
>>> +			return -EFAULT;
>>> +
>>> +		/* Reject non-zero values now */
>>> +		if (features_from_user != 0)
>>> +			return -EINVAL;
>>
>> Looking at amd_pmf_populate_data() features_supported is purely a kernel -> user thing,
>> so why read this from userspace at all ?  And why must it be non 0 ?
>>
>> I believe this entire block can be dropped (instead of fixing the if condition).
> 
> Okay. Perhaps you're right and this should not be added.
> 
> My thinking when suggesting this was that they'll eventually come up 
> something that is every expensive to get and then want to indicate it's 
> not required to get it every time. By checking the feature flags right 
> from the start like this, such an extension would be easy to add later.
> 
> And as per the code says, the non-zero feature values lead to -EINVAL, not 
> the other way around.
> 
> 

Ack to all the comments in this patch. Please review v7 submission.

Thanks,
Shyam
