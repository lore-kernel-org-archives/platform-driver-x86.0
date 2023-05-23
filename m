Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85D56C7EE23
	for <platform-driver-x86@archiver.kernel.org>; Tue, 23 May 2023 10:47:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236493AbjEWKre (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 23 May 2023 06:47:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230174AbjEWKre (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 23 May 2023 06:47:34 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53D8D119
        for <platform-driver-x86@vger.kernel.org>; Tue, 23 May 2023 03:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1684838816;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=YdamzV1t3DecLpEkbaHfZsvvgjRzeqa9TpV6iGjo904=;
        b=RlgjD1MSz4fyIviLcqbVD/a+7nN1i6P8ANAiQizoHjYVy0hQubTpeXbqc/jd09NPiq7jle
        dCmhwUN9hEevapt9iF7jZKWPqbIMFrg3+f7eHli6XjtYINbl6jPemac++j5yY7TpIjInOt
        4RK2miK1rqR+1gRKTDrK0OlMp2MnE9w=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-424-53m9BXRwOSmdhLmv8MN39A-1; Tue, 23 May 2023 06:46:54 -0400
X-MC-Unique: 53m9BXRwOSmdhLmv8MN39A-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-50a16ab50e6so791895a12.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 23 May 2023 03:46:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684838814; x=1687430814;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YdamzV1t3DecLpEkbaHfZsvvgjRzeqa9TpV6iGjo904=;
        b=bLNIRAQ3vL8Mqb5EP7bmjEk6HPwaD1O0E7N44BJ58jQAjbc2Z8gXcCy0TUGsuXQIWT
         UzSdAvP4jhEZkNn1MXQFDJgzhnNSL3pdOEZx6KWc46MoVToT6zd/IBivRRMmD6MCBiqk
         9XHuQqFmWtvycX92L0tyRaRgkuZQWIdh2rpDu3BV4VXEdzz0YXGZD3tnmzXhNHa91UCO
         nQAGmT2YfJKK5LyaL3bpUXDB/IaZGTJFUhnDmGSmhTqvZCEd1xVgVqHgQp7JuLR5Rqse
         vFQZ9QUz9Tm7NLnte4nM/fxOf3m0o53jprajllCgB05FuWtIlPICQFdKIHOtfzyiYbkn
         5Ezg==
X-Gm-Message-State: AC+VfDx2bJlA7yL9kW7FmZmuoaFZT7w17DM8Ynnib8TpfD/V74lzwuiw
        Qd92sWGhzc1OGDc9/mxv1xU79Kvt1df3oWImTfysyGmR7zqQ+PMyKVRAYnJ3klifr3gbxnVCD+G
        QafA9D9q2HD1uZu4PsI7L1YrwGVIp8RW5Zw==
X-Received: by 2002:a17:907:74d:b0:94f:7edf:8fa1 with SMTP id xc13-20020a170907074d00b0094f7edf8fa1mr13028310ejb.32.1684838813948;
        Tue, 23 May 2023 03:46:53 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ791OsQNLyxRvm0hlAHuT1LWt1eKUmvsJqgUmQz6Jj33QWw/nF9uPCy+9VTbhkcgy3lyVXADQ==
X-Received: by 2002:a17:907:74d:b0:94f:7edf:8fa1 with SMTP id xc13-20020a170907074d00b0094f7edf8fa1mr13028296ejb.32.1684838813634;
        Tue, 23 May 2023 03:46:53 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id u25-20020a1709063b9900b009596e7e0dbasm4194292ejf.162.2023.05.23.03.46.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 May 2023 03:46:53 -0700 (PDT)
Message-ID: <ce7d7bef-c342-fb1a-8a7a-463ffcfd2896@redhat.com>
Date:   Tue, 23 May 2023 12:46:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/4] platform/x86: think-lmi: Correct System password
 interface
Content-Language: en-US, nl
To:     Mark Pearson <mpearson-lenovo@squebb.ca>
Cc:     markgross@kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <mpearson-lenovo@squebb.ca>
 <20230517181945.3725-1-mpearson-lenovo@squebb.ca>
 <20230517181945.3725-2-mpearson-lenovo@squebb.ca>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230517181945.3725-2-mpearson-lenovo@squebb.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Mark,

On 5/17/23 20:19, Mark Pearson wrote:
> The system password identification was incorrect. This means that if
> the password was enabled it wouldn't be detected correctly; and setting
> it would not work.
> 
> Correct these mistakes.
> 
> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> ---
>  drivers/platform/x86/think-lmi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
> index d9341305eba9..b8431d3b137f 100644
> --- a/drivers/platform/x86/think-lmi.c
> +++ b/drivers/platform/x86/think-lmi.c
> @@ -171,7 +171,7 @@ MODULE_PARM_DESC(debug_support, "Enable debug command support");
>  #define TLMI_POP_PWD (1 << 0)
>  #define TLMI_PAP_PWD (1 << 1)
>  #define TLMI_HDD_PWD (1 << 2)
> -#define TLMI_SYS_PWD (1 << 3)
> +#define TLMI_SYS_PWD (1 << 6)
>  #define TLMI_CERT    (1 << 7)
>  
>  #define to_tlmi_pwd_setting(kobj)  container_of(kobj, struct tlmi_pwd_setting, kobj)
> @@ -1504,7 +1504,7 @@ static int tlmi_analyze(void)
>  		tlmi_priv.pwd_power->valid = true;
>  
>  	if (tlmi_priv.opcode_support) {
> -		tlmi_priv.pwd_system = tlmi_create_auth("sys", "system");
> +		tlmi_priv.pwd_system = tlmi_create_auth("smp", "system");

"smp" ?

Also this is not explained in the commit message.

Regards,

Hans


>  		if (!tlmi_priv.pwd_system)
>  			goto fail_clear_attr;
>  

