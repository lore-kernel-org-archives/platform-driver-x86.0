Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90DD0C433EF
	for <platform-driver-x86@archiver.kernel.org>; Sat,  9 Jul 2022 11:22:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229478AbiGILWD (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 9 Jul 2022 07:22:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbiGILWC (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 9 Jul 2022 07:22:02 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0DB6168718
        for <platform-driver-x86@vger.kernel.org>; Sat,  9 Jul 2022 04:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1657365717;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=mlgT6Mwz/S9l0UxcBlbp/aw+abe0152FAITb3gtE8Q4=;
        b=ZSRrrkPZ+ch0F3zdqk6e/wE2Rwse2kmwJz2U1lc3AhqNjaQDHeUC92I4NpyS2PX2TK/UAM
        R9d2NbdmqtmwuyD2UvS4gMoMUGKcqNHMpHtQ+lY1EC06boFMedKdU1cF08E7sk8mC8Mpsm
        fSIt0D/AOxRHgVRUmtw/qSyD8pS6x90=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-588-C4ApAEPbOsOGgOPfO3X5Ig-1; Sat, 09 Jul 2022 07:21:56 -0400
X-MC-Unique: C4ApAEPbOsOGgOPfO3X5Ig-1
Received: by mail-ed1-f70.google.com with SMTP id t5-20020a056402524500b0043a923324b2so914428edd.22
        for <platform-driver-x86@vger.kernel.org>; Sat, 09 Jul 2022 04:21:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=mlgT6Mwz/S9l0UxcBlbp/aw+abe0152FAITb3gtE8Q4=;
        b=q5FbMim+HWIA8Z/XpE+7zm1oeIB3/RFy/tyD46zBc9ouxiwkK+ufuw//ZOGELYm+3w
         tv359SlfThgKeC4S3yEOHhMsgaP8MEzBotEF4SfRCgJC0Ql46u3+/ktgCy7mxvOwLOVY
         GS+PT3Ge5fcgwRPOuesDY7qAycBKCGhCZMirmHIUsFWPKPCiHMDoSWwJw39JMPcBo2C3
         UaHi4tuusArKE5nmCAJxN3iXOf8CxPd33YdpsY+p5QmjYoXSWCIaOh9jQ2OGrdTZryiJ
         i4+Ln0BRT9IzULJpKhnJIGX/WvbFekcKvG4P2QdXDjNwAzMCecBQozljQ3a1EWOy1z1D
         ynGg==
X-Gm-Message-State: AJIora98w+LbvoYshYgFWYb4jT7E38yocqCp9fs+dyHT69V9CtS36ltz
        i4tQ7b2QNTnVnVyDSJcZgc7VThO3jwqpIjGxIqt5FLtn8Qg8eaCJXNA1fxh0Es5NcEEBFxFZWRQ
        y0VZKPU2DfMdEVPug5lV7Y5ZxZogtxRPbTQ==
X-Received: by 2002:a05:6402:84f:b0:437:6293:d264 with SMTP id b15-20020a056402084f00b004376293d264mr10738567edz.317.1657365715126;
        Sat, 09 Jul 2022 04:21:55 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sePuokRYma2L5awGB4otXrgtqT9f/dCN2YBIdxGDDgnRh6IhgQI9NLoudiuA4XR1BOibXS/w==
X-Received: by 2002:a05:6402:84f:b0:437:6293:d264 with SMTP id b15-20020a056402084f00b004376293d264mr10738553edz.317.1657365714979;
        Sat, 09 Jul 2022 04:21:54 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id ly9-20020a170906af4900b007219c20dcd8sm492625ejb.196.2022.07.09.04.21.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Jul 2022 04:21:54 -0700 (PDT)
Message-ID: <ae136d14-d632-5e58-fb21-28c5e79f92ff@redhat.com>
Date:   Sat, 9 Jul 2022 13:21:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: WMI driver duplicate UUID
Content-Language: en-US
To:     Armin Wolf <W_Armin@gmx.de>,
        "Limonciello, Mario" <Mario.Limonciello@amd.com>
Cc:     Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org
References: <ddd7bf26-f790-1e7a-dd19-9db2e5336cff@gmx.de>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ddd7bf26-f790-1e7a-dd19-9db2e5336cff@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Armin,

On 7/9/22 03:33, Armin Wolf wrote:
> Hello,
> 
> while trying to write my own WMI driver, i noticed that the WMI bus driver complained
> about duplicated WMI UUIDs. After doing some research, i think i found the reason for
> these messages:
> 
> Apparently, the ACPI WMI specification by Microsoft treats the _UID of the WMI PnP-device
> like a namespace, which means that duplicate UUIDs are llegal if they do not share the same
> namespace (= PnP-device).
> 
> In my case, only one wmi-bmof device is used, the rest is filtered out despite laying in
> a different namespace since they have the same UUID.
> 
> Could it be theoretically possible to fix this issue with the WMI bus?

Yes this has been a known issue for quite a while now, there
is a bugzilla for this here:

https://bugzilla.kernel.org/show_bug.cgi?id=201885

As pointed out there, patches fixing this have been posted
a few years ago already, but they did not get merged.

The patches are here:

https://lkml.org/lkml/2017/12/8/912
https://lkml.org/lkml/2017/12/8/914

There is one review comment which needs to be addressed:

https://lkml.org/lkml/2017/12/9/165

If you can pick these patches up, address the review
comment, test them and then submit a version 2 upstream
I would be happy to merge this into the platform-drivers-x86
tree.

Regards,

Hans

