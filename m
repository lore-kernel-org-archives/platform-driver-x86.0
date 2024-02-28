Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2068.outbound.protection.outlook.com [40.107.223.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D7E1EB27
	for <platform-driver-x86@vger.kernel.org>; Wed, 28 Feb 2024 06:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709101911; cv=fail; b=EiIiKLx73dxS0hJfAg4CBN7ZdRz312EbiosRRRUnaBFlQdDCSyEp6lsFjhBkJ52GNbOvJlhBtG8NuPOVJTYA1LWAOA1JO3wcgBCUhcpU4Dy2a/pe5rWuole4Lq09xBWQ6tCAAlMQUMuz7By1di1rXoGinnCxlj3sO++JTnYKx/w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709101911; c=relaxed/simple;
	bh=C4R9hkELhaRQqISdmPuguK2O4BrbYZbf6DH4lRVHB0M=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=F3sSjNWQFThQlzxLyRTLZnnEpMJ/s1bhgi26Mb1OH9d4vkQNZBEdKTEgTCYfK9bl+cyQvS5oJQxsSYLDd/B9WX8Tvgvnce/iPyr11tyMLTkbRoYGznxKIcrrmQBtQA0HZ/5g85vZl8RpkOMCiL6iiXUDZuR3ubdDmAy/XThESPo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=xYaLyeDO; arc=fail smtp.client-ip=40.107.223.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="xYaLyeDO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kAMdvUFz9/cigYOiyBsHeUmkNkRGMrmblP3as+3Xt6a7uCQXRunc974+m7Vn8SSUTCTi04gGNdELItAoHAcaQni+F72kmdd+FMOQQuK2P90pvoujTh4t4kJdZfP7CKEXTl6MyNBuTLkIfkVXb3zFpiD3hAX7oYMDw14gfR6D+IvFKysfyj7W43r5H4WYmmuaRCuDuII6X4OkeQI9uhilTgzCk7+PFNwkm2PsJifoNqMYrcYuLI01bJZeme95S+OmqrR3RgBShVTzW9JvPmVwymaI3WcvLtX4SOCKLJmkFzA6PKNxKP+D2Q5pbixmv9jnhBGGD32s0BGwrxKDgML8Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6loLg3sG0u9Jqr7DXtbnHIc2AN9WxCBUjEZuKFB4e8U=;
 b=Oe4TDeBXAmUOWUYFzQTa7QJ7dpkCXJVkNtd741frFHKRb0kr5wj/Trvs2crCrf9A2YlkzulqTZL3rnqYz0+SmyK7qzPcMI1BUIYufT7Ea6bko5zqYX2NM3VI5j41WZzRK5BE4SWqLUBrVSVtlZp9+u0hNerFMBoxoQeOuWgpUIEfybefHv3d2vAaUgUBPxEGzvAlV14NQ4mx9o+ewi/PhMm4AQdwDdBgpXoDFJZNZWm4h9N9TlN2uspcrWrIzIYVKo8cpD6joiSioOy/bB9Yc+KGHm55l6fmn2AQkgI5T61gToDnF3+CegnjwMPur1LDYhm4lSD4bO9VdcnnR2zo7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6loLg3sG0u9Jqr7DXtbnHIc2AN9WxCBUjEZuKFB4e8U=;
 b=xYaLyeDO9MPKlGRaYq2tSGbxI/hnB4Q71wJqjSJCqrIKbEJeeJtVs8sj4Hcwd1qAs9GVPZpJYmcBrY6/ZqlXMyIPU9L5swy3yI5vI853GEK078gTfCsgV2NzBnlei9FaTE4WvNGohCYPZHfy2wnFLd68NF+Ytkgo6rrx8fcsu/g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by CH0PR12MB8530.namprd12.prod.outlook.com (2603:10b6:610:188::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.36; Wed, 28 Feb
 2024 06:31:47 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::3476:df27:437c:12b8]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::3476:df27:437c:12b8%5]) with mapi id 15.20.7316.037; Wed, 28 Feb 2024
 06:31:47 +0000
Message-ID: <07cfb417-faf1-479c-a671-0bd8ef3965f0@amd.com>
Date: Wed, 28 Feb 2024 12:01:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] platform/x86/amd/pmf: Disable debugfs support for
 querying power thermals
