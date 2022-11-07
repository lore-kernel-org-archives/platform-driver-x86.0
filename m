Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD413C4332F
	for <platform-driver-x86@archiver.kernel.org>; Mon,  7 Nov 2022 10:14:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231243AbiKGKOQ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 7 Nov 2022 05:14:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230427AbiKGKON (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 7 Nov 2022 05:14:13 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0232318E16
        for <platform-driver-x86@vger.kernel.org>; Mon,  7 Nov 2022 02:13:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1667815992;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=OnkCpzdxA7dlarb5Ahw5Og4vN2JWaNynEbVCebohAiM=;
        b=UzK6hjptaAMJx0zYi/qpszOMZep3UdYxHwPT5bNp8J9Kwjh14WaHDBQvptDc/HAvRsiW7T
        yC9Bvn4/ZudGtbvCdvUVGjephvY8Be0qP/D3UFgvOlxRE8uP6/nhnpcktwDpyFCsdiuV2t
        RchzIPvBnWLn5/+MyGCiRdu836AuFyo=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-146-LM9PjO9CPwK3prUsjnV6XQ-1; Mon, 07 Nov 2022 05:13:11 -0500
X-MC-Unique: LM9PjO9CPwK3prUsjnV6XQ-1
Received: by mail-ed1-f71.google.com with SMTP id q13-20020a056402518d00b00462b0599644so8118209edd.20
        for <platform-driver-x86@vger.kernel.org>; Mon, 07 Nov 2022 02:13:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OnkCpzdxA7dlarb5Ahw5Og4vN2JWaNynEbVCebohAiM=;
        b=rhH3g+cXVEZX1Cz/EGIiM/UBtqRObvxHoH2VhXPyPtyitfSibT1QX6fVYJgBK1C1VP
         q5+veE8fxXU10ZRcIXWOMfFstoLml36pf7dZpXFRIQaDZ1m6XrNbQiGWX/21/bJQKrIz
         FOvnP+MS8BsBGwVKoNVtNIGpYWpSPWQlFtvZmUXP6l+wSaDXFvHIwgnHrtRAbB9XWlp4
         HJI2tScd/q9YjNZ+nnvPXoon/HXoeW3Gh9dgRpFJxdkSGIBsUDT2sxQoNCu5eqmQWF3y
         4zmvcHFbOTljorHra4I8l4LWvHS8Ay8ixkhMiEpARCS/4Th2faWZ+nF+naNMN5AQk3kU
         hrTw==
X-Gm-Message-State: ACrzQf11ckPWfO0vE7mmO+qluJcEcQYQc2PY0j02qUV5u7W0bAWGnG8t
        yUBoGR1KqgMYjFW9fhQxkhIfyUAtoBeczBD8pI9bqwzZ8BulV7MRPH4n7LH07lLy5h8+cO+pq3v
        Bcsh2q8gv4f5jIoDd6XW92Ky0ONRcSSzLqA==
X-Received: by 2002:a17:906:4bd3:b0:731:3bdf:b95c with SMTP id x19-20020a1709064bd300b007313bdfb95cmr48428765ejv.677.1667815989595;
        Mon, 07 Nov 2022 02:13:09 -0800 (PST)
X-Google-Smtp-Source: AMsMyM7pik6AqKSJlKF5q3zisoYu//K7/2g4LdohroAlP4C6cxeo7s6xFg7MtTFXqnXHGev7RJqLfA==
X-Received: by 2002:a17:906:4bd3:b0:731:3bdf:b95c with SMTP id x19-20020a1709064bd300b007313bdfb95cmr48428743ejv.677.1667815989350;
        Mon, 07 Nov 2022 02:13:09 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id lc24-20020a170906dff800b0078d4e39d87esm3215943ejc.225.2022.11.07.02.13.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Nov 2022 02:13:08 -0800 (PST)
Message-ID: <a6ec6542-9821-36dd-3be1-4cd9f34081c7@redhat.com>
Date:   Mon, 7 Nov 2022 11:13:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [BUG] Intel PECI Overheating
Content-Language: en-US
To:     Victor Stewart <v@nametag.social>,
        platform-driver-x86@vger.kernel.org
References: <CAM1kxwh7DQoZBcU-s-pkbhpWGieQ3QGHd89zjTbeoFYo7h9zHg@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAM1kxwh7DQoZBcU-s-pkbhpWGieQ3QGHd89zjTbeoFYo7h9zHg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Victor,

On 10/25/22 14:16, Victor Stewart wrote:
> i have an Intel NUC6i7KYB on my LAN that i use for dev running Clear
> Linux 6.0.2-1201.native on Intel(R) Core(TM) i7-6770HQ CPU @ 2.60GHz.
> 
> i can't pinpoint exactly when but sometime in the last 2 months the
> fan, normally silent, after a certain amount of idle time post boot,
> the fan suddenly goes wild and then does not stop until the device is
> rebooted.
> 
> i finally decided to look into this the other day and saw that the
> only temp critical component is the PECI Agent 0 as seen below, and
> then saw that support for this component was added in Linux 5.18.
> 
> so there must be a bug somewhere. let me know what data i can gather
> or what other information you need to help solve this.

It is probably better to resend this email to the linux-hwmon@vger.kernel.org
list, I expect the people there to be able to provide more insight.

Regards,

Hans


> 
> root@clr-5c27a0d08c52445f9231f0c9c48a96b6~ # sensors
> iwlwifi_1-virtual-0
> Adapter: Virtual device
> temp1:        +51.0°C
> 
> acpitz-acpi-0
> Adapter: ACPI interface
> temp1:        +27.8°C  (crit = +119.0°C)
> temp2:        +29.8°C  (crit = +119.0°C)
> 
> coretemp-isa-0000
> Adapter: ISA adapter
> Package id 0:  +40.0°C  (high = +100.0°C, crit = +100.0°C)
> Core 0:        +36.0°C  (high = +100.0°C, crit = +100.0°C)
> Core 1:        +36.0°C  (high = +100.0°C, crit = +100.0°C)
> Core 2:        +35.0°C  (high = +100.0°C, crit = +100.0°C)
> Core 3:        +38.0°C  (high = +100.0°C, crit = +100.0°C)
> 
> nvme-pci-3d00
> Adapter: PCI adapter
> Composite:    +84.8°C  (low  = +109.8°C, high = +109.8°C)
>                        (crit = +129.8°C)
> Sensor 2:     +98.8°C  (low  = +109.8°C, high = +109.8°C)
> 
> nct6776-isa-0a00
> Adapter: ISA adapter
> in0:                   688.00 mV (min =  +0.00 V, max =  +1.74 V)
> in1:                     1.23 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
> in2:                     3.31 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
> in3:                     3.31 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
> in4:                   952.00 mV (min =  +0.00 V, max =  +0.00 V)  ALARM
> in5:                     0.00 V  (min =  +0.00 V, max =  +0.00 V)
> in6:                   608.00 mV (min =  +0.00 V, max =  +0.00 V)  ALARM
> in7:                     3.30 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
> in8:                     3.18 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
> fan1:                     0 RPM  (min =    0 RPM)
> fan2:                  5212 RPM  (min =    0 RPM)
> SYSTIN:                 +58.0°C  (high = +80.0°C, hyst = +75.0°C)
> sensor = thermistor
> CPUTIN:                 +45.5°C  (high = +80.0°C, hyst = +75.0°C)
> sensor = thermistor
> AUXTIN:                 +49.0°C  (high = +80.0°C, hyst = +75.0°C)
> sensor = thermistor
> PCH_CHIP_TEMP:           +0.0°C  (high =  +0.0°C, hyst =  +0.0°C)  ALARM
> PCH_CHIP_CPU_MAX_TEMP:  +59.0°C  (high = +80.0°C, hyst = +75.0°C)
> PECI Agent 0:          +100.0°C  (high = +80.0°C, hyst = +75.0°C)
>                                  (crit = +100.0°C)
> PCH_CPU_TEMP:            +0.0°C
> intrusion0:            OK
> intrusion1:            OK
> beep_enable:           disabled
> 
> pch_skylake-virtual-0
> Adapter: Virtual device
> temp1:        +59.0°C
> 
> nvme-pci-3e00
> Adapter: PCI adapter
> Composite:    +38.9°C  (low  =  -0.1°C, high = +74.8°C)
>                        (crit = +79.8°C)
> 

