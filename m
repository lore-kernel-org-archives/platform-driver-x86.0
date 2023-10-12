Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71DF1CDB482
	for <platform-driver-x86@archiver.kernel.org>; Thu, 12 Oct 2023 12:35:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235700AbjJLMfG (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 12 Oct 2023 08:35:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235698AbjJLMfF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 12 Oct 2023 08:35:05 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FEA7B8
        for <platform-driver-x86@vger.kernel.org>; Thu, 12 Oct 2023 05:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1697114064;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=afaFqkycSuiRZY4am7Mm5mSmoDrgfmH0E3M0p5PaCqU=;
        b=FsUHtPtcuJqZMgtfXOtyz5jB1udKN1epdiIK8pL8/HXmn+RFfVGgW7K7s95dalKkY2PQHP
        Q/gUi/0QdGRcy1IX1dkf65YAiVCJ3brrpPi1JqaHW6D4us16t60Lg4JucmK5tfABpl7F7J
        fQTyXZC+iKMbuoMNodlYrMZRx7FALH0=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-428-nPIWWtuDObOYRGsVAkhoMg-1; Thu, 12 Oct 2023 08:34:23 -0400
X-MC-Unique: nPIWWtuDObOYRGsVAkhoMg-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-9ae7663e604so62250266b.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 12 Oct 2023 05:34:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697114062; x=1697718862;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=afaFqkycSuiRZY4am7Mm5mSmoDrgfmH0E3M0p5PaCqU=;
        b=kvwUGWF7BeQWcemRBIj/qdxLS/T8ndsrRquljFsxvJ/i7VnCu7E5XF43HxqNBGw9nW
         IVtrvrNNKQVdOo7EMVx1LLg1/6v/0wlza6ivejl/uPIUkKVryitiUgVDNfaavBfurwzb
         8DeU9S74nn7aM9jbkYz9iCM/BQ8wsM4yfT574Uq/DVPzo057a2VgRnWK0CdkNYcR5oNG
         x3Jrp7ROuT0xGuaQLub1oTwPQbmVNV4IjUuC+ucpDzHyLzrJC/Hs9Y73ZHQrWrI1dDsw
         kEpxP9Jlm5mXjC0rfrUOnQeBlRcRYX6+rpcCku21TK+Bbwy0JSus3a5Jjlaz3FMzz6Rd
         anaA==
X-Gm-Message-State: AOJu0YwXeBHBCAU9Gk24Wwp6nsSHOYrunmCvC4iHaHKYhrOHIcGhubW5
        w7kavmgqOkLJx+/+6YMunUR8yCiv0W1oDPLxi9Uvt5tbiNbS/UUe8mIH/OwAp3EGbN9DcLDm2jk
        h3gu18XBGuYQMOvD6yhm/fX+dMwgLBBWBsoS7y8PM4w==
X-Received: by 2002:a17:906:76d3:b0:9ae:65a5:b6f4 with SMTP id q19-20020a17090676d300b009ae65a5b6f4mr22451283ejn.20.1697114061897;
        Thu, 12 Oct 2023 05:34:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFYe99xlqUSi+k9XMy843Pe9nYuvZsKqfb6JeqLYOD0kjQDqZcYOw+a0m/B4Q0ZcYy2zsdKA==
X-Received: by 2002:a17:906:76d3:b0:9ae:65a5:b6f4 with SMTP id q19-20020a17090676d300b009ae65a5b6f4mr22451266ejn.20.1697114061543;
        Thu, 12 Oct 2023 05:34:21 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id gh18-20020a170906e09200b009786c8249d6sm11161678ejb.175.2023.10.12.05.34.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Oct 2023 05:34:21 -0700 (PDT)
Message-ID: <c447f107-df52-92d1-fdd3-96b76860621e@redhat.com>
Date:   Thu, 12 Oct 2023 14:34:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/5] platform/x86: msi-ec: Add fw version and release date
 attributes
Content-Language: en-US, nl
To:     =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Nikita Kravets <teackot@gmail.com>
Cc:     platform-driver-x86@vger.kernel.org,
        Aakash Singh <mail@singhaakash.dev>,
        Jose Angel Pastrana <japp0005@red.ujaen.es>
References: <20231010172037.611063-3-teackot@gmail.com>
 <20231010172037.611063-7-teackot@gmail.com>
 <974c5-8032-28e0-fd2f-9fbc9d413e4b@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <974c5-8032-28e0-fd2f-9fbc9d413e4b@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Nikita,

Great to see that you are working on upstreaming more of the
out-of-tree msi-ec functionality. Thank you for working on this.

