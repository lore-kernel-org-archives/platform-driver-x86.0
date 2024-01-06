Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2045.outbound.protection.outlook.com [40.107.94.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD02F15A0
	for <platform-driver-x86@vger.kernel.org>; Sat,  6 Jan 2024 02:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="dBYaUiJY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RrO3p2Q88wuy9zrgvB4DV0OSlyyMEP8mQSgBV8P0Yxr98sY+B7hrrI/v3TiJBCePfc5LmAS+Xri32x9WrhHyu2qAMxMgajC3GOCNRpUoiFZ9pNiKsxr7tMuhAQwtj/5IW355ODi0vbyNKyZ8HrcNnT1A8R6K+Z6ZTKCLuvp8IZ43ZaCCR/nhVUCSfhG7VJl5+52BQyFR+zNKQ3x2jFK00dRKIfXh92+aBbPC04JrzMd/4fztDRAjDASf9DqQPWbdkaGHfnVhPwvyHCIYC1SP+POmrWNADnQ51TqtktFt0mYwEzgTKPkQ22MFx+3TjQVFtf95F9uq41KSby25WYI5iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bgbViw2xB58F3fXvniymH/1qmRcZ0nQKMESkEjGT3hs=;
 b=nWbL2/0d9ok/7rhSToU8EFrbknMJxVt41T70TW5nWH4EWA74iY+fs72mESsRbfdlUYg6rntknLasGMttTYdhs8kwFPhMmXX+OTOaAvwJKaBLg2iwtE6Rub2hsLbonJgupETPYdKoWPwhPiC3TKqaFdZEp0Vnanrf0rZ+NwpcZL8wyjo2xtqRsCTAV6HUhDVHFTXqenwtbim5wkZ4lQCA0FiUr71UWiwxnYbUcVhSXPvJA+abEHqFlfqlc0hFImayXElc5NynyJJFUDp/UliCWl+A2HU1By+fO0SHcnG+TJudwkCVdLvexnRA/hs+UOFDbXQSGW88SYOPqf2S4HCl7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bgbViw2xB58F3fXvniymH/1qmRcZ0nQKMESkEjGT3hs=;
 b=dBYaUiJYRYfptE/WIeMWSSYQvpO2Q0eELO+/Ul1K3WOFHaSm3mPNFLjjAIiN0uB5YTCcR5t9QCEy1HdBbIGVi876sKvrPRBbc8kTiV22OA0G1QLG0I8GbsZ1z2ewodcMGO1+DdhCN0canjCmmKQRpKakmOdrQQYNDeoOm8YlRx0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV2PR12MB5966.namprd12.prod.outlook.com (2603:10b6:408:171::21)
 by CH3PR12MB7498.namprd12.prod.outlook.com (2603:10b6:610:143::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.17; Sat, 6 Jan
 2024 02:11:13 +0000
Received: from LV2PR12MB5966.namprd12.prod.outlook.com
 ([fe80::27d5:9024:445e:5c45]) by LV2PR12MB5966.namprd12.prod.outlook.com
 ([fe80::27d5:9024:445e:5c45%7]) with mapi id 15.20.7135.023; Sat, 6 Jan 2024
 02:11:13 +0000
Message-ID: <cce78161-f972-4782-af8d-27e3f4e75c17@amd.com>
Date: Sat, 6 Jan 2024 07:41:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/9] platform/x86/amd/hsmp: Add support for ACPI based
 probing
Content-Language: en-US
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 Naveen Krishna Chatradhi <nchatrad@amd.com>
References: <20240105074618.1667898-1-suma.hegde@amd.com>
 <20240105074618.1667898-7-suma.hegde@amd.com>
 <8f6cfe66-77c5-d6fd-797-13a97ff94f5@linux.intel.com>
From: "Hegde, Suma" <Suma.Hegde@amd.com>
In-Reply-To: <8f6cfe66-77c5-d6fd-797-13a97ff94f5@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BM1PR01CA0150.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::20) To LV2PR12MB5966.namprd12.prod.outlook.com
 (2603:10b6:408:171::21)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5966:EE_|CH3PR12MB7498:EE_
