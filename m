Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A32AC6FA82
	for <platform-driver-x86@archiver.kernel.org>; Wed, 21 Sep 2022 17:27:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229820AbiIUR13 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 21 Sep 2022 13:27:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229741AbiIUR12 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 21 Sep 2022 13:27:28 -0400
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2059.outbound.protection.outlook.com [40.107.101.59])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E647EA0326
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 Sep 2022 10:27:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NFJiE9qhWxcDuOeprZx2qhQBeYTNgbTSbizUEbW6CRx3j9zTLZl/RDX6+G+ew9H3LAhUA/pEfwnzzDJGGXqTOrE0JPqII2hTrM2wA60JfuAu8onntLaGMbw3WUcLsqK7hdxrS6ZRxN9qfpHG7XynFFxVDkM/DiszbFoLUDENGixvDA7nGCkc5wWk6GMJ/feZHqzB3Im+XIvBE/8RWmzfY0zWVaTM+Bzoh6r3yciEbLBt6KB+uNFhk4JaVHg0M6LXWF12MBfGc1fxc8cEouIMmz25SbfFJJfHTUKNjfXe3ap1y8EPM/CZto66Gd3PxNErmkzDafAxHRmuz2OMoWjTLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mpLjNkG0baCvmc5N/pjBSWasgLVhFeWUuTaqbShRAa0=;
 b=EILB9sjcf9s+OGtbyUjWoRffPf2M2C4PVNs99jc/+ZgMp7MjjhGlK7WCk5LFi+QdBxM7HSztKe1tS6n+zxdywAI9Pe9w9ePHaFoF9yndCfs4IghKYobteLxrPhTaiR3ttkZ5hOx5BCgsfWZ91yd5j2b5hW+qY5hRrAZxH/D/X7sgzFTjII5OiuO1F5f+HnM6ngqdueBJ1r5JiRrK3rRqsmMRdZCkpoPSSCj6IjbEhJR37KoxWq/cvERLKSuL67W6vgwQNfBsRs+OU9OqEVcakOatp2Jer0PZIBQq1UKXjvLNu8DEUHJwRyncq7h1E/9dBOEARh/gjcgz5L3MQ62wBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mpLjNkG0baCvmc5N/pjBSWasgLVhFeWUuTaqbShRAa0=;
 b=O4NK9Qf5oh7/VIZgWMoqF/FEwlVYPp37s24ELSXq3bA/ahayqkfhiS6AuBYvJdJfmSviGuIqNcdbIQL2w0Zfvtdb8a68Z8Wjg6+WCeoNMgxUKjhF2yB3lWluSDsiyodaiXzdf4knfIX4NIzCHw2L8srkkKL/u1gjVFmp4jNOHmk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by SA1PR12MB7127.namprd12.prod.outlook.com (2603:10b6:806:29e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.14; Wed, 21 Sep
 2022 17:27:24 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::4509:38d1:dda7:2d66]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::4509:38d1:dda7:2d66%9]) with mapi id 15.20.5654.016; Wed, 21 Sep 2022
 17:27:24 +0000
Message-ID: <ad35331e-1bbf-fa0e-15ac-6ab3105bab76@amd.com>
Date:   Wed, 21 Sep 2022 22:57:13 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v3 3/3] Documentation/ABI/testing/sysfs-amd-pmf: Add ABI
 doc for AMD PMF
To:     Hans de Goede <hdegoede@redhat.com>, markgross@kernel.org,
        mario.limonciello@amd.com
Cc:     platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com,
        bnocera@redhat.com