Content-Language: en-US
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20240227125520.3153140-1-Shyam-sundar.S-k@amd.com>
 <20240227125520.3153140-3-Shyam-sundar.S-k@amd.com>
 <ffa12009-1c12-41f9-ab3b-af9b2c21688f@linux.intel.com>
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <ffa12009-1c12-41f9-ab3b-af9b2c21688f@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0019.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::10) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|CH0PR12MB8530:EE_
X-MS-Office365-Filtering-Correlation-Id: 95231064-b5ac-4859-0d11-08dc3826f063
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	e9U6jkuYikonZwhcKz5oEmyXPjZZzQi9JECronr+8GudCzd609SdyY1GGpRxgePXsJAfHTIr0YYnvS8nMZq8D98Zjlsgau/oUBY6/wN9iCu7MCVDoN53gFnqGAba2GeuTwneNaoIxAR8/PoajbyVYQQS5DhCTwbZZbmkxHyis3tXwhoj70LkQ67zRTLZlMU4XWM2+gJEVuD4n2NQUPr+MBXkXEjsWbuqTveucl8UDW2df/JdmENu+qYvypWxZvDIruXjW6NKKILf+VXZR4z74DaM354d3yUDmWi47wbzuTTih/GgvJBk4w0S+6+9sx8Em/93U4tfA2QG/zcanT3HftSlQ3zDG//2DwiBKP+EPoprPEun/HXc6Z1tjLRJ7W11qIORagxwkI1o372BjsxFqQGUC3JNMP2q30lu1z5frUiOBWvobJfVIVQYkI08cT3SYA9Zg7od/KQl3TVELO7rt/QahDu7l5tWpqsVCUnvolu8LpzYEdfGRtq80DhRf//n3o8duI2LkMdmWVF8LrTYI6FQp8yVXIrsO/lDVSMPWvxe6fnXoonlWY8OFMT9mu5mtI/NcgI5vk4AWEhZlKQZ4DitPEqe9XCLeYoX0kujPzzfyATpIrocUvD/AKe2CoL9XcsGGMuE20RsyWf71GIuRQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a29RaGhPWlZDQkJISHNhY2tOUno2QU85TmMzSFBaYlMwak1VWlF6TXJZbjRF?=
 =?utf-8?B?cVYrYVNyZzNETklhQ2VDbXZKT1pJN2xJbStvd0xaeEYzSGUvV09ibXlHTitw?=
 =?utf-8?B?bCsrWG1yZFg0bzhvTGJRL2lWVGZaeisvOXFzeXVKYTQxVWhrYVFKTzF6TE4x?=
 =?utf-8?B?SWtseXV5UCtqL3V6cEh5d0xENC9NL0RiUEh3UVhmWXhnS2FFa2lkVWhITlEr?=
 =?utf-8?B?RHhmeEFCNzhmcG9LcHBGWEdadTB1aDVneHpBVWJmdm9kMHJwcDBIRE5UMHRq?=
 =?utf-8?B?RCtjaUZwSU9IZ2wxUzNWdUJGMU1CUjdlRlp0UGFORXc3bjJqWDUzRWs1MzF3?=
 =?utf-8?B?TGl6Q0xsTUVhSG4wWGZnYjNJS1BZZ3l6TFd3Qm5DU0thWnZaM2hnck8zS0xQ?=
 =?utf-8?B?dU1xcEQvTXhkYXFhLzh1Ni9CcnRJbm83bERFOVhsN3NqTlZDSCtrcHpJOGJE?=
 =?utf-8?B?Zkk4bjBDTGx6THB5Nzg5c1RkaHVyZEdqQTlSRUt1TGZsaEFlSk4vc1FLcldL?=
 =?utf-8?B?QUhxYVovc0FsT2xRWUlFd2dWbkRlYi9JeTVhcC84Y0RIRVVmQzlDVzZobVJD?=
 =?utf-8?B?VEpjbmhndTY5TGVwK0pIejIyOXNvR0YxMVZhZ3ZLWUUzMm91b2JjeVRMOXlJ?=
 =?utf-8?B?bVFva25BTnJkMTVCT0o0TXJaRHp4dVU4ZTFIb0VLZUFoeUVvNWRVUTIrR0pk?=
 =?utf-8?B?U3VPV0JyMjFhVzRDbTVyWGtCN2dsdFo3ZTJtUGhvUTVUc2dLdTMrKzYrRzVl?=
 =?utf-8?B?dGFWRG5VeU1abFZUSmpIT1EzWXVEVFVaWXhETHc2cDJoampGNFRqT0xyMWJM?=
 =?utf-8?B?Z0ZBODZiemNzT1ZSdmV0a0NSb09QbTNrcTd5QzYxakZmQ0J0TTRudUhiWGxi?=
 =?utf-8?B?VHBicFh2b2Z0Y05GL2grWDVxb0pRYnNaK25wWWtqM1kvQUMvKzFQVXBQYXMz?=
 =?utf-8?B?MFJNOGdpckhYYXhvNExPVjFJVEVNdGl3eHdyWUNyd09Cd2g4c0ZnVm1TZ2Yz?=
 =?utf-8?B?Z2xNNmRHNS9HUzRXbnZmQWNlQlN3MmwyMDJDV0g3RDl1L3BHZ1JvZ0kwbVFD?=
 =?utf-8?B?YWNoME04KzZxMldZdHVFUmxNNitOVDZDdlZGanlDQ3FxYTZtQWdHaVJqTTB3?=
 =?utf-8?B?ZFdtRW5peWEwRFdkeFlRd3JYRzM0OE1kc1RPNjhkTTBhdEp3eVhQbTltaWlZ?=
 =?utf-8?B?bmZjZ01pM1NONzBoRHBYSmtwTk5FSHpFTFF0Um5uVXB1aEVSMGp4RldDUlFU?=
 =?utf-8?B?R0dWZmlpWmFITmQ0OTRYZGtLWEtMNUVvVFBDbnBkblBQamZPWUtUWFdKNWF2?=
 =?utf-8?B?NWMzODR1TDIyT2dFVWhzODB3a08zYWg3SENpdFFrd2piYnJiSFhDVk5tb2hu?=
 =?utf-8?B?d0pRLytOVGQrMlJ3amN4ZFdqdWlLc3dmeHdhWmdVb3hsV2NyYTBrL3lkMWpJ?=
 =?utf-8?B?bUwrbUlJRVBQUnVYYm15MWp6OTRzbHhjQVAyMFlJQ3FJaEcvRXRLY3dGM2hp?=
 =?utf-8?B?dUxzaEdrWlpiZnNaNTlwd25oQ3ZTTjV6ZmwzUUZ6T3ZXRWs4dDd2bkZEYzg3?=
 =?utf-8?B?YkROa1lwSGtSdHVUM3VvdVVBN1lzaWVKdi83bE95YXVrT2o3MjVNcTZmcmxu?=
 =?utf-8?B?N0lCUCtkVXZ1clJvZVhudHNUeTNqRHdmdjFqMVAxWkg5WitneDB6dzZJbzI5?=
 =?utf-8?B?aDYydkRpb0JtRmlpOG9OUGhnZGdrWUFRNWJSYkNGVGRaQWRFR3h3Q2lQNENQ?=
 =?utf-8?B?bDZBRTc0RytWOW5tS244RlA4SVQ1WERsSjF1ZXRSei9BODVXa3dhZnpJenZR?=
 =?utf-8?B?UFl2eGllN3hiSmpvZVlYTUx5UjllVW5HclE5S3BhY1JNOXdMc1FzUWJoWWE1?=
 =?utf-8?B?cWNVQkNGK2F0Z1JNYnhSNGJ0NDZ1ZUEvUHhibTVvVG9kSGJYcUF1WDBxdkxG?=
 =?utf-8?B?cHM0VSsxbU8vTjVVUklyR0VCUGpEdUNtcGd3NGxNZlpqYkRPdXdRNVMxd1NJ?=
 =?utf-8?B?MmJreFpBNnZnUVBTbytKaEVHVzNFdzdQc1JrNVF3cHRKZDVxa2k5ekZMeEhX?=
 =?utf-8?B?bERyT1U4KzJkakYwNEpDMUFRNmFHVFVLS3k5Qnorc29mNWtZSkNobmNGU01N?=
 =?utf-8?Q?pObjP+82yY9BBVzxVhSXr/3PA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95231064-b5ac-4859-0d11-08dc3826f063
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2024 06:31:47.6176
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I/zU+0l+WK4/6h9IRsBQGVCfnbIURlscpT49WdaP7gONGyDwHLidZbErBMF4+4uhakJ8b2CH5U7ctbafN0Yn4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8530



