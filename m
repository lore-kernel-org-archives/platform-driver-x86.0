Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E76BFC432BE
	for <platform-driver-x86@archiver.kernel.org>; Thu, 12 Aug 2021 08:04:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C44566103E
	for <platform-driver-x86@archiver.kernel.org>; Thu, 12 Aug 2021 08:04:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235075AbhHLIE2 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 12 Aug 2021 04:04:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30215 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235092AbhHLIEV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 12 Aug 2021 04:04:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1628755434;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Qx8Shhu7rI5wSD137gu2JFMhjeGxiRtny4lEcXGkPMA=;
        b=J3EYoA6VCrzv4glvRvrozkjw7DuCG/0b3ZvjqpQHLIGIiBST7ox5u6r2YrsuFHahRbkwRh
        JkrA/OkvcStIGPOjEdZv2nKRyYem0Ja0P5UqeQKf/fmlcWHUgRzjkLcfOMy8e/kkWvOY2w
        SXkBtsneP6IJWqjjcnw/SwvhIBNKgh0=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-8rRwZNTvNI24mF4AF01dVQ-1; Thu, 12 Aug 2021 04:03:52 -0400
X-MC-Unique: 8rRwZNTvNI24mF4AF01dVQ-1
Received: by mail-ej1-f72.google.com with SMTP id gg35-20020a17090689a3b0290580ff45a075so1483871ejc.20
        for <platform-driver-x86@vger.kernel.org>; Thu, 12 Aug 2021 01:03:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Qx8Shhu7rI5wSD137gu2JFMhjeGxiRtny4lEcXGkPMA=;
        b=tTrbP/puv+6RnbdbXm4mcHUqlNiiN5fzpYhtKvGWkyrZBUEGdKg2jPlSV++3rvLnjy
         Ry/KyxcGcMRmCYQiczXHPnLLa/s+ZOjLmObxpjWCWN5v2Lc53zU1ACPHsuPElZpEBzmT
         /ByUJZV+57p2SlLXRUOMktB4iCDgraZ/zgJ1oYOzZGNpkjPACgiNCjW60IzGFH7QHbPN
         mNdHzQyh3lveg83DgMT5pfPkri4eBs8Klq7oOnbrC8yxidFy5l8f0JNtiTYWSNP4oxaU
         5DjuoylW45Y4bvrcMze4TP+zKRsWJ52UuqrW1d6akg3R9ZDoI2ywDjZLiyWOZ3ffdDps
         pUMQ==
X-Gm-Message-State: AOAM532XzJkvRNcyE6+A8Sso5QCuElo0MwwVUw8flxZjcxNkHLlVM85Q
        iyxkMbc5cx22qmi0aPXsM3kfbWdv0Tec0KFK3I8KNUgj2a90jJqK7mzObL6YVU/Kq3cyCZiWL53
        R8kK/EgFISCs0po2OToNivrk5qrNa+nXfbQ==
X-Received: by 2002:a17:906:bc5a:: with SMTP id s26mr2477539ejv.11.1628755431616;
        Thu, 12 Aug 2021 01:03:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwR4xlL1YR/rmqfWDucvZuyWYsjA0UpggBan/Z0inZ6za/Ebs0DG0Wy65jZeP+BSORL/b5YrQ==
X-Received: by 2002:a17:906:bc5a:: with SMTP id s26mr2477528ejv.11.1628755431470;
        Thu, 12 Aug 2021 01:03:51 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id d22sm517201ejj.47.2021.08.12.01.03.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Aug 2021 01:03:51 -0700 (PDT)
Subject: Re: [PATCH] [v2,1/1] Fix WWAN device disabled issue after S3 deep
To:     Slark Xiao <slark_xiao@163.com>, hmh@hmh.eng.br,
        Mark Pearson <markpearson@lenovo.com>
Cc:     ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210811093407.5583-1-slark_xiao@163.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <70e53b58-4785-5a3d-9525-a7f9e93cd0d2@redhat.com>
Date:   Thu, 12 Aug 2021 10:03:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210811093407.5583-1-slark_xiao@163.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/11/21 11:34 AM, Slark Xiao wrote:
> When WWAN device wake from S3 deep, under thinkpad platform,
> WWAN would be disabled. This disable status could be checked
>  by command 'nmcli r wwan' or 'rfkill list'.
> Issue analysis as below:
>   When host resume from S3 deep, thinkpad_acpi driver would
> call hotkey_resume() function. Finnaly, it will use
> wan_get_status to check the current status of WWAN device.
> During this resume progress, wan_get_status would always
> return off even WWAN boot up completely.
>   If wan_get_status() return off, rfkill_set_sw_state() would set WWAN's
> status as disabled.
>   This may be a fault of LENOVO BIOS.
>   Workaround is add a WWAN device check before rfkill_set_sw_state().
> If it's a Foxconn WWAN device, then we will ignore to do a status update.
> 
> Signed-off-by: Slark Xiao <slark_xiao@163.com>

Thank you for debugging this and thank you for the patch.

I'm not in favor of using a pci-device-id list here. Maybe we should
simply just never update the sw-rfkill state after a suspend-resume ?

I mean the sw_state should be unchanged after a suspend/resume.

Only the hw_state on older devices which still have a physical
radio on/off slider on the side might have changed during suspend.

So I think it might be better to just drop the tpacpi_rfk_update_swstate
call all together from the resume path?

Mark do you have any input here?

Regards,

Hans



> ---
>  drivers/platform/x86/thinkpad_acpi.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 603156a6e3ed..e3b7bc0e7a33 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -1159,6 +1159,13 @@ struct tpacpi_rfk_ops {
>  
>  static struct tpacpi_rfk *tpacpi_rfkill_switches[TPACPI_RFK_SW_MAX];
>  
> +/*Foxconn SDX55 T77W175 products. All available device ID*/
> +static const struct pci_device_id foxconn_device_ids[] = {
> +	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xE0AB) },
> +	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xE0AF) },
> +	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xE0B4) },
> +	{}
> +};
>  /* Query FW and update rfkill sw state for a given rfkill switch */
>  static int tpacpi_rfk_update_swstate(const struct tpacpi_rfk *tp_rfk)
>  {
> @@ -1182,8 +1189,13 @@ static void tpacpi_rfk_update_swstate_all(void)
>  {
>  	unsigned int i;
>  
> -	for (i = 0; i < TPACPI_RFK_SW_MAX; i++)
> -		tpacpi_rfk_update_swstate(tpacpi_rfkill_switches[i]);
> +	for (i = 0; i < TPACPI_RFK_SW_MAX; i++) {
> +		if (pci_dev_present(foxconn_device_ids) && i == 1)
> +			pr_info("Find Foxconn wwan device, ignore to update rfkill switch status\n");
> +		else
> +			tpacpi_rfk_update_swstate(tpacpi_rfkill_switches[i]);
> +
> +	}
>  }
>  
>  /*
> 

