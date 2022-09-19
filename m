Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05232C54EE9
	for <platform-driver-x86@archiver.kernel.org>; Mon, 19 Sep 2022 09:09:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229574AbiISJJA (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 19 Sep 2022 05:09:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230073AbiISJI6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 19 Sep 2022 05:08:58 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FC149FE6
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Sep 2022 02:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1663578534;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=U70YODZ+k9sTpi3NVnJAMjcI0iZTJbz7O3475/Je5eM=;
        b=O6KgMm2Bo438gkRh0Dx9nQyuvuxfHIjvlISkNVKEFoG6M19a3zLY9HaecpbJKV3bx/D/Hu
        I9YjZHU6jYlx82bbNiEaXeV7+GnyhWrUckmhwMijU7tPUvBlljDkyGDofM0UuMvH4n/BUp
        SVvp0wIzGPhKqVvQhhC1OUzkDtioI7k=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-612-VMscps9LP926920bUtPd6A-1; Mon, 19 Sep 2022 05:08:52 -0400
X-MC-Unique: VMscps9LP926920bUtPd6A-1
Received: by mail-ed1-f72.google.com with SMTP id z13-20020a05640240cd00b0045276a79364so12287530edb.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Sep 2022 02:08:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=U70YODZ+k9sTpi3NVnJAMjcI0iZTJbz7O3475/Je5eM=;
        b=aZwBdbk5iZXdDU9PjA03IVJAgMmAjsKIrTFOnl16sG8uRK1UHmEThZAVk4IaxxVBvy
         Mf0XtQZ4mUVmbN3mFhF6DgPBoN23/NCwssQGxiusdF3adSSrUs3EH1UnzUODlk8L4CWB
         99awRQ21vz/XPoZzTHEH0V07MHMoaoS/UtbTT//Q7Sk4a4al9kjmpcOYXthA3hwQ2cNz
         ihH24KD8AMCJzIZZr/V3js2WTgIvbl6gmtyUxtQkB6ena0sgxya+B1CVHP5YItDYP1FS
         USEP70Mg3+thM/qHCdPlcLNnHf3x0m9XgFzVMdbBVCDWWQ/+k4obiin9LXI+ZQwoxyf+
         ZoJw==
X-Gm-Message-State: ACrzQf1jO/Ys20UYytMzNBFK5DaD8XW95jSWGi9DirFIiSvGI9BwFVXU
        URhxCe3jX+NsejqZCgtCmPOwidT5CylHFoRb28kVFfv4bVN2gIuMLzd4CB+riQMYKrVbD9/QFIn
        M3NzH7Q6jlfLmmMQtH2KlzBMRUvk0qOf+8g==
X-Received: by 2002:a17:907:7215:b0:780:3153:cca2 with SMTP id dr21-20020a170907721500b007803153cca2mr12362321ejc.427.1663578531676;
        Mon, 19 Sep 2022 02:08:51 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5ESVBzHsJ2hpn5wAet7DzqKsDd2AVlBnmPUNVwXp/RhbCYzxHCt/EUUMn/XkEJJaT5xfz58g==
X-Received: by 2002:a17:907:7215:b0:780:3153:cca2 with SMTP id dr21-20020a170907721500b007803153cca2mr12362305ejc.427.1663578531367;
        Mon, 19 Sep 2022 02:08:51 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id x17-20020a1709065ad100b0073d87068042sm15236923ejs.110.2022.09.19.02.08.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Sep 2022 02:08:50 -0700 (PDT)
Message-ID: <f3c5d911-0a66-a055-9383-3d12ec3220f7@redhat.com>
Date:   Mon, 19 Sep 2022 10:08:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] Add IdeaPad quick_charge attribute to sysfs
Content-Language: en-US
To:     =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>,
        Philipp Jungkamp <p.jungkamp@gmx.net>
Cc:     Ike Panhc <ike.pan@canonical.com>,
        Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org
