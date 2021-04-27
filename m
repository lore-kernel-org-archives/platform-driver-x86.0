Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E973C433B4
	for <platform-driver-x86@archiver.kernel.org>; Tue, 27 Apr 2021 17:40:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 110D061090
	for <platform-driver-x86@archiver.kernel.org>; Tue, 27 Apr 2021 17:40:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236172AbhD0Rlc (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 27 Apr 2021 13:41:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230219AbhD0Rlb (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 27 Apr 2021 13:41:31 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2196C061574
        for <platform-driver-x86@vger.kernel.org>; Tue, 27 Apr 2021 10:40:46 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id f75-20020a9d03d10000b0290280def9ab76so50912333otf.12
        for <platform-driver-x86@vger.kernel.org>; Tue, 27 Apr 2021 10:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=lYQs280pJPYSsY/H6z+78EgN+oEVTP9G8Ta0syT7Aig=;
        b=C8/eo1y5WGiRkXAixwThb7TC/x6uis756A6PHIBgWcho33LSH7BDU9xbfZekapw8TI
         wAOMRfJe/oLLdYR/Rv46LGnvZQqtkE2vwCjBKrI090vkilmt7j9cAucV90FL92j5JgcI
         k9jQmZI9LCr/iQSY+6ArlTvEVhxmjRgDk0Z5lNhx6b/uDDu/ECdiekCauBgWA70WhQMI
         po4DoY61xnC762QwXvmJuzNHyGpxuPuipKqdBTTIPw+RfSePPHIVGJDq019iekQRJkds
         NSVdjJxn/eA2vMD+lVqi5uXZLlryCL24hg6hArChgzhO83JL+OmgiZixbBkteGT/368T
         R6ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=lYQs280pJPYSsY/H6z+78EgN+oEVTP9G8Ta0syT7Aig=;
        b=RIIoeofSkuzIfZsNd1L2mbDQkhdsG2Wj+EZmCvRij4cgsoPHN/UFC+EKf+PDP3qAu/
         qXE7Av93LLXpP0umzuYAoH2qqcjrvnEqbdfIM9irZtBjbsUkQ9KYbfP12QCPYQKT0hTY
         mtohvoLX5ryxTd7IgAMbtwuyEfgi6XbBNlWaJohIW18Ax8VhFqocacuDwr6hEg+S+5UQ
         K5H7rWQ9WQjsSIvimGm8v2/9MheNFz4ycvlj5sU2PcLBYXzFcUVXSBZjGQoJExbA9dAW
         M5ytq0qbqgraOyyYnf/z1hzzLaPU5KFNZDOtQxtTddcubYv+ez5w1yVP4LD2xKgMgE4V
         roQw==
X-Gm-Message-State: AOAM533T8kgf48A6q40v3vUJ+OQtjjB7Rw0ikVHJBwIW0go9j83C38yf
        wN1D32BUAvP7lnCQvlbTF5kMPmYxXNI=
X-Google-Smtp-Source: ABdhPJxjQjt3CgWmeylRyTjcBXiN1pd1N45xSwuOdO2F+iJaN4YxVa+q4ToKckXovc71EV73OwBJ1g==
X-Received: by 2002:a05:6830:12d5:: with SMTP id a21mr20581331otq.34.1619545246056;
        Tue, 27 Apr 2021 10:40:46 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b2sm100818otq.80.2021.04.27.10.40.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Apr 2021 10:40:45 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 27 Apr 2021 10:40:43 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Jan Kneschke <jan@kneschke.de>
Cc:     Hans de Goede <hdegoede@redhat.com>, thomas@t-8ch.de,
        platform-driver-x86@vger.kernel.org
Subject: Re: gigabyte-wmi: smbus over wmi?
Message-ID: <20210427174043.GA30897@roeck-us.net>
References: <f351a63b-90f8-27a4-d6ca-d569e2b733c2@kneschke.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f351a63b-90f8-27a4-d6ca-d569e2b733c2@kneschke.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, Apr 27, 2021 at 05:02:59PM +0200, Jan Kneschke wrote:
> Hi,
> 
> the new gigabyte-wmi driver only works only for a subset of current boards.
> 
> For boards with two ITE chips like the X570 AORUS ULTRA the corresponding
> functions on the WMBB method are just not handled:
> 
> 
>   ...
>   ElseIf (((Arg1 >= 0x0118) && (Arg1 <= 0x0121))) {}
>   // GET_TEMP is 0x125.
>   ElseIf ((Arg1 == 0x012C)) {}
>   ...
> 
> One way to handle other gigabyte boards may be using the smbus functions
> that are exposed through ACPI:
> 

The ITE chips are not connected to the system using SMBus. They are connected
through the LPC bus.

Guenter
