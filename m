Return-Path: <SRS0=xf+z=EP=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0579EC2D0A3
	for <platform-driver-x86@archiver.kernel.org>; Mon,  9 Nov 2020 13:44:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ACCB9206B2
	for <platform-driver-x86@archiver.kernel.org>; Mon,  9 Nov 2020 13:44:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bQZ6wAne"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730056AbgKINoP (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 9 Nov 2020 08:44:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34032 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1733109AbgKINoP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 9 Nov 2020 08:44:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1604929453;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=EhLrlZR750q/TJAy3g5kRmGJZZN0qTggRIpS7NO20xM=;
        b=bQZ6wAneTKxHKSKkuaNDI9TTCic0gUQdUU4h/aSbdSkyt4wIrtiUrtcf5qRN6qy1aBG4fO
        3tGJS/U/cRqyNyPxdw9/xSRSM+Bj/xu+cqe8qQdJX90iR416wzm+sI6MlV7EerfwhoxbPU
        NeLwRNcPxhTbwdE9Uf8/eu40030+1TE=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-543-dAIifHkbP5ydR1T9er0zYg-1; Mon, 09 Nov 2020 08:44:10 -0500
X-MC-Unique: dAIifHkbP5ydR1T9er0zYg-1
Received: by mail-ej1-f69.google.com with SMTP id v21so3441320ejy.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 09 Nov 2020 05:44:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=EhLrlZR750q/TJAy3g5kRmGJZZN0qTggRIpS7NO20xM=;
        b=LV4Moc+L/AemrhwlSfzJtbQima54080RIh8QsnR7p3UUOGHfJNuNj2TlbEX3U6Ouj5
         Fevbz2a15Louidar4dZIV1jSFsMPDbuP8a9DeezXAcP7stb62lAIGdRtn13aI8zxRrpR
         wUUI012KfNEJ10oV56QUjra/PxofKVuL3MrjJhmH67xifiW6qLp/uiTuVnNl4vS9kO8o
         8iOwqhhAx22O2muKXhDlCupio8AMMoZNPArMlzVQuIhswW9jbmGM05NEE2xdTF0q/4l7
         KIdjLTICREBhEsrbKAl3jzXIqZ/wMwVA5tuGSpPDfecJ/t8pL+Udrw8EVQrWMMddtXKZ
         2M5w==
X-Gm-Message-State: AOAM533cf9cPZvQ613ZcW+w8hizhU9/RQhfmp8Wa7dSvmLaXkfPb07mR
        R1e52bNsiJUdPEorbx9zRyAqCqLLKG9keVtPA267ADs6LbfVUHJQg7ku8ia3N5H+KqNM5dASjSn
        p2fCiasTO1eZYChU7XCAc40qw9sLtEw/eqg==
X-Received: by 2002:a17:906:b294:: with SMTP id q20mr14952202ejz.234.1604929449337;
        Mon, 09 Nov 2020 05:44:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxtLJ8fLGj7WpNaYj9YSHYnbBMcrUDZjsvQkW9EkOEgkioHsLjLqrLsV04Fu48WZxOR21DDmA==
X-Received: by 2002:a17:906:b294:: with SMTP id q20mr14952194ejz.234.1604929449184;
        Mon, 09 Nov 2020 05:44:09 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
        by smtp.gmail.com with ESMTPSA id re10sm33509ejb.45.2020.11.09.05.44.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2020 05:44:08 -0800 (PST)
Subject: Re: HP Zbook studio G5 Brightness and mic mute keys give same
 scancode
To:     Andy Shevchenko <andy.shevchenko@gmail.com>, thestroyer@cock.li
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>,
        Mark Gross <mgross@linux.intel.com>
References: <d2753cb4ca4d0d819d5a76b0a076e281@cock.li>
 <CAHp75VfTXieJws5gB70L5grsc0f_SFo+sNv1ySmt37aOUa6TmA@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <97c507c1-21a9-2b77-5d07-09cfcd93ca39@redhat.com>
Date:   Mon, 9 Nov 2020 14:44:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <CAHp75VfTXieJws5gB70L5grsc0f_SFo+sNv1ySmt37aOUa6TmA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/5/20 5:47 PM, Andy Shevchenko wrote:
> +Cc: subsystem maintainers
> 
> On Sun, May 17, 2020 at 2:24 PM <thestroyer@cock.li> wrote:
>>
>> Hi,
>> On my HP Zbook studio G5 a few keys on my keyboard give the same
>> scancodes. Most notably, the brightness and mute function keys all give
>> the scan code sequence 0xe0 0x20 0xe0 0xa0 as reported by showkey
>> --scancodes. It only produces a scancode when pressed, not when
>> released. I found another very similar issue in this mailing list found
>> in https://www.spinics.net/lists/platform-driver-x86/msg16791.html. The
>> issue in that mail was solved by a bios update. I'm running the latest
>> bios, but I still have the issue.
>> I tried the kernels: Manjaro 5.7rc4-1, Manjaro 5.6.11-1 and Manjaro
>> 5.4.39-1
>> I also tried a few other distributions, but they all have the same
>> issue.
>> I'm happy to provide more information about this issue if needed.

So this already came in another thread for another HP laptop model,
this seems to be a common issue on some (newer?) HP laptop models.

It seems that we need to make some special WMI calls for this, either
to figure out which key is actually pressed when receiving the
PS/2 scancode which is shared between multiple keys. Or to get the
device to send different scancodes.

This will require someone with some knowledge of ACPI/WMI as well
as of writing kernel code to get physical access to an affected HP
laptop to figure out what is going on and write some code to deal with
this special setup.

Regards,

Hans

