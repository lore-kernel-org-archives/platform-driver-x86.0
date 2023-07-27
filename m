Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50E1AC001DC
	for <platform-driver-x86@archiver.kernel.org>; Thu, 27 Jul 2023 09:54:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231931AbjG0Jxl (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 27 Jul 2023 05:53:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230302AbjG0JxJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 27 Jul 2023 05:53:09 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8797297
        for <platform-driver-x86@vger.kernel.org>; Thu, 27 Jul 2023 02:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1690451542;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=do+1XQ4XtuaJ5dTD1s4r7DH6OWn683D2dxF2fQV74s4=;
        b=GRg5JZMdBFP/pK9f1kcDxdBTuHUtBib12nxyvUeCGNN6+ZrnzXP3gr1aXBZKEHKDezTys4
        pZV/cMJT3P0EA1wMdJ+oMcLl+5ejuimP5GaIGJ0SystLkEhQ7+yyZ6YM8rHLUR6smCza5y
        0wYlwDPEKtx99TLvRK4/PwmcgR9182M=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-554-lZ9EhRTNM7CE-FT6XGr2IQ-1; Thu, 27 Jul 2023 05:52:21 -0400
X-MC-Unique: lZ9EhRTNM7CE-FT6XGr2IQ-1
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-4f3932e595dso771903e87.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 27 Jul 2023 02:52:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690451539; x=1691056339;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=do+1XQ4XtuaJ5dTD1s4r7DH6OWn683D2dxF2fQV74s4=;
        b=WxNKKDvyaRjsaUw5hjUpXbjka9r2g9sYKvVKeyvrpKT4pT3BeM+AmPzEfXU7kLLun7
         K2MEEkR8z/EZUz2dPxZTdXoExnHeSkIvtLFZkMPdXbeDN2xUUwAmoDFi/kZxR9DIxzKg
         1+VsdOSN0ippIHD49b3ujQv6xb5w9gYYmGmILytQD8NNA06XguNUYHQUfXT0s0EL/Kl5
         jafBveUvvfFNn7hRIpvlherLIueBCiaAmSl+M/YC+vizDMAJcIj43yo/iN2iavfbKh3H
         qqF/igtAQ1bxT0xlsbvsJiv/D66RyH5o4XHz3rvGm+7EME8bxA+fYw61dp95PMInWLlR
         cQOA==
X-Gm-Message-State: ABy/qLb0EemW4f2fb108sRRQjDeK/Zss7ueq0qxJqZyBKM512NueQX6D
        Ov2PPAFDD4I6ZEFEp2t1T+7b8ge8Zqe0OWY8gAPMry32yjhyqup8LBdYzGlxU3CkTTO9eBJgN5c
        8ZgYUCwydwF4VgXYi4xQewdhvMAXrZyuMSQ==
X-Received: by 2002:ac2:58fb:0:b0:4fa:6d62:9219 with SMTP id v27-20020ac258fb000000b004fa6d629219mr1338482lfo.62.1690451539698;
        Thu, 27 Jul 2023 02:52:19 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEJ/eGPBhLAqWIqlahW0bh9+SgNxedHbs2vmptxN14TdlSE0ZUHKbuNVdVqNuo7/CavtrHqWg==
X-Received: by 2002:ac2:58fb:0:b0:4fa:6d62:9219 with SMTP id v27-20020ac258fb000000b004fa6d629219mr1338472lfo.62.1690451539355;
        Thu, 27 Jul 2023 02:52:19 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id u19-20020aa7db93000000b0051e1660a34esm445825edt.51.2023.07.27.02.52.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jul 2023 02:52:18 -0700 (PDT)
Message-ID: <75da106c-3f00-7be9-d4d5-c83f1e1664bb@redhat.com>
Date:   Thu, 27 Jul 2023 11:52:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] ACPI: scan: Create platform device for CS35L56
Content-Language: en-US, nl
To:     Richard Fitzgerald <rf@opensource.cirrus.com>, rafael@kernel.org,
        lenb@kernel.org, markgross@kernel.org
Cc:     linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, patches@opensource.cirrus.com,
        Simon Trimmer <simont@opensource.cirrus.com>
References: <20230726112759.18814-1-rf@opensource.cirrus.com>
 <33cdbf63-8fe4-da7e-5d36-6e63fe303b24@redhat.com>
 <42399566-2d25-e888-7226-05a86767b644@opensource.cirrus.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <42399566-2d25-e888-7226-05a86767b644@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/27/23 11:48, Richard Fitzgerald wrote:
> On 26/7/23 15:13, Hans de Goede wrote:
>> Hi Richard,
>>
>> On 7/26/23 13:27, Richard Fitzgerald wrote:
>>> From: Simon Trimmer <simont@opensource.cirrus.com>
>>>
>>> The ACPI device CSC3556 is a Cirrus Logic CS35L56 mono amplifier which
>>> is used in multiples, and can be connected either to I2C or SPI.
>>>
>>> There will be multiple instances under the same Device() node. Add it
>>> to ignore_serial_bus_ids and handle it in the serial-multi-instantiate
>>> driver.
>>>
>>> Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
>>> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
>>
>> Thanks, patch looks good to me:
>>
>> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>>
>> I have 1 other serial-multi-instantiate.c patches in my fixes branch (see below) and since this just adds new hw-ids I think this can go upstream through my fixes branch too.
>>
>> Rafael, do you agree with me taking this upstream as a 6.5 fix? And if yes may I have your ack for that ?
>>
>> About that 1 patch, that adds a new IRQ type: IRQ_RESOURCE_AUTO and I wonder if this patch should not use that same new type right from the start:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/agit/pdx86/platform-drivers-x86.git/commit/?h=fixes&id=676b7c5ecab36274442887ceadd6dee8248a244f
>>
> 
> Link doesn't work, but I think you mean:
> https://lore.kernel.org/platform-driver-x86/b9f81a5b-0511-9950-5a20-9e6cbd92d085@redhat.com/T/#t

Right an "a" (probably from ctrl + a) snuk in there, correct link:

https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/commit/?h=fixes&id=676b7c5ecab36274442887ceadd6dee8248a244f

Which is indeed the same patch as you linked.

> I'll send a V2 of this CS35L56 patch to use the new IRQ_RESOURCE_AUTO.

Thanks.

Regards,

Hans




