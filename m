Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0701EE49A3
	for <platform-driver-x86@archiver.kernel.org>; Tue, 22 Aug 2023 04:05:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230410AbjHVEFf (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 22 Aug 2023 00:05:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbjHVEFe (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 22 Aug 2023 00:05:34 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2089.outbound.protection.outlook.com [40.107.93.89])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3498B187
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Aug 2023 21:05:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QqcgdHtS6ExzvEZ8ZWreVazC20FbeVr/VYRdyMu+2CRuquK2xGrG6QnpFMATMuv9SRKy0PUo1PtzsLcTuAtjfG9KKEk9kCqIszaIASfi6/u60TI7hefPrLdpFl68UZgewpYp0YZC6VbI8gKxuIW9bLoaAhrl+yXneqC/V1N+e4LJUZjKguFMJBkFHqWbn1hw7G9+Y7dw9Qwwws2Rf0cOjgUWRQlUgi/pG5KMzxObErTn4fznpQ4fGydOsivxODTn2yLviDBVi/9XL508xJKi2B2VjIyswq4a1D8cHxCq+GKrI3CyS2edJ7X81YH38QYGBakmS+9CzZNltG5kRNiV3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9weINrdoa0K84h7XYuk4oUmjZx5z3hHgDrlrA5nt29w=;
 b=aDOs/+m6PTUPtckBsGcFAUBuUw5AQEbI9Lt3Jx4g6vx+D21NEy8OFZW78icZdHtvcJWam5rdPi8ifTl+VypM9jDa02M/dLwj6xkwLsf5uMp5edui7K1dcNAdmnNQYWUSCIVGyOLfnP6qn41PWkWblHlZr0IeY7hfN7Mor13aYb9HkMavTaXFM1hga8FDcKEzpA8NX4NKWFTFFijDWlFprvc/WgCcr7UpY2+JA0TumXK6Vb6C9PPtFkVV9dWPKxr+UN6a2639NT9NpgW5zcpNyDMjOv/v9kfYyy7VU5MiJRKfrERt7yj6c1uJrOXaXOvoszchkwv0SNYEbuMJLktoHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9weINrdoa0K84h7XYuk4oUmjZx5z3hHgDrlrA5nt29w=;
 b=OU9XfdrYy04PBjefifeMhuiGBqLKrpheaqzyaJD6pmxuvVps6fmo99pAOrj/fyI8qxCBMEG5Gcj8tZCxWgbDUKOgCHjO5BBz48Xbxdof01QCIzY8UT0VqYmsa0bWvLVd/LbTydoCb7cEzNe+8gXUqnYGeptctxVOtcae7P/TRto=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5184.namprd12.prod.outlook.com (2603:10b6:5:397::18)
 by PH8PR12MB7304.namprd12.prod.outlook.com (2603:10b6:510:217::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 04:05:28 +0000
Received: from DM4PR12MB5184.namprd12.prod.outlook.com
 ([fe80::39ab:c489:68ca:4729]) by DM4PR12MB5184.namprd12.prod.outlook.com
 ([fe80::39ab:c489:68ca:4729%3]) with mapi id 15.20.6699.022; Tue, 22 Aug 2023
 04:05:28 +0000
Message-ID: <a3ee6577-d521-6d18-0a15-2f97d6f8ac3a@amd.com>
Date:   Tue, 22 Aug 2023 09:35:19 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH 2/4] platform/x86/amd/pmc: Read SMU version at the time of
 probe
To:     "Limonciello, Mario" <mario.limonciello@amd.com>,
        hdegoede@redhat.com, markgross@kernel.org
Cc:     Sanket.Goswami@amd.com, platform-driver-x86@vger.kernel.org
References: <20230811112116.2279419-1-Shyam-sundar.S-k@amd.com>
 <20230811112116.2279419-3-Shyam-sundar.S-k@amd.com>
 <744416dd-b860-4ad9-b731-857fd53fbb4e@amd.com>
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <744416dd-b860-4ad9-b731-857fd53fbb4e@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0191.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::18) To DM4PR12MB5184.namprd12.prod.outlook.com
 (2603:10b6:5:397::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5184:EE_|PH8PR12MB7304:EE_
X-MS-Office365-Filtering-Correlation-Id: e8293b24-2725-4270-711a-08dba2c5053c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QqU7UM8dWsrvfiMfhxHojG9uGMSrpEVOGcleXuuXpD4PaXzLx0SeqlQKeWTNmvhVFuicz0EoEbNdxmedU1kbqb55prY9WSEyg1AHC3YT2zTpNZQqhoHalsKp9TEwcCt4fQ7dCQ7X6pT4qx5eptZz6PqCkxHtyWeY0EgjDRJ3RDH6yaJTjWpal+xp0LYG7ut9OLckUE/0jecZ8drhnxQwlP/dOW/DADWvAZ+RWJw/tsxuBkoRm/iCBKGOffVXgtH2ntoxlh2IyaAjCcBTHFsDzmRbMSD5x9N1haaXL7ei1R5IbU7gBP/hO2HjCAkJwBMln/TCMMiuSSscr4lkbA4vRPzZvu3PgeKPuBVwnBRm2EY3/1L9yUCuU4UX4ecj47p5xINqKh5LcNDbuRbBXDMwA4he7NcAMLitVbclMX5nJXKFuJETgDb3Adkz50EmwphADFQMjDPL+ce2VNb4I7U2Mi13yIoz7W28i3GfFNhRn+x4tbk4q6iF91X8awGqKrl9r6TyLxAd9ScXVgKnVh36i7Hl/EZABblcASVKhexJmUkOb7ep9SITHLdCWEBB/R3R9oncRfw6hfMGtpq3V49Ip7onc1uSj2NVF9tZOAYHleHcVvk3FALvvhQLzhfyRZu6PhjC2UgoMeTkaPFo9Hdz/A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5184.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(136003)(396003)(39860400002)(346002)(451199024)(1800799009)(186009)(5660300002)(478600001)(41300700001)(8936002)(8676002)(4326008)(6512007)(316002)(2616005)(31686004)(26005)(66556008)(66476007)(66946007)(6666004)(53546011)(6506007)(6486002)(83380400001)(31696002)(36756003)(86362001)(38100700002)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U0NSeWxUZlJYWjU4M1RpN2hncDZpUFRNZFNkb0NsMnc1OXg5aTF5dzg0ZUxF?=
 =?utf-8?B?Nno3Z1JXK2JQYXRPLzVMdUFoQ2NiajlSZHBxcXQ4Qzd3SlZyeUpwZWxOdm5H?=
 =?utf-8?B?NzJCYWRvdGNjdVcwWk1iWTBra0t3U1dlWFhYNVJnbWJRVnNNY2dKQlNPREhp?=
 =?utf-8?B?NTZYVVIrYzVTRFFiVGZuV1Z0aTJkallZNnRVUEFJelJieHFCOWZ5Z1ZqNldK?=
 =?utf-8?B?Y2EzaGpSd09ZclpsVkNYMW1VZFpwcnFUcE53YytFNlllRndSbzh6QkM1QjUv?=
 =?utf-8?B?aS9oQkhJazkxL25KTmJwVk0xQUNTVWZCY1ZvaWw1dlpHUmc0QUJ6enF6QW5z?=
 =?utf-8?B?azJCbFBSbXI4RU5XMXhNUXpROTRzK2dvUENRYXkzSmVTdTVXc3NZK1hOdVB1?=
 =?utf-8?B?cjRLbEdUQ1RqMk5ITExsSlRtMFA1V0tMM2ovTE45V0c3RU1MUU9sS0VMR2ZR?=
 =?utf-8?B?enVHdytZUXN2aWs5T3FraGFnV2FEK1A2SlZCZ2NsSm83dk9XNWlIOHhQU0t1?=
 =?utf-8?B?enoyQk16dnEralg3ZmxNWitiNWsxSGRzOXV4RDlJMDlPMkI3VHpxOFkzT2N4?=
 =?utf-8?B?ZWxzNWMyZThSbnloY0lxTm85N3dUWldXU1drbEJuZUsrbG1mQktKNWRuQWJ1?=
 =?utf-8?B?TWNzTENNWmRnVXFxNDhva2o0SDVlUEhyUHJVTjNaRGNSbUc2OTc3dkhPd2Yr?=
 =?utf-8?B?T1ZsR081NzU2aUxOdWVkUVVYUitxUDc5bzVRN292d0xpVDcwUXN1cGJIUmxp?=
 =?utf-8?B?LzJaMWMraldneStycm5XNzRKcVJyd0wzUlc1NnhldWdtN2NhWjRjaEdGR01l?=
 =?utf-8?B?eFRxK0N1eStEWWJnbEYxY2ljYXltaFdiZHBibGwxTEpBeFdXdVJzZkFHU1NZ?=
 =?utf-8?B?ajdISm9FTEQ4Y3ArdE0vbHZoenVmdEZWajU0emVlT04xRnFFcmdJVXY3MXBx?=
 =?utf-8?B?aTFNN0lWYTJVS1Bpb1o5aHY0cDdGeHJ2V243Nlc4SHVSU05rem5NNU1jLzdj?=
 =?utf-8?B?amdmRWpXL2hMUWdQcFpyRnBrV1VKemN5NXVQZ29HY3hPVzZkQ2orZlZxeWpz?=
 =?utf-8?B?YzQzeXlZS2RsdWgycktUcUc1UVhHbmE5ZFZXNmdQWHBRYlRtZjYwbzNNT2N5?=
 =?utf-8?B?QUJxWlFtMmZsNTVkQnRmdGZleTBCSk1VOWF3Q3I2Qk5Xa2w3NTgvTTk5WWEv?=
 =?utf-8?B?TllZSEFXckNwVmpDNEZKQU5yRUNxWlJRemxHN1lPanpEQldXUzQzV2o4ZGU3?=
 =?utf-8?B?SHJyS1hMWXZnTUN5Y2E3bmQ3RDRwTTJPZ29MOFR5SExHTlNYZXd0RDIyd1JB?=
 =?utf-8?B?c3dQOFBaektUN25XeEJxZW9BTzlPRGZKWFh5d3lUQ0g5d2FIam5KNkc4c3d3?=
 =?utf-8?B?cVR4ck1ETGRtSzdFdC9EemFBQWlEWUZPTzcyR2ZvYlpSMmc3RVloNEFCNU9D?=
 =?utf-8?B?bEVKZW9yQ3hNTmJxeUFTOFdra09yNWtsemMxa3V0M3JRRGsvZEpTSWs5WGJN?=
 =?utf-8?B?Y3k0Q1dkcVlKWTYxbmppYlZQckkrb0lFam8vdEorc1lzYnlVdER1cTY0NVY1?=
 =?utf-8?B?cWxIQ3F0cnBnMnVEc3duMXRHdmcrQXZHYk5mRERMSlNGR3lvT0Y5RllWZEl5?=
 =?utf-8?B?WGk0YXRpMXNHME9Sck9xc0JLaWJCSGlOcmNldCtENHU2WTdKT3F4MkFlNlhh?=
 =?utf-8?B?MU5ZTDZGYlhPenpOa2hNdUhkc0Z4bSs1MlpRTVNRRU1DbE55K2d6RVQ5eTFC?=
 =?utf-8?B?VXVlbWhMWlgyWnQwZS8waEEreWxMMnlCRzNyNm9lb0RmZ1RFOUs4cERwSnJn?=
 =?utf-8?B?ZlI3Y2pkakh4bWFkMnRqVGhPcHFsdEpQVlp3TkZNMjVxa1k1dlowQk9uYU13?=
 =?utf-8?B?WHBBYkNqczlDdzJ1YWxPQTBONjY0S05Qck52NHl2T0VETWlBOG5yS0d0YWFs?=
 =?utf-8?B?ZGhSZ1ZPNmR3bkJXQlhldkZ0aDZIUkF6d2ZrV1lIZWZGNVR4TUJOY05nYVY4?=
 =?utf-8?B?R0dTT0Y4S3VNUkM4RXk4Um4rakt5eGZKaUs4Ky92ajM4YWFBazljSVVCWGpQ?=
 =?utf-8?B?R21BNTR0NWFNK3RSU01tZ05rMjJNdHB0dHRwQ25vUTQxUHczZGIrUVJScUo2?=
 =?utf-8?Q?gi0tWAC6VPyLruVQPeGjM06wp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8293b24-2725-4270-711a-08dba2c5053c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5184.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 04:05:28.7180
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M40vKJsskZdXCUXi+6ZVhgeHUAgKGyOJELJBrJr+umWrZadYHt9r9Hxm92Axtk7+rdyi7jqfmljlrJXagtiGWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7304
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Mario,

On 8/11/2023 5:34 PM, Limonciello, Mario wrote:
> 
> 
> On 8/11/2023 6:21 AM, Shyam Sundar S K wrote:
>> Currently the SMU version is being read at multiple places, unify all
>> of them and get the SMU version at the time of probe.
>>
>> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
>> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>>   drivers/platform/x86/amd/pmc/pmc.c | 39 +++++-------------------------
>>   1 file changed, 6 insertions(+), 33 deletions(-)
>>
> 
> It's actually quite intentional that the SMU version isn't read at probe
> but rather at first use.  The reason is that it increased boot time in a
> measurable way.

Apologies. I missed to respond back on this. I will drop this patch in v2.

Thanks,
Shyam

> 
>> diff --git a/drivers/platform/x86/amd/pmc/pmc.c
>> b/drivers/platform/x86/amd/pmc/pmc.c
>> index c1e788b67a74..043451fabbbe 100644
>> --- a/drivers/platform/x86/amd/pmc/pmc.c
>> +++ b/drivers/platform/x86/amd/pmc/pmc.c
>> @@ -405,12 +405,6 @@ static ssize_t smu_fw_version_show(struct device
>> *d, struct device_attribute *at
>>   {
>>       struct amd_pmc_dev *dev = dev_get_drvdata(d);
>>   -    if (!dev->major) {
>> -        int rc = amd_pmc_get_smu_version(dev);
>> -
>> -        if (rc)
>> -            return rc;
>> -    }
>>       return sysfs_emit(buf, "%u.%u.%u\n", dev->major, dev->minor,
>> dev->rev);
>>   }
>>   @@ -419,12 +413,6 @@ static ssize_t smu_program_show(struct device
>> *d, struct device_attribute *attr,
>>   {
>>       struct amd_pmc_dev *dev = dev_get_drvdata(d);
>>   -    if (!dev->major) {
>> -        int rc = amd_pmc_get_smu_version(dev);
>> -
>> -        if (rc)
>> -            return rc;
>> -    }
>>       return sysfs_emit(buf, "%u\n", dev->smu_program);
>>   }
>>   @@ -526,16 +514,9 @@ static int amd_pmc_idlemask_read(struct
>> amd_pmc_dev *pdev, struct device *dev,
>>                    struct seq_file *s)
>>   {
>>       u32 val;
>> -    int rc;
>>         switch (pdev->cpu_id) {
>>       case AMD_CPU_ID_CZN:
>> -        /* we haven't yet read SMU version */
>> -        if (!pdev->major) {
>> -            rc = amd_pmc_get_smu_version(pdev);
>> -            if (rc)
>> -                return rc;
>> -        }
>>           if (pdev->major > 56 || (pdev->major >= 55 && pdev->minor >=
>> 37))
>>               val = amd_pmc_reg_read(pdev, AMD_PMC_SCRATCH_REG_CZN);
>>           else
>> @@ -717,13 +698,6 @@ static int amd_pmc_get_os_hint(struct amd_pmc_dev
>> *dev)
>>   static int amd_pmc_czn_wa_irq1(struct amd_pmc_dev *pdev)
>>   {
>>       struct device *d;
>> -    int rc;
>> -
>> -    if (!pdev->major) {
>> -        rc = amd_pmc_get_smu_version(pdev);
>> -        if (rc)
>> -            return rc;
>> -    }
>>         if (pdev->major > 64 || (pdev->major == 64 && pdev->minor > 65))
>>           return 0;
>> @@ -749,13 +723,6 @@ static int amd_pmc_verify_czn_rtc(struct
>> amd_pmc_dev *pdev, u32 *arg)
>>       struct rtc_time tm;
>>       int rc;
>>   -    /* we haven't yet read SMU version */
>> -    if (!pdev->major) {
>> -        rc = amd_pmc_get_smu_version(pdev);
>> -        if (rc)
>> -            return rc;
>> -    }
>> -
>>       if (pdev->major < 64 || (pdev->major == 64 && pdev->minor < 53))
>>           return 0;
>>   @@ -1059,6 +1026,12 @@ static int amd_pmc_probe(struct
>> platform_device *pdev)
>>         mutex_init(&dev->lock);
>>   +    err = amd_pmc_get_smu_version(dev);
>> +    if (err) {
>> +        dev_err(dev->dev, "error reading SMU version\n");
>> +        goto err_pci_dev_put;
>> +    }
>> +
>>       if (enable_stb && amd_pmc_is_stb_supported(dev)) {
>>           err = amd_pmc_s2d_init(dev);
>>           if (err)
