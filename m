Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6436C433EF
	for <platform-driver-x86@archiver.kernel.org>; Wed,  6 Oct 2021 20:57:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B914261163
	for <platform-driver-x86@archiver.kernel.org>; Wed,  6 Oct 2021 20:57:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239454AbhJFU7i (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 6 Oct 2021 16:59:38 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:36681 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229657AbhJFU7i (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 6 Oct 2021 16:59:38 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id 4686E32010F5;
        Wed,  6 Oct 2021 16:57:45 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Wed, 06 Oct 2021 16:57:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=lltFajXQMAQ1lhK6SCeUtDZD7/JoaS0ecSW+yiC5D9o=; b=SiedS8m7
        qbTzy9rBZfxocFXU/rDRi9fbIQz3TNmOLxcanBlRr4or4g9tvB+4wbyjhJRAHSZS
        I8Uee/TXYA1u5dzIqPyGdxmK6XVCFw+87QdeyP2NCnDcZU65FnGGuqU6IAXEQ/cE
        hI31Yz9CgBMM76pTAFlIhYxIbG4t0wzddajIgomDSTz0VTgFXaoVUQOvz8fZe2Qf
        +xmLt6oXiBfiSshQsbtl7N6CCxf9W4alodc/kx/C1r+jKZAfNyGFgEOFFnCGblA7
        U/pbJH4IKew7JquAe2S9d4wqSMFQvKA0rq6wxr0hUz2kvgZL5//IVeNDVCeF/zSc
        cWHhJm1yY6K+Kg==
X-ME-Sender: <xms:yA1eYcpkgJKTPxQKwp1CpyXBsniiy8VsRF7NGYA1AwayiGU0wEQX3A>
    <xme:yA1eYSqCZhlt4aSgIOoLDvVkVzVxdQ-ayj7x-ZsoyqwSIQum3d4u0lfl3APhEEZVB
    R83TCU5oG_wNi33Gw>
X-ME-Received: <xmr:yA1eYROAr0s3pbJ_ikE--KmsBuHQRvHGRcPuVjp6YUz76m3tKx62EPIqEb1pe7X1NRdgcjG2J7srlgV6qzz-Ffs3fvHCDO1w99q1AHI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudeliedgudehudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpefvihhmucevrhgrfihfohhrugcuoehttghrrgiffhhorhgu
    sehshihsthgvmhejiedrtghomheqnecuggftrfgrthhtvghrnhepieefledvgfeuieetfe
    ehgefhieduleelffegteekjeduuefgkeeuheekhfehffdtnecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepthgtrhgrfihfohhrugesshihshhtvg
    hmjeeirdgtohhm
X-ME-Proxy: <xmx:yA1eYT4GMrcL3hkphGoOVlVSjfnrmvX5sHgkpvvdnIsOrhWS-hEvsw>
    <xmx:yA1eYb4gVLOmTAnjfcC-QoJNZqfmTG4rNqSK-4-HRw1SKjYzj119jg>
    <xmx:yA1eYThBS2Rd6M6QM0C4R4Vkkv8l_Fq--9YDAn8VsIC_H5zIuBiraA>
    <xmx:yA1eYYhsNzpA1Xt5jW8Yyf-8yMU0MsE72O2er7sCi-Q_T69q40CBQg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 6 Oct 2021 16:57:44 -0400 (EDT)
From:   Tim Crawford <tcrawford@system76.com>
To:     platform-driver-x86@vger.kernel.org
Cc:     productdev@system76.com
Subject: Re: [PATCH v4 0/4] platform/x86: system76_acpi: Sync DKMS module changes
Date:   Wed,  6 Oct 2021 14:57:43 -0600
Message-ID: <20211006202202.7479-1-tcrawford@system76.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211006202202.7479-1-tcrawford@system76.com>
References: <20211006202202.7479-1-tcrawford@system76.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org
Message-ID: <20211006205743.eD0uXBJCf2Cy_MOCvkpC9wgBBQRHkuX0SiSOBWmRTn8@z>

> v4:
> - Reverted DEV_ATTR macro change to keep custom `name`
> - Added attribute groups for kb_led_color
> - Set kd_led.groups instead of manually creating/removing the sysfs file

Forgot to note that I changed the hwmon if blocks to switch cases to
more closely match what other hwmon drivers do.
