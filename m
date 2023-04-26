Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95C6BC7618E
	for <platform-driver-x86@archiver.kernel.org>; Wed, 26 Apr 2023 12:45:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241033AbjDZMpX (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 26 Apr 2023 08:45:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241032AbjDZMos (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 26 Apr 2023 08:44:48 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AA2661A9
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Apr 2023 05:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1682512926;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=N5DM8uFRDHl/3yHn+2axRN4cpB2/Yn2dxraiQxNEcRs=;
        b=OQ5yd0wQ/wiIL0yEPLBSlNY7ovRUh3nvdb4bE1ojjhRpau2PV7CJo331qreobViH4VmwPh
        TG0IrKybnQjAdSj/Gi9fH5x7YlCxvovh0kYs7ZUZmS3vsH1VeoN1qSTr4fJIHpGnd6QaLg
        eydOgM2JYzuY3IP8wszYadWqOb0WMnY=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-375-kaVzCD6WMNSiod6S8LRakw-1; Wed, 26 Apr 2023 08:42:05 -0400
X-MC-Unique: kaVzCD6WMNSiod6S8LRakw-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-94ec76d7a26so664584166b.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Apr 2023 05:42:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682512924; x=1685104924;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N5DM8uFRDHl/3yHn+2axRN4cpB2/Yn2dxraiQxNEcRs=;
        b=NQ9fk6dS9B2DVfEnby+D3+xE/msp+v4NjsPA2pnnCtAU/LukITJV2sVK5o/rMSNns9
         WUrGZRmhJVpQ8Q0jilOU3D58Yo7NuBp1FoKJ0T19Li1Aq+pYmBjt10JqjThA3sf2mUwV
         MfATg/nYSrpRSsExy2fivdi/tnCcGd+bLLg47lnksOyT5C7+gB16Ajf8NgrDV8pcblCg
         1WPpaOWqDILjzTZ5nV3FlioJ7QlM3zgBsBW7+/8iOfz1f0UFVqid/Ru1J++TZH4BWQkZ
         TRhpd9X3g7dIPelKscjVVwaX2hNfkbVjmpYtacC25D5OseEKhnXARLcvThXkZCYiR+QP
         6XJw==
X-Gm-Message-State: AAQBX9dzdYDFwvWQ3hFG2EfhTxOKXIb8H5wZRe1vCNp5onKgWE1L2OvV
        epDRVHPW3/t0XQ1Th++oVpL5mtnl5FOMho1PZE4ibIfF0vWi+tQqy7Ta+7KiMixC5j1/stqg4ia
        jsJJxxZg0t1I/DmAGV/tmAsBCp7BmOC+WEYlPhnMxrg==
X-Received: by 2002:a17:907:d092:b0:959:6fb2:1c35 with SMTP id vc18-20020a170907d09200b009596fb21c35mr9999714ejc.60.1682512923891;
        Wed, 26 Apr 2023 05:42:03 -0700 (PDT)
X-Google-Smtp-Source: AKy350bvXKOYJy6okWIZQECAi2PCDtQ0dPgUVzmT7RubNUWIJbMHxurZWDEmVVfiERP74ogwTR7r/g==
X-Received: by 2002:a17:907:d092:b0:959:6fb2:1c35 with SMTP id vc18-20020a170907d09200b009596fb21c35mr9999703ejc.60.1682512923548;
        Wed, 26 Apr 2023 05:42:03 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id f15-20020a056402150f00b00506adf55ae2sm6742648edw.6.2023.04.26.05.42.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Apr 2023 05:42:02 -0700 (PDT)
Message-ID: <d632fa2f-e94f-2958-c899-480afa9354c3@redhat.com>
Date:   Wed, 26 Apr 2023 14:42:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 0/4] platform/x86: wmi: Add subsystem documentation
Content-Language: en-US, nl
To:     Armin Wolf <W_Armin@gmx.de>, markgross@kernel.org,
        rdunlap@infradead.org
Cc:     corbet@lwn.net, linux-doc@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230424222939.208137-1-W_Armin@gmx.de>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230424222939.208137-1-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Armin,

On 4/25/23 00:29, Armin Wolf wrote:
> Currently, there is no recent documentation available for writing WMI
> drivers using the modern bus-based interface. This leads to developers
> using the deprecated GUID-based interface when developing new drivers,
> causing issues with notification handling when multiple WMI devices sharing
> the same notification ID are present. There is also no way for WMI
> drivers to add device specific documentation at the moment.
> Add documentation for the WMI subsystem to solve those issues. The
> device specific documentation currently onyl include documentation for
> the wmi-bmof driver, but more is expected to follow.

Thank you for your patch series, I've applied this series
to my review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Patches which are added to review-hans now are intended for
the next rc1. This branch will get rebased to the next rc1 when
it is out and after the rebasing the contents of review-hans
will be pushed to the platform-drivers-x86/for-next branch.

Regards,

Hans


> ---
> Changes in v2:
> - spelling fixes
> - tell readers that MOF means Managed Object Format
> - 80-cloumn limit
> 
> Armin Wolf (4):
>   platform/x86: wmi: Add kernel doc comments
>   platform/x86: wmi: Mark GUID-based WMI interface as deprecated
>   platform/x86: wmi: Add documentation
>   platform/x86: wmi: Add device specific documentation
> 
>  .../ABI/stable/sysfs-platform-wmi-bmof        |  7 ++
>  Documentation/driver-api/index.rst            |  1 +
>  Documentation/driver-api/wmi.rst              | 21 ++++
>  Documentation/subsystem-apis.rst              |  1 +
>  Documentation/wmi/acpi-interface.rst          | 96 +++++++++++++++++++
>  Documentation/wmi/devices/index.rst           | 22 +++++
>  Documentation/wmi/devices/wmi-bmof.rst        | 25 +++++
>  Documentation/wmi/index.rst                   | 19 ++++
>  MAINTAINERS                                   |  9 ++
>  drivers/platform/x86/Kconfig                  |  4 +-
>  drivers/platform/x86/wmi.c                    | 63 +++++++++---
>  include/linux/wmi.h                           | 41 +++++++-
>  12 files changed, 289 insertions(+), 20 deletions(-)
>  create mode 100644 Documentation/ABI/stable/sysfs-platform-wmi-bmof
>  create mode 100644 Documentation/driver-api/wmi.rst
>  create mode 100644 Documentation/wmi/acpi-interface.rst
>  create mode 100644 Documentation/wmi/devices/index.rst
>  create mode 100644 Documentation/wmi/devices/wmi-bmof.rst
>  create mode 100644 Documentation/wmi/index.rst
> 
> --
> 2.30.2
> 

