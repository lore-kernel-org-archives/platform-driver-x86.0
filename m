Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C55B8E95A95
	for <platform-driver-x86@archiver.kernel.org>; Mon,  9 Oct 2023 15:10:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376435AbjJIPKx (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 9 Oct 2023 11:10:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376410AbjJIPKw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 9 Oct 2023 11:10:52 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2068.outbound.protection.outlook.com [40.107.244.68])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 218B09E
        for <platform-driver-x86@vger.kernel.org>; Mon,  9 Oct 2023 08:10:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BgOleZW4vnRoSXkj/tUbsFWnGWl/pW9E6dnxqGiiKWIdrVarjRWM0pf3eYb2N1YaOGF9BCYZU8DYQwdajQceplwEZtgX8rayvL4iIradJj7+YZM997WIQCez0j8Nt40EPdqVE38Dkh9jZeqXakb2qL9jtOIp5pOrQN2pKSpLRsq8cLs5H8xNg3HJ9iFjfCFhejEk3ud0dyv/9KM+TMucyh/ERhtfIBMfcgUwhYpjxiHQI/nap/w1StrWgAoKzQvNmZg1HkfLRXYr9yb84E3i9JEgnFsfyi5yXUB9cl4nq3H1gkhuAXsPlFsqgHxqaZ+T0R4XGIKeAaBy+RlXlmDFeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zsJ961zJwyM5x4S0xkwKw2q09YAcB33zjvtl8AjHQpM=;
 b=Cf4I9Z1J+Y/GpRO6JcVPw/QT3/1ORXLBvSHqcH4xHCPVGeDVBWf9bnvRWhqdrscww+EK4LzjKGDwgDX+dwEWMVECE6ngMkryO6VhxGPmoZu4u3HcPVYsfiv4Rs/wYjiWpEkBRNfCuD7A6YS3sOeehcLe+0hsYPlVhbxjVGkNn9yh+VKsWmA7r9CTAdvgPWPdu2ePCUPbjbsQ+h15pB/Qtp0rhtj6ENzG+g4iZSZ56I7e+1kmb2G1otQpcx0/Zm/UBEMtZiQqxL4oUWGnJOAbiucjIsimtS7f4XzxRg47mjS96nnrSJzjonIGqzaG3Ve/eodpK4ZZKIRk7U97O5RYcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zsJ961zJwyM5x4S0xkwKw2q09YAcB33zjvtl8AjHQpM=;
 b=tqFtiIV/2YmVUImj7tBF6mZgsS2FnhHRW+FEF4dG7T6/tT/ZKmJ/8SuH2vvtaxH/AxHs+xIC+p3DfIRII1tvo0EC4X1ZAUnp/E3i2gUGS+PjHRbY+GXiZdfx3OF7Lw6v+9lLhaZz+QPiSutMRBwfNMgzLE/DSUM4jMou4z/X89I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV2PR12MB5966.namprd12.prod.outlook.com (2603:10b6:408:171::21)
 by PH0PR12MB5678.namprd12.prod.outlook.com (2603:10b6:510:14e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.41; Mon, 9 Oct
 2023 15:10:47 +0000
Received: from LV2PR12MB5966.namprd12.prod.outlook.com
 ([fe80::2258:36a:b01d:eb0e]) by LV2PR12MB5966.namprd12.prod.outlook.com
 ([fe80::2258:36a:b01d:eb0e%4]) with mapi id 15.20.6838.040; Mon, 9 Oct 2023
 15:10:46 +0000
Message-ID: <8205097b-5db6-6d1c-2556-0fcaeb6cf3ba@amd.com>
Date:   Mon, 9 Oct 2023 20:40:35 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v4 2/3] platform/x86/amd/hsmp: add support for metrics tbl
To:     =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Naveen Krishna Chatradhi <nchatrad@amd.com>
References: <20231005053932.149497-1-suma.hegde@amd.com>
 <20231005053932.149497-2-suma.hegde@amd.com>
 <d3b1aeb1-b86e-7df5-1b69-3e7d9ed9caaf@linux.intel.com>
 <bb3ec2c2-332e-d6ca-2c06-31d2b68d346b@amd.com>
 <faf39eb5-ac8a-b32a-d6a-a4bb6ea8ab3a@linux.intel.com>
