Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2112.outbound.protection.outlook.com [40.107.94.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A8C15B546
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Apr 2024 12:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712753673; cv=fail; b=kCo30dlaCHGORN6UWLWFdv7r22QIq+M8V+a5FkhYSQDvdOO1C1NRGvD0rl/YDruV7CuA1Nr56cyScHH+6sGFQ0qZ/CKko96YObUuYXk5Fsh1na//Zap/cKISC2jtdjyzMhF9rtKD7OG4JLbeaDEWLKoqF5iGolwWOd9fuZ2EZY0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712753673; c=relaxed/simple;
	bh=Hy7HI2wloPxnwZHD3U4mC9j4JAt4eiUFIlpC+NCag30=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=MMN37jWbHrILj3XKkMiOe5H+Pq4IJC6EZm/UqAjepd/8Kde8USKhiwRstmQFy1kSlE5XYrhxt8hsHtqA3x2gKst5+awNl0tJiu3sgyTSz2DRZG9JBMdwWuKG43ue8LIzSbD213cB1NK1SWcGJyWFFuoNlVYgbyXcKwUnkqJEpQ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=jtT1q8oN; arc=fail smtp.client-ip=40.107.94.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="jtT1q8oN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EheU/1FkgIvHq+9F2UzJHbWzvoeB+32Gd9rUNL6Iw4m9pRZKDIFyny8rxoRITFi8KGlxLxIye68fNaHZzjQ2DQSVkDr0zhbjDcBf+JFDl6Wgv12YXbkaaO/YPFIGB2VkBDpKaLtVYNVRVtp1izSG+93GmWIsuro8rN9kRstdT7tGhO5+J/NkUByfSERidOKHy88BEIi5VIk164MU2nAUHeGdy+zm5tWon5V9FF1G8uRleZTLJFzXicMjJWJkE50KWUS2odM0KK2DqfNVpSqk7F5PoSAGw6UnMtNhqfWT15gAsFUZ3koA65ozO9yNTyrxczsOA3rJKpU8AQNqTj+rWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K0JqEEGEAr+rXnB/46FMftqTxcMG7GnNcrvtIjaJ6B0=;
 b=jlQtIYpL0jtDrIdq//JtpGd2S++Vk+1WTLEDwnFYlXMNRv0Ie5RhCEdVhnbsomKCLftTiYuE34xw2lWeEprl+L6NzkU6TN4PoT/0KnR91M+q2qINVFMVPs7pSd7Qq00d3jnHe38LMF+T/vgxXQ2BnzrSayb8fkibFnMsrwiwtJD5lmpTdcUmVFse5h/b4kgpqG/ex/mkSui9dJAN+HpmTpsjXrtKsRrESi5FbLSnie3e/TPAsqv/JXxpxfFQlC5kBpm1hc6/G32M4j2463D7JHodyI5YlXB9Fa+GHo6uP6YvvoenyU0cDLJJV38t1qAbMn4fYLimqvU5ZJjxvfzF0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K0JqEEGEAr+rXnB/46FMftqTxcMG7GnNcrvtIjaJ6B0=;
 b=jtT1q8oNW3YzNnRCleilY8BWFSlSCwPcu/HGJAZgSUqGWiD2zghdCOkd/N5zzBjM+6nVkuCUx03YZIIn9Ri4PsfYQpqsKDva/mhZriQ04Cz99BWLl/dH8qOmQcMlwj0/DjrdjkjfjtQ1/OvjVQB3OZRSaRCRewab/0vPV53omyc=
Received: from LV2PR12MB5966.namprd12.prod.outlook.com (2603:10b6:408:171::21)
 by IA0PR12MB7529.namprd12.prod.outlook.com (2603:10b6:208:431::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Wed, 10 Apr
 2024 12:54:28 +0000
Received: from LV2PR12MB5966.namprd12.prod.outlook.com
 ([fe80::f84f:ef3e:cbb1:9c6c]) by LV2PR12MB5966.namprd12.prod.outlook.com
 ([fe80::f84f:ef3e:cbb1:9c6c%4]) with mapi id 15.20.7409.053; Wed, 10 Apr 2024
 12:54:28 +0000
Message-ID: <263b7201-7796-422e-b067-f83b2b645ae6@amd.com>
Date: Wed, 10 Apr 2024 18:24:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/amd/hsmp: Remove devm_* call for sysfs and
 use dev_groups
To: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
 Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
References: <20240410121746.1955500-1-suma.hegde@amd.com>
 <9e1605ea-147a-4b17-b4e2-692b34926bf2@redhat.com>
Content-Language: en-US
From: "Hegde, Suma" <Suma.Hegde@amd.com>
In-Reply-To: <9e1605ea-147a-4b17-b4e2-692b34926bf2@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0198.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e9::7) To LV2PR12MB5966.namprd12.prod.outlook.com
 (2603:10b6:408:171::21)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5966:EE_|IA0PR12MB7529:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	B0mJz3GMPMi5ba8scN4nCUcmpZxuBRQsLIfBT53sen+Tjt+g8e1zoYVcAd21MGmsggn2Fj4zvihrakS18Otfv7hNhVJZZ14gKoeXd5ObjG9EAUhsYJElGcRlT4Ofw2b/kkaUgL6wSYfeVrsNQC+jsPNO+4unj/D2dDCqREi/+NOBoeeyRlUpR2FLU94zB5/lzLNrS2m8sR8WDoOvRUJiN2JzCG79ZZFXe5XL525GQgfN6vyBChq3bJ3m+zVZW9E+lrIHBOTKqgqO8o9GSzJAO8uqw0oCTqlo9zOB9f66HIXbZuO+Rr79OfR1VdUtKRHni1TUDtuINX820rmCrm4BxHwhRXDmodrBavHnureQDbs1xRgBiSrqTh8xBKSp3yazDKU2HCSD+vi62O4rKsFb24KSFh8BkphwwVdEInHQpIS+ZQoQqCqgnbeI0H4MKQ0r9xjBr9jjLqv/0v0lRLzoZPj6S7ABxYJSX4QaTMOBMJXtLhMokAnzf2yvDcq0vEYTOei95OdaDxlJNoBBux5C1vShlFhrIgoJqdweUx89P3DBRNbO3wIFVzlJoP22qlfSAN1ONYzZx5hJosz2qLEg9qdd+29nvyZUWD31Wx0MVtR2m2hH/XMgABTrDfGKdyGXyyvslL5our25O1SogRxK9Yq2T4vRanxN41OiUaned2U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5966.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WnVMUDBTMThiRXAza1FZU1dpT05IZ3ZGSStWZ25waC9pWDdwUGdIVXEza01I?=
 =?utf-8?B?U0JKOHlPRmVPbVJkbTBQdStrRGtRQUJVZGxtNmxGQktabk9KaGM3a2oyaWZz?=
 =?utf-8?B?ZDA0clVGalZDMk9wL09zMlg2N3BSTGhCVjZZc2I0cG5lTDZ6WURWcmpiNU4x?=
 =?utf-8?B?OHZTT0pKRWcvNWt0T3V4VXVEb2tFWi9vcnk1VXVkL0dJUUFWUS9XR1BBMDRU?=
 =?utf-8?B?aXVyRFVhZTJjOHM2NHdFL3Z3bHIzZWRFdU9HWHROWlN2OS9YQkY1TnRENFpN?=
 =?utf-8?B?NlRpQUFEYzlEWk9oM2d0QXZwYkZXSmVQLzZYY2h1TnhJTXZTY0tpNDY4Tm5t?=
 =?utf-8?B?V2tjMnV0T3pabGVDajdZTEJKYW9ySTc2VmNSTG1OcktaN0UxdFJxUmFjQ1RV?=
 =?utf-8?B?Z1dlcFR1bWtHUVE1ZE9wcXRlbXdYWW56cVpyUXNmb0NnTmNFMUF6MnluMVRE?=
 =?utf-8?B?NjNSb1RjQzJ1RFJZOENyV2gyU0tvRGtLK0U2RVczYXlkWWphUVRKeDNsb0da?=
 =?utf-8?B?NmRUYUVTV2JldkdZeGZQVDVvNENlalFlM2hNWlpMTGhvb0VVK3VtY0NrQUZw?=
 =?utf-8?B?UUxVdEZRa1laVHppNTFZc2JuNUg3VUZoQmJJV3lqdktVYzVjYkZMZGswZTQv?=
 =?utf-8?B?N2pXZWs5eFZvMmI2dFdUUnBrdW5Eb09QdFFVSnBwOXFIYzdycUJ6dWRTYmtD?=
 =?utf-8?B?S0F2dUVmZWZhUEhWWjB6Q1V1dENWeStHcmVJM095eS9YOHVGdlhiODJxbFpM?=
 =?utf-8?B?VkZ0eWxqODZYNXlxZjdtRzZlTlp6ajFlQW54WVlPaFZwWnpnVVV5blFQdnlp?=
 =?utf-8?B?bXk5YUxtdU93WXZCQ1gzWUFDTU14S0dnK3lGNTRRRWxnaEdGMk1VcDJDdXFS?=
 =?utf-8?B?UUdLS2Z3S3lTQ3pqcWpzajFETjJrYTNuRlI5K2NvdnZNMDdXNHF6QlNVVWZO?=
 =?utf-8?B?aTZWUDM3cjdUQm1VRHJQWk1icjBKYmhYZzhHZWRjVG9TQzVUVjY0aktGN280?=
 =?utf-8?B?bzhueEdPUjZkcks1dzRDeVkxR01kUHA5N25kbU1mcU55cjRDSXhsWXRRUlJZ?=
 =?utf-8?B?YThXZThiMmJPZEt5RTQ0NWVLUWI2WWwySW0vTTdrMlczdFgxOE83cEtFTU94?=
 =?utf-8?B?bGhEVS9odWwxR0lLczQ5cnVEUXlodWVJOFNXQzB5RXY1L2hHT2V1bFlzY1dG?=
 =?utf-8?B?UDlLNkRzeGx4eDRmQlhtdEZGK2JxYnpuekVxYUlhZ3hkU2FuTEJiMTlsK25h?=
 =?utf-8?B?dFYvYW5ZZGtIM2k3M0lNLy9yWk5pRUpScERLZTF3NjNud2s0VC8xdkdZaS9a?=
 =?utf-8?B?c3AzalBSRlhCNXRnbjdlN2JKRW04ZUpna0ZhcE9mWnk5RzRFaUtzM3J5R2Rk?=
 =?utf-8?B?Z3BKWFAyOEE3QlVxY0pBZnVpa0M2OFZYK2RoOTNsTnB5R0ZmakxEMjZ5Vnpy?=
 =?utf-8?B?MTV1RGt5YXNLTjBweDh4cXd2ZFc4YkdoMnBSalkvQzNXN1lQK1FHTWo0dkZ0?=
 =?utf-8?B?QVJ0QmwwNytYRi9iTUF0NTN2NW1XbkVGcFE5OEcrMHhiOVhBMlREOXFlNC9I?=
 =?utf-8?B?bmhLZlZxQWN2RC9SMlVtbEFCM0swdnFZV1U3N3dJYVhGQ3FnYkV0eS9TS0ZG?=
 =?utf-8?B?ZWtYUmJhUXJjalk5Y0dEQXFsM3pZSCtsS0JJM1d2dk5TTEdWajRCMEZ0N3dB?=
 =?utf-8?B?bUtScHpJN21qcXZ2ZU1ZU1lGZEJjOWJTbWppdER2YUFlTFZUWUF5U2wwS3RC?=
 =?utf-8?B?TDRUOVJoSE8xVSt3TWk3cWFkejFwOVBHZkZTbHBmcFBGZS9US3FpckxsMXNj?=
 =?utf-8?B?QWY0Zk1XbTFESnMvYmh1Wi82NkpsNjFtRkRsL3ZOc2FtS2lxTFEwZG94MW0r?=
 =?utf-8?B?MlJOaGRVMmIwRUpNdWFtZWoxaktXQ3RNOWlydXk1S1h6QThQWTRJQm05cHll?=
 =?utf-8?B?d3AxSVZ6bWp6NzFoalRRc21PeWRocklORWh0SFRJM3ZPZkYxYzFNbWc2bTRj?=
 =?utf-8?B?SWllQ0Z0b1YwSDJLSThGMzFUT0l4cHNBQUkxYnErU3hHMkF5cllSRlpUK3N3?=
 =?utf-8?B?STdLUHAzdWRLd1V0MHYweU1YbTZYWmI4eXJqTXlUdVc3aS9DT0lOM1FSVHlB?=
 =?utf-8?Q?wtoGbTszVeOCj6UFDt1+ni4i1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 156f7f80-b7b1-4829-ebd5-08dc595d5b70
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5966.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 12:54:28.4112
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1TM/QUqk7dpPEQVN5HqBbEUFAxj/97fJz1RJlDMbAaXpSboh/7/LzLdds02qtbCuHBmOLEq24ow/6C1S5XC82w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7529

Hi Hans,


On 4/10/2024 5:54 PM, Hans de Goede wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>
>
> Hi Suma,
>
> On 4/10/24 2:17 PM, Suma Hegde wrote:
>> Instead of manually calling devm_device_add_groups(), use
>> dev_groups.
>>
>> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
>> Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
>> ---
>> This is based on the suggestions from Hans de Goede when Greg
>> Kroah-Hartman had suggested to switch to use device_add_groups().
>>
>>   drivers/platform/x86/amd/hsmp.c | 23 +++++++++++++++++++++--
>>   1 file changed, 21 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/platform/x86/amd/hsmp.c b/drivers/platform/x86/amd/hsmp.c
>> index 1927be901108..d6b43d8e798b 100644
>> --- a/drivers/platform/x86/amd/hsmp.c
>> +++ b/drivers/platform/x86/amd/hsmp.c
>> @@ -693,15 +693,29 @@ static int hsmp_create_non_acpi_sysfs_if(struct device *dev)
>>                hsmp_create_attr_list(attr_grp, dev, i);
>>        }
>>
>> -     return devm_device_add_groups(dev, hsmp_attr_grps);
>> +     dev->driver->dev_groups = hsmp_attr_grps;
>> +
>> +     return 0;
>>   }
> You are now modifying the driver struct while the driver is being
> probed(). That is really a bad idea.
>
> The idea is to assign a static set of driver groups directly in
> the driver declaration:
>
> static struct platform_driver amd_hsmp_driver = {
>          .probe          = hsmp_pltdrv_probe,
>          .remove_new     = hsmp_pltdrv_remove,
>          .driver         = {
>                  .name   = DRIVER_NAME,
>                  .acpi_match_table = amd_hsmp_acpi_ids,
>          },
> };
>
> And if you then need certain sysfs attributes to only be shown
> in certain conditions add an is_visible callback to your
> const struct attribute_group, note you can use separate
> is_visible callbacks per group to hide / unhide the entire
> groupin one go.
>
> Regards,
>
> Hans

