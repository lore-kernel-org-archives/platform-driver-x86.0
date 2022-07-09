Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89483C433EF
	for <platform-driver-x86@archiver.kernel.org>; Sat,  9 Jul 2022 14:48:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229642AbiGIOsU (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 9 Jul 2022 10:48:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229503AbiGIOsT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 9 Jul 2022 10:48:19 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 46F8F25B
        for <platform-driver-x86@vger.kernel.org>; Sat,  9 Jul 2022 07:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1657378097;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=VLQSiBSYXaiYR0Ew7PdiVWeTwrVfhMdeI5Zm0PhD4Pg=;
        b=JYMIy/iQX1CzEVUnjLVyLQ0ng7F/i3tQdugOes5kwMatXtXHyyQCilAKbz6oBb8D51+rjH
        90DXQr7sLHwdiyfO9co3s/NqEWHL/xr3X2wq5ZFbGnvF4g2wBuCazNFCvDNmCjp5WIGM7J
        WGHdaD8w7OcJoIpDPQDwZUAoiIOYnSQ=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-247-shwV_ofuOKKV8dja8s9voA-1; Sat, 09 Jul 2022 10:48:16 -0400
X-MC-Unique: shwV_ofuOKKV8dja8s9voA-1
Received: by mail-ed1-f71.google.com with SMTP id y6-20020a056402270600b00433940d207eso1127628edd.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 09 Jul 2022 07:48:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=VLQSiBSYXaiYR0Ew7PdiVWeTwrVfhMdeI5Zm0PhD4Pg=;
        b=X+I7bSK64hsA9Oa8NbDfu1Z8c8iEfV9M0aBT5QFRQR8g+S23MPqWm9ff4lpxJbVgAB
         GKNRP6Gfntcv5ShEcIZQMIZDcJU5eegZB7pQ4tL9FCkKdfFyVz5IH/2j6on1fvWat9j7
         GDT+K3tPxo095hQWXRgX5IfK5QjfiHZDMp97lRnOuxseiKPrFyLV/hnR4CbR2QBZJoKn
         yafGRT95kZUzOH6h+Ldf8CurlClvW0ZP2FBcGvGZwKJK5CbmnWpGxjxYbDQoZe8xk7BS
         Wp2qcZmAopXzyluFqefNkDwrVmcPcQr+XFtE1Qc2ZUnTFhGl9wrJjUwmp4UlOo+KVlNr
         MBJQ==
X-Gm-Message-State: AJIora/AU03ovYoMQRLEFFqhTyJF7/9UFB5NVx4sPB6hmD48U82q1f1N
        JI+wNT4GMhnJfj5mOH6MIAeSLm5AsdKC0NYRJH0Wyg4lQxxGHcg3VJMq0uzOmNmAbMjJb+MR2YD
        STFnTyhKDemFtiwnPKouzQnS5yTcyvILojA==
X-Received: by 2002:a17:907:2cea:b0:72a:f6c9:8a26 with SMTP id hz10-20020a1709072cea00b0072af6c98a26mr9338383ejc.206.1657378095087;
        Sat, 09 Jul 2022 07:48:15 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vf63NX/Ri2F/NXTNyou1769psU2EzxKL8ExuUadMlJju8h/nj9voivpSW4cXtAwJ3feKTV0A==
X-Received: by 2002:a17:907:2cea:b0:72a:f6c9:8a26 with SMTP id hz10-20020a1709072cea00b0072af6c98a26mr9338368ejc.206.1657378094902;
        Sat, 09 Jul 2022 07:48:14 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id 14-20020a170906318e00b00715705dd23asm665386ejy.89.2022.07.09.07.48.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Jul 2022 07:48:14 -0700 (PDT)
Message-ID: <5c6c0516-7540-b668-9e7d-95db44ff336d@redhat.com>
Date:   Sat, 9 Jul 2022 16:48:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 1/1] platform/x86: asus-wmi: Add mic-mute LED classdev
 support
Content-Language: en-US
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        PaddyKP_Yao <ispaddy@gmail.com>
Cc:     Mark Gross <mgross@linux.intel.com>,
        Corentin Chary <corentin.chary@gmail.com>,
        Luke Jones <luke@ljones.dev>, PaddyKP_Yao@asus.com,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        acpi4asus-user <acpi4asus-user@lists.sourceforge.net>
References: <20220708084816.1140540-1-PaddyKP_Yao@asus.com>
 <20220708090731.1237488-1-PaddyKP_Yao@asus.com>
 <CAHp75Vc-5Py8heCJ4bKh1-7y+U+ycJxRuYdFwiT=NM5=gLqwQw@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75Vc-5Py8heCJ4bKh1-7y+U+ycJxRuYdFwiT=NM5=gLqwQw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/9/22 13:44, Andy Shevchenko wrote:
> You have sent two patches with the same version, your submission
> confuses everybody, which one are we supposed to consider?

Also the From of this email: PaddyKP_Yao <ispaddy@gmail.com> and
the Signed-off-by:

> 
> On Fri, Jul 8, 2022 at 11:08 AM PaddyKP_Yao <ispaddy@gmail.com> wrote:
>>
>> In some new ASUS devices, hotkey Fn+F13 is used for mic mute. If mic-mute
>> LED is present by checking WMI ASUS_WMI_DEVID_MICMUTE_LED, we will add a
>> mic-mute LED classdev, asus::micmute, in the asus-wmi driver to control
>> it. The binding of mic-mute LED controls will be swithched with LED
> 
> switched
> 
>> trigger.
> 
> ...
> 
> Not reviewing code because of the above.
> 
> Hint: `git format-patch -vX ...`, where X is a version number will
> help. And when cooking a new version don't forget to add a changelog
> between versions.
> 

