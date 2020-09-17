Return-Path: <SRS0=nDDs=C2=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0294C2BBD1
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Sep 2020 14:10:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6D100206CA
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Sep 2020 14:10:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dAO22dJw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727120AbgIQOKo (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 17 Sep 2020 10:10:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24277 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727168AbgIQN7P (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 17 Sep 2020 09:59:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1600351153;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ljeMbxHR1OQ5pb5grviu2ypJAdwB9ZtvjAbeiN+J9l8=;
        b=dAO22dJwC1yDM817U7rx3MGkpk4HcesVBmT61fNreaPkAy2RAG326r0P/7arnD2m0i0jll
        Fe19julHJskVuG6BTdwY5MNDzc6PkyNp8lvuGSR1EKSC4maPdxsE+Ker0YwEm7wXQgUZv4
        c59x9Gb9x0/oiaQUAvAAq9BYeF7t3Wo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-341-RSwCEjFXNe-1FrJ-ZE9ziw-1; Thu, 17 Sep 2020 09:59:11 -0400
X-MC-Unique: RSwCEjFXNe-1FrJ-ZE9ziw-1
Received: by mail-wr1-f72.google.com with SMTP id l9so907553wrq.20
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Sep 2020 06:59:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=ljeMbxHR1OQ5pb5grviu2ypJAdwB9ZtvjAbeiN+J9l8=;
        b=LEfl9FKM7vlFt7oztcvh71babfHDcqv9nRoaLECA9IN9jt4+dHqyxdcVBu45t+2nPZ
         JcuXt4Eb6FCmqMncxJ1IxUFkpdxKrSa0+Stj4Lj6LpngDnEZYhwYMcjGVe891g+pS5Tt
         vZPgn0kCTbc1KXqwf5gp1BklunCxd3arLCZZExZf5wgkbTNJKh09WE0s4FtnbBQFzOos
         4KGGFSgiaTbutjRUqm6iKqbmiOCbTwNn67ScKIZWmHJEsiKs2dkqEqkp3ISZNffyjhwX
         E+N5VYAzlpYrIVzET/s23kyceYgnZ0Ine/Upb2i/T2nfbOLKO6R3MvWYohqCEKlkg/Gi
         RKSA==
X-Gm-Message-State: AOAM530x2/wUkbsP5IoE/Ny+VP9Ly+42LNv7YMKbg2vov+g1kaXUhA6E
        fBGCiVXnosdYjPGU3KIUKpeehvsyx7iAe/6fyGk8W/7WKFF7ht3HV7cjYu9lhb+4HMjISMscbI5
        F5lisJpI5IAsguILajW++RbbLJ1Up9Raoqg==
X-Received: by 2002:adf:efc9:: with SMTP id i9mr33819784wrp.187.1600351150453;
        Thu, 17 Sep 2020 06:59:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwrs1spi5ix3pcv6tQFbBXLakMW+R5LSYbzlOP+s1fNKliLasqyT5dmdxiTQvguIJjzUUcQuA==
X-Received: by 2002:adf:efc9:: with SMTP id i9mr33819764wrp.187.1600351150288;
        Thu, 17 Sep 2020 06:59:10 -0700 (PDT)
Received: from dhcp-64-164.muc.redhat.com (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id d124sm10830771wmd.47.2020.09.17.06.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 06:59:09 -0700 (PDT)
Message-ID: <0470605070bdce679e91aaa1523fe0cb94becc49.camel@redhat.com>
Subject: Re: RFC: offering a standardized (/sys/class) userspace API for
 selecting system/laptop performance-profiles
From:   Benjamin Berg <bberg@redhat.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        =?UTF-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     Elia Devito <eliadevito@gmail.com>,
        Mark Pearson <mpearson@lenovo.com>,
        Bastien Nocera <hadess@hadess.net>,
        Jared Dominguez <jaredz@redhat.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date:   Thu, 17 Sep 2020 15:59:07 +0200
In-Reply-To: <3748b6be-cd8b-19e6-eb36-c5f94850d764@redhat.com>
References: <bbe4ebef-0845-2719-ac9a-fbc9c7bcd7be@redhat.com>
         <jQoirRukXGYClb58QQWmL6rQ6usxi_hKzPRYe2tlEyjXG-hEVxwzECgEXFxzyMRG2sEnxwdKNvmWzEV4oZcaJ4MM5RrgFtBdin8yxH4cAYs=@protonmail.com>
         <3748b6be-cd8b-19e6-eb36-c5f94850d764@redhat.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-+acQYerGPgViQIa/Az6x"
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32) 
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org


--=-+acQYerGPgViQIa/Az6x
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2020-09-17 at 15:24 +0200, Hans de Goede wrote:
> > Excuse my ignorance, but why does "lap_mode" need to be here?
> > I understand the implications of it regarding performance, but
> > I think it would be more sense to export it via the hwmon (or
> > something similar) subsystem? What am I missing?
>=20
> Well hwmon has very clearly defined sensor types, like voltage,
> fan-speed and temperature. lap_mode does not match any of them.

Not sure. I think you can consider it a simple sensor. In this case it
just affects thermal limits that are imposed on the system (and some
other stuff like RF for modems).

It does have a major impact on something like a "performance" mode
because of those imposed limits and causes these modes to be degraded.
But I think this interface can just show the configured state, even if
the component knows that the performance state is severely limited due
to other factors.

Benjamin

> Also registering another-type class device just for the lap_mode
> boolean seems overkill, esp. since lap_mode is inherently coupled
> to the performance-profile stuff.
>=20
> Regards,
>=20
> Hans
>=20

--=-+acQYerGPgViQIa/Az6x
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEED2NO4vMS33W8E4AFq6ZWhpmFY3AFAl9ja6sACgkQq6ZWhpmF
Y3AOhQ/+MnWZiC6W3rATMMdt1Rp1QQSq+0BdUWI9ek42hkZgTMHpl+zaK7PMh0zK
h5cV5glFc6ED7yzxacvEXHnZFKBrXPUhxVs1dDkY0tcaCk7wM6cSoOoHcbaBKoN8
cq1Kyp2LK7KPSG+pgkZGSXNnNjhbSHzZtdbKpKP+ZbfGoZwfIoxUSL81TUmHmR8o
0UPbkT8xVEsTQbztN+Sft3qKogCLMxRQBPg3VrNOfp8RKYbEEgml6Ws0jPtsYCDz
gOM0vzDH1W699sPspNUWW9rbyf8qWKi4pZAAP2+Rrni2WMg1JoRNo7dK37rTfxlU
WptoMXjTZ7no3aPhAjNFXusjlWNig0sJ5iu2UuM6JQ+FOSsrpSL2ShIBZH6J9Uf9
UI2TXBI7tgTNGUGMtJYIyfh8iO8R7zZ/FbQDIVZR0Nzy/sNA0eQIITMUU38XfECy
FT77ODrvfy43Ws48vCJnQuKChBsUCcLtvKa1/k6nGdrrVhAcurDuLqP0Q/hD3Hro
aAGEoa+yr/ciPxW6O3udRl/pEXK4nqp0xEKFK/Wk+0PHii5PabU2GwBZCsmAKKQy
7izvczRpTZC3UWQ8lRK3YZ0LBxV3hZDnLVM/fBCgLqqlFJf2k/bDKYNSkShKMMPO
K79KsYAF0VX2QXUogAYa/qlKhIiGrPU3ThLBIZMIEABrYjtc3n0=
=jY1E
-----END PGP SIGNATURE-----

--=-+acQYerGPgViQIa/Az6x--

