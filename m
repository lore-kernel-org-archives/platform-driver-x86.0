From: Matthew Garrett <mjg59@google.com>
Subject: Re: [PATCH 25/27] debugfs: Restrict debugfs when the kernel is locked down
Date: Mon, 25 Mar 2019 17:38:09 -0700
Message-ID: <CACdnJus6a_7VUR27K7dJE037b3TPwDNMh1AyAOptHepB18vjxw@mail.gmail.com>
References: <20190325220954.29054-1-matthewgarrett@google.com>
 <20190325220954.29054-26-matthewgarrett@google.com> <20190326003137.GB5112@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190326003137.GB5112@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: James Morris <jmorris@namei.org>, LSM List <linux-security-module@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>, Thomas Gleixner <tglx@linutronix.de>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Mar 25, 2019 at 5:35 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> On Mon, Mar 25, 2019 at 03:09:52PM -0700, Matthew Garrett wrote:
> > Normal device interaction should be done through configfs, sysfs or a
> > miscdev, not debugfs.
>
> Then why not just not allow debugfs at all if it is such a "big
> problem"?

Previous attempts to do so have resulted in strong pushback from
various maintainers. If you're happy just having any complaints
reassigned to you then I'm more than happy to turn it off entirely.
