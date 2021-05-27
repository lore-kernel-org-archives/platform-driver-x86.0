Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5471EC47089
	for <platform-driver-x86@archiver.kernel.org>; Thu, 27 May 2021 14:36:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2C28B613D8
	for <platform-driver-x86@archiver.kernel.org>; Thu, 27 May 2021 14:36:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229861AbhE0Ohx (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 27 May 2021 10:37:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22682 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229603AbhE0Ohu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 27 May 2021 10:37:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1622126177;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ZeFVOf86f4t/nq0seAf60R9ANBQIePkgj2C54tfhB5w=;
        b=ftuRRxPW3xKDMExGTbRNGHGnt3DZmYIQ1UWiT2ZixyGbT/7WPo+X2ft74P8wtiGUmmKsLK
        Nfn6cNozfac0Ywutd7hF/oddZLKAmHqSsJDVfqDneBwehqgiZvaOOC1RFmfwHij8zyfA8j
        f/ln26DhiYtYxcc7D7lzfCxytOReR1I=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-ptTrZ_QHPzWXFDCGMEMNBw-1; Thu, 27 May 2021 10:36:14 -0400
X-MC-Unique: ptTrZ_QHPzWXFDCGMEMNBw-1
Received: by mail-ed1-f72.google.com with SMTP id e15-20020a056402148fb029038f9ac2d3afso425263edv.9
        for <platform-driver-x86@vger.kernel.org>; Thu, 27 May 2021 07:36:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZeFVOf86f4t/nq0seAf60R9ANBQIePkgj2C54tfhB5w=;
        b=hVuANl6fz181Jn+o34DGalbv89RAgbWQSCurYs+F/baz2eKbSNt09myaycERlYW3yk
         H+KE24TfriAd9j3gqvx08lkvLrTGF+8EdaaitzSQUIo+AzM6TnTf7HodUnQ8afPNK0lC
         +rTiK35LosPFs7NmYzDuvf/+QaVa107X8ewkiHtkj5Wloweaa7osKgQFZxL/CcBGCipF
         a1ng2cikbvZXAuQNcGWY/PRACQgMjwi8wk+gFXtfRdXiDr8CoRoLYc4HHI4MLNXetc7f
         /AxSxB11EbOUaUkRmd7Ilxjv7VFs7Pa1ROsQbe9qyL6+fH9te8094EVLJPk/M5+IBdfD
         9vuw==
X-Gm-Message-State: AOAM531gwgXzo6Y90FBz1nOm6e+5lD0E8RbIlYhbZJGGwqEprFC1H2lr
        h1NZY8KOd2Ev/ylcJCLzrVarFN1gFckaqdrHsBYmlUcjg7/5c0UMohUKSzvBNa28IyCpSN7JORT
        H0iAO6zRdLhAUw/JtP4nxoNI7EoQA3aOtW8bY4L0rAUnRnGBVkOtEyLWG3XYsRtoskcXteqL25k
        xwBuHn8gWHlQ==
X-Received: by 2002:a17:907:76b8:: with SMTP id jw24mr4122814ejc.359.1622126173418;
        Thu, 27 May 2021 07:36:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwnlrxsFwz42pevSvbW8NY7hROtEpk2rmMi4IB9hRwyGQEaJvMI0+2caYxybzowVYFCbuavow==
X-Received: by 2002:a17:907:76b8:: with SMTP id jw24mr4122781ejc.359.1622126173135;
        Thu, 27 May 2021 07:36:13 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id k8sm556233ejr.86.2021.05.27.07.36.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 May 2021 07:36:12 -0700 (PDT)
Subject: Re: [PATCH v4 3/3] platform/x86: think-lmi: Add WMI interface support
 on Lenovo platforms
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Mark Pearson <markpearson@lenovo.com>
Cc:     Prasanth KSR <prasanth.ksr@dell.com>,
        Divya Bharathi <divya.bharathi@dell.com>,
        Dell.Client.Kernel@dell.com,
        Platform Driver <platform-driver-x86@vger.kernel.org>
References: <markpearson@lenovo.com>
 <20210526201447.3686-1-markpearson@lenovo.com>
 <20210526201447.3686-3-markpearson@lenovo.com>
 <CAHp75Vd8wowab89tCZSJNfzAYAGCW8khD0JnmYTyT=czLT+R3A@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <721d908d-2cbf-9ae1-9792-385544b0783a@redhat.com>
Date:   Thu, 27 May 2021 16:36:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAHp75Vd8wowab89tCZSJNfzAYAGCW8khD0JnmYTyT=czLT+R3A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 5/27/21 4:16 PM, Andy Shevchenko wrote:
> On Wed, May 26, 2021 at 11:15 PM Mark Pearson <markpearson@lenovo.com> wrote:
>>
>> For Lenovo platforms that support a WMI interface to the BIOS add
>> support, using the firmware-attributes class, to allow users to access
>> and modify various BIOS related settings.
> 
> Thanks for an update! My comments below.

Since you have more remarks then I anticipated I guess it is best if I drop v4
from my review-hans branch and Mark does a v5.

Mark, you can then also just squash the addition of the MAINTAINERS
entry into v5.

<snip>

>> +       int pwdlen;
> 
> Strictly speaking it should be size_t.
> 
>> +       pwdlen = strlen(buf);
>> +       if (buf[pwdlen-1] == '\n')
>> +               pwdlen--;
> 
> But the question is what will happen with the string like
> 'pa55\nw0rd\n' (note all \n:s)?
> See also below.

As I already explained in a previous reply the password cannot
contain '\n' so this cannot happen. I did miss that this was
still there, where as new_password_store() uses strreplace()
which is not really consistent with each other...

>> +       char *set_str = NULL, *new_setting = NULL;
>> +       char *auth_str = NULL;
> 
> The rule of thumb is to avoid forward assignments on stack allocated
> variables. It may decrease readability, hide real issues, and simply
> be unneeded churn, like here. Please revisit all of them in entire
> series.

I asked for all this to be set to NULL in my review of v2,
since there are various "goto out"s in the function and out:
calls kfree() on all 3, in v2 there was a path which would
end up calling kfree() on an uninitialized char *. IMHO just
initializing all of them up front is best here because that
guarantees that they are either still NULL, or point to
memory returned by kmalloc.

>> +               /* Remove the value part */
>> +               strreplace(item, ',', '\0');
> 
> This is kinda non-standard pattern.
> 
> I would see rather something like
> 
> char *p;
> 
> p = strchrnul(item, ',');
> *p = '\0';
> 
> Yes, it's longer, but better to understand what's going on here.

Erm, you actually suggested using strreplace() here in your previous review ...


>> +       if (WARN_ON(pwdcfg.max_length >= TLMI_PWD_BUFSIZE))
>> +               pwdcfg.max_length = TLMI_PWD_BUFSIZE - 1;
> 
> Not sure if WARN_ON() is really what has to be called here. But I
> haven't checked the context deeply.

There are 2 max_lengths, one hardcoded in the driver so we don't
need to dynamically manage memory for the password storage and one
which is actually queried from the BIOS, the BIOS max-length should
always be less then the hardcoded one in the driver (and currently
this is true for all known models).

I suggested adding the WARN_ON so that if future BIOS-es ever bump
max_length we will get a bug-report about this and then we can
bump the driver's TLMI_PWD_BUFSIZE value.

Regards,

Hans

