From: Joe Perches <joe@perches.com>
Subject: Re: linux-next: Tree for April 4 [BROKEN thinkpad_acpi]
Date: Mon, 04 Apr 2011 08:13:32 -0700
Message-ID: <1301930012.1941.36.camel@Joe-Laptop>
References: <BANLkTikr62YPeDnkL3DKA1Nts5aRFxsO6Q@mail.gmail.com>
	 <20110404122225.GA15883@srcf.ucam.org>
	 <1301921369.1941.29.camel@Joe-Laptop>
	 <20110404130036.GB16669@srcf.ucam.org>
	 <BANLkTimqp6FwLJP3d3dYcx7-Ut9pMjdtFA@mail.gmail.com>
	 <BANLkTimvi53PWhN9HO4f04p_U-vae8D5Hw@mail.gmail.com>
	 <1301929346.1941.32.camel@Joe-Laptop>
	 <BANLkTik19DczZ9uoSQSvv_zpv5fpUR7kCw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <BANLkTik19DczZ9uoSQSvv_zpv5fpUR7kCw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: sedat.dilek@gmail.com
Cc: Matthew Garrett <mjg@redhat.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86 <platform-driver-x86@vger.kernel.org>, ibm-acpi@hmh.eng.br
List-Id: platform-driver-x86.vger.kernel.org

On Mon, 2011-04-04 at 17:08 +0200, Sedat Dilek wrote:
> On Mon, Apr 4, 2011 at 5:02 PM, Joe Perches <joe@perches.com> wrote:
> > On Mon, 2011-04-04 at 16:44 +0200, Sedat Dilek wrote:
> >> > I have tried with solution #2 as it partially restores old behaviour
> >> > (patch is attached).
> > Partially?  Please explain.
> -#define vdbg_printk(a_dbg_level, format, arg...) \
> -       do { } while (0)
> +#define vdbg_printk(a_dbg_level, format, arg...)       \
> +       no_printk(format, ##arg)

I understand the reversed patch.

My point was focused on the word "partially".
