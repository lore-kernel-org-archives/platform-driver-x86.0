Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BC48C433F5
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Mar 2022 10:59:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232777AbiCQLAQ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 17 Mar 2022 07:00:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232774AbiCQLAP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 17 Mar 2022 07:00:15 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7B026122997
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Mar 2022 03:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1647514738;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=AKCKqAy14Xe3pT/HVDH4e3L7zNJgq75sXQRbdajCM0s=;
        b=BAYpJijkRAiSf5RvfKpCByujWEc1kmPMAVskgSmyjQN4WhnA86WjEuRmVlDvTslZaF0Cdf
        gaggAQLAcszzR/OnF9OlqnFuH6HZN0n0XS+fOSqP+XGX7k/ww8iyJKKNeIhnOaVSW7mNdc
        qPlPFCT089WXtrnamZ8zj4UFx+Uj0bc=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-509-6OzM0UjxOlqXjaDwDBkLzA-1; Thu, 17 Mar 2022 06:58:57 -0400
X-MC-Unique: 6OzM0UjxOlqXjaDwDBkLzA-1
Received: by mail-ej1-f71.google.com with SMTP id hr26-20020a1709073f9a00b006d6d1ee8cf8so2681100ejc.19
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Mar 2022 03:58:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=AKCKqAy14Xe3pT/HVDH4e3L7zNJgq75sXQRbdajCM0s=;
        b=Cp6qjjszKAlXyvqmnP/a9PLld3SEo5Nbz9CasuXHFz3At/6R8PF5HR1HKoBAomfUJm
         8E8g3ZsJ5lEsHnHspIpKiVR2oHg8LF98NP/6CfdsG04ay0TEChQ/6oqddfuF8MPnyOGD
         fY11mBQ1JbFrqDmUhznUlzS4g8hAmsL916islhHxPhTsRvDYNq75tJ02GyIO40dsgf/K
         Wfpr/vzkzOM5yyBHHtYA+gw8HOd6SqPw+TfCWF9EXFXJR6+btYa5I49xQPOA7oOvpafn
         vCv8nDG55S6BgzMokVtxz2WevHuwLqMYDSLPBr8MFk7YCunr83tCc9OiFrHN+QcmZlgJ
         gXKw==
X-Gm-Message-State: AOAM531TUOcqMd2UO7yZE8GR1Cg74I+NVfaXzSLcbp79uc7MdiLE+6LY
        piFP6EOaOowHPQRTy47mzUZR4NCbsKj9yR+RbWhL2ds0hF196jT/5sUqn/X12WKv3yTdDDQjcza
        OjKL3DNGT9P0OHlRJglG2W+qAJDi74HClHA==
X-Received: by 2002:a17:907:9812:b0:6da:aaaf:7713 with SMTP id ji18-20020a170907981200b006daaaaf7713mr3760178ejc.163.1647514735900;
        Thu, 17 Mar 2022 03:58:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz8MaL0IhfRWJY/Y8wm8PH8/4wurFVYe+OfiAzRD6ynpDyLS9UXqqDZVwls99lRGtihgAYHKw==
X-Received: by 2002:a17:907:9812:b0:6da:aaaf:7713 with SMTP id ji18-20020a170907981200b006daaaaf7713mr3760163ejc.163.1647514735587;
        Thu, 17 Mar 2022 03:58:55 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:cdb2:2781:c55:5db0? (2001-1c00-0c1e-bf00-cdb2-2781-0c55-5db0.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:cdb2:2781:c55:5db0])
        by smtp.gmail.com with ESMTPSA id a1-20020a1709063e8100b006ce06ed8aa7sm2219679ejj.142.2022.03.17.03.58.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Mar 2022 03:58:55 -0700 (PDT)
Message-ID: <c3ef4c4e-9862-88f6-ef7f-2fd741ce9ea9@redhat.com>
Date:   Thu, 17 Mar 2022 11:58:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 1/2] Documentation: syfs-class-firmware-attributes:
 Lenovo Certificate support
Content-Language: en-US
To:     Mark Pearson <markpearson@lenovo.com>
Cc:     markgross@kernel.org, platform-driver-x86@vger.kernel.org
References: <markpearson@lenovo.com>
 <20220315195630.3209-1-markpearson@lenovo.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220315195630.3209-1-markpearson@lenovo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/15/22 20:56, Mark Pearson wrote:
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

