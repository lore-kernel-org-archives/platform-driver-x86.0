Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50EBAC433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue, 26 Apr 2022 16:33:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348511AbiDZQgt (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 26 Apr 2022 12:36:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235283AbiDZQgs (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 26 Apr 2022 12:36:48 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 049851759D3
        for <platform-driver-x86@vger.kernel.org>; Tue, 26 Apr 2022 09:33:41 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 94DA460A29
        for <platform-driver-x86@vger.kernel.org>; Tue, 26 Apr 2022 16:33:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0B24C385A0;
        Tue, 26 Apr 2022 16:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1650990820;
        bh=mCsl4tJU10JPBJe7//N4x9+VIbVWIdqK82V5aD36DK8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CIFlbQtBo5AlHo9pF1MldnYxxeGeIJNY/THKH+CNYXijAaJat55I6lQ8zt6C4s1iN
         t4Xf0HPxc43kLDJvOLFtQe5ZU/cY5K6IrMqHc3VanPghguIRBRa2D/EUh1+UPIp1FW
         SZvogfl+mrPvRigB9fYrc9b9n3pTbwVWZE1d9QJ2kp28JOAz7hqPackajA+rfoDBgT
         AFzRLHQolo2lNjWoIfXSHituRolKhZaEpyBoEAXqbirs8S/6zc4ZDnM5XcdJr5ZdEo
         xVup6a4BfQu/pfexRFevvWr71aLOx3mwpNh2fftpxZJGrIx0Ht+YHNXouqMs8V+u6J
         8iwjtCl6cdlsg==
Received: by pali.im (Postfix)
        id 03D6FEB0; Tue, 26 Apr 2022 18:33:36 +0200 (CEST)
Date:   Tue, 26 Apr 2022 18:33:36 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To:     gabriele.mzt@gmail.com, Dell.Client.Kernel@dell.com
Cc:     platform-driver-x86@vger.kernel.org, mjg59@srcf.ucam.org
Subject: Re: [PATCH] platform/x86: dell-laptop: Add quirk entry for Latitude
 7520
Message-ID: <20220426163336.hmook5gkgyba5dur@pali>
References: <20220426120827.12363-1-gabriele.mzt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220426120827.12363-1-gabriele.mzt@gmail.com>
User-Agent: NeoMutt/20180716
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

+ Dell.Client.Kernel@dell.com : please look at this issue below

On Tuesday 26 April 2022 14:08:27 gabriele.mzt@gmail.com wrote:
> From: Gabriele Mazzotta <gabriele.mzt@gmail.com>
> 
> The Latitude 7520 supports AC timeouts, but it has no KBD_LED_AC_TOKEN
> and so changes to stop_timeout appear to have no effect if the laptop
> is plugged in.
> 
> Signed-off-by: Gabriele Mazzotta <gabriele.mzt@gmail.com>
> ---
> As per the discussion here https://github.com/dell/libsmbios/issues/48,
> this is really a BIOS bug. My Latitude 7520 has the latest BIOS
> update installed, which was released just few months ago, but the
> issue is still there.

In that ticket is written that issue was already fixed and discussion
closed.

If it is not truth then please open and report a new ticket on github.

And ideally report also this issue directly to Dell BIOS team per
https://github.com/dell/libsmbios/issues/48#issuecomment-391328501
because as written that this is the right way for fixing the issue,
rather than kernel patch.

> ---
>  drivers/platform/x86/dell/dell-laptop.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/platform/x86/dell/dell-laptop.c b/drivers/platform/x86/dell/dell-laptop.c
> index 8230e7a68a5e..1321687d923e 100644
> --- a/drivers/platform/x86/dell/dell-laptop.c
> +++ b/drivers/platform/x86/dell/dell-laptop.c
> @@ -80,6 +80,10 @@ static struct quirk_entry quirk_dell_inspiron_1012 = {
>  	.kbd_led_not_present = true,
>  };
>  
> +static struct quirk_entry quirk_dell_latitude_7520 = {
> +	.kbd_missing_ac_tag = true,
> +};
> +
>  static struct platform_driver platform_driver = {
>  	.driver = {
>  		.name = "dell-laptop",
> @@ -336,6 +340,15 @@ static const struct dmi_system_id dell_quirks[] __initconst = {
>  		},
>  		.driver_data = &quirk_dell_inspiron_1012,
>  	},
> +	{
> +		.callback = dmi_matched,
> +		.ident = "Dell Latitude 7520",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Latitude 7520"),
> +		},
> +		.driver_data = &quirk_dell_latitude_7520,
> +	},
>  	{ }
>  };
>  
> -- 
> 2.36.0
> 

In any case:

Acked-by: Pali Rohár <pali@kernel.org>

But I hope that Dell fixes this issue in their BIOS.
