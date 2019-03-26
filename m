From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 25/27] debugfs: Restrict debugfs when the kernel is
 locked down
Date: Tue, 26 Mar 2019 09:43:51 +0900
Message-ID: <20190326004351.GA26712@kroah.com>
References: <20190325220954.29054-1-matthewgarrett@google.com>
 <20190325220954.29054-26-matthewgarrett@google.com>
 <20190326003137.GB5112@kroah.com>
 <CACdnJus6a_7VUR27K7dJE037b3TPwDNMh1AyAOptHepB18vjxw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACdnJus6a_7VUR27K7dJE037b3TPwDNMh1AyAOptHepB18vjxw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew Garrett <mjg59@google.com>
Cc: James Morris <jmorris@namei.org>, LSM List <linux-security-module@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>, Thomas Gleixner <tglx@linutronix.de>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Mar 25, 2019 at 05:38:09PM -0700, Matthew Garrett wrote:
> On Mon, Mar 25, 2019 at 5:35 PM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> > On Mon, Mar 25, 2019 at 03:09:52PM -0700, Matthew Garrett wrote:
> > > Normal device interaction should be done through configfs, sysfs or a
> > > miscdev, not debugfs.
> >
> > Then why not just not allow debugfs at all if it is such a "big
> > problem"?
> 
> Previous attempts to do so have resulted in strong pushback from
> various maintainers. If you're happy just having any complaints
> reassigned to you then I'm more than happy to turn it off entirely.

Sure, send them my way :)
