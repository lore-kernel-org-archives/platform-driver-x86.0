Return-Path: <SRS0=nDDs=C2=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C91BC43461
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Sep 2020 13:55:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4E21621734
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Sep 2020 13:55:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eQ8MCAfa"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727146AbgIQNzO (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 17 Sep 2020 09:55:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57873 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727101AbgIQNzH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 17 Sep 2020 09:55:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1600350860;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=uNO9qeO6gcqgFgIH3Qe+A+chxMKUF4RgVPd75gKUrvs=;
        b=eQ8MCAfaSdNvGN+TEKdAYFVsrtPSlEL/01tarM17+8fiNt+K7mQk4P/iAx5RQEYNvAA0Hg
        JFBjO7Tz6i0ifTeOOs1/MkbWIZdkwDSuYOXMQbYh0hEE06AGwTBcLqSYCNc0yXH+S8/JN2
        cCPE13ualGyGZxVdRsnQwKLlnjVYCUw=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-298-B3d1v5bYOCK8Dmf6p7ZG7w-1; Thu, 17 Sep 2020 09:54:18 -0400
X-MC-Unique: B3d1v5bYOCK8Dmf6p7ZG7w-1
Received: by mail-ej1-f71.google.com with SMTP id b17so907712ejb.20
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Sep 2020 06:54:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uNO9qeO6gcqgFgIH3Qe+A+chxMKUF4RgVPd75gKUrvs=;
        b=qcwQBMZibNCknVLImqr0GC21m6rgSH3KLAgW0BCePtuk3TYF6o7thwTrtj5Gs59W0j
         5vXzBXBj/K1HOfbGD1ebLOnBfH/ybuDlr4PYSd9uuPgDyL2j90VHiY70Z1Pd12xuMO/P
         OEdwAjjM4yj7KPE3L3lhS/9GuI3mpIxWsj77mjPo8CYxUAClujPQnbm6Rrs4S7HKEndp
         qNVVpVMe6Q4AL4zaM1aEdb0yeBOW545bDNninw+bB3TAZ+N7R2myrmnqkd5DKIoudKN0
         sg9CppGRkrvZL3LNMB0e+j3A/iZG2LX1vsIJPSuuk+B8i2dHvd99ftEP01ZPkmkDguLQ
         oIIA==
X-Gm-Message-State: AOAM531tmbfYVVcxZZQHOFULLY13tKNhxxQ+jxBw/zc2SWx4dRtmGvAh
        wm22LhcyorRtSohe0UXLYR+KUTFZu/OHcC7O5f8BmMb/yhb9PzwZ6TkGBPoZrLeUDrpfXLMJnCW
        Rp/oMXC3F/fHgHKNM0BL1CZ4GnAsQxMXGyw==
X-Received: by 2002:a17:906:12c7:: with SMTP id l7mr30412057ejb.306.1600350856903;
        Thu, 17 Sep 2020 06:54:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzEZCyyyhliHrRFyeZhS3sQKxzmGZdimMv/QSEbnfdEzUUM2+uO+umCWF1rf9uKyXYMeeouJw==
X-Received: by 2002:a17:906:12c7:: with SMTP id l7mr30412043ejb.306.1600350856714;
        Thu, 17 Sep 2020 06:54:16 -0700 (PDT)
Received: from x1.localdomain ([2a0e:5700:4:11:334c:7e36:8d57:40cb])
        by smtp.gmail.com with ESMTPSA id f4sm16280309edm.76.2020.09.17.06.54.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2020 06:54:16 -0700 (PDT)
Subject: Re: RFC: offering a standardized (/sys/class) userspace API for
 selecting system/laptop performance-profiles
To:     Benjamin Berg <bberg@redhat.com>,
        Bastien Nocera <hadess@hadess.net>,
        Elia Devito <eliadevito@gmail.com>,
        Mark Pearson <mpearson@lenovo.com>
Cc:     Jared Dominguez <jaredz@redhat.com>,
        platform-driver-x86@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <bbe4ebef-0845-2719-ac9a-fbc9c7bcd7be@redhat.com>
 <21b6dffbbc6dbb14ebef3f078cc2497f9a872f57.camel@hadess.net>
 <b6332a4a-7606-2bd0-632b-f67b68d3dd1b@redhat.com>
 <9f01ce60a6b3319855f6a26b94af3e5fc6d2595e.camel@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <6e0409e7-5bc2-4ca6-a0aa-725a9a91aa8d@redhat.com>
Date:   Thu, 17 Sep 2020 15:54:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <9f01ce60a6b3319855f6a26b94af3e5fc6d2595e.camel@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/17/20 3:50 PM, Benjamin Berg wrote:
> On Thu, 2020-09-17 at 14:51 +0200, Hans de Goede wrote:
>>> Compared to the WIP lenovo-dytc "perfmode" driver, we're missing
>>> something to advertise the unavailability of a profile, and the reason
>>> for that unavailability.
>>
>> UGh, do we really need to export this though. We have the lap_mode thing
>> already; and that is something which we will need for other reasons in
>> the future too. Any UI for selecting performance modes can display a
>> warning when lap_mode is true saying that: "The laptop has detected that it
>> is sitting on someone's lap and that performance may be limited
>> because of this." (feel free to improve the text).
> 
> Well, for dytc_perfmode there are actually always the three states
> L/M/H. It just happens that the kernel will write "H*" (was "M*" until
> yesterday) when the performance mode is degraded due to lap detection.
> 
> Think of dytc_perfmode as a profile that sets a number of things:
>   * Thermal Limits
>   * Fan Behaviour
>   * possibly more
> 
> While dytc_lapmode will only enforce a change to the thermal limit.
> 
> So "performance" (H) is technically a valid mode even when the lap is
> detected.
> 
>> I guess we could split the "value" attribute from my reply to Benjamin's
>> email into "configured_value" (rw) and "actual_value" (rw) attributes.
>> If we have the info we might as well export it I guess,.
> 
> I consider the "*" purely a curtsey to users that read the attribute
> directly using e.g. cat to help with the interpretation. It probably is
> not interesting to userspace applications/daemons.

So if there is a difference between M and H and H* then I think we should
just do the KISS thing and only have a single value attribute and in the
new interface handle the H* like H (p-p-d can still check the lap_mode
attribute to differentiate the 2 if it wants to).

Regards,

Hans

