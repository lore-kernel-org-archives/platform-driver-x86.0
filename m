Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E93DC433DB
	for <platform-driver-x86@archiver.kernel.org>; Fri,  5 Mar 2021 08:51:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0032964F59
	for <platform-driver-x86@archiver.kernel.org>; Fri,  5 Mar 2021 08:51:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229469AbhCEIv0 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 5 Mar 2021 03:51:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40496 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229489AbhCEIvP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 5 Mar 2021 03:51:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1614934274;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qwOiiilhnbZitpKDqUKfd1Bk/Pqsm8dh6GiRcCRjc7M=;
        b=D6muFu2oazV0m5UaiV4ZP1rCFWJzv/BeuM/hdj0W2omst5Sx78y+xOywaaLnm1jD8zqvZn
        yNB9wrwD/PpuAGuSijOyU+ZrSTTigoYfsPEAY0OC7QywNNychqZkBPHZFgA8RHZrZE49nm
        KAzyZXQM92reBWaFC+bcdAZKAhypWgc=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-490-zT6OVnm-O-iXGLwgVDfNmg-1; Fri, 05 Mar 2021 03:51:13 -0500
X-MC-Unique: zT6OVnm-O-iXGLwgVDfNmg-1
Received: by mail-ed1-f70.google.com with SMTP id i19so599613edy.18
        for <platform-driver-x86@vger.kernel.org>; Fri, 05 Mar 2021 00:51:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qwOiiilhnbZitpKDqUKfd1Bk/Pqsm8dh6GiRcCRjc7M=;
        b=hR0f5nmkfV1+huf/NcDV4W0QUWlbfJmH7jjdhnQg7+K4wvuB1UPWgpb5tAaPOrUVgN
         VsKpaVHH82lr1IP6OWP3XW6vWxBwaJjrFtSVAoyObHlYGhnlduEl/RE1gdAfnUsjGBq5
         aEaWGMf15P4Dg+F8LHqlQW4EuVyBlu7f5RADybiBv0OiNwHTOeOPIL/A98CoFqZqbVaY
         GOe5Jq/5lPQsgi0vY0aaRArf1pSzZRkO6EQCTlIL9IpbFfEC14/EQsOyYeEQg7COyje0
         CxVrhcr/FAQ8z32Lm9iro86XGuLuV7dtePUw0s9VKKYJCJXLTQ+PmAjXGv1xPi0wgFjx
         ieOA==
X-Gm-Message-State: AOAM532ZzivtGgILCNSVzggrJE4haEehpJcyyVfqU+7motCPKtjZCo2A
        ct26JuoSxm+NY/D2qlKTbGp31jFE4/RaqwMoq9X6OcRCtZeSRM9cgt6mRVr/kepBun0ARmUin3E
        PQva6AOSKJ9DS5TLPcVDvS2p42JdeljnUeQ==
X-Received: by 2002:a17:906:2b9a:: with SMTP id m26mr1316000ejg.526.1614934271748;
        Fri, 05 Mar 2021 00:51:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz1bmwHnUvoPk3weLLuW3q2UyJXqlmWOdyGCpEOgdXcrv+O9FZuhUqfHvsJlO/Yp/bXG+9OEQ==
X-Received: by 2002:a17:906:2b9a:: with SMTP id m26mr1315991ejg.526.1614934271592;
        Fri, 05 Mar 2021 00:51:11 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id j25sm1214368edy.9.2021.03.05.00.51.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Mar 2021 00:51:11 -0800 (PST)
Subject: Re: [External] Re: [PATCH v2 1/2] platorm/x86: thinkpad_acpi: sysfs
 interface to reduce wlan tx power
To:     Nitin Joshi1 <njoshi1@lenovo.com>, Nitin Joshi <nitjoshi@gmail.com>
Cc:     "ibm-acpi-devel@lists.sourceforge.net" 
        <ibm-acpi-devel@lists.sourceforge.net>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        Mark RH Pearson <markpearson@lenovo.com>
