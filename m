Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 901B6C433EF
	for <platform-driver-x86@archiver.kernel.org>; Thu, 24 Feb 2022 15:23:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235912AbiBXPXh (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 24 Feb 2022 10:23:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236542AbiBXPXM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 24 Feb 2022 10:23:12 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5E6101B45E6
        for <platform-driver-x86@vger.kernel.org>; Thu, 24 Feb 2022 07:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1645716107;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8XMcEzH6QZYZZFUkJ/C21SRQCdj707vdyPoSvQ2Ex6I=;
        b=c96p5brp/aKE7spctto9fxKVRTlkg/aD28HC0kp7f9SYKWawycKhA08PocIwHCx91cui7g
        K7hWC2qgPyuF6+he7zBjl16sNRe/8yGeJtSgBJjxhDMMZ6NBdE/HmnNMied+sM9HRoDl3j
        7xmrEupst8HSZVvCLwHw/ElguHDD1nM=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-594-VTWZ71JqM4Wt4s_Ef_c85A-1; Thu, 24 Feb 2022 10:21:46 -0500
X-MC-Unique: VTWZ71JqM4Wt4s_Ef_c85A-1
Received: by mail-ej1-f69.google.com with SMTP id 13-20020a170906328d00b006982d0888a4so1353608ejw.9
        for <platform-driver-x86@vger.kernel.org>; Thu, 24 Feb 2022 07:21:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=8XMcEzH6QZYZZFUkJ/C21SRQCdj707vdyPoSvQ2Ex6I=;
        b=ovOQNigazxFiQ2iSo9zNxXgdALF/PQIHMpk+H2U6g2DaAVHXca/WmXvsg6uB+V+2LS
         ut7VdLM8bAEeIK7zYK+m2DDpvoQC4PNptAhUSgMWoVeTzwHNSGVePVawYESBbHfKSTxb
         yA0PSlIRHxvyMlkVF5rWgxr+vcUzPlBgSLNmRuS35zM1n0/V56jVt+xIc0EYqN0K20jU
         4mwSaL0ihy/0fIQTvPoVxRitdfWmWjwza4AMRE/4UdiBcerSo62G7aYIJxzMYHRwyJH/
         po3qXzoirb3KXOxLoPFtFzPMa9hydh9cT9/VT55IlpynmO+hR1okchj7sS1jNmwBNlOb
         yMEQ==
X-Gm-Message-State: AOAM533oNc2+7vhBCoXW7rbg+qBvht2XLeJxm84FK1griFES93lKoAwz
        IECbgm/HJt4MY9BJ3RLaRkhJFRbFp77HHquX1UuJQOopaeqvLy3B9DWlsXFQ1XQToG4jyvypWYw
        xzx6dJZRmu0rkAV7EdcliSYoepK7VFioaeA==
X-Received: by 2002:aa7:cd81:0:b0:410:d64e:aa31 with SMTP id x1-20020aa7cd81000000b00410d64eaa31mr2820729edv.167.1645716105323;
        Thu, 24 Feb 2022 07:21:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzM2lLaydlNi+yOq/iUbVDHT5U+i0B4xiFQIBUpXD3H5gw1rzTtehG5ZmKCRrr8bL6whnBcsA==
X-Received: by 2002:aa7:cd81:0:b0:410:d64e:aa31 with SMTP id x1-20020aa7cd81000000b00410d64eaa31mr2820710edv.167.1645716105045;
        Thu, 24 Feb 2022 07:21:45 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id r19sm1499286ejz.139.2022.02.24.07.21.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Feb 2022 07:21:44 -0800 (PST)
Message-ID: <21e92f91-02c9-c485-a174-97740b00a212@redhat.com>
Date:   Thu, 24 Feb 2022 16:21:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Add dual fan probe
Content-Language: en-US
To:     Mark Pearson <markpearson@lenovo.com>
Cc:     markgross@kernel.org, platform-driver-x86@vger.kernel.org
References: <markpearson@lenovo.com>
 <20220222185137.4325-1-markpearson@lenovo.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220222185137.4325-1-markpearson@lenovo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/22/22 19:51, Mark Pearson wrote:
> Instead of having quirks for systems that have a second fan it would
> be nice to detect this setup.
> Unfortunately, confirmed by the Lenovo FW team, there is no way to
> retrieve this information from the EC or BIOS. Recommendation was to
> attempt to read the fan and if successful then assume a 2nd fan is
> present.
> 
> The fans are also supposed to spin up on boot for some time, so in
> theory we could check for a speed > 0. In testing this seems to hold
> true but as I couldn't test on all platforms I've avoided implementing
> this. It also breaks for the corner case where you load the module
> once the fans are idle.
> 
> Tested on P1G4, P1G3, X1C9 and T14 (no fans) and it works correctly.
> For the platforms with dual fans where it was confirmed to work I have
> removed the quirks. Potentially this could be done for all platforms
> but I've left untested platforms in for now. On these platforms the
> fans will be enabled and then detected - so no impact.
> 
> Signed-off-by: Mark Pearson <markpearson@lenovo.com>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
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
>  drivers/platform/x86/thinkpad_acpi.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index e9b1574729b9..d0599e8a7b4d 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -8698,10 +8698,7 @@ static const struct tpacpi_quirk fan_quirk_table[] __initconst = {
>  	TPACPI_Q_LNV3('N', '2', 'N', TPACPI_FAN_2CTL),	/* P53 / P73 */
>  	TPACPI_Q_LNV3('N', '2', 'E', TPACPI_FAN_2CTL),	/* P1 / X1 Extreme (1st gen) */
>  	TPACPI_Q_LNV3('N', '2', 'O', TPACPI_FAN_2CTL),	/* P1 / X1 Extreme (2nd gen) */
> -	TPACPI_Q_LNV3('N', '2', 'V', TPACPI_FAN_2CTL),	/* P1 / X1 Extreme (3nd gen) */
> -	TPACPI_Q_LNV3('N', '4', '0', TPACPI_FAN_2CTL),	/* P1 / X1 Extreme (4nd gen) */
>  	TPACPI_Q_LNV3('N', '3', '0', TPACPI_FAN_2CTL),	/* P15 (1st gen) / P15v (1st gen) */
> -	TPACPI_Q_LNV3('N', '3', '2', TPACPI_FAN_2CTL),	/* X1 Carbon (9th gen) */
>  	TPACPI_Q_LNV3('N', '3', '7', TPACPI_FAN_2CTL),  /* T15g (2nd gen) */
>  	TPACPI_Q_LNV3('N', '1', 'O', TPACPI_FAN_NOFAN),	/* X1 Tablet (2nd gen) */
>  };
> @@ -8745,6 +8742,9 @@ static int __init fan_init(struct ibm_init_struct *iibm)
>  		 * ThinkPad ECs supports the fan control register */
>  		if (likely(acpi_ec_read(fan_status_offset,
>  					&fan_control_initial_status))) {
> +			int res;
> +			unsigned int speed;
> +
>  			fan_status_access_mode = TPACPI_FAN_RD_TPEC;
>  			if (quirks & TPACPI_FAN_Q1)
>  				fan_quirk1_setup();
> @@ -8757,6 +8757,15 @@ static int __init fan_init(struct ibm_init_struct *iibm)
>  				tp_features.second_fan_ctl = 1;
>  				pr_info("secondary fan control enabled\n");
>  			}
> +			/* Try and probe the 2nd fan */
> +			res = fan2_get_speed(&speed);
> +			if (res >= 0) {
> +				/* It responded - so let's assume it's there */
> +				tp_features.second_fan = 1;
> +				tp_features.second_fan_ctl = 1;
> +				pr_info("secondary fan control detected & enabled\n");
> +			}
> +
>  		} else {
>  			pr_err("ThinkPad ACPI EC access misbehaving, fan status and control unavailable\n");
>  			return -ENODEV;

