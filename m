Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95F13ECAAD3
	for <platform-driver-x86@archiver.kernel.org>; Fri,  9 Sep 2022 14:51:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231760AbiIIOvN (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 9 Sep 2022 10:51:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231628AbiIIOvM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 9 Sep 2022 10:51:12 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CA6D128958
        for <platform-driver-x86@vger.kernel.org>; Fri,  9 Sep 2022 07:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1662735070;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RDmzyTj6yyAaNS22AzOXgwt8mMLW4ZmpJdqP2JEuFYk=;
        b=Skzk6Kmce8K2/mOsJik/0PDLHis61mfLBZHyCXvS72UuxzNPpnacqTshwIkOmq+rbteuF9
        1ZFyTDkmsUcyeupwmbOiavaJMhtQFcyJrbdk3kVHQle48fhvrGegs8p1S7HOiDFIlV2zR2
        TT+qUkJYhbP5V/KxVurdJSZuabo4ey8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-457-XPvEYc3kOPiEHbj5O-sEqA-1; Fri, 09 Sep 2022 10:51:09 -0400
X-MC-Unique: XPvEYc3kOPiEHbj5O-sEqA-1
Received: by mail-ed1-f69.google.com with SMTP id b16-20020a056402279000b0044f1102e6e2so1468116ede.20
        for <platform-driver-x86@vger.kernel.org>; Fri, 09 Sep 2022 07:51:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=RDmzyTj6yyAaNS22AzOXgwt8mMLW4ZmpJdqP2JEuFYk=;
        b=3UyvVdPwKd1/GfH9Pkcq+O+yrFFGbc1cUGx/2eQMj9z7Ue+maIJpSst3Gu+PuOgDyh
         WqV5h7MGEWMWgiYR4HC0mplK13mLTjIbP8ED2I02cRDI92dNvynwshzHXkwbfGiYmAzD
         xafckbvrV4QOkj1OU4pBYQdTUzajdoZ39w16SLvnlaubn6FQR0di1c4Kg3h6yk9I/wgz
         25Bma0D2lcuzo0944Mr8mNqzpE3snoEr68rqH2IbJrM+9GtUyuxCJZHl67xeW9KJDz/9
         oP29dFp1C3+XUN/yF/eu2RAWRvuVcmzzyOb4tbsdnjHUWkjUak8hPObdEDWplRWWjX4H
         +IoQ==
X-Gm-Message-State: ACgBeo188rTYiaygY73agZ8u8SpWsxrJ6zph2/PTQWssxMGeCr8lrKqC
        qyCiTKk8ReHoPnkiFgFJt/PwluMIsyChnsmtBMfmbzgP1CaTl5XlevSPVoCiZVUGo7q8wp5HHoc
        caL8FB0SQ5u+sBTJx/rQbkh6SU/m4uQT/+Q==
X-Received: by 2002:a17:906:ef8b:b0:730:d348:61b9 with SMTP id ze11-20020a170906ef8b00b00730d34861b9mr9979830ejb.350.1662735067799;
        Fri, 09 Sep 2022 07:51:07 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5T5paU7+1Phk7eHCPPms1n7FrrH0d4/P27QhR0UAHXmj4VIXo8C3ckR+QH5DOsZEZ6SIhR1g==
X-Received: by 2002:a17:906:ef8b:b0:730:d348:61b9 with SMTP id ze11-20020a170906ef8b00b00730d34861b9mr9979815ejb.350.1662735067569;
        Fri, 09 Sep 2022 07:51:07 -0700 (PDT)
Received: from ?IPV6:2001:1c00:2a07:3a01:67e5:daf9:cec0:df6? (2001-1c00-2a07-3a01-67e5-daf9-cec0-0df6.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:67e5:daf9:cec0:df6])
        by smtp.gmail.com with ESMTPSA id 23-20020a170906311700b0077958ddaec6sm349202ejx.186.2022.09.09.07.51.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 07:51:06 -0700 (PDT)
Message-ID: <7bfed3df-3645-4a73-7658-34dc5a8bd47b@redhat.com>
Date:   Fri, 9 Sep 2022 16:51:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/2] drivers/platform: toshiba_acpi: Call
 HCI_PANEL_POWER_ON on resume on some models
