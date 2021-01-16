Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0C1FC433E0
	for <platform-driver-x86@archiver.kernel.org>; Sat, 16 Jan 2021 19:53:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A9493229CA
	for <platform-driver-x86@archiver.kernel.org>; Sat, 16 Jan 2021 19:53:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726395AbhAPTxa (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 16 Jan 2021 14:53:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726201AbhAPTx3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 16 Jan 2021 14:53:29 -0500
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11690C061574
        for <platform-driver-x86@vger.kernel.org>; Sat, 16 Jan 2021 11:52:49 -0800 (PST)
Received: by mail-pg1-x533.google.com with SMTP id 30so8336239pgr.6
        for <platform-driver-x86@vger.kernel.org>; Sat, 16 Jan 2021 11:52:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=XrktdxtZnkbx9pvGQSeG9MdaGQiHN52waSXwz4IW+xU=;
        b=AAe6M0voP1v0PSoJhuSkkj42+Yio/pPjxGkA9NqiMvbLb1i1LCMGWbsSLtrWTYxZX2
         zUJD5oDud7UTTg/Qf9Wyuc8SAIAqYebH6qpDcHuF7mcQKi3EOs0bSacgcxrS7TuoOSql
         GuO9EvcGnJ613tzBvZUXOO6vATlUiWJ73Hv9ORYURO4PngHbMUXBGWwKekBILDEHu2R4
         M1n+cE+TrOzqOdUAb3Iya41+MN5fEplmuKksAVO49KtVthTfUwmmsl31e8uz6npXZf2+
         LrYzsRKKS8Ndp+9zAdnCyFkJFNPq0InewwZq+vZ447iZJF+cbRE89Gi4xe/hOyptSdag
         9zQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=XrktdxtZnkbx9pvGQSeG9MdaGQiHN52waSXwz4IW+xU=;
        b=NVntk95WdeSaaXHpf/AF+eTldLEXjjojyGUrKCL+dGHsWZ86HSoy3FTQaKOU1aEwt6
         KmsWrR5hl/1nydJGOjYEEza58dNEhRu2faQcxvTUQcpUx+D4FP0+UzYHvUkFd7zTVMPH
         pHYzBYt6QyVl9KVP2NtoSAunlJ9FO6Y/S7ztB/RZ1KmAYY2gqxIIRrdeq+Efckh/07jR
         UnOm/R1s+chDcRTb0aFPHyT7puqTuw1T+FJe77W+KueYUJx/Xiw9eBC3UNcKZcPeOGOv
         fdQNHabji9EDGZ/27vcrC2SKG/sJ87CHJbhJXKzsdD13cxac+Z3yAMQ41wdb99M42kAV
         ywmQ==
X-Gm-Message-State: AOAM532g72xXHiv3IobfbUc1VsU/iYciyRr1tAjWTzysys3WmGJEQt+K
        1lqcabA0OzgV+iwvai1X2K2KWy2KUdWwVjTFNqM=
X-Google-Smtp-Source: ABdhPJyNO1WNLHD9D7C/pxqWGjPyD01sWhAAhDpRfwDVGb73AUch1wczArIBA3yVCEKl+qvd2JLzr0aM6iRCCv9H/XM=
X-Received: by 2002:a62:19cc:0:b029:19e:321b:a22e with SMTP id
 195-20020a6219cc0000b029019e321ba22emr18966623pfz.73.1610826768594; Sat, 16
 Jan 2021 11:52:48 -0800 (PST)
MIME-Version: 1.0
References: <20210113182016.166049-1-pobrn@protonmail.com> <20210113182016.166049-11-pobrn@protonmail.com>
In-Reply-To: <20210113182016.166049-11-pobrn@protonmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 16 Jan 2021 21:52:32 +0200
Message-ID: <CAHp75VfQHmFT1Oqup_+XvnNTwuMpo75JNWNmorsAf1v-6b2TnA@mail.gmail.com>
Subject: Re: [PATCH v2 10/24] platform/x86: ideapad-laptop: misc. device
 attribute changes
To:     =?UTF-8?B?QmFybmFiw6FzIFDFkWN6ZQ==?= <pobrn@protonmail.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, Jan 13, 2021 at 8:23 PM Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.=
com> wrote:
>
> Do not handle zero length buffer separately. Use kstrtouint() instead
> of sscanf().

...

> -       int ret, state;
> +       int ret;
>         struct ideapad_private *priv =3D dev_get_drvdata(dev);
> +       unsigned int state;

Reversed xmas tree order?

...

> -       if (sscanf(buf, "%i", &state) !=3D 1)
> -               return -EINVAL;
> +       ret =3D kstrtouint(buf, 0, &state);
> +       if (ret)
> +               return ret;

This seems to me a relaxing case, and should be 10 instead of 0. Am I
right about %i?
If it's true it's probably minor, but still an ABI breakage.

P.S. Same comments for the similar cases.

--=20
With Best Regards,
Andy Shevchenko
