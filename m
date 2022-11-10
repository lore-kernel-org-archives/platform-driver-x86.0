Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1CE5C433FE
	for <platform-driver-x86@archiver.kernel.org>; Thu, 10 Nov 2022 21:38:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232471AbiKJViV (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 10 Nov 2022 16:38:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232416AbiKJViU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 10 Nov 2022 16:38:20 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F02F81C13A
        for <platform-driver-x86@vger.kernel.org>; Thu, 10 Nov 2022 13:37:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668116236;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kvsDxKUAqwhEsPuDSPoSE+BmSi+geYyZ/4NKm7RNeR8=;
        b=MFtkB9qQ03k9t8EsDTXkSxa9YOd4n/NsSYrRp8EWjE/uW7bsBq3yudkd6oNRr6uCF6Bb1Y
        42wyIDPeyBNaqiIJ2uWcAW9A3lB6zdX8ZrxDWgAJSgtoxtLA7r4aEl0HcjIWf8+yO+ZEKm
        lxgRYB+7ZFtBazE4RNz+ySttmcbUX9I=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-134-bsdpceVkMdefMEF9HqdSCA-1; Thu, 10 Nov 2022 16:37:14 -0500
X-MC-Unique: bsdpceVkMdefMEF9HqdSCA-1
Received: by mail-ej1-f72.google.com with SMTP id sd31-20020a1709076e1f00b007ae63b8d66aso1929941ejc.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 10 Nov 2022 13:37:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kvsDxKUAqwhEsPuDSPoSE+BmSi+geYyZ/4NKm7RNeR8=;
        b=ayV160WPOp8Xd9XG7iwAyMTlV5xRPMYIVaSbbth5vAL+4omYb06rPwCRIhtqX09nX8
         gsXiVC5ugmrql30HQ01xGjI3pu9TizzdlwGzNN7bWpahEGtP4wQWPJWH+tfzYaxc47wF
         ENFZwpKznR5X3hPbZWjdpk+rohYDwULdU90ox8NRxCbZOAC8jrK2Mn/r+K73ajca9D3R
         nQNG0DaLNow/lWS16oXVYHPa/eEqTUyGjvFbaxps6FEgEhL0oSB8pxJukYIE8ZxF1OhC
         DIKQXF6jqYmIVVXM3i//YBDVqmyFtBPaq+9BoQPfUUWm+8oIktOQqwMhkoRvO0wFrnWD
         ut0A==
X-Gm-Message-State: ACrzQf2Tn11N6FZq0xKrztTToem5gax05WNItHpPhsbrCJcwdXgtM2V8
        LL2PDKYPm9q7510Q/5fAINp0HAExwtdVBlWimN++v+Sm3lZsfTY5L11sY62STIf9T/XmglwPgfV
        ajx5GsME5WM+66iG3guC22+EGDRFEeIRPqg==
X-Received: by 2002:a05:6402:d50:b0:463:5d1b:99fb with SMTP id ec16-20020a0564020d5000b004635d1b99fbmr3677161edb.269.1668116233114;
        Thu, 10 Nov 2022 13:37:13 -0800 (PST)
X-Google-Smtp-Source: AMsMyM4ictsTm2dFxSHcggJ8pFAA+iJT5cUeirtyr6bMeG9QGFQLps9RbWdUO2eVkvNjg82Z9F/gpQ==
X-Received: by 2002:a05:6402:d50:b0:463:5d1b:99fb with SMTP id ec16-20020a0564020d5000b004635d1b99fbmr3677138edb.269.1668116232896;
        Thu, 10 Nov 2022 13:37:12 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id ky14-20020a170907778e00b0078afe360800sm129717ejc.199.2022.11.10.13.37.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Nov 2022 13:37:12 -0800 (PST)
Message-ID: <c4b0cd93-767c-a778-6a38-0e4d981506d3@redhat.com>
Date:   Thu, 10 Nov 2022 22:37:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 00/14] IFS multi test image support and misc changes
Content-Language: en-US, nl
To:     Borislav Petkov <bp@alien8.de>,
        Jithu Joseph <jithu.joseph@intel.com>
Cc:     markgross@kernel.org, tglx@linutronix.de, mingo@redhat.com,
        dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
        gregkh@linuxfoundation.org, ashok.raj@intel.com,
        tony.luck@intel.com, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, patches@lists.linux.dev,
        ravi.v.shankar@intel.com, thiago.macieira@intel.com,
        athenas.jimenez.gonzalez@intel.com, sohil.mehta@intel.com
References: <20221021203413.1220137-1-jithu.joseph@intel.com>
 <20221107225323.2733518-1-jithu.joseph@intel.com> <Y2zLYDmO1fkOmFgw@zn.tnic>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y2zLYDmO1fkOmFgw@zn.tnic>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Boris,

On 11/10/22 10:59, Borislav Petkov wrote:
> On Mon, Nov 07, 2022 at 02:53:09PM -0800, Jithu Joseph wrote:
>> Changes in v2
>>  - Rebased ontop of v6.1-rc4
>>  Boris
>>    - Moved exported functions (microcode_sanity_check(),
>>       find_matching_signature ) from microcode/intel.c to cpu/intel.c 
>>       (patch4,6)
>>    - Removed microcode metadata specific code changes to
>>       microcode_sanity_check() (patch6)
>>    - Moved find_meta_data() from common to IFS driver (Patch 8)
> 
> What's the upstreaming plan here - I'm assuming I should take the
> microcode patches through the tip tree?
> 
> Or should I take the whole thing through tip so that there's no
> confusion and having to sync and share branches between trees?

I have just reviewed all the platform/x86/intel/ifs changes
and they all look good to me.

I think it is the best and easiest if you just take the whole
branch.

I don't have any changes pending under drivers/platform/x86/intel/ifs
so there should not be any conflicts.

Regards,

Hans


