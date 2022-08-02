Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7529DC00140
	for <platform-driver-x86@archiver.kernel.org>; Tue,  2 Aug 2022 14:23:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234025AbiHBOXs (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 2 Aug 2022 10:23:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231271AbiHBOXs (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 2 Aug 2022 10:23:48 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2046.outbound.protection.outlook.com [40.107.237.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 976371706A
        for <platform-driver-x86@vger.kernel.org>; Tue,  2 Aug 2022 07:23:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TU4ETHiYPvV5oOML+OWgwTffRYtkEAUnNWtjCzvt8u8o2GzaBSF/i4O/9yEMgtEF28f+WMnpDjCkl9y3FbvATaEGEQ1R1Y1Yh00BKULNDsAy/8Mj78b7OC0ENUeGQL01MoZrEeWD1nUg5u8Yo3CgqOITAoY+QYmlq5MGNNZa1fJJrLy/WoCDc/p4bzEeDaSSb+r6DIIelJ0MFl2L/g9WKZaSeCy33pGH/Cz8y4ZMv8Rb9iDxP3NwHZra/9zPxiuKXOEwT9+xX8je8z1LHaM3hb4YNm8ewbNQqsILm9HO1FAGwXFacqTt5leE8Fz25AcPMjPDVBJl2vPCYhUp2enedA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O/BDzJH9u7Cn7ovLKWBf5x2FI4I22KNcFLxX95KqI5k=;
 b=HoWhnHPcmagMyBQZuuKFdAuDyI3M5sGkUvOfrFOWTo51EdV9ukB1nn/aEc6kC2K0+E2QaqfuscQHUUqSPXQ2+WT4aQ3E4TswKeHSrLWuoVuzH4ku26rmg6kOX2Rtv+m8pyede6an7K2bVCBPuGvZYdnh4uqMWNTJpBNsMnvhX0SL1NBO4HlGqfoG+J8+x1jVIzqAmcSDwQW/7j17kgLQ3gomUsGkud8w2Wu0UODbZfB6AdS2tAfBEZzCDByBri5GIbLJfLk+JQlIEc2D1b3yZywc5SB/VXFw9rrsY1JGagiTJpYc/lrmUud/+ZDHWxod0F9IRgGs1hFkSP0CMscQRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O/BDzJH9u7Cn7ovLKWBf5x2FI4I22KNcFLxX95KqI5k=;
 b=vS2uPakQe0VUL7qNyTdnJE38zpxUOMhMq9jsfansozlgut/GYPG1v1I3mTAeUhcl+vLaoCV/Y0QKFpp+ZeZt7Cdd5RJ91lLc80By9sJnOB0LHYO+mhmQzzt1+8UiIGDJTnaUZ+OfSFBbl3V0sWpdJbErcltEX77Nvoln68byW3s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by MWHPR12MB1198.namprd12.prod.outlook.com (2603:10b6:300:d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.11; Tue, 2 Aug
 2022 14:23:44 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::6947:34fa:6a20:3e20]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::6947:34fa:6a20:3e20%9]) with mapi id 15.20.5482.016; Tue, 2 Aug 2022
 14:23:43 +0000
Message-ID: <09dd969f-a6f6-9db2-f619-bf84599c2aa1@amd.com>
Date:   Tue, 2 Aug 2022 19:53:35 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v3 05/11] platform/x86/amd/pmf: Add heartbeat signal
 support
