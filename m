Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D746C433F5
	for <platform-driver-x86@archiver.kernel.org>; Thu, 25 Nov 2021 15:37:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240693AbhKYPkY (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 25 Nov 2021 10:40:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58248 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241381AbhKYPiY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 25 Nov 2021 10:38:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1637854513;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=bIK0QuoYyQY4Kt6s7G4tDaYZ+A6ZEqySEX6Pr0cuWRE=;
        b=L6cuE3JIN+e/T1gAwkxfTdvj0enJ1egZoRHO1Gs2w0DKx/9YUT8OIn4e+fOwUs+qK6V4GR
        0XLRMfNkl0bxypg+kizuIt3kvhWUYscaHHGG7GaK5fIR8gIEtyyAxMzzFUk8Z9Bx/eVf0/
        j3OfCEOPdp/dCMQh31+9goUuFxXHrSo=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-57-DacOoY9xNSy02hOlYLn9cw-1; Thu, 25 Nov 2021 10:35:11 -0500
X-MC-Unique: DacOoY9xNSy02hOlYLn9cw-1
Received: by mail-ed1-f69.google.com with SMTP id w18-20020a056402071200b003e61cbafdb4so5783816edx.4
        for <platform-driver-x86@vger.kernel.org>; Thu, 25 Nov 2021 07:35:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=bIK0QuoYyQY4Kt6s7G4tDaYZ+A6ZEqySEX6Pr0cuWRE=;
        b=nB34hvG6nGHow3cqyVTaraMqcMg9HkX0QDJft6hdfRfq1pjXoFBgmVOguwo+/x33uu
         Mp8eoj/xhq0ctDRvrlsIL7zM9vTIavUAxXv0aJi12AVuyOGthVowEPd8PSXxDdTXwEeg
         U8kT4QVu6Jm3qXe7DqOp2Lv1gtZJosx69PVINb1WQvb4MVfEY8Tl9cnL8pcqgm2m+hIk
         Ky921/dVhtTzOwk1N/94SDR8nvcVXhpCjErxiWj75298XS7SuOmyKWQ6xn8tmIPIfqnf
         9+WxCc5Btmn57i2q1Y6YyylDOMhZsCpeYCy3gh90YqdO+oBs+FG9g2tl0BuY60w8vWWg
         3TEw==
X-Gm-Message-State: AOAM532gouE6y1FGNItcrmRNspQn9dEeW7usg94JrooZ19yeijlSTAuK
        1VtjM297Y0wIma6Pavt12ISLORvzfQ+VVbHcEOQwO6wN4Oc1BaqBsCChQJvp5j5nOAHI3sBaLEB
        cSMYPrkQQcopAJ/v4EG40F13irNKuLjHAmw==
X-Received: by 2002:a17:906:2b16:: with SMTP id a22mr31196148ejg.447.1637854510511;
        Thu, 25 Nov 2021 07:35:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx89iYWX+kjo3ELeT8XqFH24cJ3VIzilVPBXuNn9CKEs6hzogZarMVdoWHvr8ufb/3jGsBWIg==
X-Received: by 2002:a17:906:2b16:: with SMTP id a22mr31196121ejg.447.1637854510306;
        Thu, 25 Nov 2021 07:35:10 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id v13sm1626608ejo.36.2021.11.25.07.35.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Nov 2021 07:35:09 -0800 (PST)
Message-ID: <5baa89c2-aee9-a6d8-c05e-ffb4cea05ac0@redhat.com>
Date:   Thu, 25 Nov 2021 16:35:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 0/6] platform/x86: thinkpad_acpi: 4 bug-fixes + 2 cleanups
Content-Language: en-US
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Mark Pearson <markpearson@lenovo.com>
Cc:     Len Baker <len.baker@gmx.com>, platform-driver-x86@vger.kernel.org
References: <20211123210424.266607-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20211123210424.266607-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi all,

On 11/23/21 22:04, Hans de Goede wrote:
> Hi All,
> 
> Here is a thinkpad_acpi series with 4 bug-fixes fixing various bugs
> which I missed while merging the big patch to move to dev_groups +
> 2 small cleanups on top.
> 
> The first bug-fixes is 5.16-rc# material since one initial patch
> to move the hotkeys stuff to using is_visible already landed in 5.16-rc1.

I've added this series to my review-hans branch now.

Regards,

Hans


> Hans de Goede (6):
>   platform/x86: thinkpad_acpi: Restore missing hotkey_tablet_mode and
>     hotkey_radio_sw sysfs-attr
>   platform/x86: thinkpad_acpi: Register tpacpi_pdriver after subdriver
>     init
>   platform/x86: thinkpad_acpi: tpacpi_attr_group contains driver
>     attributes not device attrs
>   platform/x86: thinkpad_acpi: Fix the hwmon sysfs-attr showing up in
>     the wrong place
>   platform/x86: thinkpad_acpi: Remove unused
>     sensors_pdev_attrs_registered flag
>   platform/x86: thinkpad_acpi: Move input_unregister_device() to the top
>     of thinkpad_acpi_module_exit()
> 
>  drivers/platform/x86/thinkpad_acpi.c | 113 ++++++++++++++++-----------
>  1 file changed, 66 insertions(+), 47 deletions(-)
> 

