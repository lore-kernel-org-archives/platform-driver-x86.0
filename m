Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3C70C77B78
	for <platform-driver-x86@archiver.kernel.org>; Wed,  3 May 2023 20:10:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229918AbjECUKi (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 3 May 2023 16:10:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229768AbjECUKh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 3 May 2023 16:10:37 -0400
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35A0B420B;
        Wed,  3 May 2023 13:10:36 -0700 (PDT)
Date:   Wed, 3 May 2023 22:10:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
        t=1683144633; bh=sG7jgizKAtfeEAfcw9DHzY1yRc+hKz8BfkNK3ux4v9U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Mu1eIq/33V22794xaBoXgdBDO98QgFUR8zfUwwtLuaf9E6UbEGt1UDdzJ8j8CQB+T
         ZOt9SzRTSudqlp55a666gpiVdVacgqrPG7cjr4xWX9PUixNaYZWjpugIDeXQeDM5JD
         wjCE7I5dL7uerB1KznLLVjU+SZMLKi4+NL4subLU=
From:   Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To:     Jorge Lopez <jorgealtxwork@gmail.com>
Cc:     hdegoede@redhat.com, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 09/14] HP BIOSCFG driver - enum-attributes
Message-ID: <bb7ca13b-bef2-459a-aa11-bfbae1ee81bd@t-8ch.de>
References: <20230420165454.9517-1-jorge.lopez2@hp.com>
 <20230420165454.9517-10-jorge.lopez2@hp.com>
 <951adb9c-dd5c-4c40-a786-2025ebe1650f@t-8ch.de>
 <CAOOmCE-dVzSrjWDx=tcXP-f+4NuN-U_-sc_QaLRt1qjtjaVVGw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOOmCE-dVzSrjWDx=tcXP-f+4NuN-U_-sc_QaLRt1qjtjaVVGw@mail.gmail.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 2023-05-03 14:42:37-0500, Jorge Lopez wrote:
> On Sun, Apr 23, 2023 at 7:55 AM Thomas Weißschuh <thomas@t-8ch.de> wrote:
> >
> > On 2023-04-20 11:54:49-0500, Jorge Lopez wrote:
> > >  .../x86/hp/hp-bioscfg/enum-attributes.c       | 543 ++++++++++++++++++
> > >  1 file changed, 543 insertions(+)
> > >  create mode 100644 drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c
> > >
> > > diff --git a/drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c

<snip>

> > > +/*
> > > + * validate_enumeration_input() -
> > > + * Validate input of current_value against possible values
> > > + *
> > > + * @instance_id: The instance on which input is validated
> > > + * @buf: Input value
> > > + */
> > > +static int validate_enumeration_input(int instance_id, const char *buf)
> > > +{
> > > +     int ret = 0;
> > > +     int found = 0;
> > > +     int i;
> > > +     int possible_values;
> > > +
> > > +     /* Is it a read only attribute */
> > > +     if (bioscfg_drv.enumeration_data[instance_id].common.is_readonly)
> > > +             return -EIO;
> > > +
> > > +     possible_values = bioscfg_drv.enumeration_data[instance_id].possible_values_size;
> > > +     for (i = 0; i < possible_values && !found; i++)
> > > +             if (!strcasecmp(bioscfg_drv.enumeration_data[instance_id].possible_values[i], buf))
> >
> > Is this also intentionally case-insensitive?
> 
> Yes

Why? It is surprising.

The behavior differs from sysfs_match_string() and friends.
Thinking about it, this function should be able to use
__sysfs_match_string().

(Same for the ordered list type)

<snip>
