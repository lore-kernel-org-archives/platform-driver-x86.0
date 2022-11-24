Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29A77C43219
	for <platform-driver-x86@archiver.kernel.org>; Thu, 24 Nov 2022 11:52:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229935AbiKXLwT (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 24 Nov 2022 06:52:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229750AbiKXLwR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 24 Nov 2022 06:52:17 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54D57193F9
        for <platform-driver-x86@vger.kernel.org>; Thu, 24 Nov 2022 03:51:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669290684;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Upa7JOhV8Luz6o/HTdRR+MHYLEnrm6+OGyDErM/vu0g=;
        b=QDjxo4sE84VOllEKBJlVyle9JiMZx6XSdL1Yun5TFg297T3vz+USUIsciHT5G8lUoJjBdf
        neewczBiet5RyQkcCBzeBqS4GhJ/OmYxCNvRjxcF0C06yrLPV86By7VQS76blFQ9FL7/Mv
        rmauesn+QfYPnTufsi0zonDRovlDqe8=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-133-v-Tp4rdVNHS5q4SG2lxoaA-1; Thu, 24 Nov 2022 06:51:20 -0500
X-MC-Unique: v-Tp4rdVNHS5q4SG2lxoaA-1
Received: by mail-ed1-f71.google.com with SMTP id x18-20020a05640226d200b00461e027f704so840871edd.7
        for <platform-driver-x86@vger.kernel.org>; Thu, 24 Nov 2022 03:51:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Upa7JOhV8Luz6o/HTdRR+MHYLEnrm6+OGyDErM/vu0g=;
        b=vjzsgguFXDtHccK8IY7zXcIEjzPYnCLRKYH/T/5yKWRa4v+10LNqewSKQRJ5np+NV9
         VDU23Ii/THNIOA0+fac8psrpiOyrj4eYLx1c2bltjnRbWZV8OVdX8bH5G453bLOSAiie
         j+JxWf/YhNo3mSH6+Hxnkd+x3GcO0uU0xAZShgoOuHUpYmfO+wGxnBaxYsUiH9KyaHCu
         gRT/GxkPrZJWO1D+fVQ2ihHloUe/Rqo549O4Jph5ha0/B862FUhu6SKw1usE6F9tmO9m
         toUZOafVXNO6EUOgcUcTitwlFZ35ekrekao209GD4+eBsvyQm/a85/ba37qJXbiVhwsU
         hONA==
X-Gm-Message-State: ANoB5pmhLBSI0eP8sCdCOdAwWFWa8mkY24QAS803I8WohzpinEFO5ays
        Q6H2qlS3Nb/xtExL/Ogd6+lxANUCEq3d/jl0+P/ZyldTdXCPg3P1MRhsdbkUvX1NvDg25MRrHKf
        zov7ZaskIop9caEF4s+Kg8FiVUZarzcnd8Q==
X-Received: by 2002:a17:907:c208:b0:7ad:79c0:547a with SMTP id ti8-20020a170907c20800b007ad79c0547amr17271770ejc.41.1669290679386;
        Thu, 24 Nov 2022 03:51:19 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7zp90EmFXWu2AS+2jsyvw0RuEY/wCJ10Tp+dpiidAQoL7O6kxjm7Rv5tek7hY2r2UaBlb51g==
X-Received: by 2002:a17:907:c208:b0:7ad:79c0:547a with SMTP id ti8-20020a170907c20800b007ad79c0547amr17271757ejc.41.1669290679217;
        Thu, 24 Nov 2022 03:51:19 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id hs32-20020a1709073ea000b007a8de84ce36sm337523ejc.206.2022.11.24.03.51.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Nov 2022 03:51:18 -0800 (PST)
Message-ID: <51f80121-2e8c-0e8e-6f89-a7dc214207b0@redhat.com>
Date:   Thu, 24 Nov 2022 12:51:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v1 1/2] platform/x86: serial-multi-instantiate: Set fwnode
 for i2c
Content-Language: en-US, nl
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Stefan Binding <sbinding@opensource.cirrus.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Mark Gross <markgross@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        patches@opensource.cirrus.com
References: <20221124110718.3925934-1-sbinding@opensource.cirrus.com>
 <20221124110718.3925934-2-sbinding@opensource.cirrus.com>
 <CAHp75VfUqkxyB7J8fbfQKCMaSa55q4zqt7btNb_n5E3-NWhQyg@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VfUqkxyB7J8fbfQKCMaSa55q4zqt7btNb_n5E3-NWhQyg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/24/22 12:35, Andy Shevchenko wrote:
> On Thu, Nov 24, 2022 at 1:07 PM Stefan Binding
> <sbinding@opensource.cirrus.com> wrote:
>>
>> This allows the i2c driver to obtain the ACPI_COMPANION.
> 
> As far as I get how it's done in the SPI case the real fix should lie
> among i2c_acpi_new_device_by_fwnode(), right?

Eventually maybe, but not for the initial change.

It is complicated, making this change has side-effects
and we want to limit those side-effects to only i2c-clients
instantiated from serial-multi-instantiate for now, see
my other reply to this patch.

I do believe that we eventually want to make this change,
to easily give drivers access to all sorts of info
(e.g. _DSM methods) from the matching ACPI fw-node,
but as I said it is complicated...

Regards,

Hans



