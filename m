Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E2D0C6379F
	for <platform-driver-x86@archiver.kernel.org>; Mon, 23 Nov 2020 22:43:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A4F7D206D8
	for <platform-driver-x86@archiver.kernel.org>; Mon, 23 Nov 2020 22:43:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733020AbgKWWn0 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 23 Nov 2020 17:43:26 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:41317 "EHLO
        wout5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1733018AbgKWWnZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 23 Nov 2020 17:43:25 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id AEBD219EB;
        Mon, 23 Nov 2020 17:43:24 -0500 (EST)
Received: from imap21 ([10.202.2.71])
  by compute1.internal (MEProxy); Mon, 23 Nov 2020 17:43:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hmh.eng.br; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm1; bh=NT16Y3xFmHkzsu1heWBCAUz9Sw0TeQG
        9bm7wWJEv3EU=; b=C5Ir+XalNmweFz/nNDFVWGRZr7DJuTmflMuk0iNuRY4g9u6
        q8lEhTafKg5LnOA0iTt3eDNKOFffW9tzC+p+CQtTbaZ+TlWyI8x99qM4coqt8Bq5
        J/qYjR86P+pMtwiRjNn4OfnbTNJJUQ2nZGrV8WDnSGX64N+VIbruiMU1Diy5358r
        jHJR5xbXC+DMPFXbBUsyLaFPaYjYoACLxvL6CUL1txFpYY8PZUEhMn1gRJuTJ8FK
        SPqlCl6mHPvSUp4Qt7TfNRTqzTxZnhV4XEsk9NdBe6fuBEGst174oBkkZK8vF+7P
        qxo9Zz+7GPOL+4jKQ1WiWzEYpO+D/DeuHUu1Cuw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=NT16Y3
        xFmHkzsu1heWBCAUz9Sw0TeQG9bm7wWJEv3EU=; b=R+pXXFMZDbFwpWNUWmZxZ1
        ajBx3c7vbGt+tXS1jxX7mD7oyY2cJN+oE4OvDahimOeji/wycRl3skCasRDAClDV
        HPtN/zmuxGUx05sUe9n2LquK82DBTUpHczgaQqTY7/pmpqMHktOeKUAEXpcSpNf8
        ebHVadKwMh0WJh7PEfK7JLKzheiqF6lK2J7g6i8Y11/Cjpt/HplpJTZHN47P8jGv
        kveeLZ6ajMCDO7mOiR+nHzcLCbEiTidVFog8ghAGihrNtAKdSUFrAWLX/CUw2AOv
        yUe+81POP4nI3Ya8BaYmAK/klktVriHf6X98EL1JVBfMGQvMzIPlmeLbi/eQ8UsQ
        ==
X-ME-Sender: <xms:Czu8X7E786cMvfHeXKAO0q1H6ZtjKULGvL1c2jl42h8zeRWpW8MRvQ>
    <xme:Czu8X4WMU9cSvhdRdcLINWwwd5wlLL6mh38a7S8fkMsZ01W_CfCZWFDVMAdY0qjua
    9SbFYYDMHjZEA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudegjedgfedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepihgsmhdq
    rggtphhisehhmhhhrdgvnhhgrdgsrhenucggtffrrghtthgvrhhnpeduieekhfefhfdtle
    fgteeljedvheffgfeifeelgeeguefgkeeukedtfeeivdfhteenucffohhmrghinhepkhgv
    rhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepihgsmhdqrggtphhisehhmhhhrdgvnhhgrdgsrh
X-ME-Proxy: <xmx:Czu8X9KqzpYGAJao5JdjVT2y2vywOahJU3B_i_D0MdKUGwY3c5t5EA>
    <xmx:Czu8X5HT8r2iFTbNpCG_w7-RTQ5eR_smpjnTjOHz8BzuC2hUFRzfiQ>
    <xmx:Czu8XxUfaA7PbUMRvGHCFrdL3V_AsNH7NM-kMdpIus-PXjxyMd5Nyw>
    <xmx:DDu8XwdgAAynFIUXfT0t-YxWRMaqlXNIZmaIojela-UuJXyXYB-85g>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 8021466006F; Mon, 23 Nov 2020 17:43:11 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-622-g4a97c0b-fm-20201115.001-g4a97c0b3
Mime-Version: 1.0
Message-Id: <adced236-c18e-40da-bc43-9f8d9e0dd757@www.fastmail.com>
In-Reply-To: <20201123132157.866303-1-benjamin@sipsolutions.net>
References: <20201123132157.866303-1-benjamin@sipsolutions.net>
Date:   Mon, 23 Nov 2020 19:43:02 -0300
From:   ibm-acpi@hmh.eng.br
To:     "Benjamin Berg" <benjamin@sipsolutions.net>,
        "Hans de Goede" <hdegoede@redhat.com>
Cc:     "Thinkpad-acpi devel ML" <ibm-acpi-devel@lists.sourceforge.net>,
        platform-driver-x86@vger.kernel.org,
        "Benjamin Berg" <bberg@redhat.com>
Subject: =?UTF-8?Q?Re:_[PATCH]_platform/x86:_thinkpad=5Facpi:_Send_tablet_mode_sw?=
 =?UTF-8?Q?itch_at_wakeup_time?=
Content-Type: text/plain
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org


Acked-by: Henrique de Moraes Holschuh <hnh@hmh.eng.br>

On Mon, Nov 23, 2020, at 10:21, Benjamin Berg wrote:
> From: Benjamin Berg <bberg@redhat.com>
> 
> The lid state may change while the machine is suspended. As such, we may
> need to re-check the state at wake-up time (at least when waking up from
> hibernation).
> Add the appropriate call to the resume handler in order to sync the
> SW_TABLET_MODE switch state with the hardware state.
> 
> Fixes: dda3ec0aa631 ("platform/x86: thinkpad_acpi: Implement tablet 
> mode using GMMS method")
> BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=210269
> Signed-off-by: Benjamin Berg <bberg@redhat.com>
> ---
>  drivers/platform/x86/thinkpad_acpi.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c 
> b/drivers/platform/x86/thinkpad_acpi.c
> index e3810675090a..9104e0ee37cd 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -4228,6 +4228,7 @@ static void hotkey_resume(void)
>  		pr_err("error while attempting to reset the event firmware 
> interface\n");
>  
>  	tpacpi_send_radiosw_update();
> +	tpacpi_input_send_tabletsw();
>  	hotkey_tablet_mode_notify_change();
>  	hotkey_wakeup_reason_notify_change();
>  	hotkey_wakeup_hotunplug_complete_notify_change();
> -- 
> 2.26.2
> 
>
