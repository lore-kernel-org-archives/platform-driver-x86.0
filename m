From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH v17 01/23] x86/sgx: Update MAINTAINERS
Date: Fri, 16 Nov 2018 21:24:03 +0100
Message-ID: <20181116202403.GN20313@zn.tnic>
References: <20181116010412.23967-1-jarkko.sakkinen@linux.intel.com>
 <20181116010412.23967-2-jarkko.sakkinen@linux.intel.com>
 <20181116142248.GH20313@zn.tnic>
 <20181116150714.GA4244@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181116150714.GA4244@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc: x86@kernel.org, platform-driver-x86@vger.kernel.org, linux-sgx@vger.kernel.org, dave.hansen@intel.com, sean.j.christopherson@intel.com, nhorman@redhat.com, npmccallum@redhat.com, serge.ayoun@intel.com, shay.katz-zamir@intel.com, haitao.huang@linux.intel.com, andriy.shevchenko@linux.intel.com, tglx@linutronix.de, kai.svahn@intel.com, mark.shanahan@intel.com, luto@amacapital.net, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "David S. Miller" <davem@davemloft.net>, Andrew Morton <akpm@linux-foundation.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Arnd Bergmann <arnd@arndb.de>, open list <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Nov 16, 2018 at 05:07:14PM +0200, Jarkko Sakkinen wrote:
> Yes, I think it could be renamed as sgx.c. Should the driver part be
> also called as sgx.ko?

I guess that's your call guys. The reason why I asked is because I like
shorter names and "sgx" is unambiguous enough. AFAICT, there's no one
else doing SGX atm.

:-)

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
