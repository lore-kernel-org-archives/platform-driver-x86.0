Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3A83C433EF
	for <platform-driver-x86@archiver.kernel.org>; Fri,  3 Jun 2022 17:21:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235498AbiFCRVv (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 3 Jun 2022 13:21:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235281AbiFCRVv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 3 Jun 2022 13:21:51 -0400
Received: from mail1.bemta31.messagelabs.com (mail1.bemta31.messagelabs.com [67.219.246.114])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A931D289
        for <platform-driver-x86@vger.kernel.org>; Fri,  3 Jun 2022 10:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com;
        s=Selector; t=1654276908; i=@lenovo.com;
        bh=CMfo4DPK24pQsKlgSOKX+YDmhRe3UilInWR3WEC+Oi4=;
        h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
         In-Reply-To:Content-Type:Content-Transfer-Encoding;
        b=X5jqXv0R+NomnJwqJWZW6HetOCz5B6jnITlZp65iYMD3UKOQcCCnCFEOw/TTKn7l6
         OFcwB0tkQnbFIrnMGQ028gbTpbat5DPE6QDPEbaAGwC2GuYe3DtD2Pl6+v8+hw8X0h
         XxruLcjpt1ALcRE3UyBhuMfC0gGJsttqBxAAJhLjWjIzExDypKv7przXfYKBsntVML
         Ri3e5d6GblGked+niOPLSGKm7nBpyN9pvBOCGyc5/U/czphggVoDPKk4sPKG8nFN8K
         qfbYpff6nHvOSqllnoV+BOCyNLk6+hAN6XEIMDWlupL5hSpYoxNy2sVr/+OUZ1T5pQ
         Z+e03tLUgg+nw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGJsWRWlGSWpSXmKPExsWSoZ+nqavjPCv
  J4G+jqMWb49OZLA5MncZssXrPC2YHZo9NqzrZPN7vu8rm8XmTXABzFGtmXlJ+RQJrxv3WpUwF
  u8Uq9mw4wNTA+Eqoi5GLg1FgKbPEm+bprBDOIlaJfb8OMEE4bUwSf5rOs4A4QgLzmSRu/10J5
  HACOfuZJJbdkABJSAgcZ5ToPrSOCaKqk1Hix6tTUC39TBLb3pxjhnAeM0pMvvYBquwho8TfJ+
  1sXYwcHLwCthJNTWkgc1kEVCS2t75gB7F5BQQlTs58wgJSIioQLnHzrRdIWFggWWLTi+lsIDa
  zgLjErSfzmUBsEQETiTe/F4KNZxZYyyjxtW0K1K5bjBLbOv6BdbAJaEts2fILzOYUiJVoOL2K
  FWKSpkTr9t/sELa8xPa3c5ghHlWW+NV/HsyWEFCQWHt6PZSdINE85SgjhC0pce3mBXYIW1bi6
  Nk5LBC2r8TRee/ZQR6QENCVmLnFESJsI/H2xhZmiHCORPPW0gmMerOQfDwLyWuzkBw3C8lxCx
  hZVjFaJRVlpmeU5CZm5ugaGhjoGhqa6BrqGpka6SVW6SbqlRbrpiYWl+ga6iWWF+ulFhfrFVf
  mJuek6OWllmxiBCajlCLGPzsYO3t+6h1ilORgUhLlVVk4M0mILyk/pTIjsTgjvqg0J7X4EKMM
  B4eSBG++46wkIcGi1PTUirTMHGBihElLcPAoifCaygOleYsLEnOLM9MhUqcYLTmubNu7l5njw
  YmTQPLa+gX7mIVY8vLzUqXEeQ2cgBoEQBoySvPgxsGS9yVGWSlhXkYGBgYhnoLUotzMElT5V4
  ziHIxKwrx5IFfxZOaVwG19BXQQE9BBJa9ngBxUkoiQkmpgslgTZ7t62gOrnkkfS/pZ32zivDJ
  9ybbu7CDWXeb6Oum+hrqxcx+/58vtccu+7//Cb/6pmw+q1I/kHDkVH/irMnLd1v1nXpdKdfxp
  ZzeYaburJO7TzZsb7aNLTR4uevJe9+sBB7GAjJW8v99FyOjyB4fc/Xry2vXUuLwJ9pyRqpuOH
  liu8n7PhcTn4rMU94U79/Xrar+TkRVlXSDRLK+YISmoYamwb1Y9l8pN7b7/P87cmbjeYsHUSN
  lNLQlVDx33TWpsM62/cvuArnqn+fET8SsiunOv1yyaXG4rxGRmqHzY9oFEUeKJQ3/mx81/due
  jqYPOm8CtywyU9nh/sJtquu7siU+eAdZ/1V+uvLf3ohJLcUaioRZzUXEiALZDhxNZBAAA
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-19.tower-686.messagelabs.com!1654276906!19165!2
X-Originating-IP: [104.47.110.41]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24765 invoked from network); 3 Jun 2022 17:21:48 -0000
Received: from mail-tyzapc01lp2041.outbound.protection.outlook.com (HELO APC01-TYZ-obe.outbound.protection.outlook.com) (104.47.110.41)
  by server-19.tower-686.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Jun 2022 17:21:48 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jhDoATnnxFpnBNK2J4FBZSK+KomWWAxWfpSncWXETDGLdyC6am3HjQpbQUEhGt1aliKardh8l4msNiD0m7l40zuK1rFujyuU9rLqxRTeLo9frksZ1C6p0ESsrNNc1PyaPJdzPBSfprepVpji43nvNHRzFuKIxa3YEzxzW1PPtzUwtfHaVcFpBS/J/Zuk7vZG9JxTFd0W+Z42hCAJ4eWBU6vrIP0Uip6W0X6c2BXh8heBcIwXoM0K3+JW8zwASibXKMtnUbcM2+hpTopKY0CcMg+vtKpIR2jIJ1hS/AohK4sUWfagTzUmb18pl+b9YucHn0ww7ZL+eXctBsVv/rMqDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CMfo4DPK24pQsKlgSOKX+YDmhRe3UilInWR3WEC+Oi4=;
 b=oA6X0jopNz2K01zcoGkqrrPflJbXObmoyBNk1OtJO8FjsqmhZXsuGdagNKsSoosro34nGmDCnEiPtiAIjFl1UmE5Q1eiYHHG6TZAqXSj1FHaSLcITHO26/TeP6GC9VeamAuV1x3apR3UY6Oqw495WlbkXR3t7bB4bsbcVrBzyUlF9meUTfvWLLjQdkSwb0C/uSFYlW5dk8oAH2EN8v566OUnxkto6sslQwLm4zco0iJv2v4XqbzQEH5R9/yvTiMrKL94nV7/D2cJIe7dZ7C8wzHc8WCCERWPAonnagRO8w+iamYp6n3info4xjc+SEBCWRve+R9D1rscY/78+T6S3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 104.232.225.7) smtp.rcpttodomain=amd.com smtp.mailfrom=lenovo.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=lenovo.com;
 dkim=none (message not signed); arc=none
