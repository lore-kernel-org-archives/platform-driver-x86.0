From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH -next] platform/x86: dell-laptop: fix error return code
 in dell_init()
Date: Tue, 21 Nov 2017 16:00:47 -0800
Message-ID: <20171122000047.GC11270@fury>
References: <1510666813-173192-1-git-send-email-weiyongjun1@huawei.com>
 <22a08d901d38462d8a55f2b3b934e502@ausx13mpc120.AMER.DELL.COM>
 <CAHp75VeO3N-Lf2ywsyc723vcd0pLED98HnSLqcRkgDpKk8xdGQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:41722 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751345AbdKVAAz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 21 Nov 2017 19:00:55 -0500
Content-Disposition: inline
In-Reply-To: <CAHp75VeO3N-Lf2ywsyc723vcd0pLED98HnSLqcRkgDpKk8xdGQ@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Mario Limonciello <Mario.Limonciello@dell.com>, Wei Yongjun <weiyongjun1@huawei.com>, Matthew Garrett <mjg59@srcf.ucam.org>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>

On Tue, Nov 21, 2017 at 04:23:51PM +0200, Andy Shevchenko wrote:
> On Tue, Nov 14, 2017 at 4:38 PM,  <Mario.Limonciello@dell.com> wrote:
> >> -----Original Message-----
> >> From: platform-driver-x86-owner@vger.kernel.org [mailto:platform-driver-x86-
> >> owner@vger.kernel.org] On Behalf Of Wei Yongjun
> >> Sent: Tuesday, November 14, 2017 7:40 AM
> >> To: mjg59@srcf.ucam.org; pali.rohar@gmail.com; dvhart@infradead.org;
> >> andy@infradead.org; Limonciello, Mario <Mario_Limonciello@Dell.com>
> >> Cc: Wei Yongjun <weiyongjun1@huawei.com>; platform-driver-
> >> x86@vger.kernel.org
> >> Subject: [PATCH -next] platform/x86: dell-laptop: fix error return code in dell_init()
> >>
> >> Fix to return error code -ENOMEM from the kzalloc() error handling
> >> case instead of 0, as done elsewhere in this function.
> >>
> >> Fixes: 549b4930f057 ("platform/x86: dell-smbios: Introduce dispatcher for SMM
> >> calls")
> >> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> 
> Pushed to my review and testing queue, thanks.
> 
> Shall we send this as material for -rc2 ?

I have one more queued in for-next already. So pleasae propogate this to
for-next along with anything else you want to go out and I'll send the pull
request tomorrow (Wed) to Linus. Then we'll do our transition to "Fixes"
for the RC cycle (a bit later than usual).

-- 
Darren Hart
VMware Open Source Technology Center