To:     Hans de Goede <hdegoede@redhat.com>, markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20220802112545.2118632-1-Shyam-sundar.S-k@amd.com>
 <20220802112545.2118632-6-Shyam-sundar.S-k@amd.com>
 <4354d5fb-3fd0-7207-9f39-d7678744524c@redhat.com>
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <4354d5fb-3fd0-7207-9f39-d7678744524c@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0028.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::7) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2db27d7f-2dbc-445d-84d6-08da74929aa0
X-MS-TrafficTypeDiagnostic: MWHPR12MB1198:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rD97SLzQsaTMxh2loSaODczovi+R+MrI4YS5K5MWsgfWd2f/PaZ6cGO2mJdUrVWUOCkFgABGQtxjC/mMHVNk8ax5R2ytxAg3ABpKsPNvBuGCdZI6T2lewGtJCHCKTcOnhCu/x1V87DjLwxOgZTBR8tobhDQl7N5y8AAGeEC/bRIjz3w/z7wlNdtV3s+OS3x34mB71ukTOHNUQkBCrGpwTZ2b1bJ4G5yfFhm9zJBeG3rwkRUtuP7wey3azL+0VXT4Fnn47Q9Y/1JFCX8iTGEmCWmZ99bXcsw0nuFV42wI60f3sw4+x59/Y9JWQK7YhEJgzJbCcI+yJUuB8zkigryb31BdHDjRlasi+Krm+w9RP/ZIx0E0yP1/cX3g1ghJjiy5Qn/IX5kUC3HF8oMe9HzcsLPGFeq2qS5CIBViribrk1JXKbSabDrbnwffL0Jb/wv8hAzOhH9ii1lQbCboKAX225ubw/k/JMgxXHCrGuH8f9utZDI3fNx7feQtBrDKzUYUz1Oh1NGFuG9ToF1c82xngZB9se5f5qa9jjxnGp+op/T+ZXvlH33LH9X11MJ/cS4BbHWa5Fy8sPkxR8vDwqI9Qx/ZUROlvqa0x+5ZgvJMpnLpDMCaoycoW1WwvbvxH+exdad1vY0BUI92xk/ISRM5V+R1m870XdXCOadkvRQP22RZuaL1/b2KAgMGUsJWqFKVQwrtmoUbcMSMWuvj+86sSnmMm2O+5HIyqVfB+kn1+GZnTeb+hfprtZmyDB1VL8pQGMVe5LWBEbgSl2O1fXHUK6u4VMT0Ka/u7pvA2xjv2kAsifx8sGjtwsPqYLzbF0Lv4vB4p2uKcpG6WlmGAVIC3g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(136003)(346002)(396003)(376002)(366004)(6512007)(53546011)(26005)(41300700001)(86362001)(31696002)(6506007)(6666004)(316002)(6486002)(478600001)(38100700002)(2616005)(186003)(83380400001)(2906002)(66946007)(66556008)(66476007)(8676002)(4326008)(8936002)(31686004)(36756003)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q0VtMnd4eVE3bXF2TTNGa3hQMnpGSGZ5Z1V1cW9xeHFGeUZnUy9hWXd2eWJw?=
 =?utf-8?B?NUU3Y0kreFdXVW10bGxyUk0zZE9nellBVkNUL0lZcDJVd20xdUJBaUNXbU5W?=
 =?utf-8?B?MWsvNDJVOGU5WDlNOVYvTyszM0dWTFV2RmpXOUFIWXk0QVcxRTQ3TVduY3RC?=
 =?utf-8?B?TUR2T09RSm9oTHoyenI0VjhoclhCSy8rbStmMWV3ZEJPQkU5S0Ntb0FoeW9v?=
 =?utf-8?B?bXVFb0pUT0R6RE1HdWpoamNPUysycTgrTlpUTWtEUzZxK0F5blBGdVo0ZS9z?=
 =?utf-8?B?dC9iZnBPWlB0Nitjd0xDd2xSK29FYXYycXFQOS82TThnb0JxWVBhRWNNWHlF?=
 =?utf-8?B?UzdaM1F6QWdBbitocDM4TjBtS0x4bnI0T20yVmEwZHlkakxoMmVGSXJ5cDV6?=
 =?utf-8?B?bDlxc0FDbjRiVlZ0RTVtZ1JpTVlqWThyWmhKK3NQOVFMaVMzL0lnL3ZMS2hi?=
 =?utf-8?B?ck5CTmJ3d3JYaDRmdXc1ZloxRnp4MzZqc1k0a2VSWjJ4a2p3YUJhWjN5Z2c1?=
 =?utf-8?B?NmRGaml1Qlp3eEdUS2RnN1pEVWxhNk1CVFdlelRKQVg0M0VzMVZBU2NLNXlh?=
 =?utf-8?B?Z3JvUkUvelpnNmMzV0Z0YlZabStxSC9NRkpPTnNmRWFINzd2SUxZS3dtV0lB?=
 =?utf-8?B?d0FvTy9VazFzeXEzV3RjcmljQVZWMno0TWc5NkVuWFdFeC80NC93Y2NjZEVN?=
 =?utf-8?B?VGxEelZPcG5iMStYWWtnMDFEdW1lakFwUDZpQzVZZ05WQmh5T0JMcjlNOHdP?=
 =?utf-8?B?K2FESGV6SmdjSk9GaS9QeGd6VUs1WHpZb1R0MlJRdXlObnRwQ3Bid1h5UjBB?=
 =?utf-8?B?TXpUY3pBYWRLOVRWWGRhcFRsN1R3Y0tIK3dwck5MbVpmYUwrSHRHbVlUbFRX?=
 =?utf-8?B?NS81NXhDWlIzL2ZwNzB2T1g4Zy9IQ0JnSXcvSDUybXRsUWdnTXR6TTZKTHVV?=
 =?utf-8?B?d2dEV3BZN1VLMkxvUHdqWGNaSG45YmZvcVZONWxWalc1WDM2azFwWWZuS1V4?=
 =?utf-8?B?WkF6QllaOW9UUllaWHROLzhYV1dXeE41UmFIM1hTbk5wWkhiZjBZV0RYOS80?=
 =?utf-8?B?OUdyb3l4V09DS0Yra1FZZjMyb2pIRmRFUkdPNG1tZElCMGpsUGd6STEzdzU0?=
 =?utf-8?B?endLWHZRUGJKR2FzeURUYlhIalBSeHRNaGRHS1ZtVnNqd0c4SktoRmNZWTBh?=
 =?utf-8?B?dy9uQnRtMUF4TFFweTE3Q2Zsak5sbXFqTkNKM0lVMHc1ekM4bnFzNEZHT25C?=
 =?utf-8?B?bDVqTkFFQWxYcjdPU3dkREpMOHEzdjIzYllxNTJMY3dCWUV5THdvYTYrMCtK?=
 =?utf-8?B?dGJsb2R6UTFBaEdQRjEzWVpabkM2NFRMVFk3d3pNQml1Zm9kSTB3c3hIaE9R?=
 =?utf-8?B?UUF6WG1sd0hwYm1TR2NmbVk0V2JFQlgrUlEvQlBTOXFPd1lWMXlTdmZTSnoz?=
 =?utf-8?B?cEdnTW1rdFVRejdLdi9rbm5mZXFBNVBOOUk3YkRQWVJlNmdNVjVCbFJQRmNl?=
 =?utf-8?B?a3pwcjdNRHl0SktwMm9TWHhQbWN1cEFCajdSZ2ZPc3ptQWh5bFNKVnBXUDlC?=
 =?utf-8?B?ZEhqdTU3cmpOd3lYN2R1aFhYQVRHZ1VRYmJMUnNTeVYzTWUxRnk0SXdPMy9M?=
 =?utf-8?B?YkRWeDEyMkp3WnNLaDV3MmhzTlhDUzN0aFhoemlOeWVRUmdXd2x0ODJCUWI3?=
 =?utf-8?B?MGEwMzNTWTBNdVkyaDRicm9mWkJkc3dQWVIwak1JbTRhQ3FNcTVNcjRZMC9v?=
 =?utf-8?B?aGQ4VkRkRC9nNjlaTy9BdEdRSnhmblZWUlhvTmNaKzlDK0NyaTQ4SVkwdFR2?=
 =?utf-8?B?ZXBjS2xVa2NKWjlUMzl0YW5JamFHUkZiR000cHdPa0dYUTdCcGl0ZHNTR052?=
 =?utf-8?B?eWl1dGh1WjMvQWpyYXR3NXVDNEtzbmlSSW1PV3gra1I3VXpMb3MxbDlxUERF?=
 =?utf-8?B?Qk11WG5rSXNwUTBjTnBtUjlVZkNPVjZnd0pCQWhPRHNlTkNBUU4rbGFWZllz?=
 =?utf-8?B?MFFDTS9NbzhKUzgzblBFTS9aRDlUS3BwZnZtTldnUTcySHFyckhXUnJrRHh0?=
 =?utf-8?B?U1VYRi9TMUlaNGhWdFl5OTYra0pseTJFMDFTUlYvUVRpZDdLUVN4Z3g4dllQ?=
 =?utf-8?Q?pJ1DZPZnBEJqyMdBNeFq51DgE?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2db27d7f-2dbc-445d-84d6-08da74929aa0
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2022 14:23:43.8510
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Knhulh5/unb9wHpG7n857CCPL30OkI5X1VBCzjgn+yCBYPh1u3vVngN8V5h7GyRXEKiKYG+IlDGLcKLkfSVVPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1198
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Hans,