Content-Language: en-US
To:     Arvid Norlander <lkml@vorpal.se>,
        "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Len Brown <lenb@kernel.org>,
        Mark Gross <mgross@linux.intel.com>
Cc:     linux-acpi@vger.kernel.org, Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86@vger.kernel.org
References: <20220905090005.333429-1-hdegoede@redhat.com>
 <20220905090005.333429-2-hdegoede@redhat.com>
 <ce4ba704-c02f-a417-e3a5-98f31bfd9a2d@vorpal.se>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ce4ba704-c02f-a417-e3a5-98f31bfd9a2d@vorpal.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/5/22 11:37, Arvid Norlander wrote:
> Hi,
> 
> On 2022-09-05 11:00, Hans de Goede wrote:
>> Some Toshibas have a broken acpi-video interface for brightness control, so
>> far these have been using a special workaround in drivers/acpi/acpi_video.c
>> which gets activated by the disable_backlight_sysfs_if module-param/quirks.
>>
>> The recent x86/acpi backlight refactoring has broken this workaround:
>> 1. This workaround relies on acpi_video_get_backlight_type() returning
>>    acpi_video so that the acpi_video code actually runs; and
>> 2. this relies on the actual native GPU driver to offer the sysfs
>>    backlight interface to userspace.
>>
>> After the refactor this breaks since the native driver will no
>> longer register its backlight-device if acpi_video_get_backlight_type()
>> does not return native and making it return native breaks 1.
>>
>> Keeping the acpi_video backlight handling on resume active, while not
>> using it to set the brightness, is necessary because it does a _BCM
>> call on resume which is necessary to turn the panel back on on resume.
>>
>> Looking at the DSDT shows that this _BCM call results in a Toshiba
>> HCI_SET HCI_LCD_BRIGHTNESS call, which turns the panel back on.
>>
>> This commit makes toshiba_acpi do a HCI_SET HCI_PANEL_POWER_ON call
>> on resume on the affected models, so that the (now broken)
>> acpi_video disable_backlight_sysfs_if workaround will no longer
>> be necessary.
>>
>> Note this uses HCI_PANEL_POWER_ON instead of HCI_LCD_BRIGHTNESS
>> to avoid changing the configured brightness level.
> 
> With the previous ACPI Video based approach this quirk was possible to
> control from the kernel command line. This does not seem to be the case
> here. This raises the difficulty for users with as of yet unlisted models
> to test if this quirk would help. Would it be worth adding support for the
> enabling this from the kernel command line?

Yes that is a good idea, I will send out a v2 where this becomes a
module parameter for the toshiba_acpi module.

