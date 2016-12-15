From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2] platform/x86: thinkpad_acpi: Initialize local
 in_tablet_mode and type
Date: Thu, 15 Dec 2016 13:16:55 -0800
Message-ID: <20161215211655.GA39589@f23x64.localdomain>
References: <20161215041424.GA19534@f23x64.localdomain>
 <1481825702.9552.44.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-next-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1481825702.9552.44.camel@linux.intel.com>
Sender: linux-next-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Darren Hart <dvhart@linux.intel.com>, Lyude <lyude@redhat.com>, Henrique de Moraes Holschuh <hmh@hmh.eng.br>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Dec 15, 2016 at 08:15:02PM +0200, Andy Shevchenko wrote:
> On Wed, 2016-12-14 at 20:14 -0800, Darren Hart wrote:
> > linux-next reported in_tablet_mode and type may be used uninitialized
> > after:
> > 
> > b31800283868 ("platform/x86: thinkpad_acpi: Move tablet detection into
> > separate function")
> > 
> > This turns out to be a false positive as the pr_info call cannot be
> > reached if tp_features.hotkey_tablet (global scope) is 0, and
> > in_tablet_mode and type are assigned in both places
> > tp_features.hotkey_tablet is assigned.
> > 
> > Regardless, to make it explicit and avoid further reports, initialize
> > in_tablet_mode to 0 and type to "".
> > 
> 
> @@ -3143,8 +3143,8 @@ typedef tpacpi_keymap_entry_t
> > tpacpi_keymap_t[TPACPI_HOTKEY_MAP_LEN];
> >  
> >  static int hotkey_init_tablet_mode(void)
> >  {
> > -	int in_tablet_mode, res;
> > -	char *type;
> > +	int in_tablet_mode = 0, res;
> > +	char *type = "";
> 
> Subtle correction
> NULL will work either and takes less memory ;)
> 
> P.S. Even pr_*() is NULL-aware

Agreed. Fixed, pushed, tagged. Thanks all.

-- 
Darren Hart
Intel Open Source Technology Center
