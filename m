Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ED35C001DB
	for <platform-driver-x86@archiver.kernel.org>; Sun, 13 Aug 2023 12:56:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230381AbjHMM4Z (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 13 Aug 2023 08:56:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230292AbjHMM4Z (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 13 Aug 2023 08:56:25 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0A3DE6F
        for <platform-driver-x86@vger.kernel.org>; Sun, 13 Aug 2023 05:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1691931339;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=HpP/UmSbd/3zjTPm/BSKDWOF8g8BW3I43bbgTg39mWs=;
        b=FSKae9deYqUDcW4AsmHS0WFkej2C0GdpbrVm7P+8b1C6FzHC0N+VhxZTu54ivIjjI4PwM/
        lemGjuB0gnb3RwCXsrJQeme39+oviBbT2hiPx1+w2ff5HHs5ZVWlPEBCsoPoUp04JQfwUs
        rOxSbzUFlA3v7mrqRTFDlnyOeHjTOoc=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-32-0QevgTwLNQK8Ptek5Mo-Ug-1; Sun, 13 Aug 2023 08:55:37 -0400
X-MC-Unique: 0QevgTwLNQK8Ptek5Mo-Ug-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-99bcf6ae8e1so218746866b.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 13 Aug 2023 05:55:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691931336; x=1692536136;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HpP/UmSbd/3zjTPm/BSKDWOF8g8BW3I43bbgTg39mWs=;
        b=Ox8rOfSPSsJRt+iB+Xwz6emLoUoTdlabbK4966cwKf6nSP/v2agrVt/1h3isJ1OlR5
         V7ruKEkuqyEbyIHqran0XK+b7zBLDrqkau/bm7oa5stjYPcTTbwsSJGe/uUJdaYECg2R
         Jqj5z/oH0Is+9IoKAvcRbvzdRNZoMYko7HzcbMnIwX7hazH6yL+hhQvZQ6z11UrBhE32
         xDTjX0m0o7VGcysAZ3gRS2T0/FGgVUx3Nca8F71LQizc8SE8/KPu8lMvYRWu2ZtunATj
         jvISTuH6+/zLJwtVutUqizNB+IYqMiUFftR14pNI2LrXnY/hbLdSryb1lZnODeO0109y
         l7zQ==
X-Gm-Message-State: AOJu0YyFN/sYLalgIqC0DXUaX0HzfxHa/ueGgDIQyIPoIAsobukHH2yd
        xg0Tms0PcxJApGqfq+3IU4VKdpTj9Kba0wwSsxvH2Uo/UvSKzOSnrfSbNlAbbrowJAieja/v1/n
        h1NoyqBQSPg3PuLW9uphrst0H6hly7tu/jJcST3WGSA==
X-Received: by 2002:a17:907:7808:b0:99c:5708:496f with SMTP id la8-20020a170907780800b0099c5708496fmr5118835ejc.47.1691931336086;
        Sun, 13 Aug 2023 05:55:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIUElMEBgLGDCNoSKEWoy78stJZTL1FIpMSpD1/CLtmm0cQm1qmnui9WG0RhJbclb3JpmKKQ==
X-Received: by 2002:a17:907:7808:b0:99c:5708:496f with SMTP id la8-20020a170907780800b0099c5708496fmr5118816ejc.47.1691931335312;
        Sun, 13 Aug 2023 05:55:35 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id l18-20020a1709065a9200b00991e2b5a27dsm4586275ejq.37.2023.08.13.05.55.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Aug 2023 05:55:34 -0700 (PDT)
Message-ID: <1c2fac32-ba63-9e55-f809-d86a1afed3f9@redhat.com>
Date:   Sun, 13 Aug 2023 14:55:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] platform/x86: lenovo-ymc: Only bind on machines with a
 convertible DMI chassis-type
Content-Language: en-US, nl
To:     =?UTF-8?B?R2VyZ8WRIEvDtnRlbGVz?= <soyer@irl.hu>,
        =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org,
        Andrew Kallmeyer <kallmeyeras@gmail.com>,
        =?UTF-8?Q?Andr=c3=a9_Apitzsch?= <git@apitzsch.eu>,
        stable@vger.kernel.org
References: <20230812144818.383230-1-hdegoede@redhat.com>
 <3d4143b70eaeb45e6feabde0c9d90c1a07312163.camel@irl.hu>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <3d4143b70eaeb45e6feabde0c9d90c1a07312163.camel@irl.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/12/23 22:48, Gergő Köteles wrote:
> Hi,
> 
> On Sat, 2023-08-12 at 16:48 +0200, Hans de Goede wrote:
>> The lenovo-ymc driver is causing the keyboard + touchpad to stop working
>> on some regular laptop models such as the Lenovo ThinkBook 13s G2 ITL 20V9.
>>
>> The problem is that there are YMC WMI GUID methods in the ACPI tables
>> of these laptops, despite them not being Yogas and lenovo-ymc loading
>> causes libinput to see a SW_TABLET_MODE switch with state 1.
>>
>> This in turn causes libinput to ignore events from the builtin keyboard
>> and touchpad, since it filters those out for a Yoga in tablet mode.
>>
>> Similar issues with false-positive SW_TABLET_MODE=1 reporting have
>> been seen with the intel-hid driver.
>>
>> Copy the intel-hid driver approach to fix this and only bind to the WMI
>> device on machines where the DMI chassis-type indicates the machine
>> is a convertible.
>>
>> Add a 'force' module parameter to allow overriding the chassis-type check
>> so that users can easily test if the YMC interface works on models which
>> report an unexpected chassis-type.
>>
>> Fixes: e82882cdd241 ("platform/x86: Add driver for Yoga Tablet Mode switch")
>> Link: https://bugzilla.redhat.com/show_bug.cgi?id=2229373
>> Cc: Gergo Koteles <soyer@irl.hu>
>> Cc: Andrew Kallmeyer <kallmeyeras@gmail.com>
>> Cc: André Apitzsch <git@apitzsch.eu>
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> 
> Thanks for fixing this!
> It works on Yoga 7 14ARB7.
> 
> Tested-by: Gergő Köteles <soyer@irl.hu>

On 8/12/23 19:25, Andrew Kallmeyer wrote:

> Too bad that this caused problems for some people. Thank you for
> getting it fixed Hans!
> 
> Tested-by: Andrew Kallmeyer <kallmeyeras@gmail.com>

Thank you both for testing this.

I've added this to the pdx86/fixes branch now, with both
your Tested-by-s added.

Regards,

Hans




>> ---
>> Note: The chassis-type can be checked by doing:
>> cat /sys/class/dmi/id/chassis_type
>> if this reports 31 or 32 then this patch should not have any impact
>> on your machine.
>> ---
>>  drivers/platform/x86/lenovo-ymc.c | 25 +++++++++++++++++++++++++
>>  1 file changed, 25 insertions(+)
>>
>> diff --git a/drivers/platform/x86/lenovo-ymc.c b/drivers/platform/x86/lenovo-ymc.c
>> index 41676188b373..f360370d5002 100644
>> --- a/drivers/platform/x86/lenovo-ymc.c
>> +++ b/drivers/platform/x86/lenovo-ymc.c
>> @@ -24,6 +24,10 @@ static bool ec_trigger __read_mostly;
>>  module_param(ec_trigger, bool, 0444);
>>  MODULE_PARM_DESC(ec_trigger, "Enable EC triggering work-around to force emitting tablet mode events");
>>  
>> +static bool force;
>> +module_param(force, bool, 0444);
>> +MODULE_PARM_DESC(force, "Force loading on boards without a convertible DMI chassis-type");
>> +
>>  static const struct dmi_system_id ec_trigger_quirk_dmi_table[] = {
>>  	{
>>  		/* Lenovo Yoga 7 14ARB7 */
>> @@ -35,6 +39,20 @@ static const struct dmi_system_id ec_trigger_quirk_dmi_table[] = {
>>  	{ }
>>  };
>>  
>> +static const struct dmi_system_id allowed_chasis_types_dmi_table[] = {
>> +	{
>> +		.matches = {
>> +			DMI_EXACT_MATCH(DMI_CHASSIS_TYPE, "31" /* Convertible */),
>> +		},
>> +	},
>> +	{
>> +		.matches = {
>> +			DMI_EXACT_MATCH(DMI_CHASSIS_TYPE, "32" /* Detachable */),
>> +		},
>> +	},
>> +	{ }
>> +};
>> +
>>  struct lenovo_ymc_private {
>>  	struct input_dev *input_dev;
>>  	struct acpi_device *ec_acpi_dev;
>> @@ -111,6 +129,13 @@ static int lenovo_ymc_probe(struct wmi_device *wdev, const void *ctx)
>>  	struct input_dev *input_dev;
>>  	int err;
>>  
>> +	if (!dmi_check_system(allowed_chasis_types_dmi_table)) {
>> +		if (force)
>> +			dev_info(&wdev->dev, "Force loading Lenovo YMC support\n");
>> +		else
>> +			return -ENODEV;
>> +	}
>> +
>>  	ec_trigger |= dmi_check_system(ec_trigger_quirk_dmi_table);
>>  
>>  	priv = devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
> 

