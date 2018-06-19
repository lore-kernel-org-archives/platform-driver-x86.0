From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [PATCH v11 12/13] intel_sgx: driver documentation
Date: Tue, 19 Jun 2018 16:30:43 +0300
Message-ID: <20180619133043.GG5609@linux.intel.com>
References: <20180608171216.26521-1-jarkko.sakkinen@linux.intel.com>
 <20180608171216.26521-13-jarkko.sakkinen@linux.intel.com>
 <6200618e-bcc8-23ba-afe8-4c6be8b364f0@fortanix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <6200618e-bcc8-23ba-afe8-4c6be8b364f0@fortanix.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jethro Beekman <jethro@fortanix.com>
Cc: x86@kernel.org, platform-driver-x86@vger.kernel.org, dave.hansen@intel.com, sean.j.christopherson@intel.com, nhorman@redhat.com, npmccallum@redhat.com, Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Jun 08, 2018 at 11:32:17AM -0700, Jethro Beekman wrote:
> On 2018-06-08 10:09, Jarkko Sakkinen wrote:
> > +Launching enclaves
> > +------------------
> > +
> > +For privileged enclaves the launch is performed simply by submitting the
> > +SIGSTRUCT for that enclave to ENCLS(EINIT). For unprivileged enclaves the
> > +driver hosts a process in ring-3 that hosts a launch enclave signed with a key
> > +supplied for kbuild.
> > +
> > +The current implementation of the launch enclave generates a token for any
> > +enclave. In the future it could be potentially extended to have ways to
> > +configure policy what can be lauched.
> > +
> > +The driver will fail to initialize if it cannot start its own launch enclave.
> > +A user space application can submit a SIGSTRUCT instance through the ioctl API.
> > +The kernel will take care of the rest.
> > +
> > +This design assures that the Linux kernel has always full control, which
> > +enclaves get to launch and which do not, even if the public key MSRs are
> 
> As discussed previously at length, since the kernel needs to execute
> ENCLS[EINIT], it has full control to deny the launching of enclaves
> regardless of any launch enclave implementation. Please change this
> misleading statement.

Remember the discussion, forgot to change it. I'll fix this for the next
version.

/Jarkko
