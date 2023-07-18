Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89ABEEB64DA
	for <platform-driver-x86@archiver.kernel.org>; Tue, 18 Jul 2023 07:55:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231391AbjGRHzZ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 18 Jul 2023 03:55:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229690AbjGRHzY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 18 Jul 2023 03:55:24 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8B6610E3
        for <platform-driver-x86@vger.kernel.org>; Tue, 18 Jul 2023 00:55:21 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-307d58b3efbso5226802f8f.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 18 Jul 2023 00:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689666920; x=1692258920;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NdilMJISR5wvc4vwmBF9SNnKXESfY7+e59Ex0pjjOmw=;
        b=lAfcYogieoGPmQAFXOi5QWLKTilJpUmp611vykSXyqp+P7EErHzeAUYwtwQ2d37b74
         YoTXMajaYq7LKIlclzk1CPI1RhuCah4aybodnwSc3YvmaRUW56SBgA+IZOsO3C/zRFev
         /F+74KwgFQOq4PZHaWX5VkVPcrtVMhM5n6uzhXdZKf92X2eEBLlMmb7AYqRj3Uqz2/qV
         OOWUy3Sj83Po8zX+e+njnq/T2DhACJSKznfhbU5WkaXXrYIFgfLcVMDGww0d+94VqaUM
         SY7ckNVN9jIlPti72I17WqPv6haVHl1a4P/kCQ5i1swlHFXqArP9yb/FWl3HXWGi6rSb
         ycZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689666920; x=1692258920;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NdilMJISR5wvc4vwmBF9SNnKXESfY7+e59Ex0pjjOmw=;
        b=S9BQOwfw8T1xIW/6HE+lsF8UoSaYrhp0jCL+GoKQSrVrK0Js3Qwm4Tm33C7hped7mf
         pUl/f7LMZFU89gp/N0z6ViRh4AcYY1mU5cPG4ecThOhkB2z9nCqf3OyCmx3Qop0DJlLV
         tywZeNZhZOTAOo4EwyKfHQXVoF6DtOfTijGnQoETOhdD9GIrhXRCN5pC+5kPZhQmOxRx
         rH/4zaPgAArMXhzGq7FAPVchznW4zeWiNlXNAz8XO7EGYvHWgnKrYqdHomUVvTfop70j
         hJPISrLO+Uy4MJI0xBFBBFrHOU9B1Et2vVLRn0+glq6328+sk5hyaxV+ySCZE6VnbUSr
         dpSQ==
X-Gm-Message-State: ABy/qLYiG0GnskKtvTiGDL0lkMEMnxsr0+HSg/5g2VoIbl7kXZXbLvam
        4+Jj2CpUWC7GMagkQ65wrnW0Dw==
X-Google-Smtp-Source: APBJJlH0Qfpe7l+mV5gquhWpn74L0kv6ijmTHfMV7Q3nHfIQ5xPHd3jMd5jS6RrSydbgNDMpVmMjdg==
X-Received: by 2002:adf:ed4c:0:b0:313:f347:eea0 with SMTP id u12-20020adfed4c000000b00313f347eea0mr9666351wro.60.1689666920436;
        Tue, 18 Jul 2023 00:55:20 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id x6-20020adff0c6000000b0030fb828511csm1551650wro.100.2023.07.18.00.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 00:55:18 -0700 (PDT)
Date:   Tue, 18 Jul 2023 10:55:15 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Jorge Lopez <jorge.lopez2@hp.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH] platform/x86: hp-bioscfg: Fix some memory leaks in
 hp_populate_enumeration_elements_from_package()
Message-ID: <81fd0ef0-e254-4a24-a88a-459b1d773354@kadam.mountain>
References: <9770122e4e079dfa87d860ed86ba1a1237bcf944.1689627201.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9770122e4e079dfa87d860ed86ba1a1237bcf944.1689627201.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, Jul 17, 2023 at 10:53:37PM +0200, Christophe JAILLET wrote:
> In the loop in the ENUM_POSSIBLE_VALUES case, we allocate some memory that
> is never freed.
> 
> While at it, add some "str_value = NULL" to avoid some potential double
> free.
> 
> Fixes: 6b2770bfd6f9 ("platform/x86: hp-bioscfg: enum-attributes")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> /!\ Speculative /!\
> 
>    This patch is based on analysis of the surrounding code and should be
>    reviewed with care !
> 
> /!\ Speculative /!\

I reported these bugs yesterday.  I don't think this is the correct fix.
I thought about making the str_value local to the for loop.  That's sort
of like what your patch does.  But I wasn't sure that was necessarily
correct either.

This code needs more testing as well.  It seems no one has called this
function.

Smatch complained about uninitialized variables as well.  I didn't
bother to report that yesterday but I may as well.

regards,
dan carpenter

