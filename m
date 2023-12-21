Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2076.outbound.protection.outlook.com [40.107.102.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120DA50254
	for <platform-driver-x86@vger.kernel.org>; Thu, 21 Dec 2023 10:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="nfvPIHnC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jbR2T1LWKDcTomCOwfQ5h/mZJPQYD2K1j/Aiu0rHP5ZjyDmf9pLN6VT2wwHtaOnDrIV8saKRL1bKvRMoy9tZGOfyPOD1qt1EzkTzO9qhw97e6bbgRfiz3W+ClrcbSbU1K3JZm+zu+Ls+pntiC/4wXKXhZJO8hmrUsg0NxsCxnRPFi/iGEzPiAt1li5sKBHxARN2s0sa5NuKLsYVW+qWxs62ZZVTXeLwf7BLgBAmnl2XqdtGKdYDVj8o/b0Bq0slRcXwrOXLt5hI8XufKUD+UwChltjLi+OK+ORgT/vhplg1xwUMrZKQDeAdC4izRsuKyuoLUAF7ydjKe2K77GQMelg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=go1ogF1TEOHq7Nd1Hj5lbTEyk1DdIEqYKVMQLp+ucL4=;
 b=M6xBKu+jQ1zeE3pAJoCT05J4Og5H+5qvIotd5VaXtko708vhGQkgqfMAQLCemBmV89EHI5KwmSlJ7eVkAHHX8GyBe2UT7efZSWBxl+C8bKUK8V5lECqdLt/8efF0UWj0Hxq5nu9GXeICKpgt92IS4EY+1IhGzot+Xky3IltpVXGe0kZrozOdqTpiHP6dC8zjRUExa0ZhHbW2t63kfaaqefeKA+ODKlVG45Qyn5Iq7htq6bJZmVWSBELnQPkFY1DFumiVgfgjk//PilasVDlMHVxysm0OdO5exxf9bJindkHfSL9gG0t9cj9idDyv6p12uc3OY50LL4OIrTPElm4L2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=go1ogF1TEOHq7Nd1Hj5lbTEyk1DdIEqYKVMQLp+ucL4=;
 b=nfvPIHnCBxZrdVgcUxJOYEnLyNe01V2YhR+nJ5ZD3xw0QOd053fRmT9MuQvSpcy8tAzjNw2PXGLkSeuGhSn6dAPXjEgpxQP1s8NWltp3xZLVOPs9wkKi1emuewfDGA8SrOMx9ZcHGZXfRPNQJQcyJdhjKoCZiIOXdvSfQpvdEDk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV2PR12MB5966.namprd12.prod.outlook.com (2603:10b6:408:171::21)
 by DS0PR12MB7898.namprd12.prod.outlook.com (2603:10b6:8:14c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.18; Thu, 21 Dec
 2023 10:27:10 +0000
Received: from LV2PR12MB5966.namprd12.prod.outlook.com
 ([fe80::27d5:9024:445e:5c45]) by LV2PR12MB5966.namprd12.prod.outlook.com
 ([fe80::27d5:9024:445e:5c45%7]) with mapi id 15.20.7113.019; Thu, 21 Dec 2023
 10:27:10 +0000
Message-ID: <11fcc515-679c-c1ea-2bf3-862c875e1044@amd.com>
Date: Thu, 21 Dec 2023 15:57:03 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 6/7] platform/x86: Convert to ACPI based probing
To: =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 Naveen Krishna Chatradhi <nchatrad@amd.com>
References: <20231220165528.1351200-1-suma.hegde@amd.com>
 <20231220165528.1351200-7-suma.hegde@amd.com>
 <5cda9436-f2e7-7b7a-46d4-82e5b0e07cb@linux.intel.com>
Content-Language: en-US
From: "Hegde, Suma" <Suma.Hegde@amd.com>
In-Reply-To: <5cda9436-f2e7-7b7a-46d4-82e5b0e07cb@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0193.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::16) To LV2PR12MB5966.namprd12.prod.outlook.com
 (2603:10b6:408:171::21)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5966:EE_|DS0PR12MB7898:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b1a92ea-2fe4-4894-50c1-08dc020f63b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7aGwrBK3LBIDYzsG35eClIALnTOxa/s//ZFufGrTUnHtQcsTmhnluuqCLFUy1EscFgtdoRowanfW6hIZdqZDqRemc/6d/b9e+ziru70x+MmwXldqjJTDYdSqiny+wnEfRkc9lwm621ZTWX0u9nbsaAgrdm6Ng/FrDIYgiFsD9t2s5aFyk4y+8Elq6buXY+Qddu1j6qNhbJqghhw1nlPu8cOF2/MqvIl5bc/0k73A0pqnLcTzqCKHPqOMscWyWQqRXdGwHCquo6OpaeRwPurXWbXGSLT2YGHJOBABpEwUjgkwPMl2srnpdlLA8KOmq4xagFtcYn7w2vHLvuuS3VQ00uix7FvPB+2mhlXpVZ+XhezrZUI43S5Sd46Ac0csur6soyJ3MjvDObZwY9n0XDehSHWIXE/znyANx1kq+j+FLftPjf5iAKuZDa3ytTxgDWnn5zI20zT0GAlwjGHDd8cE+dQZUw/lYxIBaQY81ArsF0JzUc0GVSLWb3bvol0NTKQfka178azubxgk9gAr0z763LXZYOtKSoq1mBPCUe0eMvKeM9xH7v9/alCjEOO/V6feLOdu+zNTIn95qhj8+ZPtZfObnJwgndzQeQve4MfSAGSJZ7pNFhFGh5DiNRHcS4D1htEFlYkkgv19l2EJpfiFGfTavTjL0C0v9GIFj7p9sjDYxT0A6riTtfIuektxRtik
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5966.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(376002)(136003)(39860400002)(346002)(230173577357003)(230273577357003)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(31696002)(66574015)(2616005)(6666004)(26005)(6506007)(6512007)(5660300002)(83380400001)(41300700001)(8676002)(8936002)(4326008)(30864003)(53546011)(6916009)(6486002)(316002)(478600001)(66556008)(66476007)(54906003)(66946007)(2906002)(86362001)(36756003)(38100700002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TTNEcVlTY0tGQ3hzZTNjM2tyZVJzSWI4cXJudTRzL2xkc1ZDQkZNK3V5Tlo4?=
 =?utf-8?B?b2c5Y3ROU2U0OU5HdEc2MTJEeGlkRUZVWUhuUGpiRzMvNG5jMy9ROEtlNHJi?=
 =?utf-8?B?ZFkvNldIVXR6QllRcDBvd01xUmg1U2VXOWhkMDNWVmozWUltUnU5SmVwa3VI?=
 =?utf-8?B?WmpaSkk4dzZqbmsxTEhSS0U4bk5lcTVxcEt1Y0dSQ0g5aVZ2MVFrbGZJMnpx?=
 =?utf-8?B?N2FIZGVBY0dxMFduSTExRjRjMGsxa0x5SUU4aFZ4MWVkNE1BTkd3S0Yrbm9x?=
 =?utf-8?B?N3NxdnJOekJtaEU4aytvcVFmSXpvMGtHNEdRMnlCbndhbVVlcm00Q1NkNUZU?=
 =?utf-8?B?NGI4WmczTHRoRlFMSEUxUFhvQUYvdXJzOWJYRFgzQkQzRmxUSW9rNTQxeGJx?=
 =?utf-8?B?QWJKVnB0U1FlZnZWeEJocDkxcktGckNjbWxZcFNQckxtbEdUeG0wVEE3cGty?=
 =?utf-8?B?d0o1dStjcEZmc3pCY0ZRRWlZTHN6MEFwWkl2TTh1K1RwcTdtNW95VEhBOUxW?=
 =?utf-8?B?T0xIaWZvdTJBUkdqOTV6bm9SSUQ3MFd5Tm5uRk5YcitnOUlkYmJ0VVp4UUN3?=
 =?utf-8?B?UEYrTWFtek5ka1lYOVZUNWgySWZVMWRHRTh6QU5uczZObTlUclE2TFh0Z2Na?=
 =?utf-8?B?dXY2b0FJUDBDZEF1NFhOTFZCbWoyaTU2Um96WHNnV0Nxa2JOWGdGZCtic0o3?=
 =?utf-8?B?Y1crUTNwMTVMV3MrbG5xQXE1cjZ2TGVhTHZibmw3OXBLR2IxQ1N0YkdkaXB3?=
 =?utf-8?B?d3RSclZRSUxkaUtJMlpQSUx2a01CMU8zZ1M5RndZZDEzdWVCNVB4UWxZUU00?=
 =?utf-8?B?bUFtSGRhVFhIWWVZaEFpTjlJWW5TSFRoRU8yWmJrU1pYQm1hOXl0K2JVYTQx?=
 =?utf-8?B?eGVMeElqMVBDOVB4aDN0aFNaNDFnd1hCVWVaZEhXaElpdjRYVkk5Y1FTWW1C?=
 =?utf-8?B?QVB0RWFrSFl3bnpZanZXaUt3dTVJbjZuODN0ZGpQWjZOME9qaDdqdWtpek5h?=
 =?utf-8?B?RWxSTUJLZFZyNExLTmJ6YXVBenllOTE0K0lzSnFvb2x3UHlGdnN5NkRqSWdN?=
 =?utf-8?B?ZTdpOTVCY0hyQ2h2bG16bHJPRVRvcmlIcE95czhrU2s3NlBSakZxT1lkQUtr?=
 =?utf-8?B?bDl4U1hSUGhjYjlqWGh3a3Y2aEk3Y1ZuZzVocTNtaFdRQWlhbW1JaXRodnZj?=
 =?utf-8?B?eXZ1bDdXWElPN0xnUExFUzlSNGZ5V0NsRUx5b3RlN1FmSng2cXdmVVpYUkxZ?=
 =?utf-8?B?d1ZmRGdzMDJSSkRUVkRYdGM4Y0FkSG1YNXZ5Yi9Ic2dPcEJDUUNQbHhHUTZi?=
 =?utf-8?B?NHhiVTh1R0YxTGdwSktXVEg3djlLQ2tIYlUwWVFYZEZ1aWNlbUFyMjM2enp2?=
 =?utf-8?B?ZWFBSVlaSElPMmhGSDYzb1E4R2ZwS052M3UyWUpRV3ptSnVsVVhuODdwc3hh?=
 =?utf-8?B?NVp5K3Y2cm9COHB1TDZBYzBvOFZueXNjSk9SN1haS3NsMW5qWmo2SWliMlBk?=
 =?utf-8?B?WGtmdFdLckNXajhMNm1jZ0NVZHBiaWE2cEw5RFIxUXJtUjE3K1psZlQyaXMw?=
 =?utf-8?B?WGZ6cDhZSFJEYzJ3cktocE9BRkoreWFBTHZCTVZrZVZRVGNBemFObVJtenNj?=
 =?utf-8?B?ZnJzRDZkWThFcnVwUy9LdkZtVkRhdVZPUE52WWZINk9GeVhYRjVFMkFweVhP?=
 =?utf-8?B?MTA2R2xnM0Z2c1V6T3FncXIyMVR3VDRKYmJFOFlNb3A4Zngxem9ZYUlxOW15?=
 =?utf-8?B?cXpwcU1wcC9rRkVXd3dlVVpFclJ6amlnbTBWeWdmenVBRkdBdjg5M1RRVVJ6?=
 =?utf-8?B?SkVicTdZT1FwUUpTOTl4ZVdLRUlkdVR1eDBTcy9oNitBc0VsSnFPc0dnblVW?=
 =?utf-8?B?NmdFLzhDUmZPc3M2RmpkKzcwdWpxUkM5Tk5pYW9GdTJJd1lnNnFSZDkyQXZa?=
 =?utf-8?B?L3lFb0dWc3lIQlNLUm5hcmRPTkRpUlVabnE3VWphVTlaWFBuSm0rM0xncktW?=
 =?utf-8?B?WUtnTGtLVkNtdTNxQWFDd3dYanlHOFM2eTFjbTEwRnFSdnAxemNhc3hNc1Bu?=
 =?utf-8?B?TUNiWWR6ZXNtV0hnS2lwMEpucURGaFB6Vk9iSnF4NGs3WG5PMTAxZ3NGRDFE?=
 =?utf-8?Q?r1hrIWnwvglBKetYoQB6z0IRZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b1a92ea-2fe4-4894-50c1-08dc020f63b5
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5966.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2023 10:27:10.1976
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fz0dF++EQgMNTaCKH1QTY/zx265cdZgrfOwqSOk3jnYnIspuVxvmFagHCx3YkQWrZzadOFdFfMN08TGPBDdw1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7898

Hi Ilpo,

On 12/20/2023 11:04 PM, Ilpo Järvinen wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>
>
> On Wed, 20 Dec 2023, Suma Hegde wrote:
>
>> ACPI table provides mailbox base address and register offset
>> information. The base address is provided as part of CRS method
>> and mailbox offsets are provided through DSD table.
>> Sockets are differentiated by UIDs.
>>
>> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
>> Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
>>
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
>>
>> ---
>>   drivers/platform/x86/amd/hsmp.c | 323 +++++++++++++++++++++++++++++---
>>   1 file changed, 296 insertions(+), 27 deletions(-)
>>
>> diff --git a/drivers/platform/x86/amd/hsmp.c b/drivers/platform/x86/amd/hsmp.c
>> index 3508399c6aa9..726ba73e23dd 100644
>> --- a/drivers/platform/x86/amd/hsmp.c
>> +++ b/drivers/platform/x86/amd/hsmp.c
>> @@ -18,9 +18,11 @@
>>   #include <linux/pci.h>
>>   #include <linux/platform_device.h>
>>   #include <linux/semaphore.h>
>> +#include <linux/acpi.h>
>>
>>   #define DRIVER_NAME          "amd_hsmp"
>> -#define DRIVER_VERSION               "2.0"
>> +#define DRIVER_VERSION               "2.2"
>> +#define ACPI_HSMP_DEVICE_HID "AMDI0097"
>>
>>   /* HSMP Status / Error codes */
>>   #define HSMP_STATUS_NOT_READY        0x00
>> @@ -54,6 +56,11 @@
>>
>>   #define HSMP_ATTR_GRP_NAME_SIZE      10
>>
>> +/* These are the strings specified in ACPI table */
>> +#define MSG_IDOFF_STR                "MsgIdOffset"
>> +#define MSG_ARGOFF_STR               "MsgArgOffset"
>> +#define MSG_RESPOFF_STR              "MsgRspOffset"
>> +
>>   struct hsmp_mbaddr_info {
>>        u32 base_addr;
>>        u32 msg_id_off;
>> @@ -66,6 +73,7 @@ struct hsmp_socket {
>>        struct bin_attribute hsmp_attr;
>>        struct hsmp_mbaddr_info mbinfo;
>>        void __iomem *metric_tbl_addr;
>> +     void __iomem *virt_base_addr;
>>        struct semaphore hsmp_sem;
>>        char name[HSMP_ATTR_GRP_NAME_SIZE];
>>        struct pci_dev *root;
>> @@ -78,12 +86,14 @@ struct hsmp_plat_device {
>>        struct hsmp_socket *sock;
>>        u32 proto_ver;
>>        u16 num_sockets;
>> +     bool is_acpi_device;
>> +     bool is_probed;
>>   };
>>
>>   static struct hsmp_plat_device plat_dev;
>>
>> -static int amd_hsmp_rdwr(struct hsmp_socket *sock, u32 offset,
>> -                      u32 *value, bool write)
>> +static int amd_hsmp_pci_rdwr(struct hsmp_socket *sock, u32 offset,
>> +                          u32 *value, bool write)
>>   {
>>        int ret;
>>
>> @@ -101,8 +111,29 @@ static int amd_hsmp_rdwr(struct hsmp_socket *sock, u32 offset,
>>        return ret;
>>   }
>>
>> +static void amd_hsmp_acpi_rdwr(struct hsmp_socket *sock, u32 offset,
>> +                            u32 *value, bool write)
>> +{
>> +     if (write)
>> +             iowrite32(*value, sock->virt_base_addr + offset);
>> +     else
>> +             *value = ioread32(sock->virt_base_addr + offset);
>> +}
>> +
>> +static int amd_hsmp_rdwr(struct hsmp_socket *sock, u32 offset,
>> +                      u32 *value, bool write)
>> +{
>> +     if (plat_dev.is_acpi_device)
>> +             amd_hsmp_acpi_rdwr(sock, offset, value, write);
>> +     else
>> +             return amd_hsmp_pci_rdwr(sock, offset, value, write);
>> +
>> +     return 0;
>> +}
>> +
>>   /*
>> - * Send a message to the HSMP port via PCI-e config space registers.
>> + * Send a message to the HSMP port via PCI-e config space registers
>> + * or by writing to MMIO space.
>>    *
>>    * The caller is expected to zero out any unused arguments.
>>    * If a response is expected, the number of response words should be greater than 0.
>> @@ -450,6 +481,9 @@ static int hsmp_create_sysfs_interface(void)
>>        int ret;
>>        u16 i;
>>
>> +     if (plat_dev.is_acpi_device)
>> +             return 0;
>> +
>>        /* String formatting is currently limited to u8 sockets */
>>        if (WARN_ON(plat_dev.num_sockets > U8_MAX))
>>                return -ERANGE;
>> @@ -487,13 +521,188 @@ static int hsmp_create_sysfs_interface(void)
>>        return devm_device_add_groups(plat_dev.sock[0].dev, hsmp_attr_grps);
>>   }
>>
>> -static int hsmp_cache_proto_ver(void)
>> +/* This is the UUID used for HSMP */
>> +static const guid_t acpi_hsmp_uuid = GUID_INIT(0xb74d619d, 0x5707, 0x48bd,
>> +                                             0xa6, 0x9f, 0x4e, 0xa2,
>> +                                             0x87, 0x1f, 0xc2, 0xf6);
>> +
>> +static inline bool is_acpi_hsmp_uuid(union acpi_object *obj)
>> +{
>> +     if (obj->type == ACPI_TYPE_BUFFER && obj->buffer.length == 16)
>> +             return guid_equal((guid_t *)obj->buffer.pointer, &acpi_hsmp_uuid);
>> +
>> +     return false;
>> +}
>> +
>> +static inline int hsmp_get_uid(struct device *dev, u16 *sock_ind)
>> +{
>> +     char *uid;
>> +
>> +     /*
>> +      * UID (ID00, ID01..IDXX) is used for differentiating sockets,
>> +      * read it and strip the "ID" part of it and convert the remaining
>> +      * bytes to integer.
>> +      */
>> +     uid = acpi_device_uid(ACPI_COMPANION(dev));
>> +
>> +     return kstrtou16((uid + 2), 10, sock_ind);
>> +}
>> +
>> +static acpi_status hsmp_resource(struct acpi_resource *res, void *data)
>> +{
>> +     struct hsmp_socket *sock = data;
>> +     struct resource r;
>> +
>> +     switch (res->type) {
>> +     case ACPI_RESOURCE_TYPE_FIXED_MEMORY32:
>> +             if (!acpi_dev_resource_memory(res, &r))
>> +                     return AE_ERROR;
>> +             if (!r.start || r.end < r.start || !(r.flags & IORESOURCE_MEM_WRITEABLE))
>> +                     return AE_ERROR;
>> +             sock->mbinfo.base_addr = r.start;
>> +             sock->mbinfo.size = r.end - r.start + 1;
> resource_size(r)
>
>> +             break;
>> +     case ACPI_RESOURCE_TYPE_END_TAG:
>> +             break;
>> +     default:
>> +             return AE_ERROR;
>> +     }
>> +
>> +     return AE_OK;
>> +}
>> +
>> +static int hsmp_read_acpi_dsd(struct hsmp_socket *sock)
>> +{
>> +     struct acpi_buffer buf = { ACPI_ALLOCATE_BUFFER, NULL };
>> +     union acpi_object *guid, *mailbox_package;
>> +     union acpi_object *dsd;
>> +     acpi_status status;
>> +     int ret = 0;
>> +     int j;
>> +
>> +     status = acpi_evaluate_object_typed(ACPI_HANDLE(sock->dev), "_DSD", NULL,
>> +                                         &buf, ACPI_TYPE_PACKAGE);
>> +     if (ACPI_FAILURE(status)) {
>> +             dev_err(sock->dev, "Failed to read mailbox reg offsets from DSD table, err: %s\n",
>> +                     acpi_format_exception(status));
>> +             return -EINVAL;
>> +     }
>> +
>> +     dsd = buf.pointer;
>> +
>> +     /* HSMP _DSD property should contain 2 objects.
>> +      * 1. guid which is an acpi object of type ACPI_TYPE_BUFFER
>> +      * 2. mailbox which is an acpi object of type ACPI_TYPE_PACKAGE
>> +      *    This mailbox object contains 3 more acpi objects of type
>> +      *    ACPI_TYPE_PACKAGE for holding msgid, msgresp, msgarg offsets
>> +      *    these packages inturn contain 2 acpi objects of type
>> +      *    ACPI_TYPE_STRING and ACPI_TYPE_INTEGER
>> +      */
>> +     if (!dsd || dsd->type != ACPI_TYPE_PACKAGE || dsd->package.count != 2) {
>> +             ret = -EINVAL;
>> +             goto free_buf;
>> +     }
>> +
>> +     guid = &dsd->package.elements[0];
>> +     mailbox_package = &dsd->package.elements[1];
>> +     if (!is_acpi_hsmp_uuid(guid) || mailbox_package->type != ACPI_TYPE_PACKAGE) {
>> +             dev_err(sock->dev, "Invalid hsmp _DSD table data\n");
>> +             ret = -EINVAL;
>> +             goto free_buf;
>> +     }
>> +
>> +     for (j = 0; j < mailbox_package->package.count; j++) {
>> +             union acpi_object *msgobj, *msgstr, *msgint;
>> +
>> +             msgobj  = &mailbox_package->package.elements[j];
>> +             msgstr  = &msgobj->package.elements[0];
>> +             msgint  = &msgobj->package.elements[1];
>> +
>> +             /* package should have 1 string and 1 integer object */
>> +             if (msgobj->type != ACPI_TYPE_PACKAGE ||
>> +                 msgstr->type != ACPI_TYPE_STRING ||
>> +                 msgint->type != ACPI_TYPE_INTEGER) {
>> +                     ret = -EINVAL;
>> +                     goto free_buf;
>> +             }
>> +
>> +             if (!strncmp(msgstr->string.pointer, MSG_IDOFF_STR,
>> +                          msgstr->string.length)) {
>> +                     sock->mbinfo.msg_id_off = msgint->integer.value;
>> +             } else if (!strncmp(msgstr->string.pointer, MSG_RESPOFF_STR,
>> +                                 msgstr->string.length)) {
>> +                     sock->mbinfo.msg_resp_off =  msgint->integer.value;
>> +             } else if (!strncmp(msgstr->string.pointer, MSG_ARGOFF_STR,
>> +                                 msgstr->string.length)) {
>> +                     sock->mbinfo.msg_arg_off = msgint->integer.value;
>> +             } else {
>> +                     ret = -EINVAL;
>> +                     goto free_buf;
>> +             }
>> +     }
>> +
>> +     if (!sock->mbinfo.msg_id_off || !sock->mbinfo.msg_resp_off ||
>> +         !sock->mbinfo.msg_arg_off)
>> +             ret = -EINVAL;
> These smell like return -ENODEV or -ENOENT but I don't have an idea what
> ACPI related funcs typically return.

acpi_object is an input to this module, in that sense, we are returning 
EINVAL.

I compared with few acpi drivers and accordingly changed to ENODEV and 
ENOENT in some places and retained EINVAL in some places.

I will address the other comments also and send patch set 3.

>> +free_buf:
>> +     ACPI_FREE(buf.pointer);
>> +     return ret;
>> +}
>> +
>> +static int hsmp_read_acpi_crs(struct hsmp_socket *sock)
>> +{
>> +     acpi_status status;
>> +
>> +     status = acpi_walk_resources(ACPI_HANDLE(sock->dev), METHOD_NAME__CRS,
>> +                                  hsmp_resource, sock);
>> +     if (ACPI_FAILURE(status)) {
>> +             dev_err(sock->dev, "Failed to look up MP1 base address from CRS method, err: %s\n",
>> +                     acpi_format_exception(status));
>> +             return -EINVAL;
>> +     }
>> +     if (!sock->mbinfo.base_addr || !sock->mbinfo.size)
>> +             return -EINVAL;
>> +
>> +     /* The mapped region should be un cached */
>> +     sock->virt_base_addr = devm_ioremap_uc(sock->dev, sock->mbinfo.base_addr,
>> +                                            sock->mbinfo.size);
>> +     if (!sock->virt_base_addr) {
>> +             dev_err(sock->dev, "Failed to ioremap MP1 base address\n");
>> +             return -ENOMEM;
>> +     }
>> +
>> +     return 0;
>> +}
>> +
>> +/* Parse the ACPI table to read the data */
>> +static int hsmp_parse_acpi_table(struct device *dev, u16 sock_ind)
>> +{
>> +     struct hsmp_socket *sock = &plat_dev.sock[sock_ind];
>> +     int ret;
>> +
>> +     sock->sock_ind          = sock_ind;
>> +     sock->dev               = dev;
>> +     plat_dev.is_acpi_device = true;
>> +
>> +     sema_init(&sock->hsmp_sem, 1);
>> +
>> +     /* Read MP1 base address from CRS method */
>> +     ret = hsmp_read_acpi_crs(sock);
>> +     if (ret)
>> +             return ret;
>> +
>> +     /* Read mailbox offsets from DSD table */
>> +     return hsmp_read_acpi_dsd(sock);
>> +}
>> +
>> +static int hsmp_cache_proto_ver(u16 sock_ind)
>>   {
>>        struct hsmp_message msg = { 0 };
>>        int ret;
>>
>>        msg.msg_id      = HSMP_GET_PROTO_VER;
>> -     msg.sock_ind    = 0;
>> +     msg.sock_ind    = sock_ind;
>>        msg.response_sz = hsmp_msg_desc_table[HSMP_GET_PROTO_VER].response_sz;
>>
>>        ret = hsmp_send_message(&msg);
>> @@ -532,28 +741,62 @@ static int initialize_platdev(struct device *dev)
>>        return 0;
>>   }
>>
>> +static const struct acpi_device_id amd_hsmp_acpi_ids[] = {
>> +     {ACPI_HSMP_DEVICE_HID, 0},
>> +     {}
>> +};
>> +MODULE_DEVICE_TABLE(acpi, amd_hsmp_acpi_ids);
>> +
>>   static int hsmp_pltdrv_probe(struct platform_device *pdev)
>>   {
>> +     struct acpi_device *adev;
>> +     u16 sock_ind = 0;
>>        int ret;
>>
>> -     plat_dev.sock = devm_kzalloc(&pdev->dev,
>> -                                  (plat_dev.num_sockets * sizeof(struct hsmp_socket)),
>> -                                  GFP_KERNEL);
>> -     if (!plat_dev.sock)
>> -             return -ENOMEM;
>> -
>> -     ret = initialize_platdev(&pdev->dev);
>> -     if (ret)
>> -             return ret;
>> +     /*
>> +      * On ACPI supported BIOS, there is an ACPI HSMP device added for
>> +      * each socket, so the per socket probing, but the memory allocated for
>> +      * sockets should be contiguous to access it as an array,
>> +      * Hence allocate memory for all the sockets at once instead of allocating
>> +      * on each probe.
>> +      */
>> +     if (!plat_dev.is_probed) {
>> +             plat_dev.sock = devm_kzalloc(&pdev->dev,
>> +                                          (plat_dev.num_sockets * sizeof(struct hsmp_socket)),
>> +                                          GFP_KERNEL);
>> +             if (!plat_dev.sock)
>> +                     return -ENOMEM;
>> +     }
>>
>> -     plat_dev.hsmp_device.name       = HSMP_CDEV_NAME;
>> -     plat_dev.hsmp_device.minor      = MISC_DYNAMIC_MINOR;
>> -     plat_dev.hsmp_device.fops       = &hsmp_fops;
>> -     plat_dev.hsmp_device.parent     = &pdev->dev;
>> -     plat_dev.hsmp_device.nodename   = HSMP_DEVNODE_NAME;
>> -     plat_dev.hsmp_device.mode       = 0644;
>> +     adev = ACPI_COMPANION(&pdev->dev);
>> +     if (adev && !acpi_match_device_ids(adev, amd_hsmp_acpi_ids)) {
>> +             ret = hsmp_get_uid(&pdev->dev, &sock_ind);
>> +             if (ret)
>> +                     return ret;
>> +             if (sock_ind >= plat_dev.num_sockets)
>> +                     return -EINVAL;
> Again, caller didn't provide invalid value here either.
>
>> +             ret = hsmp_parse_acpi_table(&pdev->dev, sock_ind);
>> +             if (ret) {
>> +                     dev_err(&pdev->dev, "Failed to parse ACPI table\n");
>> +                     return ret;
>> +             }
>> +             /* Test the hsmp interface */
>> +             ret = hsmp_test(sock_ind, 0xDEADBEEF);
>> +             if (ret) {
>> +                     dev_err(&pdev->dev, "HSMP test message failed on Fam:%x model:%x\n",
>> +                             boot_cpu_data.x86, boot_cpu_data.x86_model);
>> +                     dev_err(&pdev->dev, "Is HSMP disabled in BIOS ?\n");
>> +                     return ret;
>> +             }
>> +     } else {
>> +             ret = initialize_platdev(&pdev->dev);
>> +             if (ret) {
>> +                     dev_err(&pdev->dev, "Failed to init HSMP mailbox\n");
>> +                     return ret;
>> +             }
>> +     }
>>
>> -     ret = hsmp_cache_proto_ver();
>> +     ret = hsmp_cache_proto_ver(sock_ind);
>>        if (ret) {
>>                dev_err(&pdev->dev, "Failed to read HSMP protocol version\n");
>>                return ret;
>> @@ -563,12 +806,35 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
>>        if (ret)
>>                dev_err(&pdev->dev, "Failed to create HSMP sysfs interface\n");
>>
>> -     return misc_register(&plat_dev.hsmp_device);
>> +     if (!plat_dev.is_probed) {
>> +             plat_dev.hsmp_device.name       = HSMP_CDEV_NAME;
>> +             plat_dev.hsmp_device.minor      = MISC_DYNAMIC_MINOR;
>> +             plat_dev.hsmp_device.fops       = &hsmp_fops;
>> +             plat_dev.hsmp_device.parent     = &pdev->dev;
>> +             plat_dev.hsmp_device.nodename   = HSMP_DEVNODE_NAME;
>> +             plat_dev.hsmp_device.mode       = 0644;
>> +
>> +             ret = misc_register(&plat_dev.hsmp_device);
>> +             if (ret)
>> +                     return ret;
>> +
>> +             plat_dev.is_probed = true;
>> +     }
>> +
>> +     return 0;
>> +
>>   }
>>
>>   static void hsmp_pltdrv_remove(struct platform_device *pdev)
>>   {
>> -     misc_deregister(&plat_dev.hsmp_device);
>> +     /*
>> +      * We register only one misc_device even on multi socket system.
>> +      * So, deregister should happen only once.
>> +      */
>> +     if (plat_dev.is_probed) {
>> +             misc_deregister(&plat_dev.hsmp_device);
>> +             plat_dev.is_probed = false;
>> +     }
>>   }
>>
>>   static struct platform_driver amd_hsmp_driver = {
>> @@ -576,6 +842,7 @@ static struct platform_driver amd_hsmp_driver = {
>>        .remove_new     = hsmp_pltdrv_remove,
>>        .driver         = {
>>                .name   = DRIVER_NAME,
>> +             .acpi_match_table = amd_hsmp_acpi_ids,
>>        },
>>   };
>>
>> @@ -618,9 +885,11 @@ static int __init hsmp_plt_init(void)
>>        if (ret)
>>                return ret;
>>
>> -     ret = hsmp_plat_dev_register();
>> -     if (ret)
>> -             platform_driver_unregister(&amd_hsmp_driver);
>> +     if (!plat_dev.is_acpi_device) {
>> +             ret = hsmp_plat_dev_register();
>> +             if (ret)
>> +                     platform_driver_unregister(&amd_hsmp_driver);
>> +     }
>>
>>        return ret;
>>   }
>>
> --
>   i.

Thanks and Regards,

Suma

