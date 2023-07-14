Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 845C0EB64DC
	for <platform-driver-x86@archiver.kernel.org>; Fri, 14 Jul 2023 17:20:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235438AbjGNRU6 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 14 Jul 2023 13:20:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230093AbjGNRU6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 14 Jul 2023 13:20:58 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2082.outbound.protection.outlook.com [40.107.220.82])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 690F61BF3
        for <platform-driver-x86@vger.kernel.org>; Fri, 14 Jul 2023 10:20:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N/o1qMrq5FUE1/JI8VIh0O6Eg9uhX1qc1Q1ar0GhxvA2iONDURxFKXmRHas43TdOuoZskuTKd2X3/JURG8PPSB01QqIlDAmgCHGg8o99sJOMCAdbMealCEj7UFggIsAzi/WX8wfWcGY/Dx3H6FdDZ24o8s2GUn1xrZeiLssdRHxXKzkGt3Dyh/3qd1ECknVR1MiwXPtF525521JVq6k2AHm9BLULjVWxmORARcwiiAIK0CZjvggpA4ElyxAaoU06aSbAb+dl/qeUJ/Yj76I1FfPlJ+Q57ZbiJa+pgLHbzul90QJh0x0BwcIS5+tbDWunS03SWKmFIsivXwh+9MgClA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7XDFIyQe915W1XAThVisE2VtS1z4D9DDlrZKtXPidV0=;
 b=f+LShbxS8/J3grGD7BmdW3B9cp9EzGOacPLx6KC4HwodmhxCy3su5XXeUN4xsTQaqUxma5BXGNw1TduX4y8uTbVXagoMZjsA1B9fGlt7ddeTgbHDW1IR1ZTPyAJR6nvFpBqzhmmkUE6RtJeTvCBAlvGW5ODGfy18AvxW3BJAaApincPFhwVUHTLnqNHdxqgr65Gou5X9VvIejZtGAuWhEJi0cbCh4Tw4iXkaEQHvin9DrEh8iATiixU3cETsMGOUp+AAPYnqld4rLx0HcZ2SYYqwQkXtnE0twxZuHfO5pqyJ43oJDpsN1/ro/7juWx2iem7P2fgriPzjz6Wy8jGRjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7XDFIyQe915W1XAThVisE2VtS1z4D9DDlrZKtXPidV0=;
 b=RwE6jjJ4M6EFmCmtWQwcXD0eULEX8upQ5Uzv5Aj9vFBzX4hmQloPRWly5UMUxsWNanir9FEUtum1nFw/mAIeZFmzyOFC3nZx7qkXo5V2re71h4grZDuK0sAolHvi2Rpyd/I3PGAndEhCnEjMZIdScOEbldjLa2pcQ7qJWgV8gb0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SJ0PR12MB6928.namprd12.prod.outlook.com (2603:10b6:a03:47a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.31; Fri, 14 Jul
 2023 17:20:53 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::bce4:716a:8303:efcf]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::bce4:716a:8303:efcf%4]) with mapi id 15.20.6588.027; Fri, 14 Jul 2023
 17:20:52 +0000
Message-ID: <72207eab-9c48-689d-8eef-deebb53b818b@amd.com>
Date:   Fri, 14 Jul 2023 12:20:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 1/2] platform/x86/amd/pmf: reduce verbosity of
 apmf_get_system_params
Content-Language: en-US
To:     Hans de Goede <hdegoede@redhat.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20230714144435.1239776-1-Shyam-sundar.S-k@amd.com>
 <abba29ad-1cdb-c48e-c5b4-2cad8c7a93be@redhat.com>
