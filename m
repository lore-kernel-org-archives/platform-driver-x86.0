Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A15AC04A68
	for <platform-driver-x86@archiver.kernel.org>; Thu, 28 Jul 2022 14:40:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232563AbiG1Ok5 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 28 Jul 2022 10:40:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233310AbiG1Okn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 28 Jul 2022 10:40:43 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on20618.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e88::618])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2C3669F11
        for <platform-driver-x86@vger.kernel.org>; Thu, 28 Jul 2022 07:38:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z7KPS/ZaAymPVFS1UAdcy1y8zGmKVuau4BJEhWQt2LmQxwHOc9us22/0FCXoQfI62clLeJEDK8GdI8vqmU+kaeNqpKalLEFXmtyZ08x9rjhdZrqGq97zSMQOrYpOVUG/6IYI1Og5UOQkfpKWHojiCVURw/tn8/J/e8LT14mRM7uzAwgxm8ZTI+0zl4A3XhV0z8j7+5bOu3g9+li9vjLS1L2P3xLRJhzazVJizY9M4mYoPw+5xkTQrUJDYKcWFZPmAVAemyTw4gD4+WEbzpFnHUpVC9cWyuesIk+xovb6Mi3cEx8Np2kzUTVMLaf5qN2Squ+Szhy6Z3rfm4jTYtoh6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KdYJNc7TQtLr4crsb6JwPIYS4eXMUIOWlBTw8/NpVFI=;
 b=jc0zpnnbIIXOGmuYwcZKBBwmhQgRwS/S1o9a7rBWaaQpayvLSCNO5PrG3L96JczjOOhBvgQZl5pFGt0C+Try7M+6I/gVakYBle6DrSQlQ+y9vArNZonxWyad+Y+1SKhFOcKGVTuNs6c0AtMe0cjB4dWZO9gPuiRII612zFmTMuFh4uZxMDWbxWB9znVoahmDnD0jUnYzGpeQ5jkltYBzgxyAKDIkc1/IDLZtWhNzyrzg0DyrIffL757KihxixG2EOkkTfiKNB6v1tK+70/U7/BE/VyNwjvC3aEX2IWlJTEMo6S9L9z0PzqzS8RCKQ18Br4sCkOICrB3qyfLqH+lCfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KdYJNc7TQtLr4crsb6JwPIYS4eXMUIOWlBTw8/NpVFI=;
 b=vN5OvXW76MO/vyvx1Z/+c39g8qQiqESgIWzFPzaXiE5oLBtDvz2d5yf0ps9SJf94GaIpU8ZuxupRQRZPJrcKXLgf2y9rpAhPAx1zAYQF4ye1W6wvQn3fOnb1bi1TOsmf1busjWh77w0o8jVrTuXAwGAUjYHCYIVJ9C6EQaZO4Cs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by PH0PR12MB5417.namprd12.prod.outlook.com (2603:10b6:510:e1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.11; Thu, 28 Jul
 2022 14:38:15 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::1143:10a5:987a:7598]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::1143:10a5:987a:7598%6]) with mapi id 15.20.5438.023; Thu, 28 Jul 2022
 14:38:14 +0000
Message-ID: <f351a921-3b7f-d8c9-10e5-816f83f22775@amd.com>
Date:   Thu, 28 Jul 2022 09:38:13 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 13/15] platform/x86/amd/pmf: Handle AMT and CQL events
 for Auto mode
Content-Language: en-US
To:     Hans de Goede <hdegoede@redhat.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com,
        Mark Pearson <markpearson@lenovo.com>
References: <20220712145847.3438544-1-Shyam-sundar.S-k@amd.com>
 <20220712145847.3438544-14-Shyam-sundar.S-k@amd.com>
 <4585d2c6-6ac1-a697-d54a-f173e9821446@redhat.com>
 <d01e52cb-31c5-7d20-4f18-1e4bb70c1355@amd.com>
 <828a7b8e-2375-a9d0-7b00-d59e84cfaa2b@redhat.com>
 <5500e911-22eb-08b3-c3fe-2a63cf22d7b8@amd.com>
 <ce75f2cc-0129-84f5-bbab-dae5ed9a7ea9@redhat.com>
