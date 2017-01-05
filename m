From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v2] dell-wmi, dell-laptop: hide dell-smbios
Date: Thu, 5 Jan 2017 10:10:48 +0100
Message-ID: <20170105091048.GD31083@pali>
References: <20170104135917.43eedcc0@endymion>
 <20170105085939.GC31083@pali>
 <20170105100903.497c6de2@endymion>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170105100903.497c6de2@endymion>
Sender: linux-kernel-owner@vger.kernel.org
To: Jean Delvare <jdelvare@suse.de>
Cc: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
List-Id: platform-driver-x86.vger.kernel.org

On Thursday 05 January 2017 10:09:03 Jean Delvare wrote:
> Hi Pali,
> 
> On Thu, 5 Jan 2017 09:59:39 +0100, Pali Rohár wrote:
> > On Wednesday 04 January 2017 13:59:17 Jean Delvare wrote:
> > > Dell-smbios is a helper module, it serves no purpose on its own, so
> > > do not present it as an option to the user. Instead, select it
> > > automatically whenever a driver which needs it is selected.
> > > 
> > > Signed-off-by: Jean Delvare <jdelvare@suse.de>
> > > Cc: Michał Kępień <kernel@kempniu.pl>
> > > Cc: Pali Rohár <pali.rohar@gmail.com>
> > > Cc: Darren Hart <dvhart@infradead.org>
> > > ---
> > > Changes since v1:
> > >  * Select DCDBAS instead of depending on it. This is more
> > >    user-friendly and avoids the confusing transitive dependencies
> > >    which Pali didn't like.
> > 
> > Hi! I see that in previous email you CCed Yann and linux-kbuild, (...)
> 
> No, I did not. What are you talking about? I'm confused.

Ah, Darren (not you) CCed linux-kbuild under thread for v1 of your patches.

-- 
Pali Rohár
pali.rohar@gmail.com
