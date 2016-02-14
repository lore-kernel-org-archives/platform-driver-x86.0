From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v5 10/12] drm/i915: Defer probe if gmux is present but its
 driver isn't
Date: Sun, 14 Feb 2016 13:46:28 +0100
Message-ID: <CAKMK7uGZz=HyDhgJg=y9xb+i=-3zrQ_b8FGH6_Hd7snTyok7zQ@mail.gmail.com>
References: <cover.1452525860.git.lukas@wunner.de>
	<f56ee6a0600a3e1bb5bed4d0db4ed9ade7445c47.1452525860.git.lukas@wunner.de>
	<20160209090401.GA11240@phenom.ffwll.local>
	<20160214121008.GA16847@wunner.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ob0-f194.google.com ([209.85.214.194]:36633 "EHLO
	mail-ob0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751379AbcBNMq3 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 14 Feb 2016 07:46:29 -0500
Received: by mail-ob0-f194.google.com with SMTP id wg8so13674386obc.3
        for <platform-driver-x86@vger.kernel.org>; Sun, 14 Feb 2016 04:46:29 -0800 (PST)
In-Reply-To: <20160214121008.GA16847@wunner.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Lukas Wunner <lukas@wunner.de>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, platform-driver-x86@vger.kernel.org, intel-gfx <intel-gfx@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>, Alex Deucher <alexander.deucher@amd.com>

On Sun, Feb 14, 2016 at 1:10 PM, Lukas Wunner <lukas@wunner.de> wrote:
>  /**
> + * vga_switcheroo_client_probe_defer() - whether to defer probing a given GPU
> + * @pdev: pci device of GPU
> + *
> + * Determine whether any prerequisites are not fulfilled to probe a given GPU.

I'd phrase this as "Determine whether the vgaswitcheroor support is
fully loaded" and drop the GPU part - it could be needed by snd
drivers eventually too.

> + * DRM drivers should invoke this early on in their ->probe callback and return
> + * %-EPROBE_DEFER if it evaluates to %true. The GPU need not be registered with
> + * vga_switcheroo_register_client() beforehand.

s/need not/must not/ ... is your native language German by any chance?

Aside from that ... should vga_switcheroo_register_client call this
helper instead directly and return the appropriate -EDEFER_PROBE
error? I realize for some drivers it might be way too late to unrol
from that point on, but e.g. i915 already uses -EDEFER_PROBE. And
calling it unconditionally will make sure that it's easier to notice
when people forget this. So maybe call it both from the register
functions, and export as a separate hook? And for i915 we should be
able to remove that early check entirely.

> + *
> + * Return: %false unless one of the following applies:
> + *
> + * * On pre-retina MacBook Pros, the apple-gmux driver is needed to temporarily
> + *   switch DDC to the inactive GPU so that it can probe the panel's EDID.
> + *   Therefore return %true if gmux is built into the machine, @pdev is the
> + *   inactive GPU and the apple-gmux driver has not registered its handler
> + *   flags, signifying it has not yet loaded or has not finished initializing.

I think the apple-specific comment here should be a separate comment
right above the if condition below - it doesn't explain the interface,
only one specific case. And we might grow more of those.
-Daniel

> + */
> +bool vga_switcheroo_client_probe_defer(struct pci_dev *pdev)
> +{
> +       if (apple_gmux_present() && pdev != vga_default_device() &&
> +           !vgasr_priv.handler_flags)
> +               return true;
> +
> +       return false;
> +}
> +EXPORT_SYMBOL(vga_switcheroo_client_probe_defer);
> +




-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
