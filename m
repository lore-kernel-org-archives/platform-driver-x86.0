Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012005.outbound.protection.outlook.com [40.93.195.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C703537FF
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jul 2026 18:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783968055; cv=fail; b=uQB59vmzaZY1V3YBQZWH81rBrx0N8b+Zu+gMJgeBuIfW+sOEFpkxcubLKfqu8lUqvd4d/2cdpZRxji9kf844xeHQ40mPTQEClXB2mItvCat5XBkpLI6NIGBv3xYBo9vLJ3bHqZMVa1HFc+qz5/Nz24+E7tjWcaxEjTa8JHrSsc8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783968055; c=relaxed/simple;
	bh=EvRXRNwJgr4Ig5PHO/zEIYtYRbcldJCFNSARKN/7E10=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=C3dlHtzJlXpt1hDOVv3a+paR0f58Zx02RiAt024FYHQaED0yD1lpbTGCq3y63x06KD1uy506Mc3+DpjMP7tZkaGzLdk190FRyzCd6vKXjXEX3eA114calQZ+/5YcFeOAw+QLRgyoJuH2YSgcKxztw3C1UK15IAmpQA2NkwNilkA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Mn0joYYu; arc=fail smtp.client-ip=40.93.195.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Mn0joYYu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hfR9zogd3aZLS7SuJ5XvgpOyj8ZrQhUmVgrvsecmxfsYd93fGS8AqY+v32rEI9CypCbcC/m81TpaXfVfH4ggQbq8+/yuBeEq03KBI0dEKw3Cj996LMyJ/2aIfF9bZEpcmsZDt7M7I+MOmyMGkvM8J7nJLW9k/2vMWIQfQ4pFYRIbmipuiudEc8Yv9XEsT4mFciPTGMKacj93lc5qHEL9KJf7bJqOW1X2GwqTWyZlyfMvOdboe4hFAIPt54dgqBlPjh4koHD0Rfjv8rO+VKSKYbYLnnEM8WfetZoBv1hDsGduKn6+o9DsMtlYIY92NnIQMH0oriP7PIkKxYjHzGnMXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ai5nfkEYAT2nLTtWGA4U9Vqs7ez1prwdRmkpX3V2v+I=;
 b=JtlRCxY/yyyeBw162eWAQoVbQO7/FXOBx3qZFl6QzQh3pZKvY3ZdRSeo458jA7tgvHdgxFVd/WCOiySNmVbM2UAi1Fg9ZYSADZDlJ2mhmfSKvYRFurXly2L93T3xufoWkQI4BYS5WNA8wA/1KrJBAp93te87iMvvsyf2Tfk8NrNiPKgG5UKCQibLIePszGHg3xI3okksb7edTFWE5f7qpkpYtEm8fVc3TjlN5EwH4Cq8ZXOvWbaFN7CyOGiN2Gk3Pk67ArbVNFLRCQQ4SdCv7d8w+csvuEh0MO8jlZ3j8I+qXuBxJ3z7VaLqM+91hbfnpyEwc47AUyDsI0PrVgugIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ai5nfkEYAT2nLTtWGA4U9Vqs7ez1prwdRmkpX3V2v+I=;
 b=Mn0joYYuDKQFmqO1SA4uSwZJvLp4cV+rqzLEwK2bjIp+DHU1D0KD3IfSZFB+nXGsrzyB6aXaoGTh1uVTsM6Hvlh7n9xC0Kg8ZwOayqcDoBmAmg/lYsBVvTKu+tH+8QnLKOHOKh4yk61tf25M1JdTwjVxbJ6aeDbHhIomEBEKOM0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB6914.namprd12.prod.outlook.com (2603:10b6:510:1cb::21)
 by DM4PR12MB6063.namprd12.prod.outlook.com (2603:10b6:8:b1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.19; Mon, 13 Jul
 2026 18:40:50 +0000
Received: from PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000]) by PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000%6]) with mapi id 15.21.0202.014; Mon, 13 Jul 2026
 18:40:50 +0000
