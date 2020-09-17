Return-Path: <SRS0=nDDs=C2=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E10F8C2BBD1
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Sep 2020 14:22:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7F62520838
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Sep 2020 14:22:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Axpa7k9v"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727381AbgIQOLi (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 17 Sep 2020 10:11:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51227 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727352AbgIQOLW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 17 Sep 2020 10:11:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1600351857;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=dF75HMvcCCwBIMjZhM0MqmBdo7iicvPzKUPWjV2yvk8=;
        b=Axpa7k9vGLU/fo9RNET0RqClsyGYOmTc+12qEBxid+5Rz4aDrhCXmVnbFF/9DxQx6zY+aS
        BS5fHZKPat5DzjszAr3uJuOUCzEK90dzANYXtzZuOqPW0TUttptKZyMrWmWm/X2KNCLObg
        t+A2+e3jbCvEaYLYojtlZ3AntA6rNcY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-32-BW5PZiDTOq2rzhsYXMpRIg-1; Thu, 17 Sep 2020 10:10:55 -0400
X-MC-Unique: BW5PZiDTOq2rzhsYXMpRIg-1
Received: by mail-wm1-f71.google.com with SMTP id c200so796832wmd.5
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Sep 2020 07:10:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=dF75HMvcCCwBIMjZhM0MqmBdo7iicvPzKUPWjV2yvk8=;
        b=o2AUapf2oNmB0fErBUYpEPKTeXG1Da0z2InCOjs4N+EKIbX5fJON4oM0owJm9M1Eky
         F7Kim0eqWT+arNYBGIFuhn8pCFQxnOLFTV1IUM6UYx2CyvHitNB82pTBFmb5zVYO3jvL
         /It0YVQOsNVXz2xM74/16MIieeaCDChw1Q2TSKCWWJBTfD0JOdeMlcp2CI7j40EPbOtf
         QmFRzbTMEdK35Vh3su+yjAJ/gCWIlK3P/7NjbwxcDz3jycV773zJPEqKrrIRwW8v2Qph
         nqevNNgWON+ixh0Xo0FY66KGXB2Cat2q6uQREw8CloC9cCZP20jFTrnTuvmvicsOEyOk
         P2MA==
X-Gm-Message-State: AOAM532D0v9CqH/Ih+HWsMWFBKUz6dQHIRTZRv+hHRea7N83HWAEyRQG
        8CgDJ7vSVbC7MtzTE+PLnjbOd/MH8XNjjf3esi804x29KaMfg0tHUjM3bRqLvvsKnAJlpPwVzNQ
        lmsucnqZ6NvaFtZiUqPjZfjCipLwVKoRl8Q==
X-Received: by 2002:a7b:c753:: with SMTP id w19mr10083795wmk.157.1600351853829;
        Thu, 17 Sep 2020 07:10:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwvvlMXpIDNZWr8+8/AoOYvWQ29qEs4dUNL9VTdTu+pvK8zGdpnbjGkn+2K09UlOwvrBjcwyQ==
X-Received: by 2002:a7b:c753:: with SMTP id w19mr10083771wmk.157.1600351853629;
        Thu, 17 Sep 2020 07:10:53 -0700 (PDT)
Received: from dhcp-64-164.muc.redhat.com (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id q12sm36964270wrs.48.2020.09.17.07.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 07:10:52 -0700 (PDT)
Message-ID: <83694d5164a32d1ce6cdafb9cb73d731ca4b4a78.camel@redhat.com>
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
Date:   Thu, 17 Sep 2020 16:10:50 +0200
In-Reply-To: <6e0409e7-5bc2-4ca6-a0aa-725a9a91aa8d@redhat.com>
References: <bbe4ebef-0845-2719-ac9a-fbc9c7bcd7be@redhat.com>
         <21b6dffbbc6dbb14ebef3f078cc2497f9a872f57.camel@hadess.net>
         <b6332a4a-7606-2bd0-632b-f67b68d3dd1b@redhat.com>
         <9f01ce60a6b3319855f6a26b94af3e5fc6d2595e.camel@redhat.com>
         <6e0409e7-5bc2-4ca6-a0aa-725a9a91aa8d@redhat.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-tKXbWGcYreah4JwpZFcX"
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32) 
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org


