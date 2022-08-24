Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FFFDC00140
	for <platform-driver-x86@archiver.kernel.org>; Wed, 24 Aug 2022 11:11:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236824AbiHXLLi (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 24 Aug 2022 07:11:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234103AbiHXLLh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 24 Aug 2022 07:11:37 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CAEDDE9D
        for <platform-driver-x86@vger.kernel.org>; Wed, 24 Aug 2022 04:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1661339495;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9TqH0ArTYk8TZMFyZIQ/Pebcny4HSZknKX0gNIQOJb0=;
        b=cMva18CXIc/6naQP+IqDSmfD8Zthxs3hCbgva/Cpb8wadccyZZ9kf7o2JxKTihMRFcYPfG
        h/rg38zQoBXd4UPXZhR/oEZUgzY2xfeNwH4isF1CfJd22cbPsVu+gIPBnhjd01sW33kwa2
        LqhU583qtDEHQzU/ft5hqN1QECuLDwY=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-548-g2RL7344P1G0WW8FflD1lA-1; Wed, 24 Aug 2022 07:11:34 -0400
X-MC-Unique: g2RL7344P1G0WW8FflD1lA-1
Received: by mail-ej1-f71.google.com with SMTP id nb10-20020a1709071c8a00b006e8f89863ceso5013838ejc.18
        for <platform-driver-x86@vger.kernel.org>; Wed, 24 Aug 2022 04:11:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=9TqH0ArTYk8TZMFyZIQ/Pebcny4HSZknKX0gNIQOJb0=;
        b=meRCwBLnx4tXN74CjDsikU4w1v8L+NlS1+ApSFb7xda5CVJe9dOWQ5fYsn4PajP0FF
         ma+SY5mJlADmASRRFeQbX1bw49seaVIASrg8Y4eBNSbvssEVf5l5a5G+0I4z09nJYc2C
         Zoi0qRe8jc4/eYBpPDY2kx50/m7usR8cM//olXxNCCZkcVdgb/S/oGzkHlRYYnxG169r
         qASBq0p8D3XRpivzapdIUFP+QObEzr5hmDOzrhzWMnWYOleIT2f7hDEBMal/WDPaQBwa
         lg8JG8YLk81eh1eTTbgeFoexqDWCmLjj00zJJEAc4AEp5Rwh38HVBhNU8tiueo9lyq0c
         ierA==
X-Gm-Message-State: ACgBeo3xjRYE8QtwHIz3osnhhvacXKK1MRxTvgr1IWvLEcD2NqZ4ULKE
        Zc4Qoir2sKKQXJSRidTtvfdeF2tfnPysaMRLQql1ZQjyoRDvZFFmGg18W5WfgWIasfzhOZJzyHP
        63uIi81nsLvJWTse3HqiZKVfDfYTC/YGPzA==
X-Received: by 2002:a17:907:7e9e:b0:73d:ae12:5f11 with SMTP id qb30-20020a1709077e9e00b0073dae125f11mr2638937ejc.176.1661339493397;
        Wed, 24 Aug 2022 04:11:33 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4TTUrACK/XGWepadxCNkEhbNTCg5CXj3F2sC2Kjg3Ffk30X1pmCR6/61mhnzNzP/v4iHhBDA==
X-Received: by 2002:a17:907:7e9e:b0:73d:ae12:5f11 with SMTP id qb30-20020a1709077e9e00b0073dae125f11mr2638927ejc.176.1661339493199;
        Wed, 24 Aug 2022 04:11:33 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id f20-20020a17090631d400b0073c5192cba6sm999953ejf.114.2022.08.24.04.11.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Aug 2022 04:11:32 -0700 (PDT)
Message-ID: <ca13b742-7bb9-da20-4e50-2d04233aaf93@redhat.com>
Date:   Wed, 24 Aug 2022 13:11:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 1/1] platform/x86: asus-wmi: Add mic-mute LED classdev
 support
Content-Language: en-US
To:     PaddyKP Yao <ispaddy@gmail.com>, Pavel Machek <pavel@ucw.cz>
Cc:     PaddyKP_Yao@asus.com, andy.shevchenko@gmail.com,
        acpi4asus-user@lists.sourceforge.net, corentin.chary@gmail.com,
        linux-kernel@vger.kernel.org, luke@ljones.dev,
        mgross@linux.intel.com, platform-driver-x86@vger.kernel.org
References: <HK0PR04MB33636680A6DC47211560BB43FA879@HK0PR04MB3363.apcprd04.prod.outlook.com>
 <20220711024718.1700067-1-PaddyKP_Yao@asus.com> <20220824100615.GA1049@bug>
 <20220824110908.GB111@AA2000783-NB2.corpnet.asus>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220824110908.GB111@AA2000783-NB2.corpnet.asus>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/24/22 13:09, PaddyKP Yao wrote:
> Hi Pavel,
> 
> On Wed, Aug 24, 2022 at 12:06:15PM +0200, Pavel Machek wrote:
>>>  drivers/platform/x86/asus-wmi.c            | 25 ++++++++++++++++++++++
>>>  include/linux/platform_data/x86/asus-wmi.h |  1 +
>>>  3 files changed, 28 insertions(+)
>>>
>>> asus->micmute_led.name = "asus::micmute";
>>
>> Please see/modify well-known-leds.txt file. We want this consistent on all devices.
> 
> Thanks for your feedback.
> Do you mean I should use "platform::micmute" instead of "asus::micmute"?

Yes. Since I have already merged your original patch can you please make
this a new patch on top of your original patch ?  In other words just
make this 1 small change in the new patch:

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 2d9d709aa59f..18e584eb9f0f 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -1060,7 +1060,7 @@ static int asus_wmi_led_init(struct asus_wmi *asus)
 	}
 
 	if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_MICMUTE_LED)) {
-		asus->micmute_led.name = "asus::micmute";
+		asus->micmute_led.name = "platform::micmute";
 		asus->micmute_led.max_brightness = 1;
 		asus->micmute_led.brightness = ledtrig_audio_get(LED_AUDIO_MICMUTE);
 		asus->micmute_led.brightness_set_blocking = micmute_led_set;

Regards,

Hans