References: <20220921102455.1792336-1-Shyam-sundar.S-k@amd.com>
 <20220921102455.1792336-4-Shyam-sundar.S-k@amd.com>
 <694508ec-6091-39c9-5748-29a6da6e1556@redhat.com>
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <694508ec-6091-39c9-5748-29a6da6e1556@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0165.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:de::9) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|SA1PR12MB7127:EE_
X-MS-Office365-Filtering-Correlation-Id: de40a76a-817d-4293-9da4-08da9bf68bd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +1FkPF2oPW/l+ynthz/jdXN5XuhM6GK2biXDqteC88rFafLSz2/oExbMJjWwdROXGIuO9tE22VjsrcPmUS7CQr1MEHdnohzSBEOtvaYB2/iGSID5aUpRJW9zJaz4Urd5AcGEXr6yi+dQPB0a1bkI7QLlzJETC0UbTo4CTvDm60lESLbL5G34id50YBjGjbsFJoYEviM2SM4LR12f3PsdhAm0S4zkAbH3m9EyGGSqxAr+WXsBMEtypLdSyy4DNFHQf7HTLBe4A2DgOFCNEmjF9OWm5wFjXUz/6KUMxi2aor7RItwOY7uaLKpV27zJW8Xgkg2EZ8RmAh2ote50x2Am92qWm55qyG7bRAvCI3gm1E307sjTzKjr2EAycbGyW88tWzOMZph4/6xS9ccrF+Q6/oMesW8aRG7rVCjC/4uCw9aHEK76jqNJe6pHc5WkYnFi3wzQufm4bdWAiTOPO5XFtICv0kkHqbBAjrZStUjcsahsrBz5IrWJ8Y67tPCpReA8V5hzIbwEj4xc2xw7CuL6mBzk2XCupBXz8r1YZJlUZTQfnFeY1birUDtVUcKLhC8zM1VvogrhFUfzPUw0rqZ43kzTWoC5jquGz7qgzZHNdLmmdaUUtuSBbZqH7/7QgT6lyORKw6bt9wMoFKMp0RSLEd7iAeJitN4lVmraM8WSatxeMQ6K4fPfDjrK+DqxUcvsk9IAyRrHHYqhxD9t3nyRnoy4+pRptFpzkJmJTrA0/hq0kFzBiXmvAM9eArNXTw7aPWUI4AccoY71Ol07AywmTasVe8grjc0crLFbKtspgl0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(376002)(366004)(136003)(396003)(451199015)(316002)(83380400001)(4326008)(8676002)(36756003)(66476007)(66556008)(66946007)(2906002)(86362001)(31696002)(38100700002)(6486002)(478600001)(31686004)(53546011)(6512007)(26005)(186003)(2616005)(5660300002)(6636002)(8936002)(41300700001)(6666004)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?andPZlN2WjZBZFUxTzNGWDhvMXlCbkxKL0lsWmRkVWxiT0NHdEF1TXAzbW5p?=
 =?utf-8?B?MmpZd0J1Z1hrcE5GMXZJelJtR09OUG9aOGxacDh6N1M3Z29BbnYyNmt5emZj?=
 =?utf-8?B?M282VjlJK0JNRmtVS1dmYjYrcnJGZWRvSTUzSUNEZWtPNW9aYkhaUmRsTFJJ?=
 =?utf-8?B?OFZtNzJMWWYyUXlIZ2NFOXNpZS91UnB4N211M2wyeEZnRTJteVNPOGVqMFMy?=
 =?utf-8?B?SFFHby9TelRVelJQUGdLUU95bVNDTE9jWGZYQUZKTzI3bUxZMi9iaEJOYVdk?=
 =?utf-8?B?dnlpNlQ0S3Z1U0NOL0xudGxqdUdhTDRFU2Z5VzhTVEZhRU9icTVXV3NBeldE?=
 =?utf-8?B?WUk0TFhZanY1Vkw2VFp6Y011bFFwVGlGVURiNy95ajNadTJEWFRIWkFubEJY?=
 =?utf-8?B?czhpUUM5SzhnbnFnc1phWnpLRnZrN0NseXZKRkdlSnN4YW5HRmtCSktZTXlY?=
 =?utf-8?B?UmluS2VWT2hXenhFcUdIWEFJVDlTclVyNldSOERCQzRVaWFCODV4YjZDeVY3?=
 =?utf-8?B?QkpsMmxKZ2J1dmZNR1FEY2l1bGRsNnBFSVRkSmhGNWpiMUl0aWJycEF6WXQ3?=
 =?utf-8?B?cGJWcHFsakJuOUdyR2o5MnNycTFvakdYbm9WSzQ5OGdOdEYyWlZna0FQT3U3?=
 =?utf-8?B?dUxlbVBSUldzMzhDdldQVHladG1uc0ZvcG1UcW9pdlE1QUZvb1FUZGtRdy9r?=
 =?utf-8?B?QVcvU2lXTlNJUGNYNmx6OTB2Z205UnphcjRScGNiTlBhYzV1L0VXd3BMWkpt?=
 =?utf-8?B?VkRNcE90dnE5RTVnRWhHY0pEc0gzUHRBbVF2QlpvT09pTzg4NUsyUG1ld3Q3?=
 =?utf-8?B?bHBFc1lzZmxLZXJHUzF0ZVIwUXh3ZjFyS0FFS29kc3BqZjB6OFVzTlNnN0NQ?=
 =?utf-8?B?aUJISXBUSDc4OWFSWFlJQm1EZ3pBa1JRc2FNdHdRbVZVTlZnV0JYS0ZjUWNl?=
 =?utf-8?B?RnJvYjk0aFk2NnlCMHJ2aUk1dm1MeHM2VWx4RnRkdkVEaFlqL2pCeHl2d1dh?=
 =?utf-8?B?ZDZLbGcyREM0ckxaTUxOZ0FtYmxNeGdvR0ZTVE0zbHhHQUdSa0JLYUZPNzBw?=
 =?utf-8?B?QnI2a2x1ZUxCU3ZCVGJ5S1JBN2c0L29MOUp6Uzc0aS9EQVZwaVlUVjhtQlJv?=
 =?utf-8?B?SjF1R2FIRVJJWWRQUzFmUDdHUHhKb3pFSTY1VW9wSnlvVklZcWdoWHowejBx?=
 =?utf-8?B?NGVpTkdkZ0RDak5CS0ZGaTdKNVdpWUp6Yk1BaUxhdVpVN0VRZ3lCd3pQZzhy?=
 =?utf-8?B?Qm16Q2FRUE15UjBwdlhRUk9ROGI3NHdDemFyQjFMN3NlY3BIUURaZjBTR3ZO?=
 =?utf-8?B?alhaZ1BKZGdKTklPakcrOTR4UStjVUVId05OVWtoTzF0bWlKcWN1NUlpTkQ0?=
 =?utf-8?B?S0lqTk5pMms3eHRtcXdrMndaM2RFbXlEMnJpWEZlOUdBbDIvYzlyTWF6Y25I?=
 =?utf-8?B?RDJGMUFHS2dFTTZudjVycTdkMnYxMG45MU5SL3FqK2tBeXliYllGd3lMSW1H?=
 =?utf-8?B?eHVtUjRGWG96Y1dVOUVDZjd0Y3FldXNCSk5aakxTeEt6clFueXEvK0oxNm84?=
 =?utf-8?B?TVJPSkMweW9IbWhVTWJIOUxTVHFjWlpYdE5xQkoyeUo4eVFXQUd5NU5aOW84?=
 =?utf-8?B?L25iSzFXT0k3TWx5MjBrUWRIYjhHN1dmZWhpSUkrbzFwL1RIYzJkUDIwOXlR?=
 =?utf-8?B?Mmp4NUhGWHFqRHpFbkUxMHhpTEdnaG5KeXRLM1lvSXZjY05jNkNFVFJsMGVL?=
 =?utf-8?B?dGlvRERFRDlTZFpLcHorK2lFdE1mNlFKS0ZpYVRNMUk1YllJZmhCVk9XTXF4?=
 =?utf-8?B?dThSL09RaVVXOGpUY2FpWmhOWkRoWVo3elRHemR4TzZvNWRIaHN5Zm5MUHZX?=
 =?utf-8?B?V0VkbTlHVUQyNHFxWXI4cHFORXROWjNDZU50bFgyMnUyOUY3OWVTL0xRSkVT?=
 =?utf-8?B?QU5Xem53b1FEeFVuRWJkUlNFb00vR1ZDMHF4UE9hZUNDblVRS3dzeWxMRDRi?=
 =?utf-8?B?QUZIRlJUQTJnRy8rVURxMFpLSFl2VUpnQWlFcnUyd25BeTkvYUNjZndCN0RS?=
 =?utf-8?B?ZkNyUFdURllONjk1UkhrZU5ERUR3cHNxSEFqZmVGZTZPYkhtOEVFVzlFZ1VC?=
 =?utf-8?Q?+d6MaRhpToRuN5Z2OLN7PBIRB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de40a76a-817d-4293-9da4-08da9bf68bd7
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2022 17:27:24.5063
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /VFD6aGgjV+WfV1bmZyg7s9Fo4HGkVSKv3bEYzVBmQkoZD9iXlkYi+NfvH4KbMFTKVySGxjORsI3c8ywEvqZSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7127
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Hans,

