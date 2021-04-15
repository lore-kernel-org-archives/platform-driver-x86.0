Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 854B6C433ED
	for <platform-driver-x86@archiver.kernel.org>; Thu, 15 Apr 2021 09:08:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5BBB9610CB
	for <platform-driver-x86@archiver.kernel.org>; Thu, 15 Apr 2021 09:08:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231954AbhDOJJN (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 15 Apr 2021 05:09:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231843AbhDOJJM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 15 Apr 2021 05:09:12 -0400
X-Greylist: delayed 473 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 15 Apr 2021 02:08:49 PDT
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF738C061574
        for <platform-driver-x86@vger.kernel.org>; Thu, 15 Apr 2021 02:08:49 -0700 (PDT)
Date:   Thu, 15 Apr 2021 11:00:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=weissschuh.net;
        s=mail; t=1618477250;
        bh=x+kcHsij7ASRe53fPOOkW+dBrRwNCjTLYNAGGfiMCwg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tJrOXcqNaaqLbv8NJSCP3evafJ6U03ee96hKFLC/AOSJFheJMDjfjxM90Hn6XSxNc
         Q0CBF9ZfMtgFo1JqyASWvE+mL7TLpuBG7roFfgE+mQ8rXb5w96E/QrfCC2xTQm/s6m
         a8NQg9V8LeW5ah8QpsxohW9ULdqNMEr7hvDY6SRg=
From:   Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@weissschuh.net>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Julian Labus <julian@labus-online.de>,
        platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH] platform/x86: gigabyte-wmi: add X570 AORUS ELITE
Message-ID: <527e97dd-b352-495d-81b3-f1dae3ffe109@t-8ch.de>
References: <20210415074526.1782-1-julian@labus-online.de>
 <b32beea3-2856-3313-c6a1-37f19990e0e2@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b32beea3-2856-3313-c6a1-37f19990e0e2@redhat.com>
Jabber-ID: thomas@t-8ch.de
X-Accept: text/plain, text/html;q=0.2, text/*;q=0.1
X-Accept-Language: en-us, en;q=0.8, de-de;q=0.7, de;q=0.6
X-PGP-Key: https://t-8ch.de/pubkey.asc
X-PGP-Key-Fingerprint: 187EF7CE
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Hans, Hi Julian,

Acked-By: Thomas Weißschuh <thomas@weissschuh.net>

Thomas

On Do, 2021-04-15T10:33+0200, Hans de Goede wrote:
> Date: Thu, 15 Apr 2021 10:33:59 +0200
> From: Hans de Goede <hdegoede@redhat.com>
> To: Julian Labus <julian@labus-online.de>,
>  platform-driver-x86@vger.kernel.org, Thomas Weißschuh
>  <thomas@weissschuh.net>
> Subject: Re: [PATCH] platform/x86: gigabyte-wmi: add X570 AORUS ELITE
> User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
>  Thunderbird/78.8.1
> 
> Hi Julian,
> 
> Thank you for your patch.
> 
> As indicated in the MAINTAINERS file the gigabyte-wmi driver
> is maintained by Thomas Weißschuh (added to the Cc), so you should
> have Cc-ed Thomas on this submission.
> 
> Thomas can you review/ack this please ?
> 
> (the patch looks fine to me but I want to give you a chance to comment
> on it before merging it)
> 
> Regards,
> 
> Hans
> 
> 
> 
> 
> On 4/15/21 9:45 AM, Julian Labus wrote:
> > Add the X570 AORUS ELITE to gigabyte_wmi_known_working_platforms
> > 
> > Signed-off-by: Julian Labus <julian@labus-online.de>
> > ---
> > 
> > I read on phoronix.com that a driver for Gigabyte WMI will be added.
> > I gave it a try on my Gigabyte X570 AORUS ELITE with force_load=1 and
> > it seem to work fine. lm_sensors shows 6 sensors with reasonable values.
> > 
> > gigabyte_wmi-virtual-0
> > Adapter: Virtual device
> > temp1:        +26.0°C  
> > temp2:        +30.0°C  
> > temp3:        +27.0°C  
> > temp4:        +34.0°C  
> > temp5:        +29.0°C  
> > temp6:        +43.0°C  
> > 
> > The patch was created against the for-next branch of platform-drivers-x86.git
> > 
> >  drivers/platform/x86/gigabyte-wmi.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/drivers/platform/x86/gigabyte-wmi.c b/drivers/platform/x86/gigabyte-wmi.c
> > index bb1b0b205fa7..e127a2077bbc 100644
> > --- a/drivers/platform/x86/gigabyte-wmi.c
> > +++ b/drivers/platform/x86/gigabyte-wmi.c
> > @@ -146,6 +146,10 @@ static const struct dmi_system_id gigabyte_wmi_known_working_platforms[] = {
> >  		DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "Gigabyte Technology Co., Ltd."),
> >  		DMI_EXACT_MATCH(DMI_BOARD_NAME, "Z390 I AORUS PRO WIFI-CF"),
> >  	}},
> > +	{ .matches = {
> > +		DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "Gigabyte Technology Co., Ltd."),
> > +		DMI_EXACT_MATCH(DMI_BOARD_NAME, "X570 AORUS ELITE"),
> > +	}},
> >  	{ .matches = {
> >  		DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "Gigabyte Technology Co., Ltd."),
> >  		DMI_EXACT_MATCH(DMI_BOARD_NAME, "X570 I AORUS PRO WIFI"),
> > 
> 
