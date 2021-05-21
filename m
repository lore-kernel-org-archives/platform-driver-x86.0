Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5918FC433ED
	for <platform-driver-x86@archiver.kernel.org>; Fri, 21 May 2021 09:37:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 385B5613BF
	for <platform-driver-x86@archiver.kernel.org>; Fri, 21 May 2021 09:37:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229462AbhEUJjU (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 21 May 2021 05:39:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57535 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229457AbhEUJjT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 21 May 2021 05:39:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1621589876;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=06KSAnpiktWENsetJDv0Rq1ncCV+ZL4ehzxKlvaZrAw=;
        b=HuOl/yge3eBZ3ErcokODDEj3o/FUREpiNcA++sdrAOGze/DG/fQSf3OS4ZCW3/VSiyIf9q
        E+Y65pM4zlu7C26U5OhZfNmuN22QBfoFH2UVjnWAT55VBynERG89KGugFJXqjD40M+qLLv
        CAwZq4mG3HN/b1EH4Wrn2nAyHDG1/8s=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288-4xXxinpdPWSawAhRHlw4ug-1; Fri, 21 May 2021 05:37:54 -0400
X-MC-Unique: 4xXxinpdPWSawAhRHlw4ug-1
Received: by mail-ej1-f69.google.com with SMTP id p18-20020a1709067852b02903dab2a3e1easo2990301ejm.17
        for <platform-driver-x86@vger.kernel.org>; Fri, 21 May 2021 02:37:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=06KSAnpiktWENsetJDv0Rq1ncCV+ZL4ehzxKlvaZrAw=;
        b=ku1/NBsDv/4Ti0JJ4+zzAUQ4JAdlR1U1nCOqGGlHxElgRLmwHf9Knzv0/kj0XwY5lk
         DwWYGJUghqS8zhlixwQGHOTSlErhAvbGwzTiBq63fvEJ6LgfDSx8rJCXXa6Dfe2t90dD
         tLqR3wj5ZcbyZNTkpjilHYz8fMdsbC8ibe1lCu0BF4FyIDiqP+m+qh2LTTaTZYNIJsSW
         mcYivrqdP+JCy1EbE739npaOLHm1rxhq/LDo69A8FDenw0NCri6mFUDWSL/OP6hwakXJ
         dXdvEy5FfUElxvFK1eWELxsUCEQfjjr7ge7k1uRcgEFcwSF9jUnqwwmsOfNAJhrrBtoh
         YIDw==
X-Gm-Message-State: AOAM531mozLXTq5Wry9PeQ1d0Ml/vYpHWSMXomALWLKJic6mss1f168q
        SauIdNuB0K2L0tD6IZ1TrNaU0BjD7OCLGPLIlVvB6pkGFWEUkDLWX4YqHgk3+5OPdKA8eWDhlbU
        kyuEXjRt38/88i7B3PoXZPB5t8QHVJXYRsA==
X-Received: by 2002:a50:eb47:: with SMTP id z7mr10465619edp.68.1621589873406;
        Fri, 21 May 2021 02:37:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwFQhr8+vAe0B5LGXK476UiBZN8e+gKT6UaEAVnwk1qspgwVbjLi3dsl7Jhw5NgH5Ny83k6NA==
X-Received: by 2002:a50:eb47:: with SMTP id z7mr10465611edp.68.1621589873282;
        Fri, 21 May 2021 02:37:53 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id c22sm3570730edy.59.2021.05.21.02.37.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 May 2021 02:37:52 -0700 (PDT)
Subject: Re: [External] Re: [PATCH v2 3/3] platform/x86: think-lmi: Add WMI
 interface support on Lenovo platforms
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Pearson <markpearson@lenovo.com>
Cc:     mgross@linux.intel.com, platform-driver-x86@vger.kernel.org,
        divya.bharathi@dell.com, prasanth.ksr@dell.com
References: <markpearson@lenovo.com>
 <20210509015708.112766-1-markpearson@lenovo.com>
 <20210509015708.112766-3-markpearson@lenovo.com>
 <bbd0f3c9-63c3-2fbb-7712-ecb3131a4c0a@redhat.com>
 <ac30f95e-8398-fb11-8c94-b50050a3f88f@lenovo.com>
 <1c21c3d3-7ff1-a7b2-86d0-245050426760@redhat.com>
Message-ID: <76468200-b133-48f7-316f-9ddfcc350d4f@redhat.com>
Date:   Fri, 21 May 2021 11:37:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <1c21c3d3-7ff1-a7b2-86d0-245050426760@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 5/21/21 10:10 AM, Hans de Goede wrote:

<snip>

Some minor corrections to my last email:

> This also make me realize that the code has 2 max-pwd-lengths:
> 
> setting->maxlen
> TLMI_PWD_MAXLEN
> 
> I think you should put a:
> 
> 	if (WARN_ON(pwdcfg.max_length > TLMI_PWD_MAXLEN))
> 		pwdcfg.max_length = TLMI_PWD_MAXLEN;

This needs to be:

 	if (WARN_ON(pwdcfg.max_length >= TLMI_PWD_MAXEN))
 		pwdcfg.max_length = TLMI_PWD_MAXLEN - 1;

To account for the terminating 0 (maybe bump TLMI_PWD_MAXEN with 1
and rename it to TLMI_PWD_BUFSIZE?)

> in tlmi_analyze() so that we get a kernel-backtrace (and thus bugreports
> if this condition ever becomes true.
> 
> And then use pwdcfg.max_length everywhere (e.g. also for the check in
> current_password_store()).
> 
> Also the length checks in current_password_store() and new_password_store() 
> should probably also check against settings->minlen ?

I just realized that current_password_store() should also allow a length
of 0 to clear the password when the user is done making changes, so the
check in current_password_store() should be something like this:

	/* len == 0 is allowed to clear the password */
	if (len != 0 && (len < setting->minlen || len > setting->maxlen))
		return -EINVAL;

Regards,

Gans

