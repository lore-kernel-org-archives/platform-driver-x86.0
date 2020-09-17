Return-Path: <SRS0=nDDs=C2=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22917C43461
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Sep 2020 13:53:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BD68721734
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Sep 2020 13:53:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="acV8olg/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727108AbgIQNxj (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 17 Sep 2020 09:53:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53185 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726843AbgIQNus (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 17 Sep 2020 09:50:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1600350618;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Och7vbzH8fgh9G7ABSzr3yG4aKCg/RiGZcndYd97UZM=;
        b=acV8olg/P6CDGj7zMy/1KR2+iLZos46xfGbDtSlNyOME5WBy7YaQl3B+iSbK8FH8tnL3X0
        9caEa1J6EQcPqCHZ8sBoi4RasgaNWwljNpuL7p72fvh/s8tDz4eV19Kl3BPCmHn55K3Qt7
        MmV9KZ3SALndkv41shXltbJKcU/TeOs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-592-yrHoydwTPA2CQmILNCmWEg-1; Thu, 17 Sep 2020 09:50:15 -0400
X-MC-Unique: yrHoydwTPA2CQmILNCmWEg-1
Received: by mail-wm1-f70.google.com with SMTP id x81so770491wmg.8
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Sep 2020 06:50:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=Och7vbzH8fgh9G7ABSzr3yG4aKCg/RiGZcndYd97UZM=;
        b=ma1bb5IhJ1pWoAu2z6hiKR4Bc8EzWw1VphGQphkoWzsE/YzpzrQgqqCPXnFghN4Kk+
         /GsT9JtZOW3sT1WBOnBKd8pENk7cyIaLOPWiPDgZH1fivz+ygP+GY0kw2+jAOqh8jc3p
         pwaKfvhyVvlmZvGCaFozuGniTQpbwI4VB8rv60tydygTVjY0QHBHy8w3YomqMxKIh/4B
         iQXc07Hc7OiO9xU3NT6ScV9GrVGfK+8yWcYBJ1mNMIxoqcgOIZEVrQ0vMuF5PNtgOOaW
         C8xWNfDchQdj8VeaulW0a6hXWMpLuujaLlQfx9fjiC9AezauPSKVtENdQafL0/z+MaY4
         zXig==
X-Gm-Message-State: AOAM532aUSxSVGihMFVCQa2JwfaqPcxW0rYc4rVFGuajmZ+J4mov/Eug
        KK8meTePiSPmiI6EXJTWb+DbmGp6lPZAOT4nlFejK7jn+X/IWD/F0eUaiyEQIL1pEEnALmcFqj4
        lklGNd82ncqT3nuogGt6kdQfpsjKoyDvZVg==
X-Received: by 2002:adf:e9c1:: with SMTP id l1mr32516897wrn.68.1600350614435;
        Thu, 17 Sep 2020 06:50:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzvcVvRxuCSD0OzPqoSFymwai56HtOMPkDIVM9nNGHMmTaAx4vEmX/pYsfIq2AeKjdQbhusfA==
X-Received: by 2002:adf:e9c1:: with SMTP id l1mr32516872wrn.68.1600350614244;
        Thu, 17 Sep 2020 06:50:14 -0700 (PDT)
Received: from dhcp-64-164.muc.redhat.com (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id c14sm31670187wrm.64.2020.09.17.06.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 06:50:13 -0700 (PDT)
Message-ID: <9f01ce60a6b3319855f6a26b94af3e5fc6d2595e.camel@redhat.com>
Subject: Re: RFC: offering a standardized (/sys/class) userspace API for
 selecting system/laptop performance-profiles
From:   Benjamin Berg <bberg@redhat.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Bastien Nocera <hadess@hadess.net>,
        Elia Devito <eliadevito@gmail.com>,
        Mark Pearson <mpearson@lenovo.com>
Cc:     Jared Dominguez <jaredz@redhat.com>,
        platform-driver-x86@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date:   Thu, 17 Sep 2020 15:50:11 +0200
In-Reply-To: <b6332a4a-7606-2bd0-632b-f67b68d3dd1b@redhat.com>
References: <bbe4ebef-0845-2719-ac9a-fbc9c7bcd7be@redhat.com>
         <21b6dffbbc6dbb14ebef3f078cc2497f9a872f57.camel@hadess.net>
         <b6332a4a-7606-2bd0-632b-f67b68d3dd1b@redhat.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-Xz6VRGR8RFnamGnLmQHz"
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32) 
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org


