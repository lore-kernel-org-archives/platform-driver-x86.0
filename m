Return-Path: <SRS0=JE7e=ED=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B345C56201
	for <platform-driver-x86@archiver.kernel.org>; Wed, 28 Oct 2020 21:48:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D3FEB2064C
	for <platform-driver-x86@archiver.kernel.org>; Wed, 28 Oct 2020 21:48:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JL6aRhb3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727687AbgJ1VrX (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 28 Oct 2020 17:47:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45731 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727665AbgJ1VrS (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 28 Oct 2020 17:47:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1603921636;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TZ6vIgYo/mgKiFIRKeZHstPuk+6xO/QjFVc8HYMFCQ0=;
        b=JL6aRhb3chxDLnkCXm9PeliDy7rI5AU9RF3pCIq/yf0ktVJ/YmTNfb6Z/M9nb302UoO5ri
        GdBqJsW42vmkIyNBQX1O6mg410UpO7sOrw0cHdhNRUC1wC6ugG8FfMYWgEWptcQZLtzZpy
        k+0k5Ba2vyWG8ewHULo3g00rqTwFfpY=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-438-0piVushrN1m6NyU5fL2IRg-1; Wed, 28 Oct 2020 07:44:35 -0400
X-MC-Unique: 0piVushrN1m6NyU5fL2IRg-1
Received: by mail-ej1-f70.google.com with SMTP id x22so2020017ejs.17
        for <platform-driver-x86@vger.kernel.org>; Wed, 28 Oct 2020 04:44:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=TZ6vIgYo/mgKiFIRKeZHstPuk+6xO/QjFVc8HYMFCQ0=;
        b=mkK8I7LwfYH8dVA8F4Tn0DhixEJd3arbEh5CdWtBZkF5az8wHDr0RXu276aLxbK3ng
         G0r+35FQ9UIWuQn0UtrRiFm4xF3oSF6Fm2tUBtVp4pOh2jCOXGYInP9Wrx/IwL5o1cTq
         dwr9jOf3d9904n8ApinCDo/OEXBrCv/C3PPohCL+AbfyJiIUJTKbNVxqWZR7JfoVb5Tv
         0lUL+znLR4hNAoPWoRAE2/nD/rbDLO1HN35BrrR12DOmfCIbGTPsQAa4vByQ1R8ejTSF
         UIh1zvHX6Kf69M3F+daqzgnad2SZyc9O+ZSXYdlJVUWOOOaykjehbK1sL6QzrRB5Zv0D
         iwwA==
X-Gm-Message-State: AOAM532mwGDqs9/qYdafHICjIL2JjrIeXosTEe3zYAFQ96jEHkRcJ4RK
        6i6feC2TQlH2XXWktBlUzRpgmSumNptyPNBjKTLFcZ4a3pdHIReih2GwGDOyZsqW8zKyh5EKSUP
        /Jsq1wZe0TNyClKchX3mgiCuRuMLAAgPrzA==
X-Received: by 2002:a17:906:b084:: with SMTP id x4mr7356516ejy.374.1603885474019;
        Wed, 28 Oct 2020 04:44:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxXVjXhf4+8pZEIqcfIBD798pSoyoaqJ2gYQg3IVaefLkAhlwD9Rvrn8Pf8LVXj+k7UAaPcIg==
X-Received: by 2002:a17:906:b084:: with SMTP id x4mr7356503ejy.374.1603885473814;
        Wed, 28 Oct 2020 04:44:33 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
        by smtp.gmail.com with ESMTPSA id ss7sm2832579ejb.28.2020.10.28.04.44.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2020 04:44:33 -0700 (PDT)
Subject: Re: [PATCH v3] platform/x86: asus-wmi: Add support for SW_TABLET_MODE
 on UX360
To:     =?UTF-8?Q?Samuel_=c4=8cavoj?= <samuel@cavoj.net>
Cc:     Mark Gross <mgross@linux.intel.com>,
        Corentin Chary <corentin.chary@gmail.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20201020220944.1075530-1-samuel@cavoj.net>
 <20201020222914.6k2pkxiirzbefjml@fastboi.localdomain>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <a108d447-8bbe-dcc1-4ca5-1af4015418bd@redhat.com>
Date:   Wed, 28 Oct 2020 12:44:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201020222914.6k2pkxiirzbefjml@fastboi.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/21/20 12:29 AM, Samuel Čavoj wrote:
> Hi,
> 
> naturally I notice this right after I send the patch, but my whitespace
> is wrong. Time to set a pre-commit hook up. I guess that means a v4,
> unless you would fix it on your end? It's just a single line.
> 
> Sorry about all the noise,
> Sam
> 
> On 21.10.2020 00:09, Samuel Čavoj wrote:
>> @@ -375,6 +376,20 @@ static int asus_wmi_input_init(struct asus_wmi *asus)
>>  		}
>>  	}
>>  
>> +	if (asus->driver->quirks->use_lid_flip_devid) {
>> +		result = asus_wmi_get_devstate_simple(asus, ASUS_WMI_DEVID_LID_FLIP);
>> +        if (result < 0)
> 
> Right ^here.

No worries I will fix this when merging it.

> 
>> +			asus->driver->quirks->use_lid_flip_devid = 0;
>> +		if (result >= 0) {
>> +			input_set_capability(asus->inputdev, EV_SW, SW_TABLET_MODE);
>> +			input_report_switch(asus->inputdev, SW_TABLET_MODE, result);
>> +		} else if (result == -ENODEV) {
>> +			pr_err("This device has lid_flip quirk but got ENODEV checking it. This is a bug.");
>> +		} else {
>> +			pr_err("Error checking for lid-flip: %d\n", result);
>> +		}
>> +	}
> 

>> +	if (asus->driver->quirks->use_lid_flip_devid) {
>> +		result = asus_wmi_get_devstate_simple(asus, ASUS_WMI_DEVID_LID_FLIP);
>> +        if (result < 0)
>> +			asus->driver->quirks->use_lid_flip_devid = 0;
> 
> I had the idea of doing this, not sure if it is actually a good idea
> though. The idea is that it would prevent querying the device later
> during runtime, if the first get_devstate fails. Also I assume doing a
> input_report_switch without a corresponding input_set_capability is not
> great either, this would prevent that, if for some reason the
> get_devstate fails in the beginning but later fixes itself.
> 
> However, I can also imagine that writing to the quirks structure is
> frowned upon, please tell if that is the case. Thanks.

The quirk_entry structs are not defined const; and they are already written
to in other places (e.g. the wapf module param handling). So this is fine.

Note FWIW, that calling input_report_switch() with a switch which
has not been declared before through input_set_capability() before
is allowed and is simply treated as a no-op. But just skipping the
handling of the event alltogether is a bit cleaner, so your approach is
fine.

Regards,

Hans

