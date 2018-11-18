From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [PATCH v17 01/23] x86/sgx: Update MAINTAINERS
Date: Sun, 18 Nov 2018 10:20:23 +0200
Message-ID: <20181118082023.GJ5897@linux.intel.com>
References: <20181116010412.23967-1-jarkko.sakkinen@linux.intel.com>
 <20181116010412.23967-2-jarkko.sakkinen@linux.intel.com>
 <20181116142248.GH20313@zn.tnic>
 <20181116150714.GA4244@linux.intel.com>
 <20181116202403.GN20313@zn.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181116202403.GN20313@zn.tnic>
Sender: linux-kernel-owner@vger.kernel.org
To: Borislav Petkov <bp@alien8.de>
Cc: x86@kernel.org, platform-driver-x86@vger.kernel.org, linux-sgx@vger.kernel.org, dave.hansen@intel.com, sean.j.christopherson@intel.com, nhorman@redhat.com, npmccallum@redhat.com, serge.ayoun@intel.com, shay.katz-zamir@intel.com, haitao.huang@linux.intel.com, andriy.shevchenko@linux.intel.com, tglx@linutronix.de, kai.svahn@intel.com, mark.shanahan@intel.com, luto@amacapital.net, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "David S. Miller" <davem@davemloft.net>, Andrew Morton <akpm@linux-foundation.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Arnd Bergmann <arnd@arndb.de>, open list <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Nov 16, 2018 at 09:24:03PM +0100, Borislav Petkov wrote:
> On Fri, Nov 16, 2018 at 05:07:14PM +0200, Jarkko Sakkinen wrote:
> > Yes, I think it could be renamed as sgx.c. Should the driver part be
> > also called as sgx.ko?
> 
> I guess that's your call guys. The reason why I asked is because I like
> shorter names and "sgx" is unambiguous enough. AFAICT, there's no one
> else doing SGX atm.
> 
> :-)

We go with that! Thanks for the feedback.

/Jarkko
