Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1852C47096
	for <platform-driver-x86@archiver.kernel.org>; Thu,  3 Jun 2021 17:05:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8AE75613C9
	for <platform-driver-x86@archiver.kernel.org>; Thu,  3 Jun 2021 17:05:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229789AbhFCRHW (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 3 Jun 2021 13:07:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36060 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229695AbhFCRHW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 3 Jun 2021 13:07:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1622739937;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=1JY+ThpNvUNc5MWyYcRhRJLduIKbgQwydX8JPKBcVMI=;
        b=g9qaTnChxlpedqAz8BwtN53SLKryIy4GMSpHTe4APrJcmop4gRhN2ie9vDjGksWowkw8b6
        R0do1xB7ckQJ8pdDwK8WYWRPthiUNSr+VGJFdg8/sT7713hiP7d/opl6KYvg7THZkVIO1y
        DM1VKaiV65F5RH9+pjrVTxEijLjNiN4=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-450-kJKcv0jqO0q4MblPO_Cgmg-1; Thu, 03 Jun 2021 13:05:36 -0400
X-MC-Unique: kJKcv0jqO0q4MblPO_Cgmg-1
Received: by mail-ed1-f72.google.com with SMTP id c12-20020aa7d60c0000b029038fccdf4390so3577231edr.9
        for <platform-driver-x86@vger.kernel.org>; Thu, 03 Jun 2021 10:05:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1JY+ThpNvUNc5MWyYcRhRJLduIKbgQwydX8JPKBcVMI=;
        b=c97qkNQ32/3/iv0L1r7YcE+Rseo+KC4kLrlzXssAAhMgeFySi3enp5rWmCrBMGxsCO
         5rZ7hp2BWnut1V9OXgDMiqoJSTR23GF1OtLUnmTrEd3MwQhjHXtteBokOSdhO3M8WP5g
         CIq8qgGEkpyISbQvLKRDkJ1G/qHj2XNEVCmst8h6f/O20zF33BaYUVPY83N7iUOdahQz
         +4e/gFwxOFT8fZDD8xGhBh/aJJK6rWg9OwgSCfCfCB72cxnFBYqYT5k+hkyH0rU70vzu
         WZe321AvTrseb/doFZ8rxfQyOsLLtcqlWNuTdbi3TEN2eRC0su1OyX/iFoO7BvwHf2UV
         Xedg==
X-Gm-Message-State: AOAM531L3MYuipL7lzNB6N+cGFXYOz/O6n4RTMVhcmYrpMx45Pm3/Xz2
        JJ7O03dGjwB61co8ZDW6MfauZMb7/C7hO92mcS4tykNFeHt8QEvtQMJsE9o4DUPZ729aW9yRFYC
        T5IyUFpIkWyhRMX/iwD5ANZnjHvUfhwdMNQ==
X-Received: by 2002:a17:906:80cd:: with SMTP id a13mr321834ejx.421.1622739934944;
        Thu, 03 Jun 2021 10:05:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyCR2G4+C+bsTminQfLne6RzEYtkn/gW2hcAaGeume0x5y2/DFQE8C/1iTa1I6EVYK7cs8HkQ==
X-Received: by 2002:a17:906:80cd:: with SMTP id a13mr321814ejx.421.1622739934783;
        Thu, 03 Jun 2021 10:05:34 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id gg22sm309562ejb.114.2021.06.03.10.05.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jun 2021 10:05:34 -0700 (PDT)
Subject: Re: [PATCH 1/1] ishtp: Add support for Intel ishtp eclite driver
To:     "K Naduvalath, Sumesh" <sumesh.k.naduvalath@intel.com>,
        "mgross@linux.intel.com" <mgross@linux.intel.com>,
        "srinivas.pandruvada@linux.intel.com" 
        <srinivas.pandruvada@linux.intel.com>
Cc:     "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Chinnu, Ganapathi" <ganapathi.chinnu@intel.com>,
        "Kumar, Nachiketa" <nachiketa.kumar@intel.com>
References: <20210531120415.14480-1-sumesh.k.naduvalath@intel.com>
 <e28a9a7c-ec02-f71d-da6a-270f2dcbd58f@redhat.com>
 <BYAPR11MB37529B9B31E8188ABB29C683A93E9@BYAPR11MB3752.namprd11.prod.outlook.com>
 <1dbdb756-a87a-0ab6-4784-55e1edeb55d0@redhat.com>
 <BYAPR11MB3752E4A836546F1F07089249A93C9@BYAPR11MB3752.namprd11.prod.outlook.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <a447321d-79fc-6d2c-4a07-d4a24223c5a5@redhat.com>
Date:   Thu, 3 Jun 2021 19:05:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <BYAPR11MB3752E4A836546F1F07089249A93C9@BYAPR11MB3752.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/3/21 6:48 PM, K Naduvalath, Sumesh wrote:
> Thank you Hans for the scrutiny. Please find my comments inline.

<snip>

>>> ISH Firmware (the PSE subsystem) can boot up/reinitialize Every Sx
>>> based on usecase or sometimes PSE is always-on. So the resume path is
>>> asynchronous and unpredictable in this case. Re-initialization and
>>> clean up required if PSE also boot up every Sx and might take good
>>> amount of time (Host can come alive before PSE comes up). Thus using
>> asynchronous reset notification.
>>
>> Ok, so I guess we need to live with the ugly deregister + re-register OpRegion
>> dance for the devices where the PSE is shutdown during suspend.
>>
>> You also write: "sometimes PSE is always-on", what about that case, I assume
>> in this case there will be no reset after resume? So then unregistering the
>> OpRegion handler at suspend (and setting link_ready=false) will be wrong
>> since without the reset the OpRegion handler will never get reinstalled ?
> 
> reset is called from bus after every resume. When PSE is always-on, the notification
> comes quicky, where as there reset comes bit later in case of new boot.

Ok, in that case it makes sense to treat the PSE always-on scenario the same
as the scenario where it gets turned off during suspend.

Regards,

Hans

