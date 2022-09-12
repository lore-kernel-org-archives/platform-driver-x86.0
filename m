Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AEDEECAAD5
	for <platform-driver-x86@archiver.kernel.org>; Mon, 12 Sep 2022 16:22:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229502AbiILQW4 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 12 Sep 2022 12:22:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229691AbiILQWw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 12 Sep 2022 12:22:52 -0400
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam07on2071.outbound.protection.outlook.com [40.107.212.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42A652A73A
        for <platform-driver-x86@vger.kernel.org>; Mon, 12 Sep 2022 09:22:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wq8LozyNKzeXvNl99awn762t5cw7k/fwSNaena/l4vBpVQluxFhSPxIaaIrStHV+mQV2JySs09+jUDkqHh0t8XOax3AcKEe7uwUcFb/7ek7V68wlksWnFB49CHkXi0RM5//OnT6Kpw8AD4ZMeM5ftrgjiT4lUk3O2MmECJbvgMf2eYBJ+0JYCzDqF/qTlLoCnJfN4W2q7ItuwYa5eabhx+2EijRgswUPSfJB40jC9t4d6Q5DqQFoYc1ipwm33OatOBjzUH4QTmv4sBVVogdiWyzYomGTZA8Nbo3LJ710zIU/qUYySx7C5j57415AMsksJNNEFvMRQFRx+A5CwJvjHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HTqO4hV+VDTz75Sg8FstyN7+GXu2QH5GKfaKzmHMvnU=;
 b=khnmFc//Y8adnufUg9Avfsz7NJwykhb9AwV3SiaNED+iCQtdYKP/nimQykAzzrMqA70vJbBBE2lBV6ECq3uK9OzAy09bZHFWnWjHnlPTAspMvevAFggUWzbbYFF/MH3YT1iWCnCFDFvnIB94HYW4T5zlcbx/TkINW2YsHz0Cm9NLopCiYvUdIhf2PulU0JzL+xF+5VZwswI8X1ZOVSgMz5NcTbyRdjzcFAhVs0xxIqb5vsOR/TlhOLgc0X16lBTrvAZ0rvX02ts5aVjRPUc6e5ajOAy3P466c7twRkuSlyKy1VxI4TVNXy2bs+n1F7HmikCk3zhNwH3yvxkh4CjFrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HTqO4hV+VDTz75Sg8FstyN7+GXu2QH5GKfaKzmHMvnU=;
 b=PXno2FPheahqvJnNt5KVjW5OT7y7H58x40R35wjmRmMe/4mE15aRWA0FbmNffY+Rl25cMrxGnv93g+5Zgq+Ajt4NLTYGJYe83rmYerFvvsm0vtWQFmRs08xf+kktSGR0T40ZFwMxlWihqQukUN2Gx2YxmP4Yd8fbCD9njk1RBGA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by SJ0PR12MB5439.namprd12.prod.outlook.com (2603:10b6:a03:3ae::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.16; Mon, 12 Sep
 2022 16:22:49 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::4509:38d1:dda7:2d66]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::4509:38d1:dda7:2d66%7]) with mapi id 15.20.5612.022; Mon, 12 Sep 2022
 16:22:49 +0000
Message-ID: <6a298f4b-ee50-d68a-fd88-9ecc3b897c85@amd.com>
Date:   Mon, 12 Sep 2022 21:52:39 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v2 2/4] platform/x86/amd/pmf: Add sysfs to toggle CnQF
To:     "Limonciello, Mario" <mario.limonciello@amd.com>,
        hdegoede@redhat.com, markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com,
        bnocera@redhat.com
