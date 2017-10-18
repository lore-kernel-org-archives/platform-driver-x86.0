From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH] dell-laptop: Fix keyboard led max_brightness property
 for Dell Latitude E6410
Date: Wed, 18 Oct 2017 20:02:59 +0200
Message-ID: <20171018180259.xy7ms2mo5fsees6y@pali>
References: <1508083394-22823-1-git-send-email-pali.rohar@gmail.com>
 <20171016214837.GC14419@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171016214837.GC14419@fury>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Andy Shevchenko <andy@infradead.org>, "Gabriel M. Elder" <gabriel@tekgnowsys.com>, Gabriele Mazzotta <gabriele.mzt@gmail.com>, Mario.Limonciello@dell.com, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Monday 16 October 2017 14:48:37 Darren Hart wrote:
> On Sun, Oct 15, 2017 at 06:03:14PM +0200, Pali Rohár wrote:
> > This machine reports number of keyboard backlight led levels, instead of
> > value of the last led level index. Therefore max_brightness properly needs
> > to be subtracted by 1 to match led max_brightness API.
> 
> Which field is behaving differently?
> 
> If I'm understanding this correctly:
> 
> Since the max level is something we test for once at runtime, it seems
> to me a cleaner fix would be to check for this quirk in kbd_get_info()
> and set kbd_info.levels accordingly. The rest of the driver logic would
> then remain unchanged.

Great, this is a good idea. I would send a new patch in a few minutes.

> The idea being to translate what the platform firmware reports into what
> the driver already understands, instead of giving the levels fields of
> the structure multiple meanings.

-- 
Pali Rohár
pali.rohar@gmail.com
