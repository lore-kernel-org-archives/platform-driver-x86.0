Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51799C433EF
	for <platform-driver-x86@archiver.kernel.org>; Thu, 30 Dec 2021 18:34:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241715AbhL3SeR (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 30 Dec 2021 13:34:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32437 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241707AbhL3SeR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 30 Dec 2021 13:34:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1640889254;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=FIGwMr+PvmyXXqjC3pPNsZTdUcIdkSnzJcVmxj7v5XY=;
        b=NpVgyUunl02nUhd5eoqKWhBUu1VMaGcnOi7r1X/3gDIjNxNXWSfotCJd9bHGcollWP/O7j
        xTaz606x2+wJpnN953rNm3emI58trPCSA44QBALzXdDiYhxKfFlcy+YUFd1zMtgZrhgHUt
        GSQflX/zwvwJTRyYttCdyiS/QlTXPqI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-661-3f1UekWKOmOGnnI51oqmsg-1; Thu, 30 Dec 2021 13:34:12 -0500
X-MC-Unique: 3f1UekWKOmOGnnI51oqmsg-1
Received: by mail-ed1-f71.google.com with SMTP id g11-20020a056402090b00b003f8fd1ac475so9753816edz.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 30 Dec 2021 10:34:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=FIGwMr+PvmyXXqjC3pPNsZTdUcIdkSnzJcVmxj7v5XY=;
        b=OPOqWn8bu3YNox3759/D7oYiw5NwEmKKFaW8nvWpi/urj8F1Z/hU3kS3NTnY0gisH0
         bBhUT3H/zgQS/I1cGvYyFBVMBs2uM1SsjgKVwk4wRQdDh+lJxe/BoOlN8owUj+4ZAO3L
         utdn1uDDzEI9SSsMlJwZeJ0mkOf3eRZ4YVVstkBFyflDZZQlKnhyMwPZBIhpcEOLZW5v
         D4BxG1rDjlNWpJSpMCnxaVUh2pB3DYEM6FYpYcxN6FCEnZQuSSyV98++ehK/o+vexZ6C
         E360myJfOcPDCO7p9HlXsibItg13m5NhtN2IwFXFT10o7h3RYgDV6fajPujiA2MbE+/s
         tTQQ==
X-Gm-Message-State: AOAM532s6RSaNAj0rXqjc2c5ct8M3evHxMPVX553azKOkem6tpTDycqh
        na+4E6NoqJKAHAQrSxTrVbe9UW7MzXzvptNkGmGOH0bJBBF1Hp1qfzm5YQBJTrNjbpZ4Y2KSKJe
        OwL+HSv1CP4pQpBiWlItWRWwML3Eg4LXexA==
X-Received: by 2002:a17:906:c147:: with SMTP id dp7mr25414294ejc.173.1640889251759;
        Thu, 30 Dec 2021 10:34:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxifA6H+4QTxin7cYDQI5pp+iHVtSBrm3OLfoZZKSi9zPQD+E8lr1XfGFEkTnOUbCyH4Oa+pg==
X-Received: by 2002:a17:906:c147:: with SMTP id dp7mr25414275ejc.173.1640889251529;
        Thu, 30 Dec 2021 10:34:11 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id ho9sm7846191ejc.86.2021.12.30.10.34.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Dec 2021 10:34:11 -0800 (PST)
Message-ID: <f47f24a1-bd34-4a30-959f-962c9df6afc6@redhat.com>
Date:   Thu, 30 Dec 2021 19:34:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] x86/platform/uv: use default_groups in kobj_type
Content-Language: en-US
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org
Cc:     Justin Ernst <justin.ernst@hpe.com>,
        Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org
References: <20211229141332.2552428-1-gregkh@linuxfoundation.org>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20211229141332.2552428-1-gregkh@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 12/29/21 15:13, Greg Kroah-Hartman wrote:
> There are currently 2 ways to create a set of sysfs files for a
> kobj_type, through the default_attrs field, and the default_groups
> field.  Move the uv sysfs code to use default_groups field which has
> been the preferred way since aa30f47cf666 ("kobject: Add support for
> default attribute groups to kobj_type") so that we can soon get rid of
> the obsolete default_attrs field.
> 
> Cc: Justin Ernst <justin.ernst@hpe.com>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Mark Gross <markgross@kernel.org>
> Cc: platform-driver-x86@vger.kernel.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans

> ---
>  drivers/platform/x86/uv_sysfs.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/uv_sysfs.c b/drivers/platform/x86/uv_sysfs.c
> index 956a354b57c1..625b0b79d185 100644
> --- a/drivers/platform/x86/uv_sysfs.c
> +++ b/drivers/platform/x86/uv_sysfs.c
> @@ -175,6 +175,7 @@ static struct attribute *uv_hub_attrs[] = {
>  	&cnode_attribute.attr,
>  	NULL,
>  };
> +ATTRIBUTE_GROUPS(uv_hub);
>  
>  static void hub_release(struct kobject *kobj)
>  {
> @@ -205,7 +206,7 @@ static const struct sysfs_ops hub_sysfs_ops = {
>  static struct kobj_type hub_attr_type = {
>  	.release	= hub_release,
>  	.sysfs_ops	= &hub_sysfs_ops,
> -	.default_attrs	= uv_hub_attrs,
> +	.default_groups	= uv_hub_groups,
>  };
>  
>  static int uv_hubs_init(void)
> @@ -327,6 +328,7 @@ static struct attribute *uv_port_attrs[] = {
>  	&uv_port_conn_port_attribute.attr,
>  	NULL,
>  };
> +ATTRIBUTE_GROUPS(uv_port);
>  
>  static void uv_port_release(struct kobject *kobj)
>  {
> @@ -357,7 +359,7 @@ static const struct sysfs_ops uv_port_sysfs_ops = {
>  static struct kobj_type uv_port_attr_type = {
>  	.release	= uv_port_release,
>  	.sysfs_ops	= &uv_port_sysfs_ops,
> -	.default_attrs	= uv_port_attrs,
> +	.default_groups	= uv_port_groups,
>  };
>  
>  static int uv_ports_init(void)
> 