From:   Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <abba29ad-1cdb-c48e-c5b4-2cad8c7a93be@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DM6PR11CA0046.namprd11.prod.outlook.com
 (2603:10b6:5:14c::23) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SJ0PR12MB6928:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e29fab8-5526-4388-6f11-08db848eacf5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pJAYKZiuz6crO35gjhpdpEJgeVbCYA4cX7Ss8BnH9vrQ/D3p97t5AFkLgqKTxgXAfME13biYcR9l34oir4wHuRYY3pFNYU2Ze3umAeMRQhQdgL8WViQOnEhj8y5S75WzNHDhjfoLUmRK2AMM/Dtr0OvRXc8aEIoYeWKNx5YK+UAZE3r5xcgx/sn32PPpw+7AMgbUb2vhUNS2ermShFZZOhbii1aT8jmCpvLG6h+aBFWNWSIe1AwreX4YbaMjXPZuN63yeHfH4Fy+E2GI59w+0p0j6lx2C0uGgLacWhRwxhCu+Xr/MVs7eUQoO4RVV70evqZVabShmB+MFsFEIi46txlJsT1ZWJRVGPLbLHu+Zf7L6aETu2tKnqeiV5AMg2+XF6jMnG1VTXxpr6hcZ0QA9tM0MIByZBHC1nhG3uej9SSDOyUM2lkBIfeNXEI78jW4KU8nATPS3FTnyJRxXpaAoR1uDv04D6gpdYzrxqgIXZUWxpJyzjnawMG/br7x/bGXEqlukUyLHUJt5xgML01yeNiT34yfIa/+bO9jE54jvcHM0wtxMbXsjXOfamnuRpzPkttIMe/2r3abyxnV15eRsHVihkfBNFkHrs71p5MxhiwEjbSSH27iZs/gKly2pS0fmKoXpQSPbUDODnCFInkYQTOYnPF9t8sP7vf97+i48QxfzWJrVs3W9NJrpY9h2GQF
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(39860400002)(366004)(136003)(396003)(451199021)(5660300002)(83380400001)(316002)(31696002)(53546011)(4326008)(6512007)(6506007)(38100700002)(2616005)(86362001)(186003)(41300700001)(8676002)(8936002)(478600001)(6486002)(110136005)(36756003)(966005)(66946007)(66476007)(31686004)(44832011)(66556008)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VWlhRlBQcVhUaGo4djdVNDFzUURvNXBscEFwbWVzY3NRWkFEdnk0ZjB0Nkh4?=
 =?utf-8?B?djlOekcvbEJXditJdjMxemN1T2lWYVFrV0p1ODBzN2JSRFhWMWNGaWpHMUhu?=
 =?utf-8?B?NmhJUks0b3ZPY1k1cEIrR0hUeHA0Z2wrd3RXbk5JOGNSVkk1SWdiOEZFOEVu?=
 =?utf-8?B?aHA2emdnaDRBY1NxYTRBdW1LSjB4ZTdLNmE5b2xjTE5KZkdpU1d0UVpvZW1T?=
 =?utf-8?B?Z0U2ZVVxMHdMY3d5V0NNL0FNTlBRZDR3U3FsM0tTR2FNeWZEcVRBWjZNWnY4?=
 =?utf-8?B?WC82Z2NHbUcrT2w0SisyVXFoZzVud1NYRnNad3dLRjVWSFBTclM5KzhJL29C?=
 =?utf-8?B?R3dTckFFWXllalpBVGMxeFQ5OHZGRGdQUkZhVno2OU1CU0JGeldZaFZjT3JN?=
 =?utf-8?B?OFJWdWowamo5NGRWZkpTYUd0UXY5RmxwTi9KbjA1M2pyL3ROd3drNXBZSUxu?=
 =?utf-8?B?aUhsWCs1WGh0VGkzR2ZEREVKb1E4RE1rakN4QloxWTBOUlNGbzNUSkVOK2RU?=
 =?utf-8?B?UVFVNXNyeFNRNWFBZEFMaFJLT3NobmkwcFowbkcrT3MrSFN2MzJ4VHRWWGJQ?=
 =?utf-8?B?SnJnUFRFYWo1Z1djTUJKK3BsbzAwQWNtQ2JBQURmRlJWYXplQlRPYlNSUEM1?=
 =?utf-8?B?L0ovS3Z0N1pidGRBaFpsUWM1L21Xc25YTi8wbWpyMjZOVXh0VXpTNWxVQkQ0?=
 =?utf-8?B?dmFldEkvaE5JK3hGYkxRSHphT2RGUEVUbHVzU01paUhlcVVaM3hDM0N0SlBs?=
 =?utf-8?B?eUlxV29UdmtWVnBGOC8yV3hlM2d1OUErNXhEOVFBdlRDMERaNkVIRTE4Qkd6?=
 =?utf-8?B?UjJqNzRGTkYvZXJuYWprRlBSbUswd1p3dVVQTTN6QzBvTjh1VnJ1OENpcHpF?=
 =?utf-8?B?dmo0RXB5bDdBcTlqVzRvMnpLRmlBMG1Vb3R0WWtyOG5IN21SRUVFY1FlbXdu?=
 =?utf-8?B?U2Qxa0Q0ZSt4eDg2RytaK2s5UVd3clk3K2NlZDQvdWszNitrWVA1THZPZngz?=
 =?utf-8?B?ano4QThJU0hPeENPUFcvcVZpQkgxSlNnVjJTVHpVYkpGSDdLMlFFUENGRUNa?=
 =?utf-8?B?ZWJyRDg3aGYzdDk2aEk4c0kwYTVrZEJVRU05bWRQa2VXY1lVMWl0MzZ3MUps?=
 =?utf-8?B?enNkU1JYY0ZUSllROVEwejl1TFlKR1k3d0kvUmo3RzMwSnIrMXlrRWhvUHVI?=
 =?utf-8?B?UndkZkhaMzNFUlpsaUZYUGhscFBtQWJmNWpwVW5nNmIwUzh1ejBXU3pPR05E?=
 =?utf-8?B?dXdYTWJpOC8wVnRYc2dwM3ROZkhFR3VqUE93YStZSnV6NERjUmJPQjhPVzNO?=
 =?utf-8?B?NUpMSUpMbndONFZqTW1reUI2ZnJCcHowdDluQWdPU1I4dE1Vc1pGK2ljbmJJ?=
 =?utf-8?B?MWNsNTZNSGs4QXhVQ3FubGg3L3lkV05kSEhZN2pTcTk1UlBJbTU4NU5pcnBa?=
 =?utf-8?B?cWRvOW1ieHhDYjV0cUlCeDB1M0dpeHAzaUthRVBtUjdpRGhvcHZVcnNiRFZ3?=
 =?utf-8?B?RjNNcVl1cS91Rk9vUmtmSHJGU3krR1RXb0RJTHRXaHltRHZQZFllY0Z5SXNG?=
 =?utf-8?B?R1BobXhxNXEzSHJzTU9Oc3dKVWlaUFBjczlLOWpNai9CbGxMdm12TTVMQ1Jr?=
 =?utf-8?B?aE1Tb3dMc1R5d29FMWRWQnNsa2VLa2o0VzlRNVVJajRLQ1JVYmN2MHQ3VHla?=
 =?utf-8?B?VzJ2Y2VEL09pT2dZcUFmV2QyZGg2SVk0L0JCSk11Tzhtdm9ieUxpZjE0THVH?=
 =?utf-8?B?b1E1QnNjWTc1MkZaREtHYW55ek5jUHU2cTNpdXlGSXFZQnFNbUQ2V2xZNGF2?=
 =?utf-8?B?NHZaYktCMGl5VjFRekRGREp3NDVYa2Era2FWeWxjSFRmL0MwcnR3U003QUI2?=
 =?utf-8?B?VUpwcWg5aDFyZlVCRklWaUpkSjQzRTBvZTN3cjI3K0lnVzRhM2V5cGU0akVW?=
 =?utf-8?B?S2Y5Y2g5WEI3a2ljdnpjRnQ2bjl6TTRFN3o4NkI3Zzh4UGRVaUtkWXJWQWZq?=
 =?utf-8?B?MXlXUDA1K3B5RVdSeUtpcHdyNGZqaU42M0E2Q01xTmhGbzRNTWdOVUt6TkNu?=
 =?utf-8?B?ZWdYU2thaUJsY3l2ZENWZXR0ajZGa3ZTRVZ3ZEFJeXQyT2tCczhTakphRDh5?=
 =?utf-8?B?RWtRMHZRZ29Ud2x2TEU2WTJYTldrTFlPWmYrS3l4a1pNbzgzcUc5WmllenVR?=
 =?utf-8?B?ZFE9PQ==?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e29fab8-5526-4388-6f11-08db848eacf5
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2023 17:20:52.7156
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uj+lIqsGSpb4gQdWLzbCOc03unz4hCbLRIxVh1n+FeahtWyNa4Q9fiVpbnSAmGOc0lp+sbmEFQRDUuTHnXuxRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6928
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 7/14/23 12:12, Hans de Goede wrote:
> Hi,
> 
> On 7/14/23 16:44, Shyam Sundar S K wrote:
>> apmf_get_system_params() failure is not a critical event, reduce its
>> verbosity from dev_err to dev_dbg.
>>
>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> 
> Thank you for your patch-series, I've applied the series to my
> review-hans branch:
> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans
> 
> Note it will show up in my review-hans branch once I've pushed my
> local branch there, which might take a while.
> 
> Once I've run some tests on this branch the patches there will be
> added to the platform-drivers-x86/for-next branch and eventually
> will be included in the pdx86 pull-request to Linus for the next
> merge-window.

