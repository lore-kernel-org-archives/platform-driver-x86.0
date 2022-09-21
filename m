Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A1A2ECAAD8
	for <platform-driver-x86@archiver.kernel.org>; Wed, 21 Sep 2022 17:28:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229921AbiIUR2e (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 21 Sep 2022 13:28:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230310AbiIUR2b (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 21 Sep 2022 13:28:31 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2051.outbound.protection.outlook.com [40.107.244.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38A96A032A
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 Sep 2022 10:28:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eCazg8ZkzwDlHMsJtizNFBAvEceItAsyIVFaxUBPRC7BbndotIYnMVeCibxrsczYQa6Bz1CU3nPHWcRGb+wdnpgsJMgVAzaZKZd9/apDqKY+CLTLSDM6n5CVHLuqHxex2hZYPKYNiPKrPhkyGC57Dywr+T/f/IyYwTiRLJguoNagaveHSP8CONls9Fy1QJWcdcQZNcf/OGz6DOB/qxbQy3rdvtRMxAFen0De20gCP2WvAmn5TtWLS/40VtBKLN9EpCj6gMmItlhRh+s9Uq+VvB12MISgWO2LAR8CdR9CZwaXzigUkhiJc7RnMjC7JwBK7OT1Eo27srEhm/1NKXGpVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7PwH3++tF6ZuxQN+ClPD/DwaiIvpbV91rwUY3uJCIZ0=;
 b=lZG7eQog50NXNyfTEON7dG+XzMvLsU6ojIEyIWancgqKEw38ya57PQILA2r6pzzIffh+xsuF3i1tHuh/8OnXJSyirOuuZ1i/wRzIALi1gBLZaPBIzTVJJYrx/dE1mCYjRZb5H3sZHxkiZfSUv3Maf+qCoJYujgPC5xrWecNknZ95GNM2oN8V9R8WOUek6rR3VvBR4iwGNJNeG2T56Pq2dB0PziTxojzWom5dj+PEFyqSkYYkZFP/1ICKsIE7FNJIolj1FdWBPZ3IFggHDXOLpkapuBryhTRWUG/cVGIFpdwJnWvNa5MHsdFO2LOXfmzVsWxcweOycNnHhT3hWYhXuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7PwH3++tF6ZuxQN+ClPD/DwaiIvpbV91rwUY3uJCIZ0=;
 b=2ETLy/saMmXc068bZHGW+j7wXMlyJEuLIlbM9aFSPZPd3AjbRlBBLlMvp9GHP2UdkK6dvMGFGK9oXKaMiTrmJQTcT9HcWjzxFOk9OmLiGMT5ZfZ/9Y51Qh3JtJgQ/6P6+1g3Vhy5UCeigm1MCp5knR8yY4Gf07W2ZZT8QK3kj50=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by SA1PR12MB5615.namprd12.prod.outlook.com (2603:10b6:806:229::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.16; Wed, 21 Sep
 2022 17:28:28 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::4509:38d1:dda7:2d66]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::4509:38d1:dda7:2d66%9]) with mapi id 15.20.5654.016; Wed, 21 Sep 2022
 17:28:28 +0000
Message-ID: <b21839a8-fb78-e450-57ac-7f7c5dd7c9de@amd.com>
Date:   Wed, 21 Sep 2022 22:58:18 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v3 2/3] platform/x86/amd/pmf: Add sysfs to toggle CnQF
To:     Hans de Goede <hdegoede@redhat.com>, markgross@kernel.org,
        mario.limonciello@amd.com
Cc:     platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com,
        bnocera@redhat.com