Content-Language: en-US
From:   "Hegde, Suma" <Suma.Hegde@amd.com>
In-Reply-To: <faf39eb5-ac8a-b32a-d6a-a4bb6ea8ab3a@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MAXP287CA0015.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::27) To LV2PR12MB5966.namprd12.prod.outlook.com
 (2603:10b6:408:171::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5966:EE_|PH0PR12MB5678:EE_
X-MS-Office365-Filtering-Correlation-Id: 23709e4a-354e-4790-5dd9-08dbc8d9ea25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KWceEWt77Vek8+VpDG9hQi1Z3g7OxOfKFw2JMfb1IQ5EVGa+/piXwnw8y4aMdO3exAcl03oc53Xt8a2IYFgD1y6VfgP40E02CuaMPoxHamf6YDGQ5yvOjnsBRnu6jLBcw6Dp5iTpCicDgEVxkYDKT7pdX8rnmNNVlXEYunZ32cQF3fThV1vXCTChVhoytx7tM7qRvxDgEdh1AvrFnr1Ca6AXCTWIWkU0heboR5H1U5eF1f8fCoqTmrV6g8+LkHQduA75zHTE+HcNtH5aGpUvdhamdXNAC2jZhJO9cPYBH/yD2cJpSZallZ59uiFRxpdIKRSNj3WVLPdavRR2yCgis15t2DAZJpuPpp+RbOEqtlbdzVUcF0oIpIXYhfNxLTl3HkAAal+hCRLPdDlXh+VkFLmaZhSWuyEvFo9d9lDehxY4YsSxVC/qZo01WKajcls4RwigBrSS595Lwq0UdR6Z6CnkChicTZdF7ZLxPKnWCNtHgiM/1dRB2tj4y2TGiMqf9WRwXBwFtj1LkUxwMScxGSJi28q04DzMjTp5hZQhhjzXRRTbLw9j+q1Gaxs9qVbFp9lfviaAjyxbt7Qi9Le9ZTdyLFX/1ADrm4GeUjJlzbTWdMTBuPy7ZdtQeceJFUJ2KRVcbMZmdkh9xuLAYXp7AQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5966.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(396003)(376002)(136003)(366004)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(31686004)(26005)(2616005)(53546011)(6506007)(36756003)(31696002)(86362001)(38100700002)(83380400001)(4326008)(6486002)(2906002)(478600001)(6666004)(8676002)(6512007)(66574015)(41300700001)(8936002)(5660300002)(6916009)(316002)(66556008)(66946007)(66476007)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SlFpY2lPa1VUSklZRTE0MzFWTENHL2NYVDRXSzVvVG1FOFlITHFjQ1docG13?=
 =?utf-8?B?NW1Ub3M1UG1uWmI3cGhaanUyaTNHNGUwM3FFQnVyUkU4ZjZkbytEQkNjWi9n?=
 =?utf-8?B?SVhWK1NLaXhLUmsvdnRYbitkSjc0TnVSNGVQVXMxMzNhTDlhQXliY09Qc2R2?=
 =?utf-8?B?SlFHaUtKaFNXb1hnM2E2NUw3elR5dmdzdHpUZlZQV3E5dUE4K0VPK0Jmdkcv?=
 =?utf-8?B?RXhvWkRsMmdTbTNSTm1WYUsycEwzVkxDNFlvMGJwZGVwVktPUHlDZE1rVkFn?=
 =?utf-8?B?QW4rMWQvcTRKL3VkUGUyWjNHZVNxeTltVFRucVhxbXhSMFhCeFZsZk1YbFVS?=
 =?utf-8?B?R09CSnNSN0RCaGhENGZLcmkxcms5bHpWOEN2V1JKVjlpRnpyUEpPYzFjYm5C?=
 =?utf-8?B?TStHaVJtWWZnUlh0cXhaYzV2M3hvOWRWSzBQeHY4dGVsSGMrVmNtMmJJUDBt?=
 =?utf-8?B?K0pMYTBQRTVUSUFlUnBRbXJhemQ3OXdHOGljLzBLQnV2ZUttcDIwbVkycmpH?=
 =?utf-8?B?SmVyUkRueUs5WnBCOERyb01QVlhUS1FVMlBQTUtvYTRCZDhvYkFIUlJyUFpC?=
 =?utf-8?B?RjVKd3pCbllxOThiWFAvbzI3TW81K2JjdzNDdTl3MGhHdFZvbWJ3N245OTdh?=
 =?utf-8?B?N3dLSWhMeHlNb1A0bXhSQkRvR3U1VVNsNFIxWTIvWDFXN2hGdEttVzc3S21E?=
 =?utf-8?B?TTIvNVJGWmdNMWY5NTkweWIraldrakdZNzVVZ3NTeGpZUVNEeGhJSGdPUG1z?=
 =?utf-8?B?bTVGK3o2THBtTjM2SVMvSmgxL295dk1FMUVjaVFQcERTeUtrS2lUSUYzVkVs?=
 =?utf-8?B?Ykp6NWpMa3F2UmhIY0Q2TkxnYkVKMWRpME0ybmc4UU00MVhlcjR1SkdjSHlj?=
 =?utf-8?B?b3J0aG9qSHNLMzYyb1pHcnFPR1IwYW5EcGJlUmZ6eG42VkJOa0M0cTFxNG5v?=
 =?utf-8?B?aXhURm13UHpaUDZ6OVUxUVBuSU1wdkJGNzFTK3poLzNEc3pPM0xzRzQzeUxQ?=
 =?utf-8?B?SkphT2VQeGdrTmJwQVpzNFpXRnZ2emhLK0VTSU10My8vZGZtSm94Y1dFL2hq?=
 =?utf-8?B?am1ndmpNdjk1bC9BVkw0MzIxZnNLVWNKOWlxSjZCMC80QVFTQmlzU3RwZXhM?=
 =?utf-8?B?djdqUGcrNVBROHVnZ0ZRTDg3Z2hidnAxUm9PMks4TXJJSVBxS0xXU0ZNVGtR?=
 =?utf-8?B?cFdFZVJLZlVJOUdKZmhHbzZpTG9BQ3k4aVJIbGlRalEwaHhERkhhTFFZTzgy?=
 =?utf-8?B?ZlV5V3dGTlU5MVlMUlNRbTBNQjF1OXVVRGVwd3VKemtWU0ppRExxem5EQWs5?=
 =?utf-8?B?WUdXK1l6R3RGVm5zUEhOTTRTWXR0dUhQclVFVk9wT0lNS0F5MkxuNlpyZ1ZW?=
 =?utf-8?B?Mzk3dXVCUlI1T00va1FUdmhvWGxGRzNobEFFM1ZGdzdmQmdJV2szaFdZcHBS?=
 =?utf-8?B?c3lvbW9Jd3cvZ3dZUVRYeDBFSWxsNmNpQ1Bpb3hmaEhwVUlRZjRzNWlIUmpM?=
 =?utf-8?B?WTNWQ1RFM3A4dTVxS1g4RC9FOHI3aURqU0VNbjZSNmVlRzRqVGMvTndWaUJu?=
 =?utf-8?B?R3NJTS9tOUJvWi9zUWdvZEZjWkNwNldUZGo3SVI4MnBzbE5PN2sxaHkvbTho?=
 =?utf-8?B?T2RldW9NTTZsbFNGVnFLODZ3YW40QmRsWU5xQUlCQjFUMm9HaGx6ZkVaakZx?=
 =?utf-8?B?L2ZIUWwyQ1VJbnVNbGJnam9XUmhPWnh5QkROS0N1cm10djk2d090SzBVR2Rj?=
 =?utf-8?B?cHlMNXgxMmhXcGs1K0RYc2VucVVCWTZHYlFHcU5zV2JNL0thVUM1Slg1VHpu?=
 =?utf-8?B?S0VJUklEWkQ2ZGFnRjdhcVNIUnFWSGxER0N5dkxGWXN6OW5YL0J5UzFBYXBM?=
 =?utf-8?B?WHg4Y2g3RG9sZ214dXkyVjRweVgrQTgrTnU3UFlZdjlCeHRVS0syMkd2cW5v?=
 =?utf-8?B?dUpkZVM5cnJVZHM3MkJJSGpOT1phZ1luL2lIS01zNUQ5aHBQRFRKQ3pwY2sw?=
 =?utf-8?B?azR2enR4TWNpUUpLSlY3SE9QRGFWQUlzM1pzL0V4WXJMSitBM1J3TjFYN3Uw?=
 =?utf-8?B?L1pMUnAwWDZqVmNWMVF2Z3p0RGc5YnJUdUVDY0taeUJteCtJYWFCR3M1RXc3?=
 =?utf-8?Q?M230GKGAInatj12da3yFjSK1g?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23709e4a-354e-4790-5dd9-08dbc8d9ea25
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5966.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2023 15:10:46.8448
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3/sqbkm12x6mvy5Ziffpv/KinsdWXedfKXf9SfPs/BY+grYwsrni0WWl4ZdGodqYWbP4aza51i3CzcGckiFhQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5678
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org


On 10/9/2023 4:53 PM, Ilpo Järvinen wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>
>
> On Mon, 9 Oct 2023, Hegde, Suma wrote:
>> On 10/6/2023 6:51 PM, Ilpo Järvinen wrote:
>>> On Thu, 5 Oct 2023, Suma Hegde wrote:
>>>
>>>> AMD MI300 MCM provides GET_METRICS_TABLE message to retrieve
>>>> all the system management information from SMU.
>>>>
>>>> The metrics table is made available as hexadecimal sysfs binary file
>>>> under per socket sysfs directory created at
>>>> /sys/devices/platform/amd_hsmp/socket%d/metrics_bin
>>>>
>>>> Metrics table definitions will be documented as part of Public PPR.
>>>> The same is defined in the amd_hsmp.h header.
>>>>
>>>> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
>>>> Reviewed-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
>>>> +static int hsmp_create_sysfs_interface(void)
>>>> +{
>>>> +     const struct attribute_group **hsmp_attr_grps;
>>>> +     struct bin_attribute **hsmp_bin_attrs;
>>>> +     struct attribute_group *attr_grp;
>>>> +     int ret;
>>>> +     u8 i;
>>>> +
>>>> +     hsmp_attr_grps = devm_kzalloc(plat_dev.dev, sizeof(struct
>>>> attribute_group *) *
>>>> +                                   (plat_dev.num_sockets + 1),
>>>> GFP_KERNEL);
>>>> +     if (!hsmp_attr_grps)
>>>> +             return -ENOMEM;
>>>> +
>>>> +     /* Create a sysfs directory for each socket */
>>>> +     for (i = 0; i < plat_dev.num_sockets; i++) {
>>> The change for i to u8 seems not very wise given num_sockets still is u16
>>> as it can turn this into an infinite loop.
>> Hi Ilpo,
>>
>> amd_nb_num() API which we use to identify the number of sockets on a node
>> returns u16. So, we used u16 for plat_dev.num_sockets.
>> u8 should be enough, as present AMD processors support upto 8 sockets on a
>> node.
> I wasn't expecting it to fail at the moment, I just don't want to leave a
> silent trap for the future.
>
>> Coming to the warning raised:
>> We have defined, HSMP_ATTR_GRP_NAME_SIZE as 10bytes, 6 chars for 'socket', 3
>> chars for 3digits (socket index) and a null terminator.
>> Socket index may not need more than 3 digits in the foreseeable future. How
>> about, we declare i as u16 and typecast it as (u8) in the snprintf.
>>
>>          int ret;
>> -       u8 i;
>> +       u16 i;
>>
>>          hsmp_attr_grps = devm_kzalloc(plat_dev.dev, sizeof(struct
>> attribute_group *) *
>>                                    (plat_dev.num_sockets + 1), GFP_KERNEL); @@
>> -449,7 +449,7 @@ static int hsmp_create_sysfs_interface(void)
>>          if (!attr_grp)
>>                  return -ENOMEM;
>>
>> -       snprintf(plat_dev.sock[i].name, HSMP_ATTR_GRP_NAME_SIZE, "socket%u",
>> i);
>> +       snprintf(plat_dev.sock[i].name, HSMP_ATTR_GRP_NAME_SIZE,
>> + "socket%u", (u8)i);
>>          attr_grp->name = plat_dev.sock[i].name;
> This is similarly trappy as it truncates i if num_sockets is > 255.
>
> I suggest you just put this into start of the function:
>
>          /* String formatting is currently limited to u8 sockets */
>          if (WARN_ON(plat_dev.num_sockets > U8_MAX))
>                  return -ERANGE;
>
> to catch the too many sockets case if it is ever going to occur.
> And explain in the changelog that u8 is enough for foreseeable future
> and the string formatting triggers a warning if unnecessarily large type
> is passed to snprintf().
Ok Ilpo, I will add this WARN_ON and send v5 patch set.
>
> --
>   i.
