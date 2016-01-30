From: Jean Delvare <jdelvare@suse.de>
Subject: Re: [PATCH v3] dmi: Make dmi_walk and dmi_walk_early return real
 error codes
Date: Sat, 30 Jan 2016 20:18:50 +0100
Message-ID: <20160130201850.3fd167e9@endymion.delvare>
References: <0e75e48f9944d14ed914342a4780c199095ad747.1453247603.git.luto@kernel.org>
	<20160122101222.3a29841d@endymion.delvare>
	<20160130180517.GB1862@malice.jf.intel.com>
	<CALCETrXbvv2nQ6XJSocbEukoFQbWd437jaRQ4WjGigxjrMNtGw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:42943 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751315AbcA3TSx (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 30 Jan 2016 14:18:53 -0500
In-Reply-To: <CALCETrXbvv2nQ6XJSocbEukoFQbWd437jaRQ4WjGigxjrMNtGw@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Lutomirski <luto@amacapital.net>
Cc: Darren Hart <dvhart@infradead.org>, Andy Lutomirski <luto@kernel.org>, Pali =?UTF-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, 30 Jan 2016 10:13:09 -0800, Andy Lutomirski wrote:
> On Sat, Jan 30, 2016 at 10:05 AM, Darren Hart <dvhart@infradead.org> wrote:
> > If I understand this correctly, this is the first of 5 patches, and this one has
> > some unanswered questions from Jean here. If this patch gets respun, the
> > following are also impacted:
> >
> > dell-wmi: Stop storing pointers to DMI tables
> > dell-wmi, dell-laptop: select DMI
> > dell-wmi: Clean up hotkey table size check
> > dell-wmi: Support new hotkeys on the XPS 13 9350 (Skylake)
> >
> > Is that correct?
> 
> Not really.  It's just the three patches here:
> 
> http://article.gmane.org/gmane.linux.drivers.platform.x86.devel/8503
> 
> This patch (the dmi_walk error code one) is no longer really related.
> Due to Jean's earlier comment about what happens if DMI isn't enabled
> at all, I no longer propagate the error code from dmi_walk in
> dell-wmi, so the error code won't have any effect.  (Instead I just
> warn and let the driver load in legacy mode, which matches the current
> behavior.)
> 
> I think the way to go is for the v3 "dell-wmi: DMI misuse fixes"
> series to go in through your tree, and I'll hash out the error code
> thing separately with Jean.
> 
> Does that seem sensible?

Yes, I agree that this patch is independent from the dell-wmi patch
series now.

-- 
Jean Delvare
SUSE L3 Support
