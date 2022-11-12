Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40B05C433FE
	for <platform-driver-x86@archiver.kernel.org>; Sat, 12 Nov 2022 08:31:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230344AbiKLIbW (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 12 Nov 2022 03:31:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230327AbiKLIbV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 12 Nov 2022 03:31:21 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B24801D66E
        for <platform-driver-x86@vger.kernel.org>; Sat, 12 Nov 2022 00:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668241825;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yfcsGBviLepzlXNiNgBWrpvsgbrGuHgD6xKsL34KUOk=;
        b=AyYBeDTMBGlZvGcUP4gqdU5TbsJvVZOIybiapOyDANnB38ls+F4owRC7WQiDhCrmvLOqzm
        vNiOhJSDQwrVew7etpMNVbLs/TLp2norArOoVl8tDio4cpWmIaFjbvPwJPozBc0GnEMV8C
        JjNGwPlS+cAdN4Udy7+Dx6pyL9scpec=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-44-uLwaefF2PwCB6Ez6R1JZDA-1; Sat, 12 Nov 2022 03:30:21 -0500
X-MC-Unique: uLwaefF2PwCB6Ez6R1JZDA-1
Received: by mail-ed1-f71.google.com with SMTP id dz9-20020a0564021d4900b0045d9a3aded4so5059724edb.22
        for <platform-driver-x86@vger.kernel.org>; Sat, 12 Nov 2022 00:30:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yfcsGBviLepzlXNiNgBWrpvsgbrGuHgD6xKsL34KUOk=;
        b=e9hykHbgrpitwd9R9owgsiu28hMGGPPyii3cZLJjp5fdr9dPv1vMlKoCZBqbEdqTE1
         9i78GGmSCxRVKY5Mkt7A70T+hatCtrXL/hwMdKDcgy4D2T+EtLzuijsDcJlmxN994Nu+
         6Il9a3mB744VETeL5SK44sbLes17MSq6EpHPSmEsGSsAgtmRbX9bVba7rtfIrtzZZbTE
         +5nzivZdnGgW/nB5Mp55j02S30FTTWhou/AGkMWRJVplvzSpSOyBlkT5MI6mGelQB2Bm
         giUTfbJTv05Uc4HPNM+yHz91wfePEOtVVNi9n4NP5HniImkUH2V3lnebknIzMod4bych
         oZ3g==
X-Gm-Message-State: ANoB5pnrhm8IAsa4fdbL6YM+/fQT5nNvAb0w5Eb1IK2IzhCF9sWxurGq
        9UxEVcFnTP+dZqAKUys4WkMwLfILfk3ggVBEwjNj9LZOky95ut3XHgzKlbqiUliSCkn6N1gN3KK
        37gZYOtjcybSFqfcgJoQgN2Yk9FhB4BVPIA==
X-Received: by 2002:a17:906:793:b0:78c:ad86:d3 with SMTP id l19-20020a170906079300b0078cad8600d3mr4531772ejc.643.1668241820160;
        Sat, 12 Nov 2022 00:30:20 -0800 (PST)
X-Google-Smtp-Source: AA0mqf45yxUPDKAZVkjQBAMr4h9D6jahxDFU6UImH4MlmvjYkHm8d6UhdrEeM7/q/X587f8a1MfDGg==
X-Received: by 2002:a17:906:793:b0:78c:ad86:d3 with SMTP id l19-20020a170906079300b0078cad8600d3mr4531768ejc.643.1668241820019;
        Sat, 12 Nov 2022 00:30:20 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id g19-20020a170906539300b007812ba2a360sm1710784ejo.149.2022.11.12.00.30.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Nov 2022 00:30:19 -0800 (PST)
Message-ID: <38afe79b-0c23-cfbb-30a8-71ce9fcd794b@redhat.com>
Date:   Sat, 12 Nov 2022 09:30:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v4 2/6] Introduction of HP-BIOSCFG driver
To:     Jorge Lopez <jorgealtxwork@gmail.com>
Cc:     platform-driver-x86@vger.kernel.org
References: <20221020201033.12790-1-jorge.lopez2@hp.com>
 <20221020201033.12790-3-jorge.lopez2@hp.com>
 <dd8b494c-114c-e27e-4dcd-08dcb8b31d9d@redhat.com>
 <CAOOmCE9YT3VxEbuMMX3MCvxEinHugvvYkGHgrnRN1fHVSy7cWw@mail.gmail.com>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAOOmCE9YT3VxEbuMMX3MCvxEinHugvvYkGHgrnRN1fHVSy7cWw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/12/22 00:00, Jorge Lopez wrote:
> Hi Hans,
> 
> A quick note to check the next step.   The changes requested for
> enum-attributes,c and several supporting functions will impact other
> source files.  To save reviewing time,  I am planning to introduce the
> same changes across all source files and then proceed to submit the
> review.   Is this option acceptable?.

Yes applying the same changes to all the source files is
the *intention*. This is why I stopped reviewing after
reviewing the first set of files.

Regards,

Hans