On 10/11/23 14:41, Ilpo Järvinen wrote:
> On Tue, 10 Oct 2023, Nikita Kravets wrote:
> 
>> Create a root attribute group and add the first platform device
>> attributes: firmware version and firmware release date. Firmware
>> version attribute uses an already present ec_get_firmware_version()
>> function. Both features are present on all supported laptops.
>>
>> Cc: Aakash Singh <mail@singhaakash.dev>
>> Cc: Jose Angel Pastrana <japp0005@red.ujaen.es>
>> Signed-off-by: Nikita Kravets <teackot@gmail.com>
>> ---
>>  drivers/platform/x86/msi-ec.c | 67 ++++++++++++++++++++++++++++++++++-
>>  1 file changed, 66 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/platform/x86/msi-ec.c b/drivers/platform/x86/msi-ec.c
>> index 12c559c9eac4..772b230fb47e 100644
>> --- a/drivers/platform/x86/msi-ec.c
>> +++ b/drivers/platform/x86/msi-ec.c
>> @@ -818,17 +818,82 @@ static struct acpi_battery_hook battery_hook = {
>>  	.name = MSI_EC_DRIVER_NAME,
>>  };
>>  
>> +/*
>> + * Sysfs platform device attributes
>> + */
>> +
>> +static ssize_t fw_version_show(struct device *device,
>> +			       struct device_attribute *attr, char *buf)
>> +{
>> +	u8 rdata[MSI_EC_FW_VERSION_LENGTH + 1];
>> +	int result;
>> +
>> +	result = ec_get_firmware_version(rdata);
>> +	if (result < 0)
>> +		return result;
>> +
>> +	return sysfs_emit(buf, "%s\n", rdata);
>> +}
>> +
>> +static ssize_t fw_release_date_show(struct device *device,
>> +				    struct device_attribute *attr, char *buf)
>> +{
>> +	u8 rdate[MSI_EC_FW_DATE_LENGTH + 1];
>> +	u8 rtime[MSI_EC_FW_TIME_LENGTH + 1];
>> +	int result;
>> +	int year, month, day, hour, minute, second;
>> +
>> +	memset(rdate, 0, MSI_EC_FW_DATE_LENGTH + 1);
> 
> sizeof(*rdate) is safer so please use it.
> 
>> +	result = ec_read_seq(MSI_EC_FW_DATE_ADDRESS,
>> +			     rdate,
>> +			     MSI_EC_FW_DATE_LENGTH);
>> +	if (result < 0)
>> +		return result;
>> +
>> +	result = sscanf(rdate, "%02d%02d%04d", &month, &day, &year);
> 
> There fields would naturally be %u and unsigned but see the other comment 
> below before doing this change.
> 
>> +	if (result != 3)
>> +		return -EINVAL;
> 
> EINVAL should be returned if the input was invalid but here the data 
> itself is not okay so some other errno would be better.
> 
>> +	memset(rtime, 0, MSI_EC_FW_TIME_LENGTH + 1);
> 
> sizeof() like above.
> 
>> +	result = ec_read_seq(MSI_EC_FW_TIME_ADDRESS,
>> +			     rtime,
>> +			     MSI_EC_FW_TIME_LENGTH);
>> +	if (result < 0)
>> +		return result;
>> +
>> +	result = sscanf(rtime, "%02d:%02d:%02d", &hour, &minute, &second);
>> +	if (result != 3)
>> +		return -EINVAL;
> 
> Ditto.
> 
>> +
>> +	return sysfs_emit(buf, "%04d/%02d/%02d %02d:%02d:%02d\n", year, month, day,
>> +			  hour, minute, second);
> 
> It would be kind of nice to use %pt formatting here instead of custom
> datetime format, however, it would either require converting to time64_t 
> or using struct rtc_time. The latter would naturally have the right fields 
> but they're not unsigned so my comment above about %u is not going to work 
> well with it.
> 
> I'm also a bit unsure whether it's appropriate to use that struct outside 
> of rtc realm. vsprintf.c seems to convert time64_t into rtc_time before 
> printing though.
> 
> Hans, do you have any idea about the struct rtc_time?
> 
>> +}
>> +
>> +static DEVICE_ATTR_RO(fw_version);
>> +static DEVICE_ATTR_RO(fw_release_date);
>> +
>> +static struct attribute *msi_root_attrs[] = {
>> +	&dev_attr_fw_version.attr,
>> +	&dev_attr_fw_release_date.attr,
>> +	NULL
>> +};
>> +
>> +static struct attribute_group msi_root_group = {
>> +	.attrs = msi_root_attrs,
>> +};
>> +
>>  /*
>>   * Sysfs platform driver
>>   */
>>  
>>  static int msi_platform_probe(struct platform_device *pdev)
>>  {
>> -	return 0;
>> +	return sysfs_create_group(&pdev->dev.kobj, &msi_root_group);
>>  }
>>  
>>  static int msi_platform_remove(struct platform_device *pdev)
>>  {
>> +	sysfs_remove_group(&pdev->dev.kobj, &msi_root_group);
>>  	return 0;
>>  }
> 
> Don't handle add/remove but put the attribute group pointer into the 
> platform_driver.driver instead.

Ack to that.

Also since this adds new driver specific sysfs atrributes please
also add a Documentation/ABI/testing/sysfs-platform-msi-ec
file in the same patch documenting the new sysfs attributes.

See e.g. : Documentation/ABI/testing/sysfs-platform-asus-wmi
for what such a documentation file should look like.

And then in further patches in this series for each patch
which adds a new sysfs attribute document the attribute
in that file in the same patch.

Besides it being a good practice to have documentation this
also helps with reviewing because then your description of
how the sysfs attribute should behave can be compared to
the actual code implementing it.

Regards,

Hans