References: <20220912090641.111658-1-Shyam-sundar.S-k@amd.com>
 <20220912090641.111658-3-Shyam-sundar.S-k@amd.com>
 <8df1b75a-d081-ca0f-06d6-02c96f72f870@amd.com>
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <8df1b75a-d081-ca0f-06d6-02c96f72f870@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0181.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:be::14) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|SJ0PR12MB5439:EE_
X-MS-Office365-Filtering-Correlation-Id: 651e593f-ba27-4852-bf01-08da94db0872
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S72UtC743lsl5bvgPDHabH+LTSKZ7YV+0GienvItWkcyFxnmE2LQRU67yjs4kweZsNqiDOPxszqELm6WY9BKFZrzklXOGPsMidElBwaGkU7Sj/ShHOSBPKXmEQjT1qScNMt+6bQFkQWH5FIs+QuNjQouW/xT4agQGfJhBAWQ8urllep0/0YtYxA7oTIOLrJ9GSFRzHnhXlcuXhPI71cvBPVTlNQWkUyhqgaydBg5Cz7+7u9d9S54xIpZFQI2QLTz2dRtN5aUJSp4cxEK40MCL6JBqQykngmJOOc5coU9iW56juiw2OM5SrVqBd2SlOllbSnmtukeDpuhY2hB4t7Qq8oZySzSB7TrUqmAyDkTyJUIEcl1aUyQOvZoTYQ6cmRsEsnp5lE1mRJXR0emyXjbTUoTLXsb67AdD8eTAFTiu6OOmsaou6THv2TnBYMBX9yHUJyAhHeIb6jKaCTiaML7eOrjvwqr+sUURSWrCHXH/+NNsM/gEBLsHYYZTG4xwUHoHV5MVzEU3oGDWa9LPSEuxBhJQ9F7g00EY6rqyFoO85738aNWPGgvR4G7JnPtl+ZGaqVEmONREJIWpfvxYJFPahYnxsm/fNxqXdSYBMXAJKh13LixVJ9dhW/EvIlCAvRDGZI3Y4QPDj4VWub1EQua+6C0ERp4T8Z8TXnzxriouo9NQP6KjSx2tkf0fiuxl6c3Mzqr3vuR8haSov1c3u8q86I2MlrarBnTc/WcS0WOCXtnHT3KN7DFIzl3iFKr1mMLvGorIQhd7X1kvd+/ST/zB8gSkihB9lVPwkVfpNrc8Zo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230017)(4636009)(136003)(396003)(376002)(346002)(366004)(39860400002)(8936002)(31686004)(2906002)(6512007)(26005)(31696002)(86362001)(41300700001)(53546011)(6506007)(5660300002)(66476007)(66556008)(66946007)(478600001)(186003)(6486002)(8676002)(6666004)(38100700002)(36756003)(83380400001)(316002)(4326008)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ME8vRmVHRkJySWdXa2NFbUh1S2YybFFLV2tvMTFzZkVlN1h1VXIvZU42NGR4?=
 =?utf-8?B?NUlaeUxkM2IrWFkrd2Z6WEFSbzVZKy9mWlE0d2g2aDVZVTEwUTFwS0ovcy9Y?=
 =?utf-8?B?K2RxdVZZWEIvS1ViMkNWOEN0eDRjWmEvS2hEVkJIbkdJVnpYY0QyZXZtNG1s?=
 =?utf-8?B?aVFRR1VDNzBWM2o2Q2dKSjlNb3FldkpSbnpDMW5pcHlKbHlSKzJCakRYK1c2?=
 =?utf-8?B?WDJIN3VHVTZuOEdqR21qZDU3RXJ2MzNBT3FoNllWUXlldy95dkJDd1JldE5M?=
 =?utf-8?B?Uk9uMGRsQmFXSG55T2g2dkFQM2lqeCt3YWJFVVhJNUR4MkcrSGJkWmJRa2p2?=
 =?utf-8?B?UkFOYmxWMUFveDdlRnJNYnVxSko0YnVJUE9RMy84cW12VlZyQWJkOXJQN3pi?=
 =?utf-8?B?Vk9QU0pzQUNtUFBKcjl2dFY2ZXBCMUk0R3ZYTHROcVJqamFNeElGQ3V2bW1J?=
 =?utf-8?B?OEs5U1prcTZ1NmpLRmRQQWZZZ3NJdkxVOVpyMWd1ZzZEdE5PazhMUWRkS0Jx?=
 =?utf-8?B?ZW94QURoOHozVzNoSVV4WHA1a3dTU0pqL3lWS1Bya2JiRHV3MnRlRmtldDJF?=
 =?utf-8?B?RUNocTk3M0dpaWpMaFpKMExaMmFlZTlNQUtEYWNwR3ZkelQ0ZkVPSEs0R0Rq?=
 =?utf-8?B?WVBPd05rbFRwcjRXeVdxM1BkaFRrOVN0cFFSUHlwQzQ1OE5TSDJwd2dKTm1L?=
 =?utf-8?B?cDNCNHhtREEwY0hKTWpsKzlkU1FHN3ptTFd1eXQ4YnYxTzgreEV2YmRCTjhC?=
 =?utf-8?B?TVpiMzVKbFZXYVlKcFJCb2RvUkJCTk9pdGlVaWRSclFUNHlBbmxnbVdCazdu?=
 =?utf-8?B?UTE5YU9ZRkVzUUh5cDM2c1JFSDBxcDYvS2x0TWF1dXFyWWE4RmVFVUVhZ2l1?=
 =?utf-8?B?a1JqUUZSa2hNU3dwcFZaUjFCcWRPeWF1bVFidVJwemw2a3JFNjJBUjFwSWZO?=
 =?utf-8?B?NitRWXFEcXlUK3EwckNwWEJJSjdkemQ5VVkvWHlxLzJJS2lNcVU1cGp4TE15?=
 =?utf-8?B?YU81TDhmanZZMUF1bm85Y1lMMjRUN3ZHM0hkMUFhUVplWC8yUzRJYTB1RWpB?=
 =?utf-8?B?OGtwNzhpQ3VUY0t1eWM2VTZ1eVNZNmxFTm0va2ZJZ09wUnRHcGczSnBWUXF5?=
 =?utf-8?B?VzlnQWpTT3J2K3h4ZU1ZbG9TeUxKRXZkQlhPTHU2TjV0OHZzNHhOSGkwTFlh?=
 =?utf-8?B?d2EyNVVIcFBXSXJTRld5UFVvbU81MVRONGtEWm50V1JlQmszTG0xTEVEd3N6?=
 =?utf-8?B?eHo5aFFxZ252UU1qY2kvb2diUW5EMWk1YXArbVdrdXRkdkltODl1U3llTjFE?=
 =?utf-8?B?NTdkUWxxZUVXWGYrR1luMmZmY2FSK3d1RXlIWEtYTEJ0cUNFa1pNYWJPamxj?=
 =?utf-8?B?YjFPUEs5a3dSMUhpQUlsb3RMWFU3a0RhN3puZGlKSWU0L3Q4bVh5d29DdFlG?=
 =?utf-8?B?RVNjZ1U0bVJnZkhhbnV6bENwZmlIZ2pBSXpUOEVSbitZZldWNlFjNDZMSS9Y?=
 =?utf-8?B?RFNDaTZxZkc0S0pSVFhnVXVySGNlMTVWUy82YmloTVQ1b2N4enBhUzBHdk9k?=
 =?utf-8?B?dWh4THduMXJJc2V0UFA2OHlWbDBINXVmWjVJdWV5d2QwVmRqN0ZuelZGVml5?=
 =?utf-8?B?YVFNblBRblRFd09Ea2s5NWVwQUl3Sk1yZHkwOUdOWTlHWEJ4aVhmZ3dNRk1t?=
 =?utf-8?B?MndaUG1tWHlsdytEbGNlM2JFb0tlUjVVZllPNUc3eGRSWGlYbVVDQmdWbEpR?=
 =?utf-8?B?aGJYUHB1dXlDUG1jTDBrbTByOERleTFQaWtqeW1oVEE2eC9qSW9ZVTUvd3pX?=
 =?utf-8?B?TXYwVDlWUmc2RWRBdFVEd1B3RDZaUmFJRlZxcEZ6L1R2N0kyN1IwVllWa3lx?=
 =?utf-8?B?S0dISzU5VUNneGxWZ1hTbVF1N0ZKL3UwenlxWjNldDRMSlptdUZ2RjFwbEpR?=
 =?utf-8?B?RTBQRVdiMGJUQmpudHljR2k0dkpOTmxWSU5GQ2FoYWZKaFBHZDRmZWhCQ0Ur?=
 =?utf-8?B?OUJzbjhudFZSSjAxTHJWVDJaT3FFN2JkUUgyNDRrdC9DZ28wRlZYd3BzRzND?=
 =?utf-8?B?Y09uaDc0M3oxcU9Cbyt1TGs1M0cvNldPUUVpUXVSZ3lGTFJoM25hUUo3K2Uv?=
 =?utf-8?Q?2Bs6Ku2QsCYPgpOc6blNNxAxv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 651e593f-ba27-4852-bf01-08da94db0872
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2022 16:22:48.9957
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eH1cClbfu4Bnb/QFVlaHhXX1lv1UspfB/mI6nM9SRzNNdlBZpLodn5cgUt+yyGafAU4FfWqkjCQs9JTOpKQNbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5439
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Mario,