References: <20220911161718.24284-1-p.jungkamp@gmx.net>
 <53wDIoII2bk1Vao8Qd8ld5zPUc4AspLN6vlcaLzZWMIDEw8CDekKbEXien_60KD8F9V51jk5vuf55FFKQafHGKeYGOrIcJXVhoZRQsYKbqE=@protonmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <53wDIoII2bk1Vao8Qd8ld5zPUc4AspLN6vlcaLzZWMIDEw8CDekKbEXien_60KD8F9V51jk5vuf55FFKQafHGKeYGOrIcJXVhoZRQsYKbqE=@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/11/22 19:08, Barnabás Pőcze wrote:
> Hi
> 
> 
> 2022. szeptember 11., vasárnap 18:17 keltezéssel, Philipp Jungkamp írta:
>> More recent IdeaPads allow USB-C quick-charging to be controlled via
>> ACPI. This seems to be mutually exclusive with the ACPI conservation
>> mode.
>>
>> Expose a readable and writable 'quick_charge' sysfs attribute next when
>> support is indicated in ACPI.
>> ---
>> I deduced the indicator bits from their names in the DSDT (QCHO and
>> QCHX). I don't have an IdeaPad except mine on hand and can't check
>> whether these are indeed the intended uses or their behaviour on other
>> IdeaPads. I can confirm that a change in the quick_charge toggle is
>> visible in Lenovo Vantage when dual booting into Windows 11.
>>
>> Greetings,
>> Philipp Jungkamp
> 
> There is already an entry for this on the kernel bugzilla:
> https://bugzilla.kernel.org/show_bug.cgi?id=216176
> 
> I have two concerns: one, it adds a new driver specific attribute for a somewhat
> generic functionality;

Right this really needs a standardized API using the power_supply sysfs class, see:
https://bugzilla.kernel.org/show_bug.cgi?id=216176#c5

Please write an API proposal for this and submit it as discussed in the
linked comment,

Regards,

Hans