Message-ID: <d4897e27-9b70-4d7b-a43c-a813e888fa4f@amd.com>
Date: Mon, 13 Jul 2026 13:40:47 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] platform/x86/amd/pmf: Add 1AH_M80H device IDs and
 extended SMU mailbox registers
Content-Language: en-US
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20260710174219.2522269-1-Shyam-sundar.S-k@amd.com>
 <20260710174219.2522269-3-Shyam-sundar.S-k@amd.com>
 <52b7b438-8b09-4845-82ca-064da4027da8@amd.com>
 <ac6d740a-9a8f-478d-848b-9ff58af05e24@amd.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <ac6d740a-9a8f-478d-848b-9ff58af05e24@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA0PR11CA0124.namprd11.prod.outlook.com
 (2603:10b6:806:131::9) To PH8PR12MB6914.namprd12.prod.outlook.com
 (2603:10b6:510:1cb::21)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB6914:EE_|DM4PR12MB6063:EE_
X-MS-Office365-Filtering-Correlation-Id: 836ad253-83e6-4c43-e3ce-08dee10e4251
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|18002099003|22082099003|6133799003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	gESLflsld0eguNE4KssviM4hU94FVlzRDYY2OsztcDGnxj+oufJfeS8Ml+7I8ApxU9YMcMojm53VSe0LyAHWb5Xlv5Pbr/WXLoSBhGMfEUeUhJE6eLy7zQUVthoX45PWJisETstP4bUnj6L7fCUgEEGJ+AOYPQEGTGARaLhEfnXD5tD5lz6/sVusLo677LQaKCpiR5wxcV1nm0B3a8S3cWEoiscQmlGgR/ZBdWjZ5JuRDs6+pJV76MMWhi4ikh9GMxiXFC+s/hWLkSwAhHg6nAcvXIEwQREUyeKdq2VHZ0Tyhlss4WUuic7tI9+QLyMbUnGacNLZQbqd88Fjn83A7WM5k5JCgaMBJPy5j2Oywfva0gXfG9Tqb3Iz+lACLBk8T9gtW5f52SNl6O+0VS9ngRt1wlFgvkeeS48Qjfya9WxAO26imR0KrKifDbQ5bZoPBJuVvVmsG1LKkAOG2MkgVa8fCLYJfB3nPM03n5drAqgXQ4zTfhzd6a6b7t/F1z8It0Ngnv88bhjOk92spA+q9nONJ5Z+bMfjHJIp8iuRLPfMIAfo3wjiJtd1C9bdE/uJNEiy33+AOHUVT+inoMqJePTQH+8nnae5MvYrWIe07pvFgVMSLFAi/bzfugfkgCy3Xz19G4cB2ov5WwH/05sjMIWf7nUTUjkiGrQuD4vJ4NQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB6914.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(18002099003)(22082099003)(6133799003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RGJ4K3NHQmg1UXVoUzUvdFNmQUovazdkNUwrYjZsSmp0bkVRRm9xZ2d5UEdX?=
 =?utf-8?B?SGE3ejlJWEtyQVJWSlFhRTNOTWpHQytJVFBhLzR3ODJLWDZrdG1TODBlSy9U?=
 =?utf-8?B?ZmZ6TXFrTmFZaTZiakg0NVB3ME82VVUvdUNDVWhZenFyWTE2c21ia05zajEv?=
 =?utf-8?B?YVN2RVY3dmpRSmM4UjFSVXJycHJ4MjJBUmdlVTBVZ1poMWg0L0I2anpCdVNo?=
 =?utf-8?B?MEJjY1hOeHZLakppQWlKSk9wMU94UEh0czhKZlJsTlQwWDRCb3ZDblNLZnpM?=
 =?utf-8?B?YlZrME1tcWlwNmNjeU1qajdsTnhOaWFqRmR4ZEwwcWJudkRuUFNhbm50RXJ4?=
 =?utf-8?B?d0V3UU1wMzg5OWRzc1BUbVgzVktvRlQ0NHgzdFR1eHJGQ2hCT2RLT2RNMjBh?=
 =?utf-8?B?NWNIZWE4TUZFQVRHWFJkaERQWTZtQnZMc3dkTTREL2JmRWhkYWJuY014dFJI?=
 =?utf-8?B?SC9xY3d1UVdYd2p2cVVIc1NYeGJ0clpSM2lqSEgweUpkWmVQRGJKSUFSc2NB?=
 =?utf-8?B?UW96TnZiWkpYRS8zTWdNU3RxZ253QkpTZmRnRGQvZlo2V2ZIK2tWUS9BKzhx?=
 =?utf-8?B?R0lpR2VqQUVwNHhVaVFvMDU1NnBjYlJsenk5OFR1UFcwejFpUnBiUmwxMUZu?=
 =?utf-8?B?Z3NxVk9LeHJGU2dRQWZjUE1FbGlqZ0NRUUdXUDQxa0phZ3dLbkFUL3JqRWlB?=
 =?utf-8?B?aURIT29EZDdUTU9YMkdhck5aREZuY0RYdDRTOEZPdDloN0l3bm5COWdrWG83?=
 =?utf-8?B?RXhwNThQRzN5TTZ0ejBESWI5TndFWHkvNVNzZmhUVGNsN0tOMTRIV1BiWlJo?=
 =?utf-8?B?REtuZWhFT2dxaER4YjJYOEFrcE9jZzE2WFBuNjljODAwcnhYMHhvcUdtdUln?=
 =?utf-8?B?MVFkdUFCb3Z4L1JGWnpkcTNFdzFUOE1rSnE4WXExS0JhZkQzbGhwcEkzV3gx?=
 =?utf-8?B?NFRTL1d3SFJzV2dIb0xPeDF2UWtDZWV6WUwyWDdtOXZRSkFvSzg2VmhjNHpr?=
 =?utf-8?B?WmlSSklLSDhqamVheElpUXNVZ0Z2Tlg3RTFkdHlucTRray9LMGlQWFNSZnAw?=
 =?utf-8?B?akJGYklqWWRpQmZUNkNuZUtsa3N6ZVVYMHZNSUNRWTRXTFJ6WS9hVGhXcVJ4?=
 =?utf-8?B?UHBCTlBuU2RMWFJOMlJ2WFNoeG1HdlBJdWF3U25LNnJVTzlSZG4yUUVyTU1T?=
 =?utf-8?B?aVkvSmMyTjYxdHBLTThUdU5OTGNTUUl1WWc0MFlVSi9BdzlWSEwrbzZDSjFB?=
 =?utf-8?B?Q252MzRmMzVmQ1Q0Q1gyT09uZXp3VTZzcDA3dWl0eW9HYzN2dHlhdkQyL0VH?=
 =?utf-8?B?VUFXQjVmRUg3L1dFdzlmUDIyR01ldjk5VEROVlVJdkNDb0ZMSzlVYlBsRDgw?=
 =?utf-8?B?WG1ORU5GaXNUbjdEVTBmSzljQm54bmtFc01mZ2dGUU5GcVFKRVBkNG9WUjdu?=
 =?utf-8?B?RW1Ed1gvdlMvMXA3RjhIWXlmSytaWlFTL2U4djAzY1VrUFFtaUJNdk5ONXUy?=
 =?utf-8?B?aHUvMW5FRHlXY25WTE10Ync0bThSSkhDSVBSVStzVVoyQitlbElMNERIZ2Zw?=
 =?utf-8?B?MkNoSFE0T2doOVduNUVhYXBtandReW1BeXRqclBnUWRVSU9zV2F5ekJrdW5S?=
 =?utf-8?B?bmVNUElwdFBNMDRqRE1kYzBDNDZIS3p2NjZrTy9UU0hHK3VEUDA5S2IraWlY?=
 =?utf-8?B?YzhSWXJUMWlONjB0aDlac25lYWZtbzQyclJVSkppUlloQzUyUlgyNHRWZEpV?=
 =?utf-8?B?dE5PUk5MYlhDQitZSkVNd1Z3RXlqckVvREFiMm5QSzcyOHFBZitzOU54THRp?=
 =?utf-8?B?UUI4dTJiTzZCNE5nZkp2S2pjMmJSVlArVGQ5RmNkOERPeTE1OXV3dFIzYmwy?=
 =?utf-8?B?NXVVbXpwZThvNkZQWUVKbWZSSXFPWUxMR2tMK2w2N0t5aDd4NDRVMDU4VUFK?=
 =?utf-8?B?Uks3MnNLVGFYMGdjaDZZY015ZE82MERLOFdocWlxaStPTTN2dXFaWWpnZ1Vt?=
 =?utf-8?B?eXk3K05RcGoxZlV5RUkvWEkzQ0FFbmdvb1I0Y05UNndadytEWFcrWUNPQVdz?=
 =?utf-8?B?dk82TkNRRnRxcGtTWGJHemV2eUNsQnV0d0g1WnhWc2RKS2MvZzJOZ0M5a2Nn?=
 =?utf-8?B?NWhGaC9YbSt2SkNwdmczUmZreUNreG5WelJmTmRETkdIRG05bkpiN2lVbjh3?=
 =?utf-8?B?aWtmMmYzaDkzV0NmV1FPRVBlZ3hieDVkZk0vVERzN3Y2bDdRMFdBaVlHcU5J?=
 =?utf-8?B?Y1c1N01BTVlPYUtidXdld3ZPNkdvNGpoUWExd2pVY0s4OG5FcXh5SFJKMmNy?=
 =?utf-8?Q?YH9OxeV5EFzyIQ5wAk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 836ad253-83e6-4c43-e3ce-08dee10e4251
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB6914.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 18:40:49.3225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L+Bs5LSkd4RPGwmUnqHzQp64DtQwNfiG1ml6Od5etY61u7kPG/LemfU56ZKUtLXdB0mC9PzOco/2peosX+PJug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6063



On 7/13/26 13:37, Shyam Sundar S K wrote:
> 
> 
> On 7/11/2026 00:40, Mario Limonciello wrote:
>>
>>
>> On 7/10/26 12:42, Shyam Sundar S K wrote:
>>> Add PCI device ID (0x115b) and ACPI ID (AMDI0109) to enable PMF driver
>>> support for the AMD 1AH_M80H (Family 1AH Model 80H).
>>>
>>> The 1AH_M80H platform introduces an extended SMU mailbox interface that
>>> uses three argument registers instead of the single register used by
>>> earlier platforms. Define five new register offsets for the 1AH_M80H
>>> mailbox: message, response and three argument registers. The extended
>>> argument registers are required because 1AH_M80H exposes metrics
>>> through
>>> a firmware managed DRAM region. The GET_METRICS_TABLE_DRAM_ADDR command
>>> returns a 64-bit physical address split across arg_reg[0] (low 32-bit)
>>> and arg_reg[1] (high 32-bit), with the metrics table size in
>>> arg_reg[2].
>>>
>>> Define amd_pmf_1ah_m80h_smu_regs to capture this extended register
>>> layout
>>> and register it in pmf_pci_ids[] via PCI_DEVICE_DATA(), keeping the
>>> existing amd_pmf_legacy_smu_regs shared instance for all prior
>>> platforms
>>> unchanged.
>>>
>>> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>>> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>> ---
>>>    drivers/platform/x86/amd/pmf/core.c | 29 ++++++++++++++++++++++++
>>> +----
>>>    drivers/platform/x86/amd/pmf/pmf.h  |  3 ++-
>>>    2 files changed, 27 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/
>>> x86/amd/pmf/core.c
>>> index 1826fc64bf56..7c5a1ec3d7fc 100644
>>> --- a/drivers/platform/x86/amd/pmf/core.c
>>> +++ b/drivers/platform/x86/amd/pmf/core.c
>>> @@ -26,6 +26,13 @@
>>>    #define AMD_PMF_REGISTER_RESPONSE    0xA78
>>>    #define AMD_PMF_REGISTER_ARGUMENT    0xA58
>>>    +/* PMF-SMU communication registers for 1AH_M80H */
>>> +#define AMD_PMF_REG_MESSAGE_1AH_M80H    0xA04
>>> +#define AMD_PMF_REG_RESPONSE_1AH_M80H    0xA08
>>> +#define AMD_PMF_REG_ARGUMENT0_1AH_M80H    0xA0C
>>> +#define AMD_PMF_REG_ARGUMENT1_1AH_M80H    0xAAC
>>> +#define AMD_PMF_REG_ARGUMENT2_1AH_M80H    0xAB0
>>> +
>>>    /* Base address of SMU for mapping physical address to virtual
>>> address */
>>>    #define AMD_PMF_MAPPING_SIZE        0x01000
>>>    #define AMD_PMF_BASE_ADDR_OFFSET    0x10000
>>> @@ -179,7 +186,7 @@ static void __maybe_unused
>>> amd_pmf_dump_registers(struct amd_pmf_dev *dev)
>>>        value = amd_pmf_reg_read(dev, dev->smu_regs->resp_reg);
>>>        dev_dbg(dev->dev, "AMD_PMF_REGISTER_RESPONSE:%x\n", value);
>>>    -    value = amd_pmf_reg_read(dev, dev->smu_regs->arg_reg);
>>> +    value = amd_pmf_reg_read(dev, dev->smu_regs->arg_reg[0]);
>>>        dev_dbg(dev->dev, "AMD_PMF_REGISTER_ARGUMENT:%d\n", value);
>>>          value = amd_pmf_reg_read(dev, dev->smu_regs->msg_reg);
>>> @@ -220,7 +227,7 @@ int amd_pmf_send_cmd(struct amd_pmf_dev *dev, u8
>>> message, bool get, u32 arg, u32
>>>        amd_pmf_reg_write(dev, dev->smu_regs->resp_reg, 0);
>>>          /* Write argument into argument register */
>>> -    amd_pmf_reg_write(dev, dev->smu_regs->arg_reg, arg);
>>> +    amd_pmf_reg_write(dev, dev->smu_regs->arg_reg[0], arg);
>>>          /* Write message ID to message ID register */
>>>        amd_pmf_reg_write(dev, dev->smu_regs->msg_reg, message);
>>> @@ -239,7 +246,7 @@ int amd_pmf_send_cmd(struct amd_pmf_dev *dev, u8
>>> message, bool get, u32 arg, u32
>>>            if (get) {
>>>                /* PMFW may take longer time to return back the data */
>>>                usleep_range(DELAY_MIN_US, 10 * DELAY_MAX_US);
>>> -            *data = amd_pmf_reg_read(dev, dev->smu_regs->arg_reg);
>>> +            *data = amd_pmf_reg_read(dev, dev->smu_regs->arg_reg[0]);
>>>            }
>>>            break;
>>>        case AMD_PMF_RESULT_CMD_REJECT_BUSY:
>>> @@ -266,7 +273,19 @@ int amd_pmf_send_cmd(struct amd_pmf_dev *dev,
>>> u8 message, bool get, u32 arg, u32
>>>    static const struct amd_pmf_smu_regs amd_pmf_legacy_smu_regs = {
>>>        .msg_reg    = AMD_PMF_REGISTER_MESSAGE,
>>>        .resp_reg    = AMD_PMF_REGISTER_RESPONSE,
>>> -    .arg_reg    = AMD_PMF_REGISTER_ARGUMENT,
>>> +    .arg_reg    = { AMD_PMF_REGISTER_ARGUMENT, 0, 0 },
>>> +};
>>> +
>>> +/* 1AH_M80H uses an extended mailbox with three argument registers */
>>> +static const struct amd_pmf_smu_regs amd_pmf_1ah_m80h_smu_regs = {
>>> +    .msg_reg    = AMD_PMF_REG_MESSAGE_1AH_M80H,
>>> +    .resp_reg    = AMD_PMF_REG_RESPONSE_1AH_M80H,
>>> +    /* arg_reg[0], arg_reg[1] and arg_reg[2] carry low, hi address
>>> and size for DRAM metrics */
>>> +    .arg_reg    = {
>>
>> Rather than overloading arg_reg how about if you just have a define in
>> "struct amd_pmf_smu_regs" for low, hi, size?
>>
>> So f1ahm80h wouldn't have arg_reg defined, it would have low_reg,
>> high_reg, size_reg.
> 
> Ack to other comments and I have pulled the tags.
> 
> Specific to this comment, I spoke to PMFW folks and understand that
> they would have the ARG0/ARG1/ARG2 combinations going forward and it
> would not be mapped to low/high/size (as happened in this
> family/model). So, to make the code generic, I have retained the
> variable names to reflect the PMFW behavior.
> 
> I have adapted to some of your comments, that gets mostly reflected in
> 6/6.

Got it, thanks for confirming.

> 
> Thanks,
> Shyam
> 
>>
>>> +        AMD_PMF_REG_ARGUMENT0_1AH_M80H,
>>> +        AMD_PMF_REG_ARGUMENT1_1AH_M80H,
>>> +        AMD_PMF_REG_ARGUMENT2_1AH_M80H,
>>> +    },
>>>    };
>>>      static const struct pci_device_id pmf_pci_ids[] = {
>>> @@ -274,6 +293,7 @@ static const struct pci_device_id pmf_pci_ids[] = {
>>>        { PCI_DEVICE_DATA(AMD, CPU_ID_PS,
>>> &amd_pmf_legacy_smu_regs) },
>>>        { PCI_DEVICE_DATA(AMD, 1AH_M20H_ROOT,
>>> &amd_pmf_legacy_smu_regs) },
>>>        { PCI_DEVICE_DATA(AMD, 1AH_M60H_ROOT,
>>> &amd_pmf_legacy_smu_regs) },
>>> +    { PCI_DEVICE_DATA(AMD, 1AH_M80H_ROOT,
>>> &amd_pmf_1ah_m80h_smu_regs) },
>>>        { }
>>>    };
>>>    @@ -563,6 +583,7 @@ static const struct acpi_device_id
>>> amd_pmf_acpi_ids[] = {
>>>        {"AMDI0105", 0},
>>>        {"AMDI0107", 0},
>>>        {"AMDI0108", 0},
>>> +    {"AMDI0109", 0},
>>>        { }
>>>    };
>>>    MODULE_DEVICE_TABLE(acpi, amd_pmf_acpi_ids);
>>> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/
>>> x86/amd/pmf/pmf.h
>>> index 7a8fd9d399de..088edfab08f0 100644
>>> --- a/drivers/platform/x86/amd/pmf/pmf.h
>>> +++ b/drivers/platform/x86/amd/pmf/pmf.h
>>> @@ -28,6 +28,7 @@
>>>    #define AMD_CPU_ID_PS                   0x14e8
>>>    #define PCI_DEVICE_ID_AMD_1AH_M20H_ROOT 0x1507
>>>    #define PCI_DEVICE_ID_AMD_1AH_M60H_ROOT 0x1122
>>> +#define PCI_DEVICE_ID_AMD_1AH_M80H_ROOT    0x115b
>>>      /* Aliases required by PCI_DEVICE_DATA() macro naming convention */
>>>    #define PCI_DEVICE_ID_AMD_CPU_ID_RMB    AMD_CPU_ID_RMB
>>> @@ -400,7 +401,7 @@ struct pmf_cbi_ring_buffer {
>>>    struct amd_pmf_smu_regs {
>>>        u32 msg_reg;
>>>        u32 resp_reg;
>>> -    u32 arg_reg;
>>> +    u32 arg_reg[3];
>>
>> See above comment.
>>
>>>    };
>>>      struct amd_pmf_dev {
>>
> 

