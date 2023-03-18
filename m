Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCAABC61DA4
	for <platform-driver-x86@archiver.kernel.org>; Sat, 18 Mar 2023 14:37:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229542AbjCROh2 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 18 Mar 2023 10:37:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229517AbjCROh1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 18 Mar 2023 10:37:27 -0400
Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com [188.165.51.139])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AB3D1F938
        for <platform-driver-x86@vger.kernel.org>; Sat, 18 Mar 2023 07:37:26 -0700 (PDT)
Date:   Sat, 18 Mar 2023 14:37:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail3; t=1679150242; x=1679409442;
        bh=pINcp76Nhmt3fNctQMwpHDQS0fabunWBlVh/4yQi/+g=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID:BIMI-Selector;
        b=CCSaAeI4Z4uRLINW0tqaCih8s7U2BBrCNDnHIL2TxXGlElIKzuVPBVq2EdMN7aE0R
         dOFob5OFTavmlrefdsk7g7hNOGLfkL+Wico6Td9Uh04cZNNpeYsl6nObeEC9j4gHCm
         xpWNukA1kn8iu14AxnW8Wo2jvrru1yXwkGqNgp39ANXezCof0DDIbAPguxpk8OhOv7
         uFRu2Zo0u6lmd036p0aemokCT08G45zv/pG59giXYBYDGMxS1XwtLhyU1U9kWevUcw
         XJcFrc2ha83kQok6t/d/FXJlsUFLCeQtuju6lNo+8Wf7+egxAOaaxuCOEFOQ3W9Jlg
         6gnZ7j9s6JqoA==
To:     Mark Pearson <mpearson-lenovo@squebb.ca>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     hdegoede@redhat.com, markgross@kernel.org, markpearson@lenovo.com,
        platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v3 3/3] platform/x86: think-lmi: use correct possible_values delimters
Message-ID: <NJCYtxr0cVaE6xV-cHfKygPgRYvPzrouaGcTSI-Is-n6pzo8AQl6kek2MkDEQBB6hJcwC9Z7zfqq5NapyIHTHgllYcwMYebQ6D-CCOKG0FQ=@protonmail.com>
In-Reply-To: <20230317154635.39692-3-mpearson-lenovo@squebb.ca>
References: <mpearson-lenovo@squebb.ca> <20230317154635.39692-1-mpearson-lenovo@squebb.ca> <20230317154635.39692-3-mpearson-lenovo@squebb.ca>
Feedback-ID: 20568564:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi


2023. m=C3=A1rcius 17., p=C3=A9ntek 16:46 keltez=C3=A9ssel, Mark Pearson <m=
pearson-lenovo@squebb.ca> =C3=ADrta:

> firmware-attributes class requires that possible values are delimited
> using ';' but the Lenovo firmware uses ',' instead.
> Parse string and replace where appropriate
>=20
> Thanks to Thomas W for pointing this out.
>=20
> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> ---
> [...]
> +=09=09/*
> +=09=09 * firmware-attributes requires that possible_values are separated=
 by ';' but
> +=09=09 * Lenovo FW uses ','. Replace appropriately.
> +=09=09 */
> +=09=09if (setting->possible_values) {
> +=09=09=09char *tmp =3D setting->possible_values;
> +
> +=09=09=09while ((tmp =3D strchr(tmp, ',')) !=3D NULL)
> +=09=09=09=09*tmp++ =3D ';';
> +=09=09}

Please see `strreplace()` from `linux/string.h`.


> +
>  =09=09kobject_init(&setting->kobj, &tlmi_attr_setting_ktype);
>  =09=09tlmi_priv.setting[i] =3D setting;
>  =09=09kfree(item);
> --
> 2.39.2


Regards,
Barnab=C3=A1s P=C5=91cze
