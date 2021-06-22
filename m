Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A538C2B9F4
	for <platform-driver-x86@archiver.kernel.org>; Tue, 22 Jun 2021 09:44:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 451D361026
	for <platform-driver-x86@archiver.kernel.org>; Tue, 22 Jun 2021 09:44:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231134AbhFVJrG (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 22 Jun 2021 05:47:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31953 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230062AbhFVJqr (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 22 Jun 2021 05:46:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1624355071;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ZnHz+Kb/k8djzKRBhujdDSHv/gB4KDn3lRZpnZ5mqXU=;
        b=NAu45FKdGESt0PrSZkUWDcPyZ3J2HZ7YChlhjM1CN9pLCeH2t/TcTxpgVxEOUlubC9N1NC
        Mvtp+/585cvFlgZPpQPiaLxWUD123AmdnELvNgLcbGoN7M6ED6aPPNWn+c3d4Uois1lBtz
        6kMsm5h/KBp/knEpqNe+5ol51ISY8Js=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-246-k1zLjWChOGKip4LXqvDeoA-1; Tue, 22 Jun 2021 05:44:29 -0400
X-MC-Unique: k1zLjWChOGKip4LXqvDeoA-1
Received: by mail-ed1-f69.google.com with SMTP id j19-20020aa7c4130000b029039497d5cdbeso5108423edq.15
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Jun 2021 02:44:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZnHz+Kb/k8djzKRBhujdDSHv/gB4KDn3lRZpnZ5mqXU=;
        b=TK3w/HaH1Iy8l0NpSPZqTVrSCU/M7hOQFHsaJ2hiKiumdXmcAjecpLxK9TjYLlgoO4
         PutB2gjYDm+PGLwggH9GEd2cux5GTSfJoubcka81Q2KM+mc1LeYK+ZjR1hJQzPvYUvo5
         ufO81/sqOgsMSX0UCeDf6U9Kd8xoKzCYXDIxzmkE57wCHMNvRMxs1/DD/IL/bJMxEXYe
         +dIKDA1Hz2h30CakwCxdtGYK580SE4Ail8X5FTH7Z2laBneQpx5Y/vt/kbDfLR8R8UMU
         C6s5TW9ZLUQTPAyeNgvBlD/T3qw5fUAbAhlSSA5/+TkQzm+4c/mSuWqc6HvHi5JM7QLf
         YAHA==
X-Gm-Message-State: AOAM531RS60KMf6TMt0HSN1+aZvvsmQy0H9KtET8O60mQAmih94N/TJM
        udSN9MrdDGpAVLVxTV+GbNcgG7bWAhtfhbn3eYHa+iONm6S2ZbPXMfdsAQd7EsZ9rT3PgN28I5b
        9eAfAUplVOYwvPggM3ehF4/f+ZZdISQNGvQ==
X-Received: by 2002:aa7:d893:: with SMTP id u19mr3724312edq.304.1624355068441;
        Tue, 22 Jun 2021 02:44:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxEAafbeP0zXT3yRIvrCssUEQarJ1xP2InkugDXigRdobR0SdrLgty1IJleeQi5ugigaJnNsA==
X-Received: by 2002:aa7:d893:: with SMTP id u19mr3724297edq.304.1624355068325;
        Tue, 22 Jun 2021 02:44:28 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id dj24sm1645792edb.21.2021.06.22.02.44.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jun 2021 02:44:26 -0700 (PDT)
Subject: Re: [PATCH v2] platform/x86: think-lmi: Return EINVAL when kbdlang
 gets set to a 0 length string
To:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>,
        Mark Pearson <markpearson@lenovo.com>
Cc:     platform-driver-x86@vger.kernel.org,
        =?UTF-8?Q?Juha_Lepp=c3=a4nen?= <juha_efku@dnainternet.net>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20210621193648.44138-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <cc80431c-373a-8f00-406c-f64e0131858e@redhat.com>
Date:   Tue, 22 Jun 2021 11:44:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210621193648.44138-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/21/21 9:36 PM, Hans de Goede wrote:
> Commit 0ddcf3a6b442 ("platform/x86: think-lmi: Avoid potential read before
> start of the buffer") moved the length == 0 up to before stripping the '\n'
> which typically gets added when users echo a value to a sysfs-attribute
> from the shell.
> 
> This avoids a potential buffer-underrun, but it also causes a behavioral
> change, prior to this change "echo > kbdlang", iow writing just a single
> '\n' would result in an EINVAL error, but after the change this gets
> accepted setting kbdlang to an empty string.
> 
> Fix this by replacing the manual '\n' check with using strchrnul() to get
> the length till '\n' or terminating 0 in one go; and then do the
> length != 0 check after this.
> 
> Fixes: 0ddcf3a6b442 ("platform/x86: think-lmi: Avoid potential read before start of the buffer")
> Reported-by: Juha Leppänen <juha_efku@dnainternet.net>
> Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I've added this patch to my review-hans (soon to be for-next) branch now,

Regards,

Hans


> ---
> Changes in v2:
> - Use strchrnul() to get the length and strip any trailing '\n' in one go
> ---
>  drivers/platform/x86/think-lmi.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
> index c6c9fbb8a53e..b57061079288 100644
> --- a/drivers/platform/x86/think-lmi.c
> +++ b/drivers/platform/x86/think-lmi.c
> @@ -442,14 +442,9 @@ static ssize_t kbdlang_store(struct kobject *kobj,
>  	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
>  	int length;
>  
> -	length = strlen(buf);
> -	if (!length)
> -		return -EINVAL;
> -
> -	if (buf[length-1] == '\n')
> -		length--;
> -
> -	if (length >= TLMI_LANG_MAXLEN)
> +	/* Calculate length till '\n' or terminating 0 */
> +	length = strchrnul(buf, '\n') - buf;
> +	if (!length || length >= TLMI_LANG_MAXLEN)
>  		return -EINVAL;
>  
>  	memcpy(setting->kbdlang, buf, length);
> 

