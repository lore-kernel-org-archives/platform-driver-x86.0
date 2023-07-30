Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC148EB64DD
	for <platform-driver-x86@archiver.kernel.org>; Sun, 30 Jul 2023 07:11:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229651AbjG3HLs (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 30 Jul 2023 03:11:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbjG3HLs (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 30 Jul 2023 03:11:48 -0400
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97AB210FE;
        Sun, 30 Jul 2023 00:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
        t=1690701105; bh=6KsWxnNkLsIsG1Z1NryHYXBIgz9MS/anYhTsN24ECwg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VVc/uQUO7ffAqoOyfdXDzBgz6NsLgsVtoFHCzOF5AKh0WOXmybH6ZXrbesERzEh9i
         qzbn7lW/0l6qQ8kIjzsFfvJst+Jnsquwo4JPghuSi1bHcaDNDPEXxO5kPiB2Z38Q7g
         7zl8boQqv/UPyvSrp4t7fV+yjJHdtHjyOHgptd80=
Date:   Sun, 30 Jul 2023 09:11:45 +0200
From:   Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To:     Armin Wolf <W_Armin@gmx.de>
Cc:     hdegoede@redhat.com, markgross@kernel.org,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] platform/x86: wmi-bmof: Update MAINTAINERS entry
Message-ID: <873de462-b06c-44af-a5d3-559a78161a7d@t-8ch.de>
References: <20230730043817.12888-1-W_Armin@gmx.de>
 <20230730043817.12888-3-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230730043817.12888-3-W_Armin@gmx.de>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 2023-07-30 06:38:17+0200, Armin Wolf wrote:
> The WMI Binary MOF driver is important for the development
> of modern WMI drivers, i am willing to maintain it.
> Also fix the mailing list address.
> 
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
>  MAINTAINERS | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 426d3be71da2..9b871fb34e83 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22954,8 +22954,9 @@ S:	Odd fixes
>  F:	drivers/net/wireless/legacy/wl3501*
> 
>  WMI BINARY MOF DRIVER
> -L:	platform-drivers-x86@vger.kernel.org
> -S:	Orphan
> +M:	Armin Wolf <W_Armin@gmx.de>
> +L:	platform-driver-x86@vger.kernel.org
> +S:	Maintained

If you want a reviewer or second maintainer I would be volunteering.

>  F:	Documentation/ABI/stable/sysfs-platform-wmi-bmof
>  F:	Documentation/wmi/devices/wmi-bmof.rst
>  F:	drivers/platform/x86/wmi-bmof.c
> --
> 2.39.2
> 
