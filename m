Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37AF1C6FA9D
	for <platform-driver-x86@archiver.kernel.org>; Wed,  1 Mar 2023 15:10:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229589AbjCAPKk (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 1 Mar 2023 10:10:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229563AbjCAPKj (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 1 Mar 2023 10:10:39 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B872AD28
        for <platform-driver-x86@vger.kernel.org>; Wed,  1 Mar 2023 07:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1677683402;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=T7hjrRmCf/g+G1gciwM0bmknKtmUm3wa7BW6se88ASQ=;
        b=EorIPs06fPz+gzdUV+e5YMKKWenc/q7scRWNnrCREvlkP8I7zKYR0exvpHPIA3xIlhyUxY
        ECY/c8NWosdwZl395O6KXsaIH5JjFoX0otSVsFBaVro6xDUCaP99Xfd93+JyBAlbxHw5Lj
        5Vdz1KEw2I3PZwxuw/XY7J1zkXozQeY=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-225-jS1ybV9RN8icw4kAbLbQAw-1; Wed, 01 Mar 2023 10:09:52 -0500
X-MC-Unique: jS1ybV9RN8icw4kAbLbQAw-1
Received: by mail-ed1-f69.google.com with SMTP id t9-20020a056402524900b004af59c073abso19564973edd.6
        for <platform-driver-x86@vger.kernel.org>; Wed, 01 Mar 2023 07:09:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T7hjrRmCf/g+G1gciwM0bmknKtmUm3wa7BW6se88ASQ=;
        b=zrUww+lTh/PhHQrf1LY7kDPnmJqB3Q1IFVS5jE0mR//wdTgzXqkapwC+nS2nA5wWyu
         t+sCue91rv/Os+DBcVhFJcg0Zn+vmBOGdyiqkb1/Iwta0t6hMQr9jsYKu0mrZVVuyC2h
         cKfUyzFOOcX3DFM1e8GSXq3jL2oXdkrZE3xiWiy6ZW2Br50INUsMTzjZDccIRa0NHOVi
         95nbzD4QAKp4eYsSbgilWDReUY6e1cjpQS81fF2MdK7E3iiAoeVmeTh6JtWfpnS9i0CE
         bKqLLirxugCva/CMtweROZHLdP7p7Iqa9h7Bx49TMbi+uGWX8aJJxDWtDH0phKkqp0YV
         jhzg==
X-Gm-Message-State: AO0yUKV0i0m5HLzXhRsv5M80Gj/5H8TsJ1Q+CKZvke3Qmg7kYlzEG8L4
        HslDyGXW7rr6Q3LcaUXJAv0ZINmq78OgATMu+BSU60GSsPnZjdAicucOthxJyCCbMElfkM2imNu
        Su03HIkhYsbqTmmg41BbTChkn4Lga1RhKGQ==
X-Received: by 2002:a17:906:e0cb:b0:8af:370b:da59 with SMTP id gl11-20020a170906e0cb00b008af370bda59mr7667749ejb.17.1677683388436;
        Wed, 01 Mar 2023 07:09:48 -0800 (PST)
X-Google-Smtp-Source: AK7set+70rx7GuB6DkF1OfI8nGW24gGFgvqbdHwmBkSAqAy4I6vCMAJiKx2GZJ3zQ+u2pnQ+k7vrCQ==
X-Received: by 2002:a17:906:e0cb:b0:8af:370b:da59 with SMTP id gl11-20020a170906e0cb00b008af370bda59mr7667726ejb.17.1677683388164;
        Wed, 01 Mar 2023 07:09:48 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id h11-20020a17090634cb00b008e36f9b2308sm5872671ejb.43.2023.03.01.07.09.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Mar 2023 07:09:47 -0800 (PST)
Message-ID: <f97fbf83-dd20-0596-14e8-abbe5d0c4f28@redhat.com>
Date:   Wed, 1 Mar 2023 16:09:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH V3 1/1] platform/x86: Add BIOS Dynamic SAR driver for
 Intel M.2 Modem
Content-Language: en-US, nl
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>,
        Shravan S <s.shravan@intel.com>, mgross@linux.intel.com,
        platform-driver-x86@vger.kernel.org
Cc:     sudhakar.an@intel.com
References: <20210602050149.6230-1-s.shravan@intel.com>
 <20210602050149.6230-2-s.shravan@intel.com>
 <76868eb4-02c4-93dc-8cb7-2257be8ade8d@redhat.com>
 <0126d03d-893d-3df4-67d8-586c73426f36@metux.net>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <0126d03d-893d-3df4-67d8-586c73426f36@metux.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Enrico,

On 2/17/23 21:27, Enrico Weigelt, metux IT consult wrote:
> On 02.08.21 10:59, Hans de Goede wrote:
> 
> <snip>
> 
>> The driver itself does not limit the tx strength, it only provides information
>> which is used by other software to determine the max safe tx strength, please
>> update the description to reflect this.
> 
> Also missing specification of the actual meaning of this data, and how
> to calculate max safe tx from that.
> 
> I hightly doubt we want proprietary / largely undocumented userland
> abi's in the kernel. The general rule for userland abi is that once
> introduced, shouldn't get any breaking changes, and should be applicable
> to all devices of the same class (independent from hw vendor/model)

This driver has long since been merged and AFAIK is being used
in production now, so this ship has long sailed since.

One remark which I do have here is that this implementation is
actually one of the least bad implementation of the whole SAR
stuff where WWAN modems dynamically adjust there tx power based
on if part of a humanbody is near the antenna or not.

This is all shrouded in secrecy and related to certification
processes in several countries. The way this specific driver /
interface works is that we simply have:

1) Kernel reads human-presence sensor info through standardized
ACPI interface (contents is unknown, but the interface for getting
the blob with readings is standard)

2. ModemManager reads human-presence sensor info from kernel
and sends this to the modem as part of the normal command stream
between ModemManager and the modem. ModemManager needs to be
in the loop here since it owns the interface to the modem.

This is much better then what some other WWAN modem vendors
have been trying to push where the process involves not only
mystery firmware APIs, but also a closed-source userspace process
to manage the dynamic SAR bits. So Intel's implementation where
all we need to do is to proxy between the BIOS/EC firmware and
the modem (because the EC cannot talk directly to the modem)
is actually pretty decent (compared to the other stuff).

Regards,

Hans



