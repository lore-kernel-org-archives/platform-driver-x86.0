Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57EB0C2B9F4
	for <platform-driver-x86@archiver.kernel.org>; Tue, 22 Jun 2021 19:58:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 41F34610C7
	for <platform-driver-x86@archiver.kernel.org>; Tue, 22 Jun 2021 19:58:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232881AbhFVUA5 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 22 Jun 2021 16:00:57 -0400
Received: from mail-co1nam11on2055.outbound.protection.outlook.com ([40.107.220.55]:20193
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232418AbhFVUA5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 22 Jun 2021 16:00:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WYlEcooRw9uu4eeeQOBVKPkZyJLkYxi3d29FOFLT/RQ2PIwlysPpiKMI8Yh0V7e4w4tztZsMV0P/a91BJ+H6tjuQ4GpWYZ0BL+8nscAIKduDy2O+AwcVtDJFv2kcadl7SKUti/Q9gb4z+6SSylEiRlAaTM7uQgF4wvB4y6a9vFJpGHsrV9Sl09MJk2aocPfzmv4rzOnYHXQ6WG1yMhaXOXLtcgfZPjhnZyxvnws68KsN5165Z0qzLT7xfHuT4ms1c3iC11hiZJK8UHH1y65WXUIW2i1umbkpSj8+FIoFkuzjtxovFwz1rULP40RtwYBnIUvFpcnA6D/EoJbKizOtdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9OJRHB6NEF8mWL/Ydgew72ZNGhbste75NpJHj2rJR9I=;
 b=JJ3zEFKV3uHt8pAb21v8QpVvvLwpREkjX0qniUn9HVmpnXXl0G0dKhtve5eiWxAuqaiWBRyAaJjMyAXb3FgE/6kD8NFrL26DYyj7vTenFOILeoGdADoXO9P/1RAHAzSNLqg0We0icZ4J6kb3y1a53hlvJJ2C92AHyx610ZuE2EsvkaO6R5jWKH7fEIcjpjy2cxlDUCqafJOXJBdrHj2yuVG6C6EqleX1ukyZM8V7I2r4kqK14akUg6Yx/vMdDuuaACVPt5bXK8mrPTIzoKtN+04LAIFWZu2Amub6k2R6rbESUz6ZLKNMb0s7FPD3PkyHrGqbh59Ze6OZhBGfv8oeJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9OJRHB6NEF8mWL/Ydgew72ZNGhbste75NpJHj2rJR9I=;
 b=WfiztuQvOYLGIz9adK0Mlu2HCGeNQr13oOrd03eTjPsrxWrQom5xF/GBeWvay9bGmnwAk9pgyjpAFw4/gD6xu8681DX+TAVf1Tvoua7sU7qj6tM/hpLNg+GqSkxMUQHZGHd+taFx1AC8eSSvO+91WvoAgz5tZrJQXnLLQAN6Xdw=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4510.namprd12.prod.outlook.com (2603:10b6:806:94::8)
 by SN6PR12MB2768.namprd12.prod.outlook.com (2603:10b6:805:72::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.23; Tue, 22 Jun
 2021 19:58:39 +0000
Received: from SA0PR12MB4510.namprd12.prod.outlook.com
 ([fe80::9c16:2794:cd04:2be0]) by SA0PR12MB4510.namprd12.prod.outlook.com
 ([fe80::9c16:2794:cd04:2be0%6]) with mapi id 15.20.4242.023; Tue, 22 Jun 2021
 19:58:39 +0000
Subject: Re: [External] [PATCH] platform/x86: think-lmi: Fix issues with
 duplicate attributes
To:     Mark Pearson <markpearson@lenovo.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        "open list:X86 PLATFORM DRIVERS" 
        <platform-driver-x86@vger.kernel.org>
References: <20210622175516.10100-1-mario.limonciello@amd.com>
 <97b375ca-6801-2872-33dd-5591cace578d@lenovo.com>
From:   "Limonciello, Mario" <mario.limonciello@amd.com>
Message-ID: <5ccd181e-dcc0-2e80-51c2-11709f60e999@amd.com>
Date:   Tue, 22 Jun 2021 14:58:38 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <97b375ca-6801-2872-33dd-5591cace578d@lenovo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [2600:1700:70:f700:cc03:ae3e:1949:c885]
X-ClientProxiedBy: SN6PR08CA0030.namprd08.prod.outlook.com
 (2603:10b6:805:66::43) To SA0PR12MB4510.namprd12.prod.outlook.com
 (2603:10b6:806:94::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2600:1700:70:f700:cc03:ae3e:1949:c885] (2600:1700:70:f700:cc03:ae3e:1949:c885) by SN6PR08CA0030.namprd08.prod.outlook.com (2603:10b6:805:66::43) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19 via Frontend Transport; Tue, 22 Jun 2021 19:58:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 61fa4bbf-cb57-4494-a623-08d935b820ee
X-MS-TrafficTypeDiagnostic: SN6PR12MB2768:
X-Microsoft-Antispam-PRVS: <SN6PR12MB2768C7C56C4288AB14999799E2099@SN6PR12MB2768.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FtP+6JANbUhJmqc5mbMEThCPliL7OuC7qghh1vV7KR462EjvZy0v2feL8c50PcFRKqyDkvewqWg4Bf5Y6ecgQf+4VvKlMYdK0O19V6eHxfXi4yWbsMItw6XcuxllCPhS0rMxGTuMChzZA0nR/MgO51WzdFGS/5kdc6KP3mcEz43uCVondgw/lImF/vp4UOWdOx8x9lqXWLj/pOikZ3U2603/EZLPDDamIi8lcIvje4bRtbwbGPRZXxs9PPA8dCXfmXBcTBpomvcqNEYnG8BWDRLVSupDSh6CuT4nuR0ldz9z/wDO4CXxaSHgJ6ugkujP2IhDiUMMCQXXmiAnTTl+tdNvk6rVht8/j3h1X0WTBI6Zpy7pKY3oG6fajrEf760VPSrbkj/Qy/rU9UyrWhQTYMJYQXk5HJogTYAMNd9uNgtVXxx3nqBZyUMvngXWBJLX7u02VUP00AyWRLEcdTYvcSy0QZVYBLAdP890qoaglHVDISrlY0bvwO2IsBs05YWDyyec8FMWg5yd0o+JfWm2JzDNeFA3OK54S07OZSYN31ZpUMdj7rbn6doXTa9fd6I41t2lcTyT+gA7vamc4HIKiPUQRjyYr86AI21+heRmYX0Z1LfAaWbLcbcQy1DoSy5OhVegbp5uYeUjOoCTpHaPJt+UllR4WZUAl/MoMvqOBUNydy+CWui1VKvN5Yru4TNs
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4510.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(136003)(39860400002)(366004)(346002)(66946007)(2906002)(66556008)(66476007)(110136005)(8676002)(8936002)(478600001)(53546011)(316002)(2616005)(83380400001)(38100700002)(5660300002)(6486002)(86362001)(31686004)(186003)(16526019)(36756003)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?djFWZkRKdFJnVHNuaUNPMnVvTDEyUm5qdEIxTkJRY2pqN21rTUFRNEE2RENq?=
 =?utf-8?B?eHBlaHJnOVloUHVXOUJzZm5icDEzemVpU2JNWjRsWXRFd3Jlb21IVnlWaXRv?=
 =?utf-8?B?eFhPeVJyVi9STTlQV2JodU91R2djcWlUYjcvOExqNE9YcTFwUVA0YU5xOEgv?=
 =?utf-8?B?bk5LdzU4MUh4NGJWdWhqRm1qTWVLU2VGOUdwRy91R2dvcVk0d3R4bzZTWVhy?=
 =?utf-8?B?QXdQbWMyMkZ0SldjaTBUYThhWThWOVRpelJZTzVtM1VMVmowN05tbWp1RHZh?=
 =?utf-8?B?dkJMMmoxVXhNUGYrUEtxUGVZL2FzNkJTN0g2c0djcDl2UUNyT0NwNWdSWnBW?=
 =?utf-8?B?V3ArM0tudC91TUFMUS9ORFBHK1B3SjdDYnlEMGp4Nkg3K1lVaFNXZCtoQ2dI?=
 =?utf-8?B?NWI3RG5DQlIxVDgydStoWmJtTThxRUhhRWVQY2pidlQySFJnZWJFanZ0VUVD?=
 =?utf-8?B?YUhvQ2hyd2ZJbGJWU3JFK2h5eGs5a3dzK2ltL3dPTUIvcFZoYjRmYWJTTGRx?=
 =?utf-8?B?Q3JqRnJLc0pIKzNqZDVmZk44RFlyaTZEOXd6QVkwVlJxOEdqV1RZeUhML0lJ?=
 =?utf-8?B?ZFpHejdtalNVOC9DOGtuNHpYY3dTU3VRWWFXQkRRakpyOWVKRnIvcVArZjdr?=
 =?utf-8?B?OTV2UzM3Z1ZEUlpuYm5icHRWTC93SVRoR2NxRVBHQTkybVlIdGJxNTRoL3Yx?=
 =?utf-8?B?WHN4NlJTWVhwek12OXI0YXUxVEZmODZYbGluRXZ5a3o1ZXBGRlpETnkyYnIw?=
 =?utf-8?B?MG40RFQ5ZTM4Rk5HeE5KWGNSNmFxckxoN3NhdkdwSit0VGZRSmI4NDlZT0dj?=
 =?utf-8?B?THp0Qjh6dnBrVmdHaUtRS0U1Uks4UEc3akZqR3czNVR4alpZNGRDUmlMR0tu?=
 =?utf-8?B?Y25GWWFKa0NLSDdsQkVmUjdXQ3dGckRlQ2NDSWxsL2VqTElDZVFweDROU2hz?=
 =?utf-8?B?TGlNMm45VHVGT0lRZnFVa1pPREF4QTBqb1ljbHduMHRQYktyZXJxNmJmbjho?=
 =?utf-8?B?REVkRGF4RDNGeG9COWRFR3ozTVNXb3NNcUQ5T0NBSXlkazNMNGZ4RUo2UDdC?=
 =?utf-8?B?dEdtYkUxcW9FcXpjNU5aaTh6WVZxTUF4aDZ3VmN5NmtsVDNTOUZMRG5TWU5T?=
 =?utf-8?B?dW9qNE91aGhPVmN3L0kwVlpjSklCVmpJTjdCYm5sMlVyRUZVUStuSTFzV0RV?=
 =?utf-8?B?QXphZ1JyZnJXVUpHWWg1Skd6djh3RzJDL01oaUhKLzRCc0J4c3dwVVc4YjMr?=
 =?utf-8?B?alBPODFrbFlMUFhHSlZRRVFFTUNWaHgvM1ZncnE2cWxLRTJpTmMxNzhVakFB?=
 =?utf-8?B?QjlOSWkyYkFNQS90Zmd5TkhwZVZtUzA4OUJlYWg0MEJXSU9IRTRxZ2VSZ3hR?=
 =?utf-8?B?aUhLZExOMHR3ZWpqWXZQc1ltRkJ6NnlFdUoxWGtCSkNaMlRWY2ZkdDFybDdx?=
 =?utf-8?B?aG5ZYjIyVFVSSlRJMVRQaENQVU45Vm1kemgwNFk2cDhSbDljWklabW42b0Vq?=
 =?utf-8?B?WXRIcENpMXlQR1VZUC9ETjAxY1lxVTNvNklrejVOcnpYVDZZcW5uaFJwNTN3?=
 =?utf-8?B?eE1pMEhTTVBDWTczOEVENWlyeTMwaW5LRmh4SnR6Wkxxb0xSQkVhalpORDdX?=
 =?utf-8?B?elJaVEI2ZlZjWUZjRll0cUxTWnZTb0dwZU9YM2tkdEZ2Yzc4eXpZM3hoQzl0?=
 =?utf-8?B?enI1VnV4ODNPQmNWK2YvRTVjaTArNWxGdlJkUU1xS1FCQVBWMXY3V09UQ1d1?=
 =?utf-8?B?bTJGb2FYekVMaGNiODNBQjVWQWtDYXByVDBNeTFZMk96MTB1TjZqc2U4M1k2?=
 =?utf-8?B?UVRoWlpTVmEyYlUweWt6NWpBNmU1b0ZHcjBDS3BQbXYwdWdiYUNwckhJT2xy?=
 =?utf-8?Q?qcwXEKTL+Ss1Z?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61fa4bbf-cb57-4494-a623-08d935b820ee
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4510.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2021 19:58:39.4178
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hYoUGbqSMZtDAszwxK22+MAcLUeqIfkoVNYzdmFuozw0TXNMLvoldK99TBH+li6CNS/1tQOY+BgWh6H6Od/TDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2768
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 6/22/2021 14:55, Mark Pearson wrote:
> 
> On 2021-06-22 1:55 p.m., Mario Limonciello wrote:
>> On an AMD based Lenovo T14, I find that the module doesn't work at
>> all, and instead has a traceback with messages like:
>>
>> ```
>> sysfs: cannot create duplicate filename '/devices/virtual/firmware-attributes/thinklmi/attributes/Reserved'
>> ```
>>
>> Check for duplicates before adding any attributes.
>>
>> Fixes: a40cd7ef22fb ("platform/x86: think-lmi: Add WMI interface support on Lenovo platforms")
>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>> ---
>>   drivers/platform/x86/think-lmi.c | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
>> index d2644230b91f..b029d4a5bc3c 100644
>> --- a/drivers/platform/x86/think-lmi.c
>> +++ b/drivers/platform/x86/think-lmi.c
>> @@ -691,6 +691,13 @@ static int tlmi_sysfs_init(void)
>>   		if (!tlmi_priv.setting[i])
>>   			continue;
>>   
>> +		/* check for duplicate */
>> +		if (kset_find_obj(tlmi_priv.attribute_kset, tlmi_priv.setting[i]->display_name)) {
>> +			pr_debug("duplicate attribute name found - %s\n",
>> +				tlmi_priv.setting[i]->display_name);
>> +			continue;
>> +		}
>> +
>>   		/* Build attribute */
>>   		tlmi_priv.setting[i]->kobj.kset = tlmi_priv.attribute_kset;
>>   		ret = kobject_init_and_add(&tlmi_priv.setting[i]->kobj, &tlmi_attr_setting_ktype,
>>
> Thanks Mario - I don't think I'd tested it on the T14 AMD yet.
> 
> Change looks good to me
> Mark
> 

In further testing this is causing problems on unload (or there was 
already another problem). So Hans please hold off, I'll work out what's 
happening and send a follow up v2.

Mark - something I'm wondering though what does "Reserved" even mean? 
Should that really be exported?  Or should it be part of a dis-allow list?