From:   "Limonciello, Mario" <mario.limonciello@amd.com>
In-Reply-To: <ce75f2cc-0129-84f5-bbab-dae5ed9a7ea9@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL0PR02CA0007.namprd02.prod.outlook.com
 (2603:10b6:207:3c::20) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 55c10baf-8250-454f-a875-08da70a6cde7
X-MS-TrafficTypeDiagnostic: PH0PR12MB5417:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B5YQSLTpwoblKhz+dFPRgkKuzdVFn1dTERIit1AEYl2sOdGv46rgqvD5uOjTPbZj9k15MXzhAK0WwQaK/Rbsuw5ek+ZlHi5HR43FOLSabirefjb0eLbkvcY6PQU+xOCdPptKc/YE24p14cW/DT8Ui2D7IGycpFjkk1WWwZKKMRbMdmK2Zgwksok4cJoZ9wPsg/csJ6QKerBSQqy2ZcOFtm5S1LwT2kjqbN4DenVur515/964ju8sGk7EGul6En90iHkMCVpm7pUosiVfFGYjmyMBSDd706KW9hSwO06EX2wDoW6/qx7skix7I0ZOeW6ST1jLroI7bv+CAGfuOIzWZKhM5QoRZPkpdt/W25tADuekrpsWyft68khq9rjlfC/Hu4iwIIFSGMpCK7+rQh5KPaXJTWFIZfHAafn3ZBovecC75iDtwFfEsHu6yKSzZIHg6rk4ypDPtU6hOcjv0eltb3NSSyK8gNb2P87mhDauieG/J/IbCfiX8/gJJMtQw20Q6y18lReqBij8SkDVX+YY49XIixHQupijawa4kok/2aEwEMG/yiI4W4fO0O/+TSSQC9UlsjAeGMLgj4ziL63Lv4kqDU5UbXUcpop9Y9NPpC5HhcjBzeV3K+NSw+ryPFQ9ip6aw/+yNeeSr824w05ZMDMxv/DtBaIrUWydoyTZseTPMHGccTimsHt424iA2vv0+/mbMD8Nzd5tjAwoAkGxuCqNObRYqz5dv3EeQ3uky5BPxCUGH+Mxg7O2L1PSj7V70D1UgbE20O0GbE8LKEoIV3K8TI+BQjyrUrjU2bGd1DTYPFen9P+EFbRiImZA0m5FramloXwAVsNMjrM1yJtdGLeTJhMUYA1bSY4xqESrtNU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(366004)(346002)(39860400002)(376002)(396003)(2616005)(478600001)(5660300002)(6506007)(83380400001)(8936002)(186003)(316002)(36756003)(6512007)(26005)(2906002)(66946007)(41300700001)(8676002)(66556008)(66476007)(4326008)(31686004)(86362001)(31696002)(38100700002)(6486002)(110136005)(43740500002)(45980500001)(309714004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dGd6L0l5d0xQTkhGc0RHLzFyUVVCKzRBbU0xUFJLbXlhWXlUR3RQL0JlRlh5?=
 =?utf-8?B?N1lKOGFwTUM3UmNZeGJlR1VRMGp6TzhUUGl5TFdNRC8rSGRYYk5VV1Y0TEk0?=
 =?utf-8?B?Rk8vaUFWTW50Y2VjUGV1L0pualdpZFY1UHdQai81ZHQ5cFRjNjVEZU03Nysr?=
 =?utf-8?B?SFpIaVNFTDBHTVpnblQ0RWw5WENXRUVrWFpxUStMRU81Vjh3UGVaenkwNE84?=
 =?utf-8?B?cTN6SnZIU01XZGVwemlEUGV3cU4vUlJqOU90ZkNrbVBWa2ptQUh1OWdYc2xk?=
 =?utf-8?B?dkl6enU3RFMwYTdpUS9lMnpVZGRjM1BHZlNYb3VBNFNXOGQxcm4vR0UyaUYz?=
 =?utf-8?B?cnJpRjZ5WWtvM3pLZVh0Wmc2SWVzd2pvWlVqbjBGdXlDazBmaFlhd1puTnB6?=
 =?utf-8?B?dDlkYWM1azBLNVdwWjBCbnk3SElJaExFQ1EzNnhwMlNhYmVhbGdKZE5RT2Nu?=
 =?utf-8?B?dnJBM3E3dVJZMDdHdWJnb1I5Zy9tUnFQR2tqSENGK3VCU09PcGVxWkhGTlNX?=
 =?utf-8?B?UGxoTFU2a0gxbkQ5aHFPNUhnMFVudzZjZ242dENNOWtsMVE5eDk0Zk5Xa0xu?=
 =?utf-8?B?KzB6S0ZMNHdjZzBHSERISm93UlBLUElLdEFHdWl2b1dFaW9keUcvbTBQNTMx?=
 =?utf-8?B?eDdDcjhGOHF5V3MwbE1SQ3RQeGM2YWxmRyt4c0dqcm9sQ0JjakxWdmdmSWFS?=
 =?utf-8?B?bktpdEpBR0hrdFNabVpGTnUyUVo1d0lyUHMxNnFBVTdwUVZSSkNKVmpYSlhY?=
 =?utf-8?B?UHBKd1dZSFRQSyswV2pyUGtrM01mVnordHdwUmZYUldyN0lhbFV2WkVoRTBN?=
 =?utf-8?B?clZKUlpzZmxkM01ncXB4ME5BTC94UVViNVZmUnhGeFdSbmFxVEZ1VGRIamRQ?=
 =?utf-8?B?QTZ3V0ZVdmxuU0hvVGEraWkvVS9mWXJYVDJmY1NDcTZpZUQyR210a1poeGNP?=
 =?utf-8?B?Z3RLK2wweWQwaXpXSDNvUXQwNnNEazVIU2ZOdDE0aVdrbnBYc2hML2FwbVJt?=
 =?utf-8?B?M0hBb1NpOWc1NnVGN3ZkUGdjbkFHeE5ENGtJSnRsNXdtOEVoQW9TOVBIck02?=
 =?utf-8?B?eTVWUmN6WEdYUDFZT1BaV1hVYUVhbHZnT1QzSno0RFIrOE9sVlNobHRCaUE4?=
 =?utf-8?B?M3F5U3RpcERHY1gxSVV1YlYrVXFRQVBnNzFocUEwWENVb1R5MzlBczBlR3N0?=
 =?utf-8?B?MEhpK29kcFI2dzJkQmkvZDJLWmVURlFFVmEwUWF6WEgzZ0lIWG1tYm1DamNK?=
 =?utf-8?B?M2VwSkpCeDNBeCtlMHBqSzhhK3p3RnluS002M1pSemwrUlJCSlhJaXlqN3M1?=
 =?utf-8?B?VlJ5VitKRXg3STk4VFFVN0pDNCtnT0RLcTA2VmNMcnJGbzhKMEc4TDdGbkpT?=
 =?utf-8?B?U0xlUkF0WHpvSEI4RWtKM2QwSVo4NnZVOExIZ0Y5NnpIQ3BxdW5QckJ6NE54?=
 =?utf-8?B?ZTdaeGNFUWJxVnVDV1FkNGdINHkxQkdWejM2YnMya2R0WkJCL2R1aTQ4QXFy?=
 =?utf-8?B?UUU0RGdLUUd4Q3h0c2JSU0RtdjF0SERJcjRmMDNEUSs5R1dnaEJVVU1OZk82?=
 =?utf-8?B?TjF4bUIyUFZtUVhpelkwVU01YXpieDJubU9ZNTNnUFVxWUNYQkI3Qm0vMEpw?=
 =?utf-8?B?MWxDSmVtaE9GQjV4dytFTTVrZG1FMTNQamRJMTRzemRBK0p2azVNam9tVTN1?=
 =?utf-8?B?NEsxcXpFR2VGeTM1eUdJb2lsYjVHMmtJQ3dMejFHK0VHY1FaekkxNFAxcFM1?=
 =?utf-8?B?d2lWcmlmK0dnT09GWGZ1eExodkdWRkpWV0M1OVBiOWJ0dkdwZ09IdW5abzh5?=
 =?utf-8?B?MmF5SWxRY2FkWVZGeGlXTWRvUW9veXFSb0dkUHI1cmo5anQ0UGtCWGZjU3JT?=
 =?utf-8?B?b3lVUDdka1psbVlJVHNiWEswN3J2Q2UzSlJFa01zRlk0aXFFN1ZUV012NGln?=
 =?utf-8?B?c0hPbFMyQ1hVRitNYUJLa1BPNXlVd0pRMU95UVhlMnZoQXRCd3Y4NFNNem8z?=
 =?utf-8?B?elNDYWJaVlMya05Nbkl3SEx0TTVHWmJPWm1JWEVVMnFsQ29YVjR1LzA3L1Rm?=
 =?utf-8?B?QVFILzNYYjkxMCtoWkpTQUNOeGI5TzlmRmEvQkhEOHhxMm84TytENXBUWUdU?=
 =?utf-8?Q?UphcIFa70bpuwi5qGXFEi2+ki?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55c10baf-8250-454f-a875-08da70a6cde7
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2022 14:38:14.8833
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CZJKV7GZ9NgofA7wVkyAPUouK+6EjqMSpFlgDPONr1cd+NNXFpRvjHhcQh6OaOce0B3/O8U5OQx/+k35xSJQ6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5417
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org


>>> 1. If I understand things right, then on ThinkPads /sys/firmware/apci/platform_profile
>>>      will be registered by thinkpad_acpi. But in version 1 of this patchset nothing is
>>>      stopping the amd-pmf code from registering /sys/firmware/apci/platform_profile if
>>>      the amd-pmf module gets loaded first. So if the intend is for it to always be owned
>>>      by thinkpad_acpi then the amd-pmf code must check for this and not even try to
>>>      register its platform_profile support. We cannot rely on module ordering ensuring
>>>      that thinkpad_acpi registers first and then amd-pmf will get an -EBUSY error,
>>>      since there are no module load ordering guarantees.
>>
>> This was my thought initially too while this was being developed, but actually there is some nuance here that is non-obvious.  The platform profile registering code in amd-pmf will examine bits set in the BIOS to decide whether or not to export platform profile support.  In Lenovo platforms that support thinkpad_acpi these bits are not set.  So platform profile support ONLY comes from thinkpad-acpi in those platforms.
> 
> Right, Shyam mentioned this in another part of the thread. As I
> mentioned there IHMO it would still be good to check this in the driver
> though. To catch cases where a BIOS for some reasons advertises an
> unexpected combination of features.
> 
>>> 2. So when the thinkpad_acpi platform_profile is set to balanced, then it will
>>>      enable AMT and then the periodically run workqueue function from amd-pmf
>>>      will do its AMT thing. But what when the thinkpad_acpi platform_profile is
>>>      set to low-power or performance. Should the amd-pmf code then apply the static
>>>      slider settings for low-power/performance which it has read from the ACPI
>>>      tables?  Or will the ACPI/EC code on thinkpads take care of this themselves ?
>>>
>>
>> When thinkpad_acpi changes platform profile then a BIOS event goes through and amd-pmf receives that and will run based on the event.
> 
> Hmm, I don't remember seeing anything for this in the patches. Actually this
> reminds me that the code should probably reschedule (using mod_delayed_work)
> the work to run immediately after a BIOS event, rather then waiting for
> the next normally scheduled run.
> 
> But even then I don't remember seeing any code related to catching
> platform-profile changes done outside amd-pmf... ?

It's not a platform profile change - it's an ACPI event.

When a user changes a platform profile then thinkpad_acpi will see 
whether it's balanced or not.  When changing to/from balanced 
thinkpad_acpi sends an AMT event.  amd-pmf reacts to said AMT event.

This is the code you're looking for (in this specific patch):

+static void apmf_event_handler(acpi_handle handle, u32 event, void *data)
+{
+	struct amd_pmf_dev *pmf_dev = data;
+	struct apmf_if *apmf_if = pmf_dev->apmf_if;
+	int ret;
+
+	if (apmf_if->func.sbios_requests) {
+		struct apmf_sbios_req req;
+
+		ret = apmf_get_sbios_requests(apmf_if, &req);
+		if (ret) {
+			dev_err(pmf_dev->dev, "Failed to get SBIOS requests:%d\n", ret);
+			return;
+		}
+		if (req.pending_req & BIT(APMF_AMT_NOTIFICATION)) {
+			pr_debug("PMF: AMT is supported and notifications %s\n",
+				 req.amt_event ? "Enabled" : "Disabled");
+			if (req.amt_event)
+				pmf_dev->is_amt_event = true;
+			else
+				pmf_dev->is_amt_event = !!req.amt_event;
+		}
+
+		if (req.pending_req & BIT(APMF_CQL_NOTIFICATION)) {
+			pr_debug("PMF: CQL is supported and notifications %s\n",
+				 req.cql_event ? "Enabled" : "Disabled");
+			if (req.cql_event)
+				pmf_dev->is_cql_event = true;
+			else
+				pmf_dev->is_cql_event = !!req.cql_event;
+
+			/* update the target mode information */
+			amd_pmf_update_2_cql(pmf_dev);
+		}
+	}
+}
+

> 
> There is this bit:
> 
>   	if (current_profile == PLATFORM_PROFILE_BALANCED) {
> -		/* Apply the Auto Mode transition */
> -		amd_pmf_trans_automode(dev, socket_power, time_elapsed_ms);
> +		if (dev->is_amt_event) {
> +			/* Apply the Auto Mode transition */
> +			amd_pmf_trans_automode(dev, socket_power, time_elapsed_ms);
> +		} else if (!dev->is_amt_event && dev->amt_running) {
> +			pr_debug("resetting AMT thermals\n");
> +			mode = amd_pmf_get_pprof_modes(dev);
> +			amd_pmf_update_slider(dev, SLIDER_OP_SET, mode, NULL);
> +			dev->amt_running = false;
> +		}
> +	} else {
> +		dev->amt_running = false;
>   	}
> 
> But the new code here only applies the static slider settings on
> is_amt_event edges (going from 1->0) and if the static slider support
> bits are supposed to not be set then amd_pmf_load_defaults_sps() will
> not have run because
> is_apmf_func_supported(APMF_FUNC_STATIC_SLIDER_GRANULAR) will return
> false.
> 
> So the values being set by amd_pmf_update_slider() will not have been
> initialized and it will be setting everything to 0.

> 
> Also amd_pmf_get_pprof_modes() will always return POWER_MODE_POWER_SAVER
> since pmf->current_profile is left at its 0 value (from kzalloc) in
> this case.
> 
> So it seems that the code path where AMT is being disabled here is
> buggy and it still is not clear to me where the limits get set
> when thinkpad_acpi's platform_profile gets set to low-power
> or performance.
> 

I think you're right an extra check should end up in 
amd_pmf_update_slider that only runs code when the static slider returns 
true.