--=-tKXbWGcYreah4JwpZFcX
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, 2020-09-17 at 15:54 +0200, Hans de Goede wrote:
> Hi,
>=20
> On 9/17/20 3:50 PM, Benjamin Berg wrote:
> > On Thu, 2020-09-17 at 14:51 +0200, Hans de Goede wrote:
> > > > Compared to the WIP lenovo-dytc "perfmode" driver, we're missing
> > > > something to advertise the unavailability of a profile, and the rea=
son
> > > > for that unavailability.
> > >=20
> > > UGh, do we really need to export this though. We have the lap_mode th=
ing
> > > already; and that is something which we will need for other reasons i=
n
> > > the future too. Any UI for selecting performance modes can display a
> > > warning when lap_mode is true saying that: "The laptop has detected t=
hat it
> > > is sitting on someone's lap and that performance may be limited
> > > because of this." (feel free to improve the text).
> >=20
> > Well, for dytc_perfmode there are actually always the three states
> > L/M/H. It just happens that the kernel will write "H*" (was "M*" until
> > yesterday) when the performance mode is degraded due to lap detection.
> >=20
> > Think of dytc_perfmode as a profile that sets a number of things:
> >   * Thermal Limits
> >   * Fan Behaviour
> >   * possibly more
> >=20
> > While dytc_lapmode will only enforce a change to the thermal limit.
> > So "performance" (H) is technically a valid mode even when the lap is
> > detected.
> >=20
> > > I guess we could split the "value" attribute from my reply to Benjami=
n's
> > > email into "configured_value" (rw) and "actual_value" (rw) attributes=
.
> > > If we have the info we might as well export it I guess,.
> >=20
> > I consider the "*" purely a curtsey to users that read the attribute
> > directly using e.g. cat to help with the interpretation. It probably is
> > not interesting to userspace applications/daemons.
>=20
> So if there is a difference between M and H and H* then I think we should
> just do the KISS thing and only have a single value attribute and in the
> new interface handle the H* like H (p-p-d can still check the lap_mode
> attribute to differentiate the 2 if it wants to).

I guess you are saying to drop "H*" and only have "L"/"M"/"H"? If so,
fine with me, but we probably need that input in reply to
  https://patchwork.kernel.org/patch/11730133/#23618881
then :)

In principle it could be useful for userspace to know that performance
is or would be dramatically impacted. i.e. when dytc_lapmode is 1, then
you might want to say something like:

  performance states >=3D 75 are impacted due to "lapmode"

But, not sure if a kernel interface for that is useful or whether we
should just put that kind of knowledge into userspace.

Benjamin

--=-tKXbWGcYreah4JwpZFcX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEED2NO4vMS33W8E4AFq6ZWhpmFY3AFAl9jbmoACgkQq6ZWhpmF
Y3AjERAAsbrXluLuMBkYE3rYcskSyNnlv2UoX24cTLP5rUZG1u5H7ed7e6zDlH/d
a04EUIWTo9yzkW8NWXjQVY8pH7IMmiwKgOrTNw8k1nD+DZdqRG0LVu0Rb4HIX8ch
BwcjEwMiRR/N8gWuNQFYvebZG+7qixTDsiQVhgsdeG3FWIjDNYP9pFIjYhXCcfFO
HnS6J5+NAR8YaTixOKpp091lRPikyLseb4EzNcJQ048/k7HUB7tIct++Y0dLA/1t
2b+Mwd6g4wFfGDX+EVaVeZuWREKm1iILuVh9p9RyRBGMgm56539DSMoiKpQrHk1f
PCEOjC2M6UQXxABX+wGIQQ4jZGSFSkyKYFZ7gUBPwJ1ms1J3r6DH/HH7CVRZ77I7
957A4Ues9bz7Qd2f03iDOP2+4fMpQpgkUve86k6oKVfvSCUhbLjz9BPU9Y3hDuJV
W1r8mAu4XaBxuuZj+kSFtXu4WkCLHY3VBrsTBXGokDCtavCtkGPNcVGnVPjn5afn
g62oxJ9fbKPKqBTYlYte6Osd2yLmFVxqQe3awQLcu6YRbvr6ly3NDqO6bLdm39Ol
4QT+TANUt2fmC6HaD/0wbglmVNnTBGm8Ja9HtJ/NPA0KmPhsLMy3pwnNpZcPZP+6
mm02SaTrxdZGMffEfv2JC9iEW1qWG93A0+yX3ewwQh/mAWl5ESI=
=dGll
-----END PGP SIGNATURE-----

--=-tKXbWGcYreah4JwpZFcX--