References: <20210216073639.687703-1-njoshi1@lenovo.com>
 <d4427d59-7385-d41f-07a0-c27ce8d495bb@redhat.com>
 <TY2PR03MB36456FC14E208B1B2C8B09528C969@TY2PR03MB3645.apcprd03.prod.outlook.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <fd2b03c6-f600-326b-61ad-1b2047438a0d@redhat.com>
Date:   Fri, 5 Mar 2021 09:51:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <TY2PR03MB36456FC14E208B1B2C8B09528C969@TY2PR03MB3645.apcprd03.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/5/21 1:42 AM, Nitin Joshi1 wrote:
> Hello Hans,
> 
>> -----Original Message-----
>> From: Hans de Goede <hdegoede@redhat.com>
>> Sent: Thursday, March 4, 2021 8:44 PM
>> To: Nitin Joshi <nitjoshi@gmail.com>
>> Cc: ibm-acpi-devel@lists.sourceforge.net; platform-driver-
>> x86@vger.kernel.org; Nitin Joshi1 <njoshi1@lenovo.com>; Mark RH Pearson
>> <markpearson@lenovo.com>
>> Subject: [External] Re: [PATCH v2 1/2] platorm/x86: thinkpad_acpi: sysfs
>> interface to reduce wlan tx power
>>
>> Hi,
>>
>> On 2/16/21 8:36 AM, Nitin Joshi wrote:
>>> Some newer Thinkpads have the WLAN antenna placed close to the WWAN
>>> antenna. In these cases FCC certification requires that when WWAN is
>>> active we reduce WLAN transmission power. A new Dynamic Power
>>> Reduction Control (DPRC) method is available from the BIOS on these
>>> platforms to reduce or restore WLAN Tx power.
>>>
>>> This patch provides a sysfs interface that userspace can use to adjust
>>> the WLAN power appropriately.
>>>
>>> Reviewed-by: Mark Pearson <markpearson@lenovo.com>
>>> Signed-off-by: Nitin Joshi <njoshi1@lenovo.com>
>>
>> Thank you for your patches, I'm afraid that there are still a couple of small
>> issues which need to be fixed before I can apply these:
> 
> Thank you for your comments and apologize for any inconvenience caused.
> 
>>
>> 1. Both patches have "platform" misspelled in the patch Subject.
> Ack.  I will correct it in next version.
> 
>> 2. The patches don't apply cleanly because your kbdlang patch has
>>   been merged and these are based on a thinkpad_acpi version without
>>   these.
> Ack.  I will take latest file and correct it in next version.
> 
>> 3. I've some review remarks about this patch, see my inline comments below.
>>   Note some of these remarks apply to patch 2/2 too
>>   (I've indicated when this is the case).
> Ack with thanks
> 
>>
>>> ---
>>>  .../admin-guide/laptops/thinkpad-acpi.rst     |  18 +++
>>>  drivers/platform/x86/thinkpad_acpi.c          | 130 ++++++++++++++++++
>>>  2 files changed, 148 insertions(+)
>>>
>>> diff --git a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
>>> b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
>>> index 5fe1ade88c17..10410811b990 100644
>>> --- a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
>>> +++ b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
>>> @@ -51,6 +51,7 @@ detailed description):
>>>  	- UWB enable and disable
>>>  	- LCD Shadow (PrivacyGuard) enable and disable
>>>  	- Lap mode sensor
>>> +	- WLAN transmission power control
>>>
>>>  A compatibility table by model and feature is maintained on the web
>>> site, http://ibm-acpi.sf.net/. I appreciate any success or failure @@
>>> -1447,6 +1448,23 @@ they differ between desk and lap mode.
>>>  The property is read-only. If the platform doesn't have support the
>>> sysfs  class is not created.
>>>
>>> +WLAN transmission power control
>>> +--------------------------------
>>> +
>>> +sysfs: wlan_tx_strength_reduce
>>> +
>>> +Some newer Thinkpads have the WLAN antenna placed close to the WWAN
>> antenna.
>>> +This interface will be used by userspace to reduce the WLAN Tx power
>>> +strength when WWAN is active, as is required for FCC certification.
>>> +
>>> +The available commands are::
>>> +
>>> +        echo '0' >
>> /sys/devices/platform/thinkpad_acpi/wlan_tx_strength_reduce
>>> +        echo '1' >
>>> + /sys/devices/platform/thinkpad_acpi/wlan_tx_strength_reduce
>>> +
>>> +The first command restores the wlan transmission power and the latter
>>> +one reduces wlan transmission power.
>>> +
>>>  EXPERIMENTAL: UWB
>>>  -----------------
>>>
>>> diff --git a/drivers/platform/x86/thinkpad_acpi.c
>>> b/drivers/platform/x86/thinkpad_acpi.c
>>> index f3e8eca8d86d..af90251d79d7 100644
>>> --- a/drivers/platform/x86/thinkpad_acpi.c
>>> +++ b/drivers/platform/x86/thinkpad_acpi.c
>>> @@ -9983,6 +9983,132 @@ static struct ibm_struct proxsensor_driver_data
>> = {
>>>  	.exit = proxsensor_exit,
>>>  };
>>>
>>>
>> +/***************************************************************
>> *****
>>> +*****
>>> + * DPRC(Dynamic Power Reduction Control) subdriver, for the Lenovo
>>> +WWAN
>>> + * and WLAN feature.
>>> + */
>>> +#define DPRC_GET_WLAN_STATE             0x20000
>>> +#define DPRC_SET_WLAN_POWER_REDUCE      0x00030010
>>> +#define DPRC_SET_WLAN_POWER_FULL        0x00030100
>>> +#define DPRC_WLAN_POWER_REDUCE_BIT      BIT(4)
>>> +#define DPRC_WLAN_POWER_FULL_BIT        BIT(8)
>>> +static bool has_wlantxreduce;
>>> +static int wlan_txreduce;
>>> +
>>> +static int dprc_command(int command, int *output) {
>>> +	acpi_handle dprc_handle;
>>> +
>>> +	if (ACPI_FAILURE(acpi_get_handle(hkey_handle, "DPRC",
>> &dprc_handle))) {
>>> +		/* Platform doesn't support DPRC */
>>> +		return -ENODEV;
>>> +	}
>>> +
>>> +	if (!acpi_evalf(dprc_handle, output, NULL, "dd", command))
>>> +		return -EIO;
>>> +
>>> +	/*
>>> +	 * METHOD_ERR gets returned on devices where few commands are
>> not supported
>>> +	 * for example WLAN power reduce command is not supported on
>> some devices.
>>> +	 */
>>> +	if (*output & METHOD_ERR)
>>> +		return -ENODEV;
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int get_wlan_state(int *wlan_txreduce) {
>>> +	int output, err;
>>> +
>>> +	/* Get current WLAN Power Transmission state */
>>> +	err = dprc_command(DPRC_GET_WLAN_STATE, &output);
>>> +	if (err)
>>> +		return err;
>>> +
>>> +	if (output & DPRC_WLAN_POWER_REDUCE_BIT)
>>> +		*wlan_txreduce = 1;
>>> +	else if (output & DPRC_WLAN_POWER_FULL_BIT)
>>> +		*wlan_txreduce = 0;
>>> +	else
>>> +		return -ENODATA;
>>
>> If you return -ENODEV here, then the error handling in tpacpi_dprc_init()
>> becomes a lot simpler / easier to read.
>>
>> Note this remark applies to patch 2/2 too.
> Ack. I will modify it on next version.
> 
>>
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +/* sysfs wlan entry */
>>> +static ssize_t wlan_tx_strength_reduce_show(struct device *dev,
>>> +						struct device_attribute *attr,
>>> +						char *buf)
>>> +{
>>> +	int err;
>>> +
>>> +	err = get_wlan_state(&wlan_txreduce);
>>> +	if (err)
>>> +		return err;
>>
>> Is it necessary to re-query the setting here? Can't you just query it from
>> tpacpi_dprc_init() once and store the updated value in
>> wlan_tx_strength_reduce_store() on success?
> We will have to call this sys for WLAN power reduce or full from userspace based on
> some conditions. After setting we need to make sure if wlan is set correctly in BIOS .
> I can understand that if setting is success, then we can store updated value on success.
> However , since, we have command to get wlan tx state in "DPRC" method , so I just want to make sure 
> If wlan tx state is set correctly in BIOS as I don’t have any other way to confirm it.
> So, I think it's better to keep this setting here.   

Keeping the querying of the setting here is fine.

> 
>>
>>
>>> +
>>> +	return sysfs_emit(buf, "%d\n", wlan_txreduce); }
>>> +
>>> +static ssize_t wlan_tx_strength_reduce_store(struct device *dev,
>>> +						struct device_attribute *attr,
>>> +						const char *buf, size_t count)
>>> +{
>>> +	int output, err, ret;
>>
>> Please use just err here, there is no need to have both err and ret.
> Ack. I will modify it in next version.
> 
>>
>>> +	bool state;
>>> +
>>> +	ret = kstrtobool(buf, &state);
>>> +	if (ret)
>>> +		return ret;
>>
>> So change to using err here.
>>
> Ack. I will modify it in next version.
> 
>>> +
>>> +	if (state)
>>> +		err = dprc_command(DPRC_SET_WLAN_POWER_REDUCE,
>> &output);
>>> +	else
>>> +		err = dprc_command(DPRC_SET_WLAN_POWER_FULL,
>> &output);
>>
>>
>> You are not doing anything with err here, shouldn't this have a:
>>
>> 	if (err)
>> 		return err;
>>
>> here ?
> Ack. I will recheck it and modify it in next version.
> 
> I will incorporate all comments and send updated patch by next week or asap.

Thank you.

Regards,

Hans



>>> +
>>> +	sysfs_notify(&tpacpi_pdev->dev.kobj, NULL,
>>> +"wlan_tx_strength_reduce");
>>> +
>>> +	return count;
>>> +}
>>> +static DEVICE_ATTR_RW(wlan_tx_strength_reduce);
>>> +
>>> +static int tpacpi_dprc_init(struct ibm_init_struct *iibm) {
>>> +	int wlantx_err, err;
>>> +
>>> +	wlantx_err = get_wlan_state(&wlan_txreduce);
>>> +	/*
>>> +	 * If support isn't available (ENODEV) for both devices then quit, but
>>> +	 * don't return an error.
>>> +	 */
>>> +	if ((wlantx_err == -ENODEV) || (wlantx_err == -ENODATA))
>>> +		return 0;
>>> +	/* Otherwise, if there was an error return it */
>>> +	if (wlantx_err && (wlantx_err != -ENODEV) && (wlantx_err != -
>> ENODATA))
>>> +		return wlantx_err;
>>> +	else if (!wlantx_err)
>>> +		has_wlantxreduce = true;
>>> +
>>> +	if (has_wlantxreduce) {
>>> +		err = sysfs_create_file(&tpacpi_pdev->dev.kobj,
>>> +
>> 	&dev_attr_wlan_tx_strength_reduce.attr);
>>> +		if (err)
>>> +			return err;
>>> +	}
>>> +	return 0;
>>> +}
>>> +
>>> +static void dprc_exit(void)
>>> +{
>>> +	if (has_wlantxreduce)
>>> +		sysfs_remove_file(&tpacpi_pdev->dev.kobj,
>>> +&dev_attr_wlan_tx_strength_reduce.attr);
>>> +}
>>> +
>>> +static struct ibm_struct dprc_driver_data = {
>>> +	.name = "dprc",
>>> +	.exit = dprc_exit,
>>> +};
>>> +
>>>
>> /****************************************************************
>> ************
>>>
>> *****************************************************************
>> ***********
>>>   *
>>> @@ -10475,6 +10601,10 @@ static struct ibm_init_struct ibms_init[]
>> __initdata = {
>>>  		.init = tpacpi_proxsensor_init,
>>>  		.data = &proxsensor_driver_data,
>>>  	},
>>> +	{
>>> +		.init = tpacpi_dprc_init,
>>> +		.data = &dprc_driver_data,
>>> +	},
>>>  };
>>>
>>>  static int __init set_ibm_param(const char *val, const struct
>>> kernel_param *kp)
>>>
> 

