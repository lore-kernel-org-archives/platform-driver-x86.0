Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 163F6EE6459
	for <platform-driver-x86@archiver.kernel.org>; Fri, 15 Sep 2023 11:49:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234185AbjIOLtd (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 15 Sep 2023 07:49:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232836AbjIOLtc (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 15 Sep 2023 07:49:32 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDEED1AC
        for <platform-driver-x86@vger.kernel.org>; Fri, 15 Sep 2023 04:49:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GFDPv22D1zlpAThxFqdJ+u5A9B499xSXVCSbAcgdAHmptkggVrO46qOK7+m/Vl003CRpE3DnLvEIL0JDAb9aLocXgI+CCBADXxiNrRAMvPoqSTmCeuxcP8s6k5/FBCFzqYWK0VNCc8142uRv5paEdCDzd2kOtWN/CoEB65mW2rEuM0+4XhqnoO6SpNeQPQfcc7Q8ZU+06N96STDD1U9sSzzLEUPGXIBWVKUcjOUiUYodLZ6auK9nsqKAxi0xF1XWX5hi5pe5ArPt59B9Ni8Iwgc0Z8Panb0GsxrdQtbuFwtkSJmdeVBlhmT6PxCkRAUJXwSwHbKMBZ7JhiEmuc4HtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uWCtkaZbifzZphrhUtHOfSDIgjDJO9z8GWS6d4Pxx28=;
 b=jqVoQNp5+1RrRqYcicsq0pA6hr9l5r1otjj6Ip5jtw/8BC0EwWY8ktOszpwjA4hxxZi0Y2axdm10Blr8Gl/BYBxvJS1P0MLT9UjHoclHUz1qTwNn8t58adx1OCPdrsua+RRE9eG4mzN1BawuRkvEZgKzBXzB8maEZ3hlEInrbugeT6aZASFlCKXbgLPxH6wA1eAgmdm8jGAe8ZZ5Za6Xg5WEEIru6Nr4wWBnSUZ7uwyH+mgLPJNnBTannp6AKI7f1JVOeF7+BW7VouI4l+KvGmugzWmTeJQ8dT60Un+w5s72+NtFeTScWwY7ogKeh8Etpn+R6D+VqibQ2pZiOIAF4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uWCtkaZbifzZphrhUtHOfSDIgjDJO9z8GWS6d4Pxx28=;
 b=aLAGxyB6iqLfmCCVImEN+BkvVlzTOOuNtfXytbkkRBwp82z9VNnYHEvqPHXgzf6dE8z7MWyZWx9w8mEu7/1O3GbzbAA3ifNd3QbCu09i5LM5ZKTDzDH5rwGrszGRlmw4wKG2fCK7Gqn9pe6BbHMQ8nGBjDVpbWEm0M72NSlMaC8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV2PR12MB5966.namprd12.prod.outlook.com (2603:10b6:408:171::21)
 by BL0PR12MB5012.namprd12.prod.outlook.com (2603:10b6:208:1ca::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.21; Fri, 15 Sep
 2023 11:49:22 +0000
Received: from LV2PR12MB5966.namprd12.prod.outlook.com
 ([fe80::2258:36a:b01d:eb0e]) by LV2PR12MB5966.namprd12.prod.outlook.com
 ([fe80::2258:36a:b01d:eb0e%4]) with mapi id 15.20.6768.029; Fri, 15 Sep 2023
 11:49:22 +0000
Message-ID: <b7a40f81-dfae-8315-5b44-ebe59f387a1c@amd.com>
Date:   Fri, 15 Sep 2023 17:19:11 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 1/4] platform/x86/amd/hsmp: create plat specific struct
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     platform-driver-x86@vger.kernel.org,
        Naveen Krishna Chatradhi <nchatrad@amd.com>
References: <20230906071302.291260-1-Suma.Hegde@amd.com>
 <912ddb30-136c-b066-aae4-8726f8f8d035@redhat.com>
Content-Language: en-US
From:   "Hegde, Suma" <Suma.Hegde@amd.com>
In-Reply-To: <912ddb30-136c-b066-aae4-8726f8f8d035@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0063.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:99::23) To LV2PR12MB5966.namprd12.prod.outlook.com
 (2603:10b6:408:171::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5966:EE_|BL0PR12MB5012:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f25141d-cb34-422f-26a7-08dbb5e1cd48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: awZ4ehzS2rVu5I4of2+sBCG1kxp7EwvtoLJPXMoxgBLXrIYJXU+IC7NHcFAWDepXBBUydtI9SYsJVTHvmwYWcmGwsrMg5nI/M7zlRYgEJ5HRzpxyT9oitndKvIb3MOQXFYhSkQINipDEpJ4FS1NneEkBa//8lpKSow4vzqfLqbvw03zU3zvMHFM92St4NvFigKLHfuoTlCcxOAIEQkHU/vgXq5oiW+vMis5BA/MlkezNyKnQWs9hc+0WNj7Hz6kIWWuibpg8FvJaopjjZb/rBXdNUjyYmODzQ3eCi5WJdk67sh0rGzQrvaerMOkMY8uEvBNwGCHQ52ZY9n53BgkT+ligIuBoPkZrNo/6IsM48f2SJb1+H/8a9dKRzEVuA5gqqQ2RAs+xy0Homx4SVogwpdeB9z7dxQW3/8Jt/Sqp/f9QJUIF1h2Tdba1ReCO03Tppi1CCbcxRQ2e5rTkXro35o56bAsYaKk7EBr0ywzSqoqoxdvINdIB2Ycx8AIFTNuLIxVVYE4rDkTyVGKghqGY65Xh6TPDVjib/m1LC2AzBq6toUj7V+rR77U06nsTRFPZJaNWmV+/KD4n4lZwoDH+iwDme5md+GHnN7OsRvjVwba0SnX8gUhAQ2Uz22R7P5aLqE8t4zjHxijQEVoKSTEC+g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5966.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(376002)(396003)(366004)(39860400002)(186009)(451199024)(1800799009)(31686004)(6666004)(6506007)(6486002)(53546011)(31696002)(86362001)(38100700002)(36756003)(26005)(2616005)(6512007)(478600001)(83380400001)(8936002)(4326008)(6916009)(316002)(8676002)(5660300002)(41300700001)(2906002)(66946007)(66556008)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tk1xVVF4NWx3Ukxnb1p3Z0lKTTRMcXBtc3BxYUs3MVZ6WDVtOWJyQ3RwWnow?=
 =?utf-8?B?YW0rUDJWY1dRRGNMdnpCOEN0Y2tLUWpkRllZUWlzaDFLTVdEWm5OUFptclU3?=
 =?utf-8?B?bFYxeldZbXppL0FzcnJpcERTWXp4bE94YjA3dGE0N0tNWEIveldmVG5uSDZy?=
 =?utf-8?B?OWRocTVTU1FZQW9kWjNSc0lnY1I0YUpTZ0M4WlZoU1o5M3VhUG52TEdLaVJm?=
 =?utf-8?B?TEFxZ2ZkUmlya1A2ZG5rekZEUUYxRlU3aXBuSGZJazIxQk9kMzJBbkFlMU1p?=
 =?utf-8?B?UEJPdlpGTTZOWTg0MVBFenUwUFlueEcrNzVmazI1dWNMNCtkMFJod2pVa3ho?=
 =?utf-8?B?KzNsWXNKK0d0bTUxcVdTVFNqYjV2VUIwdDFiVkorbUVyWkM0dEdteXRmbkh1?=
 =?utf-8?B?VmJlY1k4VitHNmVEby83VE5peUZadGNINTZpL09vblVzR2N2QitEdG1yTWhi?=
 =?utf-8?B?eXZ2OVRXOWlmL0tGNHVFcDNvdE1ZMFF2ZEZnaWpRS2UxbjVGdTlGeHBTaHh5?=
 =?utf-8?B?TFFhNlpjcEZNTGFOb0NIbTh4OXR1SEQwUkwvQzVzaTN4SFc0ZGIyVjM1OWV4?=
 =?utf-8?B?WGthZXlNdjI3NFM2eEhVa3RJSVRwZ1dPYjhTODVzblE2OXZjeHZqUlgxcGV5?=
 =?utf-8?B?NlljcTh3V0ZvZzNMdTg2UVBTcmpjZXlJMllzcHdxZ3ZHdGJySXJ6L1JaRStJ?=
 =?utf-8?B?SUVyMUtZMDlpVHpYbm9WN1J5N2UrYUprSWE3NFRSeTJVMTVRbUVFY3VWSFRv?=
 =?utf-8?B?U0RTWHNkK29MMjA3VTNiZFo1cEpsd3JXWmU5Y21uTkZNUzZiWmtidDBIN2xW?=
 =?utf-8?B?UjlwSStPZ05QcDIxQThDbDgwNHNyUHNBNFpjaXZrZjZ0MWJRS3lxeUI2c1Bm?=
 =?utf-8?B?Q2hnNi9tUlY0dDZZZ1pKclVXSm1qdFBSNG5DRHJhbVFxcDVoS3BVeHJEOXo0?=
 =?utf-8?B?cGlJZXhFeTQ5VnhwRVBhbFpaNnlVdTdpRHpISXZSckxmdXgwaUpFOUxBNm1Q?=
 =?utf-8?B?ZEdOdm5BcVRtaC80RnczYWs3UHFEbzR5Y093YWZXL2h2TDJKdGxRNFdMZFFl?=
 =?utf-8?B?SXB3djlDWnhqL1Z5NGdaS1dvaGFoOG9jQ0hKYlRwaGdrVVRPOHgrMDRONjRy?=
 =?utf-8?B?emhFZmMwanRwWVBBbDRVTUxWVXo5QmJiQVJGQmlaU3pEWmxyZ3REMXdrTFBJ?=
 =?utf-8?B?WTcwTTEvcXRhR2JwbmRBbEFhRlJZbWR1emFWU2hXM014b05WM0k4OW9kdm9E?=
 =?utf-8?B?RmJCUmVrWTRxY3lyQXJpUUxPd29hdHVDWWlkWDFLTFhva2JFMWk4NXIvWlcy?=
 =?utf-8?B?Y0tnSlBPQzRQYUI4NVNMVDVMK3UzTTdiQ1h3aE1pb1N6UUJwektzazNaKzIy?=
 =?utf-8?B?WW11aXlvVUp3bytsRXNEc2lMdnh3bXBuQnRnQUdLRkY0MVlkYmpjMmZZN3BG?=
 =?utf-8?B?S3BDeFk1RnZhYmorMEY1bXVLZlpFRVFUVGk2MnpYRUhXL2dnSmw1M0hSZlFM?=
 =?utf-8?B?dzJoalpBMDM2S0tOeXQ3Y3dwVnR1R2kvK2MyQUFMc0ZQRXVjZkd6Umc0TzZu?=
 =?utf-8?B?T0hFUWNsZ3RVTTIzU3ZMVVRuWVdHdHM1TklQK1BudnI4WmUvZWwzQjY4RHlo?=
 =?utf-8?B?R2JCbWYvbEFWdCtpQm1vL2hnVzdEQVFCQmlVZUVGQmVEVXZaR1luQUhxaC9D?=
 =?utf-8?B?YnRQNXZOZk5hMGlrR0drYUhieFo0UEVoMEtGUDlaUEtsUzk4cnhsVTJ2dGNB?=
 =?utf-8?B?OHZlRUVrajdwQXNaTzI2c3VRakdpVXA3bGRNaTBkVlV5SDQxcVR3bGs3K0hT?=
 =?utf-8?B?Z0hzdGZpV1NURlJKd0QvNnFLeDhCcDlrY0hwbmZ5ZjFXNFFHbzNmVWROTWx3?=
 =?utf-8?B?ZG14c1NJNmVEaXpzSnJVWCtrNDBuMW5HNkordU5scjQ0VVRHTWVoVUNLRTZs?=
 =?utf-8?B?Yi9iSmxXR2FFSzlUVTNxQkovY0F5eFFBOTFlK0NJOHRjTGJlaXdtQytzRGNM?=
 =?utf-8?B?QjVtSGQ5a21QYlJGVVRuWThaNjI2OEJGLzhFbDFvQnk5d3E2NWt1dGZwL0Zo?=
 =?utf-8?B?T3gwNzRpM0l2c3paeFgvbWRXNUFIdE9TYWFCOHczeE8wYVRpR2wrajVOTDNu?=
 =?utf-8?Q?uSOvV16e1ITQPlMxVL11V7OwG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f25141d-cb34-422f-26a7-08dbb5e1cd48
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5966.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2023 11:49:22.2705
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7BHeL1dMQ18OIXJNcGfuHdu5cSRTwdxy2+wUSq9jp77u07KSG0SLPIxNPkRFnI8xQSA0vfq2I7Jox3sJ/H8oLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB5012
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Hans de,

Thank you for your review. I will wait till Monday and respin v3 patches 
addressing your feedback.

Thanks and Regards,

Suma

On 9/13/2023 8:57 PM, Hans de Goede wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>
>
> Hi Suma,
>
> Thank you for the patch.
>
> On 9/6/23 09:12, Suma Hegde wrote:
>> From: Suma Hegde <suma.hegde@amd.com>
>>
>> Having a separate platform device structure helps in future, to
>> contain platform specific variables and other data.
>>
>> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
>> Reviewed-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
>> ---
>> Changes since v1:
>> 1. defined HSMP_CDEV_NAME and HSMP_DEVNODE_NAME macros
>>
>>   drivers/platform/x86/amd/hsmp.c | 56 +++++++++++++++++++++------------
>>   1 file changed, 36 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/platform/x86/amd/hsmp.c b/drivers/platform/x86/amd/hsmp.c
>> index 31382ef52efb..94c65320bdcd 100644
>> --- a/drivers/platform/x86/amd/hsmp.c
>> +++ b/drivers/platform/x86/amd/hsmp.c
>> @@ -47,9 +47,23 @@
>>   #define HSMP_INDEX_REG               0xc4
>>   #define HSMP_DATA_REG                0xc8
>>
>> -static struct semaphore *hsmp_sem;
>> +#define HSMP_CDEV_NAME               "hsmp_cdev"
>> +#define HSMP_DEVNODE_NAME    "hsmp"
>>
>> -static struct miscdevice hsmp_device;
>> +struct hsmp_socket {
>> +     struct semaphore hsmp_sem;
>> +     u16 sock_ind;
>> +};
>> +
>> +struct hsmp_plat_device {
>> +     struct miscdevice hsmp_device;
>> +     struct hsmp_socket *sock;
>> +     struct device *dev;
>> +};
>> +
>> +static u16 num_sockets;
> Overall this patch looks good to me, but since
> num_sockets indicates the size of the plat_dev.sock array,
> num_sockets should IMHO itself also be part of
> struct hsmp_plat_device.
>
> (and all usages of "num_sockets" should then be replaced by
> "plat_dev.num_sockets")
>
> Other then that this looks good to me.
>
> Regards,
>
> Hans
>
>
>
>
>
>> +
>> +static struct hsmp_plat_device plat_dev;
>>
>>   static int amd_hsmp_rdwr(struct pci_dev *root, u32 address,
>>                         u32 *value, bool write)
>> @@ -188,6 +202,7 @@ static int validate_message(struct hsmp_message *msg)
>>
>>   int hsmp_send_message(struct hsmp_message *msg)
>>   {
>> +     struct hsmp_socket *sock = &plat_dev.sock[msg->sock_ind];
>>        struct amd_northbridge *nb;
>>        int ret;
>>
>> @@ -208,14 +223,13 @@ int hsmp_send_message(struct hsmp_message *msg)
>>         * In SMP system timeout of 100 millisecs should
>>         * be enough for the previous thread to finish the operation
>>         */
>> -     ret = down_timeout(&hsmp_sem[msg->sock_ind],
>> -                        msecs_to_jiffies(HSMP_MSG_TIMEOUT));
>> +     ret = down_timeout(&sock->hsmp_sem, msecs_to_jiffies(HSMP_MSG_TIMEOUT));
>>        if (ret < 0)
>>                return ret;
>>
>>        ret = __hsmp_send_message(nb->root, msg);
>>
>> -     up(&hsmp_sem[msg->sock_ind]);
>> +     up(&sock->hsmp_sem);
>>
>>        return ret;
>>   }
>> @@ -321,28 +335,31 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
>>   {
>>        int i;
>>
>> -     hsmp_sem = devm_kzalloc(&pdev->dev,
>> -                             (amd_nb_num() * sizeof(struct semaphore)),
>> -                             GFP_KERNEL);
>> -     if (!hsmp_sem)
>> +     plat_dev.sock = devm_kzalloc(&pdev->dev,
>> +                                  (num_sockets * sizeof(struct hsmp_socket)),
>> +                                  GFP_KERNEL);
>> +     if (!plat_dev.sock)
>>                return -ENOMEM;
>> +     plat_dev.dev = &pdev->dev;
>>
>> -     for (i = 0; i < amd_nb_num(); i++)
>> -             sema_init(&hsmp_sem[i], 1);
>> +     for (i = 0; i < num_sockets; i++) {
>> +             sema_init(&plat_dev.sock[i].hsmp_sem, 1);
>> +             plat_dev.sock[i].sock_ind = i;
>> +     }
>>
>> -     hsmp_device.name        = "hsmp_cdev";
>> -     hsmp_device.minor       = MISC_DYNAMIC_MINOR;
>> -     hsmp_device.fops        = &hsmp_fops;
>> -     hsmp_device.parent      = &pdev->dev;
>> -     hsmp_device.nodename    = "hsmp";
>> -     hsmp_device.mode        = 0644;
>> +     plat_dev.hsmp_device.name       = HSMP_CDEV_NAME;
>> +     plat_dev.hsmp_device.minor      = MISC_DYNAMIC_MINOR;
>> +     plat_dev.hsmp_device.fops       = &hsmp_fops;
>> +     plat_dev.hsmp_device.parent     = &pdev->dev;
>> +     plat_dev.hsmp_device.nodename   = HSMP_DEVNODE_NAME;
>> +     plat_dev.hsmp_device.mode       = 0644;
>>
>> -     return misc_register(&hsmp_device);
>> +     return misc_register(&plat_dev.hsmp_device);
>>   }
>>
>>   static void hsmp_pltdrv_remove(struct platform_device *pdev)
>>   {
>> -     misc_deregister(&hsmp_device);
>> +     misc_deregister(&plat_dev.hsmp_device);
>>   }
>>
>>   static struct platform_driver amd_hsmp_driver = {
>> @@ -358,7 +375,6 @@ static struct platform_device *amd_hsmp_platdev;
>>   static int __init hsmp_plt_init(void)
>>   {
>>        int ret = -ENODEV;
>> -     u16 num_sockets;
>>        int i;
>>
>>        if (boot_cpu_data.x86_vendor != X86_VENDOR_AMD || boot_cpu_data.x86 < 0x19) {
