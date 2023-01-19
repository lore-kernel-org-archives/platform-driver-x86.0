Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 977DDC00A5A
	for <platform-driver-x86@archiver.kernel.org>; Thu, 19 Jan 2023 15:36:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229929AbjASPgg (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 19 Jan 2023 10:36:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229710AbjASPgf (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 19 Jan 2023 10:36:35 -0500
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 306423A85;
        Thu, 19 Jan 2023 07:36:34 -0800 (PST)
Date:   Thu, 19 Jan 2023 15:36:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=weissschuh.net;
        s=mail; t=1674142591;
        bh=AtrJPt1hJwfWcnFIM6nDF3JL322v8i5h9vsF5NJEWZI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sqi2Rxo2n+rCq0/VFskKdSqKVIAkpfBMVTh6q2UipjhMSSf1rSH2erZkkKD69l0ky
         WdokZkf8TwXFLlvW85EWRBZlT36IUFX+NEglJiCR0ifl8rfp0mgTDQKBYa45DNMUTG
         AXvD/VGDCcF0d5brwf3awH5wz7tkzq1rKvv8c3js=
From:   Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To:     Kevin Kuriakose <kevinmkuriakose@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/x86: gigabyte-wmi: add support for B450M DS3H
 WIFI-CF
Message-ID: <20230119153628.ydfk7cbfeitycnew@t-8ch.de>
References: <20230119150925.31962-1-kevinmkuriakose@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230119150925.31962-1-kevinmkuriakose@gmail.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Thu, Jan 19, 2023 at 08:39:25PM +0530, Kevin Kuriakose wrote:
> To the best of my knowledge this is the same board as the B450M DS3H-CF,
> but with an added WiFi card. Name obtained using dmidecode, tested
> with force_load on v6.1.6
> 
> Signed-off-by: Kevin Kuriakose <kevinmkuriakose@gmail.com>

Acked-by: Thomas Weiﬂschuh <linux@weissschuh.net>

> ---
>  drivers/platform/x86/gigabyte-wmi.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/gigabyte-wmi.c b/drivers/platform/x86/gigabyte-wmi.c
> index 5e7e6659a..322cfaeda 100644
> --- a/drivers/platform/x86/gigabyte-wmi.c
> +++ b/drivers/platform/x86/gigabyte-wmi.c
> @@ -141,6 +141,7 @@ static u8 gigabyte_wmi_detect_sensor_usability(struct wmi_device *wdev)
>  
>  static const struct dmi_system_id gigabyte_wmi_known_working_platforms[] = {
>  	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("B450M DS3H-CF"),
> +	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("B450M DS3H WIFI-CF"),
>  	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("B450M S2H V2"),
>  	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("B550 AORUS ELITE AX V2"),
>  	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("B550 AORUS ELITE"),
> -- 
> 2.39.0

Note: Patches should also always go to linux-kernel@vger.kernel.org.

Thanks!
