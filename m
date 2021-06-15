Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 462A6C48BDF
	for <platform-driver-x86@archiver.kernel.org>; Tue, 15 Jun 2021 20:29:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 26E4F613B6
	for <platform-driver-x86@archiver.kernel.org>; Tue, 15 Jun 2021 20:29:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229931AbhFOUbQ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 15 Jun 2021 16:31:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229898AbhFOUbQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 15 Jun 2021 16:31:16 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02928C061574
        for <platform-driver-x86@vger.kernel.org>; Tue, 15 Jun 2021 13:29:10 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id c5so10398wrq.9
        for <platform-driver-x86@vger.kernel.org>; Tue, 15 Jun 2021 13:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4BiPoKJEx0rYcRHQgmy0UngAAgVde/Qbhuv3pfWuqjg=;
        b=kkYz8/wet+NFuh3gj9kI/HvmIQWdOfehyv8654TdZ1OqWiBVOvohL///0kSHF1eStU
         fNVImEoSsI+snl6RdZMjiAmx/sy6khoeSft+iaS8aKabm86lIyC+M9wtuJmqBJXpglqf
         lclp0J/mHAdAcwBp+NJ1HstQ63Ao5DnpP+3fLu3PR64l8uFzHKHbQRa13OFO/AsgWz2x
         UbY3iTt38tFYZCKpgVf9oDjgw389tGvS+GuaKMaDmHF+Y/WF+6UWUagAY2Neoofaj6wq
         YGc+nsBj4oOb9TZdUipQcJxG6VR7mVHeuN2g0wnEYf59gBJdgZMMiHpOLNpYRSuieBBw
         t7DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4BiPoKJEx0rYcRHQgmy0UngAAgVde/Qbhuv3pfWuqjg=;
        b=rOVUCRDXrVoE7FotFQshU/x+9BtCpj4MGzu9uRnVkOPy4YQ3s/Oa3LMymIeFlr1Res
         nwlfDbNCw0qoVJC0Al4eU8Xdz0ZDlGpURbQm+Qqj9YubxuiRw3e1kI2/pyquisWM39+o
         XmxBkLqj4OO1Q14qK1JCRQENKBAbD3IK3o2C62NqdVruV66jEr7gWbma6lxe34MTnraW
         GMAoHNAfOSDwTDXHR3D1w6ZRyq1UN+0g4Y+ClRGoYLGoy48NOgTVTtOiQVGu1vEeYIfR
         wpNp6UwXF2htue85nwemNa5mIhFewl/VK1iNtacoMeZLdWoBErmJj+6SPLUvTjO+3IXH
         imcA==
X-Gm-Message-State: AOAM5324+lfA85st5XJreK68KVQKaHSfDo5T9a9inA2LM5zT6UoCPmpK
        H9+8zUVG2EVrUDSX7jiwfCz3P22R7TbD+RNRDIk=
X-Google-Smtp-Source: ABdhPJxJ1agXEuYBmNH2c6VjIQN7Yls9ero+/3iB0uHI6DlCxL1zE366EdF8uDizrA10C7lF0S5YqQSdsI740rcB+0Q=
X-Received: by 2002:a5d:4ecf:: with SMTP id s15mr1073389wrv.80.1623788949446;
 Tue, 15 Jun 2021 13:29:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210428032224.8299-1-s.shravan@intel.com> <CAHp75Vfq6B0=q0dsQPTP_A8sdPh9tepBooa7cW=KJYX78ekWtw@mail.gmail.com>
 <MWHPR11MB1455D055108F1DBEA6EB9285E3319@MWHPR11MB1455.namprd11.prod.outlook.com>
 <c7c3d395-826b-fc34-b396-a9c7631d981b@metux.net>
In-Reply-To: <c7c3d395-826b-fc34-b396-a9c7631d981b@metux.net>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 15 Jun 2021 23:28:52 +0300
Message-ID: <CAHp75VdLhxv4PqRznZGXQiWtdM7Ssx29xDkH4BaZ_DmHWa=-Nw@mail.gmail.com>
Subject: Re: [PATCH 0/1] [x86] BIOS SAR Driver for M.2 Intel Modems
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc:     "Shravan, S" <s.shravan@intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        "An, Sudhakar" <sudhakar.an@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, Jun 15, 2021 at 9:01 PM Enrico Weigelt, metux IT consult
<lkml@metux.net> wrote:
>
> On 14.06.21 13:48, Shravan, S wrote:
>
> Hi,
>
> > Why is it not a part of some generic subsystem under wireless network subsystem?
> >
> > -- This driver is instantiated only when the BIOS on given host exposes ACPI node corresponding to the BIOS SAR. This depends on support of the BIOS SAR feature by given OEM.
> > -- It is agnostic of the wireless technology like WWAN, WiFi and BT. Hence, it is not made specific to any given wireless network subsystem.
> >
> > Please do let me know if you need more information.
>
> the problems I see here:
>
> 1. the device uapi is very vendor specific

We have a platform profile which is also quite vendor specific,
nevertheless we (as upstream) are trying to have points of
unifications.

I think this driver should be part of the corresponding profile /
network subsystem part and be a one (of the) hardware implementation.
Somebody can add more. Users in Linux should have a common ABI for
that. And I'm not sure it should not be a netlink based one.

> 2. its unclear for which air interface is the data really retrieved ?
> 3. unclear how userland this should really handle in a generic way
>     --> how does it know which device to tune ?
> 4. does it really need to be (non-portable) ioctls ?
>
>
> by the way, who hat that funny idea putting such information into acpi
> in such a weird way ?

I believe its source is a Windows driver and Windows "culture", they
simply don't give a crap about anything else and Windows is a
product-oriented platform (each product is unique even if 99.9% of the
hardware and firmware is the same with twenty more products).

-- 
With Best Regards,
Andy Shevchenko
