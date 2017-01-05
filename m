From: Jean Delvare <jdelvare@suse.de>
Subject: Re: [PATCH v2] dell-wmi, dell-laptop: hide dell-smbios
Date: Thu, 5 Jan 2017 10:09:03 +0100
Message-ID: <20170105100903.497c6de2@endymion>
References: <20170104135917.43eedcc0@endymion>
        <20170105085939.GC31083@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:52919 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1033392AbdAEJJH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 5 Jan 2017 04:09:07 -0500
In-Reply-To: <20170105085939.GC31083@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?UTF-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, =?UTF-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>

Hi Pali,

On Thu, 5 Jan 2017 09:59:39 +0100, Pali Rohár wrote:
> On Wednesday 04 January 2017 13:59:17 Jean Delvare wrote:
> > Dell-smbios is a helper module, it serves no purpose on its own, so
> > do not present it as an option to the user. Instead, select it
> > automatically whenever a driver which needs it is selected.
> > 
> > Signed-off-by: Jean Delvare <jdelvare@suse.de>
> > Cc: Michał Kępień <kernel@kempniu.pl>
> > Cc: Pali Rohár <pali.rohar@gmail.com>
> > Cc: Darren Hart <dvhart@infradead.org>
> > ---
> > Changes since v1:
> >  * Select DCDBAS instead of depending on it. This is more
> >    user-friendly and avoids the confusing transitive dependencies
> >    which Pali didn't like.
> 
> Hi! I see that in previous email you CCed Yann and linux-kbuild, (...)

No, I did not. What are you talking about? I'm confused.

-- 
Jean Delvare
SUSE L3 Support
