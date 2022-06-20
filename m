Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49632C433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 20 Jun 2022 10:22:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232112AbiFTKWM (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 20 Jun 2022 06:22:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231657AbiFTKWK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 Jun 2022 06:22:10 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2738813F79
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Jun 2022 03:22:10 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id o10so14454885edi.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Jun 2022 03:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vEfyGjdR1Ojoqsl4PXZwpj9/FMEIk7/0eiioyNDyDNo=;
        b=I/DFD//2PLBEgy3Kt3Gldnu9yvPzO4iUbT+EiC0hdHHF+dRb2SvBHzJdLC8OJE24X1
         DSMQW04Sna9f3URHZosakuCOnEFjfsruVt/w9mz2iRICHuIXIKvzs/VsVhYJ72ln1xCI
         Z8PXhWclxiMBLsoPUZCTBd+SIULO/+Gz9RPLW5c/LgYn/fXYiMI1fTTWbv5tqJv5Yg2U
         vB74lWgoKWHk/W/ULfHQCLlm88DHkJbNxWsDH700dsPijZ0yG+lhWRc7rwbUOOMORTUe
         cHqpzTjCAhMkg2bWfQiizduvDvpQQLQeVFjIbhRiXMsbgU/3LBCvu4V33zGytL7xc3F7
         NiuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vEfyGjdR1Ojoqsl4PXZwpj9/FMEIk7/0eiioyNDyDNo=;
        b=ZYp6FNZD6aBL/asO7cC5AdUp4+uNeaKFp34IyZ5QW62+gfBt4RjPXeZV5aIqJjVneF
         yG7uKvK13OuCDMz8BlFb0oaOd1WfXR+4aPdKa8D9VNcH9xvBVOeBMljeSHz8f5rDrg76
         3y972knaUgpTwIkPz1+BLZq1qFu6NeCV6tMEsWCL7zUpPAi1VJO7Abw9mMxdTWfbrdmk
         +Us2YwZvw87ozUZ1xJbV7GO+3txoreMD1bax5ksx/uAzRkwvX3kDZPoBl0P5vOQa4Rko
         zDzTHPDnKjVYx93Yjw33Mzz01RQAknX/2/xLnqMvPVO1GtywqLRKGqjnB8h8eP0fCI5e
         ciAg==
X-Gm-Message-State: AJIora8lNj7DugF6sLKHWU0Xelx3KdFxiIHTixtl5kJ5sNDoJt59juOP
        W0UufM873i99YY1GKs8sU6OI4DvxCvCY/3V0Sd0=
X-Google-Smtp-Source: AGRyM1snMGFWmPT4GGvKThgbCr41Ts+MOkwZG5x74g0yvPklr/QfoMExUSSN/TJuWBujVii4+fwpgfkraedSl/QHb5I=
X-Received: by 2002:a50:9f6a:0:b0:435:5804:e07 with SMTP id
 b97-20020a509f6a000000b0043558040e07mr23652502edf.178.1655720528621; Mon, 20
 Jun 2022 03:22:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220620093637.9429-1-hdegoede@redhat.com> <20220620093637.9429-2-hdegoede@redhat.com>
In-Reply-To: <20220620093637.9429-2-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 20 Jun 2022 12:21:32 +0200
Message-ID: <CAHp75Vf26xfP9j386HEoxeJmu1Co-KXkU6Dk+9q8rEu_hr4fFA@mail.gmail.com>
Subject: Re: [PATCH 2/3] platform/x86: Kconfig: Remove unnecessary "depends on X86"
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, Jun 20, 2022 at 11:36 AM Hans de Goede <hdegoede@redhat.com> wrote:
>
> The sourcing of drivers/platform/x86/Kconfig is protected by
> a "if X86", so the "depends on X86" for X86_PLATFORM_DEVICES
> is unnecessary, remove it.

Looking into the upper Kconfig, I would rather go and drop dependency
there to be consistent with the rest of drivers/platform/ cases.
Perhaps it needs to be done separately for MIPS.

-- 
With Best Regards,
Andy Shevchenko
