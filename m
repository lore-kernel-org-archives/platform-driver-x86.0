Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52422EB64D7
	for <platform-driver-x86@archiver.kernel.org>; Wed, 21 Jun 2023 21:29:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229564AbjFUV3i (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 21 Jun 2023 17:29:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229680AbjFUV3h (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 21 Jun 2023 17:29:37 -0400
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch [185.70.40.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60AD11BC;
        Wed, 21 Jun 2023 14:29:36 -0700 (PDT)
Date:   Wed, 21 Jun 2023 21:29:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail3; t=1687382974; x=1687642174;
        bh=d4/p/34ZRL0B4kHlNuD6nT1/glyHyKCZyn6h9RoTdyM=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID:BIMI-Selector;
        b=TFQPfdiTQ9tw//SNJgyKYCdL9IABZDSubp6ZLkMV2l3NoRWG6BSEuctdkkfivzSRu
         xN8eMESwInDSUAcxxrLYpzM2Smf0O/KVibOydGsl2P9LjfN3tCxfndb0QU7fs3l9oZ
         AbWgDvbwOoxiwhG6FaAnABJ45sL915+9k4VHnWpiyS9d9lNdQPWKh3wL89vpslNxsh
         NLVmuc3Vykc17r52Dfph/Y6AGDZA8YRbjIiJSkh99QGaWP6QDoxHUD+7K5uyunPLw6
         hm+IKBqWyIGDyN55CdpR4FGIi8YjpRK55SOJF55/hGlvHC3S7gBpmw9qBLEusJAjIt
         DEFSnNsBkZqYA==
To:     Armin Wolf <W_Armin@gmx.de>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mark Gross <markgross@kernel.org>
Subject: Re: [PATCH v1 1/2] platform/x86: wmi: Break possible infinite loop when parsing GUID
Message-ID: <TnTqU2wwXh3DG07kYUwMAe0hdBiaKiuoMOqBCBIttT27lXdw-KZVV8fZ7x-Zrg_Ux8mJUHClgyFHRbDoCRmhaOI7GwOPhUPYBRLzThV8iYI=@protonmail.com>
In-Reply-To: <25715979-8148-8d1d-fd67-a973661f9781@gmx.de>
References: <20230621151155.78279-1-andriy.shevchenko@linux.intel.com> <25715979-8148-8d1d-fd67-a973661f9781@gmx.de>
Feedback-ID: 20568564:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi


2023. j=C3=BAnius 21., szerda 23:20 keltez=C3=A9ssel, Armin Wolf <W_Armin@g=
mx.de> =C3=ADrta:

> [...]
> > @@ -895,11 +901,7 @@ static int wmi_dev_match(struct device *dev, struc=
t device_driver *driver)
> >   =09=09return 0;
> >
> >   =09while (*id->guid_string) {
> > -=09=09guid_t driver_guid;
> > -
> > -=09=09if (WARN_ON(guid_parse(id->guid_string, &driver_guid)))
>=20
> Hi,
>=20
> just an idea: how about printing an error/debug message in case of an mal=
formed GUID?
> This could be useful when searching for typos in GUIDs used by WMI driver=
s.
> [...]

Wouldn't it be better to change `__wmi_driver_register()` to check that?


Regards,
Barnab=C3=A1s P=C5=91cze