Received: from SG2PR01CA0169.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::25) by SG2PR03MB4312.apcprd03.prod.outlook.com
 (2603:1096:4:80::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Fri, 3 Jun
 2022 17:21:44 +0000
Received: from SG2APC01FT0019.eop-APC01.prod.protection.outlook.com
 (2603:1096:4:28:cafe::1a) by SG2PR01CA0169.outlook.office365.com
 (2603:1096:4:28::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.15 via Frontend
 Transport; Fri, 3 Jun 2022 17:21:44 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 104.232.225.7) smtp.mailfrom=lenovo.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=lenovo.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 lenovo.com discourages use of 104.232.225.7 as permitted sender)
Received: from mail.lenovo.com (104.232.225.7) by
 SG2APC01FT0019.mail.protection.outlook.com (10.13.36.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5314.12 via Frontend Transport; Fri, 3 Jun 2022 17:21:44 +0000
Received: from reswpmail01.lenovo.com (10.62.32.20) by mail.lenovo.com
 (10.62.123.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.27; Fri, 3 Jun
 2022 13:21:31 -0400
Received: from [10.38.99.225] (10.38.99.225) by reswpmail01.lenovo.com
 (10.62.32.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.27; Fri, 3 Jun
 2022 13:21:30 -0400
Message-ID: <4cd77c91-9d0b-9eb3-bbb8-e3a669eef598@lenovo.com>
Date:   Fri, 3 Jun 2022 13:21:29 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [External] RE: [PATCH 3/4] platform/x86: thinkpad-acpi: Add
 support for hotkey 0x131a
Content-Language: en-US
To:     "Limonciello, Mario" <Mario.Limonciello@amd.com>
CC:     "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "markgross@kernel.org" <markgross@kernel.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
References: <markpearson@lenovo.com>
 <20220603170212.164963-1-markpearson@lenovo.com>
 <20220603170212.164963-3-markpearson@lenovo.com>
 <MN0PR12MB6101B587428E030D96AAA127E2A19@MN0PR12MB6101.namprd12.prod.outlook.com>
From:   Mark Pearson <markpearson@lenovo.com>
In-Reply-To: <MN0PR12MB6101B587428E030D96AAA127E2A19@MN0PR12MB6101.namprd12.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.38.99.225]
X-ClientProxiedBy: reswpmail01.lenovo.com (10.62.32.20) To
 reswpmail01.lenovo.com (10.62.32.20)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0adc3900-9dc7-4b0a-bcb2-08da45858862
X-MS-TrafficTypeDiagnostic: SG2PR03MB4312:EE_
X-LD-Processed: 5c7d0b28-bdf8-410c-aa93-4df372b16203,ExtAddr
X-Microsoft-Antispam-PRVS: <SG2PR03MB43127D9476AB56430B128288C5A19@SG2PR03MB4312.apcprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uvrNeMN5/U9NU3hhcPsD1quRHuwHvD32RQP/a0fJSVaDWhoMEvwhuqeLLwWNzEtj+ndbzRkYWv9EXXM6afBUEA/z6Mkmy+5NseJaTYl64m6A49L4NnsdGYWSAsJ5hMQsj7Q4rTLN7rL23enlh7/BcuBq6se2eL74Y9CZI0x0P/X+Cy/ReOFGSPO5MvuP2fSDqNiUTaTZpzF1npddtghRjbzQ7hejeSGFFKQ788zCvAXDPAZZIx0Bpw32DEpmGtEHzy1Aj6JJZ3PSpMg0cGyuqlA6JsjVj3scEJPxs7pM6OBoLw6bhzFFNwBr0gu3uGMh72IYFgw0qwy7pxnLAv3llHj0dETqqygquawDnsW9CzQCDc+9oCGFk71OCEojSNLPXpP7UCR2Ms9vk2a7F68a5U/3PwnF18LfAa1WrLQkb9LznsEVaAnuSLE2Ax36Jr79Pl0H5bGbvJizqKr3emPf0WxgMRFqJP1grfhj8I85Yod4j6QOjAYF30lkZadieIqcRfl7CA7HI0B+skSuQSvGgVtk2o631Ihm2ObW41HrNRHjOfIzxJcQi1jNq/OlBQ9emZrtKY9sm4/scqVU+RVDUdC0BSSDfAPcpp+RL1ij3hhkHXCS5lRgpuNPHx6+cKrkI4AzgBKgbNS70mtxbT30f0sgepYOTnprr68MvqfO2WL++rCkFUvssn3xOFScnXhlOMYWy2q6YCM7f556SHB78c4OrwbqpKud/9bpzXVfjRiu5uL+ifFCBaxnBF5L7e9eByjUtxteRW/9jlqJannHtw==
X-Forefront-Antispam-Report: CIP:104.232.225.7;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.lenovo.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(2906002)(31696002)(81166007)(86362001)(36860700001)(31686004)(70586007)(40460700003)(82960400001)(356005)(4326008)(70206006)(36906005)(16576012)(6916009)(54906003)(82310400005)(316002)(8936002)(5660300002)(426003)(336012)(186003)(16526019)(8676002)(2616005)(47076005)(83380400001)(508600001)(36756003)(53546011)(26005)(3940600001)(43740500002)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: lenovo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2022 17:21:44.2173
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0adc3900-9dc7-4b0a-bcb2-08da45858862
X-MS-Exchange-CrossTenant-Id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5c7d0b28-bdf8-410c-aa93-4df372b16203;Ip=[104.232.225.7];Helo=[mail.lenovo.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2APC01FT0019.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR03MB4312
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Mario

On 6/3/22 13:14, Limonciello, Mario wrote:
> [AMD Official Use Only - General]
> 
> 
> 
>> -----Original Message-----
>> From: Mark Pearson <markpearson@lenovo.com>
>> Sent: Friday, June 3, 2022 12:02
>> To: markpearson@lenovo.com
>> Cc: hdegoede@redhat.com; markgross@kernel.org; platform-driver-
>> x86@vger.kernel.org; Limonciello, Mario <Mario.Limonciello@amd.com>
>> Subject: [PATCH 3/4] platform/x86: thinkpad-acpi: Add support for hotkey
>> 0x131a
>>
>> On some AMD platforms if you press FN+T it will toggle whether automatic
>> mode transitions are active.
>>
>> Recognize this keycode and use it to toggle AMT.
>>
>> Co-developed-by: Mario Limonciello <mario.limonciello@amd.com>
>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>> Signed-off-by: Mark Pearson <markpearson@lenovo.com>
>> ---
>>  drivers/platform/x86/thinkpad_acpi.c | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>
>> diff --git a/drivers/platform/x86/thinkpad_acpi.c
>> b/drivers/platform/x86/thinkpad_acpi.c
>> index 2df290cee0a1..f11866225ef3 100644
>> --- a/drivers/platform/x86/thinkpad_acpi.c
>> +++ b/drivers/platform/x86/thinkpad_acpi.c
>> @@ -159,6 +159,7 @@ enum tpacpi_hkey_event_t {
>>  	TP_HKEY_EV_VOL_DOWN		= 0x1016, /* Volume down or
>> unmute */
>>  	TP_HKEY_EV_VOL_MUTE		= 0x1017, /* Mixer output
>> mute */
>>  	TP_HKEY_EV_PRIVACYGUARD_TOGGLE	= 0x130f, /* Toggle priv.guard
>> on/off */
>> +	TP_HKEY_EV_AMT_TOGGLE		= 0x131a, /* Toggle AMT
>> on/off */
>>
>>  	/* Reasons for waking up from S3/S4 */
>>  	TP_HKEY_EV_WKUP_S3_UNDOCK	= 0x2304, /* undock
>> requested, S3 */
>> @@ -3735,6 +3736,7 @@ static bool hotkey_notify_extended_hotkey(const
>> u32 hkey)
>>
>>  	switch (hkey) {
>>  	case TP_HKEY_EV_PRIVACYGUARD_TOGGLE:
>> +	case TP_HKEY_EV_AMT_TOGGLE:
>>  		tpacpi_driver_event(hkey);
>>  		return true;
>>  	}
>> @@ -11038,6 +11040,15 @@ static void tpacpi_driver_event(const unsigned int
>> hkey_event)
>>  		if (changed)
>>
>> 	drm_privacy_screen_call_notifier_chain(lcdshadow_dev);
>>  	}
>> +	if (hkey_event == TP_HKEY_EV_AMT_TOGGLE) {
>> +		/* If we're enabling AMT we need to force balanced mode */
>> +		if (!dytc_amt_active)
>> +			/* This will also set AMT mode enabled */
>> +			dytc_profile_set(NULL,
>> PLATFORM_PROFILE_BALANCED);
>> +		else
>> +			dytc_control_amt(!dytc_amt_active);
> 
> I missed this while we were making the series, but a fresh set of eyes tells me
> shouldn't dytc_control_amt(..)  run in either case - not just in the "else" case?
> 
> * If AMT is not active and you press the key (to activate it) you 
> should switch to balanced mode "and" turn it on.
> * If AMT is active and you press the key (to deactivate it) you're already in 
> balanced mode, so you should just turn it off.

The dytc_profile_set for balanced mode will also enable AMT (if it's
supported) so I didn't want to call it twice.

Mark