Thank you for your response.  We are dynamically creating groups based 
on number of sockets available in the system.

The number of sockets in the system is known only after hsmp_plt_init() 
call. Hence I couldn't add it in

amd_hsmp_driver structure.

Now that I came to know that its a bad idea, I will check for other 
possible solution.

Thank you,

Suma

>
>> +/* Number of sysfs groups to be created in case of ACPI probing */
>> +#define NUM_HSMP_SYSFS_GRPS  1
>> +
>>   static int hsmp_create_acpi_sysfs_if(struct device *dev)
>>   {
>> +     const struct attribute_group **hsmp_attr_grps;
>>        struct attribute_group *attr_grp;
>>        u16 sock_ind;
>>        int ret;
>>
>> +     /* Null terminated list of attribute groups */
>> +     hsmp_attr_grps = devm_kcalloc(dev, NUM_HSMP_SYSFS_GRPS + 1,
>> +                                   sizeof(*hsmp_attr_grps),
>> +                                   GFP_KERNEL);
>> +
>> +     if (!hsmp_attr_grps)
>> +             return -ENOMEM;
>> +
>>        attr_grp = devm_kzalloc(dev, sizeof(struct attribute_group), GFP_KERNEL);
>>        if (!attr_grp)
>>                return -ENOMEM;
>> @@ -716,7 +730,12 @@ static int hsmp_create_acpi_sysfs_if(struct device *dev)
>>        if (ret)
>>                return ret;
>>
>> -     return devm_device_add_group(dev, attr_grp);
>> +     hsmp_attr_grps[0] = attr_grp;
>> +     hsmp_attr_grps[1] = NULL;
>> +
>> +     dev->driver->dev_groups = hsmp_attr_grps;
>> +
>> +     return 0;
>>   }
>>
>>   static int hsmp_cache_proto_ver(u16 sock_ind)
