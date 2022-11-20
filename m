Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58269C433FE
	for <platform-driver-x86@archiver.kernel.org>; Sun, 20 Nov 2022 22:48:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229735AbiKTWso (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 20 Nov 2022 17:48:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229719AbiKTWsn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 20 Nov 2022 17:48:43 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF9711B9CA
        for <platform-driver-x86@vger.kernel.org>; Sun, 20 Nov 2022 14:47:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668984468;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=PPVLzNZ/iSQ7mXj9sw3pYm8ZbQIXY1b5i7yu8t4NX3Q=;
        b=N+Y0R4As0qQZPrdBlBrRttUNwOP5NluZ1YfBjvn/HOZClzGIazfGs8Kwb3KnPQ1+4JGjLT
        XFTBVtyFWo9qXtet/lrZw+a5rYzCMnGKpbwKFomBYI1ywfWt7eojlJFHiI8YBQttiPx2Lq
        OnyPM6gDLl2/EGoLvyz78BDsNISQXGY=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-304-FAILS3npPqylavIiPid1HQ-1; Sun, 20 Nov 2022 17:47:46 -0500
X-MC-Unique: FAILS3npPqylavIiPid1HQ-1
Received: by mail-ed1-f70.google.com with SMTP id f17-20020a056402355100b00466481256f6so5539750edd.19
        for <platform-driver-x86@vger.kernel.org>; Sun, 20 Nov 2022 14:47:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PPVLzNZ/iSQ7mXj9sw3pYm8ZbQIXY1b5i7yu8t4NX3Q=;
        b=GamM2HMmgbKb4/uF4Rgb53+fGGpkejbaKwwXlNAi+0+zLv1BPfs+qmjGpDcS73965Z
         g7TOgXFLuOjwtcu7N4CiX7MyiwAvQu1masCOOMTySL6K8tHr3N2jlnY4Pb1bS3EaGSp2
         +7yynG/iGEbqGLJSCMQhzsz7fPHdWT8nwuUbqaKDy30GgfVRQNrvYPd5oKmoMWw2u3TB
         riC2wLmqD44rBtcKJtitgxI6sfun/guZvKjv//zGF/jH3tfM/tg4hZfNrsGNT95CO/ev
         Ckq3Jp5n4ZXKmoRVWl399/kWcMBqlfR6RZVmSiuOqplVSvSx4II34Dv6vpd8oSSgVQ+W
         TFcA==
X-Gm-Message-State: ANoB5pn1BcqofAEpzuvSQgvJHjD3qqgYiDG/jia7yXHOMR2cOgHm1qbS
        TRFD+w0+zOewyJKU8Pm8+oYQmRtdmXRr8lFHP5BrOezcN/8S8DQZjYEUvp/wLSrDxJ9IsSupwVC
        h89v/4PLMx6Ub0Q336mmS3SM7x6jDoyKSEA==
X-Received: by 2002:a17:906:17c9:b0:782:fd8e:9298 with SMTP id u9-20020a17090617c900b00782fd8e9298mr2121398eje.640.1668984465689;
        Sun, 20 Nov 2022 14:47:45 -0800 (PST)
X-Google-Smtp-Source: AA0mqf43KC9vGbfI1mP4YDjCGquSZmgYAGKOEKQ2aBd2V9x+VfpC1/LSvO1gDK5LW9orljhH6W69NQ==
X-Received: by 2002:a17:906:17c9:b0:782:fd8e:9298 with SMTP id u9-20020a17090617c900b00782fd8e9298mr2121390eje.640.1668984465453;
        Sun, 20 Nov 2022 14:47:45 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id jl24-20020a17090775d800b0073cf6ec3276sm4314479ejc.207.2022.11.20.14.47.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Nov 2022 14:47:44 -0800 (PST)
Message-ID: <0940b44b-9dd2-0ce9-0456-b3e374175905@redhat.com>
Date:   Sun, 20 Nov 2022 23:47:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] platform/x86/intel/hid: Add module-params for 5 button
 array + SW_TABLET_MODE reporting
Content-Language: en-US, nl
To:     Andy Shevchenko <andy@kernel.org>
Cc:     Mark Gross <markgross@kernel.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
References: <20221118092550.48389-1-hdegoede@redhat.com>
 <Y3djFvrET/4meoq/@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y3djFvrET/4meoq/@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/18/22 11:48, Andy Shevchenko wrote:
> On Fri, Nov 18, 2022 at 10:25:50AM +0100, Hans de Goede wrote:
>> The driver has DMI-quirk tables for force-enabling 5 button array support
>> and for 2 different ways of enabling SW_TABLET_MODE reporting.
>>
>> Add module parameters to allow user to enable the driver behavior currently
>> only available through DMI quirks.
>>
>> This is useful for users to test this in bug-reports and for users to use
>> as a workaround while new DMI quirks find their way upstream.
> 
> Lately you have been adding tons of module parameters here and there.

I'm not sure I would call it "tons of" I've added a few parameters to
allow users to test behavior which before then was only available through
DMI quirk tables. 

This is useful for users to easily check if their model needs to be added
to a DMI quirk table.

> Taking into account that we discourage to do that, but at the same time
> understanding your point, wouldn't be better before doing that, provide
> a new type of the module parameters "for debug purposes only". One way
> is to provide necessary macros
> 
> MODULE_PARAM_DEBUG()
> 
> And always have the parameters suffixed with _debug. OR introduce an additional
> option that user may put before "open" debugging module / kernel command line
> parameters?
> 
> In this case we delimit the old/existing parameters with the parameters for
> debugging. Moreover, it may be excluded by introducing Kconfig option at compile
> time.

Adding special infrastructure for just these 5-6 module parameters which I
have added recently seems a bit too much to me.

Regards,

Hans


p.s.

I notice that I have forgotten to Cc the list when submitting that
patch, I've added the list to the Cc now and I'll resend the patch
with the list in the Cc.

