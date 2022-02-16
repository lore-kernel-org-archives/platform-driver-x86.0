Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D40A5C433F5
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Feb 2022 22:07:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236651AbiBPWHN (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 16 Feb 2022 17:07:13 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:45030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231319AbiBPWHJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 16 Feb 2022 17:07:09 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 845AE1A3745
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Feb 2022 14:06:56 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 218DD61B44
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Feb 2022 22:06:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88260C340E8
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Feb 2022 22:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645049215;
        bh=2HsI9hAq6nnEKplihGyvy9bkXZlW8zMoKIn/euWhY7I=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=fn1QMkXaPPWxTyJY9GzeX7WzMOrXWmIO5eplnbhs6vVa5GIMhC7xJw6MqeK2R/9Z7
         FHqfg0bHjx0v05kxJIVdCyUfae8s+k3e7agNuhnXEaMYdRW7eM0US8zpDNFU0Fp2I6
         sSyyM2DyGnafQDovm/+Zr79bjNYwtgcxjJLai1bR21M7Pxc/a6qxAGIahU2B/H7OH8
         0r9tfQiBK6JtGKVHhcoAXlQifm5WcDLk3iCczsLf6NpYFaWt3HSXoaqcpzBtpG0g+I
         rMU4vxDWY2PpawJjllLC2KGk88iWBPM3Qh7o2MnToWWmE5vIpUyPKgVCK4c1sdaV3P
         NlONP0+GRnFwg==
Received: by mail-yb1-f182.google.com with SMTP id y129so9094825ybe.7
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Feb 2022 14:06:55 -0800 (PST)
X-Gm-Message-State: AOAM531YTF7PKQdnneLIyxClX5ZXJymgcsXGfGbhTd0I7O21qs7efqEg
        KMfawIHKab89247Q7o3Rgv7G4w0DYvXIeqBvoTo=
X-Google-Smtp-Source: ABdhPJxJ9n1vUNyqFvbsLydXcvV0+Sc2gefkyMriLeUV8c4FW2r0K+8yfKW83rE05MFTl5J3gs/J8GXTk4kJdVQr9/Q=
X-Received: by 2002:a25:7657:0:b0:613:7f88:7d9b with SMTP id
 r84-20020a257657000000b006137f887d9bmr22047ybc.282.1645049214588; Wed, 16 Feb
 2022 14:06:54 -0800 (PST)
MIME-Version: 1.0
References: <20220216133336.108810-1-nchatrad@amd.com>
In-Reply-To: <20220216133336.108810-1-nchatrad@amd.com>
From:   Song Liu <song@kernel.org>
Date:   Wed, 16 Feb 2022 14:06:43 -0800
X-Gmail-Original-Message-ID: <CAPhsuW7gbYinzABHiDri5xpiHPrNh2tbPz8X+kTo9qWZbjGzmQ@mail.gmail.com>
Message-ID: <CAPhsuW7gbYinzABHiDri5xpiHPrNh2tbPz8X+kTo9qWZbjGzmQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] platforms/x86: Add AMD system management interface
To:     Naveen Krishna Chatradhi <nchatrad@amd.com>
Cc:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>, carlos.bilbao@amd.com,
        siva.sathappan@amd.com, nathan.fontenot@amd.com,
        Suma Hegde <suma.hegde@amd.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, Feb 16, 2022 at 5:34 AM Naveen Krishna Chatradhi
<nchatrad@amd.com> wrote:
>
> From: Suma Hegde <suma.hegde@amd.com>
>
> Recent Fam19h EPYC server line of processors from AMD support system
> management functionality via HSMP (Host System Management Port) interface.
>
> The Host System Management Port (HSMP) is an interface to provide
> OS-level software with access to system management functions via a
> set of mailbox registers.
>
> More details on the interface can be found in chapter
> "7 Host System Management Port (HSMP)" of the following PPR
> https://www.amd.com/system/files/TechDocs/55898_B1_pub_0.50.zip
>
> This patch adds new amd_hsmp module under the drivers/platforms/x86/
> which creates miscdevice with an IOCTL interface to the user space.
> /dev/hsmp is for running the hsmp mailbox commands.
>
> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
> Reviewed-by: Carlos Bilbao <carlos.bilbao@amd.com>

Acked-by: Song Liu <song@kernel.org>

With a couple minor comments below.

> ---

[...]

> +
> +struct hsmp_message {
> +       __u32   msg_id;                 /* Message ID */
> +       __u16   num_args;               /* Number of input argument words in message */
> +       __u16   response_sz;            /* Number of expected output/response words */
> +       __u32   buf[HSMP_MAX_MSG_LEN];  /* argument/response buffer */

How about we call these args instead of buf?

[...]

> +
> +static long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
> +{
> +       int __user *arguser = (int  __user *)arg;
> +       struct hsmp_message msg = { 0 };
> +       int ret;
> +
> +       if (copy_struct_from_user(&msg, sizeof(msg), arguser, sizeof(struct hsmp_message)))
> +               return -EFAULT;
> +
> +       ret = validate_message(&msg);

We call validate_message() twice in this path. This is not a big issue, but it
will be nice if we can avoid the extra check.

[...]
