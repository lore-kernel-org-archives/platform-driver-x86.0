Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1755C433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue, 30 Nov 2021 11:26:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240759AbhK3L3Y (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 30 Nov 2021 06:29:24 -0500
Received: from mail-mw2nam12on2066.outbound.protection.outlook.com ([40.107.244.66]:9678
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236162AbhK3L3X (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 30 Nov 2021 06:29:23 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dBsBsQ1o88NMI7DXCWcvDd+Z2If/nlG+6Xc+QBOAAf8LHEGnJch41EKeE3qS37NE3wCGL+chBdvIK6ax3+x/yAbcRkkt8p2WG2iJIoXkJG9IjLsZccuST/sxOOw7BjhAjPCgGtHol13mgbR+Sdn+IQMCSpgOTanIMQRmJLkf+YWMt8UJUOIb+3GcAyQiknVztjF93uk8OCSmAF85YdoLEi0mkcplF2Lmh9bPdJ747BwtwDEMrcp55QcUs16bPDw6UqPy2bR0Oy3jJJDpKPmQ42CeGZNv8YzExsrfusaIiuRCZaSmFTUjzkOvki+ztdZJbJsimbmibTbxNDAufv5eug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cm0iV+5947/Pwkj31yfv4ki+VWUK5lkA2N9FiKfdFMc=;
 b=oAyX8kd6hOJpH0iizXPgQhCHG0UK+32N3NNtVhH7JY1+JNc6MIyg41DnpGlUzAvBA7sHVItGgBYf8tX6uyIneTIbCeJBJJMFsyEauHThjsh/N7inuVolPQojOAnmwYO/W/eBwYV5+gObr7sUBGG7Ov1nrWpIuH8NjRhlRXA2e+G1eDnn5hSQ9d7txABqUwdWhhTQq+BmqjIBY1F9e0nWWEvljOkj1nJJYOQbJ3iLoxtK8E5JLLRlm/qVspe1NFSuPi9C0iw5PX6sSxLOwANnogcWfYq4nuHG3pqWP+ML0x0mJJ1ShAnPnsUsuOL6C2+ninoVPWtDPNHXJp6hN/ne7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cm0iV+5947/Pwkj31yfv4ki+VWUK5lkA2N9FiKfdFMc=;
 b=TJwKWko+01MNlXTBCmst5KC7SfR/Fi+Di5b6jBnUSHWdL3Ne2JDrupSBijKeVXB0Hu0bTOom9gFxW8/2G/uV3lsA1EspfHc9XGRCELgCZGc9Xw3ojP5+h9b9mnLP5MIBB37Q8kcQvQpIPedExvbJgCL7icdebpciu2AbES8ymiE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3508.namprd12.prod.outlook.com (2603:10b6:408:6b::19)
 by BN8PR12MB3508.namprd12.prod.outlook.com (2603:10b6:408:6b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Tue, 30 Nov
 2021 11:26:02 +0000
Received: from BN8PR12MB3508.namprd12.prod.outlook.com
 ([fe80::a907:e716:6d47:d3c8]) by BN8PR12MB3508.namprd12.prod.outlook.com
 ([fe80::a907:e716:6d47:d3c8%6]) with mapi id 15.20.4734.024; Tue, 30 Nov 2021
 11:26:02 +0000
Message-ID: <5768f078-733d-9960-583f-d5fd50edb051@amd.com>
Date:   Tue, 30 Nov 2021 16:55:48 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v5 2/3] platform/x86: amd-pmc: Store the pci_dev instance
 inside struct amd_pmc_dev
Content-Language: en-US
To:     Hans de Goede <hdegoede@redhat.com>,
        "S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>,
        "mgross@linux.intel.com" <mgross@linux.intel.com>,
        "Limonciello, Mario" <Mario.Limonciello@amd.com>
Cc:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
References: <20211029172304.2998-1-Sanket.Goswami@amd.com>
 <20211029172304.2998-3-Sanket.Goswami@amd.com>
 <94fff162-0c75-496e-37bd-fd7dab980153@redhat.com>
From:   "Goswami, Sanket" <Sanket.Goswami@amd.com>
In-Reply-To: <94fff162-0c75-496e-37bd-fd7dab980153@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BM1PR0101CA0068.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:19::30) To BN8PR12MB3508.namprd12.prod.outlook.com
 (2603:10b6:408:6b::19)
MIME-Version: 1.0
Received: from [10.136.45.90] (165.204.157.251) by BM1PR0101CA0068.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:19::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11 via Frontend Transport; Tue, 30 Nov 2021 11:25:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 44deb258-dd0c-4a49-3507-08d9b3f4304a
X-MS-TrafficTypeDiagnostic: BN8PR12MB3508:
X-Microsoft-Antispam-PRVS: <BN8PR12MB3508A9F43F94EB791109119D9C679@BN8PR12MB3508.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rwNoJsAkMUIBrWVpOliW8SlIvC82vcW35QtuNVmsydRW5+NaLtP2Jv5+zKE29suDoB+d/pHiGHB8QHij6CP3jVFwCVYGGWCM6ZlVEp766yP/AoPZjkE6zaaWn9lLsXOnnCeoCuIx6o8jfAVpCp6D8eOOeVuGuy7A0gW+tzCX4JSZ12hk0so0RxsRVCcpMeFfk7cA884ddbJ3ZTZYobufPu7ShaRq0yJ8p9+iiZrkmyg1F311KTv0R9qcgBwk8PY6GvSViNmrrut9vASJ4y8215DAn87+/3KbkglEE+rEpGzyo2Pp+p1aAJ7omX49r0ykt7YAXha3YQ3t/tvSK5YLdCB9yYQ7DlGj8Sw2b6jk4hyEJxVT6c1ZrGQJMPwZHwAPciWDKArquPMfOLTIBKJBg1e4AsHNFAF391QsWMhbPft/CYUc5a3x7yJYatCbmLnhR2nQem0G4Q50cXuRf7Tsfd3RZHwIYGpRPYd/wr58ZemxmPhL5egoell/m+UxeI+DrDpYEfUWTA5sXQwP3h3q+DylpyLY3SlSRkjgmS3AlIytq8cgljNu8TFZYZ3vr4IXiUwnqu8ZZ7Yijm7QfL8rlFbTBFzbL//VPTTts8/cXtUZSIPRGwxt5j8AtHCx0XpoIVU1uYVWCI9bTSgbxMBeAqlqZORZFAurbffFmX7SW9si3FyDG2IQ3P/kUj1h2OkUwg57VMCYBcOlXxvzUpG5WVnKXOx2EvLWTiwp1V2+r/77m3YQRl9sW99kuo4uAy3P
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR12MB3508.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8676002)(956004)(4326008)(8936002)(53546011)(6486002)(316002)(6636002)(508600001)(16576012)(2906002)(83380400001)(86362001)(26005)(2616005)(5660300002)(31696002)(66556008)(6666004)(66476007)(186003)(38100700002)(36756003)(66946007)(31686004)(110136005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUlmTUlXUmRSQkJMLzFzak00T2VlL2Z1ays5Qnd5RUg4ZWpYQWk1c3RHcTk4?=
 =?utf-8?B?TThUYVR2VzJScDVWQWZNdGp3YTU1ZTNFUVoxV2FuVWZLeVVxSTBkUjM5Y1VX?=
 =?utf-8?B?ZzZoTGhwcStrekJiUU5yUHZ6MlFXYUtJcXliWFpzOStYMGlBYSt2S2d1WmZ2?=
 =?utf-8?B?Z2Z6Ky9ZSEFQQjJTbGlrRzZYR0tXZGt3a3ZBM0dwSlFjb0ZwZTh4dXAyZDFJ?=
 =?utf-8?B?UzBwTEk4N1dSWDUwcktwRjdUK2R0YzVJcmxvZ2FxL3VRM1NrYXNxdGQzQVZz?=
 =?utf-8?B?Y3dBVCtpWVdNSWswL1pWZlpMQkVLend5OGloV1B1OWdnMWpaSDJ4S1Q3MzY1?=
 =?utf-8?B?Z2x2N3ZTeGs4UGxvZU1wR0JLT0p5M2xkdXd1NVJ5TEUybnlrWDh5UnFZWVlj?=
 =?utf-8?B?RW9RdXhTNnZUcjBudzcxVDVvM1hMZnBWODUxWDE4U2NTaDltYmtTT1dlbkVW?=
 =?utf-8?B?WGZtQTd3d3pNWU1BNzVBbTRsZ1kycGZaNjM0MnIyUHRIaTJGZk12RUxmcmQz?=
 =?utf-8?B?R29KREJYSG55VmNqQ24vSlU3MXhmN3J6a3drZTQrMko0RExWdmk5TWpDQ0x1?=
 =?utf-8?B?YXE2MUp4NEg3eHNBVlFCa1BUNERxY3prZE1CbmkzZzJKb01BNktaOU5lUjNr?=
 =?utf-8?B?ZjdDekdFaHBHSDY0UTJoeENQYVI3YTU5UzY4WWVBTTZ2cVIycGlHSlpkTE5P?=
 =?utf-8?B?RTY0UW9PNkk5N3dtazdYMDlFV0JENmw4c1lqbnZ1TDdJMG5zWXpscEZuV2hO?=
 =?utf-8?B?UzBuTHZqTXpCMXVhUXc5a2dGV0EySThkZXBObDFMYTlaR3Nsd3RPRmdtbXhI?=
 =?utf-8?B?QVFjZXdxMnRRdHQrbTNBd2NHTE1CZ3lUTm5Mdi92Vi9UMHhnWEV5WUpscTAy?=
 =?utf-8?B?eWd6ZlJpZmtGOHRKQjlvMER2VENtVndYakVGbHpkdVFQQXd4OFRyQjZvWUtB?=
 =?utf-8?B?NHpGc3grQUZXcXNXTWxtdEpqWmpFSFBTYmtVaVp2R1hQeUwvUEI2aWF6QnJa?=
 =?utf-8?B?Y2tycWVIaGtwR0ZrTnBYbGV5M1hVVlRPQzhTVWNDaEtzR2tvRWQrTmY1dFdQ?=
 =?utf-8?B?QlZTa2ovZ1Z0cnlmdzhVOVlZb0UyRGovcHNEM0xsNUVvU3JwNlVILzN3clZM?=
 =?utf-8?B?Y0pNRGVUa0JLSldBdzd4OEE4NDVyQlpzdE9JTGVzSmRaRGZqam9oWEFUREZC?=
 =?utf-8?B?QWZRaFJzZmJsaEZaRGZxSnlDUWZRaGZtb1hpWVFxUGtwZGtqUnpkVUd5UHVJ?=
 =?utf-8?B?aDk5cldQeDFSc21KNEFtNjArWFB6dlF2TndyQ3kvYjduRjFmNFVzOWJHUFhx?=
 =?utf-8?B?bzhoWDhYZ0dILzdQa1duS3pacVdJMVcrR1lIWlFVdm5mY2tORERROWFuQ0JR?=
 =?utf-8?B?Qm5rcDM0T01FT2Nqb2NIcDRWZFp1dmlsYUNBSEFwbC9CVGQ1Zi9JYmJMR2ox?=
 =?utf-8?B?aTUvcVBoWGhHZGVQTENWVlEzVytqd0d1OUY0K05GelNxNmk4SXpOcURySXcy?=
 =?utf-8?B?aHUrZExad05NT29jQlRVQlBCandnUFh1N0dwNzhvNnZpNVp3NnNNMThhd0x2?=
 =?utf-8?B?QWxJZVZkQXMwalRzRFJvYmNmcE9nY3VqYzlxU2tuRW9ZN3pwRS9GaWovTVV6?=
 =?utf-8?B?ZFVEeCttYmhYV1RaZjlTOFRBSUI1U1dVOXlmQUxDT2ZLNmVoYyszakxPSnRx?=
 =?utf-8?B?YTlLM0FVbWFVakIrZm1tMVRBUTZ5ZUppc3pOOFdtRTIxYkpsL1pVQTlyK1lz?=
 =?utf-8?B?cEs2eFpJclhJMGdjbGEvZHZHYW5wZGdrY0tTMkJ1YWRCRUxRQUpwRzlFNW5j?=
 =?utf-8?B?Tk5rM2hoRWFwUjFRNlFJalZIbnM0c0ZYQTd3aUpkYTd5b3hEV1NDNG5sQVNB?=
 =?utf-8?B?Nm9pT0dTUnV0bkN5Y3g1RksrTDdVa0VxTWhrR2VDNW8xSGdzUDgrREF4Yith?=
 =?utf-8?B?U0tvMGtyamUxQTk4RlFiQUdkUjVuVmFFbUVwVDJTY3ZaSnF3blIwTEJvM21z?=
 =?utf-8?B?bmZLdTVheE9ZOE5mTCtveUpZQkJBOTJRSksvckpIaUJKQWQ3Qys1WXNEN0x6?=
 =?utf-8?B?T2xQdHFxc2dVZzg5UGVGcTNzZXRJZDlKY0F6OHJKL0JWS2xBbXc4WHZ0dkpz?=
 =?utf-8?B?QmZNZ05LeW9BdUpIK1cwWWNOdGFvRDZFWThjNHRmWEZJOEc2Tk41eEFTNmpl?=
 =?utf-8?Q?1SjO4/GffIpb5EojNHiq6Kg=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44deb258-dd0c-4a49-3507-08d9b3f4304a
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3508.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2021 11:26:01.8824
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +CCZM5i8Yali2kdi4QExq0JRytVsNG605Dko734FycrNYoIYj8ITBoO9qMTLeNHKo9UMiWd70IEhkEvfd1OOqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3508
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Hans,

On 16-Nov-21 19:01, Hans de Goede wrote:
> [CAUTION: External Email]
> 
> Hi,
> 
> On 10/29/21 19:23, Sanket Goswami wrote:
>> Store the root port information in amd_pmc_probe() so that the
>> information can be used across multiple routines.
>>
>> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
>> ---
>> Changes in v5:
>> - Remove pci_dev_put() from amd_pmc_remove() as its no longer required.
>>
>> Changes in v4:
>> - No change.
>>
>> Changes in v3:
>> - Add pci_dev_put() in amd_pmc_remove().
>>
>> Changes in v2:
>> - Store the rdev info in amd_pmc_probe() as suggested by Hans.
>>
>>  drivers/platform/x86/amd-pmc.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
>> index 9af02860ed59..ea099f7759f2 100644
>> --- a/drivers/platform/x86/amd-pmc.c
>> +++ b/drivers/platform/x86/amd-pmc.c
>> @@ -121,6 +121,7 @@ struct amd_pmc_dev {
>>       u16 minor;
>>       u16 rev;
>>       struct device *dev;
>> +     struct pci_dev *rdev;
>>       struct mutex lock; /* generic mutex lock */
>>  #if IS_ENABLED(CONFIG_DEBUG_FS)
>>       struct dentry *dbgfs_dir;
>> @@ -538,6 +539,7 @@ static int amd_pmc_probe(struct platform_device *pdev)
>>       }
>>
>>       dev->cpu_id = rdev->device;
>> +     dev->rdev = rdev;
>>       err = pci_write_config_dword(rdev, AMD_PMC_SMU_INDEX_ADDRESS, AMD_PMC_BASE_ADDR_LO);
>>       if (err) {
>>               dev_err(dev->dev, "error writing to 0x%x\n", AMD_PMC_SMU_INDEX_ADDRESS);
>>
> 
> 
> I'm afraid this is still not correct:
> 
> 1. The pci_dev_put() at line 570 is still there, so after that line
>    you no longer have a reference to the pci_dev and the pointer may
>    end up pointing to free-ed memory
> 
> 2. Once you drop the pci_dev_put() at line 570, all the error-exit
>    paths from probe after that, like this one :
> 
>         dev->regbase = devm_ioremap(dev->dev, base_addr + AMD_PMC_BASE_ADDR_OFFSET,
>                                     AMD_PMC_MAPPING_SIZE);
>         if (!dev->regbase)
>                 return -ENOMEM;
> 
>    need to be changed to now, put the rdev (since that is now no longer
>    done on line 570), so this needs to be changed to:
> 
>         dev->regbase = devm_ioremap(dev->dev, base_addr + AMD_PMC_BASE_ADDR_OFFSET,
>                                     AMD_PMC_MAPPING_SIZE);
>         if (!dev->regbase) {
>                 err = -ENOMEM;
>                 goto err_pci_dev_put;
>         }
> 
>    and the same for:
> 
>         dev->fch_virt_addr = devm_ioremap(dev->dev, fch_phys_addr, FCH_SSC_MAPPING_SIZE);
>         if (!dev->fch_virt_addr)
>                 return -ENOMEM;
> 
> 3. Since you now keep the reference on a succesfull probe, you need to add a
> 
>         pci_dev_put(dev->rdev);
> 
>    call to amd_pmc_remove()
> 
> 
> Note that the changelog says you already did 3. in v3 but for some reason you
> have completely dropped that and related changes now again :|
> 
> I've already asked for these changes and explained what you needed to do
> several times now; and to be honest this is growing quite tiresome.

Apologies for messing it up. I just sent out v6 for your review. Hope it would address the issues



Thanks,
Sanket
