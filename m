From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] toshiba-wmi: Fix loading the driver on non Toshiba
 laptops
Date: Wed, 19 Oct 2016 13:26:43 -0700
Message-ID: <20161019202643.GB78689@f23x64.localdomain>
References: <20160825185055.12143-1-coproscefalo@gmail.com>
 <20160828170037.GC96930@f23x64.localdomain>
 <CAGdLNWGderHFpsqcRc5FjHYOCokoKzfsTeMUkjyZYhAU3guQ0w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAGdLNWGderHFpsqcRc5FjHYOCokoKzfsTeMUkjyZYhAU3guQ0w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Azael Avalos <coproscefalo@gmail.com>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, carlos@strangeworlds.co.uk
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Oct 12, 2016 at 10:26:43AM -0600, Azael Avalos wrote:
> *ping*
> 
> 2016-08-28 11:00 GMT-06:00 Darren Hart <dvhart@infradead.org>:
> > On Thu, Aug 25, 2016 at 12:50:55PM -0600, Azael Avalos wrote:
> >> Bug 150611 uncovered that the WMI ID used by the toshiba-wmi driver
> >> is not Toshiba specific, and as such, the driver was being loaded
> >> on non Toshiba laptops too.
> >>
> >> This patch adds a DMI matching list checking for TOSHIBA as the
> >> vendor, refusing to load if it is not.
> >>
> >> Also the WMI GUID was renamed, dropping the TOSHIBA_ prefix, to
> >> better reflect that such GUID is not a Toshiba specific one.
> >>
> >> Cc: <stable@vger.kernel.org> # 4.4+
> >> Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
> >> ---
> >> Hi Darren,
> >>
> >> I was waiting on input from the bug above, but haven't received an
> >> answer (as of yet), so I decided to send this to the mailing list
> >> for feedback as to whether this is the correct approach for this
> >> issue.
> >
> > Thanks. Let's see if Carlos (wmi.c author) has an opinion...
> >
> > Carlos?
> 
> Any input on this?

Looks like a sane workaround to me. Queued to fixes.

Want to going to stable?
-- 
Darren Hart
Intel Open Source Technology Center
