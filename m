Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C73FAC433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue, 21 Dec 2021 18:53:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241559AbhLUSxv (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 21 Dec 2021 13:53:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48208 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231265AbhLUSxu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 21 Dec 2021 13:53:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1640112829;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=W5bwn3O7653maqUOsQ2orunU+e+HhtWjbrBZih1l38M=;
        b=DOlwAd/73ZYKKEXIlLTjisKbxv2gr26pwwyEIAsziUVLsXBXthYtrdljhOoOFB9JtjMTnI
        iIzjgrymblctCczFVCTZHjVQ7nPUubJ9N5+A7fZqrhRurBZbWy22+ABmZJoJjdc2O2X01q
        4MZEsUyX/mQ4GWwCwHE8igG5lhccZTs=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-573-uDgQEb4rM3eZP8xHCMe3ag-1; Tue, 21 Dec 2021 13:53:48 -0500
X-MC-Unique: uDgQEb4rM3eZP8xHCMe3ag-1
Received: by mail-ed1-f71.google.com with SMTP id l14-20020aa7cace000000b003f7f8e1cbbdso11144569edt.20
        for <platform-driver-x86@vger.kernel.org>; Tue, 21 Dec 2021 10:53:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=W5bwn3O7653maqUOsQ2orunU+e+HhtWjbrBZih1l38M=;
        b=PaOkuSsKFuwnRVhM8LyH3uPMiau09l/SYZgkg47ekEpDrG91G2EZQSgGk9IhihltOR
         XTrzjhn49EfSXAW2j6730gh0kICNV6su+DPLQKP2fcQVkAGTFpLoRtXUbldV50udyesC
         aAAyXRGrCNU93x/jn7UmIDV0omsm6OTBSso4RzJYF8AX1+41kj1KRRlR9z15CbYVuI8E
         dthgMIHPCTtbFegYiF9QHOzlhmz2pYVUUKbFiYoG/63DZ0TZ7/BoD12notnAb22qow9V
         M3v7KsqZVJJW+uEbLjWZBuBXoqvDXccSuITrb06AuUW3TkIs2zy7G5k+cZBgIbYNm8YI
         btsg==
X-Gm-Message-State: AOAM530wdelwV/IkfG3vzWTHDhffAi7e5ymFtgCpFVV5Dvm9KF8TMhUl
        LwMQPxqMKLhD2Cpy5Fjz2zkRsgue+vrDu7aX5J9Uy9T9rl3bi3TnvWX304f1ND9tUsmfJJmtCBQ
        oVlG7S3bB1kePt2wGz5i/xt4NI/zsUHeOtQ==
X-Received: by 2002:a17:907:76a1:: with SMTP id jw1mr3866651ejc.688.1640112827675;
        Tue, 21 Dec 2021 10:53:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwjwkqohLOc5TdyN9DabY2Tkk4s0dGx7aC1JkuKscorsxTYtCIRjM/aCM2mH0sM8SQTTtt4YQ==
X-Received: by 2002:a17:907:76a1:: with SMTP id jw1mr3866641ejc.688.1640112827515;
        Tue, 21 Dec 2021 10:53:47 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id ds1sm3378975ejc.97.2021.12.21.10.53.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Dec 2021 10:53:47 -0800 (PST)
Message-ID: <3a81d0b0-2dd6-7245-3eef-9fbbf864cbb5@redhat.com>
Date:   Tue, 21 Dec 2021 19:53:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v1 1/3] platform/x86: asus-wmi: Join string literals back
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "Luke D. Jones" <luke@ljones.dev>,
        acpi4asus-user@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Corentin Chary <corentin.chary@gmail.com>,
        Mark Gross <markgross@kernel.org>
References: <20211210163009.19894-1-andriy.shevchenko@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20211210163009.19894-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 12/10/21 17:30, Andy Shevchenko wrote:
> For easy grepping on debug purposes join string literals back in
> the messages.
> 
> No functional change.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thank you for your patch-series, I've applied the series to my
review-hans branch:
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
>  drivers/platform/x86/asus-wmi.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 6fa4b0be8e76..30e0de9e0d81 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -1154,12 +1154,10 @@ static void asus_rfkill_hotplug(struct asus_wmi *asus)
>  		absent = (l == 0xffffffff);
>  
>  		if (blocked != absent) {
> -			pr_warn("BIOS says wireless lan is %s, "
> -				"but the pci device is %s\n",
> +			pr_warn("BIOS says wireless lan is %s, but the pci device is %s\n",
>  				blocked ? "blocked" : "unblocked",
>  				absent ? "absent" : "present");
> -			pr_warn("skipped wireless hotplug as probably "
> -				"inappropriate for this model\n");
> +			pr_warn("skipped wireless hotplug as probably inappropriate for this model\n");
>  			goto out_unlock;
>  		}
>  
> 

