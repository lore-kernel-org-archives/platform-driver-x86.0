From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [PATCH v6 00/11] Intel SGX Driver
Date: Thu, 14 Dec 2017 13:18:54 +0200
Message-ID: <20171214110913.k7g5qmyaiy2x66wj@linux.intel.com>
References: <20171125193132.24321-1-jarkko.sakkinen@linux.intel.com>
 <20171212140750.GA19663@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:46320 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751459AbdLNLTH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 14 Dec 2017 06:19:07 -0500
Content-Disposition: inline
In-Reply-To: <20171212140750.GA19663@localhost>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pavel Machek <pavel@ucw.cz>
Cc: platform-driver-x86@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, Borislav Petkov <bp@suse.de>, "David S. Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Grzegorz Andrejczuk <grzegorz.andrejczuk@intel.com>, Haim Cohen <haim.cohen@intel.com>, Ingo Molnar <mingo@kernel.org>, Janakarajan Natarajan <Janakarajan.Natarajan@amd.com>, Jim Mattson <jmattson@google.com>, Kan Liang <Kan.liang@intel.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Kyle Huey <me@kylehuey.com>, Len Brown <len.brown@intel.com>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, "open list:FILESYSTEMS (VFS and infrastructure)" <linux-fsdevel@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Paolo Bonzini <pbonzin>

On Tue, Dec 12, 2017 at 03:07:50PM +0100, Pavel Machek wrote:
> On Sat 2017-11-25 21:29:17, Jarkko Sakkinen wrote:
> > Intel(R) SGX is a set of CPU instructions that can be used by applications to
> > set aside private regions of code and data. The code outside the enclave is
> > disallowed to access the memory inside the enclave by the CPU access control.
> > In a way you can think that SGX provides inverted sandbox. It protects the
> > application from a malicious host.
> 
> Would you list guarantees provided by SGX?
> 
> For example, host can still observe timing of cachelines being
> accessed by "protected" app, right? Can it also introduce bit flips?
> 
> 								Pavel

I'll put this in my backlog. Thank you.

/Jarkko
