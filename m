Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB997C54EBE
	for <platform-driver-x86@archiver.kernel.org>; Thu, 12 Jan 2023 18:59:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232299AbjALS7m (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 12 Jan 2023 13:59:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232390AbjALS7Q (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 12 Jan 2023 13:59:16 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B78F272C
        for <platform-driver-x86@vger.kernel.org>; Thu, 12 Jan 2023 10:34:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1673548465;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=pMyBsurTrOrBdUBQOhVpxlnPQwAHbsr12zAnv8OghaQ=;
        b=Bx600DDkJ5eUUwUXlh/acnbacgQdwGWUuUxU7G2lRDnlml+9bzZjldQRgdaS5XgkiRsIat
        B8WlD6lRrV7HWekxj/vkJJGo8jDHGMWwjcBc0ACU01Bobw08zRYpAdCfO/CfR39pgl0mvm
        pjUukUCBW35rQJ2b2V17lrjXQg2Fz30=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-258-ZmqzwNZ9OJei0xm4STOd5g-1; Thu, 12 Jan 2023 13:34:24 -0500
X-MC-Unique: ZmqzwNZ9OJei0xm4STOd5g-1
Received: by mail-ej1-f70.google.com with SMTP id xj11-20020a170906db0b00b0077b6ecb23fcso13310925ejb.5
        for <platform-driver-x86@vger.kernel.org>; Thu, 12 Jan 2023 10:34:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pMyBsurTrOrBdUBQOhVpxlnPQwAHbsr12zAnv8OghaQ=;
        b=iEJPdcoYnoZe2n0yIcRLlwpl3YOHzsYndmbezeETy5XxJP1Hl1AMrxN8i0edm4ttdW
         ZkosvzW9D1aTNanTgTaqoBSEeUj52P7PzxP6RKAlgY6JqB2mMnCnrjd1KGzqNumN3oSd
         I8SPp0j+hqFarGHCPjlTpn72bRp2NOOsklhx71AWE/PHFNQ6EOSCYAu6pIvO4/I8Nuo+
         TTQvEYs2FD1Frig8eOsicLC9gIYhZ3S1yMwrjTtljBwYe6zsHJQywfVMOufUh7EPvk6y
         0w8OFX1xSnbgQQG+US/lW2ZimoK+ZAxWkioMrQdQp1u2wFZe3fcq3mbXK6Md5vLQ4MHm
         Eosg==
X-Gm-Message-State: AFqh2kqpDHgvBh7rPSIY3YzMEgaOW3Hjnc/07w/8MD7SOUG+8ivF/Ygt
        oooRFxdPkFlz6xa243T4s9LasvXqessdJMd3N1onjCBuDC2YhmAPP7gYNB91IR3BGt34kVkeVZf
        Jy++JmGgFCzVAVdxLtNP6pb3p9jzE+zq+Zg==
X-Received: by 2002:a17:906:cb8a:b0:868:63ac:7d52 with SMTP id mf10-20020a170906cb8a00b0086863ac7d52mr1560838ejb.49.1673548463057;
        Thu, 12 Jan 2023 10:34:23 -0800 (PST)
X-Google-Smtp-Source: AMrXdXssDQ7SgD+A3lhbW+3/AzELMBCwrrPCBCrbJ9S1LoncZANxuPgYqiQjXXkcGv9upXAIKL1QkA==
X-Received: by 2002:a17:906:cb8a:b0:868:63ac:7d52 with SMTP id mf10-20020a170906cb8a00b0086863ac7d52mr1560833ejb.49.1673548462920;
        Thu, 12 Jan 2023 10:34:22 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id e15-20020a170906314f00b007bd1ef2cccasm7595698eje.48.2023.01.12.10.34.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 10:34:22 -0800 (PST)
Message-ID: <4b33d63e-ad90-b218-2fed-842ee0f7afeb@redhat.com>
Date:   Thu, 12 Jan 2023 19:34:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] platform/x86: asus-nb-wmi: Add alternate mapping for
 KEY_SCREENLOCK
Content-Language: en-US, nl
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org,
        Nemcev Aleksey <Nemcev_Aleksey@inbox.ru>
References: <20230112181841.84652-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230112181841.84652-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 1/12/23 19:18, Hans de Goede wrote:
> The 0x33 keycode is emitted by Fn + F6 on a ASUS FX705GE laptop.
> 
> Reported-by: Nemcev Aleksey <Nemcev_Aleksey@inbox.ru>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I've added this to my review-hans (soon to be for-next) branch now.

Regards,

Hans


> ---
>  drivers/platform/x86/asus-nb-wmi.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
> index c685a705b73d..9987bb11c6e9 100644
> --- a/drivers/platform/x86/asus-nb-wmi.c
> +++ b/drivers/platform/x86/asus-nb-wmi.c
> @@ -511,6 +511,7 @@ static const struct key_entry asus_nb_wmi_keymap[] = {
>  	{ KE_KEY, 0x30, { KEY_VOLUMEUP } },
>  	{ KE_KEY, 0x31, { KEY_VOLUMEDOWN } },
>  	{ KE_KEY, 0x32, { KEY_MUTE } },
> +	{ KE_KEY, 0x33, { KEY_SCREENLOCK } },
>  	{ KE_KEY, 0x35, { KEY_SCREENLOCK } },
>  	{ KE_KEY, 0x38, { KEY_PROG3 } }, /* Armoury Crate */
>  	{ KE_KEY, 0x40, { KEY_PREVIOUSSONG } },

