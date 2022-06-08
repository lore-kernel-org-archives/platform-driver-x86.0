Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 983EBC433EF
	for <platform-driver-x86@archiver.kernel.org>; Wed,  8 Jun 2022 18:41:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231175AbiFHSly (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 8 Jun 2022 14:41:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231249AbiFHSlx (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 8 Jun 2022 14:41:53 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E3121FCD3
        for <platform-driver-x86@vger.kernel.org>; Wed,  8 Jun 2022 11:41:52 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id v19so28278321edd.4
        for <platform-driver-x86@vger.kernel.org>; Wed, 08 Jun 2022 11:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KBhtdTIS4CnFOXkqKLr6CwfUvduN07kNu9y8RFNMOy4=;
        b=gte/5TPFeSoWhhzQkY205SoHSNH5O8WOMYjbMK29Kf3i5HBh4k/3ucdNNanBqKb3Wk
         sUxX0CWo7CY9W+UcoU0GpmdSqINSRBDiv5B02IUKz1bO/SsofNWA3GYINMp5/OJooXwJ
         DPPm0ua3buXSSSNv9qDGZSMS19tjldDRWTdYINFKN1WLBA9afAQKehpgdh27AbMnMOUw
         EXGe7O0M2WlHcc4noTcu/9Wxfz6uLBBTWTxRlcw0ZOLXaoJfItwzxOA8Byp6P0mgSWrH
         xOnAVaIv36oLZ+nUE0/FGa+Ddcnxk0l5z3RZbxeJkBxtnj8wiV11kLl4CW8xveTF33L9
         GjFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KBhtdTIS4CnFOXkqKLr6CwfUvduN07kNu9y8RFNMOy4=;
        b=UYu5czESXluYFZdI82J6OnFXj+RD2yKbFJ9tSZCIPrXLfwxWx7ChKMmayTSbI8mpbq
         7/+AiGBadc4G2LnPQfUCFPE2fvpDyyzhc1ZUtsBHqvKVkQUK0NS1ekBfBR/1XKvitekX
         4+6j1K30XlXKrJ+hGselqJAeNr1FsohBqZsJdb1KoTSK7DxOec9cpjgMM21gdUbMcvrV
         mbDO/qKJ/gMb4CnazOeVHs0cbI4IGPEkSug0czzJdFL/ktNGtvRvoD71ES/uVnkGJ7JK
         2hash6eWMygCWEJUm7uTfVmwDY1imt14uFydVjCZM2KebDpex2NstXopO7Lj8K7W74SI
         jxvw==
X-Gm-Message-State: AOAM530rs8IHHXKhpvoRMoeywVMfB9QBlEDOaOHCjpt9alOhWb8E35zr
        kADKKCjRXlDxptBHeVdG9DSZaPWYDpiDW0Qt4P8=
X-Google-Smtp-Source: ABdhPJy2WJ/2U9W26/7FUJfaBsnIQaJkNLWJgBXQL/PuoD5B/grq+soeixTJGo90NG+zbpXD3e3itbbiUVj2kC6uxNQ=
X-Received: by 2002:aa7:c396:0:b0:42d:8b86:a8dc with SMTP id
 k22-20020aa7c396000000b0042d8b86a8dcmr40113069edq.54.1654713710923; Wed, 08
 Jun 2022 11:41:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220608182019.2810125-1-Shyam-sundar.S-k@amd.com>
In-Reply-To: <20220608182019.2810125-1-Shyam-sundar.S-k@amd.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 8 Jun 2022 20:41:13 +0200
Message-ID: <CAHp75Vf6WZZxD220niCd3FSsvFJOz7pDPgckcy2fw5p1hN9xNA@mail.gmail.com>
Subject: Re: [PATCH v2] platform/x86: Move AMD platform drivers to separate directory
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Naveen Krishna Chatradhi <NaveenKrishna.Chatradhi@amd.com>,
        Suma Hegde <suma.hegde@amd.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, Jun 8, 2022 at 8:23 PM Shyam Sundar S K
<Shyam-sundar.S-k@amd.com> wrote:
>
> Currently, AMD supported platform drivers are grouped under generic "x86"
> folder structure. Move the current drivers (amd-pmc and amd_hsmp) to a
> separate directory. This would also mean the newer driver submissions to
> pdx86 subsystem in the future will also land in AMD specific directory.

...

> +obj-$(CONFIG_AMD_PMC)          += pmc.o
> +obj-$(CONFIG_AMD_HSMP)         += hsmp.o

This will make a potential collision if there will be a module with
the same name, but in a different folder.  Also this breaks a kernel
command line (in case of built-in). Dunno if the latter is important,
though.

I mentioned a trick that has been used in drivers/platform/x86/intel/Makefile.

-- 
With Best Regards,
Andy Shevchenko
