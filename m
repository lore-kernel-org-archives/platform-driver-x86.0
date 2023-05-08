Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E46B8C7EE22
	for <platform-driver-x86@archiver.kernel.org>; Mon,  8 May 2023 20:42:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229969AbjEHUmH (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 8 May 2023 16:42:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229637AbjEHUmG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 8 May 2023 16:42:06 -0400
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F8BC1BF5;
        Mon,  8 May 2023 13:42:05 -0700 (PDT)
Date:   Mon, 8 May 2023 22:42:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
        t=1683578523; bh=ydGht9HQCYBFDyhSfvLY2tpSXrGzDpYdCWK3i+30BPw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Xnf9bC+rEWY3MUtv4KJqc2I/rfS3vsaA7Wv99G+MB1ZiHy1wuAv8A97bb6HHBEjPg
         sJPLHhdgIrxjRD9JDAVrTKpqKz/NaNkGkx9tfCZ6ZfWTExdtNYU3Dewl6eO5rf7upJ
         HP3RpQif7o3rgMAUYZs983NIV7AFR2zCdulOm+Ww=
From:   Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To:     Jorge Lopez <jorgealtxwork@gmail.com>
Cc:     hdegoede@redhat.com, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v12 00/13] HP BIOSCFG driver
Message-ID: <a1f87dd8-6547-4d6d-9fc8-d7986d9e2c93@t-8ch.de>
References: <20230505220043.39036-1-jorge.lopez2@hp.com>
 <b87d1a4c-9624-4df8-98ba-f2560b7df18b@t-8ch.de>
 <CAOOmCE_DMb6ejprALCfmWa0eA3WQquFnS+Z3D0TjsqqPiytbQw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOOmCE_DMb6ejprALCfmWa0eA3WQquFnS+Z3D0TjsqqPiytbQw@mail.gmail.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 2023-05-08 09:05:22-0500, Jorge Lopez wrote:
> On Sat, May 6, 2023 at 1:57 AM Thomas Weißschuh <thomas@t-8ch.de> wrote:
> >
> > On 2023-05-05 17:00:30-0500, Jorge Lopez wrote:
> > <snip>
> >
> > > Jorge Lopez (13):
> > >   HP BIOSCFG driver - Documentation
> > >   HP BIOSCFG driver  - biosattr-interface
> > >   HP BIOSCFG driver  - bioscfg
> > >   HP BIOSCFG driver  - int-attributes
> > >   HP BIOSCFG driver  - ordered-attributes
> > >   HP BIOSCFG driver  - passwdobj-attributes
> > >   HP BIOSCFG driver  - string-attributes
> > >   HP BIOSCFG driver  - bioscfg-h
> > >   HP BIOSCFG driver  - enum-attributes
> > >   HP BIOSCFG driver  - spmobj-attributes
> > >   HP BIOSCFG driver  - surestart-attributes
> > >   HP BIOSCFG driver  - Makefile
> > >   HP BIOSCFG driver  - MAINTAINERS
> >
> > These could be reordered a bit to be easier to read.
> >
> > * Documentation
> > * bioscfg-h
> > * bioscfg
> > * biosattr-interface
> > * *-attributes
> > * Makefile
> > * MAINTAINERS
> >
> 
> the order is determined when a particular commit took place and as
> reported by git.
> I will reorder the list in the cover-letter in future submissions.

The commits should be ordered in a way that make the most sense.
This should indeed match the order of commits/patches, you could reorder
the commits to match the proposed order.

> > Also currently the subject spacing is currently inconsistent.
> > Something like "hp-bioscfg: foo" would be more in line with the rest of
> > the kernel.
> >
> 
> Noted.  I will update the subject spacing as indicated.   "hp-bioscfg: foo"
> 
> > >
> > >  .../testing/sysfs-class-firmware-attributes   | 117 ++-
> > >  MAINTAINERS                                   |   6 +
> > >  drivers/platform/x86/hp/Kconfig               |  16 +
> > >  drivers/platform/x86/hp/Makefile              |   1 +
> > >  drivers/platform/x86/hp/hp-bioscfg/Makefile   |  12 +
> > >  .../x86/hp/hp-bioscfg/biosattr-interface.c    | 319 ++++++
> > >  drivers/platform/x86/hp/hp-bioscfg/bioscfg.c  | 982 ++++++++++++++++++
> > >  drivers/platform/x86/hp/hp-bioscfg/bioscfg.h  | 523 ++++++++++
> > >  .../x86/hp/hp-bioscfg/enum-attributes.c       | 482 +++++++++
> > >  .../x86/hp/hp-bioscfg/int-attributes.c        | 448 ++++++++
> > >  .../x86/hp/hp-bioscfg/ordered-attributes.c    | 443 ++++++++
> > >  .../x86/hp/hp-bioscfg/passwdobj-attributes.c  | 584 +++++++++++
> > >  .../x86/hp/hp-bioscfg/spmobj-attributes.c     | 381 +++++++
> > >  .../x86/hp/hp-bioscfg/string-attributes.c     | 415 ++++++++
> > >  .../x86/hp/hp-bioscfg/surestart-attributes.c  | 133 +++
> > >  15 files changed, 4860 insertions(+), 2 deletions(-)
> > >  create mode 100644 drivers/platform/x86/hp/hp-bioscfg/Makefile
> > >  create mode 100644 drivers/platform/x86/hp/hp-bioscfg/biosattr-interface.c
> > >  create mode 100644 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
> > >  create mode 100644 drivers/platform/x86/hp/hp-bioscfg/bioscfg.h
> > >  create mode 100644 drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c
> > >  create mode 100644 drivers/platform/x86/hp/hp-bioscfg/int-attributes.c
> > >  create mode 100644 drivers/platform/x86/hp/hp-bioscfg/ordered-attributes.c
> > >  create mode 100644 drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
> > >  create mode 100644 drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c
> > >  create mode 100644 drivers/platform/x86/hp/hp-bioscfg/string-attributes.c
> > >  create mode 100644 drivers/platform/x86/hp/hp-bioscfg/surestart-attributes.c
> > >
> > > --
> > > 2.34.1
> > >
