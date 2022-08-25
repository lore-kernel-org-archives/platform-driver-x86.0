Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3771AC28D13
	for <platform-driver-x86@archiver.kernel.org>; Thu, 25 Aug 2022 15:37:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233631AbiHYPho (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 25 Aug 2022 11:37:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233199AbiHYPhn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 25 Aug 2022 11:37:43 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B96FB7EC4
        for <platform-driver-x86@vger.kernel.org>; Thu, 25 Aug 2022 08:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1661441862;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Xf1gA+2mi5K/fKzqRQ/gHMub+pH8JXrYFTM8TmrwXso=;
        b=g4a2+XuEqe97elpH8otOnipEnSzOEOX/kkGdwkA2ABauBzLZSvTY0Xn/Ml/FAZ2d2vZIRh
        3mN/312g9R5yFskaahErWRBbETpeAGEvGdjnVlpBCz0RuSXXXS745Ql4QwoP1r6nGa5qz/
        xOSs0yzPTrj1OgdXlLWGnNRe14Du9ZE=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-627-bv2gYE88NZuxcLdjG7KW6g-1; Thu, 25 Aug 2022 11:37:41 -0400
X-MC-Unique: bv2gYE88NZuxcLdjG7KW6g-1
Received: by mail-ed1-f69.google.com with SMTP id w17-20020a056402269100b0043da2189b71so12820819edd.6
        for <platform-driver-x86@vger.kernel.org>; Thu, 25 Aug 2022 08:37:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=Xf1gA+2mi5K/fKzqRQ/gHMub+pH8JXrYFTM8TmrwXso=;
        b=Uo6qFO6JUNaXRS3rJyN9hJBf8T+nQBmdP+/RKG6GYLepkabQipufwJmQrBdQXUkul5
         0qJLXSv7lpW0vfpAyOLkXxiKPyaJulSLGSNRC9G4tEvaBfHbm8B/rej+dEfEttXvlRSE
         Nm/qyaRWcDyzZz3xbOJP5BqzU3NsfMcp5QJACv4DbzNNxLzBjbZ8A+ra6Afd7jh3sc+q
         8RUmvTjV5W+DGq+8hBR+yiqK5zyGs3okmPoKXlPDSUJ/xrM2e8HCopmmWcFX4JqWVQAe
         bCKIs4J0VmB8HftezqZ7qANjzav85r/cQLqgJsfsh1OBZwk1RZAMx/ezelFAX2FlxkO5
         FnUA==
X-Gm-Message-State: ACgBeo2r1DAl+akmeM36T2gNo8pYbLIZ30/LMuPMeTZWxwKU4QjAT7XK
        kXq9oB1Z07Jg7KAxitcUasaSZMSAYIxUvU3YYQ/pf+IoVub5WPNhLhBcf9p0QlGWKpcyTIZKryU
        x8OWdfXrNcVsNVDHcPWwcv4qlGBt9ljrGCQ==
X-Received: by 2002:aa7:c7da:0:b0:440:d482:36b5 with SMTP id o26-20020aa7c7da000000b00440d48236b5mr3674063eds.21.1661441859942;
        Thu, 25 Aug 2022 08:37:39 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7tgAysSLeGLkd1KxhEOFHOD7Dn2wMvzujwRsykMcok+7PZxa1q4hT/CyLQsWdqDq5GgmrqrQ==
X-Received: by 2002:aa7:c7da:0:b0:440:d482:36b5 with SMTP id o26-20020aa7c7da000000b00440d48236b5mr3674048eds.21.1661441859780;
        Thu, 25 Aug 2022 08:37:39 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id d25-20020a056402079900b00447bb9843cbsm1168760edy.59.2022.08.25.08.37.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Aug 2022 08:37:39 -0700 (PDT)
Message-ID: <64aba9b0-7d66-0e68-c2b5-33e1f0ad6095@redhat.com>
Date:   Thu, 25 Aug 2022 17:37:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 3/3] platform/x86: msi-laptop: Fix resource cleanup
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@intel.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        platform-driver-x86@vger.kernel.org
References: <20220825141336.208597-1-hdegoede@redhat.com>
 <20220825141336.208597-3-hdegoede@redhat.com>
 <YwePyfayqSA7LIMJ@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <YwePyfayqSA7LIMJ@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/25/22 17:05, Andy Shevchenko wrote:
> On Thu, Aug 25, 2022 at 04:13:36PM +0200, Hans de Goede wrote:
>> Fix the input-device not getting free-ed on probe-errors and
>> fix the msi_touchpad_dwork not getting cancelled on neither
>> probe-errors nor on remove.
> 
> Sounds like a fix, shouldn't have a Fixes tag?

You right, I'll add a:

Fixes: 143a4c0284dc ("msi-laptop: send out touchpad on/off key")

tag before merging.

Regards,

Hans

