Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 519AFC6FA8F
	for <platform-driver-x86@archiver.kernel.org>; Wed, 30 Aug 2023 18:48:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242799AbjH3Srd (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 30 Aug 2023 14:47:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244571AbjH3NVU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 30 Aug 2023 09:21:20 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B3CB137
        for <platform-driver-x86@vger.kernel.org>; Wed, 30 Aug 2023 06:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1693401630;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5CyHpSeJuiY1IirS3vd5gHIYSz7rC/rBYpdbUqUGYGA=;
        b=KC2iUPWI+jXMOG8kc7rWcF+RNz5Sfs3wO+RvDpC7w1t4b2vMEW0F5K6zvmOTSZ/7aT/Nbg
        srF3sZYvRh5gpT6JfeIKYqzcZGtIYB2Y0ETPrCeJfTti+hZ3f/ixtU0H0V+iuqBEVOTQ/U
        Z2GhAkzU0ZN3Unt/1/m9G1gMICIdHU8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-194-5aGICzTNP42pTZ-FXIUnPQ-1; Wed, 30 Aug 2023 09:20:29 -0400
X-MC-Unique: 5aGICzTNP42pTZ-FXIUnPQ-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-3fe182913c5so40078895e9.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 30 Aug 2023 06:20:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693401628; x=1694006428;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5CyHpSeJuiY1IirS3vd5gHIYSz7rC/rBYpdbUqUGYGA=;
        b=lx51oP+vTZSovlHXEAHUqUcVIly4DwEaT8zf2CtaOjo8hHEdxNgXbcEkXxdLA1YOuv
         acZxkBAmVAXgWV3lnaSKU4D6cK5qLxQ5ubsA3yvfqK5wiAmXAFYEhrAC1v7M46/v7aT6
         1Bceqwd49jnbyECc12uWutdbG6RIiTGx4v3E9YnxBQg8vzHOjjvJqdGGnBS3r+0XcWAu
         DxVWnGduBbcohdswvc1jJ891+f0UrfFSse3rkO7UB84nPY854cYAyN4xiUyEuk/XS+JD
         92ht0TDXMRgc5/RE8G1Y6x+bOYBttGMSg6afaFXGNHBOHVbPamUEQvuf8kMb/5ffsg9V
         FL3w==
X-Gm-Message-State: AOJu0YxMdSCgyqFd2LuBHE83SOUD/H/4gjVNQz/0KgJfwf6/eEIPM2fV
        g7mBIIgw2Y06Ko5wbJWpfFQPRxvEStHY56YAQrjsR0TG7+8eg5VaMb57CaZlHKDoqXlJ/zl0Mc2
        o/I6UfcJgNJZFH5tWZj7/L8C7rH9gdzQyNw==
X-Received: by 2002:a05:6000:1b07:b0:319:5a7c:6418 with SMTP id f7-20020a0560001b0700b003195a7c6418mr1873691wrz.43.1693401628350;
        Wed, 30 Aug 2023 06:20:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFLiqBeI59Svx3p9VJvdvoiB3GXCVxyvVIzhXufgJ29dZw5qcPzzFa4WfZoV2R1WVn1srdaA==
X-Received: by 2002:a05:6000:1b07:b0:319:5a7c:6418 with SMTP id f7-20020a0560001b0700b003195a7c6418mr1873673wrz.43.1693401627973;
        Wed, 30 Aug 2023 06:20:27 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id n4-20020a170906688400b0099cf840527csm7125425ejr.153.2023.08.30.06.20.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Aug 2023 06:20:26 -0700 (PDT)
Message-ID: <0bf2e95f-7039-79a0-13eb-54c7d99eaecd@redhat.com>
Date:   Wed, 30 Aug 2023 15:20:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/1] platform/x86: asus-wmi: corrections to egpu safety
 check
Content-Language: en-US, nl
To:     =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        "Luke D. Jones" <luke@ljones.dev>
Cc:     corentin.chary@gmail.com, markgross@kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org
References: <20230830022908.36264-1-luke@ljones.dev>
 <20230830022908.36264-2-luke@ljones.dev>
 <24d07d16-5562-3737-7fe0-827b5145f2a8@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <24d07d16-5562-3737-7fe0-827b5145f2a8@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi All,

On 8/30/23 13:31, Ilpo Järvinen wrote:
> On Wed, 30 Aug 2023, Luke D. Jones wrote:
> 
>> An incorrect if statement was preventing the enablement of the egpu.
>>
>> Fixes: d49f4d1a30ac ("platform/x86: asus-wmi: don't allow eGPU switching if eGPU not connected")
>>
>> Signed-off-by: Luke D. Jones <luke@ljones.dev>
> 
> Please don't leave extra spaces into tags block.
> 
>> ---
>>  drivers/platform/x86/asus-wmi.c | 15 +++++++--------
>>  1 file changed, 7 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
>> index 9783893d2d6e..f54178d6f780 100644
>> --- a/drivers/platform/x86/asus-wmi.c
>> +++ b/drivers/platform/x86/asus-wmi.c
>> @@ -726,19 +726,18 @@ static ssize_t egpu_enable_store(struct device *dev,
>>  		return -EINVAL;
>>  
>>  	err = asus_wmi_get_devstate_simple(asus, ASUS_WMI_DEVID_EGPU_CONNECTED);
>> -	if (err < 0)
>> -		return err;
>> -	if (err < 1) {
>> -		err = -ENODEV;
>> -		pr_warn("Failed to set egpu disable: %d\n", err);
>> +	if (err < 0) {
>> +		pr_warn("Failed to get egpu connection status: %d\n", err);
> 
> So this is the Fixes: part? You should make own patch out of it.
> 
>>  		return err;
>>  	}
>>  
>>  	if (asus->gpu_mux_mode_available) {
>>  		result = asus_wmi_get_devstate_simple(asus, ASUS_WMI_DEVID_GPU_MUX);
>> -		if (result < 0)
>> +		if (result < 0) {
>>  			/* An error here may signal greater failure of GPU handling */
>> +			pr_warn("Failed to get gpu mux status: %d\n", err);
>>  			return result;
>> +		}
>>  		if (!result && enable) {
>>  			err = -ENODEV;
>>  			pr_warn("Can not enable eGPU when the MUX is in dGPU mode: %d\n", err);
>> @@ -748,12 +747,12 @@ static ssize_t egpu_enable_store(struct device *dev,
>>  
>>  	err = asus_wmi_set_devstate(ASUS_WMI_DEVID_EGPU, enable, &result);
>>  	if (err) {
>> -		pr_warn("Failed to set egpu disable: %d\n", err);
>> +		pr_warn("Failed to set egpu state: %d\n", err);
>>  		return err;
>>  	}
>>  
>>  	if (result > 1) {
>> -		pr_warn("Failed to set egpu disable (retval): 0x%x\n", result);
>> +		pr_warn("Failed to set egpu state (retval): 0x%x\n", result);
>>  		return -EIO;
>>  	}
>>  
>>
> 
> These others are good changes too but just not to be made in the same 
> patch.

Ilpo, you are right this should have really been 2 patches.

But the other changes are fixes (correction of wrong error messages) too,
which would be good to get out there.

So I've decided to take this as is, so that this can be included in
the main pdx86 pull-req for 6.6:

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans


