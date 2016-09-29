From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH] intel-hid: new hid event driver for hotkeys
Date: Thu, 29 Sep 2016 09:02:48 -0700
Message-ID: <CAKdAkRQTw1KDJE_EmYeYAaVy0od-mnShmDax46Kh8Xcq6Ec4kw@mail.gmail.com>
References: <1450337402-4178-1-git-send-email-alex.hung@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-vk0-f46.google.com ([209.85.213.46]:35116 "EHLO
        mail-vk0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751710AbcI2QCu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 29 Sep 2016 12:02:50 -0400
Received: by mail-vk0-f46.google.com with SMTP id 192so79027948vkl.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 29 Sep 2016 09:02:49 -0700 (PDT)
In-Reply-To: <1450337402-4178-1-git-send-email-alex.hung@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Alex Hung <alex.hung@canonical.com>
Cc: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@amacapital.net>

Quite a bit late, but still:

On Wed, Dec 16, 2015 at 11:30 PM, Alex Hung <alex.hung@canonical.com> wrote:
> +
> +static int __init intel_hid_init(void)
> +{
> +       acpi_walk_namespace(ACPI_TYPE_DEVICE, ACPI_ROOT_OBJECT,
> +                           ACPI_UINT32_MAX, check_acpi_dev, NULL,
> +                           (void *)intel_hid_ids, NULL);
> +
> +       return platform_driver_register(&intel_hid_pl_driver);
> +}

Why do we need to walk instantiate the device ourselves instead of
having ACPI core do it for us? I also see this pattern in intel-vbtn.c
now.

Thanks.

-- 
Dmitry
