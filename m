Return-Path: <SRS0=nDDs=C2=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 377B7C2BBD1
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Sep 2020 12:24:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AA16421D92
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Sep 2020 12:24:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BaC0G9kL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726643AbgIQMYz (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 17 Sep 2020 08:24:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56947 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726610AbgIQMYw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 17 Sep 2020 08:24:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1600345474;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=DwmvRcjbR2xj5LF7cOtCfTJ7KS/mVcMqXvGXS85FNzQ=;
        b=BaC0G9kLvwlsQV6gMK2zw976nDJct4phE8WNL7FMqvcjp+jUrbuIxiMJNpfu7e/ZUrAX9v
        CqYfr6FAsF0idKPa9QBaXqyHGXm9VdfRlRa/SljoStlwk1ibzN5HKCUEScyGvZIlsi5LIy
        fZUy0jyDiPfduPkno78Twft3Mmojwss=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-332-qjWjyb_zM9iHsOz6RXBjzw-1; Thu, 17 Sep 2020 08:22:27 -0400
X-MC-Unique: qjWjyb_zM9iHsOz6RXBjzw-1
Received: by mail-wr1-f70.google.com with SMTP id g6so823269wrv.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Sep 2020 05:22:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=DwmvRcjbR2xj5LF7cOtCfTJ7KS/mVcMqXvGXS85FNzQ=;
        b=WfPuHwyyAl4nMzXerQ3H6yp02M/agDoVMKfEfT+yQDhJZIk9BaICgio//fO1G2Tbsx
         HSZY8Rwdp4SjbojKgAxTEQ6wetKFb4ejudvcInPrG5ZTPWvcukHk3cXDtyhOODbVbJgE
         61f0YkYpSmrWqp0s0MKexe0okxl/bhTJB/4gAbujw5/U+y8uPR9Z3C04SOs73x15j3aF
         NFUkEzzkzbHAHuJYFhYcn29+Cgvd2VRwnQ3QQ8ehg/k8UfImDL5td02F7zs3y3YZvIZf
         LNZapnQbiXZvDA0BmmIpBqeenMiR/piBmy71CSZ638mKAyKWTXRaMcV5qEOQHSoI3ZI5
         ZR/w==
X-Gm-Message-State: AOAM531yGK4DL1usFglkMbnnBjV2AsKzthBcep6YTWIFD0sIK4dKrsLY
        Odd8c+OSab8S+lHCcOICrHOWcZgwZGdAu/qurjNa3JApqdq+hHR6S159rSuFcktgFZS/Ox7vO0O
        +aqMXtGdZ1A8LHpiYefuXBIoQGcnOqD2oTg==
X-Received: by 2002:a1c:a444:: with SMTP id n65mr9637536wme.122.1600345346257;
        Thu, 17 Sep 2020 05:22:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw5PcVN3ILWKHZLV7m5yqDy7cANwsSY7aLZChsmJHDVsLnQOgkpDCtFMG6YkNpwBcwGGoMzEA==
X-Received: by 2002:a1c:a444:: with SMTP id n65mr9637517wme.122.1600345346038;
        Thu, 17 Sep 2020 05:22:26 -0700 (PDT)
Received: from dhcp-64-164.muc.redhat.com (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id 63sm10894555wrh.71.2020.09.17.05.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 05:22:25 -0700 (PDT)
Message-ID: <b62caf7d0d7c78bfb7487cda969f55de30253a5c.camel@redhat.com>
Subject: Re: RFC: offering a standardized (/sys/class) userspace API for
 selecting system/laptop performance-profiles
From:   Benjamin Berg <bberg@redhat.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Elia Devito <eliadevito@gmail.com>,
        Mark Pearson <mpearson@lenovo.com>
Cc:     Bastien Nocera <hadess@hadess.net>,
        Jared Dominguez <jaredz@redhat.com>,
        platform-driver-x86@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date:   Thu, 17 Sep 2020 14:22:22 +0200
In-Reply-To: <bbe4ebef-0845-2719-ac9a-fbc9c7bcd7be@redhat.com>
References: <bbe4ebef-0845-2719-ac9a-fbc9c7bcd7be@redhat.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-2nyhjPbW5sQROs3eZzMU"
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32) 
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org


--=-2nyhjPbW5sQROs3eZzMU
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, 2020-09-17 at 13:22 +0200, Hans de Goede wrote:
> The big question is what do we do if there are more then 3 profiles?

The Intel p-state driver has the 4 modes:
 * performance
 * balance_performance
 * balance_power
 * power

This seems to also match what windows does with their power slider,
there the modes are mapped to integer values:
 * power: 25
 * balance_power: 50
 * balance_performance: 75
 * performance: 100

Which appears to be the same as what newer DPTF versions use. For older
DPTF versions this is done through OEM variables, which also appear to
have 4 separate states usually. The MS power slider seems to define the
four possible modes:
 * Battery Saver
 * Better Battery
 * Better Performance
 * Best Performance

https://docs.microsoft.com/en-us/windows-hardware/customize/desktop/customi=
ze-power-slider#set-default-power-slider-mode

> One option would be something like the following:
>=20
> cat /sys/class/system_performance_profile/thinkpad_acpi/performance_profi=
le
>=20
> low-power [balanced] performance

I guess userspace is responsible for setting all drivers to the correct
state when the user changes a global system setting?

> cat /sys/class/system_performance_profile/thinkpad_acpi/extra_performance=
_profiles
>=20
> extra-low-power balanced-performance-mix
>=20
> So we add an optional extra_performance_profiles sysfs attribute and we a=
sk all
> drivers implemeting this class to implement at least the 3 standard profi=
les
> (by mapping 3 of their options to these) and optional they can offer extr=
a
> profiles (with free form names) in the extra_performance_profiles
> sysfs attribute under the class-device.

I think it would be good if userspace can figure out where such these
extra profiles would be sorted in on the "power save -- performance"
scale. Assigning an integer in the range of 0-100 might be a solution
for that.

Benjamin

> The idea behind putting the extra profiles in a separate sysfs-attribute
> is that reading the main performance_profile attribute will always show
> one selected, even if one of the extra profiles is actually in use,
> then the driver should also show the closest standardized profile as
> being active.
>=20
> This will allow userspace code to always rely on the standard interface
> both for getting a representation of the currently active profile as well
> as for setting the active profile.
>=20
> Elia, Mark, I assume that both of you want to get your patches for this
> upstream sooner, rather then later. But I think we should put them on
> hold until we have an agreement on a shared userspace API for this.
>=20
> I would like to think that the above proposal is a good start,
> if we can quickly (*) decide on an userspace API here
>=20
> Regards,
>=20
> Hans
>=20
> p.s.
>=20
> I guess we should also add an optional lap_mode sysfs attribute
> to the class-device, to have all the info for the Thinkpads in
> one place.
>=20
>=20
> *) but not too quickly, it is important we get this right
>=20

