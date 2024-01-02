Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2044.outbound.protection.outlook.com [40.107.100.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A278FBEB
	for <platform-driver-x86@vger.kernel.org>; Tue,  2 Jan 2024 13:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="agXLTKCz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KLk1kVyO4ZYcgjHrwqWGp8OEUviD4Tu4yks6x8AzmIJoC3867OeGoM+dxOUiUN0U29u+LcCFGp2t2rxDRRhhOUXAPLKWNk3cQebI10u1pSjkBgyk7yg1+Of0ObcZ6AXqdK3Qfg3FbxImp6nAZYt5PQULNzZ4qNRXCAgRWdeFrG4xhnNxCswGTzyWsvDoOv17oLcJS9YGPBgbp0rpUnWsRzbjPtivNKQ6vNFnTeU7alTBbxAX+glF+bONPGNIVSzlLEIQnyBA9Gynq5PYrD7IJZ7L7gPn9jM48UwC93pKr3r3mnLRNcIVph3oWEX26a8ETWZN861vB7WkJ3UFXZdjqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NixJzl2Nx4vqEoGM64WIg0E3Yj1wSHS2Y7CGUAdNax4=;
 b=oc2aqRD+wc1d/W9swfxftUSqSjdR0WbAxa3za6EJ/4dWb8d3/d04lcd7lbEe7om7NbuBiSho4CwweZ4hNGNJrafj+P9lPmq1fW0OTIekQO2H+4hk8x0bqS5+Lh9nP0f311wnRNgWCwsEzM+kR6aTKjEkSHOABWcCEM2tVv6b3ustsgKEJEY1XrJpta5LCrFKj/8VIr3vk7F00CMoN8EleLxGVi3LbThzRw/qa02XoxGmVLfCjpoVpoMO6yVGCJawD8PL6diVakHlJeUBVNqiEczHXWyaFiPF5BA0oCALM11UW1csHmv4Q6sm1PTi0rAUG6IFcIy/zpOYwKnRoTpgaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NixJzl2Nx4vqEoGM64WIg0E3Yj1wSHS2Y7CGUAdNax4=;
 b=agXLTKCzpukUJzMYph+W3KkFSqzbDSVjwdWGuRTtosk/uJ7JpJbcIZ3NciiXEEq1kR2zblakdqg2qK0VnJqK0FevKsPVP15lqPQIg24A+YCIl9WuEB79kcXDSJkdajqYtO9vOJRi3G4a/SkGWgNB1TwVN7Nl/+vE1CvffCu3MPI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV2PR12MB5966.namprd12.prod.outlook.com (2603:10b6:408:171::21)
 by DM4PR12MB6400.namprd12.prod.outlook.com (2603:10b6:8:b9::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7135.25; Tue, 2 Jan 2024 13:24:35 +0000
Received: from LV2PR12MB5966.namprd12.prod.outlook.com
 ([fe80::27d5:9024:445e:5c45]) by LV2PR12MB5966.namprd12.prod.outlook.com
 ([fe80::27d5:9024:445e:5c45%7]) with mapi id 15.20.7135.023; Tue, 2 Jan 2024
 13:24:35 +0000
Message-ID: <072334eb-d5ea-2bce-c783-5a150348e5aa@amd.com>
Date: Tue, 2 Jan 2024 18:54:28 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 6/7] platform/x86: Convert to ACPI based probing
To: Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
 Naveen Krishna Chatradhi <nchatrad@amd.com>
References: <20231221172114.1569559-1-suma.hegde@amd.com>
 <20231221172114.1569559-6-suma.hegde@amd.com>
 <19cedcb8-eb39-bee4-fcd4-5d7a375e5ca@linux.intel.com>
 <efd6da98-2c11-4bf4-a328-d0f3b28aeb16@redhat.com>
Content-Language: en-US
From: "Hegde, Suma" <Suma.Hegde@amd.com>
In-Reply-To: <efd6da98-2c11-4bf4-a328-d0f3b28aeb16@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0P287CA0009.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::9) To LV2PR12MB5966.namprd12.prod.outlook.com
 (2603:10b6:408:171::21)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5966:EE_|DM4PR12MB6400:EE_
