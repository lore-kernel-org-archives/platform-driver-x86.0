Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3313C433F5
	for <platform-driver-x86@archiver.kernel.org>; Mon, 11 Apr 2022 13:48:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238607AbiDKNvI (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 11 Apr 2022 09:51:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234271AbiDKNvH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 11 Apr 2022 09:51:07 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7BC91237E4
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Apr 2022 06:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1649684932;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=XwXgcei9SbdqAK1dbUbQrW+TYjFRKZ4TDkuvHnbp5AI=;
        b=A6KpK+TRXH7q9AIR3Z/a33YFLXOQRqCJQIejJUJYbayrMyM4CVfPWhodDLX1BUyPVBhEFP
        VDwDjJFEQ8ZVnlIKYumbNXSzJ2CNjMkulyvsIS3YbvFFBhIWaNeZhvFy/J1Q7ega8ftoCP
        cqIQQSf4K0Ouq69mRZtgA62fpFB3r+Y=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-317-Mk_nDoNNPM6BR_l7PYDUOQ-1; Mon, 11 Apr 2022 09:48:51 -0400
X-MC-Unique: Mk_nDoNNPM6BR_l7PYDUOQ-1
Received: by mail-ej1-f70.google.com with SMTP id m12-20020a1709062acc00b006cfc98179e2so7057386eje.6
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Apr 2022 06:48:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=XwXgcei9SbdqAK1dbUbQrW+TYjFRKZ4TDkuvHnbp5AI=;
        b=FxFTacqDZLzGkh/RcVyq1nkCE6OvsA9cObip109aezgs7xu4eFGwXz0NM5V3WU3iMG
         OiCo6wCsPv2XLOBngMlLp6StrFJzBnWuTl9T410g/BKqB4znAWnlB8r9pq0tkrpqqEGv
         4JOBaJDtZBRHUTsqQb8rOQN/Ks6xlPb6rTeIn/wC65mpVyTPa7qe4w+HJ0D0vA+Xebhh
         +dt/teLYHhzJ8MPtN98dlfVHD3hXiLZ+ZdKfcygtfEEXAr5O9KmNpwJ45ZkkrHq/fKgB
         D7/rP35mBRt4uLAA/j+SI4SYmaJdyP2agFPYo3KJ3hkOEYRlgsvucI10Xd7QZSK/QEVt
         ipHw==
X-Gm-Message-State: AOAM533krDoO0p+p7tcoTFSsl/S07h1kihWGKmZrXoLCUeyeEMaBio39
        9YJOOGXUiEH/Ks4glQ1MXtko2n0UJ9VOAyGHz3/SuVZhKDW4iQuIHtD7XnohFVrL8J3ekn6HeLG
        tFdFHNhB43UqtJupUZBRDyVamN+8ZSy1QzQ==
X-Received: by 2002:a17:906:58ce:b0:6e7:f925:fc5c with SMTP id e14-20020a17090658ce00b006e7f925fc5cmr29642769ejs.674.1649684929855;
        Mon, 11 Apr 2022 06:48:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzWVMFikn0DsIQxRluVQYBpJednk+TaobeFhn4YZEg8e/fO5DYAs9ZOgztGoA1ouS8tMaeNpA==
X-Received: by 2002:a17:906:58ce:b0:6e7:f925:fc5c with SMTP id e14-20020a17090658ce00b006e7f925fc5cmr29642754ejs.674.1649684929654;
        Mon, 11 Apr 2022 06:48:49 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id z5-20020a1709063a0500b006da8fa9526esm12088339eje.178.2022.04.11.06.48.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Apr 2022 06:48:49 -0700 (PDT)
Message-ID: <efb7e4bd-a758-3d70-6967-78fa176055e5@redhat.com>
Date:   Mon, 11 Apr 2022 15:48:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [External] Re: Dell laptop touchpad disabling?
Content-Language: en-US
To:     Mark Pearson <markpearson@lenovo.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Dell.Client.Kernel@dell.com
Cc:     =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>,
        Stuart Hayes <stuart.w.hayes@gmail.com>,
        Divya Bharathi <divya.bharathi@dell.com>,
        Prasanth Ksr <prasanth.ksr@dell.com>,
        Perry Yuan <Perry.Yuan@dell.com>
References: <b9d9171d-1287-e5aa-46d2-2475817074ba@infradead.org>
 <d1192588-8993-5052-6018-7a2f8393cff9@redhat.com>
 <225c5a10-59a8-d33e-abac-5fbb4341a6eb@lenovo.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <225c5a10-59a8-d33e-abac-5fbb4341a6eb@lenovo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Mark,

On 3/21/22 23:18, Mark Pearson wrote:
> 
> Apologies if this is thread hijacking...but I've got a similarish
> problem on Lenovo laptops that we have on the todo list to investigate
> so wanted to jump in with a somewhat related question...

No problem.

> On 3/18/22 04:54, Hans de Goede wrote:
>>
>> Regardless of the method, the kernel's responsibility here is
>> to make sure the touchpad gets seen as a touchpad and after that
>> "disabling" it is a userspace problem.
>>
> 
> The issue on our platforms is that if you disable the touchpad in the
> BIOS it doesn't actually disable the touchpad. It sets a flag in the EC
> registers to let the OS know the touchpad is not supposed to be enabled
> (I only just found out this is how it is supposed to work).

Interesting.

> I'm not 100% sure the reasons for this - I think it's to do with keeping
> the trackpoint usable (maybe).

Yes that makes sense the trackpoint often sends its data to the touchpad
which then muxes the trackpoint data into its own datastream as special
trackpoint packets. So disabling the touchpad at the hw level would also
disable the trackpoint in these kinda setups.

> So just curious on the comment above - is there a standard way to let
> user space know to ignore the touchpad or disable it by default?

Not yet, but we could define one. Or we could even try to see if
a patch to drop all non trackpoint data inside the kernel when the
flag is set would be accepted.

Someone needs to write the code for this though and if we want to let
userspace know also define a userspace API. I think the all kernel
solution might be the easiest to implement, but I'm not sure if this
will be accepted by the input subsystem maintainer.

> I'm obviously being lazy here as I've been meaning to go and read code
> but I was flicking thru the mailing list and this caught my eye....and
> if there's a shortcut to the answer that would be awesome.
> 
> I've no idea if this is a Lenovo specific issue or more generic - but
> this thread made me wonder if it's actually a common/standard problem?

This is the first time I have heard about this.

Regards,

Hans

