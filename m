From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH] intel-hid: new hid event driver for hotkeys
Date: Fri, 30 Sep 2016 15:44:20 -0700
Message-ID: <20160930224420.GF30208@dtor-ws>
References: <1450337402-4178-1-git-send-email-alex.hung@canonical.com>
 <CAKdAkRQTw1KDJE_EmYeYAaVy0od-mnShmDax46Kh8Xcq6Ec4kw@mail.gmail.com>
 <CALCETrX9RQF84291hUxyGc706wnbdZYPK8X+HuUrJ-_UuC6R0g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pf0-f179.google.com ([209.85.192.179]:34380 "EHLO
        mail-pf0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932805AbcI3WoY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 30 Sep 2016 18:44:24 -0400
Received: by mail-pf0-f179.google.com with SMTP id u78so19014340pfa.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 30 Sep 2016 15:44:24 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <CALCETrX9RQF84291hUxyGc706wnbdZYPK8X+HuUrJ-_UuC6R0g@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Lutomirski <luto@amacapital.net>
Cc: Alex Hung <alex.hung@canonical.com>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org

On Thu, Sep 29, 2016 at 10:29:49AM -0700, Andy Lutomirski wrote:
> On Thu, Sep 29, 2016 at 9:02 AM, Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> > Quite a bit late, but still:
> >
> > On Wed, Dec 16, 2015 at 11:30 PM, Alex Hung <alex.hung@canonical.com> wrote:
> >> +
> >> +static int __init intel_hid_init(void)
> >> +{
> >> +       acpi_walk_namespace(ACPI_TYPE_DEVICE, ACPI_ROOT_OBJECT,
> >> +                           ACPI_UINT32_MAX, check_acpi_dev, NULL,
> >> +                           (void *)intel_hid_ids, NULL);
> >> +
> >> +       return platform_driver_register(&intel_hid_pl_driver);
> >> +}
> >
> > Why do we need to walk instantiate the device ourselves instead of
> > having ACPI core do it for us? I also see this pattern in intel-vbtn.c
> > now.
> 
> See the comment above check_acpi_dev():
> 
> /*
>  * Unfortunately, some laptops provide a _HID="INT33D5" device with
>  * _CID="PNP0C02".  This causes the pnpacpi scan driver to claim the
>  * ACPI node, so no platform device will be created.  The pnpacpi
>  * driver rejects this device in subsequent processing, so no physical
>  * node is created at all.
>  *
>  * As a workaround until the ACPI core figures out how to handle
>  * this corner case, manually ask the ACPI platform device code to
>  * claim the ACPI node.
>  */

Ah, I missed that (because I originally looked at intel-vbtn). Does
INT33D6 also have the same issue?

-- 
Dmitry
