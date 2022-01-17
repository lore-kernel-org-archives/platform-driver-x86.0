Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F0C9C433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 17 Jan 2022 10:10:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235992AbiAQKKM (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 17 Jan 2022 05:10:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46450 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238536AbiAQKKJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 17 Jan 2022 05:10:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1642414208;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4J0ElTB2AOZnWzVznvtRJl3MZQ8bZn5EQP7QowedstE=;
        b=bXcStMY7xEbJLVxBSXldYQru3BHs8RMQdoluMiG7zuAPCcdHQfyfrx9vyF//JcEq9m9Cpe
        c2tfLOBtGGLvA2nAbUFW25xBh1J6tkLFmJBlS0+Ec3kTMvXeOOzgKF83ZP3Nj6/59Vgsax
        yu3IUw+c5jIW/EJzy8cJfbzMXDGgrZ8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-190-i_2iblrfN92M5hUy_-1afw-1; Mon, 17 Jan 2022 05:10:04 -0500
X-MC-Unique: i_2iblrfN92M5hUy_-1afw-1
Received: by mail-ed1-f70.google.com with SMTP id ee53-20020a056402293500b004022f34edcbso3079538edb.11
        for <platform-driver-x86@vger.kernel.org>; Mon, 17 Jan 2022 02:10:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=4J0ElTB2AOZnWzVznvtRJl3MZQ8bZn5EQP7QowedstE=;
        b=WCywEagrK4h3A6jvkMOMWuTXgnQjd71GN6oxrbMVQ4YRaH00uuC/5kgqiZoGFyvFDV
         ALVYbDDl/8vdR5DzVm2Bz4ktTDmNtY017J1M4WPHH9rnaSpADUF0LwbBapuQt0KmdmyH
         dxQncSWglFMWhX9TXZ3/WPnwKzGCtdXklJ2dKO0/sE/feDbn1B5FJVcyI6fsU7Cs8MzM
         dD2OvAT1UGr87UKX4yq2xksuRBgYSJ36EMX2JRzRat4FbRwfexdgTidaY5kQTfdXyGmp
         +wxVeCP9u1FBjw0o4ZYBMTF6sJSZKrBOqCpVl5LbMxiXoPDYk8kQOzJspWAC4II2ehLx
         p8pg==
X-Gm-Message-State: AOAM530IJq3CB3auTuJGGdMkrekKxLcYHHRfqho0m9C266+UPCGMRXOS
        AsQeOTCIgG/3xx0Yuh2wlN7BG1gnHd+P6Q/1SrITJicUFB8l5cbMwOoxkwGoPD3Q3qFVhuAvjyA
        z6U87ool1xS87g6HD2gq39iSmicFCB5GuWA==
X-Received: by 2002:a17:906:1da9:: with SMTP id u9mr16357567ejh.756.1642414203226;
        Mon, 17 Jan 2022 02:10:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyas75mjTIxTJBYjDwI6wKH2cNCVxyue8lte/fceXL7smFsbHankENEzZuqex9FSrjxHHR48Q==
X-Received: by 2002:a17:906:1da9:: with SMTP id u9mr16357555ejh.756.1642414203026;
        Mon, 17 Jan 2022 02:10:03 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id w7sm3690058ejq.99.2022.01.17.02.10.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jan 2022 02:10:02 -0800 (PST)
Message-ID: <83899a6d-97a1-9570-2960-158fa2df67be@redhat.com>
Date:   Mon, 17 Jan 2022 11:10:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] platform/x86: intel_crystal_cove_charger: Fix IRQ masking
 / unmasking
Content-Language: en-US
To:     Mark Gross <markgross@kernel.org>
Cc:     Andy Shevchenko <andy@kernel.org>,
        platform-driver-x86@vger.kernel.org
References: <20220111232309.377642-1-hdegoede@redhat.com>
 <20220115000533.GB133328@T470>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220115000533.GB133328@T470>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 1/15/22 01:05, Mark Gross wrote:
> On Wed, Jan 12, 2022 at 12:23:09AM +0100, Hans de Goede wrote:
>> The driver as originally submitted accidentally relied on Android having
>> run before and Android having unmasked the 2nd level IRQ-mask for the
>> charger IRQ. This worked since these are PMIC registers which are only
>> reset when the battery is fully drained or disconnected.
> Correct me if I'm wrong but Android is a usermode stack.  It cannot unmask
> IRQ's form user mode.

Android is an OS, consisting of what in many cases amounts to a fork of
the Linux kernel + a usermode stack. With "Android" in the commit msg
before I was referring to the entire OS, including the custom kernel shipped
with the OS.

