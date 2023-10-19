Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8F6BCDB465
	for <platform-driver-x86@archiver.kernel.org>; Thu, 19 Oct 2023 12:32:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345641AbjJSMcl (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 19 Oct 2023 08:32:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345647AbjJSMch (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 19 Oct 2023 08:32:37 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44BC218F
        for <platform-driver-x86@vger.kernel.org>; Thu, 19 Oct 2023 05:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1697718709;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=B0OGs7K+S9eIE1QjbuJJt5bTyWAq7lCol/WeGX/BQXw=;
        b=LtdAuAOsEiXxJtpxovM2qJLV/5pHX9fRAcosKJMcfX0z3TSCdcZTC2awpdFT3AO6oZUbz8
        pUon8+S2tlWwqGlmbS/kGHKaRU3mC1XPB7x2q+cAtyEXd2NiPhg3nz/do2Wi9SpuI7yzuq
        +Ys9iteAyqiNipZiwgecZmEyb0+cVPY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-616-uvPaiw-AP6qFLtcny_jOjA-1; Thu, 19 Oct 2023 08:31:37 -0400
X-MC-Unique: uvPaiw-AP6qFLtcny_jOjA-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-52310058f1eso847380a12.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 19 Oct 2023 05:31:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697718680; x=1698323480;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B0OGs7K+S9eIE1QjbuJJt5bTyWAq7lCol/WeGX/BQXw=;
        b=JUfGecJwBdKo1TO2UjaPLYo3NQ5afECywVmranKdorPwuYhsRQmBu2lkJkBxh0rAUT
         JtnOvUVPydbezfVF3oGrv0eoOcNk+2zuTC5m8/8R0AQmyV2CVA5M+C6fN664dKCKO22P
         nT9AUKHf+tM/EPKjwYamPJqVSNpnBqKrKc1umOcb8TfI0k0mVRT33j5DVn0czF9CFL2K
         iSNmMIQcgtMEkNOjDLdBznUwn5N5wbWdPf11gTGoEK99RgkytuowIPCjPDgRxgrjyZEZ
         4nD89FEGTPvtnQnpmqK8jzkACa8Dg476XiRccqxAUCtedZSvXtKX+LLlbgxegjykE0JB
         mbHQ==
X-Gm-Message-State: AOJu0YzOdkecm/lUNvfU2AUzZppt1LtsWk5/giLiDEzGrCK0F334mSJK
        9roSvWe+4G6IldhPPHcH1799o3+26US61F7p6yEk9NduMhefR7MMqOal3GBCIa/bUU2ejp7pl5u
        5rG91MvRhM993eioAOLxRdGf6Z6ttlYB35fer5J/XKg==
X-Received: by 2002:a17:906:6a13:b0:9ad:8a96:ad55 with SMTP id qw19-20020a1709066a1300b009ad8a96ad55mr1776191ejc.14.1697718680420;
        Thu, 19 Oct 2023 05:31:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwcwLPbg3o9WYPnr+SPHS6nCHx6YRoXPt2dKFb8OVbPDZSQybdNykkXiBokW979YQn4Wc61g==
X-Received: by 2002:a17:906:6a13:b0:9ad:8a96:ad55 with SMTP id qw19-20020a1709066a1300b009ad8a96ad55mr1776178ejc.14.1697718680159;
        Thu, 19 Oct 2023 05:31:20 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id ci11-20020a170906c34b00b009ae587ce135sm3454304ejb.223.2023.10.19.05.31.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Oct 2023 05:31:19 -0700 (PDT)
Message-ID: <972d21dc-de29-fbac-bf04-efecfdbe565e@redhat.com>
Date:   Thu, 19 Oct 2023 14:31:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3] platform/x86: inspur-wmi: Add platform profile support
To:     =?UTF-8?B?6Im+6LaF?= <aichao@kylinos.cn>,
        "ilpo.jarvinen" <ilpo.jarvinen@linux.intel.com>,
        markgross <markgross@kernel.org>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        platform-driver-x86 <platform-driver-x86@vger.kernel.org>
References: <t4mw22in81-t4pfxpcqvm@nsmail7.0.0--kylin--1>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <t4mw22in81-t4pfxpcqvm@nsmail7.0.0--kylin--1>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/19/23 04:20, 艾超 wrote:
> Hi.
> 
> 
>> Thanks this is much better.
> 
>> Only remaining question I have is can the platform_profile
>> setting be changed by a hotkey (directly by the hotkey,
>> so upon pressing the hotkey the EC changes the platform_profile
>> itself).
> 
>> If the answer to this is yes, is there then any event which
>> the driver could listen to and then use to notify userspace
>> about the change by calling platform_profile_notify() upon
>> receiving the event ?
> 
>> Or maybe the event will be received by the discussed
>> hotkeys driver, so that can call platform_profile_notify()
>> instead. Note platform_profile_notify() does not require a
>> platform_profile_handler pointer, so it could indeed be
>> called from a separate driver if the events are received
>> elsewhere.
> 
>> Regards,
> 
>> Hans
> 
> There is no any event need to listen by this driver. If user
> 
> pressing the hotkey, desktop applications receive
> 
> hotkeys(Fn+Q) event, then APP get the currently power mode
> and change it. The desktop applications modify brightness
> 
> based on power mode. EC can't changes the power mode
> 
> itself.

OK, that is good to know. Thank you for answering 
my questions about this.

I believe that once the few small remaining review remarks
are addressed this should be ready for merging then.

Regards,

Hans


