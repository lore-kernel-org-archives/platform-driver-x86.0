Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A46CC4320A
	for <platform-driver-x86@archiver.kernel.org>; Wed, 25 Aug 2021 22:06:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 81A8A60F45
	for <platform-driver-x86@archiver.kernel.org>; Wed, 25 Aug 2021 22:06:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235055AbhHYWHL (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 25 Aug 2021 18:07:11 -0400
Received: from todd.t-8ch.de ([159.69.126.157]:51607 "EHLO todd.t-8ch.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235061AbhHYWHK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 25 Aug 2021 18:07:10 -0400
Date:   Thu, 26 Aug 2021 00:06:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=t-8ch.de; s=mail;
        t=1629929183; bh=xdOAf5eOmAmC+4agUl4Q8u4FGfpnOhaqFxBStnaP51s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DZIHwj23qIdSkn9W8db1MHXhJiJlrzkI3YThZ2gI/VjBEdTzkhan7cEcGylQhtkhR
         7aM4mOLfvXGpr5bPhdFB8j36MES7h1N3+K9jFeRa6irGNvS28F0P7NFQmQdYiGHJpq
         QOebuaEI+MAfhfsVrja7XNj7grnV3KnDobheGZa8=
From:   Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To:     Daniel Dadap <ddadap@nvidia.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        mario.limonciello@outlook.com, pobrn@protonmail.org,
        Andy Shevchenko <andy@infradead.org>,
        Darren Hart <dvhart@infradead.org>,
        Aaron Plattner <aplattner@nvidia.com>
Subject: Re: [PATCH v3] platform/x86: Add driver for ACPI WMAA EC-based
 backlight control
Message-ID: <2f969bf5-0c54-41fd-ab55-108edc0dd462@t-8ch.de>
References: <877ae34b-dcbb-a0a4-7d76-d9d78d12fd00@redhat.com>
 <20210824220437.14175-1-ddadap@nvidia.com>
 <CAHp75VfjSrq7vF=ry1dTHJWbKLF9AqK8kZbddO-1A3FQ5pCvhQ@mail.gmail.com>
 <b22b0882-e54c-3168-2cbd-842f2ba51c90@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b22b0882-e54c-3168-2cbd-842f2ba51c90@nvidia.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mi, 2021-08-25T11:47-0500, Daniel Dadap wrote:
>> +static const struct wmi_device_id wmaa_backlight_wmi_id_table[] = {
>> +       { .guid_string = WMAA_WMI_GUID },
>> +       { },

> > > +MODULE_ALIAS("wmi:"WMAA_WMI_GUID);
> > Can you move this closer to GUID? But I'm not sure what is the
> > preferred style. Hans?
> 
> 
> I'll do whatever is most stylistically preferred.
> 

This could also be expressed as, which is presumably the nicer way:

MODULE_DEVICE_TABLE(wmi, wmaa_backlight_wmi_id_table);

Thomas