So this isn't a fix persay, but the function introduced by this actually
is part of the functions mentioned in the SPS bug: 
https://bugzilla.kernel.org/show_bug.cgi?id=217571

That is - that system should have exported a SPS, but it wasn't 
associated with values stored in a table parsed by the PMF driver.

The EC can still potentially react to SPS events.

So I wonder if maybe this should actually go for -fixes so that this 
system at least gets a slider.

Thanks!
> 
> Regards,
> 
> Hans
> 
> 
> 
>> ---
>> v1->v2:
>>   - Rebase to review-hans branch
>>
>>   drivers/platform/x86/amd/pmf/acpi.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
>> index 081e84e116e7..732b15b392ab 100644
>> --- a/drivers/platform/x86/amd/pmf/acpi.c
>> +++ b/drivers/platform/x86/amd/pmf/acpi.c
>> @@ -289,7 +289,7 @@ int apmf_acpi_init(struct amd_pmf_dev *pmf_dev)
>>   
>>   	ret = apmf_get_system_params(pmf_dev);
>>   	if (ret) {
>> -		dev_err(pmf_dev->dev, "APMF apmf_get_system_params failed :%d\n", ret);
>> +		dev_dbg(pmf_dev->dev, "APMF apmf_get_system_params failed :%d\n", ret);
>>   		goto out;
>>   	}
>>   
> 

