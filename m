From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [PATCH v5 09/11] fs/pipe.c: export create_pipe_files() and
 replace_fd()
Date: Tue, 21 Nov 2017 00:30:35 +0200
Message-ID: <20171120223035.wsnnfsawuu6fkt3l@linux.intel.com>
References: <20171113194528.28557-1-jarkko.sakkinen@linux.intel.com>
 <20171113194528.28557-10-jarkko.sakkinen@linux.intel.com>
 <alpine.DEB.2.20.1711161012510.2191@nanos>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.20.1711161012510.2191@nanos>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>
Cc: platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Al Viro <viro@zeniv.linux.org.uk>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Nov 16, 2017 at 10:15:42AM +0100, Thomas Gleixner wrote:
> On Mon, 13 Nov 2017, Jarkko Sakkinen wrote:
> 
> + Cc: Al
> 
> - Cc: that intel sgx list because it's moderated and spams my inbox with
>       useless moderation mails.

I guess I'll have to apply for vger.kernel.org list then.

> > Exported create_pipe_files() and replace_fd() because the SGX driver
> > needs to be able to setup pipes in order to communicate with the helper
> > process that hosts the Launch Enclave (LE). The pipe creation will be
> > done in the init-callback supplied to call_usermodehelper_setup().
> > 
> > The driver will use two pipes for communication with the LE hosting
> > process:
> > 
> > * One for writing SIGSTRUCT blobs.
> > * One for reading EINITTOKEN blobs.
> 
> Can you pretty please make sure that people who maintain the affected code
> are CC'd on your changes?

Yes. I actually have written a script to collect everything and pass to
--cc-cmd command that I use with TPM stuff and I forgot it from
my send-email command line when I've sent these series.

/Jarkko
