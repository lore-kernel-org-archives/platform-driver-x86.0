From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v3 1/1] Introduce Intel RAPL cooling device driver
Date: Tue, 9 Apr 2013 09:34:34 -0700
Message-ID: <20130409163434.GB30705@kroah.com>
References: <1365511578-30453-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <1365511578-30453-2-git-send-email-jacob.jun.pan@linux.intel.com>
 <20130409152638.GA3033@kroah.com>
 <20130409091517.3b73a583@chromoly>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pd0-f175.google.com ([209.85.192.175]:54367 "EHLO
	mail-pd0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S937099Ab3DIQeh (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 9 Apr 2013 12:34:37 -0400
Received: by mail-pd0-f175.google.com with SMTP id g10so3624558pdj.6
        for <platform-driver-x86@vger.kernel.org>; Tue, 09 Apr 2013 09:34:36 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20130409091517.3b73a583@chromoly>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jacob Pan <jacob.jun.pan@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Matthew Garrett <matthew.garrett@nebula.com>, Joe Perches <joe@perches.com>, Zhang Rui <rui.zhang@intel.com>, Rafael Wysocki <rafael.j.wysocki@intel.com>, Len Brown <len.brown@intel.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Arjan van de Ven <arjan@linux.intel.com>

On Tue, Apr 09, 2013 at 09:15:17AM -0700, Jacob Pan wrote:
> On Tue, 9 Apr 2013 08:26:38 -0700
> Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:
> > > +	if (NULL == rp->name || rp->flag & RAPL_PRIMITIVE_DUMMY)
> > 
> > In Linux we do (rp->name == NULL), or even better yet (!rp->name),
> > please fix that up here and elsewhere in the driver.
> > 
> I can fix that. I did that because checkpatch does not complain about
> it.

checkpatch doesn't catch everything.

> also it avoids common mistake as: rp->name = NULL

The compiler catches mistakes like that, and has for many years.

> > > +#define PRIMITIVE_INFO_INIT(p, m, s, i, u, f) {#p, m, s, i, u, p,
> > > f}
> > 
> > C has named initializers, use them please.
> > 
> this macro can save lots of repeated text.

text is free.