X-MS-Office365-Filtering-Correlation-Id: d167485d-ae26-4950-14dc-08dc0b96299d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3oJmKateOTiaywanOfaa2AWcHPeol7BXrMQhxsNnEirMsVZOvM20aYtmetg8+bsafIx9HHr3X4qMxwgHtGoE75EhjZQSGDJ7PlirbZoASO36cbCWlprZtK04imkOo+k18NCzJilF/YqEUpGaIA1oQAi7XohhGfu03HdhT33tAzuNiOMhGcWK/E9LBZzucGNzRxQeredRzlO3g2Dy6s6WXpJZQzL1jx5LHzcbnGHHPcnRFTm5mUovmvsPJklEpEmcZt92KLTIdUXzNoPA13mVWLKpG1YJcUjCEslPc4pFdFwjJ5A7uGp9yxgtO8gk2V23CN+u6CueK2LZlqi+jaWofwRNRo4bp+x40htg2VMv+pUq5796yMJJeiURo3xRTPvQMuK3C9//HhMiMV9N/cryerri1O39TTNdfiaC3zGaBX+1hvMJTZiIuU2w85uPcSlvlWfQ/2y6J6c6ebojofQXERMS2A0ZMVhYz87n6Pvx5Z0nHdT2ueGt9lwIAF+a2OpSwbJxBMLbQB8Ek4fby/GQEBEtufCu23gVkYEVCyyQ0WlioKMBIDJ8jTzfKpy4vI8+vFa0x0H/SjnTIEER7Xi9z2RH5r7S2c7yH+PKwpxbgABSTNA8f07s7mYTTX7bFhJ4ScTNlIJxB37FSW9cxOn8FnI35O3j1fmpFg5CnDMUVpvxV68Hn2iakP/DvJb87fQ1
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5966.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(366004)(396003)(376002)(39860400002)(230273577357003)(230173577357003)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(31686004)(2616005)(26005)(66574015)(83380400001)(86362001)(31696002)(38100700002)(36756003)(4326008)(5660300002)(55236004)(6512007)(6506007)(6666004)(53546011)(8676002)(66946007)(66476007)(8936002)(316002)(66556008)(478600001)(41300700001)(110136005)(2906002)(6486002)(966005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RjFZdytLVmFZSmRFRW1RU1ZzREp0THg2cTlXZDBKNXZsZjUzLzZZRGdVdTY4?=
 =?utf-8?B?RlVjRURLN1JHS1NDd2NCL1RWU3dkSlQ4aFEvRXpTcHZiWVRTOFRFUnRCVG5Q?=
 =?utf-8?B?Ujh2SWowTTY0TGcxSHAzQjNNMTMyc0RxVkFxVzE5ZDFwY1BmOXFzSkcxb3V6?=
 =?utf-8?B?MFRhNnJJWEErV3ZybUFWa1hYZ2tud2c5VzN3MVBOS0Y5TjVNVjRPaVBnM0xP?=
 =?utf-8?B?Qkw3WU8wVlFyc2Q5ZlBzNWs1K1RmbVZpam00eWMyNUV5NkpZdlNqSHNwc0k1?=
 =?utf-8?B?cmNqWVNyc1RLMFZtUXVwc2I2K2xFTkFjeGg5UDVLeXlKSzkxL3FucHFUaDNO?=
 =?utf-8?B?Q0xUUzBwa2tBQXhmVzR5WWpsUXhMYXg0WUM1bG02NUVjZGlqbmFZdlArQkJw?=
 =?utf-8?B?WDFnTUlaUllTYWtPL2ZkdUYydnR1OFNGa2hPNDV3Y0w2Ri96QnoreUtvSGI2?=
 =?utf-8?B?dmJpbzhXSUgxSnp0SjBub3djQmNTTml2OGpsUDBLcEswRGYwZk1uWVF0b0dG?=
 =?utf-8?B?b0dhd3RqYnBMam5YRDNBWStHYStsY241dEd0RS9jb3NNZ3BGZytlS0ppb3M5?=
 =?utf-8?B?RUdwdVAxNWxjaHczYThjVG1Qd2l4THJsaUhvVzZuRUtoZDZBYmhkc3dZYk0r?=
 =?utf-8?B?S1NRZUNYMlJxODBKRUlWbnNFbjFkeEprZUZYWVZud3FWdjVjWncwYk55OXFv?=
 =?utf-8?B?VEc0aks3TVFVN2dhMVUrUjVSdXNwODBLbXBrNXVUeHNVZElaUXloMkJQLzNM?=
 =?utf-8?B?VjBrWFJPN0dHVW9raDZjRlhtZUxMalpaTFlNamQ2WTZ6alZGbmlwU2g3Ry9j?=
 =?utf-8?B?Q1VNUkg1THVJTnFKYTU0WHlEcnlndlNlcFBlUU4xamxpYTJmKy9DZWovcFF0?=
 =?utf-8?B?Rm43dU9LUGhYbk43RW1XdERXdjB6Z1hFNUFWU2Q2Z0ZCbEFoSkpNcVU0Y3FB?=
 =?utf-8?B?K0dIbVd1ZmNhZTl3U0llRytEbk9Cd1dJNEhSNGdRVXBBYW1sL3B5OFdTSGww?=
 =?utf-8?B?bWVUbWY1djdmQm8zaDZZZUZSNlhkRnVSL3QxeGcvSTZlRHlLMHZLZXZITWwz?=
 =?utf-8?B?ZHlOUzh6V2pzSlA5dVJtK1B4YW0vYldYV0Npc0x3QkhJVmJnSHphVjg3Ry9i?=
 =?utf-8?B?ZUdYWlBxL3lWdzY4UndhOTFWbVpUcHphcTVjTjRSakJNUlFic0NqcFdOOWU5?=
 =?utf-8?B?NE8wenI4b0NWd3ZFcXk4ZmVzeUtCU084YklyeGhxZDNLalJtaHc1NXNWeUd4?=
 =?utf-8?B?dE0rRWRIOGpienlXVnhhTThsZlU3QWdIMzBySnhMVE11NzFSOFZMSGpvRXFW?=
 =?utf-8?B?aWZBWXczbzQ2azgzRWVCNWpTVGRuNlVGWldpRitwZGZkNmZMdzQ1ek5JdzlU?=
 =?utf-8?B?dW9YQ3orTURiZllRSmg0MjFteWhPUjdUdngyNlQrVHZqaDVPb2NWZC9TZGNN?=
 =?utf-8?B?ZzZpdEx2WFRhT0h6L2YramVna3o1L2tVVmpwcUR5VGtiOHlTTHA5QmxpaUlU?=
 =?utf-8?B?clVSTnhEeGtCNGFiY2ZLWG9va2RJdWw5eGxqaGMrVVUzNUNKUnlBRU9OSE56?=
 =?utf-8?B?QlhyaHpUUmY3R0ZRN2FNM2w4c293QS9tS0lWcEUyVkdFa2xsZ2l2WWNGdDk3?=
 =?utf-8?B?TnFNQXMxYkdJMUdCRUMzSGRML2x1LzVKanUwcjNTRDV4RTF4ODBVV3ZUZGJ6?=
 =?utf-8?B?NjBDYjhFcDFGTW5yeEVBM3hBUWpRTk1qTFdlVTVRMUFXb1VRM0RWUjYvQ3JO?=
 =?utf-8?B?QWdrS1k4VUNnZjg2bGx4ckU4bHdSYjNlODFjU1kwa0pWYVJSZ3RyL3NlWkV5?=
 =?utf-8?B?c0JLeVFySkFGWHlmdkpjd3VUU0ZadFo5b2M1b0hoYUEzcGUzMlNpdldPUFJO?=
 =?utf-8?B?OW1SVy9FRWlsK2pkbmNELzVwMmxhNGZteU9welQvWmRtS1phMmRGNjFuNThp?=
 =?utf-8?B?dWNieGNQQ1lpT1Q5Wm9uNDFSQzYrd1JyUTJzbjA2d0FmUW92LzkyRkVyaUlJ?=
 =?utf-8?B?K3d4aTQ0T1dyektzZEUyWWRCVWJ1a2ZQcmY5dldseFQreWNqTGJoTVFycXFT?=
 =?utf-8?B?bHphUnl4SWp3ZXFBVFovdGJxOUY2OVhjYjI0QTVwajZGZUhickR3MktVS0RZ?=
 =?utf-8?Q?opWra6bhZr4Myqtq0RrAFN0fm?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d167485d-ae26-4950-14dc-08dc0b96299d
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5966.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2024 13:24:35.3982
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JogZFZpRB8Cbgw0bKXGLEnwxlNNAodit8BbjZUPbolcXEnDQ53F0MRtSgNnmE2A3I+RTrHFehv48cDPNCsSoLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6400

Hi Hans,

On 1/2/2024 6:11 PM, Hans de Goede wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>
>
> Hi Suma,
>
> On 12/22/23 09:51, Ilpo Järvinen wrote:
>> On Thu, 21 Dec 2023, Suma Hegde wrote:
>>
>>> ACPI table provides mailbox base address and register offset
>>> information. The base address is provided as part of CRS method
>>> and mailbox offsets are provided through DSD table.
>>> Sockets are differentiated by UIDs.
>>>
>>> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
>>> Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
>>> ---
>>> Changes since v1:
>>> 1. Define amd_hsmp_acpi_rdwr() for doing mailbox memory mapped io
>>> 2. Add a check to see if mailbox register offsets are set in
>>>     hsmp_read_acpi_dsd()
>>> 3. Add a check to see if sock->mbinfo.base_addr sockck->mbinfo.size are
>>>     set in hsmp_read_acpi_crs()
>>> 4. Change order of the statements in switch case ACPI_RESOURCE_TYPE_FIXED_MEMORY32
>>>     in hsmp_resource()
>>> 5. Add hsmp_test() after hsmp_parse_acpi_table() call
>>> 6. Add r.end < r.start check in hsmp_resource()
>>> 7. Add !dsd error check in hsmp_read_acpi_dsd
>>> Changes since v2:
>>> 1. Change EINVAL to ENODEV in hsmp_read_acpi_dsd()
>>> 2. Change EINVAL to ENOENT in hsmp_read_acpi_dsd()
>>> 3. Use resource_size() in hsmp_resource()
>>>
>>>   drivers/platform/x86/amd/hsmp.c | 324 +++++++++++++++++++++++++++++---
>>>   1 file changed, 296 insertions(+), 28 deletions(-)
>>>
>>> diff --git a/drivers/platform/x86/amd/hsmp.c b/drivers/platform/x86/amd/hsmp.c
>>> index e77d4cd83a07..46924c572055 100644
>>> --- a/drivers/platform/x86/amd/hsmp.c
>>> +++ b/drivers/platform/x86/amd/hsmp.c
>>> @@ -18,9 +18,11 @@
>>>   #include <linux/pci.h>
>>>   #include <linux/platform_device.h>
>>>   #include <linux/semaphore.h>
>>> +#include <linux/acpi.h>
>>>
>>>   #define DRIVER_NAME         "amd_hsmp"
>>> -#define DRIVER_VERSION              "2.0"
>>> +#define DRIVER_VERSION              "2.2"
>>> +#define ACPI_HSMP_DEVICE_HID        "AMDI0097"
>>>
>>>   /* HSMP Status / Error codes */
>>>   #define HSMP_STATUS_NOT_READY       0x00
>>> @@ -54,6 +56,11 @@
>>>
>>>   #define HSMP_ATTR_GRP_NAME_SIZE     10
>>>
>>> +/* These are the strings specified in ACPI table */
>>> +#define MSG_IDOFF_STR               "MsgIdOffset"
>>> +#define MSG_ARGOFF_STR              "MsgArgOffset"
>>> +#define MSG_RESPOFF_STR             "MsgRspOffset"
>>> +
>>>   struct hsmp_mbaddr_info {
>>>       u32 base_addr;
>>>       u32 msg_id_off;
>>> @@ -66,6 +73,7 @@ struct hsmp_socket {
>>>       struct bin_attribute hsmp_attr;
>>>       struct hsmp_mbaddr_info mbinfo;
>>>       void __iomem *metric_tbl_addr;
>>> +    void __iomem *virt_base_addr;
>>>       struct semaphore hsmp_sem;
>>>       char name[HSMP_ATTR_GRP_NAME_SIZE];
>>>       struct pci_dev *root;
>>> @@ -78,12 +86,14 @@ struct hsmp_plat_device {
>>>       struct hsmp_socket *sock;
>>>       u32 proto_ver;
>>>       u16 num_sockets;
>>> +    bool is_acpi_device;
>>> +    bool is_probed;
>>>   };
>>>
>>>   static struct hsmp_plat_device plat_dev;
>>>
>>> -static int amd_hsmp_rdwr(struct hsmp_socket *sock, u32 offset,
>>> -                     u32 *value, bool write)
>>> +static int amd_hsmp_pci_rdwr(struct hsmp_socket *sock, u32 offset,
>>> +                         u32 *value, bool write)
>>>   {
>>>       int ret;
>>>
>>> @@ -101,8 +111,29 @@ static int amd_hsmp_rdwr(struct hsmp_socket *sock, u32 offset,
>>>       return ret;
>>>   }
>>>
>>> +static void amd_hsmp_acpi_rdwr(struct hsmp_socket *sock, u32 offset,
>>> +                           u32 *value, bool write)
>>> +{
>>> +    if (write)
>>> +            iowrite32(*value, sock->virt_base_addr + offset);
>>> +    else
>>> +            *value = ioread32(sock->virt_base_addr + offset);
>>> +}
>>> +
>>> +static int amd_hsmp_rdwr(struct hsmp_socket *sock, u32 offset,
>>> +                     u32 *value, bool write)
>>> +{
>>> +    if (plat_dev.is_acpi_device)
>>> +            amd_hsmp_acpi_rdwr(sock, offset, value, write);
>>> +    else
>>> +            return amd_hsmp_pci_rdwr(sock, offset, value, write);
>>> +
>>> +    return 0;
>>> +}
>>> +
>>>   /*
>>> - * Send a message to the HSMP port via PCI-e config space registers.
>>> + * Send a message to the HSMP port via PCI-e config space registers
>>> + * or by writing to MMIO space.
>>>    *
>>>    * The caller is expected to zero out any unused arguments.
>>>    * If a response is expected, the number of response words should be greater than 0.
>>> @@ -450,6 +481,9 @@ static int hsmp_create_sysfs_interface(void)
>>>       int ret;
>>>       u16 i;
>>>
>>> +    if (plat_dev.is_acpi_device)
>>> +            return 0;
>> This comes out of nowhere... Why proto_ver isn't enough to handle this?
>> If it's needed, would the check perhaps belong to
>> hsmp_is_sock_attr_visible() instead?
>>
>>>       /* String formatting is currently limited to u8 sockets */
>>>       if (WARN_ON(plat_dev.num_sockets > U8_MAX))
>>>               return -ERANGE;
>>> @@ -487,13 +521,188 @@ static int hsmp_create_sysfs_interface(void)
>>>       return devm_device_add_groups(plat_dev.sock[0].dev, hsmp_attr_grps);
>>>   }
>>>
>>> -static int hsmp_cache_proto_ver(void)
>>> +/* This is the UUID used for HSMP */
>>> +static const guid_t acpi_hsmp_uuid = GUID_INIT(0xb74d619d, 0x5707, 0x48bd,
>>> +                                            0xa6, 0x9f, 0x4e, 0xa2,
>>> +                                            0x87, 0x1f, 0xc2, 0xf6);
>>> +
>>> +static inline bool is_acpi_hsmp_uuid(union acpi_object *obj)
>>> +{
>>> +    if (obj->type == ACPI_TYPE_BUFFER && obj->buffer.length == 16)
>> 16 -> UUID_SIZE.
> Please submit a v4 addressing Ilpo's review remarks on this patch.
>
> And while at it please also fix the subject-prefix to be:
>
> platform/x86/amd/hsmp:
>
> As suggested by Thomas.
>
> There have been a bunch of drivers/platform/x86/amd changes merged
> recently, please base your v4 on top of:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans
>
> to avoid conflicts.
Sure, I will send v4 with addressing review comments and re basing on top of

https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Thanks and Regards,

Suma

> Regards,
>
> Hans
>
>
