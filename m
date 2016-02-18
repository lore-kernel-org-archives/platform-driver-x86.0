From: Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH v5 10/12] drm/i915: Defer probe if gmux is present but
 its driver isn't
Date: Thu, 18 Feb 2016 23:20:41 +0100
Message-ID: <20160218222041.GB19128@wunner.de>
References: <cover.1452525860.git.lukas@wunner.de>
 <f56ee6a0600a3e1bb5bed4d0db4ed9ade7445c47.1452525860.git.lukas@wunner.de>
 <20160209090401.GA11240@phenom.ffwll.local>
 <20160214121008.GA16847@wunner.de>
 <CAKMK7uGZz=HyDhgJg=y9xb+i=-3zrQ_b8FGH6_Hd7snTyok7zQ@mail.gmail.com>
 <20160216155820.GA17446@wunner.de>
 <20160216160840.GT32705@phenom.ffwll.local>
 <20160218203431.GA19065@wunner.de>
 <CAKMK7uEd3XUMy8D_BcowtqB49CX8kG6E=aKzi8A3H08_713MoA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mailout2.hostsharing.net ([83.223.90.233]:38664 "EHLO
	mailout2.hostsharing.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1947206AbcBRWUH (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 18 Feb 2016 17:20:07 -0500
Content-Disposition: inline
In-Reply-To: <CAKMK7uEd3XUMy8D_BcowtqB49CX8kG6E=aKzi8A3H08_713MoA@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, platform-driver-x86@vger.kernel.org, intel-gfx <intel-gfx@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>, Alex Deucher <alexander.deucher@amd.com>

Hi,

On Thu, Feb 18, 2016 at 10:39:05PM +0100, Daniel Vetter wrote:
> On Thu, Feb 18, 2016 at 9:34 PM, Lukas Wunner <lukas@wunner.de> wrote:
> >
> >> Ok, makes sense. I still think adding the check to the client_register
> >> function would be good, just as a safety measure.
> >
> > Hm, the idea of calling vga_switcheroo_client_probe_defer() twice
> > causes me pain in the stomach. It's surprising for drivers which
> > just don't need it at the moment (amdgpu and snd_hda_intel) and
> > it feels like overengineering and pampering driver developers
> > beyond reasonable measure. Also while the single existing check is
> > cheap, we might later on add checks that take more time and slow
> > things down.
> 
> It's motivated by Rusty's API Manifesto:
> 
> http://sweng.the-davies.net/Home/rustys-api-design-manifesto

Interesting, thank you.


> With the mandatory check in _register we reach level 5 - it'll blow up
> at runtime when we try to register it.

The manifesto says "5. Do it right or it will always break at runtime".

However even if we add a WARN_ON(vga_switcheroo_client_probe_defer(pdev))
to register_client(), it will not *always* spew a stacktrace but only on
the machines this concerns (MacBook Pros). Since failure to defer breaks
GPU switching, level 5 is already reached. Chances are this won't go
unnoticed by the user.


> For more context: We have tons of fun with EPROBE_DEFER handling
> between i915 and snd-hda

I don't understand, there is currently not a single occurrence of
EPROBE_DEFER in i915, apart from the one I added.

In sound/ there are 88 occurrences of EPROBE_DEFER in soc/, plus 1 in
ppc/ and that's it. So not a single one in pci/hda/ where hda_intel.c
resides.

Is the fun with EPROBE_DEFER handling caused by the lack thereof?


Best regards,

Lukas
