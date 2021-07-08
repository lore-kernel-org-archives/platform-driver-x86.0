Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0651C07E96
	for <platform-driver-x86@archiver.kernel.org>; Thu,  8 Jul 2021 17:09:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D2C68616EB
	for <platform-driver-x86@archiver.kernel.org>; Thu,  8 Jul 2021 17:09:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229542AbhGHRM0 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 8 Jul 2021 13:12:26 -0400
Received: from mail-40134.protonmail.ch ([185.70.40.134]:43484 "EHLO
        mail-40134.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229516AbhGHRMZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 8 Jul 2021 13:12:25 -0400
Date:   Thu, 08 Jul 2021 17:09:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1625764182;
        bh=arPLOzNlRREJLD4UUkpIH0y7sTba6niBuX2pPpcDwvA=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=AQvJ+kM6tLzexXs985zCKKHX38wHHxsQQtOcZfz1UbQjgNmjUJuTdvZ3WjezkTR11
         1BKbw5t9g1iB5BzPCnndGdje22KVLvJznOKpwQwWSzusVvvIXccRSu3rIl3xyMXzpT
         n9TxM+NmBt2WC+8bvX/EsWJEFdDph/qLqkjDOql0=
To:     Hans de Goede <hdegoede@redhat.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     "Luke D. Jones" <luke@ljones.dev>, corentin.chary@gmail.com,
        mgross@linux.intel.com, jdelvare@suse.com, linux@roeck-us.net,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH 2/3] asus-wmi: Add dgpu disable method
Message-ID: <QwL-txKgshTDtkHPjQ1gnufO18a6waLR7e2WEVmJbo3T7s3xs6jW6vnbzhtOyyDpQHyDi7q7ObEDWCE_YV8KwrBGHZmsDA6LInznCqeFzj0=@protonmail.com>
In-Reply-To: <e933f74e-50d3-8de9-258a-a4000f3b6403@redhat.com>
References: <20210704222148.880848-1-luke@ljones.dev> <20210704222148.880848-3-luke@ljones.dev> <knw744OJB1AYrrFpo77N1Eei0JZC3SjKzg6SMoMhOsEchAiE8-klOIPTyFCAUSiVeTopPNqgFSefQJ2av6Gs_cS4TuIRXVQcHUxvw8YvSl0=@protonmail.com> <e933f74e-50d3-8de9-258a-a4000f3b6403@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi


2021. j=C3=BAlius 6., kedd 12:17 keltez=C3=A9ssel, Hans de Goede =C3=ADrta:

> [...]
> >> @@ -2699,6 +2792,10 @@ static int asus_wmi_add(struct platform_device =
*pdev)
> >>  =09if (err)
> >>  =09=09goto fail_platform;
> >>
> >> +=09err =3D dgpu_disable_check_present(asus);
> >> +=09if (err)
> >> +=09=09goto fail_dgpu_disable;
> >> +
> >
> > Should this really be considered a "fatal" error?
>
> Well dgpu_disable_check_present() does already contain:
>
> =09=09if (err =3D=3D -ENODEV)
> =09=09=09return 0;
>
> IOW it only returns an error on unexpected errors and asus_wmi_add()
> already contains a couple of other foo_present() checks which are
> dealt with in the same way, so this is consistent with that and
> being consistent is good, so I think this is fine.
>

Indeed, that's right, I missed that. I am still unsure whether any error
should cause it to fail to load. But I guess if there is precedent for that
in the module, then consistency is probably better.


Regards,
Barnab=C3=A1s P=C5=91cze