This looks good, but looking at this a second time I still
have one open question:

What is the difference between removing a certificate and
switching back to password auth?

Looking at the WMI calls there are 4 different calls:

LENOVO_SET_BIOS_CERT_GUID
LENOVO_UPDATE_BIOS_CERT_GUID
LENOVO_CLEAR_BIOS_CERT_GUI
LENOVO_CERT_TO_PASSWORD_GUID

Going by these names I guess there can be only 1 certificate
otherwise I would expect:

1. add/remove naming
2. update to take an id of which certificate to replace

So I guess that LENOVO_CLEAR_BIOS_CERT_GUI disables all
authentication. IOW, installing a cert replaces/clears
the supervisor password and the difference between
clearing the certificate and cert-to-password is that
after clearing it we end up with no supervisor password
set, where as cert-to-password sets the passed in password
as the new supervisor password?

Or does clearing the certificate fall back to the old
supervisor password if one was set?  (that might lead to
some interesting issues if users clear the certificate
many years after the password was last used ...)

Given where we are in the cycle I was planning on adding
this to my review-hans branch so that it could maybe still
get into 5.18, but given the above questions as well
the remark about the test X1 BIOS you are using I've
a feeling it would be better to give this some more time
to bake and target 5.19 instead. Do you agree ?

Regardless  of this is 5.18 or 5.19 material can you? :

a) confirm that I've understood how the clearing vs cert-to-password
   works correctly ?
b) confirm that despite you using a test BIOS the WMI API for this is
   final and that it will *not* change before there are production
   BIOS-es with this ?
c) submit a version to clarify the clearing vs cert-to-password thing, e.g.:

@@ -276,6 +276,8 @@ Description:
 
 					You cannot enable certificate authentication if a supervisor password
 					has not been set.
+					Clearing the certificate results in no bios-admin authentication
+					method being configured allowing anyone to make changes.
 					After any of these operations the system must reboot for the changes to
 					take effect.


Regards,

Hans





> ---
> Changes in v2:
>  - Combined set_signature with signature and moved save_signature under
> the authorisation folder
>  - Fixed mistake in example for clearing certificate
> 
>  .../testing/sysfs-class-firmware-attributes   | 43 +++++++++++++++++++
>  1 file changed, 43 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-class-firmware-attributes b/Documentation/ABI/testing/sysfs-class-firmware-attributes
> index 13e31c6a0e9c..7ad52cf70ac9 100644
> --- a/Documentation/ABI/testing/sysfs-class-firmware-attributes
> +++ b/Documentation/ABI/testing/sysfs-class-firmware-attributes
> @@ -246,6 +246,49 @@ Description:
>  					that is being referenced (e.g hdd0, hdd1 etc)
>  					This attribute defaults to device 0.
>  
> +		certificate:
> +		signature:
> +		save_signature:
> +					These attributes are used for certificate based authentication. This is
> +					used in conjunction with a signing server as an alternative to password
> +					based authentication.
> +					The user writes to the attribute(s) with a BASE64 encoded string obtained
> +					from the signing server.
> +					The attributes can be displayed to check the stored value.
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
> +						echo '' > authentication/Admin/certificate
> +
> +					Changing a BIOS setting:
> +						echo <signature> > authentication/Admin/signature
> +						echo <save signature> > authentication/Admin/save_signature
> +						echo Enable > attribute/PasswordBeep/current_value
> +
> +					You cannot enable certificate authentication if a supervisor password
> +					has not been set.
> +					After any of these operations the system must reboot for the changes to
> +					take effect.
> +
> +		certificate_thumbprint:
> +					Read only attribute used to display the MD5, SHA1 and SHA256 thumbprints
> +					for the certificate installed in the BIOS.
> +
> +		certificate_to_password:
> +					Write only attribute used to switch from certificate based authentication
> +					back to password based.
> +					Usage:
> +						echo <signature> > authentication/Admin/signature
> +						echo <password> > authentication/Admin/certificate_to_password
>  
>  
>  What:		/sys/class/firmware-attributes/*/attributes/pending_reboot

