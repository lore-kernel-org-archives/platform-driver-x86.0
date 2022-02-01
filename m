Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DB43C433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue,  1 Feb 2022 14:17:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239067AbiBAOR2 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 1 Feb 2022 09:17:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33648 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239002AbiBAOR2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 1 Feb 2022 09:17:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1643725047;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4wM594E1c//tLjmj62U5O4f0BYe1FlRQuVGCkPTlZ/A=;
        b=cgVkVTHXAN1I5gtW2uKzxswHkTB9Ax8qDmhAOy9w5qD4quxYt1MNTT6uLXUv3TbvEbFojZ
        7FvxwnYT70ye4sMrilaRikWYxfcAuDmZyGfeXBABaI2z/RUT387nCKXOnz/xcX6Gi+KH7J
        Iqjh/fjlB/FFFNWeu4QJbDAsYuLDGjI=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-618-qJlg-EwmOtCod357B3wmgA-1; Tue, 01 Feb 2022 09:17:26 -0500
X-MC-Unique: qJlg-EwmOtCod357B3wmgA-1
Received: by mail-ej1-f71.google.com with SMTP id fx12-20020a170906b74c00b006bbeab42f06so2991682ejb.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 01 Feb 2022 06:17:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=4wM594E1c//tLjmj62U5O4f0BYe1FlRQuVGCkPTlZ/A=;
        b=HMhhYaXwyjkdNtzddzvWmSWWnJCSq+fzKdue69S89kqvpuQZZPDdR98iAXYy4AZy/9
         FBkEpBlzm06pRwtOp0JY4EyOKLzlPJiohdVW1f7aO0Blt/HTub674gwxuU79pjrNj6YN
         z1D9kqrLXnSgMJh2yax1USETKRCADW9gnN+mq29V4v4xUPVw8ax7Gv7Y6E++2zPcbTuW
         vjLKbGQnT/SsTajCpUfwJ63IDoCFzyJYYx0sRL2jyo/Z7JSvK8fwIfSU50LRJP6HlkM6
         X48x2hmL7yhEn/r55z3uU6kY1SMwC08rymi+MFxn/Ua6BQeJUOn/wxz4kFU06ezLXN8g
         /tfw==
X-Gm-Message-State: AOAM530CD6hwuzBK9AcI08nUseDIODJdPkGkK9Aqxu80o3j7r+jj9lUW
        bdSRyRbtuOGBpLke7vfCxi1IqBpMy89nxokM34xDasTu8kQusMoT+omp4LmRDCJprMBz0OYwzfH
        sxqwOzuwOBWtXOxQQ63eyEUtjMgkHSGsT7Q==
X-Received: by 2002:a17:907:3f96:: with SMTP id hr22mr21313137ejc.594.1643725045384;
        Tue, 01 Feb 2022 06:17:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyORpBSz/JKposZR7BW2TYw8TYhREbZzEtINtBaQonWuJagaeu6BR2dpntNuPLeVdyP2pnDIw==
X-Received: by 2002:a17:907:3f96:: with SMTP id hr22mr21313122ejc.594.1643725045175;
        Tue, 01 Feb 2022 06:17:25 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id w27sm14816983ejb.90.2022.02.01.06.17.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Feb 2022 06:17:24 -0800 (PST)
Message-ID: <2e362538-7402-9843-ff97-c759be2d8bfd@redhat.com>
Date:   Tue, 1 Feb 2022 15:17:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] Update whitelisted ThinkPad models with dual fan support
 in thinkpad_acpi
Content-Language: en-US
From:   Hans de Goede <hdegoede@redhat.com>
To:     David Dreschner <david@dreschner.net>,
        ibm-acpi-devel@lists.sourceforge.net,
        Mark Pearson <markpearson@lenovo.com>
Cc:     platform-driver-x86@vger.kernel.org
References: <ec04aa1e-1ac3-edbc-ac08-eec15ec5c952@dreschner.net>
 <aceddce7-6c43-967c-fadd-fa307068e916@redhat.com>
 <f9ef9270-159e-7c7d-c6b3-72a2196933b2@redhat.com>