X-MS-Office365-Filtering-Correlation-Id: 6dd4505d-9d78-4844-32c6-08dc0e5cc1b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ja/KcdENUO/jwYcS8hqtgYa9iSLeqO6PzPffirQQIpJLdBYgiOUC1k3gHFJeCMEz8XLKSFsyRP1mc4mUMTAEFtRxtCpfU+z8vAs91eNCSEWhmC1Cu9UdXINlMtSeO1U8UGdFL9xPJh78UTjnUcWVkqmpq5ZoSjN/Zio+YOVbGYL48S79euoHUAq7OsdfgZCuhWqeBnL4uBKQCqZ/sHr8kNEsgmVu92503cmH9PDykKeMlBiQe+h5xxKYN+FWiQUBWUDIo5phQqRadJqXEJbeSRJpuTyacgCdF+U7HbgkaXrSz66GNFSesC7KpPS+bp2txONecQ/3NEF3nYv8D7syDhlydmVfWBZY1rU2lZGVOdWhYVzAiEDebmCKT9U1N6wdPoibeJlwJkVNcZZmKo7+ZdFQr6HsDUGiC2o6m/XxvnfaOAIq47mXT11oGdZGGEwya44JzbuZm7grjpyeKybsyMXeyhEiOt8XdY3+I0iQN/ZKxESnXzrKrlgdqXRmoL7VtaajYIWalNfG6SVwsi1uFtLBdPsrs+Yvkbr1xv/wi+/ZTudI1c0KsTb9X1ANpv+pvZAFX2hoYtjdr21U+bSZs2W/D8IjM8xlKmiiIksrkzuuL72pa0qhD0Ks2/OgUUpmt0r/vtr/zYMMpxqYH4ZAJd4BdH62BlNp+ohEQjfFdG2Ip4gAV99LMhfrBMFr8Y4p
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5966.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(136003)(376002)(366004)(346002)(230273577357003)(230173577357003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(66556008)(8936002)(66946007)(6916009)(8676002)(66476007)(316002)(54906003)(86362001)(31696002)(2906002)(41300700001)(5660300002)(36756003)(4326008)(6506007)(53546011)(83380400001)(31686004)(6666004)(2616005)(6512007)(66574015)(26005)(6486002)(38100700002)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OXNEaHJySUZ6OFBKNjR3bWdOYTRLN0E4WjY5WHU2Uk5BbzZ1VjloM0d4bVVh?=
 =?utf-8?B?NFhrVHg1RWVxSVlKc0RZMENRbjEySHpKMHB4VGkyK1RtTG9YVFY0T2V2R2xY?=
 =?utf-8?B?TUhoOTdtekw3QzFoVUsrL1BwbDVxYXlleStibi9MSUZqOU1QdEJEOUMyalJX?=
 =?utf-8?B?aHhaZzR4THFCQjdKZDZuZGJ0ZmxQUktSNVVjME9HK2g2N1p2Tmd3ZHJHU215?=
 =?utf-8?B?QVZXOGNVTVJQR3hxQ1BLc2ZZSzJsdTVBYVJXUXpxKzZwZklLREltWjZkUm1j?=
 =?utf-8?B?QVIyRzJpM25RK1RLUTRqay9vU0YvLy9NbDIwRjV4NGZFOVNzUmVwNHVYVWxs?=
 =?utf-8?B?VVdLLzRIS3dzelBwOFowV0NKd0lUZlRoSkRuYmpWZ0Exa1dxWURzekVBbmxP?=
 =?utf-8?B?L3VabVRwaFZEUTgwL3pXY01uQ1VVZ0lTOHNlMGl2YnZJYzdZUFMyNHFhcXBh?=
 =?utf-8?B?ZndNMDJsNWJaU1oxZTlNd21WTHRtc3lKNlBiVWVOekRlb0dqNUdGblFJeWhk?=
 =?utf-8?B?YW9RSGJmdFQ4aEhScFRlTUN6STh3ZUJiYU0wcTBRdU11RUYxWnQvMjlkTWRu?=
 =?utf-8?B?QUk4Z2UxNlZUbTNOcTZjTG5NYmU5U3N6dlM0cXJER3QwcG9ZQ25xR3MxeUlS?=
 =?utf-8?B?UkJmcGlUWWJuZ3NjZFlEUk4vcGZ4YW9JT2JBVkNsdldNd0wwWmI1NktwNUxz?=
 =?utf-8?B?WnVUMEQ5T3JzYkV4eUE2TkE1RmcybXpEWnB5VkdOelIyR2UvYjArZWRBNE92?=
 =?utf-8?B?RU1pL3NBZ1ExUmU5T2VSd0loRkVuajNVZkJrV1F0MDRVSkxhdStoTFd3N2dz?=
 =?utf-8?B?ZEVsa0dPSDFJNG9ESHorNVpPN0ZuZHR1YUt1blBUME5OUnY4NVRuRGtVWGlT?=
 =?utf-8?B?TmxHWGR3dW92YVN6K3NHeVN4WmcvUlFvOHRuTGo3bTR4OWRwdzdiMjFJaDJF?=
 =?utf-8?B?M3c5a2tZaTFUYnNFQit6UkRCU0x3c01rTTJqNUxsUG1xOEhnTlo1bER3M1B2?=
 =?utf-8?B?bHZFN2xPbXdRUE8wV0h5VXMzQTlTUVoxVTg1bi9jL1NiTDZJUUhOK1ZFaXRw?=
 =?utf-8?B?VEo0MUZEbHZPdGtBQTZEaEhJUVh6NDJFblp4VG13ZVZraU42OXRRc3lqVmpE?=
 =?utf-8?B?N2ttUklZNmozNURYc0w2WExhc0hIdlRncE1pN3hDRHBHUkpvMHZwYTlWOTZa?=
 =?utf-8?B?V254ak00REpkNExBV2VNWlpuZUZrRkczREN6WXRnL0ZQTk53K21YbDJFallY?=
 =?utf-8?B?NWtlZVpiT2lDa0h2NmF2bXpudCtuck1IemdCRDVBUWRHVURzaXZlSHFtbHIx?=
 =?utf-8?B?SUpIc25iQXkrWHFzRkRPdVZhcFQ3VDIyeEFqeDlaUFluNmNTOGpuVFo5ZFU3?=
 =?utf-8?B?cGZUVG4xSi81NHk5eWFuNG5LU3hyVHppQ1hsazdlTHEvbkJkbFNSQk8zMmZr?=
 =?utf-8?B?ZkFUckhNRitxWnQyQWRaTG53QWo3OVF4QU1CWTd4SndEQjZKdi84MmZnMHRI?=
 =?utf-8?B?V1dUVkJTYk16ZjZKUFlVYUVzVkhQMExBOFBDZ3BjdXdzN0JpbmsrU3RXRmF5?=
 =?utf-8?B?blZwbFJFM3ZQc3RyMXpqUDd6LzU1c3RjOVNxWFZrdkRPeHZwSnBkU1p1YmRK?=
 =?utf-8?B?dU9xTlpNZU1NUGRkOTFzNHVNYkJpeTVxQm5lSU9LWmVQM05yMGM4THEwSEtB?=
 =?utf-8?B?dWh0MGlQYlM4b3hPUWlBQjRtZ0E3NTNhMEFnakNqSi9MYXI4d1Z1UzlZUXVL?=
 =?utf-8?B?eWY2NXdsa1BLakhDMDF5YkNEQTBDQUZyV0tSQ3FVdnMvUkI4TzNZZkpOamZr?=
 =?utf-8?B?ZFVEa3Z4WlNDQzBSSExuMzFXT2hkQ2Z4bndHMGVWUmQ1dHBzUy9KQUxVOVdX?=
 =?utf-8?B?NDhNOUdxTXVQQ2xaOERBT3paNnNuSkJrdTh5Um83NVNldGhHOTN4OU5tekNC?=
 =?utf-8?B?emp5YXVaM1l4c3ZjejhUUnlWcEZxTlNiQThVbkV6a3p5WVoxVXJNVFZzZmhj?=
 =?utf-8?B?SGMzZ2lXeWQrQ2puaFdGUnFuZjZuMkd0cnplNDgwZTNGblFFQUhlZzRFNFpN?=
 =?utf-8?B?SHhtTVIraGtHM3c5dzFpYis3cDVzeWcyeGU5c0Y2cnZaWElVZkwyYnIxSXE4?=
 =?utf-8?Q?gN+nM3mqcnHo5K535LyrSWy3C?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dd4505d-9d78-4844-32c6-08dc0e5cc1b5
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5966.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2024 02:11:13.2230
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PNIrvSVo08Dk5pNhPYZYmYNiz0xZFiGQhCY9OlaTUBKF6oeKAEtuAHLBvl8K9ukzeJdpI6eu78AphFFw6rUXPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7498

Hi Ilpo,


On 1/5/2024 3:01 PM, Ilpo Järvinen wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>
>
> On Fri, 5 Jan 2024, Suma Hegde wrote:
>
>> ACPI table provides mailbox base address and register offset
>> information. The base address is provided as part of CRS method
>> and mailbox offsets are provided through DSD table.
>> Sockets are differentiated by UIDs.
>>
>> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
>> Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
>> ---
>> Changes since v3:
>> 1. Add hsmp_create_acpi_sysfs_if() and
>>     hsmp_create_non_acpi_sysfs_if() separately
>> 2. Change hardcoded value 16 in is_acpi_hsmp_uuid() to UUID_SIZE
>> 3. Change commit message
>> Changes since v2:
>> 1. Change EINVAL to ENODEV in hsmp_read_acpi_dsd()
>> 2. Change EINVAL to ENOENT in hsmp_read_acpi_dsd()
>> 3. Use resource_size() in hsmp_resource()
>> Changes since v1:
>> 1. Define amd_hsmp_acpi_rdwr() for doing mailbox memory mapped io
>> 2. Add a check to see if mailbox register offsets are set in
>>     hsmp_read_acpi_dsd()
>> 3. Add a check to see if sock->mbinfo.base_addr sockck->mbinfo.size are
>>     set in hsmp_read_acpi_crs()
>> 4. Change order of the statements in switch case ACPI_RESOURCE_TYPE_FIXED_MEMORY32
>>     in hsmp_resource()
>> 5. Add hsmp_test() after hsmp_parse_acpi_table() call
>> 6. Add r.end < r.start check in hsmp_resource()
>> 7. Add !dsd error check in hsmp_read_acpi_dsd
>
>> @@ -442,58 +648,85 @@ static int hsmp_init_metric_tbl_bin_attr(struct bin_attribute **hattrs, u16 sock
>>   /* One bin sysfs for metrics table*/
>>   #define NUM_HSMP_ATTRS               1
>>
>> -static int hsmp_create_sysfs_interface(void)
>> +static int hsmp_create_attr_list(struct attribute_group *attr_grp,
>> +                              struct device *dev, u16 sock_ind)
>>   {
>> -     const struct attribute_group **hsmp_attr_grps;
>>        struct bin_attribute **hsmp_bin_attrs;
>> +
>> +     /* Null terminated list of attributes */
>> +     hsmp_bin_attrs = devm_kzalloc(dev, sizeof(struct bin_attribute *) *
>> +                                   (NUM_HSMP_ATTRS + 1), GFP_KERNEL);
>> +     if (!hsmp_bin_attrs)
>> +             return -ENOMEM;
>> +
>> +     attr_grp->bin_attrs = hsmp_bin_attrs;
>> +
>> +     return hsmp_init_metric_tbl_bin_attr(hsmp_bin_attrs, sock_ind);
>> +}
>> +
>> +static int hsmp_create_non_acpi_sysfs_if(struct device *dev)
>> +{
>> +     const struct attribute_group **hsmp_attr_grps;
>>        struct attribute_group *attr_grp;
>> -     int ret;
>>        u16 i;
>>
>>        /* String formatting is currently limited to u8 sockets */
>>        if (WARN_ON(plat_dev.num_sockets > U8_MAX))
>>                return -ERANGE;
>>
>> -     hsmp_attr_grps = devm_kzalloc(plat_dev.sock[0].dev, sizeof(struct attribute_group *) *
>> +     hsmp_attr_grps = devm_kzalloc(dev, sizeof(struct attribute_group *) *
>>                                      (plat_dev.num_sockets + 1), GFP_KERNEL);
>>        if (!hsmp_attr_grps)
>>                return -ENOMEM;
>>
>>        /* Create a sysfs directory for each socket */
>>        for (i = 0; i < plat_dev.num_sockets; i++) {
>> -             attr_grp = devm_kzalloc(plat_dev.sock[i].dev, sizeof(struct attribute_group),
>> +             attr_grp = devm_kzalloc(dev, sizeof(struct attribute_group),
>>                                        GFP_KERNEL);
>>                if (!attr_grp)
>>                        return -ENOMEM;
>>
>>                snprintf(plat_dev.sock[i].name, HSMP_ATTR_GRP_NAME_SIZE, "socket%u", (u8)i);
>> -             attr_grp->name = plat_dev.sock[i].name;
>> -
>> -             /* Null terminated list of attributes */
>> -             hsmp_bin_attrs = devm_kzalloc(plat_dev.sock[i].dev, sizeof(struct bin_attribute *) *
>> -                                           (NUM_HSMP_ATTRS + 1), GFP_KERNEL);
>> -             if (!hsmp_bin_attrs)
>> -                     return -ENOMEM;
>> -
>> -             attr_grp->bin_attrs             = hsmp_bin_attrs;
>> +             attr_grp->name                  = plat_dev.sock[i].name;
>>                attr_grp->is_bin_visible        = hsmp_is_sock_attr_visible;
>>                hsmp_attr_grps[i]               = attr_grp;
>>
>> -             /* Now create the leaf nodes */
>> -             ret = hsmp_init_metric_tbl_bin_attr(hsmp_bin_attrs, i);
>> -             if (ret)
>> -                     return ret;
>> +             hsmp_create_attr_list(attr_grp, dev, i);
>>        }
>> -     return devm_device_add_groups(plat_dev.sock[0].dev, hsmp_attr_grps);
>> +
>> +     return devm_device_add_groups(dev, hsmp_attr_grps);
>>   }
> Can this refactoring of existing code be put into own patch, it would make
> this patch smaller?
>
>> -static int hsmp_cache_proto_ver(void)
>> +static int hsmp_create_acpi_sysfs_if(struct device *dev)
>> +{
>> +     struct attribute_group *attr_grp;
>> +     u16 sock_ind;
>> +     int ret;
>> +
>> +     attr_grp = devm_kzalloc(dev, sizeof(struct attribute_group), GFP_KERNEL);
>> +     if (!attr_grp)
>> +             return -ENOMEM;
>> +
>> +     attr_grp->is_bin_visible = hsmp_is_sock_attr_visible;
>> +     ret = hsmp_get_uid(dev, &sock_ind);
>> +     if (ret)
>> +             return ret;
> Is it intentional you don't provide .name here? hsmp_get_uid() gets you a
> socket id if I read your code correctly so wouldn't be more consistent to
> generate the "socket%u" name based on that?

Yes, it was intentional. In case of non-acpi probing, only one 
"amd_hsmp/" directory will be created for all the sockets under 
"/sys/devices/platform/". So we need to create "socket%u" directories  
separately for each socket. Where as in case of acpi probing, there is 
already a separate directory "AMDI000XX:00/" created for each socket 
since there is a one probe call for each socket. So I thought no need of 
one more "socket%u" directory.

Thanks for all your review comments. I will address them in v5 patchset.

>
>> +     ret = hsmp_create_attr_list(attr_grp, dev, sock_ind);
>> +     if (ret)
>> +             return ret;
>> +
>> +     return devm_device_add_group(dev, attr_grp);
>> +}

Thanks and Regards,

Suma

> --
>   i.
>
