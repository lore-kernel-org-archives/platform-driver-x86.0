Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCDC6C678D4
	for <platform-driver-x86@archiver.kernel.org>; Thu,  2 Mar 2023 08:57:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229555AbjCBI5W (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 2 Mar 2023 03:57:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229814AbjCBI5P (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 2 Mar 2023 03:57:15 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38E7525965
        for <platform-driver-x86@vger.kernel.org>; Thu,  2 Mar 2023 00:56:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1677747392;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5RjEoXD/jRkxw5miCrCWE40wDj3H04/gRyOt6nMYW9Y=;
        b=X4nuKefVBUS0ExKw+7L/sOApPiUzyS09dlAX2R/Of58xm9TQHMcgUE2TDE7LkEDecvGMaH
        Jqc526D7LkRsgUQIfUKXxZpP31M/ZLrEMbS44fmtSHIzjFEWcqR6JPliEhNXi7lOlUZi29
        zetybKmiTQRqvC3cxpsUfJxFSOcIORo=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-141-GydzXwiEN_SyJ61Xi6diQw-1; Thu, 02 Mar 2023 03:56:30 -0500
X-MC-Unique: GydzXwiEN_SyJ61Xi6diQw-1
Received: by mail-ed1-f72.google.com with SMTP id cf11-20020a0564020b8b00b0049ec3a108beso23124797edb.7
        for <platform-driver-x86@vger.kernel.org>; Thu, 02 Mar 2023 00:56:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5RjEoXD/jRkxw5miCrCWE40wDj3H04/gRyOt6nMYW9Y=;
        b=4pV95r9jNrsFf8EqV4TiM/Abqy3r/bz7/RtTb26txxn7giq2VzSfozqVTpgF2zb+b9
         jSTboWmqeTwGaiJZ2MsBrtg8WNJJH7A9pNB46xvWV5AB2lJngG7ii/I/tRcpatA/sMtC
         bJynlqm2+Ot9d1/lHRJLhB159Qf7p5dmmTf4VLQhrLbw4FUzdpgleg3BYI4toC9GcpnK
         bo1jy6AiiZGUobrfou4hzymQQ1SR7RCRjK4gJggHU16su6n6samSLwAxmA5rHKx/BYWk
         VjZWdaOzSMj8l25lR/fjRARz6Swex85oIAR/FWvt5km0WofxyotQO+Zb5av9DZQxlVF7
         HtqQ==
X-Gm-Message-State: AO0yUKVWrxbqSpZL++7xSsjb+IUfM3OIxVYE7LyF7mYCKqEYhqqJV7xj
        YOmCo4SInwonE8y+vCxB/qziH9aIPKJM27hLUC1pYZ5fRa0Mwdu6uvp9ePeFKNbMq/avUcdROeG
        n1TOMMaOHSU/GFL5Re1psO8u7xWpESfRZN3RkFXs=
X-Received: by 2002:aa7:d049:0:b0:4af:6c25:f04f with SMTP id n9-20020aa7d049000000b004af6c25f04fmr8981057edo.36.1677747389213;
        Thu, 02 Mar 2023 00:56:29 -0800 (PST)
X-Google-Smtp-Source: AK7set/6ApyjcJpoHPC4YO6rprwE5RDZuTMBWycloXKZHsLzeXurdUnsDvnPyr1uZbp54JF22W73gw==
X-Received: by 2002:aa7:d049:0:b0:4af:6c25:f04f with SMTP id n9-20020aa7d049000000b004af6c25f04fmr8981048edo.36.1677747388943;
        Thu, 02 Mar 2023 00:56:28 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id h11-20020a50c38b000000b004bc9d44478fsm1632182edf.51.2023.03.02.00.56.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Mar 2023 00:56:28 -0800 (PST)
Message-ID: <c147567a-40cc-813c-aa48-c24a1e92ff00@redhat.com>
Date:   Thu, 2 Mar 2023 09:56:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] platform/x86: Add new msi-ec driver
To:     Nikita Kravets <teackot@gmail.com>,
        =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>
Cc:     platform-driver-x86@vger.kernel.org,
        Aakash Singh <mail@singhaakash.dev>,
        Jose Angel Pastrana <japp0005@red.ujaen.es>
References: <20230214132522.32631-1-teackot@gmail.com>
 <222e94e6-2ddb-a612-31b1-4537141ef478@redhat.com>
 <CAPXvF04_sPUtwB1Rk+XKPMigoxTfoo0RzbHvn9cozTq5vnMa_g@mail.gmail.com>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAPXvF04_sPUtwB1Rk+XKPMigoxTfoo0RzbHvn9cozTq5vnMa_g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Nikita,

On 3/1/23 21:17, Nikita Kravets wrote:
> Hi Hans,
> 
> We already have changes addressing Barnabás' remarks merged
> into the original repo, including the pr_fmt macro, so I only
> need to apply them to the kernel.
> 
>> I ran checkpatch on the patch and it found several issues
> 
> Thanks, I'll address them. Some of them are already fixed
> in the original repo.
> 
>> Also it seems that atm the module must always be loaded
>> manually ?
> 
>> I think this should get a dmi_system_id tables with known
>> MSI DMI_SYS_VENDOR() matches in there + a
>> MODULE_DEVICE_TABLE() pointing to the dmi_system_id table
>> to have the driver auto-load on MSI systems.
> 
> It loads automatically for me. Though would be better
> to only auto-load it on MSI systems.

I don't see any module-aliases in the submitted msi-ec.c,
so AFAICT it should not auto load.

Thus, that it is autoloaded for you is weird. Did you
maybe add it to a config file in /etc/modules-load.d/ ?

What is the output of "modinfo msi-ec" on your system ?

Regards,

Hans


