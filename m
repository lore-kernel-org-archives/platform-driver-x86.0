Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 561CEC433F5
	for <platform-driver-x86@archiver.kernel.org>; Sun,  6 Feb 2022 19:47:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240112AbiBFTq7 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 6 Feb 2022 14:46:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240053AbiBFTq7 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 6 Feb 2022 14:46:59 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8B01C06173B
        for <platform-driver-x86@vger.kernel.org>; Sun,  6 Feb 2022 11:46:58 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id ka4so35988993ejc.11
        for <platform-driver-x86@vger.kernel.org>; Sun, 06 Feb 2022 11:46:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eanDt8TzuUnneMALmM2GhM9TOZKhvAu04Bajj1wykic=;
        b=htblr9YU2nDYrSPPzHs4ddpSuLdOVfK3URSLA377b4B9u929Yd153CgFdGtwu/KTE1
         fkqpzQeJdZMYmKqfx5ns73DjGF1T5BRYTSvmRASZls7MWA9JsjQQw+/nc/NW6UalrSTy
         kVUQWNrTH/t9qtGuYGxKVmhp3WJSF3wjaUfCUYXaSj+zvk6q4caPMIuQMJnyRi4USg/z
         bFz/DH0SA9sbdzT3WFTeLTsAnAjM5y53fxROYwwqlWhLUOp8NbD9S0OoKr54r3rfBpqG
         GyqndU0CzMlELvtI+mienux0fgZTCoE+t8+00YHcUAJ5uxi/uAy7BfENSk8fgcB/wYH6
         kX3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eanDt8TzuUnneMALmM2GhM9TOZKhvAu04Bajj1wykic=;
        b=mbyQmWNkodR4BBN8Gs9HHA4/U0naCsGpZksOt+Kn6P5H2eLUZpfuSka/rsTzBbF1gs
         BC+2sQWEECfCUYAyImyCLxtBfyHkORX94VmVBm2RgzlJyR65xf+VZFbjNzCS11wT5B6A
         KiNDC7erWtvB8uX3z64AivuT7K4awQg69MlvfwAcmlBWJrbFk6x9cRzIJZjZzcixwZF7
         mrfk9UY4PXsyqBmVFDnX7EHX1YkDtzDGDefr4+m8p+V4hOTTjGSI8E0i+0yELrJlBck3
         M/ZsmWqfH7pW++E69FciiacbdR9/3Ql+C7+bdJ1d1ee6AIR/+Hu0kho6Z/hLOT+ptSML
         Alcw==
X-Gm-Message-State: AOAM5312VeXs4tutv6bh7s6SceQjUPZTTGRAijew3t8oJUPZz8wikneb
        Lmfy5l1lV4sFa7rm0+hOO6g2ofej1J8WPijK3D4=
X-Google-Smtp-Source: ABdhPJyTfHtiIfb+2paY4gc5PBA6W6W2Vj93959BOSfu6BDg+oEEb5V+QtbjONcAmz90zvmxSzL9IUAo3TOfXOtOTpA=
X-Received: by 2002:a17:907:a40a:: with SMTP id sg10mr7682172ejc.44.1644176817124;
 Sun, 06 Feb 2022 11:46:57 -0800 (PST)
MIME-Version: 1.0
References: <20220205191356.225505-1-hdegoede@redhat.com> <CAHp75Vep66axJzXAdBQa4qzxRZG-Nzf=YeVSZHAg7enkwDLTAw@mail.gmail.com>
 <b4dd20bc-eefe-a794-ab67-e242388451b1@redhat.com>
In-Reply-To: <b4dd20bc-eefe-a794-ab67-e242388451b1@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 6 Feb 2022 21:46:21 +0200
Message-ID: <CAHp75VfLLL9_YCLPGoCH0MsWDxQcLFoC93Qeqfpjcro=ULGb8A@mail.gmail.com>
Subject: Re: [PATCH 1/6] platform/x86: x86-android-tablets: Add battery swnode support
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Sun, Feb 6, 2022 at 9:10 PM Hans de Goede <hdegoede@redhat.com> wrote:
> On 2/5/22 21:41, Andy Shevchenko wrote:
> > On Sat, Feb 5, 2022 at 9:14 PM Hans de Goede <hdegoede@redhat.com> wrote:

...

> > All non-commented looks good to me,
> > Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
>
> Just to be clear, you mean that I may add your Reviewed-by
> tag to all patches in this series to which you did not comment,
> correct ?

Yep!


-- 
With Best Regards,
Andy Shevchenko
