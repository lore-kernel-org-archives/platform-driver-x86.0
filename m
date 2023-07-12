Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 735EFEB64D9
	for <platform-driver-x86@archiver.kernel.org>; Wed, 12 Jul 2023 15:14:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232303AbjGLPOi (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 12 Jul 2023 11:14:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231523AbjGLPOi (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 12 Jul 2023 11:14:38 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9971D1BC9
        for <platform-driver-x86@vger.kernel.org>; Wed, 12 Jul 2023 08:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689174834;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=J4jj/mQeZxkriiAdmR1sFT2gdMhpSQaioylXdFXQ1Gw=;
        b=DY3e3DHuxDN7NP8Qg14vu8dQL5GEF/80gatVgbUFuHe6c3gdAb/sHHWxGz2LSoFbFG1MFy
        u3UYpr/AMZf5vkWT6zjkftyZbZGnYl7+JDQ3tw2RwRuKONLYTyP3CLUPbHCQYaA8rNUyWk
        GCchal5pKLf0JFypJfO92iFyHWpU8Ys=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-9-ucKUIm-RMjuZuE6rZ3AyYQ-1; Wed, 12 Jul 2023 11:13:53 -0400
X-MC-Unique: ucKUIm-RMjuZuE6rZ3AyYQ-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-993d41cbc31so347887366b.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 12 Jul 2023 08:13:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689174832; x=1691766832;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J4jj/mQeZxkriiAdmR1sFT2gdMhpSQaioylXdFXQ1Gw=;
        b=Kg11knDjMWX+sGATD62m6n8EYD+AKdTOwoXQeVjgOlfDZ0oZ9/XX6oSQn7PL8TmlxS
         p6K6TgkgHEXNFZFVo9a06X8pKjHThpcAX9hKqg+dPPF6tqK3MuT9SI3CFkV1s4rYmmkQ
         CT+WHY4xe5GrpluiU7/yimvBLxO+BoRedQcaq1XEF1MesBUBk4YVqZCpqu4CTswiJ/Hy
         uTEoSujL9fs+euIRhuI+e3b73YjkH7jMQmERIdr1gv6+1euTu+nQn1c7P4bqd2m8AYPr
         f9jzZWIy+85FDty2MSfTIuGLHMUpB6AEZmZCic5ClGg1wpZPwmk9ADaXFE3nL4d9FZ7c
         AhMw==
X-Gm-Message-State: ABy/qLbSkls3cXNMGAVAIg/mQjMoGcEw/h0+aitcffDoSP13cvI0E7tn
        RdYd229TexGVOzLl0bQ5Dut5OpJZWn6kWQgG3yEP9lIPDpI+INmKUhLKChOe8k/62TpB4Ug4np1
        5iqHr9DmrMLqMaaN4XBghoCB9AfLAeHf/0Q==
X-Received: by 2002:a17:907:2383:b0:98d:63c5:d132 with SMTP id vf3-20020a170907238300b0098d63c5d132mr18180649ejb.72.1689174832552;
        Wed, 12 Jul 2023 08:13:52 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHPC7AnwJQvnOUd4EsxNO3LMICF6ZcJtexOZVlWjEk1rKThg6OlCjH4FzvAvbDTQLDCn+pCOw==
X-Received: by 2002:a17:907:2383:b0:98d:63c5:d132 with SMTP id vf3-20020a170907238300b0098d63c5d132mr18180627ejb.72.1689174832296;
        Wed, 12 Jul 2023 08:13:52 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id s8-20020a170906a18800b0098e0a937a6asm2703274ejy.69.2023.07.12.08.13.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jul 2023 08:13:51 -0700 (PDT)
Message-ID: <0cc30dc8-64d9-e58d-a436-fe92b8dcfb85@redhat.com>
Date:   Wed, 12 Jul 2023 17:13:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: Add Silicom Platform Driver
Content-Language: en-US, nl
To:     Henry Shi <henryshi2018@gmail.com>, tglx@linutronix.de,
        mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
        x86@kernel.org, hpa@zytor.com, markgross@kernel.org,
        jdelvare@suse.com, linux@roeck-us.net,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-hwmon@vger.kernel.org
Cc:     wenw@silicom-usa.com, henrys@silicom-usa.com
References: <20230630203529.GA20585@build.adi.eng>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230630203529.GA20585@build.adi.eng>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Henri,

On 6/30/23 22:35, Henry Shi wrote:
> Please review this patch.
> 
> The Silicom platform (silicom-platform) Linux driver for Swisscom
> Business Box (Swisscom BB) as well as Cordoba family products is a 
> software solution designed to facilitate the efficient management
> and control of devices through the integration of various Linux
> frameworks. This platform driver provides seamless support for
> device management via the Linux LED framework, GPIO framework,
> Hardware Monitoring (HWMON), and device attributes. The Silicom
> platform driver's compatibility with these Linux frameworks allows
> applications to access and control Cordoba family devices using
> existing software that is compatible with these frameworks. This
> compatibility simplifies the development process, reduces
> dependencies on proprietary solutions, and promotes
> interoperability with other Linux-based systems and software.
> 
> Thanks!
> 
> Henry Shi
> Silicom Ltd.
> Henrys@silicom-usa.com
> Henryshi2018@gmail.com

Thank you for the patch.

The Kconfig bits for this should be in drivers/platform/x86/Kconfig please move them there.

Please send a new version with that change with the contents of the patch actually in the body of the email so that we can quoute it while replying for review purposes.

Please use git send-email on the .patch file to submit the next version, e.g. :

git send-email Silicom-Platform-Driver.patch

Do NOT copy and paste the contents of the patch to your email client to send it, this will mangle the patch and make it unusable.

Once we have a submission with the patch content in the body of the email (with git send-email) then I'll try to make time to do a more thorough review.

Regards,

Hans

