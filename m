Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44AD7C433DB
	for <platform-driver-x86@archiver.kernel.org>; Fri, 15 Jan 2021 19:21:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 17F33235F8
	for <platform-driver-x86@archiver.kernel.org>; Fri, 15 Jan 2021 19:21:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728081AbhAOTVi (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 15 Jan 2021 14:21:38 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:44989 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726541AbhAOTVi (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 15 Jan 2021 14:21:38 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 7065C5C01D9;
        Fri, 15 Jan 2021 14:20:52 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Fri, 15 Jan 2021 14:20:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hmh.eng.br; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=gfEAVPUzFg5yJJW/gS7HJCsWwI0
        Jpxe3im3ZZ7fX7jM=; b=CoJgb8PKzW2C0/IZdGvWwQwDNlrNG4eOtbhmvp/bjvz
        FyqDniwvsYItCS4RZa60il0fjTwLoCQvqvHH9yd5H9siB1TOfKWuNLwJLXoQEIGY
        jsybw8L+ofClH4ToBm049+gsa289mYgznXleGD/lJomWEhSe+hBRk1mfQjx40Y5B
        VjVhvDZ/cHkSriwOzhgod9Ff4CcP00XkvbcM4FA3LFvgUPltUBFYs5D36RV9nv3r
        k4iWHpPi8cEyH4OItkYExL1s9pvpBTYfQPVPUREXoCt1Bbqqur7xdjKykzYc7rcJ
        FqohxIo1SMCLt4pRlybX7ObpV8qGZZ2ebQRnMFn0qsQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=gfEAVP
        UzFg5yJJW/gS7HJCsWwI0Jpxe3im3ZZ7fX7jM=; b=Cr22si+bQKVsxjDl0kzGSr
        EtA9mib/QUyqZPA8xYduGTDykT+wYizd3izv0yhuop2g06m0aqfJ+spoho9Er9Li
        DHy7CLd+ODJMwJkd9r6neeJmdpU8fAfTAyXIVTx+Syo6OZ3D2TR25mIbn4Y0Mb/I
        TFTN7rrY8nnIbMzMPME57LHZwY25LZWlR9P+qZ523+vEUYRG7Fg2Bnm9yYkbmIBi
        flWZ2EDmZu0V6a/dRQhhDRYMOkj6uPQqkeQRlXtsLuGPre86tsOkk8Dy+cgXGKI8
        3s3IrtEMqYZLhccLw3HCNjPVA6jxUD1E4qI0fYkSMlZcTmmEIqkmWNF26b135KTQ
        ==
X-ME-Sender: <xms:E-sBYOw5lUikpKDk9xbdSaALyrsl8-frndnKxVWTulBdq2TMwBi9OA>
    <xme:E-sBYGEcVcQSOzBiVmMaBjqjyd_uLgIlmE_8GfE60JZofRZ7S-n9RzbSQreCJQZBU
    LDV5tgWUPzkkg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrtddvgdellecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtuggjfgesthdttd
    dttdervdenucfhrhhomhepjfgvnhhrihhquhgvucguvgcuofhorhgrvghsucfjohhlshgt
    hhhuhhcuoehhmhhhsehhmhhhrdgvnhhgrdgsrheqnecuggftrfgrthhtvghrnhepvedute
    ejgeeiudefuefgieehleejkeefudfhjeefgeekheekvddvheehleegveeinecukfhppedu
    jeejrdduleegrdejrdefvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehhmhhhsehhmhhhrdgvnhhgrdgsrh
X-ME-Proxy: <xmx:E-sBYLt0eR9bdBOkqeu6qHYglank8a2BEFu6eHxX6K3P99UNtoKV7w>
    <xmx:E-sBYODyqH6k8pbmnykpuL1x1sfJgNupBWeNOUAMCrvLuJ9vGk3Axw>
    <xmx:E-sBYOA_LyVZiUM8ofpsuv9XJCV1NkleKLBg48CT_wHoSQb8PqYaYQ>
    <xmx:FOsBYP8Fi7FsqkRMq7z24t2DgBzUsozd4whhv7D2nJVnZEbwvrifFw>
Received: from khazad-dum.debian.net (unknown [177.194.7.32])
        by mail.messagingengine.com (Postfix) with ESMTPA id 85E7A108005C;
        Fri, 15 Jan 2021 14:20:51 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
        by localhost.khazad-dum.debian.net (Postfix) with ESMTP id C05303403214;
        Fri, 15 Jan 2021 16:20:49 -0300 (-03)
X-Virus-Scanned: Debian amavisd-new at khazad-dum.debian.net
Received: from khazad-dum.debian.net ([127.0.0.1])
        by localhost (khazad-dum2.khazad-dum.debian.net [127.0.0.1]) (amavisd-new, port 10024)
        with LMTP id qakJ42RXAmJO; Fri, 15 Jan 2021 16:20:45 -0300 (-03)
Received: by khazad-dum.debian.net (Postfix, from userid 1000)
        id C9EE7340017A; Fri, 15 Jan 2021 16:20:45 -0300 (-03)
Date:   Fri, 15 Jan 2021 16:20:45 -0300
From:   Henrique de Moraes Holschuh <hmh@hmh.eng.br>
To:     jeanniestevenson <jeanniestevenson@protonmail.com>
Cc:     "ibm-acpi-devel@lists.sourceforge.net" 
        <ibm-acpi-devel@lists.sourceforge.net>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "ibm-acpi@hmh.eng.br" <ibm-acpi@hmh.eng.br>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Add P53/73 firmware to
 fan_quirk_table for dual fan control
Message-ID: <20210115192045.GA10895@khazad-dum.debian.net>
References: <Pn_Xii4XYpQRFtgkf4PbNgieE89BAkHgLI1kWIq-zFudwh2A1DY5J_DJVHK06rMW_hGPHx_mPE33gd8mg9-8BxqJTaSC6hhPqAsfZlcNGH0=@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pn_Xii4XYpQRFtgkf4PbNgieE89BAkHgLI1kWIq-zFudwh2A1DY5J_DJVHK06rMW_hGPHx_mPE33gd8mg9-8BxqJTaSC6hhPqAsfZlcNGH0=@protonmail.com>
X-GPG-Fingerprint1: 4096R/0x0BD9E81139CB4807: C467 A717 507B BAFE D3C1  6092
 0BD9 E811 39CB 4807
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Fri, 15 Jan 2021, jeanniestevenson wrote:
> This commit enables dual fan control for the new Lenovo P53 and P73 laptop models.
> 
> Signed-off-by: Jeannie Stevenson <jeanniestevenson@protonmail.com>

It has been tested on which thinkpad model (name and numerical model,
please) ?  It is also nice to have that kind of information in the
commit message.

With that information:
Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>

> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index c404706379d9..69402758b99c 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -8782,6 +8782,7 @@ static const struct tpacpi_quirk fan_quirk_table[] __initconst = {
>  	TPACPI_Q_LNV3('N', '1', 'T', TPACPI_FAN_2CTL),	/* P71 */
>  	TPACPI_Q_LNV3('N', '1', 'U', TPACPI_FAN_2CTL),	/* P51 */
>  	TPACPI_Q_LNV3('N', '2', 'C', TPACPI_FAN_2CTL),	/* P52 / P72 */
> +	TPACPI_Q_LNV3('N', '2', 'N', TPACPI_FAN_2CTL),	/* P53 / P73 */
>  	TPACPI_Q_LNV3('N', '2', 'E', TPACPI_FAN_2CTL),	/* P1 / X1 Extreme (1st gen) */
>  	TPACPI_Q_LNV3('N', '2', 'O', TPACPI_FAN_2CTL),	/* P1 / X1 Extreme (2nd gen) */
>  	TPACPI_Q_LNV3('N', '2', 'V', TPACPI_FAN_2CTL),	/* P1 / X1 Extreme (3nd gen) */

-- 
  Henrique Holschuh