On 9/12/2022 7:36 PM, Limonciello, Mario wrote:
> On 9/12/2022 04:06, Shyam Sundar S K wrote:
>> Whether to turn CnQF on/off by default upon driver load would be decided
>> by a BIOS flag. Add a sysfs node to provide a way to the user whether to
>> use static slider or CnQF .
>>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>>   drivers/platform/x86/amd/pmf/cnqf.c | 57 +++++++++++++++++++++++++++++
>>   1 file changed, 57 insertions(+)
>>
>> diff --git a/drivers/platform/x86/amd/pmf/cnqf.c
>> b/drivers/platform/x86/amd/pmf/cnqf.c
>> index aebcef778a0b..8d0c1eff1659 100644
>> --- a/drivers/platform/x86/amd/pmf/cnqf.c
>> +++ b/drivers/platform/x86/amd/pmf/cnqf.c
>> @@ -294,9 +294,64 @@ void amd_pmf_load_defaults_cnqf(struct
>> amd_pmf_dev *dev)
>>           config_store.trans_prio[i] = i;
>>   }
>>   +static ssize_t feat_store(struct device *dev,
>> +              struct device_attribute *attr,
>> +              const char *buf, size_t count)
>> +{
>> +    struct amd_pmf_dev *pdev = dev_get_drvdata(dev);
>> +    int mode = amd_pmf_get_pprof_modes(pdev);
>> +    int result, src;
>> +    bool input;
>> +
>> +    result = kstrtobool(buf, &input);
>> +    if (result)
>> +        return result;
>> +
>> +    src = amd_pmf_get_power_source();
>> +    pdev->cnqf_enabled = input;
>> +
>> +    if (mode < 0)
>> +        return mode;
>> +
>> +    if (pdev->cnqf_enabled) {
>> +        amd_pmf_set_cnqf(pdev, src, config_store.current_mode, NULL);
>> +    } else {
>> +        if (is_apmf_func_supported(pdev,
>> APMF_FUNC_STATIC_SLIDER_GRANULAR)) {
>> +            amd_pmf_init_sps(pdev);
>> +            amd_pmf_update_slider(pdev, SLIDER_OP_SET, mode, NULL);
>> +        }
>> +    }
>> +
>> +    dev_dbg(pdev->dev, "Received CnQF %s\n", input ? "on" : "off");
>> +    return count;
>> +}
>> +
>> +static ssize_t feat_show(struct device *dev,
>> +             struct device_attribute *attr,
>> +             char *buf)
>> +{
>> +    struct amd_pmf_dev *pdev = dev_get_drvdata(dev);
>> +
>> +    return sprintf(buf, "%s\n", pdev->cnqf_enabled ? "on" : "off");
>> +}
>> +
>> +static DEVICE_ATTR_RW(feat);
>> +
>> +static struct attribute *cnqf_feature_attrs[] = {
>> +    &dev_attr_feat.attr,
>> +    NULL
>> +};
>> +
>> +static const struct attribute_group cnqf_feature_attribute_group = {
>> +    .attrs = cnqf_feature_attrs,
>> +    .name = "cnqf"
> 
> Perhaps you should have a "is_visible" controlled by a function that
> checks "is_apmf_func_supported(pdev, APMF_FUNC_STATIC_SLIDER_GRANULAR)".
> 
> This will then let you adjust "feat_store" to not have to check this and
> also only expose the attribute on supported systems.
> 

OK. Will do this in the v3.

Thanks,
Shyam

>> +};
>> +
>>   void amd_pmf_deinit_cnqf(struct amd_pmf_dev *dev)
>>   {
>>       cancel_delayed_work_sync(&dev->work_buffer);
>> +    sysfs_remove_group(&dev->dev->kobj, &cnqf_feature_attribute_group);
>> +    kobject_uevent(&dev->dev->kobj, KOBJ_CHANGE);
>>   }
>>     void amd_pmf_init_cnqf(struct amd_pmf_dev *dev)
>> @@ -316,4 +371,6 @@ void amd_pmf_init_cnqf(struct amd_pmf_dev *dev)
>>       /* update the thermal for CnQF */
>>       src = amd_pmf_get_power_source();
>>       amd_pmf_set_cnqf(dev, src, config_store.current_mode, NULL);
>> +    ret = sysfs_create_group(&dev->dev->kobj,
>> &cnqf_feature_attribute_group);
>> +    kobject_uevent(&dev->dev->kobj, KOBJ_CHANGE);
>>   }
> 
