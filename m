Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09F0AC433EF
	for <platform-driver-x86@archiver.kernel.org>; Thu, 14 Apr 2022 22:46:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238985AbiDNWtQ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 14 Apr 2022 18:49:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347302AbiDNWtP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 14 Apr 2022 18:49:15 -0400
X-Greylist: delayed 484 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 14 Apr 2022 15:46:43 PDT
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5A02C6F29
        for <platform-driver-x86@vger.kernel.org>; Thu, 14 Apr 2022 15:46:43 -0700 (PDT)
Date:   Fri, 15 Apr 2022 00:38:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=weissschuh.net;
        s=mail; t=1649975916;
        bh=vDGGMEdgovF01Xz1QDVIkPvmh5RY2AurisPU4bpB9zw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dvztLqPr9kHleZB+15kEykv/t48ROPmbTBKiQ3ccNhovMfSqX9KkjEmuBmckaOkAw
         VRID7j/gLQn5EBaZHtIhDNO2N5R+ReFjRh/7Mhd0rdFyz7e7UbgltErgKodMRbgAO3
         ZqUiCFR9Eu/aiAFxLE26TYTpS35s1BO2RX1hD8Ac=
From:   Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@weissschuh.net>
To:     Darryn Anton Jordan <darrynjordan@icloud.com>
Cc:     platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH] platform/x86: gigabyte-wmi: added support for B660
 GAMING X DDR4 motherboard
Message-ID: <22d464a1-e24d-4995-8682-b482f0b60d17@t-8ch.de>
References: <Ylguq87YG+9L3foV@hark>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Ylguq87YG+9L3foV@hark>
Jabber-ID: thomas@t-8ch.de
X-Accept: text/plain, text/html;q=0.2, text/*;q=0.1
X-Accept-Language: en-us, en;q=0.8, de-de;q=0.7, de;q=0.6
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 2022-04-14 16:24+0200, Darryn Anton Jordan wrote:
> This works on my system.
> 
> Signed-off-by: Darryn Anton Jordan <darrynjordan@icloud.com>

Acked-by: Thomas Weißschuh <thomas@weissschuh.net>

> ---
>  drivers/platform/x86/gigabyte-wmi.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/gigabyte-wmi.c b/drivers/platform/x86/gigabyte-wmi.c
> index 658bab4b7964..e87a931eab1e 100644
> --- a/drivers/platform/x86/gigabyte-wmi.c
> +++ b/drivers/platform/x86/gigabyte-wmi.c
> @@ -148,6 +148,7 @@ static const struct dmi_system_id gigabyte_wmi_known_working_platforms[] = {
>  	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("B550I AORUS PRO AX"),
>  	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("B550M AORUS PRO-P"),
>  	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("B550M DS3H"),
> +	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("B660 GAMING X DDR4"),
>  	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("Z390 I AORUS PRO WIFI-CF"),
>  	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("X570 AORUS ELITE"),
>  	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("X570 GAMING X"),
> -- 
> 2.34.1
> 