References: <20220921102455.1792336-1-Shyam-sundar.S-k@amd.com>
 <20220921102455.1792336-3-Shyam-sundar.S-k@amd.com>
 <562f46a2-c09f-ec32-a41c-c8bae62030fc@redhat.com>
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <562f46a2-c09f-ec32-a41c-c8bae62030fc@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0207.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e9::18) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|SA1PR12MB5615:EE_
X-MS-Office365-Filtering-Correlation-Id: 01c1c887-7a64-4fb4-5a37-08da9bf6b217
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mO1JsI734isQRsgRR3r+9p4hS6wMja7G6bGYvKugTEwox1IiUYHgU3NVrHR/FMwv7PxOHpt5rqGt0eWr07KlMgPpSwk+Dmw3yVu4GqLWZW9GbvptQafb+TZ/cnsczt3JzvKormGnEjY6O/YB/b8xHps2av1zBFxF9+PRxER0D+Z4vWsmtOHrH4el8HcS+9FAXC9mYV4T4/P6ZxQpSWQ821JT0WOJZuSH2M6uxzBZwBDwYwH+2y/jUKePSnEsv0X6lTzXmvpetiV8mD/1Q9F8+SCz/s5btRtfhnmoxMoIZl4qv4J8SQHHickz4SAiJ85KZAG1XdbC6WYSYHi8+6klSq3SjLSQPEvle6BwaxUgCwxPqIpUOgsB7oyIU3TLkBKW65m1wNB+1iMFKd8fgaCSQCf47vrW/PP/L9eaRkXqeqmEJzVqbWuvdzQEDmGBnI4daKY+j4J2CDSyNGXpQ6EU15hqtyVdkBNENxI4EUxiD5BvL3SKTR5FuiMAitJTQ8+6F3NKNnHY4XjS7mQPrhKj0oruRVWS85krUGfTBgjbRG540TF9Bjm+h9ogOC/E6ydyM1LYmF9hrkMjaTUXKpfj8TcaHO9/PULnsLEK/ODK9HcR6csi6RZl9z4EjbaQRlVMXQpc9soD6IcNwYovHMVZSTR29omK/5kWBfTDOH8xzRGnEK82uQ/WfgML9mISxvwTwoG6aRWnHJSAE0Cr2wPRHypvFf4AluNdUnKWPNQZtU51+KM5Z6Rkt5de8Gp6loFHEMS+9rnxSQ9A+cz4rZvNZRrksGJZgyLDHGl6RfQWjMo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(366004)(396003)(136003)(39860400002)(451199015)(186003)(2616005)(2906002)(66476007)(4326008)(8676002)(66556008)(66946007)(6666004)(41300700001)(26005)(8936002)(36756003)(5660300002)(316002)(6512007)(6506007)(53546011)(86362001)(6636002)(83380400001)(31696002)(38100700002)(478600001)(6486002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0JrTEF2Y09jNGljVnZUdGVFYUtoWGI0ZTNKb0VOdElML3ZnN1ozR3JTM2E2?=
 =?utf-8?B?bUViSU93MTMvQ1dCUWx2WjdwaGZoQXF4SEU2ZHdmZ3FyTkZhcXg1aHZuSmVL?=
 =?utf-8?B?M0lqSGFGUDNkLzM4R0s3ekMvMmpPVDRBSVB3anN6VDkzblRQMzYwOHVjT3BX?=
 =?utf-8?B?Vk54VnAwZk9ITFg3R3dKeitkbWtsT1NLMzJyOXBKZ2FvMnJhdU9uQ0R6aUdn?=
 =?utf-8?B?SERYcDBnT2xvOG9DZjcrWXg3b1d4VDFodVZJOWZZWFhzTVRnaWszL1FZVVBr?=
 =?utf-8?B?bkFLMU1hSzkrUFVKRmtYOWpNOE83VDBGRFNvWHhSRmxNeHJOUXRVSHdPNFJv?=
 =?utf-8?B?d0dwUUswbEJuMGtDVmVtdTNQVkduVWhrU0RYVWpUa3I0VUNzOFdJdlVuWXFE?=
 =?utf-8?B?VkxJWGxBazhXMGNpMVd5MkpsZEViTWVMSkM2VXJKOUZBa1FFZUc3dVpZTmdn?=
 =?utf-8?B?MUhFKzdISVR5bG5MU2NSdm9aVnhZeXNQN2g0NXJXLzBRcFhiQVJ0K2lNTU5D?=
 =?utf-8?B?MEZxZmpHVlY1UzNuV3VVcDladjd6VFNyK2xXTTFrb0Y2dGlKaVFUOG5RcmU3?=
 =?utf-8?B?Skh5bk83UEUwWHI4aGtqUlBXRndoYTdYWlpOSmFOMHU4d2dwOWtnNHdoMUJY?=
 =?utf-8?B?TE85ZWVqdTJ6L0ZtWHlWVEl4RWVoR3pnaHkxZEd5c2VlL0ZLNkJXOFJ4VTBH?=
 =?utf-8?B?SnFTRHZKNm1GZm5aRk1JYnF6OWVNeXBuTmNodHl0UmU4eWJFUG9BVXZKTHAz?=
 =?utf-8?B?Z09BYWZWT1BXeFhMTGF4R0dNTk5BSmd2UTd3c2xhYnFBVzI5cEV2eUtQNUwv?=
 =?utf-8?B?M1NzczZxbCszSjd2a01aN05xOFBrcnRueXByTGhneGVYZ1BhdHlaV2VKbW1s?=
 =?utf-8?B?UW1UdzBlMDdVeWxZcWdybm1xQkswL1pXTEJzQnVEMS9KYVFDdEtIM2JvSXFu?=
 =?utf-8?B?WTBwUTNIVkZTNEtnRnFoNmJyblRNcnFwaURZakIrV0ZjNStnMVhmc3hRSGI3?=
 =?utf-8?B?aTU2NWNNRVY1dzh1ai84WUVHYlp6dTk3TDVRUnh2Y1dSVW5qRzhJTXI0cGlo?=
 =?utf-8?B?QkVwMmJYdzlQMmN1VDcvS08yUEZmWjRIeURCdmpZQzFSSHdjSm15YlhMa290?=
 =?utf-8?B?UEFXSW5aMHdLRlNCOHVMVkZnVEhsTGlQUnpkWkdCQThmVkhsaHlxNk8vQ1RX?=
 =?utf-8?B?cTliOFZMNVRET2dNWTRRamx6eFYza1BXOTZLdHFjc01sOVhIdU94bWNTTGtH?=
 =?utf-8?B?NHZIR2JnMmNwRkNrVXRaWVBIL1VsYnhpRXdLczE1eGhBbFByOVRocGVDR3p1?=
 =?utf-8?B?QTV0OTRHejU4bjNiM0JKN1dGMnNKU2RBLzlkUFg5K3dRbU5Md0NzcVU0N1ls?=
 =?utf-8?B?eVE5TkRuWWFabmEzWU1DS1EzZkxKOVlGNXp3SVVSSjFKMmdwTW12bythV3NV?=
 =?utf-8?B?MmllbFo3aHRFKzdGdmJ5c3RhMnZrbmUwUHFnR0JDQkpONzlZS0d2Mm1kQ2xR?=
 =?utf-8?B?dUp0c1VtczJKdUpKdjRWdDZlYXEyMXROUC8xMC9wR3lVdEFEYnJ0YjltK0lz?=
 =?utf-8?B?UGhsTlZzbG1VL21pM0hWbWFtOWJzVnAzMWRlUnRvSmdhK3NncjlsbGEyU0Uw?=
 =?utf-8?B?U1k1K1hLaFZqMU51UDdHMWs2S3BWSUNsdkFhWml3NFRNNTYrdFgyUDVZQ0t5?=
 =?utf-8?B?NkVCekY2aGJVT0VsVGJLUGZ2cDRFNzNYejZ4R1h1ekdtL29EeVZueVphU2h4?=
 =?utf-8?B?Qjl5bTcrUXpSeXh6enpSSHBac1dscElCNlJ3ZkIvaUJ3aG5RKzYrSVhnaDBB?=
 =?utf-8?B?cHZWSzFsT2hudWh1VEJOMUFmU1MvZk5ieXZLMDBaYUM1VFlSTDRWdHdkQzhN?=
 =?utf-8?B?WlZiUC9BdGVIcTdWdWF4T3dvYmR6d3RudTU5TFB1dE1tYmdBSjNveUdNR3Nj?=
 =?utf-8?B?QkVpV05vSVZLMWRaT0ZzRzVsc1hiditHQmZ0VmpJSS9wNEN1eU9SSG4wVGRa?=
 =?utf-8?B?cDJyQUZPeFNtMFZaY3h4c0lsOW9CYmsrOXhGUy9mMjI1K3BzQ0taTytVYnhu?=
 =?utf-8?B?VVFZbkp4K3MwUndtbGI0Y0xFUkhXWnFBd21Ya25JYjBQSk9LTHh3OVkzMWJl?=
 =?utf-8?Q?Fu2Wq0BZQeLDH0muyfh8IL3Jn?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01c1c887-7a64-4fb4-5a37-08da9bf6b217
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2022 17:28:28.3649
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4rOV2BDs0F3QqC6IzMTJpTG7Ha132bv3Eygmuzvx04z0QUuNG7PNAxXEcdPtvXZUH0FLnoasVkHEffMa+1qI+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5615
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org



On 9/21/2022 8:11 PM, Hans de Goede wrote:
> Hi,
> 
> On 9/21/22 12:24, Shyam Sundar S K wrote:
>> Whether to turn CnQF on/off by default upon driver load would be decided
>> by a BIOS flag. Add a sysfs node to provide a way to the user whether to
>> use static slider or CnQF .
>>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>>  drivers/platform/x86/amd/pmf/cnqf.c | 62 +++++++++++++++++++++++++++++
>>  drivers/platform/x86/amd/pmf/core.c |  6 +++
>>  drivers/platform/x86/amd/pmf/pmf.h  |  1 +
>>  3 files changed, 69 insertions(+)
>>
>> diff --git a/drivers/platform/x86/amd/pmf/cnqf.c b/drivers/platform/x86/amd/pmf/cnqf.c
>> index fa994800692a..34021bb22064 100644
>> --- a/drivers/platform/x86/amd/pmf/cnqf.c
>> +++ b/drivers/platform/x86/amd/pmf/cnqf.c
>> @@ -298,6 +298,68 @@ static int amd_pmf_load_defaults_cnqf(struct amd_pmf_dev *dev)
>>  	return 0;
>>  }
>>  
>> +static ssize_t cnqf_enable_store(struct device *dev,
>> +				 struct device_attribute *attr,
>> +				 const char *buf, size_t count)
>> +{
>> +	struct amd_pmf_dev *pdev = dev_get_drvdata(dev);
>> +	int mode, result, src;
>> +	bool input;
>> +
>> +	mode = amd_pmf_get_pprof_modes(pdev);
>> +	if (mode < 0)
>> +		return mode;
>> +
>> +	result = kstrtobool(buf, &input);
>> +	if (result)
>> +		return result;
>> +
>> +	src = amd_pmf_get_power_source();
>> +	pdev->cnqf_enabled = input;
>> +
>> +	if (pdev->cnqf_enabled && pdev->current_profile == PLATFORM_PROFILE_BALANCED) {
>> +		amd_pmf_set_cnqf(pdev, src, config_store.current_mode, NULL);
>> +	} else {
>> +		if (is_apmf_func_supported(pdev, APMF_FUNC_STATIC_SLIDER_GRANULAR)) {
>> +			amd_pmf_init_sps(pdev);
> 
> This amd_pmf_init_sps() calls is not necessary, this is already done at probe time
> when is_apmf_func_supported(pdev, APMF_FUNC_STATIC_SLIDER_GRANULAR) returns true.
> 
> Please drop this.
> 
>> +			amd_pmf_update_slider(pdev, SLIDER_OP_SET, mode, NULL);
>> +		}
>> +	}
>> +
>> +	dev_dbg(pdev->dev, "Received CnQF %s\n", input ? "on" : "off");
>> +	return count;
>> +}
>> +
>> +static ssize_t cnqf_enable_show(struct device *dev,
>> +				struct device_attribute *attr,
>> +				char *buf)
>> +{
>> +	struct amd_pmf_dev *pdev = dev_get_drvdata(dev);
>> +
>> +	return sysfs_emit(buf, "%s\n", pdev->cnqf_enabled ? "on" : "off");
>> +}
>> +
>> +static DEVICE_ATTR_RW(cnqf_enable);
>> +
>> +static umode_t cnqf_feature_is_visible(struct kobject *kobj,
>> +				       struct attribute *attr, int n)
>> +{
>> +	struct device *dev = kobj_to_dev(kobj);
>> +	struct amd_pmf_dev *pdev = dev_get_drvdata(dev);
>> +
>> +	return pdev->cnqf_supported ? attr->mode : 0;
>> +}
>> +
>> +static struct attribute *cnqf_feature_attrs[] = {
>> +	&dev_attr_cnqf_enable.attr,
>> +	NULL
>> +};
>> +
>> +const struct attribute_group cnqf_feature_attribute_group = {
>> +	.is_visible = cnqf_feature_is_visible,
>> +	.attrs = cnqf_feature_attrs,
>> +};
>> +
>>  void amd_pmf_deinit_cnqf(struct amd_pmf_dev *dev)
>>  {
>>  	cancel_delayed_work_sync(&dev->work_buffer);
>> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
>> index 99be1e6d57d3..44fe30726b62 100644
>> --- a/drivers/platform/x86/amd/pmf/core.c
>> +++ b/drivers/platform/x86/amd/pmf/core.c
>> @@ -391,10 +391,16 @@ static int amd_pmf_remove(struct platform_device *pdev)
>>  	return 0;
>>  }
>>  
>> +static const struct attribute_group *amd_pmf_driver_groups[] = {
>> +	&cnqf_feature_attribute_group,
>> +	NULL,
>> +};
>> +
>>  static struct platform_driver amd_pmf_driver = {
>>  	.driver = {
>>  		.name = "amd-pmf",
>>  		.acpi_match_table = amd_pmf_acpi_ids,
>> +		.dev_groups = amd_pmf_driver_groups,
>>  	},
>>  	.probe = amd_pmf_probe,
>>  	.remove = amd_pmf_remove,
>> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
>> index 24dd6fbff24c..097f3f5d33a3 100644
>> --- a/drivers/platform/x86/amd/pmf/pmf.h
>> +++ b/drivers/platform/x86/amd/pmf/pmf.h
>> @@ -422,5 +422,6 @@ int apmf_get_dyn_slider_def_dc(struct amd_pmf_dev *pdev, struct apmf_dyn_slider_
>>  int amd_pmf_init_cnqf(struct amd_pmf_dev *dev);
>>  void amd_pmf_deinit_cnqf(struct amd_pmf_dev *dev);
>>  int amd_pmf_trans_cnqf(struct amd_pmf_dev *dev, int socket_power, ktime_t time_lapsed_ms);
>> +extern const struct attribute_group cnqf_feature_attribute_group;
>>  
>>  #endif /* PMF_H */
> 
> Other then the remark about dropping the amd_pmf_init_sps() call this
> looks good to me, with that fixed this is:

Agreed. Will drop the call and fix that in v4.

Thanks,
Shyam

> 
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> 
> Regards,
> 
> Hans
> 
