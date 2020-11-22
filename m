Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47FDBC63777
	for <platform-driver-x86@archiver.kernel.org>; Sun, 22 Nov 2020 09:32:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F418120936
	for <platform-driver-x86@archiver.kernel.org>; Sun, 22 Nov 2020 09:32:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ggJNNHFn"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727396AbgKVJcT (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 22 Nov 2020 04:32:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46878 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727373AbgKVJcR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 22 Nov 2020 04:32:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1606037535;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=1Y7q9k7HD5zOPOSswO36/j6lKCNPhQl+mLKkjPEYqto=;
        b=ggJNNHFnAc7DFeEkDxf6XxmLW83mumoRrKU3ZhLS/xpI4hRYwUTn0a72CCU1CuLjwWwU+e
        lqc3ERu4ZNU3beCfRBQ6/t8GG0hMyGnRV5e2SseJKuxPTylZOeZ81KjpOq3NY3kEPIkNz7
        w4xnxnT7OTQLpLAzE5T33ZhE0XLoEdI=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-111-TO3dGW7FN1a1i0YKleQudA-1; Sun, 22 Nov 2020 04:32:13 -0500
X-MC-Unique: TO3dGW7FN1a1i0YKleQudA-1
Received: by mail-ej1-f69.google.com with SMTP id r2so1948779ejx.9
        for <platform-driver-x86@vger.kernel.org>; Sun, 22 Nov 2020 01:32:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1Y7q9k7HD5zOPOSswO36/j6lKCNPhQl+mLKkjPEYqto=;
        b=am/MACjRrvSDK4Q+f/kCssHbWu7Xpfue+lsqPECq19NlFyE0pRZ+fT+f5HyNxgrSff
         CThNiprl4u9g/NQqLUi0Suk/V8+wvYSO8tp0jOaljVuNFzFDidbJdstXwyK8b/KYmv5f
         NGYxQMOszAZEZnwjL9zzUXCGpzDEp7m/FGP95gAMNINMGtyRc8JbhDNMnhj5ZckiNbxj
         FXNc0PzXOm5cIe2ObDIpjtskVH444DCodKTpywE/XjwmpDTQrCDJG8a05GenIq1VD0Dd
         c/2j64zGlo+TpEElz3Le0io+sWtrM/s7y9RLNIOpjwbxLHE18pIV6OFkpxMW02KdCR8W
         yKWA==
X-Gm-Message-State: AOAM531JhzlrS5J32aalgtVNINFh/xeuIagT5b4r+MGpslfL/wjuSqPw
        QP9hDr/04CtZKDUo+8zIeiv0Uh7f6hXrxoHhFWRJkaWWTQcIcNKUhhuWiFwy41tenUxKZa2iRGM
        74jMASZXiu5hWu/MQDUjStXaTYUG1PXJZxg==
X-Received: by 2002:a05:6402:b3b:: with SMTP id bo27mr41629836edb.376.1606037532094;
        Sun, 22 Nov 2020 01:32:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwEvLOCCbG7eHL42EU8Bi65ubd6FTNy/yzZ+p0DfU6/bVD3GvNQ+FC3LPZuV5BWpCH1Wa/GhA==
X-Received: by 2002:a05:6402:b3b:: with SMTP id bo27mr41629814edb.376.1606037531812;
        Sun, 22 Nov 2020 01:32:11 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
        by smtp.gmail.com with ESMTPSA id c30sm3394001edd.68.2020.11.22.01.32.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2020 01:32:11 -0800 (PST)
Subject: Re: [PATCH v3] ACPI: platform-profile: Add platform profile support
To:     =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>
Cc:     Mark Pearson <markpearson@lenovo.com>,
        "rjw@rjwysocki.net" <rjw@rjwysocki.net>,
        "mgross@linux.intel.com" <mgross@linux.intel.com>,
        "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
        "mario.limonciello@dell.com" <mario.limonciello@dell.com>,
        "eliadevito@gmail.com" <eliadevito@gmail.com>,
        "hadess@hadess.net" <hadess@hadess.net>,
        "bberg@redhat.com" <bberg@redhat.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "dvhart@infradead.org" <dvhart@infradead.org>
References: <markpearson@lenovo.com>
 <20201115004402.342838-1-markpearson@lenovo.com>
 <nRyY5CKaU6WrkbMiM25gTT_bJlrQjTY_UCcQkj8ty-2mPEMVZd4BB9KwrRp7z4GaE3TTOFCXuXnt0_7J_Tj50syusBxTmS5yNZAvYX02X74=@protonmail.com>
 <761671b3-ad26-230b-e709-05ce3bd69498@redhat.com>
 <8c3pjwAeJVjl5ZLmnajCVHjcyBjoQeQTupHqZZostKJt3YZ0seAAvD-UIcBYFAFUNjsi0iWrEBNfX1l0tqN-4x07TGQbsiOMEqCpPAxgqJQ=@protonmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <41f3e41a-07be-3276-40fe-5675a19f36ae@redhat.com>
Date:   Sun, 22 Nov 2020 10:32:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <8c3pjwAeJVjl5ZLmnajCVHjcyBjoQeQTupHqZZostKJt3YZ0seAAvD-UIcBYFAFUNjsi0iWrEBNfX1l0tqN-4x07TGQbsiOMEqCpPAxgqJQ=@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/21/20 10:18 PM, Barnabás Pőcze wrote:
> 2020. november 21., szombat 15:27 keltezéssel, Hans de Goede írta:
> 
>> [...]
>>> I just realized that the sysfs attributes are only created if a profile provider
>>> is registered, and it is removed when the provide unregisters itself. I believe
>>> it would be easier for system daemons if those attributes existed from module load
>>> to module unload since they can just just open the file and watch it using poll,
>>> select, etc. If it goes away when the provider unregisters itself, then I believe
>>> a more complicated mechanism (like inotify) would need to be implemented in the
>>> daemons to be notified when a new provider is registered. Thus my suggestion
>>> for the next iteration is to create the sysfs attributes on module load,
>>> and delete them on unload.
>>>
>>> What do you think?
>>
>> Actually I asked Mark to move this to the register / unregister time since
>> having a non functioning files in sysfs is a bit weird.
>> [...]
> 
> Ahh, I didn't know that, sorry. If a non-functioning sysfs attribute is a problem,
> then there is another option: `platform_profile_choices` is always present;
> if no provider is registered, it's empty. If a provider is (un)registered,
> then `platform_profile_choices` is sysfs_notify()-ed. `platform_profile`
> only exists while a provider is registered, so it is created on provider
> registration and unregistered on provider unregistration.

TBH, I don't like this suggestion. I would like to either want both of
them be present and report "none" (and -ENODEV on write in case of platform_profile),
or neither of them be present.

Note I do agree with you that userspace probably needs a way to find out when a
provider shows up. Which means we should probably go with always having both of
them present. But it would also be good to get some input from Bastien here,
as he is working on a userspace daemon using this API.

Regards,

Hans