--=-Xz6VRGR8RFnamGnLmQHz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2020-09-17 at 14:51 +0200, Hans de Goede wrote:
> > Compared to the WIP lenovo-dytc "perfmode" driver, we're missing
> > something to advertise the unavailability of a profile, and the reason
> > for that unavailability.
>=20
> UGh, do we really need to export this though. We have the lap_mode thing
> already; and that is something which we will need for other reasons in
> the future too. Any UI for selecting performance modes can display a
> warning when lap_mode is true saying that: "The laptop has detected that =
it
> is sitting on someone's lap and that performance may be limited
> because of this." (feel free to improve the text).

Well, for dytc_perfmode there are actually always the three states
L/M/H. It just happens that the kernel will write "H*" (was "M*" until
yesterday) when the performance mode is degraded due to lap detection.

Think of dytc_perfmode as a profile that sets a number of things:
 * Thermal Limits
 * Fan Behaviour
 * possibly more

While dytc_lapmode will only enforce a change to the thermal limit.

So "performance" (H) is technically a valid mode even when the lap is
detected.

> I guess we could split the "value" attribute from my reply to Benjamin's
> email into "configured_value" (rw) and "actual_value" (rw) attributes.
> If we have the info we might as well export it I guess,.

I consider the "*" purely a curtsey to users that read the attribute
directly using e.g. cat to help with the interpretation. It probably is
not interesting to userspace applications/daemons.

Benjamin

--=-Xz6VRGR8RFnamGnLmQHz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEED2NO4vMS33W8E4AFq6ZWhpmFY3AFAl9jaZMACgkQq6ZWhpmF
Y3D97xAAzoHJvcglMkT4XgfWOQxpi9MkPVLxSzIAHjtMrTnIY85Gko5gU4EZLtHA
3/ydAECnFoKhV0FUlKjgAtTsg64aTqjWJrl7h8S9BLZSUgsaCfLPqit0IUAP4y5l
kP4cOGhL3oMWW8KU4eBYXEdlb2+KL4A5QA4VG/Bagp2L0q1Kf2OWN5hY7k7lW5Uz
UzHJhz/HLZxlpBR65nthhWWC+T5J6ZTy5Le264/UpdvJzprudvT5TYyQqD0Wj40S
syzytyJEqtnACocwxQbOmOmxBB1wp8EbKfvRPgIdF4kRWpTuj3pVO0ASelQnJxT1
cchqBwP0a+rBX8CqTwJJHEr+627CiEV5hc9tFrDqmaNdgWxLpyPVTa/7nqH17umw
lPm+BSYgHzphE8aL4XkSXebQxMBO2TVdMEM5oGPbXlWaHM3HjBDMqfOQhwiEm9dP
cpBrSiEqEFW/x9msoAA1+SEUgPTEfxlDUr4IrxtHGz3SMuRr6zQhVaeuFJRYuIXj
yhZ15NZrMuGAm1sK5/5QsWl2TgMIrhzV4jARcNZaWPDPRz0oZNm1izvFt+k3SBUm
bDba+CfNSkHSSyx6e3+nzj12KvB+YGglPzcUKQnd6Hf8oQYvBXIvuo/42i6+o9nu
Lob0m+pyCix5lJWDWS/GvZAjeRdTR9nnTBSNg5fY1S9pBE6Q55o=
=/xU6
-----END PGP SIGNATURE-----

--=-Xz6VRGR8RFnamGnLmQHz--

