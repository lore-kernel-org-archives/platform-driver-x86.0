Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBF2EC433C1
	for <platform-driver-x86@archiver.kernel.org>; Sun, 21 Mar 2021 17:24:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 96C046192D
	for <platform-driver-x86@archiver.kernel.org>; Sun, 21 Mar 2021 17:24:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230176AbhCURXp (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 21 Mar 2021 13:23:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59644 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230056AbhCURXh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 21 Mar 2021 13:23:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1616347417;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=1EBgYLbvLumtpyOgHFxS+BeK1CHbr2oZvLaw8mjYQQs=;
        b=RcgxWNI2BdAYF+XLNkwwuE3Yuatf61jIQSP+42GIXxAY6L6z2u4A8VhT40hdNCATaqaIMl
        RhSacxbEYBlRVe1V7dPr5adZj9v8zUj2GTYTfdkJDtPgkioJ/ps/p3g1AoVJgDDbmst4/Q
        psOQhc+He+as1HbsYFnYTrFUDC4Ptpo=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-qn7foDuIOHOlwryt7PDWIw-1; Sun, 21 Mar 2021 13:23:35 -0400
X-MC-Unique: qn7foDuIOHOlwryt7PDWIw-1
Received: by mail-ed1-f71.google.com with SMTP id q12so10668066edv.9
        for <platform-driver-x86@vger.kernel.org>; Sun, 21 Mar 2021 10:23:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1EBgYLbvLumtpyOgHFxS+BeK1CHbr2oZvLaw8mjYQQs=;
        b=NNKR8bJdZbUH7FsOJ/mrafZoVWNgUNpplZrf4wPjl2oHS91GDDam7XnwFpvqMsAUvP
         DbxSZLV+yTB4198F8RFnP3XxKfZOGW9GiB/oVqGBZEeOiB1p2B+UZsS6AI5NLZHw5Dbn
         ds1UPy4GjJ2d+SAcwCYERMRQ550UkQTXOgf6GhVdCFJK6+p3EweN3+YhN7Ec+nHWASKK
         lBYPBlZov+V9dXN812ytlj4Nx3roNhjzvNYkw/CeFvHJMVWiXd17CYhwcmsoVtq6n+kg
         vG3FdKKCbwi/8TOOucqTZt0DBZEQgwU5sHRLlMXBtVKvx2m2S4EDWE8vFcm2Xdu5QNJY
         5QYA==
X-Gm-Message-State: AOAM532EBKRBqrFzCn6GHkhELl8/KI0o6ZwtoL+u+1kk8QJKeUxgRS0l
        zv0+QRXfSyk1ZQ9orrT6P5x7IFS55L2lL3Va7VoV76e4Vt0zPpzPEGVeiiOBJ11ZeyQoZ7L8xQT
        R2vrypcJIfUkFfUYOu7VuHPEBKMc35qDMNY4/Prld9fGb22QfSTT/gnjgaMZGE9PQBpOta+2drb
        vfHYZVI5S7LA==
X-Received: by 2002:a17:906:4150:: with SMTP id l16mr15526218ejk.90.1616347414020;
        Sun, 21 Mar 2021 10:23:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7JJ2to4dSvMXa6mEcCbe7EwRQ/2LaRJNAkrwmNsYwlQngObrzkKhRKk9qDKCK3ky3hjuz0Q==
X-Received: by 2002:a17:906:4150:: with SMTP id l16mr15526191ejk.90.1616347413742;
        Sun, 21 Mar 2021 10:23:33 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id m14sm8584437edd.63.2021.03.21.10.23.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Mar 2021 10:23:33 -0700 (PDT)
Subject: Re: [PATCH] Allow the FnLock LED to change state
To:     Esteve Varela <esteve.varela@gmail.com>
Cc:     Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>,
        ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org
References: <20210315195823.23212-1-esteve.varela@gmail.com>
 <0cbd3718-278f-ccc7-c389-b8ebb8338491@redhat.com>
 <CAFW5P13wE44FFXY=dUvJykzN_Qrg1mW_USjP4sp_8oXkjFVQTw@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <80f7329e-c85d-b45b-fd69-bef85a6ab026@redhat.com>
Date:   Sun, 21 Mar 2021 18:23:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAFW5P13wE44FFXY=dUvJykzN_Qrg1mW_USjP4sp_8oXkjFVQTw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/21/21 6:15 PM, Esteve Varela wrote:
> 2021-03-21 16:38 GMT, Hans de Goede <hdegoede@redhat.com>:
>> Hi,
>>
>> Thank you for your patch, I've applied this patch to my review-hans
>> branch:
>> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans
>>
>> And I'll also add it to the fixes branch so that it gets included in
>> one of the future 5.12-rc releases.
>>
>> Note it will show up in my review-hans branch once I've pushed my
>> local branch there, which might take a while.
>>
>> Once I've run some tests on this branch the patches there will be
>> added to the platform-drivers-x86/for-next branch and eventually
>> will be included in the pdx86 pull-request to Linus for the next
>> merge-window.
>>
>> Regards,
>>
>> Hans
> 
> Thanks a ton! Especially for making sure there's no hardware
> compatibility issues, since I was afraid that might've been an issue.
> I just noticed that there's a typo in a comment, "foce" that should be
> "force". Maybe that can be amended before the branch is merged
> elsewhere.

I've already pushed this to the public pdx86 git repo for-next and fixes
branches, so too late to amend.

If you can send a followup-patch fixing the type, then I'll add that to
for-next.

Regards,

Hans

