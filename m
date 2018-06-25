From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [intel-sgx-kernel-dev] [PATCH v11 07/13] x86, sgx: detect Intel
 SGX
Date: Mon, 25 Jun 2018 10:39:28 +0300
Message-ID: <cb6c99eb2c29ab52146e92ba08075a1b6be7c2ce.camel@linux.intel.com>
References: <20180608171216.26521-1-jarkko.sakkinen@linux.intel.com>
         <20180608171216.26521-8-jarkko.sakkinen@linux.intel.com>
         <4fc3b6b0-6e4b-3d5f-4d54-2bf7539c7a17@intel.com>
         <CALCETrU+s97soHtiC3p3hkdwqZhEMdjPyJByskb99a+Z8PZjpA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CALCETrU+s97soHtiC3p3hkdwqZhEMdjPyJByskb99a+Z8PZjpA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Lutomirski <luto@kernel.org>, Dave Hansen <dave.hansen@intel.com>
Cc: X86 ML <x86@kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Andi Kleen <ak@linux.intel.com>, Greg KH <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, npmccallum@redhat.com, LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>, intel-sgx-kernel-dev@lists.01.org, "H. Peter Anvin" <hpa@zytor.com>, Vikas Shivappa <vikas.shivappa@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, 2018-06-18 at 14:36 -0700, Andy Lutomirski wrote:
> SGX: disabled by firmware
> SGX: disabled because CPU does not support flexible launch control
> SGX: disabled because firmware does not support flexible launch control
> SGX: disabled because the phase of the moon is wrong
> SGX: enabled; using SGX1
> SGX: enabled, using SGX2

Makes sense for trouble-shooting (and in that case the check for
SGX_ENABLE flag is more appropriate).

/Jarkko
