Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D258C2B9F4
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Jun 2021 16:56:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1DA226128B
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Jun 2021 16:56:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229816AbhFQQ6N (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 17 Jun 2021 12:58:13 -0400
Received: from mail-mw2nam12on2084.outbound.protection.outlook.com ([40.107.244.84]:56906
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229693AbhFQQ6M (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 17 Jun 2021 12:58:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AkMr5Di2cS9ZFFKOJ69o2cOpWKlo/PU0EQPjOdV9C1i0Ob4ZDS8ZBqLHQDPE8fMDBFSA/IA1bZ03nBnRdHA+s7lG/eb2Ea6M6/9s7e7xgw/YO3HWomPq8u5oMPVgG6t658mxBDz4MdKwBWDykIhMpbt7ysoBWoUTs3NDkZx9MQxBoVA0HEWc8Zg8g8CB05kVpQYroC1l8aeJE5YQoO1K6TjTciCAPNSktov53ABb2SJA0OigKEt783eeZ4qZ7hm2MPwg99G/Yd/5UjdEwvlNOCPH4n7u/HevRrhBmnnzZZ1fNNn5wv+CQrW9XfEp2pXgAUIrFVzFjZOmQwbvbtpOFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yduL7guBj11U4DHePY+7Hi7+PXk+dGMWHRy4R6BFmu8=;
 b=I3HerP/KWO5jKFZpK3uCHeZFH8c+ybV2+1o+giVWphUA+27Dy8F8m/wJTHNehZVSHttYdx+9y9bo3InKHmBTYe8VITlEYuA4wsoUnX8O1EkKOJmYuK5HDEFrfrVlE3/kA70bV5KYaKZT2eIk/0J/sGCAvboGWvCFKHi7XdUoaoJ7VzkzdHH4orlUziXNkK14pyI/PzJ00FtKNbOe2DDSF3q14OVMQE5M24vPolxsna2sEFwf9uMuXA5ZiWW4CKDlsx1niTcQ0WIgg4SW7PtuNQCSc2oAaBTgsIbtop5cztcR92yXnB5xIsoor1Tm+rY5Zlzxa6xpnz9UtyGhcYE6Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yduL7guBj11U4DHePY+7Hi7+PXk+dGMWHRy4R6BFmu8=;
 b=hosWr1JRm/7i2M3f1o1EZohOaWn03RZ7vmgdMtpr2fo2nbkSFpl9CK0cppEJaD6hwccm4ySQbe3MwJ/wMplled3rhL0xRyBJDeiiTZv2BSavZfNqO+b0ZyT5oV9La6eaWPW7FTCXoAgUrl5xFPQQcCxhHdOZeUNtwH/pBcGXmpo=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4510.namprd12.prod.outlook.com (2603:10b6:806:94::8)
 by SA0PR12MB4511.namprd12.prod.outlook.com (2603:10b6:806:95::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Thu, 17 Jun
 2021 16:56:03 +0000
Received: from SA0PR12MB4510.namprd12.prod.outlook.com
 ([fe80::9c16:2794:cd04:2be0]) by SA0PR12MB4510.namprd12.prod.outlook.com
 ([fe80::9c16:2794:cd04:2be0%6]) with mapi id 15.20.4242.021; Thu, 17 Jun 2021
 16:56:03 +0000
Subject: Re: [PATCH 2/6] platform/x86: amd-pmc: Fix SMU firmware reporting
 mechanism
To:     Hans de Goede <hdegoede@redhat.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        mgross@linux.intel.com
Cc:     platform-driver-x86@vger.kernel.org
References: <20210617113040.1603970-1-Shyam-sundar.S-k@amd.com>
 <20210617113040.1603970-3-Shyam-sundar.S-k@amd.com>
 <14a37253-e44b-bd1d-8df3-57a127abe5c1@redhat.com>
From:   "Limonciello, Mario" <mario.limonciello@amd.com>
Message-ID: <f0b399a8-4262-50df-3ae7-6327cf93b4fd@amd.com>
Date:   Thu, 17 Jun 2021 11:56:04 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <14a37253-e44b-bd1d-8df3-57a127abe5c1@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [2600:1700:70:f700:d51a:d610:30e1:2fe7]
X-ClientProxiedBy: SA0PR11CA0004.namprd11.prod.outlook.com
 (2603:10b6:806:d3::9) To SA0PR12MB4510.namprd12.prod.outlook.com
 (2603:10b6:806:94::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2600:1700:70:f700:d51a:d610:30e1:2fe7] (2600:1700:70:f700:d51a:d610:30e1:2fe7) by SA0PR11CA0004.namprd11.prod.outlook.com (2603:10b6:806:d3::9) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21 via Frontend Transport; Thu, 17 Jun 2021 16:56:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d5e7fa57-9a21-43a0-cbbd-08d931b0ca57
X-MS-TrafficTypeDiagnostic: SA0PR12MB4511:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB45112241CA049DF0C21FE9A2E20E9@SA0PR12MB4511.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:268;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OVsOn7vt3cF97XNdHfdhGxyYbUNEdGZAlo7LgOnoTVM+ZPxLUxaiDBrlwtkhWMPDf8aOKRwcaXaJW3zROzufm0y2JLqnuEoLOnlY96GQ0yU2bnv9+2TGMZnNGt5roQrXdGYQx3L7a87AhaLO7e1np0GoisiKng+0nI2AhY4Fnp/N4pVO5zznzW4sruYKDQkLn8b6Ybo7/CxjA1q0SX06uzc8o3GpAWZJ9D4+zwPJ94wxmPo/5mY7rK7RkVrySLDlDpcGo5BiFx1xns75tF6fHYCe2wCL5chDKo6y//64mA8b9o+g+qvuKfI4UvAxBzxwh4QPC4VxqbJbnrwg2yr2ssrusl/kH2EdaXkD58VDh+92ePk19vDGHLij5Ra5jAkQWz7uGTO7jB9Nk9Bl9E0pK8VoBAKSKyiTTpNC+quD0OJtOzI73XBl+2AOY1pkaWSds6NHc7aVmtwD0WtZ4/TbEAVlmtgttx8Odp1EpohKmX5MvkuK1c4Z4bbUd2RdCMnECrqovzQXSOAnhT2Y3kONtYfoXCgm8Yjt/hG61HR4B4ceSbVSlq7YerAVqtX+YdxKo1aeMpawHAo0b/zduXIpzGUGdSAaQh/3L3DvQ2YBq81ErEJj6FfPAdvF7LMmmJk1XJf0lGB89aejAOmNR+O2IrzFMETeQTqA1l+n1DwU8WG2s11lLUBJyw4+UhJ79hT1
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4510.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(39860400002)(346002)(136003)(366004)(2616005)(6486002)(8676002)(86362001)(38100700002)(5660300002)(2906002)(53546011)(4326008)(478600001)(110136005)(36756003)(16526019)(8936002)(83380400001)(186003)(66556008)(66476007)(66946007)(316002)(31686004)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Nmk1NWVkUGdvczNzNkJOM2VWcEdvYzJvVXZxbjdmRFBERGpKaGowTURLL3Y4?=
 =?utf-8?B?aUhRSWJEV29uR0NuVGFUVnNTVm4xbDJKYi9tQnMyaEswTXdYNFRBc2N5VHBp?=
 =?utf-8?B?OERqTlNSd1I0Mm1TSTlkZEpSQlZpU1gxaDAyeC9WbGg5NGg3czlTVXU1WWIw?=
 =?utf-8?B?MUlFUGkxL0VoeWFOL1hKZlVTQ3hTa2NyczZYS1k4Z1JCN2RKMGtNcklrZjFk?=
 =?utf-8?B?S0JXMWsrZVJud2tEWmhXeElXR2xROHVocmsrYm8wU2s2WGMvdW9CVFhlZTR6?=
 =?utf-8?B?bzVVU1puTGI5MnpHZFFNajJLRmNLVmN4VGN2L1Z4S3p1bmh1RjZtYTlhakpO?=
 =?utf-8?B?V2h0cGdrYjNnZFNvYWVOTU5TdFFFRW93aFRJcUlPYU9JakVCLzBOSmlrMVI5?=
 =?utf-8?B?Zlg2ekNKRllncVQ0WTdUbVJJb3VoNGx2TWRPK3JMbjJmRFh0RCttZHhNUTBO?=
 =?utf-8?B?Nno2U1VqcElMbXdvMWhHRUJrL2p1NHVrZ0hERlZBY3E0dXkyYXpxbzlidVpp?=
 =?utf-8?B?RjY3Ty9jaWRYVkFQeUxteE50N1BBNk1CWXNZU0JsZDZ3YUVWOEJaa0NZRUdG?=
 =?utf-8?B?U0VQb2VpSmJFTTM2YkRYUFZhZldXeGFWS3hYdkdmSmpBTUNuMmUvQ0FEK2R6?=
 =?utf-8?B?RUtVKzJaU05UN3RJeFd2QmpLbTBsU1VVc1JCZFRkcFQ5M0loQ2ppOU1UTDc4?=
 =?utf-8?B?NW9BUW85b2RqMU5tUE5hdm4xKzg2RkxDZ2Y5ZEdDNURXa2ZMTUZqV3BhOXBi?=
 =?utf-8?B?YUs0NHlvc2ZGSVNOdkMyZ3RVTUJQUjRiSkhjY21DMzUvYk5mdDdqNTArQW5t?=
 =?utf-8?B?U0JCNEh1WW1zaFdIVytDbktSYm1LTlJmbVpUdFJSUlh3WmcwMHRqdGNMcjQ2?=
 =?utf-8?B?OFNFdjVndVZiTTY3SzVpUjJVeTlFTFVLNWFWaFQwM2RFRW5PS2x3dUlaN3RG?=
 =?utf-8?B?MFJHYnJtV244czBNSTdXbGp4RFRoSm42M0NnemtFcnV1WEpJS2Q4YzE0aE5i?=
 =?utf-8?B?MmlhUVZkQmpldHp2L0wwOHRUOGlsaENEMU1YQVJveUkzMXppb0UwUGRpbzBs?=
 =?utf-8?B?aGJkNXNKTXdreTJ3WXh0b0NETVRTWk5FNmk3UmgraVRaSGcybk0zUXFVc05Y?=
 =?utf-8?B?U25TSnBDa0VZNy8zdzEreEs0NWI1SFZLSDlwdDVpblpMdVVHM3F5MGVnQ21J?=
 =?utf-8?B?MUJlQ0dQd1lobTVwOG1jQW5HVzZ3V3NLSDBlemZBR0dkMklUNHRXbTVjVE5F?=
 =?utf-8?B?YXBrd1dyWkVoL1V4dW1FaU9FV2VZVmZNOVpSeFhGRVR0TDJ3eVo0MGZXQUlS?=
 =?utf-8?B?TGdlNUdCcm56QXVNM3A2blFvVHUxaTZ4aGVmUnhrZERhNnZxVXJMU2FPMWlH?=
 =?utf-8?B?SkQwMk04S1ZhSDhDMmdxWGhaS2o4RTNkT0ZQb2JQVTlqNmpOTHAxNU9oSWg1?=
 =?utf-8?B?R0xDNzZFc0JoS0hqN0c0Z2ZIdFpSd0F2L3VDUTM5c2l5WmRnOXJvRHVEY05E?=
 =?utf-8?B?Z3NiU0hEYytyVUx6bkNKaVp3U0cvaS8ySVQ3L2xJWHdEWWhnU0RJOVRFYWhp?=
 =?utf-8?B?OWJDY2VhN2JZVnAvVDZad3pYMnRYL3VuajZ1NkJMdFBpYU9STVhzc1NNTGlW?=
 =?utf-8?B?YlJPblZGUHlvRDVPOC9RamRPc1Q2Z05tekp1VU0xb0FXUkRRVFF1bjRhY2lN?=
 =?utf-8?B?dlExbFBWWktGakFjTXJuRWdIVWhBcklJNTlsY004ejFweHhaRjlwTUYwY3V4?=
 =?utf-8?B?WnBDbk8ydVFIVkVOT2RMS095b0JOSGp2OER1Z0lheXg1QnlKc215UEt3blY0?=
 =?utf-8?B?Tk5kcERpYU5wbml4ZFg0c1FSL2IvT1h0UXg1S0dSVm5PWTJlNUVtVFFZaGZI?=
 =?utf-8?Q?+47m++OKF9dFn?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5e7fa57-9a21-43a0-cbbd-08d931b0ca57
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4510.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2021 16:56:03.0134
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fLbwjWcLDhy99Jb52ov9qHsELZ0qbg5WvRZqaJaOiIHZODCVZpM1BkAuztFEfRtWWzE9gCotOQf85+GY+UQ0lA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4511
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 6/17/2021 10:02, Hans de Goede wrote:
> Hi,
> 
> On 6/17/21 1:30 PM, Shyam Sundar S K wrote:
>> It was lately understood that the current mechanism available in the
>> driver to get SMU firmware info works only on internal SMU builds and
>> there is a separate way to get all the SMU logging counters (addressed
>> in the next patch). Hence remove all the smu info shown via debugfs as it
>> is no more useful.
>>
>> Also, use dump registers routine only at one place i.e. after the command
>> submission to SMU is done.
>>
>> Fixes: 156ec4731cb2 ("platform/x86: amd-pmc: Add AMD platform support for S2Idle")
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>>   drivers/platform/x86/amd-pmc.c | 15 +--------------
>>   1 file changed, 1 insertion(+), 14 deletions(-)
>>
>> diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
>> index 9c8a53120767..ce0e2ad94d09 100644
>> --- a/drivers/platform/x86/amd-pmc.c
>> +++ b/drivers/platform/x86/amd-pmc.c
>> @@ -52,7 +52,6 @@
>>   #define AMD_CPU_ID_PCO			AMD_CPU_ID_RV
>>   #define AMD_CPU_ID_CZN			AMD_CPU_ID_RN
>>   
>> -#define AMD_SMU_FW_VERSION		0x0
>>   #define PMC_MSG_DELAY_MIN_US		100
>>   #define RESPONSE_REGISTER_LOOP_MAX	200
>>   
>> @@ -88,11 +87,6 @@ static inline void amd_pmc_reg_write(struct amd_pmc_dev *dev, int reg_offset, u3
>>   #ifdef CONFIG_DEBUG_FS
>>   static int smu_fw_info_show(struct seq_file *s, void *unused)
>>   {
>> -	struct amd_pmc_dev *dev = s->private;
>> -	u32 value;
>> -
>> -	value = ioread32(dev->smu_base + AMD_SMU_FW_VERSION);
>> -	seq_printf(s, "SMU FW Info: %x\n", value);
>>   	return 0;
>>   }
>>   DEFINE_SHOW_ATTRIBUTE(smu_fw_info);
>> @@ -164,6 +158,7 @@ static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, bool set)
>>   		dev_err(dev->dev, "SMU response timed out\n");
>>   		return rc;
>>   	}
>> +	amd_pmc_dump_registers(dev);
> 
> Is this addition instead of a removal intentional ?  If this is intentional
> this really should be done in a separate commit, with a commit message
> explaining why this change is being made.
> 
>>   	return 0;
>>   }
>>   
>> @@ -176,7 +171,6 @@ static int __maybe_unused amd_pmc_suspend(struct device *dev)
>>   	if (rc)
>>   		dev_err(pdev->dev, "suspend failed\n");
>>   
>> -	amd_pmc_dump_registers(pdev);
>>   	return 0;
>>   }
>>   
>> @@ -189,7 +183,6 @@ static int __maybe_unused amd_pmc_resume(struct device *dev)
>>   	if (rc)
>>   		dev_err(pdev->dev, "resume failed\n");
>>   
>> -	amd_pmc_dump_registers(pdev);
>>   	return 0;
>>   }
>>   
>> @@ -256,17 +249,11 @@ static int amd_pmc_probe(struct platform_device *pdev)
>>   	pci_dev_put(rdev);
>>   	base_addr = ((u64)base_addr_hi << 32 | base_addr_lo);
>>   
>> -	dev->smu_base = devm_ioremap(dev->dev, base_addr, AMD_PMC_MAPPING_SIZE);
>> -	if (!dev->smu_base)
>> -		return -ENOMEM;
>> -
> 
> Since you are now no longer setting this, I assume that this is also
> not used anywhere anymore? And thus the smu_base variable should also
> be removed from the "dev" struct.

It's removed in the next patch.  I suppose when Shyam re-spins you're 
looking to have it removed in "this" patch instead.

> 
>>   	dev->regbase = devm_ioremap(dev->dev, base_addr + AMD_PMC_BASE_ADDR_OFFSET,
>>   				    AMD_PMC_MAPPING_SIZE);
>>   	if (!dev->regbase)
>>   		return -ENOMEM;
>>   
>> -	amd_pmc_dump_registers(dev);
>> -
>>   	platform_set_drvdata(pdev, dev);
>>   	amd_pmc_dbgfs_register(dev);
>>   	return 0;
> 
> 
> Regards,
> 
> Hans
> 
> 
> p.s.
> 
> I don't have time to review the rest of this series today. I'll continue
> reviewing this later (probably on Monday).
> 
> 
