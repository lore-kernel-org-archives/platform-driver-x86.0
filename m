Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74DA5C6FD18
	for <platform-driver-x86@archiver.kernel.org>; Tue, 25 Apr 2023 05:28:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233181AbjDYF2F (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 25 Apr 2023 01:28:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229637AbjDYF2F (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 25 Apr 2023 01:28:05 -0400
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B63C6183;
        Mon, 24 Apr 2023 22:28:04 -0700 (PDT)
Date:   Tue, 25 Apr 2023 07:28:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
        t=1682400482; bh=w7Y9+y7iUqNE/76jkd4Xf0Zw6KPMok+py5RddA3X4vs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pUpp+zY3z7s40Z4uXQxuFKqnuzAnJef7KE6HO9x70xy+JXjpa/tQW0LeUhwroeiez
         4K5JTJIyzip+xO6yTK0b8Qx9cnowjjMlu/9g5D19LzgL2C1yYqRTjw+I7SN0Yz9ViM
         kFEstyA4zYS8fzYUx1SA/OvGSXU4Z95v/9lxmAC8=
From:   Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To:     Jorge Lopez <jorgealtxwork@gmail.com>
Cc:     hdegoede@redhat.com, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 02/14] HP BIOSCFG driver - biosattr-interface
Message-ID: <b4b9fb11-d6d0-42e6-9193-ba3c2c846071@t-8ch.de>
References: <20230420165454.9517-1-jorge.lopez2@hp.com>
 <20230420165454.9517-3-jorge.lopez2@hp.com>
 <b7c49593-13f9-44f8-b3b8-66551b01e966@t-8ch.de>
 <CAOOmCE_MdHnPb250DDYC6Hoqutod2m=2voBqFz4g0dLcmJ5PRQ@mail.gmail.com>
 <67108caf-2a03-4ef0-9f8d-819b0d6f0a2e@t-8ch.de>
 <CAOOmCE8dru7YOmZeTiEoDMiy7d6nTEih6D2H-AMrOykt=z1bhQ@mail.gmail.com>
 <CAOOmCE8SGn9JsWVXUDnKgWyxSzuCuiXzjsv3V737uNXPu2jykA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOOmCE8SGn9JsWVXUDnKgWyxSzuCuiXzjsv3V737uNXPu2jykA@mail.gmail.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 2023-04-24 17:14:57-0500, Jorge Lopez wrote:
> Sorry for asking again.  I just want to be understand exactly what I must do.

No problem!

> > > > >
> > > > > > +     args->command = command;
> > > > > > +     args->commandtype = query;
> > > > > > +     args->datasize = insize;
> > > > > > +     memcpy(args->data, buffer, flex_array_size(args, data, insize));
> > > > > > +
> > > > > > +     ret = wmi_evaluate_method(HP_WMI_BIOS_GUID, 0, mid, &input, &output);
> > > > >
> > > > > The driver is mixing calls to the UUID based APIs and the wmi_device
> > > > > ones.
> > > > > wmi_devices is newer and preferred.
> > > >
> > > > The driver  calls wmi_evaluate_method when initiating an WMI call.
> > > > Where is the driver mixing calls to the UUID based APIs and the
> > > > wmi_device one?
> > > > WMI calls are made by calling hp_wmi_perform_query() which invokes
> > > > wmi_evaluate_method().
> > > > Did I miss something?
> > >
> > > wmi_evaluate_method() is UUID-based.
> > > struct wmi_driver is wmi_device based.
> > >
> > > The wmi_driver/wmi_device code essentially does nothing and is only used
> > > to validate that a device is present.
> > > The same can be done more easily wmi_has_guid().
> > >
> >
> 
> Are you asking to replace all calls to wmi_evaluate_method() which is
> UUID based API with calls to  wmidev_evaluate_method() which is
> wmi_device based?  Correct?

To be honest I'm not 100% sure.

wmi_device is great and perferct for simple drivers binding to a single
UUID.

But it does not handle multi-UUID logic as your driver needs very well.

I would argue to stick to the legacy calls as it allows you to drop a
bunch of code and makes the initialization flow more straightforward.

But I don't know if somebody else won't ask for wmi_device later.