> two, Lenovo Vantage does not only check this single bit
> before allowing this mode to be enabled (as far as I can recall).
> 
> 
> Regards,
> Barnabás Pőcze
> 
> 
>>
>>  drivers/platform/x86/ideapad-laptop.c | 64 ++++++++++++++++++++++++++-
>>  1 file changed, 62 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
>> index abd0c81d62c4..dea35779264a 100644
>> --- a/drivers/platform/x86/ideapad-laptop.c
>> +++ b/drivers/platform/x86/ideapad-laptop.c
>> @@ -54,12 +54,16 @@ enum {
>>  };
>>
>>  enum {
>> -	GBMD_CONSERVATION_STATE_BIT = 5,
>> +	GBMD_QUICK_CHARGE_STATE_BIT   = 2,
>> +	GBMD_CONSERVATION_STATE_BIT   = 5,
>> +	GBMD_QUICK_CHARGE_SUPPORT_BIT = 17,
>>  };
>>
>>  enum {
>>  	SBMC_CONSERVATION_ON  = 3,
>>  	SBMC_CONSERVATION_OFF = 5,
>> +	SBMC_QUICK_CHARGE_ON  = 7,
>> +	SBMC_QUICK_CHARGE_OFF = 8,
>>  };
>>
>>  enum {
>> @@ -140,6 +144,7 @@ struct ideapad_private {
>>  		bool kbd_bl               : 1;
>>  		bool touchpad_ctrl_via_ec : 1;
>>  		bool usb_charging         : 1;
>> +		bool quick_charge         : 1;
>>  	} features;
>>  	struct {
>>  		bool initialized;
>> @@ -482,6 +487,12 @@ static ssize_t conservation_mode_store(struct device *dev,
>>  	if (err)
>>  		return err;
>>
>> +	if (priv->features.quick_charge && state) {
>> +		err = exec_sbmc(priv->adev->handle, SBMC_QUICK_CHARGE_OFF);
>> +		if (err)
>> +			return err;
>> +	}
>> +
>>  	err = exec_sbmc(priv->adev->handle, state ? SBMC_CONSERVATION_ON : SBMC_CONSERVATION_OFF);
>>  	if (err)
>>  		return err;
>> @@ -491,6 +502,48 @@ static ssize_t conservation_mode_store(struct device *dev,
>>
>>  static DEVICE_ATTR_RW(conservation_mode);
>>
>> +static ssize_t quick_charge_show(struct device *dev,
>> +				 struct device_attribute *attr,
>> +				 char *buf)
>> +{
>> +	struct ideapad_private *priv = dev_get_drvdata(dev);
>> +	unsigned long result;
>> +	int err;
>> +
>> +	err = eval_gbmd(priv->adev->handle, &result);
>> +	if (err)
>> +		return err;
>> +
>> +	return sysfs_emit(buf, "%d\n", !!test_bit(GBMD_QUICK_CHARGE_STATE_BIT, &result));
>> +}
>> +
>> +static ssize_t quick_charge_store(struct device *dev,
>> +				  struct device_attribute *attr,
>> +				  const char *buf, size_t count)
>> +{
>> +	struct ideapad_private *priv = dev_get_drvdata(dev);
>> +	bool state;
>> +	int err;
>> +
>> +	err = kstrtobool(buf, &state);
>> +	if (err)
>> +		return err;
>> +
>> +	if (priv->features.conservation_mode && state) {
>> +		err = exec_sbmc(priv->adev->handle, SBMC_CONSERVATION_OFF);
>> +		if (err)
>> +			return err;
>> +	}
>> +
>> +	err = exec_sbmc(priv->adev->handle, state ? SBMC_QUICK_CHARGE_ON : SBMC_QUICK_CHARGE_OFF);
>> +	if (err)
>> +		return err;
>> +
>> +	return count;
>> +}
>> +
>> +static DEVICE_ATTR_RW(quick_charge);
>> +
>>  static ssize_t fan_mode_show(struct device *dev,
>>  			     struct device_attribute *attr,
>>  			     char *buf)
>> @@ -641,6 +694,7 @@ static DEVICE_ATTR_RW(usb_charging);
>>  static struct attribute *ideapad_attributes[] = {
>>  	&dev_attr_camera_power.attr,
>>  	&dev_attr_conservation_mode.attr,
>> +	&dev_attr_quick_charge.attr,
>>  	&dev_attr_fan_mode.attr,
>>  	&dev_attr_fn_lock.attr,
>>  	&dev_attr_touchpad.attr,
>> @@ -660,6 +714,8 @@ static umode_t ideapad_is_visible(struct kobject *kobj,
>>  		supported = test_bit(CFG_CAP_CAM_BIT, &priv->cfg);
>>  	else if (attr == &dev_attr_conservation_mode.attr)
>>  		supported = priv->features.conservation_mode;
>> +	else if (attr == &dev_attr_quick_charge.attr)
>> +		supported = priv->features.quick_charge;
>>  	else if (attr == &dev_attr_fan_mode.attr)
>>  		supported = priv->features.fan_mode;
>>  	else if (attr == &dev_attr_fn_lock.attr)
>> @@ -1546,9 +1602,13 @@ static void ideapad_check_features(struct ideapad_private *priv)
>>  	if (!read_ec_data(handle, VPCCMD_R_FAN, &val))
>>  		priv->features.fan_mode = true;
>>
>> -	if (acpi_has_method(handle, "GBMD") && acpi_has_method(handle, "SBMC"))
>> +	if (acpi_has_method(handle, "GBMD") && acpi_has_method(handle, "SBMC")) {
>>  		priv->features.conservation_mode = true;
>>
>> +		if (!eval_gbmd(handle,&val) && test_bit(GBMD_QUICK_CHARGE_SUPPORT_BIT, &val))
>> +			priv->features.quick_charge = true;
>> +	}
>> +
>>  	if (acpi_has_method(handle, "DYTC"))
>>  		priv->features.dytc = true;
>>
>> --
>> 2.37.3
>>
> 

