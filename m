Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82DA3C433EF
	for <platform-driver-x86@archiver.kernel.org>; Thu,  3 Feb 2022 16:03:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230457AbiBCQDe (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 3 Feb 2022 11:03:34 -0500
Received: from mail-bn7nam10on2059.outbound.protection.outlook.com ([40.107.92.59]:10209
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1352101AbiBCQDd (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 3 Feb 2022 11:03:33 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ULT5gZwv808Dqksxl3uC498z87+8eeqvjhzGWFPgia3e5u01/1JffC8DrlCXN2wJOOiLoaBoD4uZg1au8qNzs/r/V5GynTN6GfuoHjbZm2LmPljMtxk/8llUOnAUldQaE0c8+Cdd4qT4CkQQXtyVot3SthRektmwZ8e6y1jqrNAGiB+Kyhp9ZhfPGXpxhbfpdqV6ltg3gzYN70Alcg0YG7Ctdaww+ffdhbi3MQQqwyM6F3tpktltCMMJWJrlFfIo2bJ3q6I/osuFgplQTYVF29u0inskviuGXc80gjyjPzdam55otIf8tCwgv2UpIGWwhRGATokATeIwzYUQ34Or1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kiB0boNe1gMATZqI5Tf2UlcgW1K2GPZf6JUio4T0krc=;
 b=TKdMgY5ekVHzE7+G6IzMecMtscbTVIp6PZ7LuehPnum/Q/C24tMZFMFV+9u6ZUdo+xjputFSAfSxICNlVgjABJbeqoRDrc597Lyk0NQViQm1UUwUqien5C1nFaYfVXOIsjirm9XG5sWHpib06iunBQ1EkrVJMDz2LMYRZMq8+F0HBlvK65nmWChPaUSwY0mfn6th2dIbAzr1leEF0DZAdrhU2EMDG1sQgBUx3aXb9aJ/3Ja3dUNdHA/RO5BwALaP+ZjRgkyZFUdicrSM7MUfKtppKX/bqBbbT/Fju3lzBWL+n/VfxnkcTUmxXIs2zYTwyJl0gvWQVUp9lnH7v+1Qsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kiB0boNe1gMATZqI5Tf2UlcgW1K2GPZf6JUio4T0krc=;
 b=B18J9aOFBYlu3M2C51T5N6Iq90lC9RRfpLOKnoYOWp84yRbzhSFNUD9uYWSuCLfCL4e+2f5jvaH/SyJY37yvondtLeM26x18SKt3FM6wwvaXrU6k3baqObXvl/+mRdy7KLUz8cw0zrCyZnR7btHqpieYfu3gRJyRtDHmyu8YeBU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB3877.namprd12.prod.outlook.com (2603:10b6:610:27::32)
 by DM6PR12MB4107.namprd12.prod.outlook.com (2603:10b6:5:218::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 3 Feb
 2022 16:03:31 +0000
Received: from CH2PR12MB3877.namprd12.prod.outlook.com
 ([fe80::504a:964a:aaf3:473e]) by CH2PR12MB3877.namprd12.prod.outlook.com
 ([fe80::504a:964a:aaf3:473e%4]) with mapi id 15.20.4951.014; Thu, 3 Feb 2022
 16:03:31 +0000
Message-ID: <fbe95c46-1623-28b1-7770-3ed3a2bf1130@amd.com>
Date:   Thu, 3 Feb 2022 10:03:27 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v2 1/2] platforms/x86: Add AMD system management interface
Content-Language: en-US
To:     Nathan Fontenot <nafonten@amd.com>,
        Naveen Krishna Chatradhi <nchatrad@amd.com>,
        platform-driver-x86@vger.kernel.org
Cc:     hdegoede@redhat.com, Siva.Sathappan@amd.com,
        Nathan.Fontenot@amd.com, Suma Hegde <suma.hegde@amd.com>
References: <20220203120450.199598-1-nchatrad@amd.com>
 <cccbb333-7adb-1872-13ae-233957ea8365@amd.com>
From:   Carlos Bilbao <carlos.bilbao@amd.com>
In-Reply-To: <cccbb333-7adb-1872-13ae-233957ea8365@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR17CA0023.namprd17.prod.outlook.com
 (2603:10b6:610:53::33) To CH2PR12MB3877.namprd12.prod.outlook.com
 (2603:10b6:610:27::32)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 03f93424-11b0-4364-1afd-08d9e72eb925
X-MS-TrafficTypeDiagnostic: DM6PR12MB4107:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB41073362FC5F14B540C28CE2F8289@DM6PR12MB4107.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FkO/rb2qixzJtE1ivgUEjvhM7anfh1BFT5BfcVO2JwKGMQHcbDR+g//KfWqTN0LZaodD+DbVEgQktWZbwYk7TBHr6e9F4b9U7Ia0xaKUwK0F2tBJmssxcyW938AlQr445RUDPFL1l44G8nJtVO9r7cSWE93p5uOkVjt5IN4fLSSw5DbCSBuIWtLl2j58xnSoKr5JrjHJcBt35khdNXUQg03EAYMrsafynwTWmUayPDTE6Tv3rYipKuxD7nLskCWVTSD8Tu89w4sFVB9YLmpCEQs5tEXKuVrNl0zNeat5pVpvvHc+a4+8b/zQZdPjzc1GoS6Tdrgis8+uZvWPzXjsVTpHcWTZCzaQBbmVL/7waWlnQ48WL9qWWP6l7ieIaawDhmlmjCOrP7aXoZDa9d5BMPpl40DizR/pQYCPFHI9t/ns9lWub3JJQO3FiVQ/47PS3W/XGG1BCxFpM9ZCe2YHP3HKrj0QABeMBntNe2TLBj155vtCEYLBq8nrNiudpSjUkWGV+AQdcvf9W0OLWvTpD6kGifVDaO9rDfYn1EOIPElqIZT4AssTsD7PGa2nkhs/8bkG6Bys1n7TLHEHhXrOe3uYbmj3nTRKL/wFqy3fZIRpKYgww3n6I2GcSCTSEO1MSDdKA+Y0kle4ZimB9I9oBCtlAdtq+kNpJK7ST/nWujrWnL9RPzMNv9Hw8esOLQQbKjVd1KD2l73ALlHav0SZlwjSptUpbESBddVtiRS7i16Y+rO8JTg6LZAMmnkAArIN
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3877.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2906002)(31696002)(38100700002)(86362001)(36756003)(2616005)(316002)(44832011)(110136005)(5660300002)(6506007)(66946007)(4326008)(66556008)(66476007)(53546011)(6666004)(6512007)(8676002)(8936002)(83380400001)(31686004)(26005)(186003)(508600001)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmJTMlNVTGs3RFdwbzUvZFgrUGU0YXNlVW5LWERHY25oOWxxa3N5UEtKeCtJ?=
 =?utf-8?B?NTNZWWdhbFRxV2ovTlNBTWV4M21YSHB4WlE4Um1Pb3NmK0k0QytFQndrekhW?=
 =?utf-8?B?SmFZODZvUzNDR3duWWlKMTN5MURMaXhOZ1BJZEtxazBnT1Jpd0NQbW9aZXh1?=
 =?utf-8?B?NE12SDNMV1hWb3ljL25DeTN4MzgwLzBIVWd6azVlWmp3Wm1maXl5Z1lzVG8x?=
 =?utf-8?B?T3ptd20xOWs3Sm5GUkw4RExkS2IwdFlUczZ5L3ZQUzJ2ZHdQN2ptV3ZwUE5M?=
 =?utf-8?B?MmJXbitmMHNWVVNZKzhFbFJ0OU1IaEZJV3R1c20rNjZCblVla1JLZVJQZ08w?=
 =?utf-8?B?L3JuVzFiYWxBV00yTmVDaC9RMFk1c3JpNnJRWGx2VjFBYjMzaHVCRHRBQThJ?=
 =?utf-8?B?RUNNZis1bDJTZUM0SlVrcStNS1JLaUUvU3dpaHRCUGtuRUl5b0tNZXhmcVVm?=
 =?utf-8?B?OS91ZlhrUHJrZjdvRFdFR0IrRmtQcWtiU3pWTUE5ZkgxSWRFTGZWUEYxak1D?=
 =?utf-8?B?a1BGQzhxTE9VSEc1Wm9wQmRBTjlZdHZWUTY2SlRZbFlIVmZyMGJaS2M5ZkN3?=
 =?utf-8?B?bmVhenNOb01pTU1uaGZSeHE0bDhyWjk1MnVWTWJVNWRHRlVrc3dCNlVwc2xj?=
 =?utf-8?B?N0k4L1pYNVJ5S2lWYStNMTJSQ2p2N1crTU8zZWU2TVVZRzFTKzl4Q25ndi93?=
 =?utf-8?B?UStLU3kvNDlqOGc4T2dtd1NmVDE2TUlCU20zZjAzdkZFbEw5RlZSNC8yTk9z?=
 =?utf-8?B?NjRLQ201ZkpYQ1hlVU02YzJ1dlBQTTl1Nyt1SWNtektSK29nTHFhcXlQeExY?=
 =?utf-8?B?RGtlVEtlRjVxOXRxN0UzVzJXOTNBZlJhSGJtUVdvRXBFUFBRdG9acFM4QUVm?=
 =?utf-8?B?YlJ3SFM0WlNwVzd1a0Q0QjJSRDhjNEo5RW1SUHBPQTJhdXBodTB4RDlDTzBI?=
 =?utf-8?B?TFhuN0tqUUMrNlorV2JRZDA3NjZ2bDZQS293Ri9iY3lQTTBmMEFiQUtpZzNV?=
 =?utf-8?B?R1dwZldYd0l3N1VVQW9EcFdPaEcxUG1idlpEQmJSeE44UFQwMWo3aFNuTTJS?=
 =?utf-8?B?Y214NStjV2R3ajZHRGQxZm0wVGcwZ3pvRzdRZlhSSFFYU1B5c1FOMWhMT3p6?=
 =?utf-8?B?dUx4cncxeXhhN2todUFUMTBObHg5THpwV3U0Wk5kVTZ1WXB0d2JZNVpNLzA5?=
 =?utf-8?B?eWlUMUdsdFZIYjltcVJwOUhpVkpLQVY0ZnRMelFTOXJ3YXN0MXdJbDVIZzRi?=
 =?utf-8?B?aEdNZDlRbjdnSUkva0d6NmVtN1NiRDUvTFFDQVNCTk5Wckt6YlZ2UTA5R2pP?=
 =?utf-8?B?ZWhtdHVscXZTUVd3MFN4OTJ3WkFrYXR3SHJ3YlNMa0ZBT1FwOHBRTFg3RTZG?=
 =?utf-8?B?NzBHL3BxWDFudHA2YklqNkVMUUREKzIvLyt0WXpoeU5Pb2YyWmJIdDlGTnpW?=
 =?utf-8?B?N3dSbjk5MmRrdFZ3a3lyVHlSOGhtL2w1UXhxaFh3OVgzSG5GdnJGYVdSMXBx?=
 =?utf-8?B?eS9QOUJVVVlNdVhLeUhvQk1haU5uV01UL3ZLNkJOR0Z0MnZ5VjY3a1JKV2FH?=
 =?utf-8?B?aFRkZzIxNkgyZVZhVGZFMWUweE1relpTRjUyRUJRN0Fxd3VTQStDU2hzbE45?=
 =?utf-8?B?K0RBSXQycTB2eFF6VVpnZlVqa1hnSVJvSVUzaU8vejBVR2NwNTk1ZVNTZXhu?=
 =?utf-8?B?QUdGTk5RK2pBd2d1WGRtcE5DcHB5aThWektCVXB3bklJbVZJTWJoTFZuS1p5?=
 =?utf-8?B?b3pCRElndllxZGcvNFhabXRheEdRajBuS2VXVExkcUZkQkthZFB1SVQzYjJL?=
 =?utf-8?B?eUdPL3R5OG52ekYwZCttcEtJdFBIVkVpZWlHMUhJS3d1cXNKS0ZTVVoyZStM?=
 =?utf-8?B?Mi90bGxFT2dodFMwR1pNOWRDYVJ4ZHg0UXkyb1hqY09kQ0lEMi85NUFtcDFC?=
 =?utf-8?B?SEY5T3ViTkJTWjd5NktkaFpBYXlzMk10S2ZKczBnUzRtTW5yUlpRUHM5WjI5?=
 =?utf-8?B?MjlWT2NQdTZKaE1tTWdxUGFMek16S0VnM3JUeDJhSG8zUTRRVFE2NUM4Tjhj?=
 =?utf-8?B?YlluVGJzVnZYWGZhbkVPTlNIVjJJMW1qNDAxSFdxTGpxY2MwTTA1WlpzV250?=
 =?utf-8?B?aUdNVExmM2VQWUV2NXJJUzFjdEJWRENjbEhqcDRDeko4dW9HS3FuUW9MRkc4?=
 =?utf-8?Q?bYO3nHM4xb8DDQkJJO3VIPk=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03f93424-11b0-4364-1afd-08d9e72eb925
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3877.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2022 16:03:31.2707
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VAsbcoj/nqzlUyGAfhcKOE6GVd6ZoozpKCHX+DNRAnXeNdIAzkqMSiQY2b8oJpYTP1yo3Wn7NChV14Km5luNGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4107
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hello,

On 2/3/2022 9:48 AM, Nathan Fontenot wrote:
> On 2/3/22 06:04, Naveen Krishna Chatradhi wrote:
>> From: Suma Hegde <suma.hegde@amd.com>
>>
>> (...)
>> +static bool check_model_support(void)
>> +{
>> +	if (boot_cpu_data.x86_vendor != X86_VENDOR_AMD ||
>> +	    boot_cpu_data.x86 != 0x19)
> 
> Check for boot_cpu_data.x86 < 0x19, lets avoid having to do driver updates any
> time future families support HSMP.
> 
>> +		return false;
>> +
>> +	switch (boot_cpu_data.x86_model) {
>> +	case 0x00 ... 0x1f:
>> +	case 0x30 ... 0x3f:
>> +		return true;
>> +	default:
>> +		return false;
>> +	}
> 
> I don't think the model check here is necessary. Adding a model check will only
> add driver updates for any new models.
> 
> HSMP is only supported on f19h so we do want to keep that. For the different
> models that may not support HSMP, the call to hsmp_test() in the init routine
> will fail if HSMP isn't supported.

So, for this I think Naveen was trying to avoid people with Fam19th client processors 
complaining about errors in HSMP and filing bugs. You are equally right pointing out 
that updating this in the future would be inconvenient. Personally, if I put myself in 
the shoes of an owner of one of those systems, I would be a bit disappointed to run HSMP
and just fail. So, maybe a solution in the middle would be to remove the model-checking code 
but also include a warning/clarification in the documentation. 

Thanks,
Carlos.
