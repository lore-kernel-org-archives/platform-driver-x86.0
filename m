From: Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH v5 00/12] Enable GPU switching on pre-retina MacBook Pro
Date: Tue, 2 Feb 2016 16:03:38 +0100
Message-ID: <20160202150338.GA13143@wunner.de>
References: <cover.1452525860.git.lukas@wunner.de>
 <20160201224944.GA12944@wunner.de>
 <CAPM=9tyO56NFhL9Fd2v4BKcWJsrTPo0TDStm_t94h=j2v0vZNw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mailout3.hostsharing.net ([176.9.242.54]:49452 "EHLO
	mailout3.hostsharing.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932304AbcBBPDb (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 2 Feb 2016 10:03:31 -0500
Content-Disposition: inline
In-Reply-To: <CAPM=9tyO56NFhL9Fd2v4BKcWJsrTPo0TDStm_t94h=j2v0vZNw@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dave Airlie <airlied@gmail.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, platform-driver-x86@vger.kernel.org, Paul Hordiienko <pvt.gord@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, William Brown <william@blackhats.net.au>, Seth Forshee <seth.forshee@canonical.com>, Ben Skeggs <bskeggs@redhat.com>, nouveau <nouveau@lists.freedesktop.org>, Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>, Thierry Reding <treding@nvidia.com>, Darren Hart <dvhart@infradead.org>

Hi Dave,

On Tue, Feb 02, 2016 at 11:10:19AM +1000, Dave Airlie wrote:
> On 2 February 2016 at 08:49, Lukas Wunner <lukas@wunner.de> wrote:
> > On Mon, Jan 11, 2016 at 08:09:20PM +0100, Lukas Wunner wrote:
> >> Enable GPU switching on the pre-retina MacBook Pro (2008 - 2013), v5.
> >
> > This series hasn't seen any reviews or acks unfortunately.
> > Any takers?
> 
> Has the tree this depends on been merged? I got these patches and applied
> them to drm-next and found I needed some acpi patches.

Ugh, sorry, I forgot to mention: The acpi_dev_present() API landed
in Linus' tree on January 13th, early on during the merge window.
So after Linus' tree gets merged back into drm-next, the patches
should compile just fine.

Thanks,

Lukas
