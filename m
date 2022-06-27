Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4604ACCA473
	for <platform-driver-x86@archiver.kernel.org>; Mon, 27 Jun 2022 07:52:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232460AbiF0Hwo (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 27 Jun 2022 03:52:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233167AbiF0Hwm (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 27 Jun 2022 03:52:42 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id BBF72614D
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Jun 2022 00:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1656316360;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zvnEckNZ0t6aw6dYsWsOgua6RSjEJtpEtX3LU+NwFVc=;
        b=P7eHg+FbkyVqLBgWMDn1usbPdJNlQGf0paF47wxwhssM5lniL+AaVdDsjuNRE0TTBWwuQL
        HF1pMSxGtLbgV/QMCU1y0asQy1zT1TdAeEcD3d6CyqwRRLh5gnFb7t2cn+A6fPJQqffG0R
        5FptSJoP/y8Gol8QtI7LJIRi9/JGuyY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-260-KDYBUgVLN9eXKgO6ntuKPQ-1; Mon, 27 Jun 2022 03:52:39 -0400
X-MC-Unique: KDYBUgVLN9eXKgO6ntuKPQ-1
Received: by mail-ed1-f71.google.com with SMTP id h4-20020a056402280400b00435abcf8f2dso6556064ede.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Jun 2022 00:52:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=zvnEckNZ0t6aw6dYsWsOgua6RSjEJtpEtX3LU+NwFVc=;
        b=3zXORYwfX6eAhD9FuPsXmhdMxkY80MIb2Z8bTd3id26Gr4PcCGwvGMzYU+4t6o7z/s
         jta8O77G7lusyRdC9QuPXB0I/gSBSwFP2yYdenKr7H5rRqTzpTCnBKJL+bDTD7B+bhT0
         W4F5lRHf/tFjhpJ8hXZA5QoqzPN0uaqt6DULHEGiZK0AyOsHaRtKxgTlvjP1RgKf0kh9
         O9JKctEZu3HTnspXa5SIFajte89CyVRpjCFevgp33NaANJlsiTbRxNuy7ThpdoWoaph9
         Jm/2oJSoMfusAe4FT5AU+AJd2vKGzSbY+glAoU3ALcZbppSFOrsTkBG1ofRZODGf+QDa
         gOIA==
X-Gm-Message-State: AJIora8nrenXBZxXUo+/cpn1VIeT+NZbcA043km1tUk0pHoUG1iBZu57
        PO1DFJQHMikuI3gjrZUx/vrCPv1kD9C8zNnTbAKRvDB3siLEx186VOIWF6r1dHZ/0VxuMcxb0kW
        jBTBG19GMtcZn2dFV6rHQuzEGx4V5OBnEIw==
X-Received: by 2002:a05:6402:2c4:b0:435:8ce0:aef8 with SMTP id b4-20020a05640202c400b004358ce0aef8mr14605046edx.140.1656316357985;
        Mon, 27 Jun 2022 00:52:37 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u+5KZUuGpblxj/yMxUJEx/3n9U33TPquKEG128zW87dbfTKcFA3G83NAdTJGMQ0d+rIIFptg==
X-Received: by 2002:a05:6402:2c4:b0:435:8ce0:aef8 with SMTP id b4-20020a05640202c400b004358ce0aef8mr14605032edx.140.1656316357843;
        Mon, 27 Jun 2022 00:52:37 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id r21-20020a1709067fd500b007025015599bsm4644756ejs.214.2022.06.27.00.52.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jun 2022 00:52:37 -0700 (PDT)
Message-ID: <e134b37f-6618-d3ad-7de7-3b376c30a16c@redhat.com>
Date:   Mon, 27 Jun 2022 09:52:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: do not use PSC mode on Intel
 platforms
Content-Language: en-US
To:     Mark Pearson <markpearson@lenovo.com>
Cc:     markgross@kernel.org, platform-driver-x86@vger.kernel.org
References: <markpearson@lenovo.com>
 <20220622181329.63505-1-markpearson@lenovo.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220622181329.63505-1-markpearson@lenovo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/22/22 20:13, Mark Pearson wrote:
> PSC platform profile mode is only supported on Linux for AMD platforms.
> 
> Some older Intel platforms (e.g T490) are advertising it's capability
> as Windows uses it - but on Linux we should only be using MMC profile
> for Intel systems.
> 
> Add a check to prevent it being enabled incorrectly.
> 
> Signed-off-by: Mark Pearson <markpearson@lenovo.com>
> ---
>  drivers/platform/x86/thinkpad_acpi.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index e6cb4a14cdd4..be194be43663 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -10548,6 +10548,11 @@ static int tpacpi_dytc_profile_init(struct ibm_init_struct *iibm)
>  				dytc_mmc_get_available = true;
>  		}
>  	} else if (output & BIT(DYTC_FC_PSC)) { /* PSC MODE */

After your recent patch series this now reads:

        } else if (dytc_capabilities & BIT(DYTC_FC_PSC)) { /* PSC MODE */

Please rebase on pdx86/for-next and send a new version.



> +		/* Support for this only works on AMD platforms */
> +		if (boot_cpu_data.x86_vendor != X86_VENDOR_AMD) {
> +			dbg_printk(TPACPI_DBG_INIT, "PSC not support on Intel platforms\n");
> +			return -ENODEV;
> +		}

So I assume that e.g. the T490 does advertise MMC capability so
this path is not actually hit there ?

IOW this is just a sanity check. Or is this path being hit on actual
hw? The reason I'm asking is because if the path is being hit on actual
hw then the patch should go to my fixes branch too.

Regards,

Hans



>  		dytc_profile_available = DYTC_FUNCMODE_PSC;
>  	} else {
>  		dbg_printk(TPACPI_DBG_INIT, "No DYTC support available\n");