On 9/21/2022 8:12 PM, Hans de Goede wrote:
> Hi,
> 
> On 9/21/22 12:24, Shyam Sundar S K wrote:
>> AMD PMF driver provides the flexibility to turn "on" or "off"
>> CnQF feature (introduced in the earlier patch).
>>
>> Add corresponding ABI documentation for the new sysfs node and
>> also update MAINTAINERS file with this new information
>>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>>  Documentation/ABI/testing/sysfs-amd-pmf | 12 ++++++++++++
>>  MAINTAINERS                             |  1 +
>>  2 files changed, 13 insertions(+)
>>  create mode 100644 Documentation/ABI/testing/sysfs-amd-pmf
>>
>> diff --git a/Documentation/ABI/testing/sysfs-amd-pmf b/Documentation/ABI/testing/sysfs-amd-pmf
>> new file mode 100644
>> index 000000000000..fec2be7178e2
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-amd-pmf
>> @@ -0,0 +1,12 @@
>> +What:		/sys/devices/platform/*/cnqf_enable
>> +Date:		September 2022
>> +Contact:	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> +Description:	Reading this file tells if the AMD Platform Management(PMF)
>> +		Cool n Quiet Framework(CnQF) feature is enabled or not.
>> +
>> +		This feature is not enabled by default and gets only turned on
>> +		if OEM BIOS passes a "flag" to PMF ACPI function (index 11 or 12)
>> +		or in case the user writes "on".
>> +
>> +		To turn off CnQF user can write "off" to the sysfs node.
>> +		Note: Systems that support auto mode will not have this sysfs file 		   available
> 
> I guess this "available" with a bunch of whitespace in front of it was 
> intended to be on the next line?
> 

Ah, I missed to notice this. Will fix this in v4.

Thanks,
Shyam

> With this fixed:
> 
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> 
> Regards,
> 
> Hans
> 
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index d74bf90f5056..255527be7e24 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -1026,6 +1026,7 @@ AMD PMF DRIVER
>>  M:	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>  L:	platform-driver-x86@vger.kernel.org
>>  S:	Maintained
>> +F:	Documentation/ABI/testing/sysfs-amd-pmf
>>  F:	drivers/platform/x86/amd/pmf/
>>  
>>  AMD HSMP DRIVER
> 
