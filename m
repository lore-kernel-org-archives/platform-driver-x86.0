Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2074.outbound.protection.outlook.com [40.107.223.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 922CD6773B
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 Feb 2024 11:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708429654; cv=fail; b=R9MnzE9fKf7k6MQ4HWnfMZbowUWyHig1I9ejrQzWA6e/GHX8njYA3yDUvXL7NW/gfdpmqcMRRw9hjsd7bVrfoJ+muMYdPqS/1Di7pPcDVotpomaGU3yK0/KR2HVVy4/T2ybZOXlNuI8jSrlphxaDe5O9V8ZqLiq9zBCm0b4gm6E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708429654; c=relaxed/simple;
	bh=m23/5Mj550EulzCYIpcLgeplBMpyCr/SEA3w0nHrlUQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KWLb3YDgJLsLha+JCPwwS3UdZufG/Vo62r7nxkWXLAA+qk9oX1q8qtT8d1oqacRLB8H4H8zbbele2tqki/HyX7pZz/6OeDa+BoRZa2BbsvkKlnTl49trwYsEdYdLC6C0GehOtyVgkHxXEuUT2O/DEkfPMrprrs7vv2QN/Hul3P0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Y1ue5fqO; arc=fail smtp.client-ip=40.107.223.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Y1ue5fqO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XgqOpsqe+ceOI4hnGcIS15oVygepG55Nay2cTPQKGllbyey46pyL+4uR6htQRlVY3joKedY+VmXP7xwYq1cR4TbpOIWqvzwbn976NUjBHwCnVe2Fr+W+6lBAq0Fe+T/C9jFLzIaWrdEJ/PEo+Nm0n+thcOb+rApAOG/kSx+xx/GAI7bsTcuJCm52YlJ7+u0Uaymn1RhYxeHdKJCt5tVjetNjllE+5kZL5MPRrPmHUGuPeXSpGWBMa0jGtyQS8VSYdh04VWKEshY3/VeECIUYQU483BjjBaS02TpgubqyVwl5hEoJoCcGCIX4xeiCfnDuFLQd4IzUMUOUwDmG3M457Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zl1xKHRUiJfjVPHy/T7qSYvAoBsKsYWFeQ1BVFrlzQw=;
 b=iuG8pnLpLLoOsim48cDa4iIiF0GRte/MVkH5GW388qHgBFpb1KU8dCzlLZLaTeRCR6u1I1a20aR4pzEToEOU2Wa76kohFkArGtM9IbSHPWBpu4tdGNM/RAnoOUQNzFCNlIWRuMxBv8EqgeFJqfsjlAlLl8lA38JiCSOpqYmfrpG6ZGD0MhvFpgpHOWsDjaghTkLYWq2KVcHEC/poXObrVLWpVcqKi0sn3YsEzXfSEa6K63swDqu3qWpt76kyJPWZxyYiYSVyFC4aqKdc06Ulm/ostrYET3NCWRINisyGlxJDQqg39VqUstW8TKzhpXNNnptx6qLuAKz2fGF+PSLBRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zl1xKHRUiJfjVPHy/T7qSYvAoBsKsYWFeQ1BVFrlzQw=;
 b=Y1ue5fqOwjMGXkb/RX4FscXjtzdJtTIA3eCwBpLoHLipww8sFe9QGRvsXNys5VwOGZKex9GTKH4iGWTbV2cFBW3rHUlP61Q7nBXjRRhcS4ux2/9eRUFH5TNCUtUKOPU3uNr+9VEZIIbo1CZcxEQFpYV4Jl5IuyTjSwP2mu190CY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV2PR12MB5966.namprd12.prod.outlook.com (2603:10b6:408:171::21)
 by LV2PR12MB5967.namprd12.prod.outlook.com (2603:10b6:408:170::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.19; Tue, 20 Feb
 2024 11:47:29 +0000
Received: from LV2PR12MB5966.namprd12.prod.outlook.com
 ([fe80::f84f:ef3e:cbb1:9c6c]) by LV2PR12MB5966.namprd12.prod.outlook.com
 ([fe80::f84f:ef3e:cbb1:9c6c%4]) with mapi id 15.20.7316.018; Tue, 20 Feb 2024
 11:47:29 +0000
Message-ID: <5f83e11d-130e-4f80-8663-344e6104f8e5@amd.com>
Date: Tue, 20 Feb 2024 17:17:22 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform/x86/amd/hsmp: Remove NULL dereferencing code
To: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com, kernel test robot <lkp@intel.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
References: <20240130073415.3391685-1-suma.hegde@amd.com>
 <20240130073415.3391685-2-suma.hegde@amd.com>
 <4781fdcf-8a7b-48fa-aa4d-6e7bb7d56eda@redhat.com>
Content-Language: en-US
From: "Hegde, Suma" <Suma.Hegde@amd.com>
In-Reply-To: <4781fdcf-8a7b-48fa-aa4d-6e7bb7d56eda@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BMXP287CA0020.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:2c::28) To LV2PR12MB5966.namprd12.prod.outlook.com
 (2603:10b6:408:171::21)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5966:EE_|LV2PR12MB5967:EE_
X-MS-Office365-Filtering-Correlation-Id: bb000e5d-c1af-4996-ce18-08dc3209b794
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FJ+ip14b4254Qp/6gVPF6NLuhT0RPLlJCO9lVm4XiZFTW8/tRFpqBpq4ydHymD5z91648jsafX1fmhgYFHQ6a60pnp/r5r79CP918QQpV1m4XKGM213pcC8/+UriEG3yRAMtIp7abpAj7DQAn9GD2FENftzfY4fmuKXfIU64jBLGYqFRc83K9UN10eoUAsTSolYm1ZNgXiJkUU6B8ZRYYEwqoi+YXcO9xEWJ3XitVxqkoZPsZM/cuxAJNv4Soe5G3XL2i6TpGzz1H7YWjthAdryvKYRLnbdboJgX40Amz5pIuiPqkVWnGSlnE+6u1qJFpHD8+xstDrhohka20Lb1dOGhd0yJCmnRV4IGsaNVJYnnzox+ZSWHAT0nNVd0hb5Cn4Ee69PuoYm1XK/TN6Zlz4D95gzU0Y1NiEEuO1q/OmIlvoKGFPZ7Jxo3PGDO/L69i+pSeRv73t0HHr02J1LTvyEagwUFUlZNkA9wA7BzbIgmcU+zQ0v62hYfeSyHl9o8oRG7emRrnVmHaVf2H2ZCXA5qffz1im1M46QVS7vuBgtjlYzaS36w1VIm5WUQr21s
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5966.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(230273577357003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U2Q4aHd3QWxvTG0vRDRpTjlrS2xwRklCVkNwbkJiZEgweVN1cjFzdDRYY1o5?=
 =?utf-8?B?eThOZGhsVGZNeGUzRHhibzhrS2VUaEQvc2hkT09qZlgybk96bmlHRG9BT1R1?=
 =?utf-8?B?MUcrVndhVmJJT3IzZGRERlpCUUNBbmNkcGdnM1FMYVJuSEFtK1dVdSs3UTdx?=
 =?utf-8?B?eW52YUpWcmpPRitEM2pSbjN0bVJKSko0U012eHM5WGJEcnh4dFdqTmZnQTRa?=
 =?utf-8?B?dnZTK0xzOVBQODNjNTRML3ZVZU9oNjJwcjMyZUhtVkVPdUlON3M2TEg5OCtU?=
 =?utf-8?B?QWlJMndUM3VhSjJKcnE2WUgzKzNKN21qUEQ2REZ3S3ZUYU9ndHRwdU43eFpw?=
 =?utf-8?B?S0FGQzNmUlh5ZHJrdmp2VnVxNkh1bWtmNlF1cEx5NS9MRkxRQjlITHdNM29s?=
 =?utf-8?B?bHZXL2tRcURvcWJoNXBFZnA3SzRLQ00rWjRwa0EvK1lrWStpSVFtREtrVlpk?=
 =?utf-8?B?TUQ2VkxhZm5pZjBCWDVHOXVLN3JDK29CWFhyUldORTVjN2NuS04xckhnN2dt?=
 =?utf-8?B?a2ZXU3lISm0yU1FIMHVkS2NFMHlGdDZQbFQvakw5Z0lWVkNxS0NlaC9hQ00z?=
 =?utf-8?B?S2R1R0EvMktvVDZjZXRRK01ySWY3UGREeDlNaWNSc1I1YVhMM01Zbk5renNV?=
 =?utf-8?B?UHpvZk9iVjVuTHVVdWRrR2srUm9QRjFmMTJxVnlLVnRkVnUwRC9DckIrYWhx?=
 =?utf-8?B?QVVOQ0tKRVpFVUw0Rmp2bE51SVdPZlo5YVNZS1RBaG5iNkRFV0JEbzhRMHcw?=
 =?utf-8?B?ekdGNWpNeHZVOXJnMFR0NzlMMzdoVVJid2QvNkdnaE5qS2IyTkM3TnVxL0Ji?=
 =?utf-8?B?L3Vkc0RtUUpnU25FMG1oOUpFTG9LQnBtOGNGelllRDhLaXZkeGhpZTRLUVlw?=
 =?utf-8?B?aG9rbUdNdmZiQkhrdVZORUkrd1JVSklpVCtJbElMTzdoejdpOWFZNGYrSTFG?=
 =?utf-8?B?OHNoeFJTUWxXOXRPaGdMdmlMcWVXTko0bTREOTJzRm1Hamx2QndmTlhXdzVm?=
 =?utf-8?B?WndRRDlNUE9LSG9HckxROHRFNmV6bDhwMlBjYVpCeU8zYVVOTW9ZcWlWdVZi?=
 =?utf-8?B?NWdVekRmaVZ6YlYyR28zZTRwelFIZUtmeUVLZlg5Sk4zaGZWdlBIblNhN015?=
 =?utf-8?B?UFZHWkpTV1AwN3hpSUtkZVBLZTJkcmlMYXoxZ2dZRXllUVBVYkpQSFVhSDR2?=
 =?utf-8?B?a01aOTlxb0pwWHhSb1dVNGwwbytPaDRReEw3dS82UVNOU012UXRuRk1SOHIz?=
 =?utf-8?B?ZVY1dEU2MU9HVmU1bHg3KzhlSklHcWJSVFg4QjlvNGQvTHBoM0oxYlJzUFpS?=
 =?utf-8?B?bXVwZE5CdVl4WlhJcFN6U1l2UFVnVFlJSGdzUDBuZnVMZnF6TjlBcUpWamcv?=
 =?utf-8?B?OVY5SUpFcWxucWY1L29oMW5IdGRkMWpVQkJ2MVoxTStMUDA1S2ZLZ1psL3V6?=
 =?utf-8?B?WkRoZXZVOEtBazNPRDhicGVXMTdDcmwyVUNhdFgvY1hmWnBZOVhhKzJXNm5y?=
 =?utf-8?B?RlVZempMQXA3aUNudXVoZzZETFgrOWx4VFdwSnEyS0FuSnY4d3JEQjJvc3BV?=
 =?utf-8?B?OEdkOHZVNU1EM0FBRi85RmJzS0ZvSklZUnlDSnRoSFI1cnlmRFlNaGZPYmRs?=
 =?utf-8?B?dHBZOGt3dXNSTjhIRi9aMzZwbzliL3BOSlVDY2djOCthRXd2bFZYM1BSYzRV?=
 =?utf-8?B?ckJqMzVKOW92TEx2cmpDK3NPL201N2RQYURPTFdwQVh2VC83RzRwbHEvWmNp?=
 =?utf-8?B?cm42VWcvT253VjhZQWphY0VFOFc5cjhaOWdzeXMyOXpldDFySXphQ0M2VjBV?=
 =?utf-8?B?cTY2cjYvbEYvVDYxcXFlQzU2RzNSaFVnaUg5N1dVcXhpamZwM0pzZUZsdnVv?=
 =?utf-8?B?TzJiZmRWWVl1cjdBcTBCU1FIeGh6bVhpdCs4NGxYR1FmTnZQL08yak9tSzdP?=
 =?utf-8?B?YlNIcitkbC9KSWRaalJqYTRXYi8zSzJjTy9xWk5OWU5JaC9Ha3IwbHpuT2VJ?=
 =?utf-8?B?cDJSS1ZwTG1ReDZlNWRvZTBWTnNJVHU4bkpEeXVCczdIL3QxYTJ6bzFNejly?=
 =?utf-8?B?Q2UxRzlHNGE0WXN0SldOcytERnVzUnpDb3I5bmNCK3dEWHRmNG4za01ycGk4?=
 =?utf-8?Q?vAlWsMuJQwriPpmuNgLKvAeD0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb000e5d-c1af-4996-ce18-08dc3209b794
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5966.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2024 11:47:29.8670
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E1a6V1Ng3++arpRmyiqIWBTHJ+mwDNSc7HPAO/LCGo3t1fqaH8N0YERl7h7JBfQRRQFQHWc7zTcDKFv+6/rAQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5967

Hi Hans,

On 2/19/2024 6:18 PM, Hans de Goede wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>
>
> Hi Suma,
>
> On 1/30/24 08:34, Suma Hegde wrote:
>> Do not log using dev_err() in case of !sock, which causes null pointer
>> dereferencing.
>>
>> Also remove unnecessary check "boot_cpu_data.x86_model >= 0x00", which is
>> always true because its an unsigned type.
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: https://lore.kernel.org/oe-kbuild-all/202401292056.qkUFS09Y-lkp@intel.com/
>> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
>> Closes: https://lore.kernel.org/r/202401291311.gzMCj6SP-lkp@intel.com/
>>
>> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
>> Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
>> ---
>> Changes since v1:
>> Correct the email id for Naveen Krishna Chatradhi.
>>
>>   drivers/platform/x86/amd/hsmp.c | 11 ++++-------
>>   1 file changed, 4 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/platform/x86/amd/hsmp.c b/drivers/platform/x86/amd/hsmp.c
>> index 1baddf403920..1927be901108 100644
>> --- a/drivers/platform/x86/amd/hsmp.c
>> +++ b/drivers/platform/x86/amd/hsmp.c
>> @@ -566,17 +566,15 @@ static ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
>>        struct hsmp_message msg = { 0 };
>>        int ret;
>>
>> +     if (!sock)
>> +             return -EINVAL;
>> +
>>        /* Do not support lseek(), reads entire metric table */
>>        if (count < bin_attr->size) {
>>                dev_err(sock->dev, "Wrong buffer size\n");
>>                return -EINVAL;
>>        }
>>
>> -     if (!sock) {
>> -             dev_err(sock->dev, "Failed to read attribute private data\n");
>> -             return -EINVAL;
>> -     }
>> -
>>        msg.msg_id      = HSMP_GET_METRIC_TABLE;
>>        msg.sock_ind    = sock->sock_ind;
>>
> sock gets initialized like this:
>
>          struct hsmp_socket *sock = bin_attr->private;
>
> and bin_attr->private is setup before registering the file
> and thus it will never be NULL.
>
> So the correct fix would be to simply drop the check
> rather then to move it.
Thank you for your review comment, I will send a patch to address this 
change.
>> @@ -739,8 +737,7 @@ static int hsmp_cache_proto_ver(u16 sock_ind)
>>
>>   static inline bool is_f1a_m0h(void)
>>   {
>> -     if (boot_cpu_data.x86 == 0x1A &&
>> -         (boot_cpu_data.x86_model >= 0x00 && boot_cpu_data.x86_model <= 0x0F))
>> +     if (boot_cpu_data.x86 == 0x1A && boot_cpu_data.x86_model <= 0x0F)
>>                return true;
>>
>>        return false;
> This bit looks fine but this really belongs in a separate patch
> as it has nothing to do with "Remove NULL dereferencing code"

Ilpo has already merged it into relevant patch(platform/x86/amd/hsmp: 
Non-ACPI support for AMD F1A_M00~0Fh) and the change is available in 
review-ilpo branch.

> Regards,
>
> Hans


Thanks and Regards,

Suma

>
