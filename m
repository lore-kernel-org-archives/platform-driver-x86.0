Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03EADC46467
	for <platform-driver-x86@archiver.kernel.org>; Wed, 11 Jan 2023 12:14:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232489AbjAKMOb (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 11 Jan 2023 07:14:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233530AbjAKMOU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 11 Jan 2023 07:14:20 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF67064CC;
        Wed, 11 Jan 2023 04:14:18 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8478861BBE;
        Wed, 11 Jan 2023 12:14:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7557DC433D2;
        Wed, 11 Jan 2023 12:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1673439257;
        bh=xXMFupcJLhFtYD7xp7XaL9m8Yy3nYvahKxJzm4mSzh0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=wKHc/da4SV9STOsFN13ASyl0IHsmd9v61l96rEx/EJOVouahU6+fGedv4p1kndmV6
         5AA9xFwoDGXhIZ0mSTIhwd5o1v43qQbi7s2nQpzLSIjngeTnLXDg+4azoPAkixIr4+
         ZX/9SnNrNZwTv6S9twQtFq8RhvR5OcB3FzYZo7+k=
Date:   Wed, 11 Jan 2023 13:14:14 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     linux-kernel@vger.kernel.org,
        Maximilian Luz <luzmaximilian@gmail.com>,
        platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2 03/16] platform/surface: aggregator: move
 to_ssam_device() to use container_of_const()
Message-ID: <Y76oFmWJzEJv68yr@kroah.com>
References: <20230111113018.459199-1-gregkh@linuxfoundation.org>
 <20230111113018.459199-4-gregkh@linuxfoundation.org>
 <cc8125e0-a52e-f804-8e57-c3a1372ee6fc@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cc8125e0-a52e-f804-8e57-c3a1372ee6fc@redhat.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, Jan 11, 2023 at 12:54:54PM +0100, Hans de Goede wrote:
> Hi,
> 
> On 1/11/23 12:30, Greg Kroah-Hartman wrote:
> > The driver core is changing to pass some pointers as const, so move
> > to_ssam_device() to use container_of_const() to handle this change.
> > to_ssam_device() now properly keeps the const-ness of the pointer passed
> > into it, while as before it could be lost.
> > 
> > Cc: Maximilian Luz <luzmaximilian@gmail.com>
> > Cc: platform-driver-x86@vger.kernel.org
> > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > ---
> >  include/linux/surface_aggregator/device.h | 5 +----
> >  1 file changed, 1 insertion(+), 4 deletions(-)
> > 
> > diff --git a/include/linux/surface_aggregator/device.h b/include/linux/surface_aggregator/device.h
> > index 46c45d1b6368..24151a0e2c96 100644
> > --- a/include/linux/surface_aggregator/device.h
> > +++ b/include/linux/surface_aggregator/device.h
> > @@ -229,10 +229,7 @@ static inline bool is_ssam_device(struct device *d)
> >   * Return: Returns a pointer to the &struct ssam_device wrapping the given
> >   * device @d.
> >   */
> > -static inline struct ssam_device *to_ssam_device(struct device *d)
> > -{
> > -	return container_of(d, struct ssam_device, dev);
> > -}
> > +#define to_ssam_device(d)	container_of_const(d, struct ssam_device, dev)
> 
> There is a kernel-doc comment for this helper, I'm not sure if sphinx is going
> to like changing this from a static inline to a #define ?
> 
> At a minimum I guess the generated docs are going to loose some type info
> by switching to a define. Can we keep this as a static inline ?

No, container_of_const() will not work properly as an inline function as
you don't know the return type until the preprocessor runs.  I thought
kerneldoc should still work just fine here as it does work for defines
in other places.

thanks,

greg k-h
