Return-Path: <SRS0=VZIW=DB=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA0EFC4363D
	for <platform-driver-x86@archiver.kernel.org>; Thu, 24 Sep 2020 11:48:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6362F238A1
	for <platform-driver-x86@archiver.kernel.org>; Thu, 24 Sep 2020 11:48:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WWaCb9a0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727449AbgIXLso (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 24 Sep 2020 07:48:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60231 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727443AbgIXLsl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 24 Sep 2020 07:48:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1600948119;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=AB8JpAKbi2D36BPKPZyn0W43idPr3Duum7qG/S0J+/s=;
        b=WWaCb9a03mTb/T9MEnWeYMvZpq5xbTHgDOb+vvY+lf8W4iwWl42WCk1ogUf6vH2cJuwtF5
        FzFb7tBXKT2WaeEveefg+gi046jFYnK67uqeGXFurNmbjvCC1GSsh7mfRb7WQFtVGa/EWv
        rSTTTdHq/JH8dUSoSig5//7S1CuWHgI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-224-i31oZdZUPRCpucYfIYQgJw-1; Thu, 24 Sep 2020 07:48:35 -0400
X-MC-Unique: i31oZdZUPRCpucYfIYQgJw-1
Received: by mail-wr1-f69.google.com with SMTP id l17so1120794wrw.11
        for <platform-driver-x86@vger.kernel.org>; Thu, 24 Sep 2020 04:48:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=AB8JpAKbi2D36BPKPZyn0W43idPr3Duum7qG/S0J+/s=;
        b=fGb2XW0ro5xdoIO9MZ2/lre90DaRvZ/Tsb65xYcILCPR2tn+ftfVbfix/QlBUpHN7Z
         IU3tTTPFH+vJ3Ar1fqx0177MYh2dVAgZKo9IP945UnZtR3UYT4R7P8CMRBKWPKlNsBwT
         0Mhn89odWuUbaPX11yBjBT/GUwAEwUJe8DKxhKsGKMGrR/N77WC4HOm+SegYf29sPcWV
         FzgA4UJx7ha+YNLld3Z6fjLZdCsqnSgNOXr+fwIPxKBUkVb4MRd+CEFHuL8Q84LpJ4OU
         sHThL9NNpRyKXqja5Vn5Ms1LGMpfofFA7QHe6lPNk1muft4BshyUEGsVNMdJGdrX36Ue
         cA4g==
X-Gm-Message-State: AOAM531UYkRnxa+qVdIkGbVb+pNOlIJVfemNaCEA7gb/gZjaepi8E8NJ
        DnXoLP8ZYpfSPuJP/5yh6nDwyXtz/3bJj0PJSkSuHj10+LyQVPRQ8tkwWe0/HOtz6CPy4/HE0LB
        lpUBBgt+CnIxLROHl6r+6aSMBoMYjIFyQCg==
X-Received: by 2002:a1c:6445:: with SMTP id y66mr4590765wmb.12.1600948112967;
        Thu, 24 Sep 2020 04:48:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJziKgh6lMEG4a8fLk6nevD4+cDsCn9TTKIOkh1Z+yTPj0cgo6pLbn1PA+7GG7v8j4jRuFIXWQ==
X-Received: by 2002:a1c:6445:: with SMTP id y66mr4590735wmb.12.1600948112636;
        Thu, 24 Sep 2020 04:48:32 -0700 (PDT)
Received: from dhcp-64-164.muc.redhat.com (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id i14sm3453876wro.96.2020.09.24.04.48.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2020 04:48:31 -0700 (PDT)
Message-ID: <7bf7c4bca376fda533eb142614bbcd9bc190bbe7.camel@redhat.com>
Subject: Re: [External] Re: RFC: offering a standardized (/sys/class)
 userspace API for selecting system/laptop performance-profiles
From:   Benjamin Berg <bberg@redhat.com>
To:     Elia Devito <eliadevito@gmail.com>,
        Mark Pearson <markpearson@lenovo.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Bastien Nocera <hadess@hadess.net>,
        Mark Pearson <mpearson@lenovo.com>
Cc:     Jared Dominguez <jaredz@redhat.com>,
        platform-driver-x86@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date:   Thu, 24 Sep 2020 13:48:27 +0200
In-Reply-To: <9766663.nUPlyArG6x@pce>
References: <bbe4ebef-0845-2719-ac9a-fbc9c7bcd7be@redhat.com>
         <3ed9ac0a-2e24-7d3a-f264-c3bb03b846d9@lenovo.com>
         <261328975238951d0412727220a1b7d915cebb99.camel@redhat.com>
         <9766663.nUPlyArG6x@pce>
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-oBenbtGnl1dPgy5OR6yS"
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32) 
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org


--=-oBenbtGnl1dPgy5OR6yS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2020-09-21 at 11:03 +0200, Elia Devito wrote:
> [SNIP]
>=20
> For gaming purpose when the CPU and GPU share the thermal budget, in this=
 case=20
> the best solution is to set thermal profile to performance to maximize th=
e heat=20
> dissipation and the p-state profile to powersave, in this way during load=
ings=20
> the cpu gain a performance boost that allow to reduce loading time, inste=
ad,=20
> during gameplay the cpu performance will be limited in favor of the GPU=
=20
> allowing the maximum framerate to be reached.
> (feral had to handle it for its gamemode tool:=20
> https://github.com/FeralInteractive/gamemode/pull/179)

So I think that trying to put the CPU into a power-efficient state does
make sense. But, it is also a more generic issue.

It reminds me of the LPC talk
  "Improving CPU energy efficiency during i/o bottlenecks"
  https://youtu.be/hJa3YMgEu3M?t=3D8852
The point is, that what we really want here is to run in the most power
efficient state that gets the job done reliably[1]. It doesn't matter
which exact state it is, all that matters is that applications are
happy with regard to the latencies they see.

In other words, I think the problem here really is power-optimizing
long running tasks that wake up regularly but don't need that much CPU
time overall.

> Another opposed particular case could be thermal profile set to quiet and
> p-state set to performance, usefull for example to maximizze cpu performa=
nce=20
> in silent ambient room like a library, obviously for CPU-only intesive ta=
sks=20
> the best solution is to set either thermal and performance profile to=20
> performance.

Yeah, I have been wondering about that. If you need to meet a certain
power budget (due to thermal limits), then you want to first increase
the power efficiency before doing idle injection (i.e. intel_pstate vs.
intel_powerclamp). But, it seems to me that RAPL already achieves the
best possible behaviour without any need for further interaction. So
setting "performance" in the library should result in a high peak
performance if you have a "bursty" load while also giving optimal
results for long running tasks.

Benjamin

[1] Of course, there are more complexities as to which job is actually
relevant. It would for example make sense to inhibit/slow down
background tasks to prevent them from cutting into the power budget of
the running game. It isn't an easy problem, but should be solvable
using cgroups.

> Basically there are infinite combinations that can be made to obtain the =
best=20
> configuration for each situation, to allow this a common interface should=
 offer
> a possibility to:
>=20
> - Define the list of thermal profiles separately from the performance one=
s
> - Eventually define a list of on/off attributes (useful for lenovo lap_mo=
de?)
> - Provide a description of them
> - Switching between thermal profiles regardless of the performance profil=
e
>=20
> A possible solution could be a "slider like" interface for performance le=
vel
> and a list of thermal profile.
>=20
> On Thu, 2020-09-17 at 13:22 +0200, Hans de Goede wrote:
> > Elia, Mark, I assume that both of you want to get your patches for this
> > upstream sooner, rather then later. But I think we should put them on
> > hold until we have an agreement on a shared userspace API for this.
> >=20
>=20
> I could maybe update the patch to expose the interface via debugfs like M=
ark
> wants to do with lenovo driver and make update later when a common interf=
ace
> will be fully defined.
>=20
> I would prefer the patch to be merged (at lest the init function) because=
 it
> fix the thermald behaviour whit default thermal profile on fresh boot.
>=20
> In the next days I will update the patch and send it in other thread to=
=20
> discuss and evaluate a merge in two steps
>=20
> Best Regards
> Elia
>=20
>=20
>=20

--=-oBenbtGnl1dPgy5OR6yS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEED2NO4vMS33W8E4AFq6ZWhpmFY3AFAl9sh4sACgkQq6ZWhpmF
Y3BmCA//ZHIV85AI+H6SMNZML82yLRLMincAG/U+VRjvVXbeVho6qJXUIc8pxb41
bAXKMvQNKw0Jhev9R+n9c+AgB1sDCkG4uGJSVibo5psnFAggeSvHHXJqmRC4E9am
mwCXKSTr95cwZiLHlqTB+1BdoTHy0ddHRcol04LpoJTetrsGqwAcE16qWtjBqDHI
ZjReIKa5i3bkl1uNc19+iku8rBPmR6fuYOUjLIFlkI/0s1VTS60rH1FtV+HScaVO
hNDrXxCgxfFMALVTx5oqF9EbKPAiWAL7QOXUg/wr7kgeC23w8HhdxqeVU4H+E2OY
U9xlxLbOYBXQmPUW3AKrhPhCHzGOBG2bnBnYP2RldnbeTz5rqeR3vhCCAgaocqOk
KpSa+JniMdAoYlMentEht3iu92Sn4Nbmzr0lLVqQvaNUNBKMGU4RyOeFVRt/xR93
rQTMBU91kv2Ubp9xqLQomNdE9FcgELpw5x8hWFk0Xq5zIGF5XBNc1XVIuD5FVunh
ZqNqx+dq1MkUB81TkNgq412aqoN7xEiqpa0TN0lkOe+XExhU/I2wn/SbGGMzHvor
KSkJI/t7hDXDKfeMLajDxF2UgofupeOMji+HWel63QIfyd7/GSZkMONgSCYFwkOU
4/r6ws6dPsVgOECQQ+7QIHjc0Gc0blO2Qv/5MofP7LEGhYP/15s=
=zST/
-----END PGP SIGNATURE-----

--=-oBenbtGnl1dPgy5OR6yS--

