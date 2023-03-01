Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1422FC64EC7
	for <platform-driver-x86@archiver.kernel.org>; Wed,  1 Mar 2023 10:26:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229510AbjCAK0b (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 1 Mar 2023 05:26:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbjCAK0a (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 1 Mar 2023 05:26:30 -0500
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com [IPv6:2607:f8b0:4864:20::f2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E980029170
        for <platform-driver-x86@vger.kernel.org>; Wed,  1 Mar 2023 02:26:29 -0800 (PST)
Received: by mail-qv1-xf2c.google.com with SMTP id op8so8854283qvb.11
        for <platform-driver-x86@vger.kernel.org>; Wed, 01 Mar 2023 02:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=73/NmNdrfFafVRk9U+ZyPT1u6foBoqrkeUiAvdFE1IM=;
        b=V3NDxMpLLDpD494vPe8RwJsDQXLqOg6hgwa/1+4/CwjGLTjgGf8cUrbs9pSntMN3WD
         Y/kca1w1pmcwytevHmKFFDl4BEPm+JEtT+41gsZbIou2iapoOlmACDe6YyN47XIYuxTK
         Ay/9iTiAbGq5QXofLGEHcVT2k9KPZ7gyqj6gWNiDNO20XjKhYX/PHXZPcgbcU0zmRikK
         G44MVu5feO/wFU6+vpV84iJ4w9qRUddHebF7NkNiQ2vd37xYYABY4tLdCcjCQaEbN/Hn
         8lsA2n/BjpO0+AcysbPARmO3OLIQ5fAXjrw8DIA7oPjJVtuRjRYCRSSLMR6ibqrYvd3o
         vKGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=73/NmNdrfFafVRk9U+ZyPT1u6foBoqrkeUiAvdFE1IM=;
        b=DJAidohrL7+XDR5XnD6xi4uIYS9OBTc25pT5+UTXz9Isvy2fG7z+mzUhqOKV54NZZT
         d70KvRNSm6+FkVX1B1uc36kgOLsbrtBJBvcM4qsSRHvnA7CHbxmUq65px3zz0ciMj7aO
         d1f7mBhylFOPFlyV5eSYVpcbh4ZJHWfQ9TXiqr2OiTknQXQKivMiM1Kd+iBxN39BGc/k
         r7vwjmnLJFofkz/SCMQLr/T4FKtdQ/sOHeuadd+5aaDIl8F0HI5YrHn7pY5pKDZzT5+D
         MbjaTw/L0Sg3zzCoRxgcwR+5xcwwvmAXrdvN1+P4fepePutZO9yJnVjNoLddI7zjCpds
         Jx2w==
X-Gm-Message-State: AO0yUKXKlWXd++QE4ciurA+sMOUNjpeRqHVODWbiZfRcahaLRy+UcMCu
        Xo+t3ws0LseUs/WZhKSaniDqJ/y9lqzzmsA5j5c=
X-Google-Smtp-Source: AK7set+jRM8FOWCc/8sCCWg1yPm1KfGFPDLOvPAQxyoXmcVT1cKnde0gKjioq4GZUDUh5LcoEJW9fhc5IXadYfYYPAU=
X-Received: by 2002:ad4:4b74:0:b0:56e:b032:db3a with SMTP id
 m20-20020ad44b74000000b0056eb032db3amr1594381qvx.1.1677666388905; Wed, 01 Mar
 2023 02:26:28 -0800 (PST)
MIME-Version: 1.0
References: <20230301092331.7038-1-hdegoede@redhat.com> <20230301092331.7038-4-hdegoede@redhat.com>
 <CAHp75Ve0Mc+ZkSQsqZfgWJuFTaAeB2Y9dw0BdSrojFy+_t6C2g@mail.gmail.com> <277eb943-9099-51b0-cc89-ed6208d3d5cb@redhat.com>
In-Reply-To: <277eb943-9099-51b0-cc89-ed6208d3d5cb@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 1 Mar 2023 12:25:52 +0200
Message-ID: <CAHp75VePzTs=cQOSZtuEFuJ4jRe+LGwE0_maw2XuNXXW2JJP+Q@mail.gmail.com>
Subject: Re: [PATCH v2 03/14] platform/x86: x86-android-tablets: Move core
 code into new core.c file
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, Mar 1, 2023 at 12:23=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
> On 3/1/23 11:17, Andy Shevchenko wrote:
> > On Wed, Mar 1, 2023 at 11:23=E2=80=AFAM Hans de Goede <hdegoede@redhat.=
com> wrote:
> >>
> >> Move the helpers to get irqs + gpios as well as the core code for
> >
> > IRQs
> > GPIOs
>
> Ack I'll amend the commit msg.
>
> >
> >> instantiating all the devices missing from ACPI into a new core.c file=
.
> >
> > ...
> >
> >> +       for (i =3D 0; gpiod_lookup_tables && gpiod_lookup_tables[i]; i=
++)
> >> +               gpiod_remove_lookup_table(gpiod_lookup_tables[i]);
> >
> > Do we have an API to remove a bunch of tables at once?
> >
> > ...
> >
> >> +       gpiod_lookup_tables =3D dev_info->gpiod_lookup_tables;
> >> +       for (i =3D 0; gpiod_lookup_tables && gpiod_lookup_tables[i]; i=
++)
> >> +               gpiod_add_lookup_table(gpiod_lookup_tables[i]);
> >
> > This seems like open coded gpiod_add_lookup_tables().
>
> This is just moving code, not refactoring it. The intend is very much
> to NOT make any code changes here.

OK!

Then it might be a new patch in the future :-)

--=20
With Best Regards,
Andy Shevchenko