> I'm guessing the persistant PMIC registeres where set when running a vendor
> kernel that was in use with Anroid prior to installing one using this change
> and a modern kernel, and after the batteries ran out or where removed the
> charger didn't work.

Right.

Regards,

Hans


>> Fix the charger IRQ no longer working after loss of battery power by
>> properly setting the 2nd level IRQ-mask for the charger IRQ.
>>
>> Note this removes the need to enable/disable our parent IRQ which just
>> sets the mask bit in the 1st level IRQ-mask register, setting one of
>> the 2 level masks is enough to stop the IRQ from getting reported.
>>
>> Fixes: 761db353d9e2 ("platform/x86: Add intel_crystal_cove_charger driver")
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  .../platform/x86/intel/crystal_cove_charger.c | 26 +++++++++----------
>>  1 file changed, 13 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/platform/x86/intel/crystal_cove_charger.c b/drivers/platform/x86/intel/crystal_cove_charger.c
>> index 0374bc742513..eeaa926d2058 100644
>> --- a/drivers/platform/x86/intel/crystal_cove_charger.c
>> +++ b/drivers/platform/x86/intel/crystal_cove_charger.c
>> @@ -17,6 +17,7 @@
>>  #include <linux/regmap.h>
>>  
>>  #define CHGRIRQ_REG					0x0a
>> +#define MCHGRIRQ_REG					0x17
>>  
>>  struct crystal_cove_charger_data {
>>  	struct mutex buslock; /* irq_bus_lock */
>> @@ -25,8 +26,8 @@ struct crystal_cove_charger_data {
>>  	struct irq_domain *irq_domain;
>>  	int irq;
>>  	int charger_irq;
>> -	bool irq_enabled;
>> -	bool irq_is_enabled;
>> +	u8 mask;
>> +	u8 new_mask;
>>  };
>>  
>>  static irqreturn_t crystal_cove_charger_irq(int irq, void *data)
>> @@ -53,13 +54,9 @@ static void crystal_cove_charger_irq_bus_sync_unlock(struct irq_data *data)
>>  {
>>  	struct crystal_cove_charger_data *charger = irq_data_get_irq_chip_data(data);
>>  
>> -	if (charger->irq_is_enabled != charger->irq_enabled) {
>> -		if (charger->irq_enabled)
>> -			enable_irq(charger->irq);
>> -		else
>> -			disable_irq(charger->irq);
>> -
>> -		charger->irq_is_enabled = charger->irq_enabled;
>> +	if (charger->mask != charger->new_mask) {
>> +		regmap_write(charger->regmap, MCHGRIRQ_REG, charger->new_mask);
>> +		charger->mask = charger->new_mask;
>>  	}
>>  
>>  	mutex_unlock(&charger->buslock);
>> @@ -69,14 +66,14 @@ static void crystal_cove_charger_irq_unmask(struct irq_data *data)
>>  {
>>  	struct crystal_cove_charger_data *charger = irq_data_get_irq_chip_data(data);
>>  
>> -	charger->irq_enabled = true;
>> +	charger->new_mask &= ~BIT(data->hwirq);
>>  }
>>  
>>  static void crystal_cove_charger_irq_mask(struct irq_data *data)
>>  {
>>  	struct crystal_cove_charger_data *charger = irq_data_get_irq_chip_data(data);
>>  
>> -	charger->irq_enabled = false;
>> +	charger->new_mask |= BIT(data->hwirq);
>>  }
>>  
>>  static void crystal_cove_charger_rm_irq_domain(void *data)
>> @@ -130,10 +127,13 @@ static int crystal_cove_charger_probe(struct platform_device *pdev)
>>  	irq_set_nested_thread(charger->charger_irq, true);
>>  	irq_set_noprobe(charger->charger_irq);
>>  
>> +	/* Mask the single 2nd level IRQ before enabling the 1st level IRQ */
>> +	charger->mask = BIT(0);
>> +	regmap_write(charger->regmap, MCHGRIRQ_REG, charger->mask);
>> +
>>  	ret = devm_request_threaded_irq(&pdev->dev, charger->irq, NULL,
>>  					crystal_cove_charger_irq,
>> -					IRQF_ONESHOT | IRQF_NO_AUTOEN,
>> -					KBUILD_MODNAME, charger);
>> +					IRQF_ONESHOT, KBUILD_MODNAME, charger);
>>  	if (ret)
>>  		return dev_err_probe(&pdev->dev, ret, "requesting irq\n");
>>  
>> -- 
>> 2.33.1
>>
> 

