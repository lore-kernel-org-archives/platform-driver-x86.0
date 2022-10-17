Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8404C433FE
	for <platform-driver-x86@archiver.kernel.org>; Mon, 17 Oct 2022 15:20:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231255AbiJQPUf (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 17 Oct 2022 11:20:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229867AbiJQPUe (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 17 Oct 2022 11:20:34 -0400
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D25623B730
        for <platform-driver-x86@vger.kernel.org>; Mon, 17 Oct 2022 08:20:30 -0700 (PDT)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-354c7abf786so111208207b3.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 17 Oct 2022 08:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xGvrQRxcEiIvGUDdIa2rP7sQNbWsiGQyTx5blyMHuwY=;
        b=Vu6DMdB+DhrW8CCKsgUHEddoMepquG0Z9lJnWuxhrNP7snlR9/0OcZo4EH5Roh216x
         C8rOb6n7pZtgnlDkRqKY8zCCCaUhCAa8vRpzEvtp4v17siL3Pgzbc62OsefyyI7IPgmq
         C2wbzfHh8MuR1Q2PILPyvHwXmDWuMBnWUZbYie2kyRJ/4fDwl3bYLmQDjlHabn7pFZbW
         j5hdfgcZnmQ8TJbBtsgO/No1c89GMFP9hWlhTWW1OPQaFdWE789ZJcKGCMKKVvFjsK+f
         v0ZcNOnO1a3kb9bj5g491DJ8LwQK0PzTlH9hCwhlpX4WTIdte8QWb81zfmX1aFz/Gb5F
         JwZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xGvrQRxcEiIvGUDdIa2rP7sQNbWsiGQyTx5blyMHuwY=;
        b=q2uXNeKZDx2aPrQ3ScYJhXWM+j0lfhHbdFAn4NAuCVGv67HoGZRjdOnHJys2g014pP
         TtIKY26sRA+6VyYwM1Zw8v0r80g9w0LLJEamOE8apSvrFjfaRjByqcWrFcwYjPOiyhnw
         q7h3MZ9nSm2V4TNL3+XcPAH9jaRkNnA7jXVt1oE0/tMCyKef/PqDNegEGdlv2cU/C5tH
         7aknowKmbZM2G7by3XpbqH7M7dwxIW+Mj7PUzBXxH+F4yk8LkHEBOrsLzsrhhBet6iG9
         vsi2y5K7SQK/nk8vCa8I4SPairiIJtxGWEeQOVBpSFfxqGMpjRJIqAiEJZ5y/sabo3p4
         JtUQ==
X-Gm-Message-State: ACrzQf2xEQJcNe/5K6neUNqP4hkkeEauKK9UDx0pZEFU4GGwc0JpGy76
        afWNWPvNC1SqkU4C0OZ16h1gn7eOvnlQHMrZw9s=
X-Google-Smtp-Source: AMsMyM4uwK29a+LXMTfQs4HBQalmEKMrWEgjdIp/5eLDPsvy/JiNjSsV47hr4+LFaENp3FsYfFAJdfk3ef8z471RhMs=
X-Received: by 2002:a81:b8c:0:b0:35f:80ce:306a with SMTP id
 134-20020a810b8c000000b0035f80ce306amr9675767ywl.97.1666020030045; Mon, 17
 Oct 2022 08:20:30 -0700 (PDT)
MIME-Version: 1.0
References: <20221010162326.12957-1-jorge.lopez2@hp.com> <20221010162326.12957-2-jorge.lopez2@hp.com>
 <a50407fd-6969-9e9a-23a3-39879af639cd@amd.com> <CAOOmCE--qzRCOgpfpW5j5VmnCPExdTVDM9yQ-PcXrec76e492Q@mail.gmail.com>
 <d88e15ba-9e3f-310d-118b-7ccb2fbe1ca9@amd.com> <CAOOmCE9wVT=Fr72pgx58X4RMPy554MwZev3_8JtU8cBLdNpfhA@mail.gmail.com>
 <CAOOmCE9fuHTTVcSUSC0SU3N_ht8uVLg4hGUAJE7bJgs6UAt3gA@mail.gmail.com>
 <dbffc3c3-9fbf-8d7d-99a9-29d44671e7f2@amd.com> <f453562f-b87d-d754-0aaf-524575bc7f57@redhat.com>
In-Reply-To: <f453562f-b87d-d754-0aaf-524575bc7f57@redhat.com>
From:   Jorge Lopez <jorgealtxwork@gmail.com>
Date:   Mon, 17 Oct 2022 10:20:18 -0500
Message-ID: <CAOOmCE-E8SGmUVmajYqXFpza1p5mwTOJS2Z6a8Wxd4g=j92vkQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] Introduction of HP-BIOSCFG driver
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     "Limonciello, Mario" <mario.limonciello@amd.com>,
        platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Hans,

On Mon, Oct 17, 2022 at 9:37 AM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 10/17/22 16:29, Limonciello, Mario wrote:
> > FYI When you submit v3, you don't need to add "new patches on top" for =
your feedbacks to the new driver, they can roll into the patch introducing =
hp-cfg.  Just make sure you include a changelog under your cut line to indi=
cate you changed these from vX->vY
> >
> > I suspect that Hans will also want you to split the driver up into smal=
ler bite-size patches to make his review easier as well, but I'll let him a=
dvise how he wants it done.
> >
> > On 10/17/2022 09:11, Jorge Lopez wrote:
> >> ''Hi Mario,
> >>
> >> Please see comments to previous source comments.
> > <snip>
> >
> >>>> Thanks.  If you make this change for v2, I can make the matching cha=
nge
> >>>> in fwupd so that if it notices current_value permissions like this t=
hat
> >>>> it shows read only there too.
> >>>
> >>> Submitted the recommended changes for review in v2
> >>>
> >
> > Thanks, looks good.
> >
> >>> Submitted a patch to improve the friendly display name for
> >>> few numbers of attributes associated with =E2=80=98Schedule Power-ON.=
=E2=80=99  BIOS
> >>> assign names such =E2=80=98Tuesday=E2=80=99 to an attribute. The name=
 is correct, but
> >>> it is not descriptive enough for the user.  Under those
> >>> conditions a portion of the path data value is appended to the attrib=
ute
> >>> name to create a user-friendly display name.
> >>>
> >>> For instance, the attribute name is =E2=80=98Tuesday,=E2=80=99 and th=
e display name
> >>> value is =E2=80=98Schedule Power-ON =E2=80=93 Tuesday=E2=80=99
> >
> > Looks good
> >
> >>>>>>
> >>>>>> Presumably if this is going into it's own directory you should mov=
e all
> >>>>>> platform-x86 HP drivers to this directory earlier in the series to=
o.
> >>
> >> The other drivers named HP-WMI and HP_ACCEL  were written by third
> >> party members and not by HP.   It is for this reason and because of
> >> the number of files, only hp-bioscfg was placed in a separate
> >> directory.   Let me know If my reasoning is not valid enough  and I
> >> will keep the files in a separate directory and move the selection to
> >> the main list.    In addition, Moving  HP-WMI and HP_ACCEL drivers
> >> from x86 directories fall outside of the scope of these changes,
> >> Correct?
> >>
> >
> > There is no distinction who writes a driver.  I think either you keep t=
his driver in the root of drivers/platform/x86 or you put all the HP driver=
s in drivers/platform/x86/hp.
> >
> > I think if you're going to put this driver in the sub-directory "hp", t=
hen the first patch in this series should be to move those drivers to that =
sub-directory.  The second patch should be to introduce your new driver.
>
> I see this driver has a lot of separate files, so what should happen here=
 IMHO is:
>
> 1. a preparation patch adding a hp subdir moving the existing hp drivers =
there

This will be a separate patch but not an obstacle to gain approval of
hp-bioscfg driver, correct?

> 2. but this driver in a subdir of the hp subdir, so put all its files und=
er:
>
> drivers/platform/x86/hp/hp-bioscfg
>
> so as to keep the files together and separate from other hp drivers.

Can you please clarify..

Do I need to start a new review with only two patches described earlier?

1. a preparation patch adding a hp subdir moving the existing hp drivers th=
ere
2. Squash (current version v1 and v2 changes) into one

>
> Note other then just skimming the comments I have not looked at this driv=
er
> at yet I will try to make time for this soon.
>
> Mario, thank you for your review work on this.
>
> Regards,
>
> Hans
>
>
>
