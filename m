From: Ritesh Raj Sarraf <rrs@debian.org>
Subject: Re: [PATCH] Add sysfs interface for touchpad state
Date: Tue, 14 Feb 2017 19:48:43 +0530
Message-ID: <1487081923.10822.1.camel@debian.org>
References: <20170130105749.17338-1-rrs@debian.org>
         <CAHp75VcekiLxkGbHFXbPvTX7SwBHobQFmnx5Y-uFWXZSEN9ujA@mail.gmail.com>
         <1485863265.11199.3.camel@debian.org>
         <CAHp75Vfbr0dfxjv1QhF+z6D1Ptd5z9s0K825VnE786W2-y+kPQ@mail.gmail.com>
         <1485959219.8977.1.camel@debian.org>
         <CAHp75VcHE8ZHpuS=WEQOD7kMLSDSiFhZSAx_55ARidi0FUhapw@mail.gmail.com>
         <1485965846.14297.1.camel@debian.org>
         <CAHp75VckDTD+yx4tTwpzgvgsygiWFEs1t5Uc85UsbaJD8inx_w@mail.gmail.com>
         <1486023399.14342.1.camel@debian.org>
         <CAHp75VcH2cCWA2mophVC1+BP69D0FJ2-tQjcs9B-Yi8JaytN_A@mail.gmail.com>
Reply-To: rrs@debian.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-yb0-f193.google.com ([209.85.213.193]:34116 "EHLO
        mail-yb0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752597AbdBNOSv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 14 Feb 2017 09:18:51 -0500
Received: by mail-yb0-f193.google.com with SMTP id w194so5511891ybe.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 14 Feb 2017 06:18:51 -0800 (PST)
In-Reply-To: <CAHp75VcH2cCWA2mophVC1+BP69D0FJ2-tQjcs9B-Yi8JaytN_A@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

On Tue, 2017-02-14 at 00:26 +0200, Andy Shevchenko wrote:
> I'm sorry for top-posting, but something wrong with email quoting. I'm
> using here gmail, it might not recognize message properly.
> 
> So, please fix the subject line to have a prefix, in your case
> "platform/x86: ideapad-laptop: ...".
> Add to the commit message what you explained me and put a link to that
> comment.
> And resend new version with all maintainers included (there is a
> script scripts/get_maintainer.pl to help with the list of
> maintainers).

Thank you Andy. I've just re-sent (through git send-email) a revised patch, with
your comments.

- -- 
Ritesh Raj Sarraf | http://people.debian.org/~rrs
Debian - The Universal Operating System
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEQCVDstmIVAB/Yn02pjpYo/LhdWkFAlijEcMACgkQpjpYo/Lh
dWkieRAAtfWMgH+rwbCLjXRMTfGLTG8Nf76Iyq1w+8ny09/IyN9g15YMCuE2O5QI
RgQQNa5e/DZ7qqGbxlZP7T5om2PWMDlREsnjiEYBwIDBPfOd/+ob/SPRGvXPf/QP
Lx47EAmVoT4dv9urcz/54G9QjYxvgE96RlE42qx1z2mompdqAyrmg28AgqccILrU
rcMC9xU+2x172/z8kpdx+hZf87Zi3EevIUjrjJq39b1MDyePkv7l9Mz724RRxWfs
UheZSKJtJonySz/psg9xqDzYsc23UY0XWLbTjGBCFfc+8ZYLNvobDXJkPJMK5cyx
Qy0ZHkkRZC0bHiuu24WMcgmelSTcwS2WTjdYOZxOoS9nshXU/xJ33C5tjq/yrfC4
nwQsru+SdZml8xmFUHDCXfCnyMOjB5zG2n241kMjMhu7fC3UDZ+1ptxeUAk066It
ov3LlPxs5sV/qOvFNbWAm8CJEPDX9kNpZ9IFneic2AZhfgR0BCiAItjvlkZVmpNi
iGDIHyASM6csX8hcGKW8NAJwbZYkjrUPJRQYiqhwtbmkP7eHxEIWX1ac1uxQZP9A
zUlxZCOSyWLKqp3+rVX/H3KsuRAJUkkLIzN7jwepPBdy8EAfXUuwuayfmAxXGges
JtErebhnb4/WdYSkOPZcmGLGxQHlsh7mdzeEN8Gbh844Li/C0z0=
=QTp1
-----END PGP SIGNATURE-----
