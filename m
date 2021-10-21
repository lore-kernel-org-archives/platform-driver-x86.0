Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19324C433EF
	for <platform-driver-x86@archiver.kernel.org>; Thu, 21 Oct 2021 17:25:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ED42F614C8
	for <platform-driver-x86@archiver.kernel.org>; Thu, 21 Oct 2021 17:25:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230437AbhJUR2E (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 21 Oct 2021 13:28:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230453AbhJUR2D (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 21 Oct 2021 13:28:03 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84F19C0613B9
        for <platform-driver-x86@vger.kernel.org>; Thu, 21 Oct 2021 10:25:47 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id g10so3778389edj.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 21 Oct 2021 10:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=w05r+bU0/r3pBtg2tVZUWeliTpqb3/TxA0p+/lW0rlA=;
        b=YCI/8PAGvvUjuQqixeks7N9aDHNLPdDOgX3isGNR0PgiMm6KgMmeijsc6L7C79f0a6
         FbDGErpeZs3nFHLuyf/ZJYNM2ZR59KM+iyfYqWLfBbUnLGZDgRtVHw6yHuQtFk0+HhPM
         G9hxMh5ctJ1csRi+7MxHgTUa2+F+My/BqsbuXA1GwsU9kL0J+muA6yk6jEtB/SLt/WKE
         R4vLYbROYYRUlnEsobZys4TrsYBIi93uHPHEnl8UosnNKb7RGNZDyLJjbRatH6SIifP5
         NSjockoq4iPl9VGlMgYMAg0mMfxwuAmFOanihy2cWE+sqAeMm7ivB/EfG9djcUmDI1dC
         cQDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=w05r+bU0/r3pBtg2tVZUWeliTpqb3/TxA0p+/lW0rlA=;
        b=uaXoSjHkvp0VFiY7kaV/nPT0TGAk4xVlbMfGtmvHPXbLIM5eKb3oxpJsH5R3h7vi+6
         UKFDGziVEoQv6QxQ36AFyNygOPs3XjSImrlL+qqyICWghMSMT/ueS6vGoq/9/KdCh70S
         ru5WioDI7BnpLw8oobLjx5JcNTo0LHW6dN5naa/u0zgNtvvAXx6pvpdRfTC4HkpObEDd
         tSVmwUGMDMgpb7jK7YEI0LIPo1UfaU4MiBxYCfnMJVc/vjdsXDUvq8eNT1M8LTbSwW3J
         Fv9YZapAh/vKCsWIIhTHEcek25MzMalEzmmjjz4TKxQ/vut/Bb9DZp3qHXtLjVjnXZRd
         g7Cg==
X-Gm-Message-State: AOAM532qYYI/G/tjN/Hsay0TwswVHJJyCs3sM4KzlD27y12icXUwBxJd
        fmRyEudMVnOgQdgGPHuWq1E=
X-Google-Smtp-Source: ABdhPJynvMZHKLWiB2yJYg4i2pSoweew7kcu0aqBgaLpyVfZeQm/Nfa6lUE9bE6ZiB5P42K0h4dYFg==
X-Received: by 2002:a05:6402:1296:: with SMTP id w22mr9424897edv.390.1634837144301;
        Thu, 21 Oct 2021 10:25:44 -0700 (PDT)
Received: from mikalai-laptop ([37.214.53.62])
        by smtp.gmail.com with ESMTPSA id q11sm3195645edv.80.2021.10.21.10.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 10:25:43 -0700 (PDT)
Date:   Thu, 21 Oct 2021 20:25:41 +0300
From:   Mikalai Ramanovich <nikolay.romanovich.00@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org,
        Mikalai Ramanovich <nikolay.romanovich.00@gmail.com>
Subject: Re: [PATCH] platform/x86: wmi: change notification handler type
Message-ID: <YXGild+Pr90PMBe2@mikalai-laptop>
References: <20211015191322.73388-1-nikolay.romanovich.00@gmail.com>
 <2deb56e0-24a6-6615-d95e-e0efb7f86db2@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2deb56e0-24a6-6615-d95e-e0efb7f86db2@redhat.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi, 
thank you for your reply.

On Tue, Oct 19, 2021 at 05:11:51PM +0200, Hans de Goede wrote:
> Hi,
> 
> On 10/15/21 21:13, Mikalai Ramanovich wrote:
> > Since AML code on some Xiaomi laptops notifies the WMI hotkey with
> > 0x20 event, we need ACPI_ALL_NOTIFY here to be able to handle it.
> > 
> > Signed-off-by: Mikalai Ramanovich <nikolay.romanovich.00@gmail.com>
> 
> Hmm, this is a rather unusual change and I'm worried that it may have
> some bad side-effects.

I think it can't lead to bad side effects: this driver ignores events 
which are not described in the _WDG section (doesn't have GUID assiciated).

But if it's described it should be handled by this driver even if it
is less than 0x80. But this driver handles only 0x80-0xFF events.

> Can you provide the model-number and an acpidump for the laptop where
> you need this ? And maybe also point out which bit (which lines after
> disassembling) of the DSDT needs this ?

It's Xiaomi Mi Notebook Pro 14 2021. (TIMI A34 by DMI).

Here is a dump of interesting files: 
https://gist.github.com/MikalaiR/eee783cc0b1efdbe2aab158653e84935
(sorry for the link, i don't know it's good to attach files here or not).

The most interesting part is ssdt8.dsl file which contains only one
WMI device. Method \_SB.PC00.LPCB.EC0.XWEV (in ssdt10.dsl, line 2495) 
generates events for this device.

And this is a part of decompiled BMOF from this device:

[WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x40A"), 
 Description("Root/WMI/HID_EVENT20"), 
 guid("{46c93e13-ee9b-4262-8488-563bca757fef}")]
class HID_EVENT20 : WmiEvent {
  [key, read] string InstanceName;
  [read] boolean Active;
  [WmiDataId(1), read, write, Description("Package Data")] uint8 EventDetail[8];
};

ACPI event 0x20 associated with GUID 46c93e13-ee9b-4262-8488-563bca757fef.

> ATM I'm thinking that it might be best to do something like this:
> 
> static u32 acpi_wmi_get_handler_type(void)
> {
> 	if (dmi_name_in_vendors("XIAOMI"))
> 		return ACPI_ALL_NOTIFY;
> 	else
> 		return ACPI_DEVICE_NOTIFY;
> }
> 
> 	status = acpi_install_notify_handler(acpi_device->handle,
> 					     acpi_wmi_get_handler_type(),
> 					     acpi_wmi_notify_handler,
> 					     NULL);
> 
> (and the same for the remove)
> 
> So that we limit this behavior to the Xiaomi case.

In general i don't think it's a good idea, but if it's the only 
acceptable solution, why not.


Regards, 

Mikalai
