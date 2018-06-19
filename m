From: Neil Horman <nhorman@redhat.com>
Subject: Re: [intel-sgx-kernel-dev] [PATCH v11 13/13] intel_sgx: in-kernel
 launch enclave
Date: Tue, 19 Jun 2018 09:17:51 -0400
Message-ID: <20180619131751.GB3666@neilslaptop.think-freely.org>
References: <20180608171216.26521-1-jarkko.sakkinen@linux.intel.com>
 <20180608171216.26521-14-jarkko.sakkinen@linux.intel.com>
 <CALCETrW3aZJMMm1GqgPm-cOD3p7JvKxLj7j85KJwfNW2iHTj4A@mail.gmail.com>
 <CALCETrVp1ZhrxF5bQDSaZpLucS88tErejj5JC6Jb0fB5etWRbA@mail.gmail.com>
 <20180611115255.GC22164@hmswarspite.think-freely.org>
 <CALCETrX6SD0ThNzpjkbXd7CbNTguzqiQhWMomGK+tocx_DE9XQ@mail.gmail.com>
 <20180612174535.GE19168@hmswarspite.think-freely.org>
 <CALCETrV-4D-M2ap1EFHQiQerYf_XgwLmBAx5WMvcCUefOODjOA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CALCETrV-4D-M2ap1EFHQiQerYf_XgwLmBAx5WMvcCUefOODjOA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Lutomirski <luto@kernel.org>
