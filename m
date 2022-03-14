Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7106BC433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 14 Mar 2022 13:13:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237179AbiCNNOz (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 14 Mar 2022 09:14:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241677AbiCNNOy (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 14 Mar 2022 09:14:54 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A23F6B85A
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Mar 2022 06:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1647263623;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=v8/GJcNocKU2vTQQyGcq0O+M71fgVbiJ+hGOIq3PLJk=;
        b=ch0hyeAh9+8GWnZPJ5ADlf6J8qh0PMk3qHFiGDveh8I3Eh5NnhWht8eHX/cNYGXrbfS4IB
        AI/o/NpEjYnW6BJWgfMa3nrwDKa8NjLldCKu726yn9V/pPm0UmUky+hb85yUAF9DIFR7Gr
        lMCILqAqiu9qgzfotRrhp9rFQ1Ne994=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-97-yyuVnRpGNc62mrm39HLtwQ-1; Mon, 14 Mar 2022 09:13:42 -0400
X-MC-Unique: yyuVnRpGNc62mrm39HLtwQ-1
Received: by mail-ej1-f70.google.com with SMTP id q22-20020a1709064cd600b006db14922f93so7938137ejt.7
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Mar 2022 06:13:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=v8/GJcNocKU2vTQQyGcq0O+M71fgVbiJ+hGOIq3PLJk=;
        b=5VUeRfw5AaVa6VHyUNMUxv0SfmTzFrWCfn8t/8j5rufg9vq/5atP7CxvfdyADBLacI
         iKdGulvim/6hCV6r9xxtA9wB/ogDabUAefWdloJRMRS2KC98bX2kVTCKoi1wyG/03dHw
         hwNwJ4kDK5LZ4JHpxdBdQ8wqv0tktICAq5wbe8Tr36vu1AIeTWvC5zPmlIUrWM4iE785
         U5t3n8z4fS4YnaA5q0aiCihyaWP/eM07g+P6IHoWnD1kCb6e1jjl6sIj+jNbVn8+n96H
         USD9GM8fPDx2VScNI0oVFc5T6StJI/rgDZsgpYBFqOgnZsJ3g4p+DubZ1OeseisXcTCJ
         QcfA==
X-Gm-Message-State: AOAM532BDVfd3NpbA2zGUmBbP7tcZd6p6CMoz7Xv4cEyLbPTfuCZnhJI
        GjbMJXJwTOaB6WI8vv2E1OjCmbI/r3oNMbGO/piWPVEda31gNrFNXXGKjFyLH6adNQeexvYfEsg
        8YmCTNwTbg4cS5gnWSjHaQsc9p7egJgOZvg==
X-Received: by 2002:a17:906:1be1:b0:6ce:b0a8:17d with SMTP id t1-20020a1709061be100b006ceb0a8017dmr18044522ejg.413.1647263621119;
        Mon, 14 Mar 2022 06:13:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz6pRBSKq+yIzSGRiXrG42yIF7lUkgXQkq7jJBpyKh35U6ZfFEvVSm/vlOMRAhDZzKtxiyjFQ==
X-Received: by 2002:a17:906:1be1:b0:6ce:b0a8:17d with SMTP id t1-20020a1709061be100b006ceb0a8017dmr18044504ejg.413.1647263620932;
        Mon, 14 Mar 2022 06:13:40 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id f1-20020a056402194100b00416b174987asm6858265edz.35.2022.03.14.06.13.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Mar 2022 06:13:40 -0700 (PDT)
Message-ID: <2e05cd56-5bf1-6df7-890f-6759b6dab9f0@redhat.com>
Date:   Mon, 14 Mar 2022 14:13:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 1/2] Documentation: syfs-class-firmware-attributes: Lenovo
 Certificate support
Content-Language: en-US
To:     Mark Pearson <markpearson@lenovo.com>
Cc:     markgross@kernel.org, platform-driver-x86@vger.kernel.org
References: <markpearson@lenovo.com>
 <20220312000439.4143-1-markpearson@lenovo.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220312000439.4143-1-markpearson@lenovo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/12/22 01:04, Mark Pearson wrote:
> Certificate based authentication is available as an alternative to
> password based authentication.
> 
> The WMI commands are cryptographically signed using a separate
> signing server and will be verified by the BIOS before being
> accepted.
> 
> This commit details the fields that are needed to support that
> implementation. At present the changes are intended for Lenovo
> platforms, but have been designed to keep them as flexible as possible
> for future implementations from other vendors.
> 
> Signed-off-by: Mark Pearson <markpearson@lenovo.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>  .../testing/sysfs-class-firmware-attributes   | 52 +++++++++++++++++++
>  1 file changed, 52 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-class-firmware-attributes b/Documentation/ABI/testing/sysfs-class-firmware-attributes
> index 13e31c6a0e9c..1d9c3bb1dbcd 100644
> --- a/Documentation/ABI/testing/sysfs-class-firmware-attributes
> +++ b/Documentation/ABI/testing/sysfs-class-firmware-attributes
> @@ -246,6 +246,43 @@ Description:
>  					that is being referenced (e.g hdd0, hdd1 etc)
>  					This attribute defaults to device 0.
>  
> +		certificate:
> +		signature:
> +					These attributes are used for certificate based authentication. This is
> +					used in conjunction with a signing server as an alternative to password
> +					based authentication.
> +					The user writes to the attribute with a BASE64 encoded string obtained
> +					from the signing server.
> +					The attribute can be displayed to check the stored value.
> +
> +					Some usage examples:
> +					Installing a certificate to enable feature:
> +						echo <supervisor password > authentication/Admin/current_password
> +						echo <signed certificate> > authentication/Admin/certificate
> +
> +					Updating the installed certificate:
> +						echo <signature> > authentication/Admin/signature
> +						echo <signed certificate> > authentication/Admin/certificate
> +
> +					Removing the installed certificate:
> +						echo <signature> > authentication/Admin/signature
> +						echo '' > authentication/Admin/signature
> +
> +					You cannot enable certificate authentication if a supervisor password
> +					has not been set.
> +					After any of these operations the system must reboot for the changes to
> +					take effect
> +
> +		certificate_thumbprint
> +					Read only attribute used to display the MD5, SHA1 and SHA256 thumbprints
> +					for the certificate installed in the BIOS.
> +
> +		certificate_to_password
> +					Write only attribute used to switch from certificate based authentication
> +					back to password based.
> +					Usage:
> +						echo <signature> > authentication/Admin/signature
> +						echo <password> > authentication/Admin/certificate_to_password
>  
>  
>  What:		/sys/class/firmware-attributes/*/attributes/pending_reboot
> @@ -315,3 +352,18 @@ Description:
>  		use it to enable extra debug attributes or BIOS features for testing purposes.
>  
>  		Note that any changes to this attribute requires a reboot for changes to take effect.
> +
> +What:		/sys/class/firmware-attributes/*/attributes/set_signature
> +What:		/sys/class/firmware-attributes/*/attributes/save_signature
> +Date:		March 2022
> +KernelVersion:	5.18
> +Contact:	Mark Pearson <markpearson@lenovo.com>
> +Description:
> +		These attributes are used when certificate based authentication are enabled.
> +		The set_signature and save_signature are both obtained from the signing server
> +		and both need to be set when changing an attribute.
> +		Usage example:
> +			echo <set signature> > set_signature
> +			echo <save signature> > save_signature
> +			echo Enable > PasswordBeep/current_value
> +		The attributes can be read to display the stored value.

