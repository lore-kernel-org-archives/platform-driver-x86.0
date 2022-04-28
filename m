Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ED17C433FE
	for <platform-driver-x86@archiver.kernel.org>; Thu, 28 Apr 2022 21:33:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351487AbiD1Vgq (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 28 Apr 2022 17:36:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349402AbiD1Vgp (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 28 Apr 2022 17:36:45 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B589BF53A
        for <platform-driver-x86@vger.kernel.org>; Thu, 28 Apr 2022 14:33:30 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id i5so8370872wrc.13
        for <platform-driver-x86@vger.kernel.org>; Thu, 28 Apr 2022 14:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=Zg27sgGih5xOm6XC+dMHnhh7RqSdHaI2vtnXvrbDzYA=;
        b=Ni5yz+1g50zd6FDpZg9HIqqY5xnIbFYPrBk+BkOWTqtBB9A+IGd8NzFoZDwUWy5qX3
         goiz1ZxIxT1PG+iuJmFQaMIAKa1fIjztjTnknH+KxfbY6trqxKHHO+OqXpp3RCsLvZFf
         MXy4xUr0GgR112+bhdK79cczeQ6QBucTbXvHKFA2cdahe7Bbrz4CkJDJfVl58gWJVr0Y
         tTSD2weBsyMRy7ao9hTAjuj37uGWWe9UUP+9CR8bX/YrTKfYfyF4Qc9vE7siVHMSax2S
         ya+bDOjIzy4bnRWzoQbUn5WLWeHyzO6SgvWprFaPBAk2N7ZhDXsjOdb4iDYFgzLhUgkv
         wFxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=Zg27sgGih5xOm6XC+dMHnhh7RqSdHaI2vtnXvrbDzYA=;
        b=FLzg8VtyLpmlsQroAGwBTBz+XbWXCjEeaUvypZPqBn9q5THXZDViLr7xapoLno6q5d
         ZIiM+Jfl948DAz71NA7KskixvyhnnoeroWPuYBSay+hEs4Yq3wM/Sp/8e4EfhYDIZsFf
         rYg7xRQpQ2x+e/uD6yHW2cjJoXGw0cPMssLh8VCghSR9AUcjgB67ay8iSOqWHhVg7car
         EimlxHic71XMP8NEByPhgEXY23qGMH3jAzBtJ1O14+qrjmxZ4I1GvdL0Q42po5cN23Vl
         vUeB8b/fDrxtvXvqfgPQWDrOZczJWs8JOGt+XpRtseDCgNMUrX0Y0+wV93LbZ3qoqKJl
         tCiQ==
X-Gm-Message-State: AOAM533Z7nou/3/KUaWNgtVMo0ME4wj3X1HmVUUS7JxJpbskAkLc/bwJ
        1k39tqdmjyy+fuuwHuKmqVAJziGVse7urMaMwhhI2KJQzBw=
X-Google-Smtp-Source: ABdhPJxfgb/x2tdKBuodrO5r3kcmzQDewZRuBh2lFDENKsZENQn/7o3pk1kK2UYQMh2a1SgisgG17YbVM/XCqcDcr/U=
X-Received: by 2002:adf:eb07:0:b0:207:8534:2ef6 with SMTP id
 s7-20020adfeb07000000b0020785342ef6mr27722135wrn.62.1651181608679; Thu, 28
 Apr 2022 14:33:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAFTm+6Aa4_zrt76Jb0=8MoGWnUVNpiuT9946R8wvEW8rx47mrA@mail.gmail.com>
In-Reply-To: <CAFTm+6Aa4_zrt76Jb0=8MoGWnUVNpiuT9946R8wvEW8rx47mrA@mail.gmail.com>
From:   Matt DeVillier <matt.devillier@gmail.com>
Date:   Thu, 28 Apr 2022 16:33:17 -0500
Message-ID: <CAFTm+6B999mf22esuo28-Yd2-8ZrgC+WDp+pdTx6+g5oNdxKag@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: cros_ec_lpc: Fix DMI matching for newer
 Chrome devices
To:     Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

hello all,

any reason this patch failed to get noticed? I have lots of users
running my upstream coreboot builds which are affected by this issue

thanks,
Matt

On Tue, Jan 11, 2022 at 9:36 AM Matt DeVillier <matt.devillier@gmail.com> wrote:
>
> Since 2017, Chrome devices running custom coreboot firmware default
> to using 'Google' as the system vendor, vs 'GOOGLE' for older
> devices. Add a DMI match to cover this case as well.
>
> Test: cros_ec_lpc successfully attaches to Chromebox running
> custom coreboot firmware with bios vendor 'coreboot' and
> system vendor 'Google'.
>
> Signed-off-by: Matt DeVillier <matt.devillier@gmail.com>
> ---
> drivers/platform/chrome/cros_ec_lpc.c | 8 +++++++-
> 1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/platform/chrome/cros_ec_lpc.c
> b/drivers/platform/chrome/cros_ec_lpc.c
> index d6306d2a096f..ae366a34bb63 100644
> --- a/drivers/platform/chrome/cros_ec_lpc.c
> +++ b/drivers/platform/chrome/cros_ec_lpc.c
> @@ -465,13 +465,19 @@ static const struct dmi_system_id
> cros_ec_lpc_dmi_table[] __initconst = {
> * If the box is running custom coreboot firmware then the
> * DMI BIOS version string will not be matched by "Google_",
> * but the system vendor string will still be matched by
> - * "GOOGLE".
> + * "GOOGLE" or "Google".
> */
> .matches = {
> DMI_MATCH(DMI_BIOS_VENDOR, "coreboot"),
> DMI_MATCH(DMI_SYS_VENDOR, "GOOGLE"),
> },
> },
> + {
> + .matches = {
> + DMI_MATCH(DMI_BIOS_VENDOR, "coreboot"),
> + DMI_MATCH(DMI_SYS_VENDOR, "Google"),
> + },
> + },
> {
> /* x86-link, the Chromebook Pixel. */
> .matches = {
> --
> 2.32.0
