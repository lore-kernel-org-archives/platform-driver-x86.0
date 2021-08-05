Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13B13C4338F
	for <platform-driver-x86@archiver.kernel.org>; Thu,  5 Aug 2021 08:40:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E953E610CD
	for <platform-driver-x86@archiver.kernel.org>; Thu,  5 Aug 2021 08:40:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239650AbhHEIkv (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 5 Aug 2021 04:40:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24542 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232749AbhHEIkv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 5 Aug 2021 04:40:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1628152837;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=fCMotf9NGHpviMDaMObiw2KipWwkcnOeBWdBBm4nl2E=;
        b=OSWcK0IiPqPP7UK22qBMprb4DhtmBkE7tYp3P3cwVs9t2GPcBa2wxAmhtmnRWRRiETr0Qr
        RR4ebeEAwGwjnh+7rl7zt+SKguSY9IT2Q05+1GoPclLCvHWsVYHSALiPqarvgO+MxJ/b4K
        htr96on5hkRbTG09GMmp4J+S9NtZlBA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-o4f53AxgMAqGZ1wRCC3fyQ-1; Thu, 05 Aug 2021 04:40:36 -0400
X-MC-Unique: o4f53AxgMAqGZ1wRCC3fyQ-1
Received: by mail-ed1-f72.google.com with SMTP id d6-20020a50f6860000b02903bc068b7717so2801816edn.11
        for <platform-driver-x86@vger.kernel.org>; Thu, 05 Aug 2021 01:40:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fCMotf9NGHpviMDaMObiw2KipWwkcnOeBWdBBm4nl2E=;
        b=hwmwQYMeHz/m6lKt6W4L7GKyiqsrbZGRAHqUMXDS6QV3u8DEkCAnVicVspRqwmqGwN
         gTLWMDCYx7oT83wDSUIp24/znbjvcXOG8qr4WC2Uzt9R+QbnHLbobVhS9RsScnDe9TSu
         ymRC4JUysS9l8hyd/iiCt+s7DJu+eLSSQW4mp0qBLgEnYLpGx/xfL1JJHDLgHnXLdK9F
         MIXnS9zFJLMIudN+bKQtJVeUJkOaTjCmsnZmmtRLrLTmMK53VkqV/Ge7KMXcbO7br5gl
         T9BOUiCvYCN6Jo3nczMX9u2eS6a6wwczltwzFVgFofhiNRdrqlAItL+HFyQR9RUx0wIa
         eMQQ==
X-Gm-Message-State: AOAM533ZnHeycKa/XSQ0wVpL690VIX2lsE1Bejwppwak7Sd+3JCN204t
        4rE8PqtKsNl9XbK6y5T/z/ualWiqZQiDv56qwcUldLGN2WCQqgO8LDXEBWZHk4tzYnogqCoHmeV
        dpq40Vw9cJ+JKfMKTJYP54m/jUxvRaCgkhg==
X-Received: by 2002:a17:906:af86:: with SMTP id mj6mr3750164ejb.144.1628152832017;
        Thu, 05 Aug 2021 01:40:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxOiWA4T9Yurh7IrUVWe62zfCVCLr8GfjYhdMlD6qzd0Wc1dz9ezbQY4IN8z3+YFtdKSL2Fdw==
X-Received: by 2002:a17:906:af86:: with SMTP id mj6mr3750149ejb.144.1628152831781;
        Thu, 05 Aug 2021 01:40:31 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id yc29sm1467505ejb.104.2021.08.05.01.40.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Aug 2021 01:40:31 -0700 (PDT)
Subject: Re: Mario's email is bounced
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Cc:     Mark Gross <mgross@linux.intel.com>, mario.limonciello@outlook.com
References: <CAHp75Ve_vzrojizyA4J3+z480LspsK4YeS-K2Am0dYggtDUrvw@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <0b40bc5e-7070-bb53-5de4-b5fde4832a0e@redhat.com>
Date:   Thu, 5 Aug 2021 10:40:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAHp75Ve_vzrojizyA4J3+z480LspsK4YeS-K2Am0dYggtDUrvw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/5/21 10:35 AM, Andy Shevchenko wrote:
> Since I have noticed that Mario's [old] mail is bounced (yeah, I know
> that it is my script downside by not checking each email) I was
> curious about his address in the meaningful files and what we have now
> is the below.
> 
> Documentation/ABI/testing/dell-smbios-wmi:4:Contact:    "Mario
> Limonciello" <mario.limonciello@dell.com>
> Documentation/ABI/testing/sysfs-bus-thunderbolt:235:Contact:    Mario
> Limonciello <mario.limonciello@dell.com>
> Documentation/ABI/testing/sysfs-class-firmware-attributes:5:
>  Mario Limonciello <mario.limonciello@dell.com>,
> Documentation/ABI/testing/sysfs-class-firmware-attributes:133:
>  Mario Limonciello <mario.limonciello@dell.com>,
> Documentation/ABI/testing/sysfs-class-firmware-attributes:223:
>  Mario Limonciello <mario.limonciello@dell.com>,
> Documentation/ABI/testing/sysfs-class-firmware-attributes:252:
>  Mario Limonciello <mario.limonciello@dell.com>,
> Documentation/ABI/testing/sysfs-platform-dell-smbios:4:Contact: "Mario
> Limonciello" <mario.limonciello@dell.com>
> Documentation/ABI/testing/sysfs-platform-intel-wmi-thunderbolt:4:Contact:
>       "Mario Limonciello" <mario.limonciello@dell.com>
> Documentation/ABI/testing/sysfs-power:298:Contact:      Mario
> Limonciello <mario.limonciello@dell.com>
> 
> I think it needs to be fixed one way or another.

Right, we have 2 alternatives email addresses here:

1. mario.limonciello@outlook.com
2. Dell.Client.Kernel@dell.com

I thank that in the following the address should be changed to the Dell.Client.Kernel address:
Documentation/ABI/testing/dell-smbios-wmi
Documentation/ABI/testing/sysfs-platform-dell-smbios

And in the rest it is probably best to use Mario's new
personal address.

Mario, do you agree with this?

Regards,

Hans

