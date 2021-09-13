Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB23FC433F5
	for <platform-driver-x86@archiver.kernel.org>; Mon, 13 Sep 2021 10:23:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A2FD960FA0
	for <platform-driver-x86@archiver.kernel.org>; Mon, 13 Sep 2021 10:23:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238996AbhIMKYW (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 13 Sep 2021 06:24:22 -0400
Received: from mail1.protonmail.ch ([185.70.40.18]:31878 "EHLO
        mail1.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236170AbhIMKYW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 13 Sep 2021 06:24:22 -0400
Date:   Mon, 13 Sep 2021 10:23:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1631528585;
        bh=ooiZ9cP9yk8CLoiFLl4lFpv96tz2SOV1+vXXnpDzXJo=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=CbtsDlXVf8fUfAHlYZB5HhSMA+FTQU2ZEhjFLiU4mEsRvRpOKL2Bgxw6T/Jx5I0og
         Y4ftB6G9DyRukzPJl5Xn6u6jIfED8iHhHd543N0qVNuefyAgKSdfAhkcmUvxBS1K9Z
         vqxHE6OKIy+90PobOsTzyU06XwK/RHTzEwTQGfLs=
To:     Hans de Goede <hdegoede@redhat.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [RFC PATCH v1 00/30] platform/x86: wmi: minor improvements
Message-ID: <N_isSZWZvE8KdPaxiUXrNjnwB44Fvwy9nqgzzCvuHGqG0RUcrgs-DWx_O7vYcklXl6yul8VRSmEuSZGrehlDcC74iGMB2XL8YDx7kac3gA4=@protonmail.com>
In-Reply-To: <902a8c92-618f-51a5-3288-253243744ed2@redhat.com>
References: <20210904175450.156801-1-pobrn@protonmail.com> <902a8c92-618f-51a5-3288-253243744ed2@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi


2021. szeptember 13., h=C3=A9tf=C5=91 11:19 keltez=C3=A9ssel, Hans de Goede=
 =C3=ADrta:
> [...]
> Thank you for this big cleanup series.
>
> Not sure why this is marked as a RFC?
>
> I've gone over patches 1 - 7 sofar and they all look like
> straight forward simple cleanups. So I will at least apply those
> right away.
> [...]

It's RFC because, well, I wanted to get some comments and see if it's not u=
nwanted.

And I had made some local changes since I have sent the series:
patch 17[1] has been replaced. So please ignore that.

[1]: https://patchwork.kernel.org/project/platform-driver-x86/patch/2021090=
4175450.156801-18-pobrn@protonmail.com/


Best regards,
Barnab=C3=A1s P=C5=91cze