On 8/2/2022 6:22 PM, Hans de Goede wrote:
> Hi,
> 
> On 8/2/22 13:25, Shyam Sundar S K wrote:
>> PMF driver can send periodic heartbeat signals to OEM BIOS. When BIOS does
>> not receive the signal after a period of time, it can infer that AMDPMF
>> has hung or failed to load.
>>
>> In this situation, BIOS can fallback to legacy operations. OEM can modify
>> the time interval of the signal or completely disable signals through
>> ACPI Method.
>>
>> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>>  drivers/platform/x86/amd/pmf/acpi.c | 37 +++++++++++++++++++++++++++--
>>  drivers/platform/x86/amd/pmf/core.c |  1 +
>>  drivers/platform/x86/amd/pmf/pmf.h  |  5 ++++
>>  3 files changed, 41 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
>> index 717ee81a5f73..c3f87265eeae 100644
>> --- a/drivers/platform/x86/amd/pmf/acpi.c
>> +++ b/drivers/platform/x86/amd/pmf/acpi.c
>> @@ -105,6 +105,25 @@ int apmf_get_static_slider_granular(struct amd_pmf_dev *pdev,
>>  									 data, sizeof(*data));
>>  }
>>  
>> +static void apmf_sbios_heartbeat_notify(struct work_struct *work)
>> +{
>> +	struct amd_pmf_dev *dev = container_of(work, struct amd_pmf_dev, heart_beat.work);
>> +	union acpi_object *info;
>> +	int err = 0;
>> +
>> +	dev_dbg(dev->dev, "Sending heartbeat to SBIOS\n");
>> +	info = apmf_if_call(dev, APMF_FUNC_SBIOS_HEARTBEAT, NULL);
>> +	if (!info) {
>> +		err = -EIO;
> 
> I did not notice this before, but err gets set here and then never used.
> 
> Maybe instead log an error when the call fails ?
> 
> Also the work is not re-queued on an error here, I assume this is on
> purpose ?

Yes, that's right. We should not re-queue if the call fails and leave
the control for legacy operations.

Thanks,
Shyam

> 
> Regards,
> 
> Hans
> 
> 
>> +		goto out;
>> +	}
>> +
>> +	schedule_delayed_work(&dev->heart_beat, msecs_to_jiffies(dev->hb_interval * 1000));
>> +
>> +out:
>> +	kfree(info);
>> +}
>> +
>>  static int apmf_if_verify_interface(struct amd_pmf_dev *pdev)
>>  {
>>  	struct apmf_verify_interface output;
>> @@ -133,15 +152,23 @@ static int apmf_get_system_params(struct amd_pmf_dev *dev)
>>  	if (err)
>>  		return err;
>>  
>> -	dev_dbg(dev->dev, "system params mask:0x%x flags:0x%x cmd_code:0x%x\n",
>> +	dev_dbg(dev->dev, "system params mask:0x%x flags:0x%x cmd_code:0x%x heartbeat:%d\n",
>>  		params.valid_mask,
>>  		params.flags,
>> -		params.command_code);
>> +		params.command_code,
>> +		params.heartbeat_int);
>>  	params.flags = params.flags & params.valid_mask;
>> +	dev->hb_interval = params.heartbeat_int;
>>  
>>  	return 0;
>>  }
>>  
>> +void apmf_acpi_deinit(struct amd_pmf_dev *pmf_dev)
>> +{
>> +	if (pmf_dev->hb_interval)
>> +		cancel_delayed_work_sync(&pmf_dev->heart_beat);
>> +}
>> +
>>  int apmf_acpi_init(struct amd_pmf_dev *pmf_dev)
>>  {
>>  	int ret;
>> @@ -158,6 +185,12 @@ int apmf_acpi_init(struct amd_pmf_dev *pmf_dev)
>>  		goto out;
>>  	}
>>  
>> +	if (pmf_dev->hb_interval) {
>> +		/* send heartbeats only if the interval is not zero */
>> +		INIT_DELAYED_WORK(&pmf_dev->heart_beat, apmf_sbios_heartbeat_notify);
>> +		schedule_delayed_work(&pmf_dev->heart_beat, 0);
>> +	}
>> +
>>  out:
>>  	return ret;
>>  }
>> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
>> index 032d9dc5e09f..87a1f9b27d2c 100644
>> --- a/drivers/platform/x86/amd/pmf/core.c
>> +++ b/drivers/platform/x86/amd/pmf/core.c
>> @@ -279,6 +279,7 @@ static int amd_pmf_remove(struct platform_device *pdev)
>>  
>>  	mutex_destroy(&dev->lock);
>>  	amd_pmf_deinit_features(dev);
>> +	apmf_acpi_deinit(dev);
>>  	amd_pmf_dbgfs_unregister(dev);
>>  	kfree(dev->buf);
>>  	return 0;
>> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
>> index e13542359403..5b85a7fe0f38 100644
>> --- a/drivers/platform/x86/amd/pmf/pmf.h
>> +++ b/drivers/platform/x86/amd/pmf/pmf.h
>> @@ -17,6 +17,7 @@
>>  /* APMF Functions */
>>  #define APMF_FUNC_VERIFY_INTERFACE			0
>>  #define APMF_FUNC_GET_SYS_PARAMS			1
>> +#define APMF_FUNC_SBIOS_HEARTBEAT			4
>>  #define APMF_FUNC_STATIC_SLIDER_GRANULAR       9
>>  
>>  /* Message Definitions */
>> @@ -53,6 +54,7 @@ struct apmf_system_params {
>>  	u32 valid_mask;
>>  	u32 flags;
>>  	u8 command_code;
>> +	u32 heartbeat_int;
>>  } __packed;
>>  
>>  enum amd_stt_skin_temp {
>> @@ -91,6 +93,8 @@ struct amd_pmf_dev {
>>  	enum platform_profile_option current_profile;
>>  	struct platform_profile_handler pprof;
>>  	struct dentry *dbgfs_dir;
>> +	int hb_interval; /* SBIOS heartbeat interval */
>> +	struct delayed_work heart_beat;
>>  };
>>  
>>  struct apmf_sps_prop_granular {
>> @@ -116,6 +120,7 @@ struct amd_pmf_static_slider_granular {
>>  
>>  /* Core Layer */
>>  int apmf_acpi_init(struct amd_pmf_dev *pmf_dev);
>> +void apmf_acpi_deinit(struct amd_pmf_dev *pmf_dev);
>>  int is_apmf_func_supported(struct amd_pmf_dev *pdev, unsigned long index);
>>  int amd_pmf_send_cmd(struct amd_pmf_dev *dev, u8 message, bool get, u32 arg, u32 *data);
>>  int amd_pmf_get_power_source(void);
> 
