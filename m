From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2 00/11] fujitsu-laptop: backlight cleanup
Date: Wed, 5 Apr 2017 08:36:00 -0700
Message-ID: <20170405153600.GC27833@fury>
References: <20170405064910.3162-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170405064910.3162-1-kernel@kempniu.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Jonathan Woithe <jwoithe@just42.net>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Apr 05, 2017 at 08:48:59AM +0200, Michał Kępień wrote:
> This series introduces further changes to the way LCD backlight is
> handled by fujitsu-laptop.  These changes include fixing a bug in code
> responsible for generating brightness-related input events, cleaning up
> handling of module parameters, reducing code duplication, removing
> superfluous debug messages and other fixes.
> 
> This series was tested on a Lifebook S7020 and a Lifebook E744.
> 
> This series is based on the testing branch as it requires earlier patch
> series I submitted in order to apply cleanly.
> 
> Changes from v1:
> 
>   - Update debug message logged by set_lcd_level() to reflect code flow
>     changes introduced by patch 04/11.

Queued to testing, thanks! 

> 
>  drivers/platform/x86/fujitsu-laptop.c | 157 ++++++++++------------------------
>  1 file changed, 46 insertions(+), 111 deletions(-)
> 
> -- 
> 2.12.2
> 
> 

-- 
Darren Hart
VMware Open Source Technology Center