drivers/platform/x86/hp/hp-bioscfg/string-attributes.c:188 hp_populate_string_elements_from_package() error: uninitialized symbol 'int_value'.
drivers/platform/x86/hp/hp-bioscfg/string-attributes.c:191 hp_populate_string_elements_from_package() error: uninitialized symbol 'int_value'.
drivers/platform/x86/hp/hp-bioscfg/string-attributes.c:194 hp_populate_string_elements_from_package() error: uninitialized symbol 'int_value'.
drivers/platform/x86/hp/hp-bioscfg/string-attributes.c:197 hp_populate_string_elements_from_package() error: uninitialized symbol 'int_value'.
drivers/platform/x86/hp/hp-bioscfg/string-attributes.c:200 hp_populate_string_elements_from_package() error: uninitialized symbol 'int_value'.
drivers/platform/x86/hp/hp-bioscfg/string-attributes.c:239 hp_populate_string_elements_from_package() error: uninitialized symbol 'int_value'.
drivers/platform/x86/hp/hp-bioscfg/string-attributes.c:242 hp_populate_string_elements_from_package() error: uninitialized symbol 'int_value'.
drivers/platform/x86/hp/hp-bioscfg/string-attributes.c:245 hp_populate_string_elements_from_package() error: uninitialized symbol 'int_value'.
drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c:192 hp_populate_ordered_list_elements_from_package() error: uninitialized symbol 'int_value'.
drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c:195 hp_populate_ordered_list_elements_from_package() error: uninitialized symbol 'int_value'.
drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c:198 hp_populate_ordered_list_elements_from_package() error: uninitialized symbol 'int_value'.
drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c:201 hp_populate_ordered_list_elements_from_package() error: uninitialized symbol 'int_value'.
drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c:204 hp_populate_ordered_list_elements_from_package() error: uninitialized symbol 'int_value'.
drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c:238 hp_populate_ordered_list_elements_from_package() error: uninitialized symbol 'int_value'.
drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c:242 hp_populate_ordered_list_elements_from_package() error: uninitialized symbol 'int_value'.
drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c:262 hp_populate_ordered_list_elements_from_package() error: uninitialized symbol 'value_len'.
drivers/platform/x86/hp/hp-bioscfg/int-attributes.c:198 hp_populate_integer_elements_from_package() error: uninitialized symbol 'int_value'.
drivers/platform/x86/hp/hp-bioscfg/int-attributes.c:201 hp_populate_integer_elements_from_package() error: uninitialized symbol 'int_value'.
drivers/platform/x86/hp/hp-bioscfg/int-attributes.c:204 hp_populate_integer_elements_from_package() error: uninitialized symbol 'int_value'.
drivers/platform/x86/hp/hp-bioscfg/int-attributes.c:207 hp_populate_integer_elements_from_package() error: uninitialized symbol 'int_value'.
drivers/platform/x86/hp/hp-bioscfg/int-attributes.c:246 hp_populate_integer_elements_from_package() error: uninitialized symbol 'int_value'.
drivers/platform/x86/hp/hp-bioscfg/int-attributes.c:249 hp_populate_integer_elements_from_package() error: uninitialized symbol 'int_value'.
drivers/platform/x86/hp/hp-bioscfg/int-attributes.c:252 hp_populate_integer_elements_from_package() error: uninitialized symbol 'int_value'.
drivers/platform/x86/hp/hp-bioscfg/int-attributes.c:255 hp_populate_integer_elements_from_package() error: uninitialized symbol 'int_value'.
drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c:180 hp_populate_enumeration_elements_from_package() error: uninitialized symbol 'int_value'.
drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c:183 hp_populate_enumeration_elements_from_package() error: uninitialized symbol 'int_value'.
drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c:186 hp_populate_enumeration_elements_from_package() error: uninitialized symbol 'int_value'.
drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c:189 hp_populate_enumeration_elements_from_package() error: uninitialized symbol 'int_value'.
drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c:192 hp_populate_enumeration_elements_from_package() error: uninitialized symbol 'int_value'.
drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c:231 hp_populate_enumeration_elements_from_package() error: uninitialized symbol 'int_value'.
drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c:239 hp_populate_enumeration_elements_from_package() error: uninitialized symbol 'int_value'.
drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c:279 hp_populate_password_elements_from_package() error: uninitialized symbol 'int_value'.
drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c:282 hp_populate_password_elements_from_package() error: uninitialized symbol 'int_value'.
drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c:285 hp_populate_password_elements_from_package() error: uninitialized symbol 'int_value'.
drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c:288 hp_populate_password_elements_from_package() error: uninitialized symbol 'int_value'.
drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c:291 hp_populate_password_elements_from_package() error: uninitialized symbol 'int_value'.
drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c:324 hp_populate_password_elements_from_package() error: uninitialized symbol 'int_value'.
drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c:327 hp_populate_password_elements_from_package() error: uninitialized symbol 'int_value'.
drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c:330 hp_populate_password_elements_from_package() error: uninitialized symbol 'int_value'.
drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c:333 hp_populate_password_elements_from_package() error: uninitialized symbol 'int_value'.
drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c:362 hp_populate_password_elements_from_package() error: uninitialized symbol 'int_value'.
