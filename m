From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 11/12] platform/x86: dell-wmi-smbios: introduce character
 device for userspace
Date: Wed, 27 Sep 2017 14:59:27 -0700
Message-ID: <20170927215927.GP23572@fury>
References: <cover.1505999739.git.mario.limonciello@dell.com>
 <a7829a31691da18e4d28e0760645ca2a3f302b66.1505999739.git.mario.limonciello@dell.com>
 <20170925163150.GM22190@pali>
 <CAHp75Vewet4v-kwiEGd82XicaLv_XbNt6o6q+CVqYCUFnUg+oQ@mail.gmail.com>
 <23b3029bac144f17bd3a68a13cfe9cf4@ausx13mpc120.AMER.DELL.COM>
 <20170927165936.GF23572@fury>
 <5a68f1bdb7484009be88a39660d478ae@ausx13mpc120.AMER.DELL.COM>
 <20170927185026.GM23572@fury>
 <151663b32c9e40a48e3a49b85eda1a0e@ausx13mpc120.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:46914 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752011AbdI0V7a (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 27 Sep 2017 17:59:30 -0400
Content-Disposition: inline
In-Reply-To: <151663b32c9e40a48e3a49b85eda1a0e@ausx13mpc120.AMER.DELL.COM>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario.Limonciello@dell.com
Cc: andy.shevchenko@gmail.com, pali.rohar@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, quasisec@google.com

On Wed, Sep 27, 2017 at 09:12:34PM +0000, Mario.Limonciello@dell.com wrote:
...
> > Thanks for the concrete example, this helps a lot.
> > 
> > One guiding principle of this series and something Pali correctly pointed out,
> > is that for Linux, we're keeping WMI as the implementation and exposing features
> > to userspace through char devs and IOCTLS. You points above are consistent with
> > that theme, and the GUIDs are not an appropriate namespace.
> > 
> > The driver namespace does make more sense as you suggested above:
> > 
> > /dev/wmi/$driver
> > 
> > This still has wmi in the name, but given that is the bus name, I think it's a
> > reasonable way organize the files - and is still a well-defined naming scheme.
> > 
> 
> Thanks Darren.  I'll adjust the patch.
> Would you like me to document this chosen policy somewhere in Documentation?
> If so, where?
> Or to put more about our conversation in the commit message? 
> 

Some justification in the commit message for now would be best. Thanks!

-- 
Darren Hart
VMware Open Source Technology Center
