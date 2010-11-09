From: Peter Feuerer <peter@piie.net>
Subject: Re: [PATCH] acerhdf: Add support for Aspire 1410 BIOS v1.3314
Date: Tue, 09 Nov 2010 21:51:18 +0100
Message-ID: <cone.1289335878.26640.3522.1000@deskpiie>
References: <AANLkTinhev01i+hBH+FW_quLay1dOGFpFW52mONxmshB@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; format=flowed; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtprelay01.ispgateway.de ([80.67.31.39]:54607 "EHLO
	smtprelay01.ispgateway.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754617Ab0KIU4o (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 9 Nov 2010 15:56:44 -0500
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Clay Carpenter <claycarpenter@gmail.com>
Cc: platform-driver-x86@vger.kernel.org

Hi Clay,

Clay Carpenter writes:

> diff --git a/drivers/platform/x86/acerhdf.c b/drivers/platform/x86/acerhdf.c
> index 60f9cfc..73df4c5 100644
> --- a/drivers/platform/x86/acerhdf.c
> +++ b/drivers/platform/x86/acerhdf.c
> @@ -163,6 +163,7 @@ static const struct bios_settings_t bios_tbl[] = {
>         {"Acer", "Aspire 1410", "v1.3303", 0x55, 0x58, {0x9e, 0x00} },
>         {"Acer", "Aspire 1410", "v1.3308", 0x55, 0x58, {0x9e, 0x00} },
>         {"Acer", "Aspire 1410", "v1.3310", 0x55, 0x58, {0x9e, 0x00} },
> +       {"Acer", "Aspire 1410", "v1.3314", 0x55, 0x58, {0x9e, 0x00} },
>         /* Acer 1810xx */
>         {"Acer", "Aspire 1810TZ", "v0.3108", 0x55, 0x58, {0x9e, 0x00} },
>         {"Acer", "Aspire 1810T",  "v0.3108", 0x55, 0x58, {0x9e, 0x00} },

I can't apply your patch, looks like there are spaces instead of one tab in 
front of the lines?
Maybe your Email program broke it?

thanks and kind regards,
--peter;
