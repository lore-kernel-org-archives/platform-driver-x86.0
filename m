Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BD46C761A6
	for <platform-driver-x86@archiver.kernel.org>; Mon,  3 Apr 2023 10:03:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231553AbjDCKDu (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 3 Apr 2023 06:03:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231444AbjDCKDs (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 3 Apr 2023 06:03:48 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00F9C4C1E
        for <platform-driver-x86@vger.kernel.org>; Mon,  3 Apr 2023 03:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1680516178;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rjmzd/YE21ORQOPGQC93EsHd4KdzCGtkIKV/EHIywtI=;
        b=bAmCcl2fYs9Rlql70Mme9mmbTULFVMlJQgw5W62uZ7JxU/18FT4g13Hg6wcVxMsswe2HT/
        j6W1pttqyqE7l4sRdYG2xX2LEPMZNJWXFQiIbJ7P89+DpxhlP09hoQZmgPp9OQvBBUk3bw
        glubYjY9cg7QoGN25bx5lxORqoUDFyE=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-307-krW4RrehN3-ICdnnwNn6rA-1; Mon, 03 Apr 2023 06:02:56 -0400
X-MC-Unique: krW4RrehN3-ICdnnwNn6rA-1
Received: by mail-ed1-f71.google.com with SMTP id y35-20020a50bb26000000b005029d37a3ffso4056461ede.6
        for <platform-driver-x86@vger.kernel.org>; Mon, 03 Apr 2023 03:02:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680516176;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rjmzd/YE21ORQOPGQC93EsHd4KdzCGtkIKV/EHIywtI=;
        b=RvQ/5Iq5frMCAwTcxd1lnv7PigO1+BjTW73gGiZKgIvUXOqSUD9Y0nNv0lmybuIYlW
         rRBXCaSk9/c2lbj3Zeb0OBSWYsiBBdJaq9EMh77z7g93cjHU9+kTu4QS/l1n+Fgayf8M
         xxZE9dVH2R7UV5aXOfylkuDHjJlH6tbnJeY9lHh5kd6lQyTV4sKKqc6mey8C519vOVQS
         L3xDZkO+EWtE2gAy3VQVhr8kGcTRUdqCYnTn7l22rE/KJEdx0qjCiMB+BO0lULYLC0i0
         oZgGf00BSDEUEVxGviGtOxTEBx1AgKYCOKCRWl3S9kufQrR9j24kzJmx9phtnHmEHVr0
         Du3A==
X-Gm-Message-State: AAQBX9eE5A8JEEIHEkAwIuPuYchS2qGu3kjkBAontKMz78M3NH3v7tUP
        ZwXAyWY2X/m8ylELbeanDFl2kGW8Dj/eNBF96PaprsBwY+magkyF8N5QQUVmBCS0xVDVU1psENu
        Q7Nd7HUdt2Sq2xPx49ONPzyHEtJ8gQzeQDA==
X-Received: by 2002:a17:906:2350:b0:8a9:e330:3a23 with SMTP id m16-20020a170906235000b008a9e3303a23mr33600703eja.26.1680516175801;
        Mon, 03 Apr 2023 03:02:55 -0700 (PDT)
X-Google-Smtp-Source: AKy350agIn0Z0BbxQrKaHifZIEBKc5yhaJP+oZ1IQ62dW0fNCJWsj/pNyk/lJ7Zxx4QPY7mHa5cEMw==
X-Received: by 2002:a17:906:2350:b0:8a9:e330:3a23 with SMTP id m16-20020a170906235000b008a9e3303a23mr33600677eja.26.1680516175495;
        Mon, 03 Apr 2023 03:02:55 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id m24-20020a17090679d800b00946c1068b14sm4248587ejo.120.2023.04.03.03.02.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Apr 2023 03:02:54 -0700 (PDT)
Message-ID: <12a26960-1cc8-80df-e284-d0fa4768f558@redhat.com>
Date:   Mon, 3 Apr 2023 12:02:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Add missing T14s Gen1 type
 to s2idle quirk list
Content-Language: en-US, nl
To:     Benjamin Asbach <asbachb.kernel@impl.it>
Cc:     Mario Limonciello <mario.limonciello@amd.com>,
        Mark Pearson <markpearson@lenvo.com>,
        Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
        Mark Gross <markgross@kernel.org>,
        ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230331232447.37204-1-asbachb.kernel@impl.it>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230331232447.37204-1-asbachb.kernel@impl.it>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 4/1/23 01:24, Benjamin Asbach wrote:
>> Lenovo laptops that contain NVME SSDs across a variety of generations have
>> trouble resuming from suspend to idle when the IOMMU translation layer is
>> active for the NVME storage device.
>>
>> This generally manifests as a large resume delay or page faults. These
>> delays and page faults occur as a result of a Lenovo BIOS specific SMI
>> that runs during the D3->D0 transition on NVME devices.
> 
> Link: https://lore.kernel.org/all/20220503183420.348-1-mario.limonciello@amd.com/
> 
> As Lenovo distributes T14s Gen1 laptops with different product names
> a missing one is added by this patch.
> 
> Note: Based on lenovo support page there might be some more variants which
> are not represented in s2idle quirk list.

Can you provide some more in info on this? Then Mark can maybe check
if we need to add more models ?

Mark, generally speaking it may help to do a DMI_EXACT_MATCH on
DMI_PRODUCT_VERSION with ThinkPads ? That contains the human
readable model string instead of things like "20UJ", and I guess
that we want to e.g. apply the s2idle quirk to all "T14s Gen1 AMD"
ThinkPads.

> 
> Signed-off-by: Benjamin Asbach <asbachb.kernel@impl.it>
> Tested-by: Benjamin Asbach <asbachb.kernel@impl.it>

Thank you for your patch, I've applied this patch to my fixes
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=fixes

Note it will show up in my fixes branch once I've pushed my
local branch there, which might take a while.

I will include this patch in my next fixes pull-req to Linus
for the current kernel development cycle.

Regards,

Hans





> 
> Link: https://bbs.archlinux.org/viewtopic.php?pid=2084655#p2084655
> ---
>  drivers/platform/x86/thinkpad_acpi.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 32c10457399e..57428d7a392d 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -4478,6 +4478,15 @@ static const struct dmi_system_id fwbug_list[] __initconst = {
>  			DMI_MATCH(DMI_PRODUCT_NAME, "20UH"),
>  		}
>  	},
> +	{
> +		.ident = "T14s Gen1 AMD",
> +		.driver_data = &quirk_s2idle_bug,
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "20UJ"),
> +		}
> +	},
> +
>  	{
>  		.ident = "P14s Gen1 AMD",
>  		.driver_data = &quirk_s2idle_bug,

