Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8C4DC433F5
	for <platform-driver-x86@archiver.kernel.org>; Thu,  3 Feb 2022 16:17:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243124AbiBCQRy (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 3 Feb 2022 11:17:54 -0500
Received: from mail-dm6nam12on2050.outbound.protection.outlook.com ([40.107.243.50]:48160
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232564AbiBCQRx (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 3 Feb 2022 11:17:53 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=diIJNExocxYRslqRP2kPPtOoKjSTj6Wd3xo6OyPtgvk6JWx8quCszemb7E7sx0TvpGQqXD6Ky+XfWCigO546aaXjXsQu/zRJFOSey+yC4K6bWN/eN1QjoZ1/qA6VppE4QkAvnWzq9SsUHxRvHfROwMiTpKukr01UupH89YMLed60XeNIOp2yjSScYsu3RCrjcmAG9ti5pcqNmD9nFiG/mwiEvA5aBDZzb/yoCfbSFU1IxaOYezNFxsnNrcuCK6sOy8d0Ibq068sf1nq9hRoIN3ycNsTyinml4X3lbiD9LP7XqhnfqZwQJZmb8JFlJlZVMqYn3XGmsWwROaCcKRX2mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tUaLnsuQeD43KdqNnqN1nI30c1Mu0OBBPDwOV9as3GQ=;
 b=HmVDaG7KVxcaNozncvynBMEEm5kAvrF0mopTVsGLi1YXJUBWuYbLIy1aVHRob6NDmgQzVvBMem6inx65MG67/jfRk4NGn/ct9UVR/fIkL1zLhu9sRSJoDzAhxnIm7H2PZOOZaecsvAuTrigW1CyO9FBWA6TFT96i23rTFipJZ8L5Zp0J33ToMtOIgKTpLh359IF79rCUaZ8YmH/CixLa/mr3/gO/u0/MlSWYjpmZI740Z62PaCjMJgnqAxTHWmgw4IjJ2LFeKM0NnKTgGYai/rhcZbqBvGOcUZT7IF0Ngbv82d2KDPzUODTy4EelZpAM07O8v/kHt9FbAX1KjXOiBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tUaLnsuQeD43KdqNnqN1nI30c1Mu0OBBPDwOV9as3GQ=;
 b=PRD45qoWyIrJCMNjV65F1pQuxpMn3AVsH/GaYXP26sUW5tqpgKcSWyV8DY2kFWtAxtgvCsg+26WhCTQW/Hm0CgR03t9Dm1g1Hhv3x30eMWQeG5TVXvDsahKP3YrtvxbPUS6JIJ/J3liAiHK+QlfQYHj5IzKWE2wlMEDi+CKYowY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4720.namprd12.prod.outlook.com (2603:10b6:805:e6::31)
 by BN6PR1201MB0244.namprd12.prod.outlook.com (2603:10b6:405:54::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 3 Feb
 2022 16:17:52 +0000
Received: from SN6PR12MB4720.namprd12.prod.outlook.com
 ([fe80::f804:7cc6:9f9f:9f2c]) by SN6PR12MB4720.namprd12.prod.outlook.com
 ([fe80::f804:7cc6:9f9f:9f2c%6]) with mapi id 15.20.4951.014; Thu, 3 Feb 2022
 16:17:51 +0000
Message-ID: <a1b0ab95-4c7f-e157-a614-e09a526bde34@amd.com>
Date:   Thu, 3 Feb 2022 10:17:50 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/2] platforms/x86: Add AMD system management interface
Content-Language: en-US
To:     Carlos Bilbao <carlos.bilbao@amd.com>,
        Naveen Krishna Chatradhi <nchatrad@amd.com>,
        platform-driver-x86@vger.kernel.org
Cc:     hdegoede@redhat.com, Siva.Sathappan@amd.com,
        Nathan.Fontenot@amd.com, Suma Hegde <suma.hegde@amd.com>
References: <20220203120450.199598-1-nchatrad@amd.com>
 <cccbb333-7adb-1872-13ae-233957ea8365@amd.com>
 <fbe95c46-1623-28b1-7770-3ed3a2bf1130@amd.com>
From:   Nathan Fontenot <nafonten@amd.com>
In-Reply-To: <fbe95c46-1623-28b1-7770-3ed3a2bf1130@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9PR03CA0004.namprd03.prod.outlook.com
 (2603:10b6:806:20::9) To SN6PR12MB4720.namprd12.prod.outlook.com
 (2603:10b6:805:e6::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 119f25a3-6b9e-4d1a-0ba1-08d9e730ba34
X-MS-TrafficTypeDiagnostic: BN6PR1201MB0244:EE_
X-Microsoft-Antispam-PRVS: <BN6PR1201MB0244F9B6CB03E3B3C3C77DA9EC289@BN6PR1201MB0244.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Qp3d2LnTM9ldo9H+8AxUsxGSUlW/+bgZG/WsBHLFIiY2WqIYNAnSFbIeZQTvFCirk2oKvxNRHpVtlL0oEd+B9FnLLkKIpvyu0SC8Ti6ONA6Y+VDFyGstC+whD9HRdbd9k7VsMS4alwFnQLoctcRY0snWZEokTBpfvOUHo3GG4WDPdRDc8XhgZIjbLWVbCX40/ZPni90/HICfcLekuft3C2h/uYSXJywtvM8JKVjj027jwUANkrdWhrSf05aoUAfeW6ibkD/T5/mJNLEVTWrdoS7k7/YcWJvGOAM+fKQ8fXyVL3PKWcgFzMF2BY8LQ5OU2zWj0WffaCE/pnRPEZ0gSyPdqRskXm+LvFUJgOtRL9EfgvhGp8yyPZsUW6ZYEC4CHIe6Goy3qKPGF+syY/foQqsfn+6XtRjnKOkDyj2h4Ufp6vErRo6DnZ8Cvq0x7whFXKk0tQ93Ne4KbPY93YVNMSQT3AilrjUwoHq5pwiwqZJEN0Lutwj156xasB4At3dt+ZCLfe+8TzKr5TEaQsP6qNMBfBy5I0CFCkRr3SSGzW+xSw5RASpPQ4zTcA8LacKcs5HhLGysWkIQsRVe96e5H+3K7+0mvSER7v5IrQmGrId9BG6/liYJ+zLyotE2PF6tOgLs/I2l4bcqQeC+CYWNrwlk79BxhqaqZZcTDfR6o6rYrNL3Z0jq3gaongUV1/zeWrTKLM5JRRiB0WI65wxlwRvFFVxl/YNJ0J0du65DrMg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB4720.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38100700002)(186003)(26005)(31696002)(83380400001)(66556008)(66476007)(110136005)(6486002)(316002)(31686004)(8936002)(36756003)(5660300002)(2906002)(6506007)(8676002)(508600001)(6512007)(66946007)(4326008)(2616005)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NmVieW51eWxmU0RNdUwzVGZmS1RCV2tzOEppUFBBTGloKzV6UjJIN1owcVpm?=
 =?utf-8?B?cGRDdE1Ob04xRytuNkcraUs2OTNrZWtma05wVlovOFIzdFNEYzE2SHRUMUtL?=
 =?utf-8?B?QUtLd3BHR0Z3Tkp0WWNTZzN3NFRkL2UxanE2MFAxdGRkeW1ncEJQY2dyV2l1?=
 =?utf-8?B?SndGNXhGTytEUmJxdmRXREFLaTJvN2dLSzNuckl5ak15b0ZSdEUwQUpWeHl2?=
 =?utf-8?B?M3dJZnNIL285aUl5SjZTcHhKeUxwVWcvMklTaGk5djk5RGVZaFkvNWhsdC8y?=
 =?utf-8?B?WG0xU0dXTHpEZHFtMG5oYTNIUmxDOHgwMHYwVmljZmtmTkU2RFJoTXBkcmUy?=
 =?utf-8?B?Qyt6V1FiTnlNSHRaSEhKQU9oOGtDenhlbnYrTVNPeEtURFBLeVVkNVMzLzl3?=
 =?utf-8?B?amlxdkFoeEp2YXJiMlh2VjhPZGpNdjJ0RjRIRkErVUJhZDN3UkR0cVBuekll?=
 =?utf-8?B?Z0YyVmRUbUxVd2xzN1MrVXpEbzVObXF3aVE0cHhydWVlYVZwMGlhM1lpVmto?=
 =?utf-8?B?ZGJzS3pjZXNYNjRtTGY4QmVKNGFObW8yWk1ES05BY1JOUWgya3NpTWVCemZB?=
 =?utf-8?B?eUJjOXFabjlCL291ZE5YeFpJRHFzRXlNWHMzZC84Znp1dUlISnNMQ1RPK05m?=
 =?utf-8?B?eHdzZHZKSkNpelVxUmg5WW93UnFPK3E3VXFWY205eVU1Q05OZzlPZWJoTlBD?=
 =?utf-8?B?ZlJGUW8xeVdWeDV6OFNnSy9RVmxmblNHMzNYNWJOZTB3WGRyV2pxd2lTRlJu?=
 =?utf-8?B?cEFmZlpLeXVXdS9LVGNjRkx6WWJDOHZsN2d0eDJJUmNzRkZ1OWlOaDU2dlNO?=
 =?utf-8?B?NU9LSVArUWYrMFJObnBPQWRFL0R3Z2VHVGtNRWZLalhneDMyMDZLVzd0bjFL?=
 =?utf-8?B?THEySGFZdk5aOGxncG5aRnNJYkdST2JLWE5tWEJ5UUNNN1c0a3d6aVp0TDZt?=
 =?utf-8?B?Q09TNDRId1RwN2JrSE9FWXFnaDBNUWo5TC9qZW9LdjJzNG9VSVFPVWV6U3A3?=
 =?utf-8?B?K0RlbHRqZ0ZHS01JM1BGVTMyK093aXlMbmNUVXF5d2hJMnh0WnVDS2JZSmV0?=
 =?utf-8?B?dDRKb1NZUU04STV1UjduTEJPSmdJM3FsNEVhVXJLRS9TS3V0SjJNNjNqTEhO?=
 =?utf-8?B?MnJOMlEyTG1DMkk3b1dwaFNkUGNxRkpjdFZXQytqNkVISU1QeG1Od29maUpq?=
 =?utf-8?B?Q2ZmVXNBQjdWcjNTNUszejQ5QUhPYlFCRmlqL3VBLytHOW01ZGsybDRaZ3E4?=
 =?utf-8?B?QUdFYWxLdHE1RHRtd0dDOW83V21kNjRZQTFSblQ4QUNvaTF2UmJoZzMzU0lJ?=
 =?utf-8?B?aXlVNWxsRlZoV21QTllOSkNsQzdLUUV2TGlOaEVUekI5cERXZkU1RTFoVXJJ?=
 =?utf-8?B?NGUyT1FjcWJZVFpVSzFNelJ3ekJVWDZmMm1kOXBQOGVJbnRCQjNWVEhtUmt2?=
 =?utf-8?B?ZURHVG5vNmJUMDFENmd3OEFvU09oMm5WRXhveE1tblVJQmpsUkxBYVdzdzgy?=
 =?utf-8?B?WjBtNFNTUHdleXRSeW9nRlcxMW1SQVJORHRGaHUrQ3c5SjFGYWRPUlluQ2VG?=
 =?utf-8?B?RXl4RHhLMVA5M0s0S0g4ejhHaWNHbU1MMVZRRWlSdis0dlp2ekg3RU9GNUFW?=
 =?utf-8?B?S3FhbmdKNG8wRDdUUitTbmFjZkd6YSt0R0oxUHFiRHFJVE1rU1JNSFRWeVYx?=
 =?utf-8?B?Ni90TTZNZmRwV0VVQVEzNWJkOWd4VVVtdUUxNGViREtqcys0by9Zd09CK3dU?=
 =?utf-8?B?V2tBR2JYQ1FsUVI5U3J1QjJFSVN4UVk4cVR5RDE1Y2M5NUwyVmwxYndFUUda?=
 =?utf-8?B?WHI1ckw1S01hL1lydDg4RkxTZ2Q5aVBjcXNZTDAySCsrUFljTUVGckV0Ym83?=
 =?utf-8?B?ckllek02ZlZYYzNuZGd3SGRBQnhLTTkxdk8wc2NFb2w2TzdYUTZYUlY2TEN0?=
 =?utf-8?B?bm4rL2tNMXA3bllQMzRWdDRBTDdhWFlaL2hDVkxkOUFVODBaOFZ0UFMrMHpE?=
 =?utf-8?B?eHRVNy9wWlE2QmoweEJMS29OSTZOallqQkJraXhMazFJMW90bWxuVzkreFdq?=
 =?utf-8?B?YWdqRkM5eFl5d05rZlZ3cWNFbVRSSVJCU0RiYjhIWkFMd1pRVEwvOUQ2bFdr?=
 =?utf-8?B?QnZiT2xFdGZDcGtBSzlpd1Ric3YvVjhkSThOOER6a2JRT1hmajYzek52VTFH?=
 =?utf-8?Q?tuXOguj5Z6CDCSxFSCpGtK4=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 119f25a3-6b9e-4d1a-0ba1-08d9e730ba34
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4720.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2022 16:17:51.9149
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lqqpNgLVzcvuumsBc/89+EngoW8A68ZRldduSMf+d8xd4l0SvXGr1n30MubRrbu2nJQ0LpbaCtf+cZ7ivoah3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0244
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 2/3/22 10:03, Carlos Bilbao wrote:
> Hello,
> 
> On 2/3/2022 9:48 AM, Nathan Fontenot wrote:
>> On 2/3/22 06:04, Naveen Krishna Chatradhi wrote:
>>> From: Suma Hegde <suma.hegde@amd.com>
>>>
>>> (...)
>>> +static bool check_model_support(void)
>>> +{
>>> +	if (boot_cpu_data.x86_vendor != X86_VENDOR_AMD ||
>>> +	    boot_cpu_data.x86 != 0x19)
>>
>> Check for boot_cpu_data.x86 < 0x19, lets avoid having to do driver updates any
>> time future families support HSMP.
>>
>>> +		return false;
>>> +
>>> +	switch (boot_cpu_data.x86_model) {
>>> +	case 0x00 ... 0x1f:
>>> +	case 0x30 ... 0x3f:
>>> +		return true;
>>> +	default:
>>> +		return false;
>>> +	}
>>
>> I don't think the model check here is necessary. Adding a model check will only
>> add driver updates for any new models.
>>
>> HSMP is only supported on f19h so we do want to keep that. For the different
>> models that may not support HSMP, the call to hsmp_test() in the init routine
>> will fail if HSMP isn't supported.
> 
> So, for this I think Naveen was trying to avoid people with Fam19th client processors 
> complaining about errors in HSMP and filing bugs. You are equally right pointing out 
> that updating this in the future would be inconvenient. Personally, if I put myself in 
> the shoes of an owner of one of those systems, I would be a bit disappointed to run HSMP
> and just fail. So, maybe a solution in the middle would be to remove the model-checking code 
> but also include a warning/clarification in the documentation. 

I agree that some kind of updated message would be good.

The family check is already made and an appropriate message that HSMP is not supported
is made.

Removing the model check and using hsmp_test() needs to account for hsmp_test failing
in two ways. The call can fail because we are on a model that does not support
HSMP, or it can fail because HSMP has been disabled in the BIOS.

The hsmp_test() call should output a message along the lines of "HSMP is not supported
on this family/model or has been disabled in BIOS."

-Nathan

> 
> Thanks,
> Carlos.
