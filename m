Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3355DC64ED6
	for <platform-driver-x86@archiver.kernel.org>; Wed,  1 Mar 2023 10:29:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229529AbjCAK26 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 1 Mar 2023 05:28:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229607AbjCAK25 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 1 Mar 2023 05:28:57 -0500
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com [IPv6:2607:f8b0:4864:20::f34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CF6129169
        for <platform-driver-x86@vger.kernel.org>; Wed,  1 Mar 2023 02:28:57 -0800 (PST)
Received: by mail-qv1-xf34.google.com with SMTP id f1so8845816qvx.13
        for <platform-driver-x86@vger.kernel.org>; Wed, 01 Mar 2023 02:28:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R2kYASscjADeXFXEceqsKadPHpfjluf0yToztekA298=;
        b=p+X1dtM9OopQ46acy76zUqTlJUltdwp3GCOfY4o7V43T6mVVnJfTbrKoN81FMyTxOm
         C3jakMHM10nkfyztoQOQPrrUwHcpV/mzHdSf/IvXfZI+oqOw7D5c/BHErV11DTlvC0jj
         rweH8baZdIDG+KVvnf/K+8vRyTHkusM17Q8SYqs3oj6tDNtkc2ZvEjdkARVoANYHz3RU
         HxTO2DiAw5I4tzkqfvDBT9NBf8FQELbGo/zXGhAAWdyKWHBf93Zgtul5klYlpBo3vWHP
         xDZEbq7abEzFRs7lMkak87Nm2HZEb+VHf//TnXfw1GYjUVZSD+DW6Rpr5ve4oO3PhrK7
         ej+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R2kYASscjADeXFXEceqsKadPHpfjluf0yToztekA298=;
        b=fhQWHLV1VMW2Hpi194Kg2BOwcF4eJ57Pb1Yz7igoQqut6n33NirNYRYLQWG6h9ilDk
         773ej4hlc4QryrDoUbEO3OsVcS5QcnemI/erzQ41ln2VTPqmwM0BFMikt365pQswdmeJ
         TnFvrE9ABFeaH33a6VGE2WSGj/PfJ84OvVqhQEGUCprBqVufgNiG2tIRxvJQ89XAZk8y
         O13szRg9BhxU5+bwbvutGPEjal+x8LiQngE0EF2vbDQ6MdXH+8JlYdoaEu71cknx4UhT
         zY2pdljZ9JrawodZHzwFV3ChRHXaPUReBfCmLrRbdgDXzfZOAix1IrhFWfH9JQ2ylSgo
         Mowg==
X-Gm-Message-State: AO0yUKXW887vZ9XvzXyOXLTVaSLxhTv9Oes47k9DkT62swjSPWFpZ7y7
        7Y27UfNXtM1nFA6E1R7LV2JYeG9ilvW+mGzVhBi664JHUoZYGw==
X-Google-Smtp-Source: AK7set/oiPEbpBTd/fQdgBW0vRuDmg5ONSELqxOWE4VuyKWTlXHM1G84hX2Yis5eL4ggzeZB2N7EH2pkYw22/ii5TKk=
X-Received: by 2002:ad4:4b74:0:b0:56e:b032:db3a with SMTP id
 m20-20020ad44b74000000b0056eb032db3amr1595668qvx.1.1677666536119; Wed, 01 Mar
 2023 02:28:56 -0800 (PST)
MIME-Version: 1.0
References: <20230301092331.7038-1-hdegoede@redhat.com> <20230301092331.7038-5-hdegoede@redhat.com>
 <CAHp75VeGF7M76qGpkjcZrWFd-yGmBMaxcvbftUtE6wU9ywFMgQ@mail.gmail.com>
 <345ced66-f4ad-58ba-5c55-12e9217e20e3@redhat.com> <CAHp75VcoHwWMfq8PqQiXJbx00dnv-A07w_Z4LymKm641TR2y+g@mail.gmail.com>
In-Reply-To: <CAHp75VcoHwWMfq8PqQiXJbx00dnv-A07w_Z4LymKm641TR2y+g@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 1 Mar 2023 12:28:20 +0200
Message-ID: <CAHp75VeZH47H4h_4Jw0epNc-H2=gZxx=bJHSfm20h_SFxNYLaA@mail.gmail.com>
Subject: Re: [PATCH v2 04/14] platform/x86: x86-android-tablets: Move DMI
 match table into its own dmi.c file
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, Mar 1, 2023 at 12:27=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Wed, Mar 1, 2023 at 12:25=E2=80=AFPM Hans de Goede <hdegoede@redhat.co=
m> wrote:
> > On 3/1/23 11:21, Andy Shevchenko wrote:
>
> ...
>
> > Weird that MODULE_DEVICE_TABLE() is inside module.h though
> > and not actually in mod_devicetable.h as the name of both
> > would suggest.
>
> Yep, but I can speculate that the edge is on user space vs. kernel, as
> the latter is used in the tooling for modules which is user space
> code.

*) latter =3D=3D mod_devicetable.h.

--=20
With Best Regards,
Andy Shevchenko
