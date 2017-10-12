From: Alan Cox <gnomes@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH v7 10/15] platform/x86: dell-smbios: add filtering
 capability for requests
Date: Thu, 12 Oct 2017 11:09:03 +0100
Message-ID: <20171012110903.3ab4ed5e@alans-desktop>
References: <cover.1507733291.git.mario.limonciello@dell.com>
        <83dc225624f1cde5ee1797aebc945732444ded91.1507733291.git.mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <83dc225624f1cde5ee1797aebc945732444ded91.1507733291.git.mario.limonciello@dell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, pali.rohar@gmail.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de, Greg KH <greg@kroah.com>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, 11 Oct 2017 11:27:36 -0500
Mario Limonciello <mario.limonciello@dell.com> wrote:

> There are some categories of tokens and SMBIOS calls that it makes
> sense to protect userspace from accessing.  These are calls that
> may write to one time use fields or activate hardware debugging
> capabilities.  They are not intended for general purpose use.
> 
> This same functionality may be be later extended to also intercept
> calls that may cause kernel functionality to get out of sync if
> the same functions are used by other drivers.

This doesn't work. You are creating an API. If you then have to remove
parts of the API because it messes stuff up you break your API guarantee.

As I said before, this needs to be a whitelist of stuff that is safe, and
it needs to have a security model. When you make a feature available you
can't nicely take it away again as you'll break people's user space.

Start with a whitelist of the ones you know people want to use, or that
your existing tooling you want to enable uses. Add others as needed in
future releases of the kernel.

Alan
