Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2713C6FD1D
	for <platform-driver-x86@archiver.kernel.org>; Tue, 21 Mar 2023 02:14:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229561AbjCUCOy (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 20 Mar 2023 22:14:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229788AbjCUCOx (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 Mar 2023 22:14:53 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CF4C1449F
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Mar 2023 19:14:40 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id k14-20020a056830150e00b0069f156d4ce9so3199766otp.6
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Mar 2023 19:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679364879;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z8mQdOTNc3FhldKAZ6fd7DrLH3lG5FyR3vLE3VKUWQE=;
        b=UcO8OP0Qw51g4zr7Ye/cCXs52sJIGFOyswvrOyFQshrPBHcIi/1MVzEzyj/Oh2QK67
         JHFKLe10HuIK6KHBd6valE3aYnEJXY2KU/gQ+QfU2F58yVEHB3L3FRqfgEL6u13h8Wsa
         KfjKeoTWw/lYd5hbEVdBqX0FDONKV0NEDkg4aj4B6gkc18Wmv+p+0XKBzzRrsAfUPUlO
         hz95cGj723BLw8ZEZLGqstQMZklx3a9ARxYtYXNpVSkE20hES/nDruIG4ZgUyd1hdH9e
         xnIaIyU8icK+fzjk8p7+Bp/6ZF9gZ6KrmpD/P2rS2HulW0ZCiPFKhLVGcVG0TffaUaNS
         8Z+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679364879;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z8mQdOTNc3FhldKAZ6fd7DrLH3lG5FyR3vLE3VKUWQE=;
        b=v02di5iVrRHadZnRa8uWaU5um4KohNCVFpFrqaXFCodmhXgsly7s6vZXzvngLyvR7v
         K7Q6B1gUVmSY+jnuay/6Aqa/f/MQi/++u5M9PENUDk3MYsaLmBR89W9f8WyVbKuLfTdh
         tqKp80/EdZ40kCnUYlbeOZDHhIOZJqElI78xXR8cjq6waqnPpC4n8oe5+Ily+szKN+wi
         Kz+iyaiMkbttGQhTGLo5X/bTW1xDBFXW6rc3iOvkktOPAbaTpgJULG7PT6zj+bqfgrp8
         Ev+cJZ+47gQrk6uJ2hSQby7MGlb6F8lxVmWtv12Ae9kk2UWbMOi3A+2BZl6EmDJShtfK
         kK/g==
X-Gm-Message-State: AO0yUKXZXP1265gnwchE4G5ATHcg6DvnxHa5H2o9aLE0Y2gJYhkrzy3E
        S1GBBjHX7vc8CdmLO4EvAjPG/ulbEJbu6TNnoSQ=
X-Google-Smtp-Source: AK7set9PaTIhBhRoMac9RMM08Ul9TZlEdZlml+sQ29lAZwl+VlzQLQQDbjQlVWdf2mOWx7UK2FUB/sdvli1RCWRzBFU=
X-Received: by 2002:a9d:694f:0:b0:690:e6d9:4842 with SMTP id
 p15-20020a9d694f000000b00690e6d94842mr316188oto.0.1679364879220; Mon, 20 Mar
 2023 19:14:39 -0700 (PDT)
MIME-Version: 1.0
References: <20221004214332.35934-1-soyer@irl.hu> <20230310041726.217447-1-kallmeyeras@gmail.com>
 <20230310041726.217447-3-kallmeyeras@gmail.com> <85e87867-5001-da05-dd7c-020977c75288@irl.hu>
In-Reply-To: <85e87867-5001-da05-dd7c-020977c75288@irl.hu>
From:   Andrew Kallmeyer <kallmeyeras@gmail.com>
Date:   Mon, 20 Mar 2023 19:14:28 -0700
Message-ID: <CAG4kvq8=nHL49_U6=fc0eNPptzX-deXvg=XnmgKC1cAMHP3iMQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] platform/x86: Add driver for Yoga Tablet Mode switch
To:     Gergo Koteles <soyer@irl.hu>
Cc:     platform-driver-x86@vger.kernel.org, hdegoede@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, Mar 20, 2023 at 6:05=E2=80=AFPM Gergo Koteles <soyer@irl.hu> wrote:
>
> Hi Andrew,
>
> Thanks for picking this up. Sorry for the late reply.
> I no longer think this driver should do the same workaround as ymc.exe
> does, it shouldn't make non-WMI calls.
> I think the 14ARB7 should be fixed in the BIOS to work like the other
> Yogas with the same WMI IDs.
>
> So PATCH 1/2 and codes related to ec_trigger are unnecessary.
>
> I only have the 14ARB7 and I can't test this without the ec_trigger.
> For this reason, I don't want to be the author of this module.
> Could you be the author?
>
> The working C940, 14API reports are from
> https://github.com/lukas-w/yoga-usage-mode module, which uses the same
> WMI IDs.
>
> Regards,
> Gergo
>
> Co-developed-by: Gergo Koteles <soyer@irl.hu>
> Signed-off-by: Gergo Koteles <soyer@irl.hu>

Hi Gergo, happy to hear from you!

Now it makes sense why this never got submitted. I suppose the 0xAB
method ID came from decompiling that ymc.exe as well? It looks like
the github repo uses 0x01 which is what we found in the acpidump.

I will remove that code like you say, make myself the module author,
and add your Co-developed-by and Signed-off-by tags to the commit.

Thanks,
Andrew
