From: Dave Airlie <airlied@gmail.com>
Subject: Re: [PATCH] backlight: initialize struct backlight_properties properly
Date: Tue, 22 May 2012 10:25:31 +0100
Message-ID: <CAPM=9tzbMM09jENTZqDcnwEsA+G8y1A_orR8EgREePpxDzr0nQ@mail.gmail.com>
References: <1337585085-4891-1-git-send-email-corentin.chary@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-gg0-f174.google.com ([209.85.161.174]:51997 "EHLO
	mail-gg0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757034Ab2EVJZc convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 22 May 2012 05:25:32 -0400
In-Reply-To: <1337585085-4891-1-git-send-email-corentin.chary@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentin.chary@gmail.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, Keith Packard <keithp@keithp.com>, David Airlie <airlied@linux.ie>, Matthew Garrett <mjg@redhat.com>, Florian Tobias Schandinat <FlorianSchandinat@gmx.de>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Mathieu Poirier <mathieu.poirier@linaro.org>, Dave Airlie <airlied@redhat.com>, Arnd Bergmann <arnd@arndb.de>, Lars-Peter Clausen <lars@metafoo.de>, Axel Lin <axel.lin@gmail.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-fbdev@vger.kernel.org, patches@opensource.wolfsonmicro.com, linux-omap@vger.kernel.org

On Mon, May 21, 2012 at 8:24 AM, Corentin Chary
<corentin.chary@gmail.com> wrote:
> In all these files, the .power field was never correctly initialized.
>
> Signed-off-by: Corentin Chary <corentin.chary@gmail.com>
> ---
> =A0drivers/gpu/drm/i915/intel_panel.c =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0=
 =A01 +
> =A0drivers/gpu/drm/radeon/radeon_legacy_encoders.c | =A0 =A01 +

I've taken these two hunks into drm-next.

Dave.