Cc: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, X86 ML <x86@kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, npmccallum@redhat.com, LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>, intel-sgx-kernel-dev@lists.01.org, "H. Peter Anvin" <hpa@zytor.com>, Darren Hart <dvhart@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, andy@infradead.org
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Jun 18, 2018 at 02:58:59PM -0700, Andy Lutomirski wrote:
> On Tue, Jun 12, 2018 at 10:45 AM Neil Horman <nhorman@redhat.com> wrote:
> >
> > On Mon, Jun 11, 2018 at 09:55:29PM -0700, Andy Lutomirski wrote:
> > > On Mon, Jun 11, 2018 at 4:52 AM Neil Horman <nhorman@redhat.com> wrote:
> > > >
> > > > On Sun, Jun 10, 2018 at 10:17:13PM -0700, Andy Lutomirski wrote:
> > > > > > On Jun 9, 2018, at 10:39 PM, Andy Lutomirski <luto@kernel.org> wrote:
> > > > > >
> > > > > > On Fri, Jun 8, 2018 at 10:32 AM Jarkko Sakkinen
> > > > > > <jarkko.sakkinen@linux.intel.com> wrote:
> > > > > >>
> > > > > >> The Launch Enclave (LE) generates cryptographic launch tokens for user
> > > > > >> enclaves. A launch token is used by EINIT to check whether the enclave
> > > > > >> is authorized to launch or not. By having its own launch enclave, Linux
> > > > > >> has full control of the enclave launch process.
> > > > > >>
> > > > > >> LE is wrapped into a user space proxy program that reads enclave
> > > > > >> signatures outputs launch tokens. The kernel-side glue code is
> > > > > >> implemented by using the user space helper framework.  The IPC between
> > > > > >> the LE proxy program and kernel is handled with an anonymous inode.
> > > > > >>
> > > > > >> The commit also adds enclave signing tool that is used by kbuild to
> > > > > >> measure and sign the launch enclave. CONFIG_INTEL_SGX_SIGNING_KEY points
> > > > > >> to a PEM-file for the 3072-bit RSA key that is used as the LE public key
> > > > > >> pair. The default location is:
> > > > > >>
> > > > > >>  drivers/platform/x86/intel_sgx/sgx_signing_key.pem
> > > > > >>
> > > > > >> If the default key does not exist kbuild will generate a random key and
> > > > > >> place it to this location. KBUILD_SGX_SIGN_PIN can be used to specify
> > > > > >> the passphrase for the LE public key.
> > > > > >
> > > > > > It seems to me that it might be more useful to just commit a key pair
> > > > > > into the kernel.  As far as I know, there is no security whatsoever
> > > > > > gained by keeping the private key private, so why not make
> > > > > > reproducible builds easier by simply fixing the key?
> > > > >
> > > > > Having thought about this some more, I think that you should
> > > > > completely remove support for specifying a key. Provide a fixed key
> > > > > pair, hard code the cache, and call it a day. If you make the key
> > > > > configurable, every vendor that has any vendor keys (Debian, Ubuntu,
> > > > > Fedora, Red Hat, SuSE, Clear Linux, etc) will see that config option
> > > > > and set up their own key pair for no gain whatsoever.  Instead, it'll
> > > > > give some illusion of security and it'll slow down operations in a VM
> > > > > guest due to swapping out the values of the MSRs.  And, if the code to
> > > > > support a locked MSR that just happens to have the right value stays
> > > > > in the kernel, then we'll risk having vendors actually ship one
> > > > > distro's public key hash, and that will seriously suck.
> > > > >
> > > > If you hard code the key pair however, doesn't that imply that anyone can sign a
> > > > user space binary as a launch enclave, and potentially gain control of the token
> > > > granting process?
> > >
> > > Yes and no.
> > >
> > > First of all, the kernel driver shouldn't be allowing user code to
> > > launch a launch enclave regardless of signature.  I haven't gotten far
> > > enough in reviewing the code to see whether that's the case, but if
> > > it's not, it should be fixed before it's merged.
> > >
> > Ok, I agree with you here.
> >
> > > But keep in mind that control of the token granting process is not the
> > > same thing as control over the right to launch an enclave.  On systems
> > > without the LE hash MSRs, Intel controls the token granting process
> > > and, barring some attack, an enclave that isn't blessed by Intel can't
> > > be launched.  Support for that model will not be merged into upstream
> > > Linux.  But on systems that have the LE hash MSRs and leave them
> > > unlocked, there is effectively no hardware-enforced launch control.
> > > Instead we have good old kernel policy.  If a user wants to launch an
> > > enclave, they need to get the kernel to launch the enclave, and the
> > > kernel needs to apply its policy.  The patch here (the in-kernel
> > > launch enclave) has a wide-open policy.
> > >
> >
> > Right, also agree here.  Systems without Flexible Launch Control are a
> > non-starter, we're only considering FLC systems here
> >
> > > So, as a practical matter, if every distro has their own LE key and
> > > keeps it totally safe, then a system that locks the MSRs to one
> > > distro's key makes it quite annoying to run another distro's intel_sgx
> > > driver, but there is no effect on the actual security of the system.
> > >
> > I agree that for systems that firmware-lock the msrs are annoying, but I would
> > think that IHV's would want to keep those msrs unlocked specifically to allow a
> > wide range of distributions to use this feature.
> >
> > As for benefits to security, I think there are some.  Namely, by leaving the
> > MSRS unlocked, A distribution can, rather than providing their own distirbution
> > key, pass the root of trust on to the end user.  I can easily envision a
> > downstream customer that wants to use SGX, and do so in such a way that they are
> > assured that their OS vendor doesn't have the ability to run an LE on their
> > system (at least not without the visual cue of specifying a different key hash
> > at the OS boot).
> 
> Which achieves what, exactly?  The launch public key hash isn't the
> root of trust of anything except for a really awkward mechanism to
> limit the enclaves that get run.  If there is actual demand to limit
> enclaves that get run, let's do it correctly: add some code in the
> kernel that enforces a policy before launching an enclave.
> 
> If the MSRs are unlocked, there is no stronger guarantee available
> even if you supply your own custom LE.  If the kernel is owned, the
> attacker can just change the MSRs.
> 
So what you're saying is, because the kernel is a more open attack vector,
someone can compromise the kernel, and then because the msrs are unlocked, can
introduce their own private key and bootstrap ownership of any and all enclaves
on the system.  Ok, I'd not thought about it that way, but it makes sense.  As
such, I'd be supportive of a fixed key and kernel enforced policy.

That said, I think we still want the ability to direct what that policy is.  I
wonder if we can load enclave launch policy using an existing mechanism (selinux
perhaps?  Just spitballing)....


Regards
Neil

> --Andy
