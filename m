Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 181A0C46CA1
	for <platform-driver-x86@archiver.kernel.org>; Mon, 18 Sep 2023 15:48:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229702AbjIRPso (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 18 Sep 2023 11:48:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229751AbjIRPsl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 18 Sep 2023 11:48:41 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E127D10C8
        for <platform-driver-x86@vger.kernel.org>; Mon, 18 Sep 2023 08:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1695051729;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4TTxQOCDOWFA0p2jwGlB97ue19qCIKfMgOp8dZqLo94=;
        b=LxaIarUxJs1E+z6pmFZqCpD/iWcYalCklJErphGoJRFoFKu0a450NuxJHlIcCL/OdVkraU
        OMZqBnkzEY1gpKVsOL8Dmv+JPjAOw6Kwk1YIIZwtuYzQSb7xKZyCLUPaLLUxZasZeyTHqU
        crhu47Q2WjO3HwCHFgjKbObREcfvQ0c=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-574-BHOKmtnzN_-n-DsVFIVlwA-1; Mon, 18 Sep 2023 09:41:30 -0400
X-MC-Unique: BHOKmtnzN_-n-DsVFIVlwA-1
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-2be51691dd5so55617901fa.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 18 Sep 2023 06:41:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695044489; x=1695649289;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4TTxQOCDOWFA0p2jwGlB97ue19qCIKfMgOp8dZqLo94=;
        b=cj6km1T2lviEKLbfvgQ3IuDcXmxH8chQFn9cdhKuT9rTf4xjZuzVPyykonFwq+Bz23
         H6H0yf1wIuvu/vUlo/JMuwSex38+JRAIauC/Mtkgt+71nwLwbuFo79ruoQAQdwgjUmJr
         0sqVdk4npHc5nd8hD7UiJxtzbnvuLYvM5oV8YA9kIIGAepkiAB3NM+HT/g6tVkMFfaFL
         KYavHUSa1DgA0ZsgwDQF5ZU70rM1ufO1QXw8jWbIYM0+If7460Spm/srjoXRYs6h8b0G
         EK3NMjo40d4FWQeOQrYKw7BvUaqNQtPDE0yLXKt/qW46XrgO4DQqck27gdX+h8zbLwMp
         ahAQ==
X-Gm-Message-State: AOJu0YyElprydCTy8uTUrRFCv5fxLwWSqH0ARLW/aRhhDGYeZ/etoI53
        ozikEcjJqYIa9WdPHGGKcaCkuSydqgeMhdEds+/yVsJguTYv6R9EOjxgvPIAqoxdCn3HDpK63r9
        tpqeknD4oKYjaxSdEzzd2Mj76XIAQyooMGQ==
X-Received: by 2002:a2e:854e:0:b0:2bd:bc9:30aa with SMTP id u14-20020a2e854e000000b002bd0bc930aamr7755916ljj.23.1695044489207;
        Mon, 18 Sep 2023 06:41:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEgqBmH2hwom+Lx5lEzqnk0cF22EnYtz2nqSN55UwRLMM+A4J8u3a+gcEep0pBcMiR7e0h5Gw==
X-Received: by 2002:a2e:854e:0:b0:2bd:bc9:30aa with SMTP id u14-20020a2e854e000000b002bd0bc930aamr7755897ljj.23.1695044488880;
        Mon, 18 Sep 2023 06:41:28 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id s7-20020a17090699c700b009adcb6c0f0dsm5133635ejn.38.2023.09.18.06.41.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Sep 2023 06:41:26 -0700 (PDT)
Message-ID: <6a4a9acf-aa1d-dc73-b171-76654e1b9d47@redhat.com>
Date:   Mon, 18 Sep 2023 15:41:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2] platform/x86: thinkpad_acpi: sysfs interface to auxmac
Content-Language: en-US
To:     =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Fernando Eckhardt Valle <fevalle@ipt.br>
Cc:     Mark Pearson <mpearson-lenovo@squebb.ca>, corbet@lwn.net,
        hmh@hmh.eng.br, markgross@kernel.org, linux-doc@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org
References: <20230915123136.4286-1-fevalle@ipt.br>
 <97ac516a-5d9f-f58d-2313-d7d3453f58cb@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <97ac516a-5d9f-f58d-2313-d7d3453f58cb@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/15/23 18:18, Ilpo Järvinen wrote:
> On Fri, 15 Sep 2023, Fernando Eckhardt Valle wrote:

<snip>

>> +		goto auxmacinvalid;
>> +	}
>> +
>> +	if (strncmp(obj->string.pointer + 0x8, "#", 1) != 0 ||
>> +	    strncmp(obj->string.pointer + 0x15, "#", 1) != 0) {
> 
> Why use strncmp with (..., 1)? These offsets should defines above and not 
> use literals.

Right, good point.

To be extra clear here, this should be replaced by != '#' statements, e.g.:

	if (obj->string.pointer[AUXMAC_BEGIN_MARKER] != '#' ||
	    obj->string.pointer[AUXMAC_END_MARKER] != '#') {
		...

Regards,

Hans

