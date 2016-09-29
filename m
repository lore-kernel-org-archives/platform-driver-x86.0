From: Andy Lutomirski <luto@amacapital.net>
Subject: Re: [PATCH] intel-hid: new hid event driver for hotkeys
Date: Thu, 29 Sep 2016 10:29:49 -0700
Message-ID: <CALCETrX9RQF84291hUxyGc706wnbdZYPK8X+HuUrJ-_UuC6R0g@mail.gmail.com>
References: <1450337402-4178-1-git-send-email-alex.hung@canonical.com> <CAKdAkRQTw1KDJE_EmYeYAaVy0od-mnShmDax46Kh8Xcq6Ec4kw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ua0-f181.google.com ([209.85.217.181]:35907 "EHLO
        mail-ua0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933853AbcI2RaL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 29 Sep 2016 13:30:11 -0400
Received: by mail-ua0-f181.google.com with SMTP id n13so72212157uaa.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 29 Sep 2016 10:30:11 -0700 (PDT)
In-Reply-To: <CAKdAkRQTw1KDJE_EmYeYAaVy0od-mnShmDax46Kh8Xcq6Ec4kw@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Alex Hung <alex.hung@canonical.com>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org

On Thu, Sep 29, 2016 at 9:02 AM, Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
> Quite a bit late, but still:
>
> On Wed, Dec 16, 2015 at 11:30 PM, Alex Hung <alex.hung@canonical.com> wrote:
>> +
>> +static int __init intel_hid_init(void)
>> +{
>> +       acpi_walk_namespace(ACPI_TYPE_DEVICE, ACPI_ROOT_OBJECT,
>> +                           ACPI_UINT32_MAX, check_acpi_dev, NULL,
>> +                           (void *)intel_hid_ids, NULL);
>> +
>> +       return platform_driver_register(&intel_hid_pl_driver);
>> +}
>
> Why do we need to walk instantiate the device ourselves instead of
> having ACPI core do it for us? I also see this pattern in intel-vbtn.c
> now.

See the comment above check_acpi_dev():

/*
 * Unfortunately, some laptops provide a _HID="INT33D5" device with
 * _CID="PNP0C02".  This causes the pnpacpi scan driver to claim the
 * ACPI node, so no platform device will be created.  The pnpacpi
 * driver rejects this device in subsequent processing, so no physical
 * node is created at all.
 *
 * As a workaround until the ACPI core figures out how to handle
 * this corner case, manually ask the ACPI platform device code to
 * claim the ACPI node.
 */


>
> Thanks.
>
> --
> Dmitry



-- 
Andy Lutomirski
AMA Capital Management, LLC
