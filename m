Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B20AC001B0
	for <platform-driver-x86@archiver.kernel.org>; Wed,  9 Aug 2023 14:38:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230118AbjHIOiz (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 9 Aug 2023 10:38:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233679AbjHIOiy (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 9 Aug 2023 10:38:54 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B7381FCC
        for <platform-driver-x86@vger.kernel.org>; Wed,  9 Aug 2023 07:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1691591886;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=FfaqYBoSIYPW90lLITj1L4KV3NJRPADuNi7szlbNvX0=;
        b=WYeiwRTTMhk5mCUdRsyJOvyG47A108hXSirL2BXRn3M1T2XUi4dHYK56Kgn7kZP/Pt5TtL
        k+8pf6j+8ZWa3p4ReXfOxmRKgmPQhlPMhb4jih6dvccWvr7JMwIhqQQhE5F0ujHfaU+zIA
        Yt+PRjH2nSTfACczKlM7DfNQRCWojB4=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-628-CTYuhMR4P3iH0YgEE0ihvg-1; Wed, 09 Aug 2023 10:38:04 -0400
X-MC-Unique: CTYuhMR4P3iH0YgEE0ihvg-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-52349404bb0so1167882a12.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 09 Aug 2023 07:38:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691591883; x=1692196683;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FfaqYBoSIYPW90lLITj1L4KV3NJRPADuNi7szlbNvX0=;
        b=QJ+6QdvQfaflWd9ai4tRxl6GId3V/p1uMdua9ClX0qZbJCwwVfZ0cOp7RvdlCym/tb
         bHlkIFKA0GwyauUHXsCkFfHCwwDni4kKBupJm9kG0cCjCGQdHIlz+Om5Rz98Stn3x/H3
         NsTCsQ9W1qP2XVlA09wzY7hRMojGGRczKq6m3HL4PvFVKmUmiEnW5chvGijlp2whXZX5
         FZvHjELGbT0hKBk1Z+UZzVOYnvDCDgt7W9wv1HhWENBEg8uGi9lFsyiwP4rWlPrxWAr8
         aYjoq75rp4AsdSJwMBAXWKelkWKe8ml6coR0lnqu727lXdmcD36oiHlQMjlCi1idcq94
         /BGw==
X-Gm-Message-State: AOJu0YzqDI5rFxNHC4pF688+EnhG3wPVl3SmnPPSFJEA1LIcjzDvbR/b
        ipRNA1K4r/Suhyq1E8J+nmvHUdnvXRRzkh1AvjOmd0SM0p5bYu/pwXimNEHgc/1GEasdX+QVC1C
        j4nKGtyxsFQzGw94/ToYmey/PPigQCEbzkQ==
X-Received: by 2002:a05:6402:184b:b0:522:2bc8:cbb8 with SMTP id v11-20020a056402184b00b005222bc8cbb8mr2373303edy.6.1691591883426;
        Wed, 09 Aug 2023 07:38:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQPaj55jsOKUpH9lNEEW/swMD5Tp0csnhE3/0wFF+ZhkKPSB2MHE8RfpzaHqSmQr4L+8yfkw==
X-Received: by 2002:a05:6402:184b:b0:522:2bc8:cbb8 with SMTP id v11-20020a056402184b00b005222bc8cbb8mr2373293edy.6.1691591883135;
        Wed, 09 Aug 2023 07:38:03 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id o26-20020aa7d3da000000b0052364845bdfsm954724edr.69.2023.08.09.07.38.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Aug 2023 07:38:01 -0700 (PDT)
Message-ID: <a64fe3ad-cb2a-3816-fefe-700433926492@redhat.com>
Date:   Wed, 9 Aug 2023 16:38:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/2] platform/x86/amd: Introduce AMD Address Translation
 Library
Content-Language: en-US, nl
To:     Yazen Ghannam <yazen.ghannam@amd.com>,
        Borislav Petkov <bp@alien8.de>,
        "Limonciello, Mario" <mario.limonciello@amd.com>,
        linux-edac@vger.kernel.org, markgross@kernel.org,
        platform-driver-x86@vger.kernel.org,
        "Luck, Tony" <tony.luck@intel.com>
Cc:     linux-kernel@vger.kernel.org, avadhut.naik@amd.com
References: <20230802185504.606855-1-yazen.ghannam@amd.com>
 <20230802185504.606855-2-yazen.ghannam@amd.com>
 <58934edf-4fad-48e0-bc5d-62712b11e607@amd.com>
 <894b3737-1a0a-4139-9c73-686a95481795@amd.com>
 <B3BE6B56-FBAB-4878-A45D-E95AFAC86AB1@alien8.de>
 <f989cd56-a066-409a-8d82-40d0bc6ff89b@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <f989cd56-a066-409a-8d82-40d0bc6ff89b@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/8/23 16:07, Yazen Ghannam wrote:
> On 8/8/2023 8:10 AM, Borislav Petkov wrote:
>> On August 8, 2023 5:17:33 AM GMT+02:00, "Limonciello, Mario" <mario.limonciello@amd.com> wrote:
>>> Given it's 'library code' to be used by a bunch of things and also want to be able to use a module, what about putting it in lib/?  There's plenty of library code there as tristate.
>>
>> It is x86-specific so not in there. Also, it might be used by multiple things so you want it as a separate "translation" service which is called by other modules.
>>
> 
> There are modules in arch/x86, so I guess that's not an issue (not sure what I was thinking).

Right, I think arch/x86 makes sense.

As for putting this under drivers/platform/x86/amd as initially suggested. That means that any code which wants to select this because it needs the functions also must select X86_PLATFORM_DEVICES, so IMHO it is better to put it in another place.

Regards,

Hans


