Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36F0FC4707F
	for <platform-driver-x86@archiver.kernel.org>; Tue, 25 May 2021 16:29:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 183D56141D
	for <platform-driver-x86@archiver.kernel.org>; Tue, 25 May 2021 16:29:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232410AbhEYQbA (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 25 May 2021 12:31:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42897 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232316AbhEYQa7 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 25 May 2021 12:30:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1621960169;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=KVp2OVUWdooP3wHZjrkglzUCDOT4452Xro7Zh31Al/w=;
        b=XE6cO0NSRWRmiEVLaU4d4aniIXQ2zdzEJY8zJ7RvJ3WKtnFiveS/UmPKUtd/d4+FllyH5X
        5Ya8M6QloDFfuiqlX0xluBc+8lajg/dc0GuoAmGFqfes/AlZ2EMCTPSxdyVHtnZUWql+65
        rDsapMoKIRPvdsgBdPHIHzR640BpVNY=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-111-V1ifR-ywM4SHVJZo0xYuEQ-1; Tue, 25 May 2021 12:29:25 -0400
X-MC-Unique: V1ifR-ywM4SHVJZo0xYuEQ-1
Received: by mail-ed1-f70.google.com with SMTP id q18-20020a0564025192b02903888712212fso17600475edd.19
        for <platform-driver-x86@vger.kernel.org>; Tue, 25 May 2021 09:29:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KVp2OVUWdooP3wHZjrkglzUCDOT4452Xro7Zh31Al/w=;
        b=YkYLiAdMpZrAVEO2fS9qKT5XbH4CLsF7dk2zlNyckrftKOd50NAMomkloBI869xaqr
         TJuTxYXGsYjs30572BH24LiYq0GnV9lfzWh5M1M+ROJtulxCBvJFbHazr5xStTOJYp0V
         fHzW8wrnjfgNWcH+UHUKV6fsIvJjGt8/6uYBHDmYzesigDQi5j3Z4ggQTbEnrqfwf+Xr
         vMZyqjPJaUtbME/HMgbVsUfI+kSWVJX8K+dp5ad1cKCVZHHe/rym/f7uGdHKmitkgICa
         Sw5YmbPIlzXIDzJCgLANRy7FEzfvrrxqM4YNk10UUSExdWcWQTn3LVHja06I7PS/4U4h
         Jdvw==
X-Gm-Message-State: AOAM532zf46tlnt9qKdWDEbgelKHDcK1D6CqmxuxsgNIrmH376uJSoZv
        awsZBG8FZqZ5D6segIiLQ7CFAaQm/p6cgUAjDRsJ9y7k3KPJ+wDEWVAkKWPiEEkdO5z1ldXYGEd
        dXOEeTvlSpIyQZzqM/FRL2FwwRTvB/B5dgQ==
X-Received: by 2002:a17:906:1185:: with SMTP id n5mr29597037eja.342.1621960164379;
        Tue, 25 May 2021 09:29:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwOW8tjLnyxkN/9Gzn4UWWYjLTMD9wsneVicttTIhL8t64bzrhe4ao76ChL+RMVkZMRz9IngA==
X-Received: by 2002:a17:906:1185:: with SMTP id n5mr29597020eja.342.1621960164212;
        Tue, 25 May 2021 09:29:24 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id f7sm11498220edd.5.2021.05.25.09.29.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 May 2021 09:29:23 -0700 (PDT)
Subject: Re: [External] Re: [PATCH v2 3/3] platform/x86: think-lmi: Add WMI
 interface support on Lenovo platforms
To:     Mark Pearson <markpearson@lenovo.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Mark Gross <mgross@linux.intel.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Divya Bharathi <divya.bharathi@dell.com>,
        Prasanth KSR <prasanth.ksr@dell.com>
References: <markpearson@lenovo.com>
 <20210509015708.112766-1-markpearson@lenovo.com>
 <20210509015708.112766-3-markpearson@lenovo.com>
 <CAHp75VfM=Vv2pe=KNYQO_hf_8Ya-m8QH481xnu+OPoZL-p8TSA@mail.gmail.com>
 <f13956b5-511e-1793-c089-6f72628ea7a8@lenovo.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <d17962ca-3839-fbeb-9090-e09960678b82@redhat.com>
Date:   Tue, 25 May 2021 18:29:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <f13956b5-511e-1793-c089-6f72628ea7a8@lenovo.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 5/25/21 5:14 PM, Mark Pearson wrote:
> Hi Andy,
> 
>>> +static ssize_t current_password_store(struct kobject *kobj,
>>> +                                     struct kobj_attribute *attr,
>>> +                                     const char *buf, size_t count)
>>> +{
>>> +       struct tlmi_pwd_setting *setting = container_of(kobj, struct tlmi_pwd_setting, kobj);
>>> +       int length;
>>
>>> +       length = strlen(buf);
>>> +       if (buf[length-1] == '\n')
>>> +               length--;
>>
>> This will prevent you from using \n in the password. Why?
> The BIOS doesn't like it - so we strip it out :)

Erm, I don't believe that that is the whole story, there are 2
separate things at play here:

1. When entering the BIOS password at system power-on pressing
enter means you're done and the BIOS should check what you've
just entered as password before pressing the enter key, so the
password can never contain '\n' since the enter key is the
terminator for entering the password at boot

2. People often use sysfs files by doing things like this:

echo mysecretpassword > /sys/.../current_password

And the "echo" shell command will then add an extra '\n' this
is why you will see code like this to strip the '\n' in functions
which use the input string as is (instead of doing strtol,
sysfs_match_string or something else which does not care about a
terminating '\n' already, note that functions like sysfs_str_equals
and sysfs_match_string are special helpers for not caring about
the '\n' without needing to strip it (because stripping it
requires a strdup).

So what is happening here is simply stripping the '\n' which may
have been added by echo (if it was added).

Regards,

Hans