In-Reply-To: <f9ef9270-159e-7c7d-c6b3-72a2196933b2@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi David,

On 1/17/22 10:55, Hans de Goede wrote:
> Hi David,
> 
> On 1/11/22 12:09, Hans de Goede wrote:
>> Hi David,
>>
>> On 1/4/22 04:41, David Dreschner wrote:
>>> Hey guys,
>>>
>>> the attached patch updates the list of whitelisted ThinkPad models with dual fan support.
>>>
>>> The changes were tested on my ThinkPad T15g Gen 2. According to Lenovo, the BIOS version is the same for the P15 Gen 2 and the P17 Gen 2 ( https://pcsupport.lenovo.com/us/en/downloads/ds551321-bios-update-utility-bootable-cd-for-windows-10-64-bit-thinkpad-p15-gen-2-p17-gen-2-t15g-gen-2 ).
>>>
>>> I also added the P15v Gen 2 and T15p Gen 2 to the whitelist based on the BIOS version listed on the Lenovo homepage ( https://pcsupport.lenovo.com/us/en/downloads/ds551356-bios-update-utility-bootable-cd-for-windows-10-64-bit-thinkpad-p15v-gen-2-t15p-gen-2 ). The first generation had two fans and where covered by the whitelist entry for the P15 Gen 2. As the second generation has two fans, too, I made that change for completeness.
>>>
>>> To apply the changes before it's merged in the mainline linux kernel, I made a little dkms patch: https://github.com/dreschner/thinkpad_acpi-dual-fan-patch
>>
>> Thank you for your patch submission.
>>
>> If I understand things correctly then you've only tested the addition of the:
>>
>> TPACPI_Q_LNV3('N', '3', '7', TPACPI_FAN_2CTL),  /* P15 / P17 / T15g (2nd gen) */
>>
>> quirk, correct? In that case we really only want to add that quirk, we don't
>> want to go and add untested quirks. But perhaps Mark from Lenovo can confirm
>> that this quirk:
>>
>> TPACPI_Q_LNV3('N', '3', '8', TPACPI_FAN_2CTL),  /* P15v / T15p (2nd gen) */
>>
>> also is correct and that those models really have 2 fans, Mark ?
>>
>> Mark, more in general can you perhaps talk to the firmware team and ask
>> if there is a better way to detect if there are 2 fans in a thinkpad then
>> maintaining a quirk table for this ?
>>
>> Besides the issue of the untested quirk, unfortunately your patch is not
>> submitted in the right format, so I cannot accept it as is, esp. the
>> missing of a Signed-off-by is a blocker.
>>
>> Kernel patches should be in git format-patch output format and
>> your patch is missing a Signed-off-by line in the commit-message. I can only
>> accept patches with a Signed-off-by line in the commit-message like this:
>>
>> Signed-off-by: Your Real Name <email@your.domain>
>>
>> By adding this line you indicate that you are the author of the code and
>> are submitting it under the existing license for the file which you are
>> modifying (typically GPL-2.0) or that you have permission from the author
>> to submit it under this license. See:
>>
>> https://www.kernel.org/doc/html/latest/process/submitting-patches.html#sign-your-work-the-developer-s-certificate-of-origin
>>
>> Given that this patch is trivial and mostly data, not code, I can turn
>> it into a proper patch with myself as author, crediting you like this:
>>
>> Reported-and-tested-by: David Dreschner <david@dreschner.net>
>>
>> And then merge it with me as the author, or you can resubmit
>> it in the proper format if you prefer.
> 
> Despite Mark's answer that he will look into this, it might very well
> take quite a while before something comes out of that and it would be
> good to in the mean time just extend the quirk list with your
> ThinkPad T15g Gen 2 addition.
> 
> So can you please let me know how you want to proceed with this
> (see above) ?

ping David?

Regards,

Hans

