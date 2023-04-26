Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22D90C77B78
	for <platform-driver-x86@archiver.kernel.org>; Wed, 26 Apr 2023 13:06:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241026AbjDZNGh (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 26 Apr 2023 09:06:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241086AbjDZNGU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 26 Apr 2023 09:06:20 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA4E061B9
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Apr 2023 06:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1682514278;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Fq4Od2HxM/Y6pUx1QLzBOFhnuHgYBugl3wErDAOLIqo=;
        b=arwJ6M5aQCYl9/o8AR3TOSwe8hwHU3ZR65xO+AIStqn8nnOtsKlAB3LDS5IGOnt64xFbqT
        z9yDEDcDMmHud+jl0JunsG11v/LXWUET8wk9LvohtjOgZTvMi7mVYz7wWUSpcnzcVhX+Cf
        jU4VAqXR8dGDQEweelN6JaDr4eNDYC8=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-196-BHNpbaWaOEyo6qmKQcfmkQ-1; Wed, 26 Apr 2023 09:04:33 -0400
X-MC-Unique: BHNpbaWaOEyo6qmKQcfmkQ-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-95f6f291b9aso25916266b.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Apr 2023 06:04:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682514269; x=1685106269;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fq4Od2HxM/Y6pUx1QLzBOFhnuHgYBugl3wErDAOLIqo=;
        b=h/FRsEFyqrGV/Xmd6+SdwjlfnLQuHg/82V4jYn5TPeImo/OET3LznBJocAfc1MIOUj
         Q5+S0m04zaymCdpiZtN2/5ovlK33PpcWdxYPTwveyI5WIHe6c4bLc7Gm6ujaiB2g/ocu
         P8jh9S+ZCKTJDdwBaM/LBMs2UCte+4AtWXL5kpa6gz8XZuPfSIWh9FJ83etN/p/W/gwJ
         5h0NcL7QAguGaIsCvjYGgSF26zhJhpPJTLZ7wuVgWFz5bXTkL2GLrkmgyatrJJhDvfQR
         l2bLeX5wDDGYt3xlsS4ArD2b87PlbRFUfBRHzt5fud75q4zmty5iI8/GuAgDx2eN1D1Z
         72oQ==
X-Gm-Message-State: AAQBX9cV1UEgSfwUNFCToHNm6YEWvk5f4mAGbz7nvNmAxbpV9ykHGAzM
        zWifKX1uz2rMuOC1FbhqJr2mp6lSmmsnaii/zIPz5YTA2Wjt28i2uX3j9oqqTgABAnZ9oL3Im98
        BsavvhwRHsbmkfpZnQ8Rerwqp6bmK3V7WpQ==
X-Received: by 2002:a17:906:830d:b0:94e:b3a1:3ed9 with SMTP id j13-20020a170906830d00b0094eb3a13ed9mr20202180ejx.49.1682514269334;
        Wed, 26 Apr 2023 06:04:29 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZWOopZTBlxSVKCxrbUqA87SO0sLZv3R9/ZOpeg+cX6/lPO2BB/fBduMntUiAVZDI4AZkb5yQ==
X-Received: by 2002:a17:906:830d:b0:94e:b3a1:3ed9 with SMTP id j13-20020a170906830d00b0094eb3a13ed9mr20202159ejx.49.1682514268997;
        Wed, 26 Apr 2023 06:04:28 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id mb17-20020a170906eb1100b00932fa67b48fsm8068863ejb.183.2023.04.26.06.04.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Apr 2023 06:04:28 -0700 (PDT)
Message-ID: <2af933f1-1662-2c91-b4da-6e067a9a9389@redhat.com>
Date:   Wed, 26 Apr 2023 15:04:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v11 01/14] HP BIOSCFG driver - Documentation
Content-Language: en-US, nl
To:     Jorge Lopez <jorgealtxwork@gmail.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        thomas@t-8ch.de
References: <20230420165454.9517-1-jorge.lopez2@hp.com>
 <20230420165454.9517-2-jorge.lopez2@hp.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230420165454.9517-2-jorge.lopez2@hp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Jorge, Thomas,

Thank you both so much for all your work on this!

The userspace API of this looks like it is pretty much
done now (after the discussed changes for
the "Sure_Start" attribute), which is great.

I have one small remark below (inline).

On 4/20/23 18:54, Jorge Lopez wrote:

<snip>

> diff --git a/Documentation/ABI/testing/sysfs-class-firmware-attributes b/Documentation/ABI/testing/sysfs-class-firmware-attributes
> index 4cdba3477176..73d7b8fbc0b2 100644
> --- a/Documentation/ABI/testing/sysfs-class-firmware-attributes
> +++ b/Documentation/ABI/testing/sysfs-class-firmware-attributes
> @@ -22,6 +22,12 @@ Description:
>  			- integer: a range of numerical values
>  			- string
>  
> +		HP specific types
> +		-----------------
> +			- ordered-list - a set of ordered list valid values
> +			- sure-start - report audit logs read from BIOS
> +
> +
>  		All attribute types support the following values:
>  
>  		current_value:
> @@ -126,6 +132,44 @@ Description:
>  					value will not be effective through sysfs until this rule is
>  					met.
>  
> +		HP specific class extensions
> +		------------------------------
> +
> +		On HP systems the following additional attributes are available:
> +
> +		"ordered-list"-type specific properties:
> +
> +		elements:
> +					A file that can be read to obtain the possible
> +					list of values of the <attr>. Values are separated using
> +					semi-colon (``;``). The order individual elements are listed
> +					according to their priority.  An Element listed first has the
> +					highest priority. Writing the list in a different order to
> +					current_value alters the priority order for the particular
> +					attribute.
> +
> +		"sure-start"-type specific properties:
> +
> +		audit_log_entries:
> +					A read-only file that returns the events in the log.
> +					Values are separated using semi-colon (``;``)

Looking at the documented format which seems to be 128 raw bytes per entry, I think
that the "Values are separated using semi-colon (``;``)" line is not correct here
and that line should not removed here ?

But maybe I'm misunderstanding things here. Do you have an example
of what catting (or "hexdump -C"-ing if binary)
the "audit_log_entries" sysfs file looks like ? 



> +
> +					Audit log entry format
> +
> +					Byte 0-15:   Requested Audit Log entry  (Each Audit log is 16 bytes)
> +					Byte 16-127: Unused
> +
> +		audit_log_entry_count:
> +					A read-only file that returns the number of existing audit log events available to be read.
> +					Values are separated using comma (``,``)
> +
> +					[No of entries],[log entry size],[Max number of entries supported]
> +
> +					log entry size identifies audit log size for the current BIOS version.
> +					The current size is 16 bytes but it can be to up to 128 bytes long
> +					in future BIOS versions.
> +
> +
>  What:		/sys/class/firmware-attributes/*/authentication/
>  Date:		February 2021
>  KernelVersion:	5.11

<snip>

> @@ -311,7 +364,7 @@ Description:
>  			==	=========================================
>  			0	All BIOS attributes setting are current
>  			1	A reboot is necessary to get pending BIOS
> -			        attribute changes applied
> +				attribute changes applied
>  			==	=========================================
>  
>  		Note, userspace applications need to follow below steps for efficient

This seems like an unrelated whitespace change which
has accidentally ended up in this patch.

Regards,

Hans


p.s.

I'll also read / catch up with all the comments on the actual implementation
(patches 2-14) and I'll let you know if I have any remarks there.


