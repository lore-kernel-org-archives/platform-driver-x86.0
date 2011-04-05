From: "Henrique de Moraes Holschuh" <hmh@hmh.eng.br>
Subject: Re: linux-next: Tree for April 4 [BROKEN thinkpad_acpi]
Date: Tue, 05 Apr 2011 09:27:55 -0300
Message-ID: <1302006475.6449.1437647773@webmail.messagingengine.com>
References: <BANLkTikr62YPeDnkL3DKA1Nts5aRFxsO6Q@mail.gmail.com><20110404122225.GA15883@srcf.ucam.org><1301921369.1941.29.camel@Joe-Laptop>
 <20110404130036.GB16669@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
In-Reply-To: <20110404130036.GB16669@srcf.ucam.org>
Sender: linux-next-owner@vger.kernel.org
To: Matthew Garrett <mjg@redhat.com>, Joe Perches <joe@perches.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, sedat.dilek@gmail.com, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86 <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, 04 Apr 2011 14:00 +0100, "Matthew Garrett" <mjg@redhat.com> wrote:
> On Mon, Apr 04, 2011 at 05:49:29AM -0700, Joe Perches wrote:
> 
> > It's vdbg_printk no_printk verification.
> > 
> > #ifdef CONFIG_THINKPAD_ACPI_DEBUG
> > #define vdbg_printk dbg_printk
> > static const char *str_supported(int is_supported);
> > #else
> > #define vdbg_printk(a_dbg_level, format, arg...)	\
> > 	no_printk(format, ##arg)
> > #endif
> > 
> > Two ways to handle this.
> > 
> > 1: add
> > static inline const char *str_supported(int is_supported) { return ""; }
> > to the #else
> > 
> > 2: Remove no_printk verification and return it to do {} while (0)
> > 
> > Do you have a preference?
> 
> I don't. Henrique?

No set preference, either way is fine.

-- 
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh
