Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAFC7C74A5B
	for <platform-driver-x86@archiver.kernel.org>; Sat, 18 Mar 2023 16:40:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229478AbjCRQkz (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 18 Mar 2023 12:40:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229787AbjCRQky (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 18 Mar 2023 12:40:54 -0400
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0E491B332
        for <platform-driver-x86@vger.kernel.org>; Sat, 18 Mar 2023 09:40:50 -0700 (PDT)
Date:   Sat, 18 Mar 2023 16:40:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
        s=mail; t=1679157648;
        bh=YPYRv14w6O15/hzZSxdNjfDeGYgS6sRDaC3qijWUeeM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=As3/JIKq3FVcYaWiFp9r3qWIqIq3FIKi7J/eMgRDXxDuX/buGzTMzW9JgTR1LSXa0
         suR9MVGgw0KpazYNr/y+pvtEFMh76/fIlyrXOJX2XAUsi508Npep3zTHH/ebzfJXOf
         VROW2sM5LaTzwHfh1rjFjv9IsXoMbW8OfwGOQQvs=
From:   Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@weissschuh.net>
To:     Frank Crawford <frank@crawford.emu.id.au>
Cc:     platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH] platform/x86 (gigabyte-wmi): Add support for A320M-S2H V2
Message-ID: <1fa8e7c3-215b-4888-90e6-e5d372e4d179@t-8ch.de>
References: <20230318091441.1240921-1-frank@crawford.emu.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230318091441.1240921-1-frank@crawford.emu.id.au>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Sat, Mar 18, 2023 at 08:14:41PM +1100, Frank Crawford wrote:
> Add support for A320M-S2H V2.  Tested using module force_load option.
> 
> Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>

Acked-by: Thomas Weißschuh <linux@weissschuh.net>

> ---
>  drivers/platform/x86/gigabyte-wmi.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/gigabyte-wmi.c b/drivers/platform/x86/gigabyte-wmi.c
> index 322cfaeda17b..4dd39ab6ecfa 100644
> --- a/drivers/platform/x86/gigabyte-wmi.c
> +++ b/drivers/platform/x86/gigabyte-wmi.c
> @@ -140,6 +140,7 @@ static u8 gigabyte_wmi_detect_sensor_usability(struct wmi_device *wdev)
>  	}}
>  
>  static const struct dmi_system_id gigabyte_wmi_known_working_platforms[] = {
> +	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("A320M-S2H V2-CF"),
>  	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("B450M DS3H-CF"),
>  	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("B450M DS3H WIFI-CF"),
>  	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("B450M S2H V2"),
> -- 
> 2.39.2
> 