> 
>>
>> Fixes: b1d36e73cc1c ("drm/i915: Don't register backlight when another backlight should be used (v2)")
>> Tested-by: Arvid Norlander <lkml@vorpal.se>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  drivers/platform/x86/toshiba_acpi.c | 46 +++++++++++++++++++++++++++++
>>  1 file changed, 46 insertions(+)
>>
>> diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
>> index 030dc37d50b8..826ffac4af1c 100644
>> --- a/drivers/platform/x86/toshiba_acpi.c
>> +++ b/drivers/platform/x86/toshiba_acpi.c
>> @@ -23,6 +23,7 @@
>>  #define PROC_INTERFACE_VERSION	1
>>  
>>  #include <linux/compiler.h>
>> +#include <linux/dmi.h>
>>  #include <linux/kernel.h>
>>  #include <linux/module.h>
>>  #include <linux/moduleparam.h>
>> @@ -100,6 +101,7 @@ MODULE_LICENSE("GPL");
>>  #define TOS_NOT_INSTALLED		0x8e00
>>  
>>  /* Registers */
>> +#define HCI_PANEL_POWER_ON		0x0002
>>  #define HCI_FAN				0x0004
>>  #define HCI_TR_BACKLIGHT		0x0005
>>  #define HCI_SYSTEM_EVENT		0x0016
>> @@ -206,6 +208,7 @@ struct toshiba_acpi_dev {
>>  
>>  	bool kbd_event_generated;
>>  	bool killswitch;
>> +	bool turn_on_panel_on_resume;
> 
> You added this bool to the section that changes at runtime, rather than
> the feature section just above.
> 
> Also, many of the bools are bitfields, especially (almost) all the ones
> that are about detecting a feature once then setting it. (I belive
> "special_functions" is an exception since it can take more values, and
> when I add support for the non-working buttons on the 830 this will be
> significant).
> 
> In summary I thus believe it would make sense to add your new boolean to
> bitfield section above this one.

Making this a module-parameter will make it a global variable,
completely moving it out of the struct. See the v2 which I will
send out shortly.

Regards,

Hans



> 
>>  };
>>  
>>  static struct toshiba_acpi_dev *toshiba_acpi;
>> @@ -2999,6 +3002,43 @@ static const char *find_hci_method(acpi_handle handle)
>>  	return NULL;
>>  }
>>  
>> +/*
>> + * Some Toshibas have a broken acpi-video interface for brightness control,
>> + * these are quirked in drivers/acpi/video_detect.c to use the GPU native
>> + * (/sys/class/backlight/intel_backlight) instead.
>> + * But these need a HCI_SET call to actually turn the panel back on at resume,
>> + * without this call the screen stays black at resume.
>> + * Either HCI_LCD_BRIGHTNESS (used by acpi_video's _BCM) or HCI_PANEL_POWER_ON
>> + * works. toshiba_acpi_resume() uses HCI_PANEL_POWER_ON to avoid changing
>> + * the configured brightness level.
>> + */
>> +static const struct dmi_system_id turn_on_panel_on_resume_dmi_ids[] = {
>> +	{
>> +	 /* Toshiba Portégé R700 */
>> +	 /* https://bugzilla.kernel.org/show_bug.cgi?id=21012 */
>> +	 .matches = {
>> +		DMI_MATCH(DMI_SYS_VENDOR, "TOSHIBA"),
>> +		DMI_MATCH(DMI_PRODUCT_NAME, "PORTEGE R700"),
>> +		},
>> +	},
>> +	{
>> +	 /* Toshiba Satellite/Portégé R830 */
>> +	 /* Portégé: https://bugs.freedesktop.org/show_bug.cgi?id=82634 */
>> +	 /* Satellite: https://bugzilla.kernel.org/show_bug.cgi?id=21012 */
>> +	 .matches = {
>> +		DMI_MATCH(DMI_SYS_VENDOR, "TOSHIBA"),
>> +		DMI_MATCH(DMI_PRODUCT_NAME, "R830"),
>> +		},
>> +	},
>> +	{
>> +	 /* Toshiba Satellite/Portégé Z830 */
>> +	 .matches = {
>> +		DMI_MATCH(DMI_SYS_VENDOR, "TOSHIBA"),
>> +		DMI_MATCH(DMI_PRODUCT_NAME, "Z830"),
>> +		},
>> +	},
>> +};
>> +
>>  static int toshiba_acpi_add(struct acpi_device *acpi_dev)
>>  {
>>  	struct toshiba_acpi_dev *dev;
>> @@ -3141,6 +3181,9 @@ static int toshiba_acpi_add(struct acpi_device *acpi_dev)
>>  	ret = get_fan_status(dev, &dummy);
>>  	dev->fan_supported = !ret;
>>  
>> +	dev->turn_on_panel_on_resume =
>> +		dmi_check_system(turn_on_panel_on_resume_dmi_ids);
>> +
>>  	toshiba_wwan_available(dev);
>>  	if (dev->wwan_supported)
>>  		toshiba_acpi_setup_wwan_rfkill(dev);
>> @@ -3257,6 +3300,9 @@ static int toshiba_acpi_resume(struct device *device)
>>  			rfkill_set_hw_state(dev->wwan_rfk, !dev->killswitch);
>>  	}
>>  
>> +	if (dev->turn_on_panel_on_resume)
>> +		hci_write(dev, HCI_PANEL_POWER_ON, 1);
>> +
>>  	return 0;
>>  }
>>  #endif
> 
> Best regards,
> Arvid Norlander
> 


