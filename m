From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [PATCH v2 1/3] thinkpad_acpi: Move tablet detection into
 separate function
Date: Sun, 6 Nov 2016 01:19:02 -0200
Message-ID: <20161106031901.GH17290@khazad-dum.debian.net>
References: <201611010752.uqciUgvR%fengguang.wu@intel.com>
 <1477958200-23883-1-git-send-email-lyude@redhat.com>
 <20161105193022.GH100528@f23x64.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20161105193022.GH100528@f23x64.localdomain>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: Lyude <lyude@redhat.com>, ibm-acpi-devel@lists.freedesktop.org, Daniel Martin <consume.noise@gmail.com>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Sat, 05 Nov 2016, Darren Hart wrote:
> On Mon, Oct 31, 2016 at 07:56:40PM -0400, Lyude wrote:
> > Suggested by Daniel Martin <consume.noise@gmail.com>
> > 
> > Lenovo's having a bit of fun randomly changing what hotkey events and
> > acpi handles they use for reporting tablet mode, so unfortunately this
> > means we're definitely going to need to probe for multiple types of
> > tablet mode support. Since the hotkey_init() is already a lot larger
> > then it should be, let's split up this detection into it's own function
> > to make things a little easier to read.
> > 
> > As well, since we're going to have multiple types of tablet modes, make
> > hotkey_tablet into an enum so we can also use it to indicate the type of
> > tablet mode reporting the machine supports.
> > 
> > Changes since v1:
> > - Don't use bool for in_tablet_mode (fixes complaints from kbuild test
> >   robot)
> > 
> 
> This series doesn't apply cleanly now (simple fuzz).
> 
> Once we hear back from Henrique on his enum preference and thoughts on the
> refactoring (which looks reasonable to me), please resubmit this series and

I don't mind the enum usage, as long as it is correct.  As you said, the
driver is not consistent there.  I also don't mind the refactoring.

-- 
  Henrique Holschuh
