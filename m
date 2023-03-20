Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFBFEC7618A
	for <platform-driver-x86@archiver.kernel.org>; Mon, 20 Mar 2023 13:57:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231458AbjCTN5k (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 20 Mar 2023 09:57:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231433AbjCTN5T (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 Mar 2023 09:57:19 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41B36125AA
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Mar 2023 06:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679320581;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Sg2iPRr7ZTZsIxbfAeIpxo5FjkH+rrqMJ/3ftajj5Ws=;
        b=SMqoh/AS5J0PAsNDNbiDYjbRTStZef5NwpchDNOj7lRUaqc97HnfpNV6LqfDSy9xEGbAt1
        FWRQCRsiR8kCyTXxs7Qbj17kZFIBWOqhbKZESF/z7gkrQrTpV1jbV2p0lgjVCyeta8nQrm
        pDGr1xGb9e+aIhzDa9F037lV63uly74=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-403-5P18bV8EPbmSxJs9VLDcNQ-1; Mon, 20 Mar 2023 09:56:20 -0400
X-MC-Unique: 5P18bV8EPbmSxJs9VLDcNQ-1
Received: by mail-ed1-f72.google.com with SMTP id t26-20020a50d71a000000b005003c5087caso16134576edi.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Mar 2023 06:56:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679320579;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sg2iPRr7ZTZsIxbfAeIpxo5FjkH+rrqMJ/3ftajj5Ws=;
        b=IbbDDFaFhUxUYMNQC/ugsDFkmBTEwy5/qsoAU7IoiqpgQt2XXb1smUJWDP90xpNpYh
         44vtrWKy4IHSiMUdG5iPFEXOyTCEDxv4kPhS34MQpOOt9zgzraRme78cMOHL5yCaTH8k
         ogdZABGzby0WnZlj1PVX9bEiNSp3s2mgwDXJrTivMg3CIetlgJiHaKo5anV3hIzZwt+l
         ii7rZrWn1WnDltnCf4ERCSrzC0lWniMFm+ur+WoX5cGyHn8k8Q/YWVu7Kq0kfAxR7hFn
         Eue+W4tf/ZvmpvjFVfWI+ISLQV45GvssyX1OTWj2VUFpN1sw2xfoKSr5LTpbXdXGvkYA
         LFUw==
X-Gm-Message-State: AO0yUKXQ+d/3e6pSSWy0dVPuG4CNl6NzbEeg7TkLxywS9ipzWHnjCrHp
        TNJOSQ3agZbPpO7YIirNGSnu5E/Fst/Xp0TkFA2eFF19apkNUmv+zLE7K/GokLpJO8qNmEQJGvg
        6SNT/xiolJAxl60AiyRkp+QFyyZ508lQ0YA==
X-Received: by 2002:a17:906:260a:b0:92e:efa:b9be with SMTP id h10-20020a170906260a00b0092e0efab9bemr9520761ejc.18.1679320578824;
        Mon, 20 Mar 2023 06:56:18 -0700 (PDT)
X-Google-Smtp-Source: AK7set82gcE1IQgXoMezvtr//XCZuXdYpTXxI95ej+N8ijAdH5YBwXSv9fEveGBiUPqJ0eF4172mOw==
X-Received: by 2002:a17:906:260a:b0:92e:efa:b9be with SMTP id h10-20020a170906260a00b0092e0efab9bemr9520744ejc.18.1679320578561;
        Mon, 20 Mar 2023 06:56:18 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id d13-20020a170906344d00b009318ad4a583sm4470464ejb.210.2023.03.20.06.56.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 06:56:17 -0700 (PDT)
Message-ID: <8b6dd11e-f166-37e4-8ed4-f92b94b3a7ac@redhat.com>
Date:   Mon, 20 Mar 2023 14:56:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 1/4] platform/x86: think-lmi: add missing type
 attribute
Content-Language: en-US
To:     Mark Pearson <mpearson-lenovo@squebb.ca>,
        =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <linux@weissschuh.net>
Cc:     markgross@kernel.org, markpearson@lenovo.com, thomas@t-8ch.de,
        pobrn@protonmail.com, linux-kernel@vger.kernel.org,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
References: <mpearson-lenovo@squebb.ca>
 <20230320003221.561750-1-mpearson-lenovo@squebb.ca>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230320003221.561750-1-mpearson-lenovo@squebb.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Mark,

It seems that while adding linux-kernel@vger.kernel.org you have dropped
platform-driver-x86@vger.kernel.org. For future patches please Cc both.

platform-driver-x86@vger.kernel.org needs to be Cc-ed for patches
to show up in patchwork:
https://patchwork.kernel.org/project/platform-driver-x86/list/

Which I use as my primary means of tracking which patches I need
to review / merge (note no need to resend this series I have it
on my radar).

More importantly you seem to not have Cc-ed
Thomas Weißschuh on this version ?

I have added Thomas to the Cc now, so that he can respond to this
version.

Regards,

Hans





On 3/20/23 01:32, Mark Pearson wrote:
> This driver was missing the mandatory type attribute...oops.
> 
> Add it in along with logic to determine whether the attribute is an
> enumeration type or a string by parsing the possible_values attribute.
> 
> Upstream bug https://bugzilla.kernel.org/show_bug.cgi?id=216460
> 
> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> ---
> Changes in v4:
>  - Unchanged. Sending to linux-kernel mailing list as recommended
> Changes in v3:
>  - Rebased on latest pdx86, review_hans branch
> Changes in v2: 
>  - Simplify the code and move type determination into show function
>  - Don't use Fixes with URL in commit info
> 
>  drivers/platform/x86/think-lmi.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
> index cc66f7cbccf2..a765bf8c27d8 100644
> --- a/drivers/platform/x86/think-lmi.c
> +++ b/drivers/platform/x86/think-lmi.c
> @@ -947,6 +947,20 @@ static ssize_t possible_values_show(struct kobject *kobj, struct kobj_attribute
>  	return sysfs_emit(buf, "%s\n", setting->possible_values);
>  }
>  
> +static ssize_t type_show(struct kobject *kobj, struct kobj_attribute *attr,
> +		char *buf)
> +{
> +	struct tlmi_attr_setting *setting = to_tlmi_attr_setting(kobj);
> +
> +	if (setting->possible_values) {
> +		/* Figure out what setting type is as BIOS does not return this */
> +		if (strchr(setting->possible_values, ','))
> +			return sysfs_emit(buf, "enumeration\n");
> +	}
> +	/* Anything else is going to be a string */
> +	return sysfs_emit(buf, "string\n");
> +}
> +
>  static ssize_t current_value_store(struct kobject *kobj,
>  		struct kobj_attribute *attr,
>  		const char *buf, size_t count)
> @@ -1036,10 +1050,13 @@ static struct kobj_attribute attr_possible_values = __ATTR_RO(possible_values);
>  
>  static struct kobj_attribute attr_current_val = __ATTR_RW_MODE(current_value, 0600);
>  
> +static struct kobj_attribute attr_type = __ATTR_RO(type);
> +
>  static struct attribute *tlmi_attrs[] = {
>  	&attr_displ_name.attr,
>  	&attr_current_val.attr,
>  	&attr_possible_values.attr,
> +	&attr_type.attr,
>  	NULL
>  };
>  

