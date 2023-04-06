Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3894C77B6C
	for <platform-driver-x86@archiver.kernel.org>; Thu,  6 Apr 2023 10:45:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236584AbjDFKpZ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 6 Apr 2023 06:45:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229620AbjDFKpY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 6 Apr 2023 06:45:24 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 093194ED0
        for <platform-driver-x86@vger.kernel.org>; Thu,  6 Apr 2023 03:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1680777876;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TjBeC5ttXVWU6637sM9DbdFklYW1fd4puIgmp2kM1PM=;
        b=Dfz3CX7Dora/lPJopnZd4/oDS5Li9WbwPWSEtjWD5vjA0az3lxMuCANL/To+VKeKPduXEy
        BfD3E5YOUgtgiMa51I2bs0w01hr4VgAEKKvusZcWhJctUPRl+Po8i0HGzuZ2UKVJswL41M
        eRrC+Ky/jQjHaehHmGcDCEkTS7o3Ypc=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-70-PKnB4thkM0GJNGoDZmSD-w-1; Thu, 06 Apr 2023 06:44:33 -0400
X-MC-Unique: PKnB4thkM0GJNGoDZmSD-w-1
Received: by mail-ej1-f71.google.com with SMTP id de5-20020a1709069bc500b009339c9c32ffso48107ejc.5
        for <platform-driver-x86@vger.kernel.org>; Thu, 06 Apr 2023 03:44:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680777872; x=1683369872;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TjBeC5ttXVWU6637sM9DbdFklYW1fd4puIgmp2kM1PM=;
        b=qwlgWFPSNkI1w1Mnnpt3oFfIHKHXcz20+q425WDfUc3hA3BZjA2SDRBU799VAgnd5G
         /Wm1W6v84t+YAMpS76AnqG1Wd+W3g35PVY8FZgp6bflasPhrlx7s0YLVGLBBWLjEKATb
         2z9Bf8as3dylpRGFu/ajnDjhlBu+SzNHscwaWl07bmaes+nwAhIOB4t//nKbTo/f9wUg
         WyrvBZ+2Nx22TtoIyKRwU/ARoophKj/Oy4vyhi+KCeKq+4LeVpEVhneFlTKiujQ1AGmo
         uaaziJ3jUu5lFNItQdqsXS51WxpnaTi5jCG+wm5T0biCVpE+Ilp7veGQ3NNryqhHltr3
         pzXQ==
X-Gm-Message-State: AAQBX9dNLUp+LoEZ5EetuFMUD7xPo4Ey92G2jJOqQWf/4DE4EB4JVFVk
        X7LaT1wMTgY3KIn+rhsqf0LEiLBOapMc9xZpO4NU8MfM8t/b+qPTMGaZ63QH4EnHHT2Cfet8E5/
        0AZJaGDlKIxMZXz4Ozv15YrLIV91G068U0bTtMxur1Q==
X-Received: by 2002:a17:906:5383:b0:939:4c86:d47b with SMTP id g3-20020a170906538300b009394c86d47bmr5936477ejo.19.1680777871849;
        Thu, 06 Apr 2023 03:44:31 -0700 (PDT)
X-Google-Smtp-Source: AKy350YKw5d9sAnmrCv7+iF3IpuymujbqUnc6kSfxderJa9L09/Chkn5ceYeFPalKsTfyG9jc8ZvEw==
X-Received: by 2002:a17:906:5383:b0:939:4c86:d47b with SMTP id g3-20020a170906538300b009394c86d47bmr5936465ejo.19.1680777871569;
        Thu, 06 Apr 2023 03:44:31 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id rj13-20020a1709076c8d00b00947ccb6150bsm520220ejc.102.2023.04.06.03.44.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Apr 2023 03:44:30 -0700 (PDT)
Message-ID: <c12fcff3-d9aa-2d8d-7053-224207defc26@redhat.com>
Date:   Thu, 6 Apr 2023 12:44:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] platform/x86: think-lmi: Remove unnecessary casts for
 attributes
Content-Language: en-US, nl
To:     =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <linux@weissschuh.net>,
        Mark Pearson <markpearson@lenovo.com>,
        Mark Gross <markgross@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230329-think-lmi-attrs-v1-1-5794f2367cc2@weissschuh.net>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230329-think-lmi-attrs-v1-1-5794f2367cc2@weissschuh.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/29/23 06:50, Thomas Weißschuh wrote:
> These casts are unnecessary and could break if structure layouts are
> randomized or implementation details change.
> Use the proper syntax that works without casts.
> 
> Also remove some unnecessary braces that checkpatch complains about.
> 
> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans



> ---
>  drivers/platform/x86/think-lmi.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
> index c816646eb661..02bfd6e3fed2 100644
> --- a/drivers/platform/x86/think-lmi.c
> +++ b/drivers/platform/x86/think-lmi.c
> @@ -862,19 +862,18 @@ static umode_t auth_attr_is_visible(struct kobject *kobj,
>  	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
>  
>  	/* We only want to display level and index settings on HDD/NVMe */
> -	if ((attr == (struct attribute *)&auth_index) ||
> -			(attr == (struct attribute *)&auth_level)) {
> +	if (attr == &auth_index.attr || attr == &auth_level.attr) {
>  		if ((setting == tlmi_priv.pwd_hdd) || (setting == tlmi_priv.pwd_nvme))
>  			return attr->mode;
>  		return 0;
>  	}
>  
>  	/* We only display certificates on Admin account, if supported */
> -	if ((attr == (struct attribute *)&auth_certificate) ||
> -			(attr == (struct attribute *)&auth_signature) ||
> -			(attr == (struct attribute *)&auth_save_signature) ||
> -			(attr == (struct attribute *)&auth_cert_thumb) ||
> -			(attr == (struct attribute *)&auth_cert_to_password)) {
> +	if (attr == &auth_certificate.attr ||
> +	    attr == &auth_signature.attr ||
> +	    attr == &auth_save_signature.attr ||
> +	    attr == &auth_cert_thumb.attr ||
> +	    attr == &auth_cert_to_password.attr) {
>  		if ((setting == tlmi_priv.pwd_admin) && tlmi_priv.certificate_support)
>  			return attr->mode;
>  		return 0;
> 
> ---
> base-commit: fcd476ea6a888ef6e6627f4c21a2ea8cca3e9312
> change-id: 20230329-think-lmi-attrs-994abb757e98
> 
> Best regards,

