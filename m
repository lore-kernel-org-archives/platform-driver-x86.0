Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C690C4332B
	for <platform-driver-x86@archiver.kernel.org>; Tue, 26 Jan 2021 05:53:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E492E2223D
	for <platform-driver-x86@archiver.kernel.org>; Tue, 26 Jan 2021 05:53:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728154AbhAZFxT (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 26 Jan 2021 00:53:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728269AbhAYMpG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 25 Jan 2021 07:45:06 -0500
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3A7BC0617AA
        for <platform-driver-x86@vger.kernel.org>; Mon, 25 Jan 2021 03:35:00 -0800 (PST)
Received: by mail-pf1-x432.google.com with SMTP id j12so8205827pfj.12
        for <platform-driver-x86@vger.kernel.org>; Mon, 25 Jan 2021 03:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=pyBDGlUApv6+i3cjrkxkbSWWGId+jblITaDMueG0kIM=;
        b=IR6P89bG3RbC8s+lJgNxTjFWugk4LURCibyB4vIsMHRGc/EbS3vpnK7MzvUO4lbx4M
         zSIUpPN7IR69oVKeWdoKoTDzqE5c4JX9GDNDh1Lkwsd14AUh3uRuCwJ+YJoehlIRe3K9
         Bcg5J0DiWEp/Ky7PGqlv0Ue7GdYEzefMcFliroWbcTLWhhWI7swC2wbCl+cUiz7sGv5M
         kzUnuGvkLnPjEO6Kq8M1Vlsq6MDpnk+1/A2i+dNBUm6hmU2fLwoCh9CaQuGIEeodmubQ
         EyzWD19/nvaAZEM/moOYRGsMfL9bG6iXXkBqK2+iMCwfDqMvx4bdwwZwsUO2Sk+JhI47
         /dHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=pyBDGlUApv6+i3cjrkxkbSWWGId+jblITaDMueG0kIM=;
        b=E5nkadXp7Pd45Y1c2ZTC8I1Fp6VUTDQHJReF4MopmvMqvI4MZQJT9Bzl4oKJSxohqH
         qPYAKhQMCx+yT3gbA3ncavgfvT4/4o3bgvB4MBH0PFify86J9nBRWVp2DpJCcxjksB34
         ZU8m9v1opKiJ3z/Rg2eL917hCLb6gpGa+D9rA/PrqW/6h1V9db6KIwlw6VD7iyelSBo4
         LmYtHndDRUAbJy2fEFSYvs/wALUtDSfVJKhJlxTiaFeBWRw5JPDWMFKGAnxc8WThGO64
         b6MlXrZwwBw7w8phIMdzHd9FTJrKEnySo1ZNZ/ymxSEnvpkekde+qGHAWVYlRhNJtb8J
         MU8A==
X-Gm-Message-State: AOAM5321mtW3dXyW1yQV4iZPVtqoX8HkUdg/HdexJXz3Q3kUsqHYOM/O
        MdNuzmUAUH6tdkfBGOWzukuAMAKFVdznmf5mejg=
X-Google-Smtp-Source: ABdhPJw7V1h17zSqz9nmgP93VAkG6yW7YsAG/7N4xrJ3xyYcTb9vjjZGadY9hdIvSAsPnod6b4shwtFSGicqJzS2KHg=
X-Received: by 2002:a05:6a00:854:b029:1b7:6233:c5f with SMTP id
 q20-20020a056a000854b02901b762330c5fmr37722pfk.73.1611574500046; Mon, 25 Jan
 2021 03:35:00 -0800 (PST)
MIME-Version: 1.0
References: <20210113182016.166049-1-pobrn@protonmail.com> <20210113182016.166049-10-pobrn@protonmail.com>
 <CAHp75VfJBvG6ma0UxOjb4Wudeqpf9qrE3AtQ+nwwtsGhZ6fRpQ@mail.gmail.com>
 <b99c4482-faea-ff72-4367-8aeca7250040@canonical.com> <CAHp75Ve0hpfX6GPEH+ehCb-FsKomMwKRzkkD7Oup4utXSAidAA@mail.gmail.com>
 <8f9c5892-afad-7066-3a12-1c96c16dba8d@redhat.com>
In-Reply-To: <8f9c5892-afad-7066-3a12-1c96c16dba8d@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 25 Jan 2021 13:35:49 +0200
Message-ID: <CAHp75VdmwxZeqY3qdO6AuK3QTF=p+Wn9qByMsLEzaV4VV78QHQ@mail.gmail.com>
Subject: Re: [PATCH v2 09/24] platform/x86: ideapad-laptop: always propagate
 error codes from device attributes' show() callback
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Ike Panhc <ike.pan@canonical.com>,
        =?UTF-8?B?QmFybmFiw6FzIFDFkWN6ZQ==?= <pobrn@protonmail.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Mark Gross <mgross@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, Jan 25, 2021 at 1:26 PM Hans de Goede <hdegoede@redhat.com> wrote:
> On 1/25/21 11:57 AM, Andy Shevchenko wrote:
> > On Mon, Jan 25, 2021 at 9:37 AM Ike Panhc <ike.pan@canonical.com> wrote=
:
> >>
> >> On 1/17/21 3:49 AM, Andy Shevchenko wrote:
> >>> On Wed, Jan 13, 2021 at 8:23 PM Barnab=C3=A1s P=C5=91cze <pobrn@proto=
nmail.com> wrote:
> >>>>
> >>>> Consumers can differentiate an error from a successful read much mor=
e
> >>>> easily if the read() call fails with the appropriate errno instead o=
f
> >>>> returning a magic string like "-1".
> >>>
> >>> Is user space ready for this (for the record, it seems an ABI breakag=
e)?
> >>>
> >>
> >> read() and getting errno looks sysfs/driver broken to me. I think
> >> if button/method is not available, it's better to be something like
> >> sysfs_emit(buf, "%d\n", -ENODEV)
> >
> > Either way it will be an ABI breakage.
>
> True any change here will be an ABI breakage, but I really do not expect
> anything to be dependent on this weird behavior of returning errors by
> writing some magic value to the buffer, rather then just error-ing out
> of the read() call.
>
> The kernel-convention here clearly is to make the read() syscall fail wit=
h
> -ESOMETHING on errors. So I see this as making the driver conform to the
> expected sysfs API behavior. Since this change is nicely split out into a
> separate patch, we can always revert it if it turns out there actually
> is something depending on this. But again I see that as highly
> unlikely.

Me too. My point is that every stakeholder here understands that.
Perhaps elaborated in the commit message.

--=20
With Best Regards,
Andy Shevchenko