--=-2nyhjPbW5sQROs3eZzMU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEED2NO4vMS33W8E4AFq6ZWhpmFY3AFAl9jVP4ACgkQq6ZWhpmF
Y3DIyQ//fdzK7w5OHGfADI2RAyCiEedRMmqzfS6u1WyW+l3N1jyE8z8eoISVl2cP
+TIc95QSj7UM/hUuhtn1PiWWEIQEqId/wv38DHkEFZa7V1p5b0TQETuKwG6Gvi+i
5woE70sHEjY55cxbWqtGqiztriyuEAS31oRF2XG3WQ7Gk2SqwH8yU+CdrcMA425n
Sk3E3lJN9s2R06lsmC/f4kLrsO1qB+kC79oBos/By6cPdAQe+OSvbh2sMxFcuymm
WGHqHlc1gg+4AtGGfT+fr0tlnUl4Gr/nt4Z2EHWZsMWnp6+LseV2OiKKA47r/amp
eHtc3YzqU/C0mVJQnE6aIJKjKbmzs5rJiQSPuEpZyUhMCPUsG5Boof7zG7TV+y9/
2brGlJaVSWxrTAM+YNbBRZhEVo1y0Hno1J+G0g1yjekeMuAzRsXWAk3px4k3qpTQ
gdSDH4qVj54tazy/Hc0Zm9trLT4z2x1wahYjQ9iWiwk9Sfk20z7+74PJrAHzm9lp
LBlm9Ev+LjiDbVC/WIWDihFhBhfKIfJOHfXSTL1Nlz93LnwMkLy+J+Psbe2MakPm
uvYeaN7D4ynEllV3p9qgif8pIfBTPHxQheQfeD+PF+AcO0CUT+9P4zVF57g9Ikks
KescQvoRI06toUh5dc3iD5dzwcFslBf+MdfG1TI103txdw5TFYg=
=3RkO
-----END PGP SIGNATURE-----

--=-2nyhjPbW5sQROs3eZzMU--

