Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,MSGID_FROM_MTA_HEADER,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57A88C2B9F4
	for <platform-driver-x86@archiver.kernel.org>; Mon, 28 Jun 2021 14:51:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3A49D61428
	for <platform-driver-x86@archiver.kernel.org>; Mon, 28 Jun 2021 14:51:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235159AbhF1Oxt (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 28 Jun 2021 10:53:49 -0400
Received: from mail-dm6nam12on2087.outbound.protection.outlook.com ([40.107.243.87]:28896
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235781AbhF1Ovq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 28 Jun 2021 10:51:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jKoKEix/LeAyryRj2snqREyM9yH4XMlWFCTftMtVEvY7g6FmCFkGayurw+BN9Mkum2ijysO3gy+5dTMJwF8YRtG7pIClzwscsZYK6dqyxKGHvuL1YS+rCucqt9B41R7ZCwLC+EomHc+kczHRvEHPtPXNp9Jd5u6hlaLqRiGtqPTT4oOCfomiVACqpEtNS3zmAnyXIaNkODV78YFyj6oStmk/AlLWUDdhEUGEtPPx81prJc59vtGAeJ/ztnV980atOIVtqY4FRXj+OKOcNBtLjcII8FjyZsgMtbketKBGAFVzMu3+b++27SJWjYbKSOG7qcGPMSZKj1RC8MMKhsTw6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qGJRaLLonsbWqcPSJYAzrvCqIDOdxTsX5OohHWrQa+M=;
 b=Du/rLW0zxv8Oe/REC6ZOgsSdUIlHNIlcodOGKw7Jd0KB1CRynFQ1bNRpwONqdg6EGQDR9hVPrQNZVd/MXJ0q66kzRWKYuoY9PXMDy58vH6qCoAZht522Kl2Ats7c0LDW2YCIfRgQS7WGL935UtQdBav2v21xgHJXm3ZTk5XEz71ICVorHTDyvPafY/H3cNpe6OomaRSQN7qh/CFNtozu/DvKtkfMXSdEwwGtNMR2OJFNQJJNP2C8y+FiHRJxg4TmbshvgeWsfa1lCgNieahZ8OQ0acyOzybTMEugUeVHzCzx7G20pjowoCQ2uZTYJPdRaxgalHC41pLJbkCd8JAQig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qGJRaLLonsbWqcPSJYAzrvCqIDOdxTsX5OohHWrQa+M=;
 b=3u0FOMMRfKfOHcEzfG8Ydg+AecjgSi8K8s/q4iDq83oNDOKjiFmMtmB/3AiczQltFZgbIPVGkEc/AsN2t4HFyY/nRVF93i04o/Y6qT0PxvYs+c0OkOZIwucYadBfelYAmZ7PJDfSO2JK3MQwwGmc+8nLyiMO70jhIieXzZJ/LCI=
Authentication-Results: lenovo.com; dkim=none (message not signed)
 header.d=none;lenovo.com; dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4510.namprd12.prod.outlook.com (2603:10b6:806:94::8)
 by SA0PR12MB4509.namprd12.prod.outlook.com (2603:10b6:806:9e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.20; Mon, 28 Jun
 2021 14:49:19 +0000
Received: from SA0PR12MB4510.namprd12.prod.outlook.com
 ([fe80::9c16:2794:cd04:2be0]) by SA0PR12MB4510.namprd12.prod.outlook.com
 ([fe80::9c16:2794:cd04:2be0%6]) with mapi id 15.20.4264.026; Mon, 28 Jun 2021
 14:49:19 +0000
Subject: Re: [PATCH v2 1/2] platform/x86: think-lmi: Fix issues with duplicate
 attributes
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        "open list:X86 PLATFORM DRIVERS" 
        <platform-driver-x86@vger.kernel.org>, markpearson@lenovo.com
References: <20210622200755.12379-1-mario.limonciello@amd.com>
 <20210622200755.12379-2-mario.limonciello@amd.com>
 <21e896f7-69d8-e6fe-cc4e-55d3ecd44be1@redhat.com>
From:   "Limonciello, Mario" <mario.limonciello@amd.com>
Message-ID: <d2876b11-ec85-412e-cce3-f4f8b5d363d1@amd.com>
Date:   Mon, 28 Jun 2021 09:49:18 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <21e896f7-69d8-e6fe-cc4e-55d3ecd44be1@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [165.204.77.1]
X-ClientProxiedBy: SN4PR0501CA0054.namprd05.prod.outlook.com
 (2603:10b6:803:41::31) To SA0PR12MB4510.namprd12.prod.outlook.com
 (2603:10b6:806:94::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.236.180.22] (165.204.77.1) by SN4PR0501CA0054.namprd05.prod.outlook.com (2603:10b6:803:41::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.14 via Frontend Transport; Mon, 28 Jun 2021 14:49:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2972bc1f-6dfb-4a7b-1ed4-08d93a43e8ef
X-MS-TrafficTypeDiagnostic: SA0PR12MB4509:
X-Microsoft-Antispam-PRVS: <SA0PR12MB4509EB27218C12C5484A6703E2039@SA0PR12MB4509.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K1HLEi/ifXxXZYywxUUHTfrPp1C3c1ZTWV9XOGqhyhG95BEah6B0kQa7s9tfSkmLiOhYALDo951gVLT0G4kCTqnYMlYBZkNtNDHbKuSjOyPLxC0qVBD+z1/yHi1ed0mCD6UUVMGWF9pF/HmPyBazQdlMbiDhe1hR/++lwLUnb50BpxI+EsL0ys+NsXk9WvXSPTb8EfrytI6xKeokkTsxpcSnZBlVozHcSkfF4oMRG9u3/Z6p5vuYPQ18KlZ5imgC66Z8UwlbipzYQRyyp3orgcrzQ0TdRrSN+1ooDudG2Klr3VoVNSBWEcWwyRros3y+VOOHfeGYZ6QssfzXNObs2vvRgelpJfDGelWnv2epGfU/3umhmeKXWO4EvYXa9nDiGBJh9atUMedBi+JxcUgGDHCD9GgjOhVDifKg1/8w/CBGpeTmQM3LoEeQF4xz/aMjcphZLiftY8Plg2nrbm2RK843xGx+JbW9w4Yv2KP40NwzIRPw+bsepIGx5I4YYTPRhVkhXzzziMPwokuYyg60tRZh10T7bcDCh5mC+v4PAQmRqNw//6qD+OtJKS9Ph1J8AFYNGZ4sjqL8D+PjREwB4FyNd07/mQr6ddqQR6n+ycivqmlBiaWJx2ndyIyfeOYQgTLsb00s5StU48BGTOSvVCVnze+DZRO11OMaVmbrHqebKQtzVArpzZOxHahgLFGiLx47G2f6JOAPnvHr50nUxxPpxaQXYHi1uwQTKFbDXs8WpWrdDojT2rVurLc7H5buKvqQ2rFGNrj1lZVv0mJJ+OWdYeZmrl9hySc8c5FV+TPtYSWx3DhYuBAk0j5ay7ORaJMUqPnsRVBFj4nTsU9IuCn2J8c3lhiN297q/R6ZrNU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4510.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(39860400002)(366004)(346002)(376002)(316002)(8936002)(110136005)(966005)(26005)(186003)(86362001)(83380400001)(38100700002)(16576012)(31686004)(6486002)(2906002)(31696002)(956004)(66946007)(66476007)(5660300002)(16526019)(2616005)(8676002)(478600001)(36756003)(66556008)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bk1LYU1Rd281Z1NISXhGd3JtMnZuRzhCN2oycVdLRkpSbHBWa2JUL1hRN3g2?=
 =?utf-8?B?TTNzNG1YNDVHZnNxY3hmRTB3Zm9ZajVUSmsrbUswcitIbGMxTTRGVW02MTNS?=
 =?utf-8?B?SjUwczJseGRrRkdFM2JnZUtUSWxlcGFra3RKU3pnTWU0RjBGbnlHK2s0d25q?=
 =?utf-8?B?Vk9kMFUvOVdPZDFiKzFzNmUxWGFobktqVVRiMUtxUUFXZkpZcGN0aUtTS1hO?=
 =?utf-8?B?TTVidkpPNGswQ040M2FsOHJId0swaWU2cmtQbzY1NllDbldPRFJTL2g4dDIr?=
 =?utf-8?B?MXVNRkN3dXhuTy9OaXFSOUNlUi9yakd0Y2EwK0ZwZXJqNFBuaWsyK3dLYTNC?=
 =?utf-8?B?ZkxmWGtucXV3ZWx1MWVmRXRnZFhiOEw1RG1MQm1DQUEyTGl0NG1zNEF3UU93?=
 =?utf-8?B?VTdwY0tmUmRNS1ZyQnM0cGNURlJuZ0tQS290VU9rTE53MmRIVDJod0FPams5?=
 =?utf-8?B?WjlzM2VNZ3VNdUFaTE04c1dySDVDMENIYkdjZ2x5WG1zeXo1UHh1ZmIvQ256?=
 =?utf-8?B?TkE1RkU0eDM3eExZZTdtNXFMU3V0SUk1bkJFZVFuV0Mzb0Z4cFRzekx4NDZr?=
 =?utf-8?B?bE9VcWJrUlFBN0ZrUkd6V0NvRUhjOEJaRE1aNFQ4MUJkd3VqQ3FzL2o0d1Y1?=
 =?utf-8?B?djJNS05DV1YwbVpRdi9GZDZRQy81YnRjUTVuTHVwYnRlZjBEcUlXajFBM0ww?=
 =?utf-8?B?N0JCUW1VR2tYTldiR09kNlVQUlZpcmtLRms0UGJDeEh5SlJpaC9hOE9tS1ky?=
 =?utf-8?B?ZnFaUGcyMEdjbHFqNll6SDB6cEtiVzVKYVB4VnlvODhyU21XOElnTmcxTGZ4?=
 =?utf-8?B?cjd5YlF4VVY2aUhJNTBuZkYvUXRueVJnL3JKdlR2U2c3em5PYnpzbmFxV0Rz?=
 =?utf-8?B?R3BnY0Mrd2JYL2I1djc1UFVEcjJCcE9KazR5RHB1SnZUMmp4WFJMelNsV1FK?=
 =?utf-8?B?azZhL0VNdERDVVRDK3YxMlZsUjR2K3pDRW1pTlFlY3hodVVESHp4Nnhhbnht?=
 =?utf-8?B?NFF5QVF6aDV3dGxlUDlJK0VsMGZUV1JBOUdDVXZmZUlOTWladVcvOXVzK0pz?=
 =?utf-8?B?NVFPeVVybk5iNFNMVEg5bXFFMG5iSUJIUG1vb3I4RzV1T2o2YTllRmFUb29H?=
 =?utf-8?B?Q3VDQzVzSFJZcEhtTGN4bmVkd0g0WVI4ZWtQYS9PYU4wK0pDZ2EwYWg1djRX?=
 =?utf-8?B?cFl2S2JuQ2RaV1ErS1o1N0Fxdk1wRWUxa3ZNd1FaeTZHV3VLWmFvMHlpL1Zr?=
 =?utf-8?B?UEQ0azZIZmV5VEpNZEFTZGJCck1PYU1nZkNhNWZESzVkMGpqVkFZZWdwaWQx?=
 =?utf-8?B?bHd3eW96Sk8zaG45Z3doaDZNV0wrQkx2UDJ0MGcxM3ViQnd0Y24yVUR1N2VV?=
 =?utf-8?B?cG1HNFBmempzZ0ZPVzNUbTFPMEl3Mk9qdFhpcjl2U1V6VmRaQWJQcUdWTWtz?=
 =?utf-8?B?R05vNW13YVllbnEvY2NVRUE1ZE9wdEN1QTBGVHp4ZGhIbFgvNVpOWVMycnJh?=
 =?utf-8?B?cldFckhpVnpTMmxudXBWR250ZDl6RFlGOXE4L0dYRmxOVWJiYWtjQmNQK052?=
 =?utf-8?B?UVBKQUZUM3NzL0dmVStQWll5aGNvRXgzaS9jeW96c2lpWmViVXNuQnIrYU5F?=
 =?utf-8?B?SnRGYUtXZU5PcXA3SDQzTjJoQ0JBNmdjWDkzTHZNMmE3TDVWbkxZdVBzTm8v?=
 =?utf-8?B?QWpCQU1IZGYxV3hoTy9IalUrSmpDSVRSR1puVXFNLzkycTRnd0ZOTVBqbnBT?=
 =?utf-8?Q?DIsphyfPiTHopieNZu0KbmdSWn3xAoH4q0YRLAa?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2972bc1f-6dfb-4a7b-1ed4-08d93a43e8ef
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4510.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2021 14:49:19.6732
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /HegYlQB5E844FMxqPpWUnuuarXhE1zlA/a6eQRQ/P5suCnK1VCBm0X7vs9BdY+IVjcatcYOiBWb8eB+kH01Nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4509
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 6/28/2021 04:30, Hans de Goede wrote:
> Hi,
> 
> On 6/22/21 10:07 PM, Mario Limonciello wrote:
>> On an AMD based Lenovo T14, I find that the module doesn't work at
>> all, and instead has a traceback with messages like:
>>
>> ```
>> sysfs: cannot create duplicate filename '/devices/virtual/firmware-attributes/thinklmi/attributes/Reserved'
>> ```
>>
>> Duplicate and reserved values showing up appear to be a firmware bug,
>> but they shouldn't make the driver explode.  So catch them and skip
>> them.
>>
>> Fixes: a40cd7ef22fb ("platform/x86: think-lmi: Add WMI interface support on Lenovo platforms")
>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> 
> Thank you.
> 
>> ---
>>   drivers/platform/x86/think-lmi.c | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> V1->V2 changes:
>>   * Don't show reserved objects either
>>   * Clear the object so it doesn't explode on module unload
>>
>> diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
>> index d2644230b91f..4d8b5c185f8e 100644
>> --- a/drivers/platform/x86/think-lmi.c
>> +++ b/drivers/platform/x86/think-lmi.c
>> @@ -691,6 +691,16 @@ static int tlmi_sysfs_init(void)
>>   		if (!tlmi_priv.setting[i])
>>   			continue;
>>   
>> +		/* check for duplicate or reserved values */
>> +		if (kset_find_obj(tlmi_priv.attribute_kset, tlmi_priv.setting[i]->display_name) ||
>> +		    !strcmp(tlmi_priv.setting[i]->display_name, "Reserved")) {
>> +			pr_debug("duplicate or reserved attribute name found - %s\n",
>> +				tlmi_priv.setting[i]->display_name);
>> +			kfree(tlmi_priv.setting[i]->possible_values);
> 
> You are missing a:
> 
> 			kfree(tlmi_priv.setting[i]);
> 
> here, this is done through the kobj_put in tlmi_release_attr(), but since we will
> now never register the kobj we should just free this directly to avoid a memleak.
> 
> Since I want to include this important fix in my first pull-req for 5.14 I've fixed
> this up locally and merged this into my review-hans branch, so there is no need to
> send out a new version.
> 
> I've a non AMD ThinkPad (X1C8) which does have a single "Reserved" entry, so I'll
> make sure to test the modified patch myself before sending out the 5.14 pdx86
> pull-req.
> 

Thanks for taking care of that, happy this stuff will be in the first 
version for 5.14.

FYI so you are aware, the first userspace consumer (that I know of) for 
thinklmi will be fwupd.  When newer fwupd is run on 5.14+, it will use 
thinklmi to tell if boot order lock is engaged and prevent UEFI updates 
from occurring until it's disabled.

https://github.com/fwupd/fwupd/tree/master/plugins/lenovo-thinklmi


> Regards,
> 
> Hans
> 
> 
> 
> 
>> +			tlmi_priv.setting[i] = NULL;
>> +			continue;
>> +		}
>> +
>>   		/* Build attribute */
>>   		tlmi_priv.setting[i]->kobj.kset = tlmi_priv.attribute_kset;
>>   		ret = kobject_init_and_add(&tlmi_priv.setting[i]->kobj, &tlmi_attr_setting_ktype,
>>
> 