On 2/27/2024 21:25, Kuppuswamy Sathyanarayanan wrote:
> 
> On 2/27/24 4:55 AM, Shyam Sundar S K wrote:
>> The GET interface to receive the active power thermal information from
>> the PMFW has been depricated. Hence drop the debugfs support for the
>> newer platforms.
> 
> Instead of "newer platforms", I recommend to use version numbers.
> 
> IIUC, you don't want to expose it for ver > 1.

OK. I will change it.

Thanks,
Shyam

> 
>>
>> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>>  drivers/platform/x86/amd/pmf/core.c | 5 +++--
>>  drivers/platform/x86/amd/pmf/pmf.h  | 2 ++
>>  2 files changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
>> index 4f734e049f4a..2230bc2b1f59 100644
>> --- a/drivers/platform/x86/amd/pmf/core.c
>> +++ b/drivers/platform/x86/amd/pmf/core.c
>> @@ -113,8 +113,9 @@ static void amd_pmf_dbgfs_unregister(struct amd_pmf_dev *dev)
>>  static void amd_pmf_dbgfs_register(struct amd_pmf_dev *dev)
>>  {
>>  	dev->dbgfs_dir = debugfs_create_dir("amd_pmf", NULL);
>> -	debugfs_create_file("current_power_limits", 0644, dev->dbgfs_dir, dev,
>> -			    &current_power_limits_fops);
>> +	if (dev->pmf_if_version == PMF_IF_V1)
>> +		debugfs_create_file("current_power_limits", 0644, dev->dbgfs_dir, dev,
>> +				    &current_power_limits_fops);
>>  }
>>  
>>  int amd_pmf_get_power_source(void)
>> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
>> index e51ac981af73..4364af72a7a3 100644
>> --- a/drivers/platform/x86/amd/pmf/pmf.h
>> +++ b/drivers/platform/x86/amd/pmf/pmf.h
>> @@ -83,6 +83,8 @@
>>  #define TA_OUTPUT_RESERVED_MEM				906
>>  #define MAX_OPERATION_PARAMS					4
>>  
>> +#define PMF_IF_V1		1
>> +
>>  /* AMD PMF BIOS interfaces */
>>  struct apmf_verify_interface {
>>  	u16 size;
> 
