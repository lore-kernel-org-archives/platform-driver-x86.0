Return-Path: <SRS0=a5Ee=EJ=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40A31C2D0A3
	for <platform-driver-x86@archiver.kernel.org>; Tue,  3 Nov 2020 09:36:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D3A9E223BD
	for <platform-driver-x86@archiver.kernel.org>; Tue,  3 Nov 2020 09:36:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QbvwyPeR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726212AbgKCJgH (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 3 Nov 2020 04:36:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51427 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727827AbgKCJgH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 3 Nov 2020 04:36:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1604396165;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=utrPveW+BJMu+H8w9gP8ENBbrrz/FW0t+ZI2x7qQEJ0=;
        b=QbvwyPeRQeMlL5bKQOBXcGaZ5KP4eoXs+WpD8gfCm/7a16dnTyakDYVSM6tJ2Sg+0mMjJ/
        6/c5seGU2CuhfkYZSTEAoB8jl4Nzo4Wy0KRbLNiKA6fvsn0Kt9k/Xx3vpleDdsHsHrpoqn
        IPP89sq08Zi2iCQp279PIfZrTwD/ua0=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-17-nf-YSJWyMXSOI6h4YFmMVg-1; Tue, 03 Nov 2020 04:36:04 -0500
X-MC-Unique: nf-YSJWyMXSOI6h4YFmMVg-1
Received: by mail-ej1-f71.google.com with SMTP id z9so5196648ejg.10
        for <platform-driver-x86@vger.kernel.org>; Tue, 03 Nov 2020 01:36:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=utrPveW+BJMu+H8w9gP8ENBbrrz/FW0t+ZI2x7qQEJ0=;
        b=kjUb3OxnKbetU0yhob/7TZRTXuKDtN8shoSX+1NGZ4yVWs55owBPHdvPteSCl9wmky
         1rk0Lx8ftq+P35VZ0jreYgUQZNRf9eS1UipGbolsvv8eYK0OeFgEeV9aHmAGga/MDAYJ
         UMRhd+ugo91rNhHKCsPW1wjfvxT4JdbHPa9UUkb0ge9wmooH5YmKgjMb7Xr2CFaIkqdy
         cgxIiLZ4iPJP3nz6a2mPDChJB2Lczq8qBdxn2hiArRQYuIEeO3EDH0bObX9Qd2Ho70Sy
         N57jB0t0+oMAU8M1IAJto6gMNB3M3xOMVc2m2deyUEIm0Ce/FvkZNQbzZaxGvTEdx8Rb
         jIyw==
X-Gm-Message-State: AOAM531iPRAqL2rFbwOYOwr411LSCxjCR47MenpF7woIUWKLWxLur8Dd
        9inPwaQoUgZTPdGANYVYOEQ3bN4j/0QwU6UHIi/NCvI5giUUOWGqcCWArtJtjCPugCkN+HNbv9K
        hVVWG5yE2BakkNIZcUdaWsMbTTD8GEhk/SA==
X-Received: by 2002:a17:906:edaf:: with SMTP id sa15mr16365529ejb.454.1604396162610;
        Tue, 03 Nov 2020 01:36:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJySyprnOznFAnABrhRiUSLsGjXxSGaLlIw0abYlPr+aHBuTZm4tdcRRUniVh8KiZ9aMowrB4w==
X-Received: by 2002:a17:906:edaf:: with SMTP id sa15mr16365509ejb.454.1604396162372;
        Tue, 03 Nov 2020 01:36:02 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
        by smtp.gmail.com with ESMTPSA id d1sm10653069ejo.17.2020.11.03.01.36.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2020 01:36:01 -0800 (PST)
Subject: Re: [PATCH] MAINTAINERS: rectify DELL WMI SYSMAN DRIVERS section
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Divya Bharathi <divya.bharathi@dell.com>,
        platform-driver-x86@vger.kernel.org
Cc:     Mario Limonciello <mario.limonciello@dell.com>,
        Prasanth KSR <prasanth.ksr@dell.com>,
        Joe Perches <joe@perches.com>,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Pia Eichinger <pia.eichinger@st.oth-regensburg.de>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20201029114425.22520-1-lukas.bulwahn@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <0eea5f3d-b3bc-e3b4-1b7f-d6528f33bd44@redhat.com>
Date:   Tue, 3 Nov 2020 10:36:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201029114425.22520-1-lukas.bulwahn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/29/20 12:44 PM, Lukas Bulwahn wrote:
> Commit e8a60aa7404b ("platform/x86: Introduce support for Systems
> Management Driver over WMI for Dell Systems") added a new section
> DELL WMI SYSMAN DRIVERS in MAINTAINERS, but slipped in a typo.
> 
> Hence, ./scripts/get_maintainer.pl --self-test=patterns complains:
> 
>   warning: no file matches    F:    drivers/platform/x86/dell-wmi-syman/*
> 
> Point the file entry to the right location and add an entry for its
> Documentation while at it.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>


> ---
> Divya, please ack.
> 
> Hans, please pick this minor non-urgent patch into your -next x86 platform
> driver tree on top of commit mentioned above.
> 
>  MAINTAINERS | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b8a905354ee9..a0a86daa9c51 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4974,7 +4974,8 @@ M:	Mario Limonciello <mario.limonciello@dell.com>
>  M:	Prasanth Ksr <prasanth.ksr@dell.com>
>  L:	platform-driver-x86@vger.kernel.org
>  S:	Maintained
> -F:	drivers/platform/x86/dell-wmi-syman/*
> +F:	Documentation/ABI/testing/sysfs-class-firmware-attributes
> +F:	drivers/platform/x86/dell-wmi-sysman/
>  
>  DELL WMI NOTIFICATIONS DRIVER
>  M:	Matthew Garrett <mjg59@srcf.ucam.org>
> 

