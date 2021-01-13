Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C711AC433E0
	for <platform-driver-x86@archiver.kernel.org>; Wed, 13 Jan 2021 09:26:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6727C2339F
	for <platform-driver-x86@archiver.kernel.org>; Wed, 13 Jan 2021 09:26:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726900AbhAMJ0R (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 13 Jan 2021 04:26:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48700 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725988AbhAMJ0R (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 13 Jan 2021 04:26:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1610529890;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=A9ksjDeyfuxGoy9asdFqUc8798GrLEWqzUIv9UWdtSg=;
        b=cGm+VwQfCJKo3exQiEE3KQj1NOg3XTg+oJPWN1Owr+BCBYGg8wq7kxBit4Sv7qY2UXkVFm
        vhszfbu/i5Ww1KRKToxNK9cwl038wddn1r2nTs0J+XzgccmEwr8UHsjzHQjI8ER8/8HXkN
        yA+krfIbisG4bXOEuhCBX/vmKm/ZSek=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-432-fDp-_THSNiG9lRBUtiNbKQ-1; Wed, 13 Jan 2021 04:24:48 -0500
X-MC-Unique: fDp-_THSNiG9lRBUtiNbKQ-1
Received: by mail-ed1-f71.google.com with SMTP id u17so587154edi.18
        for <platform-driver-x86@vger.kernel.org>; Wed, 13 Jan 2021 01:24:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=A9ksjDeyfuxGoy9asdFqUc8798GrLEWqzUIv9UWdtSg=;
        b=fLGHAh0GtlDTOjxIEC2GmsZ/HMVwxR+XiuM6HdsKObiXZBKvrLc3ofx8aPo02YzSWk
         WqXtHBrTuuDIji/M/+7zQ2rmbRnX209DJ5qEcufZv3PkpsJNH+IN6awxCxdCTp6YBsCc
         /xUAqClqo88JsPUMODKu5+YugZwnbYBdFDTcZZQsAOzOoiWnDht0VMg5nAvQldC2+jr1
         +4H7tZpxsNliHoXgI8M6d6umt3kKxl7BJrJxsBcBWG4jOK5TFPujVHn9UZLFDAqcm2ag
         dYJjpb4w/OX0jSoA2lHH6iphrbPPBeyuTskUGtFjozKIfUAvwfx1TVZCG3U/L4yOJd1V
         Ba8A==
X-Gm-Message-State: AOAM5328yS/mh9pXTcNV4bJl9nqrLhMzsyidOqgwDKFLlHIxuzaAGlMh
        +L/7+H2n9PBUyCcCCnAcssQzs+Eoa5omkP5zlAbzlk37R36KxBFaF3sPfx4HA2IEpw7Byz655Ki
        SdMtJdrxk43oAiDOYCAs/ZNzDwjBcAKaotw==
X-Received: by 2002:a17:906:4756:: with SMTP id j22mr913253ejs.353.1610529887241;
        Wed, 13 Jan 2021 01:24:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzr/Q3eR5rbgGFzsCsWj6QifS8PJJQr4SQXFTihkxnSILUE2KyVi+mMvDiJlpsTOlpvOWjqlg==
X-Received: by 2002:a17:906:4756:: with SMTP id j22mr913244ejs.353.1610529887047;
        Wed, 13 Jan 2021 01:24:47 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id u19sm465252ejg.16.2021.01.13.01.24.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Jan 2021 01:24:46 -0800 (PST)
Subject: Re: [PATCH fixes v4] platform/x86: ideapad-laptop: Disable
 touchpad_switch for ELAN0634
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        platform-driver-x86@vger.kernel.org
Cc:     stable@vger.kernel.org, Ike Panhc <ike.pan@canonical.com>,
        Mark Gross <mgross@linux.intel.com>,
        linux-kernel@vger.kernel.org
References: <20210107144438.12605-1-jiaxun.yang@flygoat.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <dba9db5f-fa66-6003-382d-b35d5643d0d2@redhat.com>
Date:   Wed, 13 Jan 2021 10:24:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210107144438.12605-1-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 1/7/21 3:44 PM, Jiaxun Yang wrote:
> Newer ideapads (e.g.: Yoga 14s, 720S 14) come with ELAN0634 touchpad do not
> use EC to switch touchpad.
> 
> Reading VPCCMD_R_TOUCHPAD will return zero thus touchpad may be blocked
> unexpectedly.
> Writing VPCCMD_W_TOUCHPAD may cause a spurious key press.
> 
> Add has_touchpad_switch to workaround these machines.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Cc: stable@vger.kernel.org # 5.4+

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

I will also cherry-pick this into the fixes branch and include
it in a future fixes pull-req for 5.11 .

Regards,

Hans




> --
> v2: Specify touchpad to ELAN0634
> v3: Stupid missing ! in v2
> v4: Correct acpi_dev_present usage (Hans)
> ---
>  drivers/platform/x86/ideapad-laptop.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
> index 7598cd46cf60..5b81bafa5c16 100644
> --- a/drivers/platform/x86/ideapad-laptop.c
> +++ b/drivers/platform/x86/ideapad-laptop.c
> @@ -92,6 +92,7 @@ struct ideapad_private {
>  	struct dentry *debug;
>  	unsigned long cfg;
>  	bool has_hw_rfkill_switch;
> +	bool has_touchpad_switch;
>  	const char *fnesc_guid;
>  };
>  
> @@ -535,7 +536,9 @@ static umode_t ideapad_is_visible(struct kobject *kobj,
>  	} else if (attr == &dev_attr_fn_lock.attr) {
>  		supported = acpi_has_method(priv->adev->handle, "HALS") &&
>  			acpi_has_method(priv->adev->handle, "SALS");
> -	} else
> +	} else if (attr == &dev_attr_touchpad.attr)
> +		supported = priv->has_touchpad_switch;
> +	else
>  		supported = true;
>  
>  	return supported ? attr->mode : 0;
> @@ -867,6 +870,9 @@ static void ideapad_sync_touchpad_state(struct ideapad_private *priv)
>  {
>  	unsigned long value;
>  
> +	if (!priv->has_touchpad_switch)
> +		return;
> +
>  	/* Without reading from EC touchpad LED doesn't switch state */
>  	if (!read_ec_data(priv->adev->handle, VPCCMD_R_TOUCHPAD, &value)) {
>  		/* Some IdeaPads don't really turn off touchpad - they only
> @@ -989,6 +995,9 @@ static int ideapad_acpi_add(struct platform_device *pdev)
>  	priv->platform_device = pdev;
>  	priv->has_hw_rfkill_switch = dmi_check_system(hw_rfkill_list);
>  
> +	/* Most ideapads with ELAN0634 touchpad don't use EC touchpad switch */
> +	priv->has_touchpad_switch = !acpi_dev_present("ELAN0634", NULL, -1);
> +
>  	ret = ideapad_sysfs_init(priv);
>  	if (ret)
>  		return ret;
> @@ -1006,6 +1015,10 @@ static int ideapad_acpi_add(struct platform_device *pdev)
>  	if (!priv->has_hw_rfkill_switch)
>  		write_ec_cmd(priv->adev->handle, VPCCMD_W_RF, 1);
>  
> +	/* The same for Touchpad */
> +	if (!priv->has_touchpad_switch)
> +		write_ec_cmd(priv->adev->handle, VPCCMD_W_TOUCHPAD, 1);
> +
>  	for (i = 0; i < IDEAPAD_RFKILL_DEV_NUM; i++)
>  		if (test_bit(ideapad_rfk_data[i].cfgbit, &priv->cfg))
>  			ideapad_register_rfkill(priv, i);
> 

