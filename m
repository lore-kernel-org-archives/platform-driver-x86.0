Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E29B6C4332F
	for <platform-driver-x86@archiver.kernel.org>; Tue, 14 Nov 2023 11:46:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232627AbjKNLqt (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 14 Nov 2023 06:46:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232062AbjKNLqs (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 14 Nov 2023 06:46:48 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3499DD
        for <platform-driver-x86@vger.kernel.org>; Tue, 14 Nov 2023 03:46:45 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2c523ac38fbso70911411fa.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 14 Nov 2023 03:46:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699962404; x=1700567204; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OFhM0E+h8ohPV7kVwOuXleQYhHht94CPPD7eCkca6oE=;
        b=XBbi0UOV4iTxP7h0xWhL4pOo/zHfOLQ2PdtW6f/2GI2WP+bkNGoQYnWW7D/vqCJd+j
         NOeLwFmCLBqhR/lUCsVl4/hpE0sUDD5vHYzdNV/13OI37+KlVdN9juyS7E2LFkWHbMs3
         3i6MAY2JlLndQAN6WL8X+C8GwIhEJgt6TSHFPcsSTHnDjj8labNVBh750w6iVOcX4Twz
         JWKcv7C5XCr0+w5fVuJm+T5DI4fkj9D9sUkPn9NI97vBN+QZIx+DIntUVgilTSYFb15Y
         +iqc+5ffFKul6VVVgISsFoS9Q4GAVrcDXM5chBCcVs8b6VdRo+xO/smex34Rp5Q/Ygu5
         yk9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699962404; x=1700567204;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OFhM0E+h8ohPV7kVwOuXleQYhHht94CPPD7eCkca6oE=;
        b=BL5pTjGwHL+kdCgLdZ/Ja7OTir8ukmzkCpBizzNMs+Tgy2czjwVrSfd7f3Em0yM3mW
         tonXBCy4fIHwCybssV2DHkRvyKSDhjgQVzlLlTKd1lDR9vzxKliKFwTArMuzgb8gJnS7
         YmF2kQx61XJb5OTOdqsV+YdHXcOPuGeTK+BBW2iIZdz1G+PhQ1jE2vXIPpKnU3DBS0eG
         c7S4aQmPMWEtxhobWpgpgVDMXDVLzoXFCiqo5N4XaBTS0m/DbzMAnTUAqXwRogvM1M3a
         7wRQfO0HHyh8h7VYkIE5fQvfCyflcPykS1AM3HmdqU2TMMxYximKTFM1goMBxDS+Fayf
         w2Hg==
X-Gm-Message-State: AOJu0YyyaGNmdrMfkEFgUpCzsYWo2mIO9KOnkobOLDheotT2v5SKkb9G
        Jaq9zA5pC1USI14caEnwbm6WXVFdRIZM
X-Google-Smtp-Source: AGHT+IF/p62ra7ip7uAbGq8F6yRDYRY1XIVu+UXFKlEhVLz/yhsxrpjBeIHl0/lB5RPGQzABhvR4sA==
X-Received: by 2002:a2e:9645:0:b0:2c6:ee98:de85 with SMTP id z5-20020a2e9645000000b002c6ee98de85mr1422062ljh.23.1699962403582;
        Tue, 14 Nov 2023 03:46:43 -0800 (PST)
Received: from octinomon (202.51.199.146.dyn.plus.net. [146.199.51.202])
        by smtp.gmail.com with ESMTPSA id u11-20020a05600c138b00b003fefaf299b6sm11182671wmf.38.2023.11.14.03.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 03:46:43 -0800 (PST)
Date:   Tue, 14 Nov 2023 11:46:41 +0000
From:   Jules Irenge <jbi.octave@gmail.com>
To:     Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc:     hdegoede@redhat.com, markgross@kernel.org,
        platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 2/3] platform/mellanox: mlxbf-tmfifo: Remove unnecessary
 bool conversion
Message-ID: <ZVNeIfRoxkrPnM-q@octinomon>
References: <ZUWIIKbz4vukl8qb@octinomon>
 <42dad56-f73a-cfcf-eedb-60412eb6a7e4@linux.intel.com>
 <9c345f3-872-a15e-6adb-2d39ca999b@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9c345f3-872-a15e-6adb-2d39ca999b@linux.intel.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

> Hi again,
> 
> I also realized right after send the reply that this is marked as 2/3 but 
> the other two patches didn't make it into lore archives (nor into 
> patchwork, I think).
> 
> -- 
>  i.
Hello

My bad, I sent three patches but they were all to completely different drivers/subsystems with completely different warning fixes.
I am still coming back to start sending patches after years maybe. I will from now on do patch series for one particular driver only then go to next. 

Thanks for replying.
Jules
