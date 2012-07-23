From: Seth Forshee <seth.forshee@canonical.com>
Subject: Re: [PATCH] apple-gmux: Fix kconfig dependencies
Date: Mon, 23 Jul 2012 08:44:27 -0500
Message-ID: <20120723134427.GA3524@thinkpad-t410>
References: <1341240929-3400-1-git-send-email-seth.forshee@canonical.com>
 <20120716235034.GB11710@ubuntu-530U>
 <20120723133010.GE21495@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20120723133010.GE21495@srcf.ucam.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew Garrett <mjg@redhat.com>
Cc: platform-driver-x86@vger.kernel.org, Arun Raghavan <arun.raghavan@collabora.co.uk>, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Jul 23, 2012 at 02:30:10PM +0100, Matthew Garrett wrote:
> > I'm looking at Andreas's code for switcharoo support, and something I
> > want to do along with it is make apple-gmux not dependent on backlight
> > support (i.e. you can still build switcharoo support if
> > BACKLIGHT_CLASS_DEVICE is disabled). I'm assuming this patch as a
> > prerequisite. But things do get really monstrously ugly, so if there's a
> > cleaner way to enforce this that I haven't found I'd love to hear about
> > it.
> 
> Why do you want to support that case? One of the problems we have with 
> the kernel at present is that it's trivial to come up with non-sensical 
> configurations. I can't think of a single case where you'd want the gmux 
> support without also having the backlight support code.

Just because there isn't strictly any reason that the switching code
needs to depend on backlight support. But yes, I can't think of a good
reason why anyone would want this configuration. I won't mess with it
then.

Seth
