Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43BD5C433ED
	for <platform-driver-x86@archiver.kernel.org>; Thu, 22 Apr 2021 18:15:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F076C61417
	for <platform-driver-x86@archiver.kernel.org>; Thu, 22 Apr 2021 18:15:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236459AbhDVSQM (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 22 Apr 2021 14:16:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236287AbhDVSQH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 22 Apr 2021 14:16:07 -0400
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1099EC06174A
        for <platform-driver-x86@vger.kernel.org>; Thu, 22 Apr 2021 11:15:31 -0700 (PDT)
Date:   Thu, 22 Apr 2021 20:15:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=weissschuh.net;
        s=mail; t=1619115323;
        bh=8/2LvTBRUC1FnK6i8quLf9TMNHN3/tPZPaXMbFRIYaQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fRicIecdxlcOOVtjntJ6DZjL1ZrISy2Z2uzyEXgvnAplV690f+6Mmul8nbVPivgg4
         1cC2XAL0XF+UQe8oZhI2r7z/HTvPWM96bi8pesZo7ynSut7ExgtIBsqMLz/IIoEL3j
         LlRKlXJCXIzzjsPz++ZuzbJmnPF67SzLzayq9UCE=
From:   thomas@weissschuh.net
To:     Alexey Klimov <aklimov@redhat.com>
Cc:     hdegoede@redhat.com, mgross@linux.intel.com,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/x86: gigabyte-wmi: add support for B550M AORUS
 PRO-P
Message-ID: <0cd70106-82d8-4f20-b885-9bf15f33c27a@t-8ch.de>
References: <20210421234156.3942343-1-aklimov@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210421234156.3942343-1-aklimov@redhat.com>
Jabber-ID: thomas@t-8ch.de
X-Accept: text/plain, text/html;q=0.2, text/*;q=0.1
X-Accept-Language: en-us, en;q=0.8, de-de;q=0.7, de;q=0.6
X-PGP-Key: https://t-8ch.de/pubkey.asc
X-PGP-Key-Fingerprint: 187EF7CE
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Acked-by: Thomas Weißschuh <thomas@weissschuh.net>

On Do, 2021-04-22T00:41+0100, Alexey Klimov wrote:
> Date: Thu, 22 Apr 2021 00:41:56 +0100
> From: Alexey Klimov <aklimov@redhat.com>
> To: thomas@weissschuh.net
> Cc: hdegoede@redhat.com, mgross@linux.intel.com,
>  platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
> Subject: [PATCH] platform/x86: gigabyte-wmi: add support for B550M AORUS
>  PRO-P
> 
> From: Alexey Klimov <klimov.linux@gmail.com>
> 
> From: Alexey Klimov <klimov.linux@gmail.com>
> 
> Add the B550M AORUS PRO-P motherboard description to
> gigabyte_wmi_known_working_platforms.
> 
> Signed-off-by: Alexey Klimov <klimov.linux@gmail.com>
> ---
> 
> The driver works fine on this motherboard with force_load=1 and
> it seems that temperature values are correct.
> 
> gigabyte_wmi-virtual-0
> Adapter: Virtual device
> temp1:        +30.0°C  
> temp2:        +35.0°C  
> temp3:        +30.0°C  
> temp4:        +32.0°C  
> temp5:        +28.0°C  
> temp6:        +42.0°C
> 
> The patch is created against review-hans branch on platform-drivers-x86.git
> I am available for further testing on this board if required, feel free
> to reach me. Thanks.
> 
>  drivers/platform/x86/gigabyte-wmi.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/platform/x86/gigabyte-wmi.c b/drivers/platform/x86/gigabyte-wmi.c
> index e127a2077bbc..13d57434e60f 100644
> --- a/drivers/platform/x86/gigabyte-wmi.c
> +++ b/drivers/platform/x86/gigabyte-wmi.c
> @@ -138,6 +138,10 @@ static const struct dmi_system_id gigabyte_wmi_known_working_platforms[] = {
>  		DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "Gigabyte Technology Co., Ltd."),
>  		DMI_EXACT_MATCH(DMI_BOARD_NAME, "B550 GAMING X V2"),
>  	}},
> +	{ .matches = {
> +		DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "Gigabyte Technology Co., Ltd."),
> +		DMI_EXACT_MATCH(DMI_BOARD_NAME, "B550M AORUS PRO-P"),
> +	}},
>  	{ .matches = {
>  		DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "Gigabyte Technology Co., Ltd."),
>  		DMI_EXACT_MATCH(DMI_BOARD_NAME, "B550M DS3H"),
> -- 
> 2.31.1
> 
