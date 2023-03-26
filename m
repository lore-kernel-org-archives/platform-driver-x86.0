Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FDF8C74A5B
	for <platform-driver-x86@archiver.kernel.org>; Sun, 26 Mar 2023 11:17:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231706AbjCZLRU (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 26 Mar 2023 07:17:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229985AbjCZLRT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 26 Mar 2023 07:17:19 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8C475241
        for <platform-driver-x86@vger.kernel.org>; Sun, 26 Mar 2023 04:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679829395;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=NlQHi3f6cqxvay8akTIG5CtbIfbiWHldYFcD0tu8GzI=;
        b=iQM9ecoFt0Ea7rRWPgZnBlZ91IgMM8fSPig/ZvsOR6k+Gj8kXATv++9XtR7pHuJGZDjLgu
        nS0/wNuETcqVVLylGFv+LkX0sdo/YRjxyfKjqedWy2MPkM5hHDoEhAa15psiWkkO9W6xkd
        SDfbCe4jT/gtok0xQO7suLX8hYueR+g=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-633-Ued8HnJIOoeHO0GBKVx26g-1; Sun, 26 Mar 2023 07:16:30 -0400
X-MC-Unique: Ued8HnJIOoeHO0GBKVx26g-1
Received: by mail-ed1-f69.google.com with SMTP id es16-20020a056402381000b004fa3e04c882so8624334edb.10
        for <platform-driver-x86@vger.kernel.org>; Sun, 26 Mar 2023 04:16:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679829385;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NlQHi3f6cqxvay8akTIG5CtbIfbiWHldYFcD0tu8GzI=;
        b=zw6STo6AMub0IQN11xqyRAQF+q07nAtjM7ss1tBF5iwFeEjFZOoz5EpgXNurG08vk+
         bNJeEkLq6zeMHyiIvPDamitsnXuny+gd9DbNvy3Nifcaz3RnC8a7MpbL8jBRRw0cDhpK
         Bazkfejuvz+FYSVNW3hnLYId6Ewior1J6l50cYqwFUoSH/4htvhfceFKi58cwaOzWkuW
         RY6aA/2h5FpJqBrKnDEKKtR0WeWE0wW2vezrP0nbmWBGjbwtCJH3Dz8ZzqL5zcnKWPUT
         W+CzKSrDQ+5/8oN5OSVJthQO7nnu+1R8e5TRitIF0FxfS3nV3rodhw/kFyRMFoAuuiNN
         d2lQ==
X-Gm-Message-State: AAQBX9cgPuLNKs8/6YuC9U6kOfYrBMOycD9HRhijhXV8uz5oq+A4CpBK
        5P+byNk3Q0qhT2r6VClNSFHozS2flknzPDTzAXwN014yHIDWbbn0sm1OBDfRWIRXimG3HL5ZZHp
        XoovU5W5wNsbXtetOQb4Bu321Zz7X7Hxebw==
X-Received: by 2002:a17:906:d8d0:b0:932:3688:ae81 with SMTP id re16-20020a170906d8d000b009323688ae81mr8562448ejb.9.1679829385570;
        Sun, 26 Mar 2023 04:16:25 -0700 (PDT)
X-Google-Smtp-Source: AKy350Zz4ImXdOkSwsFd6rQWqfMZIUgAyyrMXAG6dkvPe+JD7DL30XBA7C/7QmfsfOK6DKmikMBUFQ==
X-Received: by 2002:a17:906:d8d0:b0:932:3688:ae81 with SMTP id re16-20020a170906d8d000b009323688ae81mr8562426ejb.9.1679829385274;
        Sun, 26 Mar 2023 04:16:25 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id vq2-20020a170907a4c200b0093e9fb91837sm2926316ejc.76.2023.03.26.04.16.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Mar 2023 04:16:24 -0700 (PDT)
Message-ID: <80975b0f-ff40-6d1d-67d6-770fd01b0323@redhat.com>
Date:   Sun, 26 Mar 2023 13:16:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 2/2] platform/x86: Add driver for Yoga Tablet Mode
 switch
Content-Language: en-US, nl
To:     Armin Wolf <W_Armin@gmx.de>,
        Andrew Kallmeyer <kallmeyeras@gmail.com>
Cc:     platform-driver-x86@vger.kernel.org, Gergo Koteles <soyer@irl.hu>,
        Ike Panhc <ike.pan@canonical.com>, linux-input@vger.kernel.org,
        =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>
References: <20230323025200.5462-1-kallmeyeras@gmail.com>
 <20230323025200.5462-3-kallmeyeras@gmail.com>
 <7584e398-202a-dcee-ef5d-47a3989b06ab@gmx.de>
 <CAG4kvq9apmScR2Y8VO4Xb=4QPVw3XE19m2fR+L_xgER2ka+BvQ@mail.gmail.com>
 <c0a74480-52f9-3e4d-f4b5-5c39611e8965@gmx.de>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <c0a74480-52f9-3e4d-f4b5-5c39611e8965@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/25/23 22:49, Armin Wolf wrote:
> Am 25.03.23 um 16:16 schrieb Andrew Kallmeyer:
> 
>> On Sat, Mar 25, 2023 at 12:10 AM Armin Wolf <W_Armin@gmx.de> wrote:
>>> Hi,
>>>
>>> is it really necessary to allow userspace to read/write ec_trigger? The ACPI device
>>> used for triggering the EC is only initialized during probing, so changing the value
>>> of ec_trigger will make no difference in such cases.
>>>
>>> Maybe you could change module_param(ec_trigger, bool, 0644) to module_param(ec_trigger, bool, 0)?
>>>
>>> Armin Wolf
>> Great point, this is actually a regression from Gergo's original patch
>> that I didn't realize I caused. I believe the intention was that if
>> the quirk detection code doesn't have full coverage users can set the
>> parameter themselves. In Gergo's code it used the acpi_device from
>> ideapad-laptop.c which is always loaded if it exists. Now I only load
>> it if ec_trigger is true at probe time, I think I should update it to
>> load the acpi device always if it exists so that the user can set this
>> parameter at any time. I suppose I would just remove the if
>> (ec_trigger) (and the debug print) in the probe code when I load it.
>>
>> That is, unless you think it is best to just patch in more models to
>> the quirk detection later and not provide a parameter. Barnabás
>> actually suggested removing the ec_trigger flag completely because
>> right now the code isn't relying on it, but I think that is a bug.
> 
> I think it is best to still provide this module param for people who need
> it, but only allow enabling it when loading the module. This way userspace
> should not be able to read/write ec_trigger after the module has been loaded.
> 
> Because of this, i believe the ACPI device should only be initialized when
> the DMI table says its necessary or ec_trigger was set. So the current solution
> is fine for me, except for ec_trigger being accessible to userspace after
> the module was loaded.

Right, ack.

For the next version please use 0444 and not 0 for the sysfs file rights on the file, this way users can still read the parameters under /sys/modules/.../parameters/ec_trigger to e.g. check if the parameter was set, which is useful to e.g. see if an /etc/modprobe.d/foo.conf dropin file is working as expected.

Also please address Barnabás' remarks. I have not taken a really close look myself yet, but given the close look others have already given this drivers I don't expect to find any issues.

So please prepare a v3 (when you have time) and then I'll try to merge that right away.

Regards,

Hans


